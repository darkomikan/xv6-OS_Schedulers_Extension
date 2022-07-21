#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "riscv.h"
#include "spinlock.h"
#include "proc.h"
#include "defs.h"

int algid = 0;
int alg_changing = 0;
int sjf_coefficient = -1;
int sjf_preemptive = -1;
int procnum = 0;
struct proc *tree_head = 0;
struct spinlock mutex;
int affinity_enabled = 0;   // advanced

struct cpu cpus[NCPU];

struct proc proc[NPROC];

struct proc *initproc;

int nextpid = 1;
struct spinlock pid_lock;

extern void forkret(void);
static void freeproc(struct proc *p);

extern char trampoline[]; // trampoline.S

// helps ensure that wakeups of wait()ing
// parents are not lost. helps obey the
// memory model when using p->parent.
// must be acquired before any p->lock.
struct spinlock wait_lock;

// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl) {
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    char *pa = kalloc();
    if(pa == 0)
      panic("kalloc");
    uint64 va = KSTACK((int) (p - proc));
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
  }
}

// initialize the proc table at boot time.
void
procinit(void)
{
  struct proc *p;

    initlock(&mutex, "mutex");
  initlock(&pid_lock, "nextpid");
  initlock(&wait_lock, "wait_lock");
  for(p = proc; p < &proc[NPROC]; p++) {
      initlock(&p->lock, "proc");
      p->kstack = KSTACK((int) (p - proc));
  }
}

// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
  int id = r_tp();
  return id;
}

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void) {
  int id = cpuid();
  struct cpu *c = &cpus[id];
  return c;
}

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void) {
  push_off();
  struct cpu *c = mycpu();
  struct proc *p = c->proc;
  pop_off();
  return p;
}

int
allocpid() {
  int pid;
  
  acquire(&pid_lock);
  pid = nextpid;
  nextpid = nextpid + 1;
  release(&pid_lock);

  return pid;
}

// Look in the process table for an UNUSED proc.
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    acquire(&p->lock);
    if(p->state == UNUSED) {
      goto found;
    } else {
      release(&p->lock);
    }
  }
  return 0;

found:
    procnum++;
  p->pid = allocpid();
  p->state = USED;
  p->t = 1;
  p->preempted = 0;
  p->affinity = -1;
  if (algid != 2)
  {
      p->tau = 1;
      p->quantum = 0;
  }
  else
  {
      p->tau = 0;
      p->quantum = 1;
  }
  p->left = 0;
  p->right = 0;
  p->next = 0;

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    freeproc(p);
    release(&p->lock);
    return 0;
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
  if(p->pagetable == 0){
    freeproc(p);
    release(&p->lock);
    return 0;
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
  p->context.ra = (uint64)forkret;
  p->context.sp = p->kstack + PGSIZE;

  return p;
}

// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
  if(p->trapframe)
    kfree((void*)p->trapframe);
  p->trapframe = 0;
  if(p->pagetable)
    proc_freepagetable(p->pagetable, p->sz);
  p->pagetable = 0;
  p->sz = 0;
  p->pid = 0;
  p->parent = 0;
  p->name[0] = 0;
  p->chan = 0;
  p->killed = 0;
  p->xstate = 0;
  p->state = UNUSED;

  p->tau = 1;
  p->t = 1;
  p->left = 0;
  p->right = 0;
  p->next = 0;
  procnum--;
}

// Create a user page table for a given process,
// with no user memory, but with trampoline pages.
pagetable_t
proc_pagetable(struct proc *p)
{
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
  if(pagetable == 0)
    return 0;

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    return 0;
  }

  // map the trapframe just below TRAMPOLINE, for trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    uvmfree(pagetable, 0);
    return 0;
  }

  return pagetable;
}

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
  uvmfree(pagetable, sz);
}

// a user program that calls exec("/init")
// od -t xC initcode
uchar initcode[] = {
  0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x45, 0x02,
  0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x35, 0x02,
  0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
  0x93, 0x08, 0x20, 0x00, 0x73, 0x00, 0x00, 0x00,
  0xef, 0xf0, 0x9f, 0xff, 0x2f, 0x69, 0x6e, 0x69,
  0x74, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00
};

// Set up first user process.
void
userinit(void)
{
  struct proc *p;

  p = allocproc();
  initproc = p;
  
  // allocate one user page and copy init's instructions
  // and data into it.
  uvminit(p->pagetable, initcode, sizeof(initcode));
  p->sz = PGSIZE;

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
  p->trapframe->sp = PGSIZE;  // user stack pointer

  safestrcpy(p->name, "initcode", sizeof(p->name));
  p->cwd = namei("/");

  int preempt = put(p);

  release(&p->lock);
  if (preempt)
      yield();
}

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
  uint sz;
  struct proc *p = myproc();

  sz = p->sz;
  if(n > 0){
    if((sz = uvmalloc(p->pagetable, sz, sz + n)) == 0) {
      return -1;
    }
  } else if(n < 0){
    sz = uvmdealloc(p->pagetable, sz, sz + n);
  }
  p->sz = sz;
  return 0;
}

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    freeproc(np);
    release(&np->lock);
    return -1;
  }
  np->sz = p->sz;

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    if(p->ofile[i])
      np->ofile[i] = filedup(p->ofile[i]);
  np->cwd = idup(p->cwd);

  safestrcpy(np->name, p->name, sizeof(p->name));

  pid = np->pid;

  np->t = p->t;
  np->tau = p->tau;
  release(&np->lock);

  acquire(&wait_lock);
  np->parent = p;
  release(&wait_lock);

  acquire(&np->lock);
  int preempt = put(np); // where is preempt checked?
  release(&np->lock);
  if (preempt)
      yield();  // here?

  return pid;
}

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    if(pp->parent == p){
      pp->parent = initproc;
      wakeup(initproc);
    }
  }
}

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
  struct proc *p = myproc();

  if(p == initproc)
    panic("init exiting");

  acquire(&p->lock);
  p->preempted = -1;    // can't be preempted, process wants to exit
  release(&p->lock);

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    if(p->ofile[fd]){
      struct file *f = p->ofile[fd];
      fileclose(f);
      p->ofile[fd] = 0;
    }
  }

  begin_op();
  iput(p->cwd);
  end_op();
  p->cwd = 0;

  acquire(&wait_lock);

  // Give any children to init.
  reparent(p);

  // Parent might be sleeping in wait().
  wakeup(p->parent);
  
  acquire(&p->lock);

  p->xstate = status;
  p->state = ZOMBIE;
  p->left = 0;
  p->right = 0;
  p->next = 0;

  release(&wait_lock);
  // Jump into the scheduler, never to return.
  sched();
  panic("zombie exit");
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
  struct proc *np;
  int havekids, pid;
  struct proc *p = myproc();

  acquire(&wait_lock);

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(np = proc; np < &proc[NPROC]; np++){
      if(np->parent == p){
        // make sure the child isn't still in exit() or swtch().
        acquire(&np->lock);

        havekids = 1;
        if(np->state == ZOMBIE){
          // Found one.
          pid = np->pid;
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&np->xstate,
                                  sizeof(np->xstate)) < 0) {
            release(&np->lock);
            release(&wait_lock);
            return -1;
          }
          freeproc(np);
          release(&np->lock);
          release(&wait_lock);
          return pid;
        }
        release(&np->lock);
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || p->killed){
      release(&wait_lock);
      return -1;
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
  }
}

// holds p->lock
// returns 0 if there is no preemption, 1 otherwise
int put(struct proc *p)
{
    uint currticks;
    if (!alg_changing)
    {
        // need mutex, but ensure that no locks are hold before blocking
        release(&p->lock);
        push_off();
        struct cpu *mycp = mycpu();
        pop_off();
        if (tickslock.cpu == mycp) {
            release(&tickslock);
            acquire(&mutex);
            acquire(&tickslock);
            acquire(&p->lock);
            currticks = ticks;
        } else {
            if (sjf_preemptive == 1 || algid == 2) {
                acquire(&tickslock);
                currticks = ticks;
                release(&tickslock);
            }
            acquire(&mutex);
            acquire(&p->lock);
        }
        // acquired mutex properly
    }

    p->state = RUNNABLE;
    if (algid != 0) // default scheduler doesn't need binary tree searching
    {
        // if preemptive SJF is active, check if preemption will occur with newly came proc p
        if (sjf_preemptive == 1)
        {
            struct proc *t = myproc();
            if (t != 0 && t != p)
            {
                acquire(&t->lock);
                if (t->killed == 0 && t->preempted != -1)   // if running process wants to stop, dont preempt it
                {
                    // preempts only if running process' current t is smaller than its approximated tau,
                    // and if the new proc has smaller approx
                    if ((t->tau - ((int)currticks - (int)t->timestamp)) > p->tau)
                    {
                        t->tau -= (int)currticks - (int)t->timestamp;
                        t->preempted = 1;
                    }
                }
                release(&t->lock);
            }
        }

        // for CFS save timestamp when proc entered scheduler
        if (algid == 2)
            p->timestamp = currticks;

        // both SJF and CFS use the same binary tree structure, with the same parameter name "tau" but with different usage
        if (tree_head != 0)
            acquire(&tree_head->lock);
        struct proc *i = tree_head;  // tree iterator
        struct proc *prev = i;       // remember iterator parent
        while (i != 0)
        {
            if (p->tau > i->tau)
            {
                if (i->right != 0)
                    acquire(&i->right->lock);
                prev = i;
                i = i->right;
                release(&prev->lock);
            }
            else if (p->tau < i->tau)
            {
                if (i->left != 0)
                    acquire(&i->left->lock);
                prev = i;
                i = i->left;
                release(&prev->lock);
            }
            else
            {
                while (i->next != 0)
                {
                    release(&i->lock);
                    i = i->next;
                    acquire(&i->lock);
                }
                i->next = p;
                release(&i->lock);
                if (!alg_changing)
                    release(&mutex);

                // check if there was preemption before returning
                if (sjf_preemptive == 1)
                {
                    struct proc *t = myproc();
                    if (t != 0 && t != p)
                    {
                        acquire(&t->lock);
                        if (t->preempted == 1)
                        {
                            release(&t->lock);
                            return 1;
                        }
                        release(&t->lock);
                    }
                }
                return 0;
            }
        }
        if (prev != 0)
        {
            acquire(&prev->lock);
            if (p->tau > prev->tau)
                prev->right = p;
            else
                prev->left = p;
            release(&prev->lock);
        }
        else
            tree_head = p;

        // check if there was preemption before returning
        if (sjf_preemptive == 1)
        {
            release(&mutex);
            struct proc *t = myproc();
            if (t != 0 && t != p)
            {
                acquire(&t->lock);
                if (t->preempted == 1)
                {
                    release(&t->lock);
                    return 1;
                }
                release(&t->lock);
            }
            return 0;
        }
    }
    if (!alg_changing)
        release(&mutex);
    return 0;
}

// returns proc with acquired lock
// or 0 if none are available
struct proc* get()
{
    // we can safely acquire mutex without releasing any other spinlock here,
    // since get() is only called from scheduler()
    acquire(&mutex);
    int affinity_found = 0; // affinity_enabled must be 1
    struct proc *p_aff = 0; // affinity_enabled must be 1
    struct proc *p;
    switch (algid)
    {
        case 0: // default algorithm
        {
            for (p = proc; p < &proc[NPROC] && algid == 0; ++p)
            {
                acquire(&p->lock);
                if(p->state == RUNNABLE)
                {
                    release(&mutex);
                    return p;
                }
                release(&p->lock);
            }
            break;
        }
        case 1: case 2: // both SJF and CFS use the same binary tree structure
        {
            if (tree_head == 0)
                break;
            p = tree_head;
            struct proc *prev = p;
            acquire(&p->lock);
            if (affinity_enabled) // check affinity; advanced
            {
                push_off();
                if (p->affinity == cpuid())
                {
                    affinity_found = 1;
                    p_aff = p;
                }
                pop_off();
            }
            while (p->left != 0)
            {
                prev = p;
                p = p->left;
                release(&prev->lock);
                acquire(&p->lock);
                if (affinity_enabled) // check affinity; advanced
                {
                    push_off();
                    if (p->affinity == cpuid())
                    {
                        affinity_found = 1;
                        p_aff = p;
                    }
                    pop_off();
                }
            }
            if (p->pid != prev->pid)
            {
                acquire(&prev->lock);
                if (p->next != 0)
                {
                    acquire(&p->next->lock);
                    //p->next->left = p->left;
                    p->next->right = p->right;
                    prev->left = p->next;
                    release(&p->next->lock);
                    if (affinity_enabled && !affinity_found) // advanced
                    {
                        struct proc *t = p->next;
                        while (t != 0 && !affinity_found)
                        {
                            push_off();
                            if (t->affinity == cpuid())
                            {
                                affinity_found = 1;
                                p_aff = t;
                            }
                            pop_off();
                            t = t->next;
                        }
                        if (affinity_found && p_aff == p->next)
                        {
                            if (p_aff->next != 0)
                                prev->left = p_aff->next;
                            else if (p_aff->right != 0)
                                prev->left = p_aff->right;
                            else
                                prev->left = 0;
                        }
                    }
                }
                else if (p->right != 0)
                    prev->left = p->right;
                else
                    prev->left = 0;
                release(&prev->lock);
            }
            else
            {
                if (p->next != 0)
                {
                    acquire(&p->next->lock);
                    //p->next->left = p->left;
                    p->next->right = p->right;
                    tree_head = p->next;
                    release(&p->next->lock);
                    if (affinity_enabled && !affinity_found) // advanced
                    {
                        struct proc *t = p->next;
                        while (t != 0 && !affinity_found)
                        {
                            push_off();
                            if (t->affinity == cpuid())
                            {
                                affinity_found = 1;
                                p_aff = t;
                            }
                            pop_off();
                            t = t->next;
                        }
                        if (affinity_found && p_aff == p->next)
                        {
                            if (p_aff->next != 0)
                                tree_head = p_aff->next;
                            else if (p_aff->right != 0)
                                tree_head = p_aff->right;
                            else
                                tree_head = 0;
                        }
                    }
                }
                else
                    tree_head = p->right;
            }
            if (affinity_found)
            {
                p_aff->next = 0;
                p_aff->left = 0;
                p_aff->right = 0;
                release(&mutex);
                return p_aff;
            }
            p->next = 0;
            p->left = 0;
            p->right = 0;
            release(&mutex);
            return p;
        }
    }
    release(&mutex);
    return 0;
}

int setSchedAlg(int alg, int arg1, int arg2)
{
    if (alg < 0 || alg > 2)
        return -1;
    if (alg == 1 && (arg1 < 0 || arg1 > 100))
        return -1;
    if (alg == 1 && (arg2 < 0 || arg2 > 1))
        return -1;
    acquire(&mutex);
    // alg is changing: grant exclusive right for mutex
    alg_changing = 1;
    switch (algid)
    {
        case 0: // was default
        {
            if (alg == 1) // switch to SJF
            {
                algid = alg;
                sjf_coefficient = arg1;
                for (struct proc *p = proc; p < &proc[NPROC]; ++p)
                {
                    acquire(&p->lock);
                    if (p->state == RUNNABLE)
                        put(p);
                    release(&p->lock);
                }
                sjf_preemptive = arg2; // no preemption until every proc has settled in
            }
            else if (alg == 2) // switch to CFS
            {
                acquire(&tickslock);
                algid = alg;
                for (struct proc *p = proc; p < &proc[NPROC]; ++p)
                {
                    acquire(&p->lock);
                    p->tau = 0;
                    p->quantum = 1;
                    if (p->state == RUNNABLE)
                        put(p);
                    else
                        p->timestamp = ticks;
                    release(&p->lock);
                }
                release(&tickslock);
            }
            break;
        }
        case 1: // was SJF
        {
            if (alg != 1)
            {
                // first, clear the proc binary tree
                for (struct proc *p = proc; p < &proc[NPROC]; ++p)
                {
                    acquire(&p->lock);
                    p->tau = 1;
                    p->quantum = 0;
                    p->next = 0;
                    p->right = 0;
                    p->left = 0;
                    release(&p->lock);
                }
                tree_head = 0;
                sjf_preemptive = -1;
                sjf_coefficient = -1;
                if (alg == 2) // switch to CFS
                {
                    acquire(&tickslock);
                    algid = alg;
                    for (struct proc *p = proc; p < &proc[NPROC]; ++p)
                    {
                        acquire(&p->lock);
                        p->tau = 0;
                        p->quantum = 1;
                        if (p->state == RUNNABLE)
                            put(p);
                        else
                            p->timestamp = ticks;
                        release(&p->lock);
                    }
                    release(&tickslock);
                }
            }
            else
            {
                sjf_coefficient = arg1;
                sjf_preemptive = arg2;
            }
            break;
        }
        case 2: // was CFS
        {
            if (alg != 2)
            {
                // first, clear the proc binary tree
                for (struct proc *p = proc; p < &proc[NPROC]; ++p)
                {
                    acquire(&p->lock);
                    p->tau = 1;
                    p->quantum = 0;
                    p->next = 0;
                    p->right = 0;
                    p->left = 0;
                    release(&p->lock);
                }
                tree_head = 0;
                if (alg == 1) // switch to SJF
                {
                    algid = alg;
                    sjf_coefficient = arg1;
                    for (struct proc *p = proc; p < &proc[NPROC]; ++p)
                    {
                        acquire(&p->lock);
                        if (p->state == RUNNABLE)
                            put(p);
                        release(&p->lock);
                    }
                    sjf_preemptive = arg2; // no preemption until every proc has settled in
                }
            }
            break;
        }
    }
    alg_changing = 0;
    release(&mutex);
    return 0;
}

// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run.
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
  struct proc *p;
  struct cpu *c = mycpu();
  uint currticks;
  
  c->proc = 0;
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();

    p = get();
    if (p != 0)
    {
        if (algid != 0)
        {
            acquire(&tickslock);
            currticks = ticks;
            release(&tickslock);
            if (algid == 2) // set maximum execution time for the process, if CFS is active alg
            {
                p->quantum = ((int)currticks - (int)p->timestamp) / procnum
                           + (((int)currticks - (int)p->timestamp) % procnum >= procnum / 2?1:0);
                if (p->quantum == 0)
                    p->quantum = 1;
            }
            p->timestamp = currticks;
        }

        if (affinity_enabled) // advanced
            p->affinity = cpuid();

        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
        c->proc = p;
        swtch(&c->context, &p->context);

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
        release(&p->lock);
    }
  }
}

// Switch to scheduler.  Must hold only p->lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    uint formula;  // for SJF approx
  int intena;
  struct proc *p = myproc();

  if(!holding(&p->lock))
    panic("sched p->lock");
  if(mycpu()->noff != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(intr_get())
    panic("sched interruptible");

  if (algid == 1 && p->preempted != 1)
  {
      acquire(&tickslock);
      p->t = ticks - p->timestamp;
      release(&tickslock);
      formula = sjf_coefficient * p->t + (100 - sjf_coefficient) * p->tau;
      p->tau =  formula / 100 + (formula%100>=50?1:0);
  }
  else if (p->preempted == 1)
      p->preempted = 0;

  intena = mycpu()->intena;
  swtch(&p->context, &mycpu()->context);
  mycpu()->intena = intena;
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
  struct proc *p = myproc();
  acquire(&p->lock);
  put(p);
  sched();
  release(&p->lock);
}

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);

  if (first) {
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    fsinit(ROOTDEV);
  }

  usertrapret();
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  // Must acquire p->lock in order to
  // change p->state and then call sched.
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
  release(lk);

  // Go to sleep.
  p->chan = chan;
  p->state = SLEEPING;

  if (algid == 2 && alg_changing == 0)
  {
      /*uint currticks = ticks;
      if (currticks != p->timestamp)
        p->tau += (int) currticks - (int) p->timestamp;
      else  // if the proc ran for less than a tick, add one tick to its exec time anyway...
        p->tau++;*/
      p->tau = 0;
  }

  sched();

  // Tidy up.
  p->chan = 0;

  // Reacquire original lock.
  release(&p->lock);
  acquire(lk);
}

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    if(p != myproc()){
      acquire(&p->lock);
      int preempt = 0;
      if(p->state == SLEEPING && p->chan == chan) {
        preempt = put(p);
      }
      release(&p->lock);
      if (preempt)
      {
          push_off();
          struct cpu * mycp = mycpu();
          pop_off();
          if (tickslock.cpu == mycp)
          {
              release(&tickslock);
              yield();
              acquire(&tickslock);
          }
          else
              yield();
      }
    }
  }
}

// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    acquire(&p->lock);
    if(p->pid == pid){
      p->killed = 1;
      if(p->state == SLEEPING){
        // Wake process from sleep().
        put(p);
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
  }
  return -1;
}

// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
  struct proc *p = myproc();
  if(user_dst){
    return copyout(p->pagetable, dst, src, len);
  } else {
    memmove((char *)dst, src, len);
    return 0;
  }
}

// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
  struct proc *p = myproc();
  if(user_src){
    return copyin(p->pagetable, dst, src, len);
  } else {
    memmove(dst, (char*)src, len);
    return 0;
  }
}

// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
  static char *states[] = {
  [UNUSED]    "unused",
  [SLEEPING]  "sleep ",
  [RUNNABLE]  "runble",
  [RUNNING]   "run   ",
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
  for(p = proc; p < &proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";
    printf("%d %s %s", p->pid, state, p->name);
    printf("\n");
  }
}
