
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	8a013103          	ld	sp,-1888(sp) # 8000c8a0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	6505                	lui	a0,0x1
    8000000a:	f14025f3          	csrr	a1,mhartid
    8000000e:	0585                	addi	a1,a1,1
    80000010:	02b50533          	mul	a0,a0,a1
    80000014:	912a                	add	sp,sp,a0
    80000016:	1a4000ef          	jal	ra,800001ba <start>

000000008000001a <spin>:
    8000001a:	a001                	j	8000001a <spin>

000000008000001c <r_mhartid>:
// which hart (core) is this?
static inline uint64
r_mhartid()
{
    8000001c:	1101                	addi	sp,sp,-32
    8000001e:	ec22                	sd	s0,24(sp)
    80000020:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mhartid" : "=r" (x) );
    80000022:	f14027f3          	csrr	a5,mhartid
    80000026:	fef43423          	sd	a5,-24(s0)
  return x;
    8000002a:	fe843783          	ld	a5,-24(s0)
}
    8000002e:	853e                	mv	a0,a5
    80000030:	6462                	ld	s0,24(sp)
    80000032:	6105                	addi	sp,sp,32
    80000034:	8082                	ret

0000000080000036 <r_mstatus>:
#define MSTATUS_MPP_U (0L << 11)
#define MSTATUS_MIE (1L << 3)    // machine-mode interrupt enable.

static inline uint64
r_mstatus()
{
    80000036:	1101                	addi	sp,sp,-32
    80000038:	ec22                	sd	s0,24(sp)
    8000003a:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mstatus" : "=r" (x) );
    8000003c:	300027f3          	csrr	a5,mstatus
    80000040:	fef43423          	sd	a5,-24(s0)
  return x;
    80000044:	fe843783          	ld	a5,-24(s0)
}
    80000048:	853e                	mv	a0,a5
    8000004a:	6462                	ld	s0,24(sp)
    8000004c:	6105                	addi	sp,sp,32
    8000004e:	8082                	ret

0000000080000050 <w_mstatus>:

static inline void 
w_mstatus(uint64 x)
{
    80000050:	1101                	addi	sp,sp,-32
    80000052:	ec22                	sd	s0,24(sp)
    80000054:	1000                	addi	s0,sp,32
    80000056:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mstatus, %0" : : "r" (x));
    8000005a:	fe843783          	ld	a5,-24(s0)
    8000005e:	30079073          	csrw	mstatus,a5
}
    80000062:	0001                	nop
    80000064:	6462                	ld	s0,24(sp)
    80000066:	6105                	addi	sp,sp,32
    80000068:	8082                	ret

000000008000006a <w_mepc>:
// machine exception program counter, holds the
// instruction address to which a return from
// exception will go.
static inline void 
w_mepc(uint64 x)
{
    8000006a:	1101                	addi	sp,sp,-32
    8000006c:	ec22                	sd	s0,24(sp)
    8000006e:	1000                	addi	s0,sp,32
    80000070:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mepc, %0" : : "r" (x));
    80000074:	fe843783          	ld	a5,-24(s0)
    80000078:	34179073          	csrw	mepc,a5
}
    8000007c:	0001                	nop
    8000007e:	6462                	ld	s0,24(sp)
    80000080:	6105                	addi	sp,sp,32
    80000082:	8082                	ret

0000000080000084 <r_sie>:
#define SIE_SEIE (1L << 9) // external
#define SIE_STIE (1L << 5) // timer
#define SIE_SSIE (1L << 1) // software
static inline uint64
r_sie()
{
    80000084:	1101                	addi	sp,sp,-32
    80000086:	ec22                	sd	s0,24(sp)
    80000088:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, sie" : "=r" (x) );
    8000008a:	104027f3          	csrr	a5,sie
    8000008e:	fef43423          	sd	a5,-24(s0)
  return x;
    80000092:	fe843783          	ld	a5,-24(s0)
}
    80000096:	853e                	mv	a0,a5
    80000098:	6462                	ld	s0,24(sp)
    8000009a:	6105                	addi	sp,sp,32
    8000009c:	8082                	ret

000000008000009e <w_sie>:

static inline void 
w_sie(uint64 x)
{
    8000009e:	1101                	addi	sp,sp,-32
    800000a0:	ec22                	sd	s0,24(sp)
    800000a2:	1000                	addi	s0,sp,32
    800000a4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sie, %0" : : "r" (x));
    800000a8:	fe843783          	ld	a5,-24(s0)
    800000ac:	10479073          	csrw	sie,a5
}
    800000b0:	0001                	nop
    800000b2:	6462                	ld	s0,24(sp)
    800000b4:	6105                	addi	sp,sp,32
    800000b6:	8082                	ret

00000000800000b8 <r_mie>:
#define MIE_MEIE (1L << 11) // external
#define MIE_MTIE (1L << 7)  // timer
#define MIE_MSIE (1L << 3)  // software
static inline uint64
r_mie()
{
    800000b8:	1101                	addi	sp,sp,-32
    800000ba:	ec22                	sd	s0,24(sp)
    800000bc:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mie" : "=r" (x) );
    800000be:	304027f3          	csrr	a5,mie
    800000c2:	fef43423          	sd	a5,-24(s0)
  return x;
    800000c6:	fe843783          	ld	a5,-24(s0)
}
    800000ca:	853e                	mv	a0,a5
    800000cc:	6462                	ld	s0,24(sp)
    800000ce:	6105                	addi	sp,sp,32
    800000d0:	8082                	ret

00000000800000d2 <w_mie>:

static inline void 
w_mie(uint64 x)
{
    800000d2:	1101                	addi	sp,sp,-32
    800000d4:	ec22                	sd	s0,24(sp)
    800000d6:	1000                	addi	s0,sp,32
    800000d8:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mie, %0" : : "r" (x));
    800000dc:	fe843783          	ld	a5,-24(s0)
    800000e0:	30479073          	csrw	mie,a5
}
    800000e4:	0001                	nop
    800000e6:	6462                	ld	s0,24(sp)
    800000e8:	6105                	addi	sp,sp,32
    800000ea:	8082                	ret

00000000800000ec <w_medeleg>:
  return x;
}

static inline void 
w_medeleg(uint64 x)
{
    800000ec:	1101                	addi	sp,sp,-32
    800000ee:	ec22                	sd	s0,24(sp)
    800000f0:	1000                	addi	s0,sp,32
    800000f2:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw medeleg, %0" : : "r" (x));
    800000f6:	fe843783          	ld	a5,-24(s0)
    800000fa:	30279073          	csrw	medeleg,a5
}
    800000fe:	0001                	nop
    80000100:	6462                	ld	s0,24(sp)
    80000102:	6105                	addi	sp,sp,32
    80000104:	8082                	ret

0000000080000106 <w_mideleg>:
  return x;
}

static inline void 
w_mideleg(uint64 x)
{
    80000106:	1101                	addi	sp,sp,-32
    80000108:	ec22                	sd	s0,24(sp)
    8000010a:	1000                	addi	s0,sp,32
    8000010c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mideleg, %0" : : "r" (x));
    80000110:	fe843783          	ld	a5,-24(s0)
    80000114:	30379073          	csrw	mideleg,a5
}
    80000118:	0001                	nop
    8000011a:	6462                	ld	s0,24(sp)
    8000011c:	6105                	addi	sp,sp,32
    8000011e:	8082                	ret

0000000080000120 <w_mtvec>:
}

// Machine-mode interrupt vector
static inline void 
w_mtvec(uint64 x)
{
    80000120:	1101                	addi	sp,sp,-32
    80000122:	ec22                	sd	s0,24(sp)
    80000124:	1000                	addi	s0,sp,32
    80000126:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mtvec, %0" : : "r" (x));
    8000012a:	fe843783          	ld	a5,-24(s0)
    8000012e:	30579073          	csrw	mtvec,a5
}
    80000132:	0001                	nop
    80000134:	6462                	ld	s0,24(sp)
    80000136:	6105                	addi	sp,sp,32
    80000138:	8082                	ret

000000008000013a <w_pmpcfg0>:

static inline void
w_pmpcfg0(uint64 x)
{
    8000013a:	1101                	addi	sp,sp,-32
    8000013c:	ec22                	sd	s0,24(sp)
    8000013e:	1000                	addi	s0,sp,32
    80000140:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpcfg0, %0" : : "r" (x));
    80000144:	fe843783          	ld	a5,-24(s0)
    80000148:	3a079073          	csrw	pmpcfg0,a5
}
    8000014c:	0001                	nop
    8000014e:	6462                	ld	s0,24(sp)
    80000150:	6105                	addi	sp,sp,32
    80000152:	8082                	ret

0000000080000154 <w_pmpaddr0>:

static inline void
w_pmpaddr0(uint64 x)
{
    80000154:	1101                	addi	sp,sp,-32
    80000156:	ec22                	sd	s0,24(sp)
    80000158:	1000                	addi	s0,sp,32
    8000015a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpaddr0, %0" : : "r" (x));
    8000015e:	fe843783          	ld	a5,-24(s0)
    80000162:	3b079073          	csrw	pmpaddr0,a5
}
    80000166:	0001                	nop
    80000168:	6462                	ld	s0,24(sp)
    8000016a:	6105                	addi	sp,sp,32
    8000016c:	8082                	ret

000000008000016e <w_satp>:

// supervisor address translation and protection;
// holds the address of the page table.
static inline void 
w_satp(uint64 x)
{
    8000016e:	1101                	addi	sp,sp,-32
    80000170:	ec22                	sd	s0,24(sp)
    80000172:	1000                	addi	s0,sp,32
    80000174:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80000178:	fe843783          	ld	a5,-24(s0)
    8000017c:	18079073          	csrw	satp,a5
}
    80000180:	0001                	nop
    80000182:	6462                	ld	s0,24(sp)
    80000184:	6105                	addi	sp,sp,32
    80000186:	8082                	ret

0000000080000188 <w_mscratch>:
  asm volatile("csrw sscratch, %0" : : "r" (x));
}

static inline void 
w_mscratch(uint64 x)
{
    80000188:	1101                	addi	sp,sp,-32
    8000018a:	ec22                	sd	s0,24(sp)
    8000018c:	1000                	addi	s0,sp,32
    8000018e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mscratch, %0" : : "r" (x));
    80000192:	fe843783          	ld	a5,-24(s0)
    80000196:	34079073          	csrw	mscratch,a5
}
    8000019a:	0001                	nop
    8000019c:	6462                	ld	s0,24(sp)
    8000019e:	6105                	addi	sp,sp,32
    800001a0:	8082                	ret

00000000800001a2 <w_tp>:
  return x;
}

static inline void 
w_tp(uint64 x)
{
    800001a2:	1101                	addi	sp,sp,-32
    800001a4:	ec22                	sd	s0,24(sp)
    800001a6:	1000                	addi	s0,sp,32
    800001a8:	fea43423          	sd	a0,-24(s0)
  asm volatile("mv tp, %0" : : "r" (x));
    800001ac:	fe843783          	ld	a5,-24(s0)
    800001b0:	823e                	mv	tp,a5
}
    800001b2:	0001                	nop
    800001b4:	6462                	ld	s0,24(sp)
    800001b6:	6105                	addi	sp,sp,32
    800001b8:	8082                	ret

00000000800001ba <start>:
extern void timervec();

// entry.S jumps here in machine mode on stack0.
void
start()
{
    800001ba:	1101                	addi	sp,sp,-32
    800001bc:	ec06                	sd	ra,24(sp)
    800001be:	e822                	sd	s0,16(sp)
    800001c0:	1000                	addi	s0,sp,32
  // set M Previous Privilege mode to Supervisor, for mret.
  unsigned long x = r_mstatus();
    800001c2:	00000097          	auipc	ra,0x0
    800001c6:	e74080e7          	jalr	-396(ra) # 80000036 <r_mstatus>
    800001ca:	fea43423          	sd	a0,-24(s0)
  x &= ~MSTATUS_MPP_MASK;
    800001ce:	fe843703          	ld	a4,-24(s0)
    800001d2:	77f9                	lui	a5,0xffffe
    800001d4:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ffd47ff>
    800001d8:	8ff9                	and	a5,a5,a4
    800001da:	fef43423          	sd	a5,-24(s0)
  x |= MSTATUS_MPP_S;
    800001de:	fe843703          	ld	a4,-24(s0)
    800001e2:	6785                	lui	a5,0x1
    800001e4:	80078793          	addi	a5,a5,-2048 # 800 <_entry-0x7ffff800>
    800001e8:	8fd9                	or	a5,a5,a4
    800001ea:	fef43423          	sd	a5,-24(s0)
  w_mstatus(x);
    800001ee:	fe843503          	ld	a0,-24(s0)
    800001f2:	00000097          	auipc	ra,0x0
    800001f6:	e5e080e7          	jalr	-418(ra) # 80000050 <w_mstatus>

  // set M Exception Program Counter to main, for mret.
  // requires gcc -mcmodel=medany
  w_mepc((uint64)main);
    800001fa:	00001797          	auipc	a5,0x1
    800001fe:	5fc78793          	addi	a5,a5,1532 # 800017f6 <main>
    80000202:	853e                	mv	a0,a5
    80000204:	00000097          	auipc	ra,0x0
    80000208:	e66080e7          	jalr	-410(ra) # 8000006a <w_mepc>

  // disable paging for now.
  w_satp(0);
    8000020c:	4501                	li	a0,0
    8000020e:	00000097          	auipc	ra,0x0
    80000212:	f60080e7          	jalr	-160(ra) # 8000016e <w_satp>

  // delegate all interrupts and exceptions to supervisor mode.
  w_medeleg(0xffff);
    80000216:	67c1                	lui	a5,0x10
    80000218:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000021c:	00000097          	auipc	ra,0x0
    80000220:	ed0080e7          	jalr	-304(ra) # 800000ec <w_medeleg>
  w_mideleg(0xffff);
    80000224:	67c1                	lui	a5,0x10
    80000226:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000022a:	00000097          	auipc	ra,0x0
    8000022e:	edc080e7          	jalr	-292(ra) # 80000106 <w_mideleg>
  w_sie(r_sie() | SIE_SEIE | SIE_STIE | SIE_SSIE);
    80000232:	00000097          	auipc	ra,0x0
    80000236:	e52080e7          	jalr	-430(ra) # 80000084 <r_sie>
    8000023a:	87aa                	mv	a5,a0
    8000023c:	2227e793          	ori	a5,a5,546
    80000240:	853e                	mv	a0,a5
    80000242:	00000097          	auipc	ra,0x0
    80000246:	e5c080e7          	jalr	-420(ra) # 8000009e <w_sie>

  // configure Physical Memory Protection to give supervisor mode
  // access to all of physical memory.
  w_pmpaddr0(0x3fffffffffffffull);
    8000024a:	57fd                	li	a5,-1
    8000024c:	00a7d513          	srli	a0,a5,0xa
    80000250:	00000097          	auipc	ra,0x0
    80000254:	f04080e7          	jalr	-252(ra) # 80000154 <w_pmpaddr0>
  w_pmpcfg0(0xf);
    80000258:	453d                	li	a0,15
    8000025a:	00000097          	auipc	ra,0x0
    8000025e:	ee0080e7          	jalr	-288(ra) # 8000013a <w_pmpcfg0>

  // ask for clock interrupts.
  timerinit();
    80000262:	00000097          	auipc	ra,0x0
    80000266:	032080e7          	jalr	50(ra) # 80000294 <timerinit>

  // keep each CPU's hartid in its tp register, for cpuid().
  int id = r_mhartid();
    8000026a:	00000097          	auipc	ra,0x0
    8000026e:	db2080e7          	jalr	-590(ra) # 8000001c <r_mhartid>
    80000272:	87aa                	mv	a5,a0
    80000274:	fef42223          	sw	a5,-28(s0)
  w_tp(id);
    80000278:	fe442783          	lw	a5,-28(s0)
    8000027c:	853e                	mv	a0,a5
    8000027e:	00000097          	auipc	ra,0x0
    80000282:	f24080e7          	jalr	-220(ra) # 800001a2 <w_tp>

  // switch to supervisor mode and jump to main().
  asm volatile("mret");
    80000286:	30200073          	mret
}
    8000028a:	0001                	nop
    8000028c:	60e2                	ld	ra,24(sp)
    8000028e:	6442                	ld	s0,16(sp)
    80000290:	6105                	addi	sp,sp,32
    80000292:	8082                	ret

0000000080000294 <timerinit>:
// which arrive at timervec in kernelvec.S,
// which turns them into software interrupts for
// devintr() in trap.c.
void
timerinit()
{
    80000294:	1101                	addi	sp,sp,-32
    80000296:	ec06                	sd	ra,24(sp)
    80000298:	e822                	sd	s0,16(sp)
    8000029a:	1000                	addi	s0,sp,32
  // each CPU has a separate source of timer interrupts.
  int id = r_mhartid();
    8000029c:	00000097          	auipc	ra,0x0
    800002a0:	d80080e7          	jalr	-640(ra) # 8000001c <r_mhartid>
    800002a4:	87aa                	mv	a5,a0
    800002a6:	fef42623          	sw	a5,-20(s0)

  // ask the CLINT for a timer interrupt.
  int interval = 1000000; // cycles; about 1/10th second in qemu.
    800002aa:	000f47b7          	lui	a5,0xf4
    800002ae:	2407879b          	addiw	a5,a5,576
    800002b2:	fef42423          	sw	a5,-24(s0)
  *(uint64*)CLINT_MTIMECMP(id) = *(uint64*)CLINT_MTIME + interval;
    800002b6:	0200c7b7          	lui	a5,0x200c
    800002ba:	17e1                	addi	a5,a5,-8
    800002bc:	6398                	ld	a4,0(a5)
    800002be:	fe842783          	lw	a5,-24(s0)
    800002c2:	fec42683          	lw	a3,-20(s0)
    800002c6:	0036969b          	slliw	a3,a3,0x3
    800002ca:	2681                	sext.w	a3,a3
    800002cc:	8636                	mv	a2,a3
    800002ce:	020046b7          	lui	a3,0x2004
    800002d2:	96b2                	add	a3,a3,a2
    800002d4:	97ba                	add	a5,a5,a4
    800002d6:	e29c                	sd	a5,0(a3)

  // prepare information in scratch[] for timervec.
  // scratch[0..2] : space for timervec to save registers.
  // scratch[3] : address of CLINT MTIMECMP register.
  // scratch[4] : desired interval (in cycles) between timer interrupts.
  uint64 *scratch = &timer_scratch[id][0];
    800002d8:	fec42703          	lw	a4,-20(s0)
    800002dc:	87ba                	mv	a5,a4
    800002de:	078a                	slli	a5,a5,0x2
    800002e0:	97ba                	add	a5,a5,a4
    800002e2:	078e                	slli	a5,a5,0x3
    800002e4:	00015717          	auipc	a4,0x15
    800002e8:	d6c70713          	addi	a4,a4,-660 # 80015050 <timer_scratch>
    800002ec:	97ba                	add	a5,a5,a4
    800002ee:	fef43023          	sd	a5,-32(s0)
  scratch[3] = CLINT_MTIMECMP(id);
    800002f2:	fec42783          	lw	a5,-20(s0)
    800002f6:	0037979b          	slliw	a5,a5,0x3
    800002fa:	2781                	sext.w	a5,a5
    800002fc:	873e                	mv	a4,a5
    800002fe:	020047b7          	lui	a5,0x2004
    80000302:	973e                	add	a4,a4,a5
    80000304:	fe043783          	ld	a5,-32(s0)
    80000308:	07e1                	addi	a5,a5,24
    8000030a:	e398                	sd	a4,0(a5)
  scratch[4] = interval;
    8000030c:	fe043783          	ld	a5,-32(s0)
    80000310:	02078793          	addi	a5,a5,32 # 2004020 <_entry-0x7dffbfe0>
    80000314:	fe842703          	lw	a4,-24(s0)
    80000318:	e398                	sd	a4,0(a5)
  w_mscratch((uint64)scratch);
    8000031a:	fe043783          	ld	a5,-32(s0)
    8000031e:	853e                	mv	a0,a5
    80000320:	00000097          	auipc	ra,0x0
    80000324:	e68080e7          	jalr	-408(ra) # 80000188 <w_mscratch>

  // set the machine-mode trap handler.
  w_mtvec((uint64)timervec);
    80000328:	0000a797          	auipc	a5,0xa
    8000032c:	a7878793          	addi	a5,a5,-1416 # 80009da0 <timervec>
    80000330:	853e                	mv	a0,a5
    80000332:	00000097          	auipc	ra,0x0
    80000336:	dee080e7          	jalr	-530(ra) # 80000120 <w_mtvec>

  // enable machine-mode interrupts.
  w_mstatus(r_mstatus() | MSTATUS_MIE);
    8000033a:	00000097          	auipc	ra,0x0
    8000033e:	cfc080e7          	jalr	-772(ra) # 80000036 <r_mstatus>
    80000342:	87aa                	mv	a5,a0
    80000344:	0087e793          	ori	a5,a5,8
    80000348:	853e                	mv	a0,a5
    8000034a:	00000097          	auipc	ra,0x0
    8000034e:	d06080e7          	jalr	-762(ra) # 80000050 <w_mstatus>

  // enable machine-mode timer interrupts.
  w_mie(r_mie() | MIE_MTIE);
    80000352:	00000097          	auipc	ra,0x0
    80000356:	d66080e7          	jalr	-666(ra) # 800000b8 <r_mie>
    8000035a:	87aa                	mv	a5,a0
    8000035c:	0807e793          	ori	a5,a5,128
    80000360:	853e                	mv	a0,a5
    80000362:	00000097          	auipc	ra,0x0
    80000366:	d70080e7          	jalr	-656(ra) # 800000d2 <w_mie>
}
    8000036a:	0001                	nop
    8000036c:	60e2                	ld	ra,24(sp)
    8000036e:	6442                	ld	s0,16(sp)
    80000370:	6105                	addi	sp,sp,32
    80000372:	8082                	ret

0000000080000374 <consputc>:
// called by printf, and to echo input characters,
// but not from write().
//
void
consputc(int c)
{
    80000374:	1101                	addi	sp,sp,-32
    80000376:	ec06                	sd	ra,24(sp)
    80000378:	e822                	sd	s0,16(sp)
    8000037a:	1000                	addi	s0,sp,32
    8000037c:	87aa                	mv	a5,a0
    8000037e:	fef42623          	sw	a5,-20(s0)
  if(c == BACKSPACE){
    80000382:	fec42783          	lw	a5,-20(s0)
    80000386:	0007871b          	sext.w	a4,a5
    8000038a:	10000793          	li	a5,256
    8000038e:	02f71363          	bne	a4,a5,800003b4 <consputc+0x40>
    // if the user typed backspace, overwrite with a space.
    uartputc_sync('\b'); uartputc_sync(' '); uartputc_sync('\b');
    80000392:	4521                	li	a0,8
    80000394:	00001097          	auipc	ra,0x1
    80000398:	aac080e7          	jalr	-1364(ra) # 80000e40 <uartputc_sync>
    8000039c:	02000513          	li	a0,32
    800003a0:	00001097          	auipc	ra,0x1
    800003a4:	aa0080e7          	jalr	-1376(ra) # 80000e40 <uartputc_sync>
    800003a8:	4521                	li	a0,8
    800003aa:	00001097          	auipc	ra,0x1
    800003ae:	a96080e7          	jalr	-1386(ra) # 80000e40 <uartputc_sync>
  } else {
    uartputc_sync(c);
  }
}
    800003b2:	a801                	j	800003c2 <consputc+0x4e>
    uartputc_sync(c);
    800003b4:	fec42783          	lw	a5,-20(s0)
    800003b8:	853e                	mv	a0,a5
    800003ba:	00001097          	auipc	ra,0x1
    800003be:	a86080e7          	jalr	-1402(ra) # 80000e40 <uartputc_sync>
}
    800003c2:	0001                	nop
    800003c4:	60e2                	ld	ra,24(sp)
    800003c6:	6442                	ld	s0,16(sp)
    800003c8:	6105                	addi	sp,sp,32
    800003ca:	8082                	ret

00000000800003cc <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    800003cc:	7179                	addi	sp,sp,-48
    800003ce:	f406                	sd	ra,40(sp)
    800003d0:	f022                	sd	s0,32(sp)
    800003d2:	1800                	addi	s0,sp,48
    800003d4:	87aa                	mv	a5,a0
    800003d6:	fcb43823          	sd	a1,-48(s0)
    800003da:	8732                	mv	a4,a2
    800003dc:	fcf42e23          	sw	a5,-36(s0)
    800003e0:	87ba                	mv	a5,a4
    800003e2:	fcf42c23          	sw	a5,-40(s0)
  int i;

  for(i = 0; i < n; i++){
    800003e6:	fe042623          	sw	zero,-20(s0)
    800003ea:	a0a1                	j	80000432 <consolewrite+0x66>
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    800003ec:	fec42703          	lw	a4,-20(s0)
    800003f0:	fd043783          	ld	a5,-48(s0)
    800003f4:	00f70633          	add	a2,a4,a5
    800003f8:	fdc42703          	lw	a4,-36(s0)
    800003fc:	feb40793          	addi	a5,s0,-21
    80000400:	4685                	li	a3,1
    80000402:	85ba                	mv	a1,a4
    80000404:	853e                	mv	a0,a5
    80000406:	00004097          	auipc	ra,0x4
    8000040a:	734080e7          	jalr	1844(ra) # 80004b3a <either_copyin>
    8000040e:	87aa                	mv	a5,a0
    80000410:	873e                	mv	a4,a5
    80000412:	57fd                	li	a5,-1
    80000414:	02f70863          	beq	a4,a5,80000444 <consolewrite+0x78>
      break;
    uartputc(c);
    80000418:	feb44783          	lbu	a5,-21(s0)
    8000041c:	2781                	sext.w	a5,a5
    8000041e:	853e                	mv	a0,a5
    80000420:	00001097          	auipc	ra,0x1
    80000424:	960080e7          	jalr	-1696(ra) # 80000d80 <uartputc>
  for(i = 0; i < n; i++){
    80000428:	fec42783          	lw	a5,-20(s0)
    8000042c:	2785                	addiw	a5,a5,1
    8000042e:	fef42623          	sw	a5,-20(s0)
    80000432:	fec42703          	lw	a4,-20(s0)
    80000436:	fd842783          	lw	a5,-40(s0)
    8000043a:	2701                	sext.w	a4,a4
    8000043c:	2781                	sext.w	a5,a5
    8000043e:	faf747e3          	blt	a4,a5,800003ec <consolewrite+0x20>
    80000442:	a011                	j	80000446 <consolewrite+0x7a>
      break;
    80000444:	0001                	nop
  }

  return i;
    80000446:	fec42783          	lw	a5,-20(s0)
}
    8000044a:	853e                	mv	a0,a5
    8000044c:	70a2                	ld	ra,40(sp)
    8000044e:	7402                	ld	s0,32(sp)
    80000450:	6145                	addi	sp,sp,48
    80000452:	8082                	ret

0000000080000454 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80000454:	7179                	addi	sp,sp,-48
    80000456:	f406                	sd	ra,40(sp)
    80000458:	f022                	sd	s0,32(sp)
    8000045a:	1800                	addi	s0,sp,48
    8000045c:	87aa                	mv	a5,a0
    8000045e:	fcb43823          	sd	a1,-48(s0)
    80000462:	8732                	mv	a4,a2
    80000464:	fcf42e23          	sw	a5,-36(s0)
    80000468:	87ba                	mv	a5,a4
    8000046a:	fcf42c23          	sw	a5,-40(s0)
  uint target;
  int c;
  char cbuf;

  target = n;
    8000046e:	fd842783          	lw	a5,-40(s0)
    80000472:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    80000476:	00015517          	auipc	a0,0x15
    8000047a:	d1a50513          	addi	a0,a0,-742 # 80015190 <cons>
    8000047e:	00001097          	auipc	ra,0x1
    80000482:	df0080e7          	jalr	-528(ra) # 8000126e <acquire>
  while(n > 0){
    80000486:	a215                	j	800005aa <consoleread+0x156>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
      if(myproc()->killed){
    80000488:	00002097          	auipc	ra,0x2
    8000048c:	3a4080e7          	jalr	932(ra) # 8000282c <myproc>
    80000490:	87aa                	mv	a5,a0
    80000492:	579c                	lw	a5,40(a5)
    80000494:	cb99                	beqz	a5,800004aa <consoleread+0x56>
        release(&cons.lock);
    80000496:	00015517          	auipc	a0,0x15
    8000049a:	cfa50513          	addi	a0,a0,-774 # 80015190 <cons>
    8000049e:	00001097          	auipc	ra,0x1
    800004a2:	e34080e7          	jalr	-460(ra) # 800012d2 <release>
        return -1;
    800004a6:	57fd                	li	a5,-1
    800004a8:	aa25                	j	800005e0 <consoleread+0x18c>
      }
      sleep(&cons.r, &cons.lock);
    800004aa:	00015597          	auipc	a1,0x15
    800004ae:	ce658593          	addi	a1,a1,-794 # 80015190 <cons>
    800004b2:	00015517          	auipc	a0,0x15
    800004b6:	d7650513          	addi	a0,a0,-650 # 80015228 <cons+0x98>
    800004ba:	00004097          	auipc	ra,0x4
    800004be:	3bc080e7          	jalr	956(ra) # 80004876 <sleep>
    while(cons.r == cons.w){
    800004c2:	00015797          	auipc	a5,0x15
    800004c6:	cce78793          	addi	a5,a5,-818 # 80015190 <cons>
    800004ca:	0987a703          	lw	a4,152(a5)
    800004ce:	00015797          	auipc	a5,0x15
    800004d2:	cc278793          	addi	a5,a5,-830 # 80015190 <cons>
    800004d6:	09c7a783          	lw	a5,156(a5)
    800004da:	faf707e3          	beq	a4,a5,80000488 <consoleread+0x34>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];
    800004de:	00015797          	auipc	a5,0x15
    800004e2:	cb278793          	addi	a5,a5,-846 # 80015190 <cons>
    800004e6:	0987a783          	lw	a5,152(a5)
    800004ea:	2781                	sext.w	a5,a5
    800004ec:	0017871b          	addiw	a4,a5,1
    800004f0:	0007069b          	sext.w	a3,a4
    800004f4:	00015717          	auipc	a4,0x15
    800004f8:	c9c70713          	addi	a4,a4,-868 # 80015190 <cons>
    800004fc:	08d72c23          	sw	a3,152(a4)
    80000500:	07f7f793          	andi	a5,a5,127
    80000504:	2781                	sext.w	a5,a5
    80000506:	00015717          	auipc	a4,0x15
    8000050a:	c8a70713          	addi	a4,a4,-886 # 80015190 <cons>
    8000050e:	1782                	slli	a5,a5,0x20
    80000510:	9381                	srli	a5,a5,0x20
    80000512:	97ba                	add	a5,a5,a4
    80000514:	0187c783          	lbu	a5,24(a5)
    80000518:	fef42423          	sw	a5,-24(s0)

    if(c == C('D')){  // end-of-file
    8000051c:	fe842783          	lw	a5,-24(s0)
    80000520:	0007871b          	sext.w	a4,a5
    80000524:	4791                	li	a5,4
    80000526:	02f71963          	bne	a4,a5,80000558 <consoleread+0x104>
      if(n < target){
    8000052a:	fd842703          	lw	a4,-40(s0)
    8000052e:	fec42783          	lw	a5,-20(s0)
    80000532:	2781                	sext.w	a5,a5
    80000534:	08f77163          	bgeu	a4,a5,800005b6 <consoleread+0x162>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        cons.r--;
    80000538:	00015797          	auipc	a5,0x15
    8000053c:	c5878793          	addi	a5,a5,-936 # 80015190 <cons>
    80000540:	0987a783          	lw	a5,152(a5)
    80000544:	37fd                	addiw	a5,a5,-1
    80000546:	0007871b          	sext.w	a4,a5
    8000054a:	00015797          	auipc	a5,0x15
    8000054e:	c4678793          	addi	a5,a5,-954 # 80015190 <cons>
    80000552:	08e7ac23          	sw	a4,152(a5)
      }
      break;
    80000556:	a085                	j	800005b6 <consoleread+0x162>
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    80000558:	fe842783          	lw	a5,-24(s0)
    8000055c:	0ff7f793          	andi	a5,a5,255
    80000560:	fef403a3          	sb	a5,-25(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80000564:	fe740713          	addi	a4,s0,-25
    80000568:	fdc42783          	lw	a5,-36(s0)
    8000056c:	4685                	li	a3,1
    8000056e:	863a                	mv	a2,a4
    80000570:	fd043583          	ld	a1,-48(s0)
    80000574:	853e                	mv	a0,a5
    80000576:	00004097          	auipc	ra,0x4
    8000057a:	550080e7          	jalr	1360(ra) # 80004ac6 <either_copyout>
    8000057e:	87aa                	mv	a5,a0
    80000580:	873e                	mv	a4,a5
    80000582:	57fd                	li	a5,-1
    80000584:	02f70b63          	beq	a4,a5,800005ba <consoleread+0x166>
      break;

    dst++;
    80000588:	fd043783          	ld	a5,-48(s0)
    8000058c:	0785                	addi	a5,a5,1
    8000058e:	fcf43823          	sd	a5,-48(s0)
    --n;
    80000592:	fd842783          	lw	a5,-40(s0)
    80000596:	37fd                	addiw	a5,a5,-1
    80000598:	fcf42c23          	sw	a5,-40(s0)

    if(c == '\n'){
    8000059c:	fe842783          	lw	a5,-24(s0)
    800005a0:	0007871b          	sext.w	a4,a5
    800005a4:	47a9                	li	a5,10
    800005a6:	00f70c63          	beq	a4,a5,800005be <consoleread+0x16a>
  while(n > 0){
    800005aa:	fd842783          	lw	a5,-40(s0)
    800005ae:	2781                	sext.w	a5,a5
    800005b0:	f0f049e3          	bgtz	a5,800004c2 <consoleread+0x6e>
    800005b4:	a031                	j	800005c0 <consoleread+0x16c>
      break;
    800005b6:	0001                	nop
    800005b8:	a021                	j	800005c0 <consoleread+0x16c>
      break;
    800005ba:	0001                	nop
    800005bc:	a011                	j	800005c0 <consoleread+0x16c>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    800005be:	0001                	nop
    }
  }
  release(&cons.lock);
    800005c0:	00015517          	auipc	a0,0x15
    800005c4:	bd050513          	addi	a0,a0,-1072 # 80015190 <cons>
    800005c8:	00001097          	auipc	ra,0x1
    800005cc:	d0a080e7          	jalr	-758(ra) # 800012d2 <release>

  return target - n;
    800005d0:	fd842783          	lw	a5,-40(s0)
    800005d4:	fec42703          	lw	a4,-20(s0)
    800005d8:	40f707bb          	subw	a5,a4,a5
    800005dc:	2781                	sext.w	a5,a5
    800005de:	2781                	sext.w	a5,a5
}
    800005e0:	853e                	mv	a0,a5
    800005e2:	70a2                	ld	ra,40(sp)
    800005e4:	7402                	ld	s0,32(sp)
    800005e6:	6145                	addi	sp,sp,48
    800005e8:	8082                	ret

00000000800005ea <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    800005ea:	1101                	addi	sp,sp,-32
    800005ec:	ec06                	sd	ra,24(sp)
    800005ee:	e822                	sd	s0,16(sp)
    800005f0:	1000                	addi	s0,sp,32
    800005f2:	87aa                	mv	a5,a0
    800005f4:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    800005f8:	00015517          	auipc	a0,0x15
    800005fc:	b9850513          	addi	a0,a0,-1128 # 80015190 <cons>
    80000600:	00001097          	auipc	ra,0x1
    80000604:	c6e080e7          	jalr	-914(ra) # 8000126e <acquire>

  switch(c){
    80000608:	fec42783          	lw	a5,-20(s0)
    8000060c:	0007871b          	sext.w	a4,a5
    80000610:	07f00793          	li	a5,127
    80000614:	0cf70763          	beq	a4,a5,800006e2 <consoleintr+0xf8>
    80000618:	fec42783          	lw	a5,-20(s0)
    8000061c:	0007871b          	sext.w	a4,a5
    80000620:	07f00793          	li	a5,127
    80000624:	10e7c363          	blt	a5,a4,8000072a <consoleintr+0x140>
    80000628:	fec42783          	lw	a5,-20(s0)
    8000062c:	0007871b          	sext.w	a4,a5
    80000630:	47d5                	li	a5,21
    80000632:	06f70163          	beq	a4,a5,80000694 <consoleintr+0xaa>
    80000636:	fec42783          	lw	a5,-20(s0)
    8000063a:	0007871b          	sext.w	a4,a5
    8000063e:	47d5                	li	a5,21
    80000640:	0ee7c563          	blt	a5,a4,8000072a <consoleintr+0x140>
    80000644:	fec42783          	lw	a5,-20(s0)
    80000648:	0007871b          	sext.w	a4,a5
    8000064c:	47a1                	li	a5,8
    8000064e:	08f70a63          	beq	a4,a5,800006e2 <consoleintr+0xf8>
    80000652:	fec42783          	lw	a5,-20(s0)
    80000656:	0007871b          	sext.w	a4,a5
    8000065a:	47c1                	li	a5,16
    8000065c:	0cf71763          	bne	a4,a5,8000072a <consoleintr+0x140>
  case C('P'):  // Print process list.
    procdump();
    80000660:	00004097          	auipc	ra,0x4
    80000664:	54e080e7          	jalr	1358(ra) # 80004bae <procdump>
    break;
    80000668:	aac1                	j	80000838 <consoleintr+0x24e>
  case C('U'):  // Kill line.
    while(cons.e != cons.w &&
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
      cons.e--;
    8000066a:	00015797          	auipc	a5,0x15
    8000066e:	b2678793          	addi	a5,a5,-1242 # 80015190 <cons>
    80000672:	0a07a783          	lw	a5,160(a5)
    80000676:	37fd                	addiw	a5,a5,-1
    80000678:	0007871b          	sext.w	a4,a5
    8000067c:	00015797          	auipc	a5,0x15
    80000680:	b1478793          	addi	a5,a5,-1260 # 80015190 <cons>
    80000684:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000688:	10000513          	li	a0,256
    8000068c:	00000097          	auipc	ra,0x0
    80000690:	ce8080e7          	jalr	-792(ra) # 80000374 <consputc>
    while(cons.e != cons.w &&
    80000694:	00015797          	auipc	a5,0x15
    80000698:	afc78793          	addi	a5,a5,-1284 # 80015190 <cons>
    8000069c:	0a07a703          	lw	a4,160(a5)
    800006a0:	00015797          	auipc	a5,0x15
    800006a4:	af078793          	addi	a5,a5,-1296 # 80015190 <cons>
    800006a8:	09c7a783          	lw	a5,156(a5)
    800006ac:	18f70163          	beq	a4,a5,8000082e <consoleintr+0x244>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    800006b0:	00015797          	auipc	a5,0x15
    800006b4:	ae078793          	addi	a5,a5,-1312 # 80015190 <cons>
    800006b8:	0a07a783          	lw	a5,160(a5)
    800006bc:	37fd                	addiw	a5,a5,-1
    800006be:	2781                	sext.w	a5,a5
    800006c0:	07f7f793          	andi	a5,a5,127
    800006c4:	2781                	sext.w	a5,a5
    800006c6:	00015717          	auipc	a4,0x15
    800006ca:	aca70713          	addi	a4,a4,-1334 # 80015190 <cons>
    800006ce:	1782                	slli	a5,a5,0x20
    800006d0:	9381                	srli	a5,a5,0x20
    800006d2:	97ba                	add	a5,a5,a4
    800006d4:	0187c783          	lbu	a5,24(a5)
    while(cons.e != cons.w &&
    800006d8:	873e                	mv	a4,a5
    800006da:	47a9                	li	a5,10
    800006dc:	f8f717e3          	bne	a4,a5,8000066a <consoleintr+0x80>
    }
    break;
    800006e0:	a2b9                	j	8000082e <consoleintr+0x244>
  case C('H'): // Backspace
  case '\x7f':
    if(cons.e != cons.w){
    800006e2:	00015797          	auipc	a5,0x15
    800006e6:	aae78793          	addi	a5,a5,-1362 # 80015190 <cons>
    800006ea:	0a07a703          	lw	a4,160(a5)
    800006ee:	00015797          	auipc	a5,0x15
    800006f2:	aa278793          	addi	a5,a5,-1374 # 80015190 <cons>
    800006f6:	09c7a783          	lw	a5,156(a5)
    800006fa:	12f70c63          	beq	a4,a5,80000832 <consoleintr+0x248>
      cons.e--;
    800006fe:	00015797          	auipc	a5,0x15
    80000702:	a9278793          	addi	a5,a5,-1390 # 80015190 <cons>
    80000706:	0a07a783          	lw	a5,160(a5)
    8000070a:	37fd                	addiw	a5,a5,-1
    8000070c:	0007871b          	sext.w	a4,a5
    80000710:	00015797          	auipc	a5,0x15
    80000714:	a8078793          	addi	a5,a5,-1408 # 80015190 <cons>
    80000718:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    8000071c:	10000513          	li	a0,256
    80000720:	00000097          	auipc	ra,0x0
    80000724:	c54080e7          	jalr	-940(ra) # 80000374 <consputc>
    }
    break;
    80000728:	a229                	j	80000832 <consoleintr+0x248>
  default:
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    8000072a:	fec42783          	lw	a5,-20(s0)
    8000072e:	2781                	sext.w	a5,a5
    80000730:	10078363          	beqz	a5,80000836 <consoleintr+0x24c>
    80000734:	00015797          	auipc	a5,0x15
    80000738:	a5c78793          	addi	a5,a5,-1444 # 80015190 <cons>
    8000073c:	0a07a703          	lw	a4,160(a5)
    80000740:	00015797          	auipc	a5,0x15
    80000744:	a5078793          	addi	a5,a5,-1456 # 80015190 <cons>
    80000748:	0987a783          	lw	a5,152(a5)
    8000074c:	40f707bb          	subw	a5,a4,a5
    80000750:	2781                	sext.w	a5,a5
    80000752:	873e                	mv	a4,a5
    80000754:	07f00793          	li	a5,127
    80000758:	0ce7ef63          	bltu	a5,a4,80000836 <consoleintr+0x24c>
      c = (c == '\r') ? '\n' : c;
    8000075c:	fec42783          	lw	a5,-20(s0)
    80000760:	0007871b          	sext.w	a4,a5
    80000764:	47b5                	li	a5,13
    80000766:	00f70563          	beq	a4,a5,80000770 <consoleintr+0x186>
    8000076a:	fec42783          	lw	a5,-20(s0)
    8000076e:	a011                	j	80000772 <consoleintr+0x188>
    80000770:	47a9                	li	a5,10
    80000772:	fef42623          	sw	a5,-20(s0)

      // echo back to the user.
      consputc(c);
    80000776:	fec42783          	lw	a5,-20(s0)
    8000077a:	853e                	mv	a0,a5
    8000077c:	00000097          	auipc	ra,0x0
    80000780:	bf8080e7          	jalr	-1032(ra) # 80000374 <consputc>

      // store for consumption by consoleread().
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80000784:	00015797          	auipc	a5,0x15
    80000788:	a0c78793          	addi	a5,a5,-1524 # 80015190 <cons>
    8000078c:	0a07a783          	lw	a5,160(a5)
    80000790:	2781                	sext.w	a5,a5
    80000792:	0017871b          	addiw	a4,a5,1
    80000796:	0007069b          	sext.w	a3,a4
    8000079a:	00015717          	auipc	a4,0x15
    8000079e:	9f670713          	addi	a4,a4,-1546 # 80015190 <cons>
    800007a2:	0ad72023          	sw	a3,160(a4)
    800007a6:	07f7f793          	andi	a5,a5,127
    800007aa:	2781                	sext.w	a5,a5
    800007ac:	fec42703          	lw	a4,-20(s0)
    800007b0:	0ff77713          	andi	a4,a4,255
    800007b4:	00015697          	auipc	a3,0x15
    800007b8:	9dc68693          	addi	a3,a3,-1572 # 80015190 <cons>
    800007bc:	1782                	slli	a5,a5,0x20
    800007be:	9381                	srli	a5,a5,0x20
    800007c0:	97b6                	add	a5,a5,a3
    800007c2:	00e78c23          	sb	a4,24(a5)

      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    800007c6:	fec42783          	lw	a5,-20(s0)
    800007ca:	0007871b          	sext.w	a4,a5
    800007ce:	47a9                	li	a5,10
    800007d0:	02f70a63          	beq	a4,a5,80000804 <consoleintr+0x21a>
    800007d4:	fec42783          	lw	a5,-20(s0)
    800007d8:	0007871b          	sext.w	a4,a5
    800007dc:	4791                	li	a5,4
    800007de:	02f70363          	beq	a4,a5,80000804 <consoleintr+0x21a>
    800007e2:	00015797          	auipc	a5,0x15
    800007e6:	9ae78793          	addi	a5,a5,-1618 # 80015190 <cons>
    800007ea:	0a07a703          	lw	a4,160(a5)
    800007ee:	00015797          	auipc	a5,0x15
    800007f2:	9a278793          	addi	a5,a5,-1630 # 80015190 <cons>
    800007f6:	0987a783          	lw	a5,152(a5)
    800007fa:	0807879b          	addiw	a5,a5,128
    800007fe:	2781                	sext.w	a5,a5
    80000800:	02f71b63          	bne	a4,a5,80000836 <consoleintr+0x24c>
        // wake up consoleread() if a whole line (or end-of-file)
        // has arrived.
        cons.w = cons.e;
    80000804:	00015797          	auipc	a5,0x15
    80000808:	98c78793          	addi	a5,a5,-1652 # 80015190 <cons>
    8000080c:	0a07a703          	lw	a4,160(a5)
    80000810:	00015797          	auipc	a5,0x15
    80000814:	98078793          	addi	a5,a5,-1664 # 80015190 <cons>
    80000818:	08e7ae23          	sw	a4,156(a5)
        wakeup(&cons.r);
    8000081c:	00015517          	auipc	a0,0x15
    80000820:	a0c50513          	addi	a0,a0,-1524 # 80015228 <cons+0x98>
    80000824:	00004097          	auipc	ra,0x4
    80000828:	0f4080e7          	jalr	244(ra) # 80004918 <wakeup>
      }
    }
    break;
    8000082c:	a029                	j	80000836 <consoleintr+0x24c>
    break;
    8000082e:	0001                	nop
    80000830:	a021                	j	80000838 <consoleintr+0x24e>
    break;
    80000832:	0001                	nop
    80000834:	a011                	j	80000838 <consoleintr+0x24e>
    break;
    80000836:	0001                	nop
  }
  
  release(&cons.lock);
    80000838:	00015517          	auipc	a0,0x15
    8000083c:	95850513          	addi	a0,a0,-1704 # 80015190 <cons>
    80000840:	00001097          	auipc	ra,0x1
    80000844:	a92080e7          	jalr	-1390(ra) # 800012d2 <release>
}
    80000848:	0001                	nop
    8000084a:	60e2                	ld	ra,24(sp)
    8000084c:	6442                	ld	s0,16(sp)
    8000084e:	6105                	addi	sp,sp,32
    80000850:	8082                	ret

0000000080000852 <consoleinit>:

void
consoleinit(void)
{
    80000852:	1141                	addi	sp,sp,-16
    80000854:	e406                	sd	ra,8(sp)
    80000856:	e022                	sd	s0,0(sp)
    80000858:	0800                	addi	s0,sp,16
  initlock(&cons.lock, "cons");
    8000085a:	0000b597          	auipc	a1,0xb
    8000085e:	7a658593          	addi	a1,a1,1958 # 8000c000 <etext>
    80000862:	00015517          	auipc	a0,0x15
    80000866:	92e50513          	addi	a0,a0,-1746 # 80015190 <cons>
    8000086a:	00001097          	auipc	ra,0x1
    8000086e:	9d4080e7          	jalr	-1580(ra) # 8000123e <initlock>

  uartinit();
    80000872:	00000097          	auipc	ra,0x0
    80000876:	494080e7          	jalr	1172(ra) # 80000d06 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    8000087a:	00025797          	auipc	a5,0x25
    8000087e:	6ce78793          	addi	a5,a5,1742 # 80025f48 <devsw>
    80000882:	00000717          	auipc	a4,0x0
    80000886:	bd270713          	addi	a4,a4,-1070 # 80000454 <consoleread>
    8000088a:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    8000088c:	00025797          	auipc	a5,0x25
    80000890:	6bc78793          	addi	a5,a5,1724 # 80025f48 <devsw>
    80000894:	00000717          	auipc	a4,0x0
    80000898:	b3870713          	addi	a4,a4,-1224 # 800003cc <consolewrite>
    8000089c:	ef98                	sd	a4,24(a5)
}
    8000089e:	0001                	nop
    800008a0:	60a2                	ld	ra,8(sp)
    800008a2:	6402                	ld	s0,0(sp)
    800008a4:	0141                	addi	sp,sp,16
    800008a6:	8082                	ret

00000000800008a8 <printint>:

static char digits[] = "0123456789abcdef";

static void
printint(int xx, int base, int sign)
{
    800008a8:	7139                	addi	sp,sp,-64
    800008aa:	fc06                	sd	ra,56(sp)
    800008ac:	f822                	sd	s0,48(sp)
    800008ae:	0080                	addi	s0,sp,64
    800008b0:	87aa                	mv	a5,a0
    800008b2:	86ae                	mv	a3,a1
    800008b4:	8732                	mv	a4,a2
    800008b6:	fcf42623          	sw	a5,-52(s0)
    800008ba:	87b6                	mv	a5,a3
    800008bc:	fcf42423          	sw	a5,-56(s0)
    800008c0:	87ba                	mv	a5,a4
    800008c2:	fcf42223          	sw	a5,-60(s0)
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    800008c6:	fc442783          	lw	a5,-60(s0)
    800008ca:	2781                	sext.w	a5,a5
    800008cc:	c78d                	beqz	a5,800008f6 <printint+0x4e>
    800008ce:	fcc42783          	lw	a5,-52(s0)
    800008d2:	01f7d79b          	srliw	a5,a5,0x1f
    800008d6:	0ff7f793          	andi	a5,a5,255
    800008da:	fcf42223          	sw	a5,-60(s0)
    800008de:	fc442783          	lw	a5,-60(s0)
    800008e2:	2781                	sext.w	a5,a5
    800008e4:	cb89                	beqz	a5,800008f6 <printint+0x4e>
    x = -xx;
    800008e6:	fcc42783          	lw	a5,-52(s0)
    800008ea:	40f007bb          	negw	a5,a5
    800008ee:	2781                	sext.w	a5,a5
    800008f0:	fef42423          	sw	a5,-24(s0)
    800008f4:	a029                	j	800008fe <printint+0x56>
  else
    x = xx;
    800008f6:	fcc42783          	lw	a5,-52(s0)
    800008fa:	fef42423          	sw	a5,-24(s0)

  i = 0;
    800008fe:	fe042623          	sw	zero,-20(s0)
  do {
    buf[i++] = digits[x % base];
    80000902:	fc842783          	lw	a5,-56(s0)
    80000906:	fe842703          	lw	a4,-24(s0)
    8000090a:	02f777bb          	remuw	a5,a4,a5
    8000090e:	0007861b          	sext.w	a2,a5
    80000912:	fec42783          	lw	a5,-20(s0)
    80000916:	0017871b          	addiw	a4,a5,1
    8000091a:	fee42623          	sw	a4,-20(s0)
    8000091e:	0000c697          	auipc	a3,0xc
    80000922:	e4268693          	addi	a3,a3,-446 # 8000c760 <digits>
    80000926:	02061713          	slli	a4,a2,0x20
    8000092a:	9301                	srli	a4,a4,0x20
    8000092c:	9736                	add	a4,a4,a3
    8000092e:	00074703          	lbu	a4,0(a4)
    80000932:	ff040693          	addi	a3,s0,-16
    80000936:	97b6                	add	a5,a5,a3
    80000938:	fee78423          	sb	a4,-24(a5)
  } while((x /= base) != 0);
    8000093c:	fc842783          	lw	a5,-56(s0)
    80000940:	fe842703          	lw	a4,-24(s0)
    80000944:	02f757bb          	divuw	a5,a4,a5
    80000948:	fef42423          	sw	a5,-24(s0)
    8000094c:	fe842783          	lw	a5,-24(s0)
    80000950:	2781                	sext.w	a5,a5
    80000952:	fbc5                	bnez	a5,80000902 <printint+0x5a>

  if(sign)
    80000954:	fc442783          	lw	a5,-60(s0)
    80000958:	2781                	sext.w	a5,a5
    8000095a:	cf85                	beqz	a5,80000992 <printint+0xea>
    buf[i++] = '-';
    8000095c:	fec42783          	lw	a5,-20(s0)
    80000960:	0017871b          	addiw	a4,a5,1
    80000964:	fee42623          	sw	a4,-20(s0)
    80000968:	ff040713          	addi	a4,s0,-16
    8000096c:	97ba                	add	a5,a5,a4
    8000096e:	02d00713          	li	a4,45
    80000972:	fee78423          	sb	a4,-24(a5)

  while(--i >= 0)
    80000976:	a831                	j	80000992 <printint+0xea>
    consputc(buf[i]);
    80000978:	fec42783          	lw	a5,-20(s0)
    8000097c:	ff040713          	addi	a4,s0,-16
    80000980:	97ba                	add	a5,a5,a4
    80000982:	fe87c783          	lbu	a5,-24(a5)
    80000986:	2781                	sext.w	a5,a5
    80000988:	853e                	mv	a0,a5
    8000098a:	00000097          	auipc	ra,0x0
    8000098e:	9ea080e7          	jalr	-1558(ra) # 80000374 <consputc>
  while(--i >= 0)
    80000992:	fec42783          	lw	a5,-20(s0)
    80000996:	37fd                	addiw	a5,a5,-1
    80000998:	fef42623          	sw	a5,-20(s0)
    8000099c:	fec42783          	lw	a5,-20(s0)
    800009a0:	2781                	sext.w	a5,a5
    800009a2:	fc07dbe3          	bgez	a5,80000978 <printint+0xd0>
}
    800009a6:	0001                	nop
    800009a8:	0001                	nop
    800009aa:	70e2                	ld	ra,56(sp)
    800009ac:	7442                	ld	s0,48(sp)
    800009ae:	6121                	addi	sp,sp,64
    800009b0:	8082                	ret

00000000800009b2 <printptr>:

static void
printptr(uint64 x)
{
    800009b2:	7179                	addi	sp,sp,-48
    800009b4:	f406                	sd	ra,40(sp)
    800009b6:	f022                	sd	s0,32(sp)
    800009b8:	1800                	addi	s0,sp,48
    800009ba:	fca43c23          	sd	a0,-40(s0)
  int i;
  consputc('0');
    800009be:	03000513          	li	a0,48
    800009c2:	00000097          	auipc	ra,0x0
    800009c6:	9b2080e7          	jalr	-1614(ra) # 80000374 <consputc>
  consputc('x');
    800009ca:	07800513          	li	a0,120
    800009ce:	00000097          	auipc	ra,0x0
    800009d2:	9a6080e7          	jalr	-1626(ra) # 80000374 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009d6:	fe042623          	sw	zero,-20(s0)
    800009da:	a81d                	j	80000a10 <printptr+0x5e>
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    800009dc:	fd843783          	ld	a5,-40(s0)
    800009e0:	93f1                	srli	a5,a5,0x3c
    800009e2:	0000c717          	auipc	a4,0xc
    800009e6:	d7e70713          	addi	a4,a4,-642 # 8000c760 <digits>
    800009ea:	97ba                	add	a5,a5,a4
    800009ec:	0007c783          	lbu	a5,0(a5)
    800009f0:	2781                	sext.w	a5,a5
    800009f2:	853e                	mv	a0,a5
    800009f4:	00000097          	auipc	ra,0x0
    800009f8:	980080e7          	jalr	-1664(ra) # 80000374 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009fc:	fec42783          	lw	a5,-20(s0)
    80000a00:	2785                	addiw	a5,a5,1
    80000a02:	fef42623          	sw	a5,-20(s0)
    80000a06:	fd843783          	ld	a5,-40(s0)
    80000a0a:	0792                	slli	a5,a5,0x4
    80000a0c:	fcf43c23          	sd	a5,-40(s0)
    80000a10:	fec42783          	lw	a5,-20(s0)
    80000a14:	873e                	mv	a4,a5
    80000a16:	47bd                	li	a5,15
    80000a18:	fce7f2e3          	bgeu	a5,a4,800009dc <printptr+0x2a>
}
    80000a1c:	0001                	nop
    80000a1e:	0001                	nop
    80000a20:	70a2                	ld	ra,40(sp)
    80000a22:	7402                	ld	s0,32(sp)
    80000a24:	6145                	addi	sp,sp,48
    80000a26:	8082                	ret

0000000080000a28 <printf>:

// Print to the console. only understands %d, %x, %p, %s.
void
printf(char *fmt, ...)
{
    80000a28:	7119                	addi	sp,sp,-128
    80000a2a:	fc06                	sd	ra,56(sp)
    80000a2c:	f822                	sd	s0,48(sp)
    80000a2e:	0080                	addi	s0,sp,64
    80000a30:	fca43423          	sd	a0,-56(s0)
    80000a34:	e40c                	sd	a1,8(s0)
    80000a36:	e810                	sd	a2,16(s0)
    80000a38:	ec14                	sd	a3,24(s0)
    80000a3a:	f018                	sd	a4,32(s0)
    80000a3c:	f41c                	sd	a5,40(s0)
    80000a3e:	03043823          	sd	a6,48(s0)
    80000a42:	03143c23          	sd	a7,56(s0)
  va_list ap;
  int i, c, locking;
  char *s;

  locking = pr.locking;
    80000a46:	00014797          	auipc	a5,0x14
    80000a4a:	7f278793          	addi	a5,a5,2034 # 80015238 <pr>
    80000a4e:	4f9c                	lw	a5,24(a5)
    80000a50:	fcf42e23          	sw	a5,-36(s0)
  if(locking)
    80000a54:	fdc42783          	lw	a5,-36(s0)
    80000a58:	2781                	sext.w	a5,a5
    80000a5a:	cb89                	beqz	a5,80000a6c <printf+0x44>
    acquire(&pr.lock);
    80000a5c:	00014517          	auipc	a0,0x14
    80000a60:	7dc50513          	addi	a0,a0,2012 # 80015238 <pr>
    80000a64:	00001097          	auipc	ra,0x1
    80000a68:	80a080e7          	jalr	-2038(ra) # 8000126e <acquire>

  if (fmt == 0)
    80000a6c:	fc843783          	ld	a5,-56(s0)
    80000a70:	eb89                	bnez	a5,80000a82 <printf+0x5a>
    panic("null fmt");
    80000a72:	0000b517          	auipc	a0,0xb
    80000a76:	59650513          	addi	a0,a0,1430 # 8000c008 <etext+0x8>
    80000a7a:	00000097          	auipc	ra,0x0
    80000a7e:	204080e7          	jalr	516(ra) # 80000c7e <panic>

  va_start(ap, fmt);
    80000a82:	04040793          	addi	a5,s0,64
    80000a86:	fcf43023          	sd	a5,-64(s0)
    80000a8a:	fc043783          	ld	a5,-64(s0)
    80000a8e:	fc878793          	addi	a5,a5,-56
    80000a92:	fcf43823          	sd	a5,-48(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000a96:	fe042623          	sw	zero,-20(s0)
    80000a9a:	a24d                	j	80000c3c <printf+0x214>
    if(c != '%'){
    80000a9c:	fd842783          	lw	a5,-40(s0)
    80000aa0:	0007871b          	sext.w	a4,a5
    80000aa4:	02500793          	li	a5,37
    80000aa8:	00f70a63          	beq	a4,a5,80000abc <printf+0x94>
      consputc(c);
    80000aac:	fd842783          	lw	a5,-40(s0)
    80000ab0:	853e                	mv	a0,a5
    80000ab2:	00000097          	auipc	ra,0x0
    80000ab6:	8c2080e7          	jalr	-1854(ra) # 80000374 <consputc>
      continue;
    80000aba:	aaa5                	j	80000c32 <printf+0x20a>
    }
    c = fmt[++i] & 0xff;
    80000abc:	fec42783          	lw	a5,-20(s0)
    80000ac0:	2785                	addiw	a5,a5,1
    80000ac2:	fef42623          	sw	a5,-20(s0)
    80000ac6:	fec42783          	lw	a5,-20(s0)
    80000aca:	fc843703          	ld	a4,-56(s0)
    80000ace:	97ba                	add	a5,a5,a4
    80000ad0:	0007c783          	lbu	a5,0(a5)
    80000ad4:	fcf42c23          	sw	a5,-40(s0)
    if(c == 0)
    80000ad8:	fd842783          	lw	a5,-40(s0)
    80000adc:	2781                	sext.w	a5,a5
    80000ade:	16078e63          	beqz	a5,80000c5a <printf+0x232>
      break;
    switch(c){
    80000ae2:	fd842783          	lw	a5,-40(s0)
    80000ae6:	0007871b          	sext.w	a4,a5
    80000aea:	07800793          	li	a5,120
    80000aee:	08f70963          	beq	a4,a5,80000b80 <printf+0x158>
    80000af2:	fd842783          	lw	a5,-40(s0)
    80000af6:	0007871b          	sext.w	a4,a5
    80000afa:	07800793          	li	a5,120
    80000afe:	10e7cc63          	blt	a5,a4,80000c16 <printf+0x1ee>
    80000b02:	fd842783          	lw	a5,-40(s0)
    80000b06:	0007871b          	sext.w	a4,a5
    80000b0a:	07300793          	li	a5,115
    80000b0e:	0af70563          	beq	a4,a5,80000bb8 <printf+0x190>
    80000b12:	fd842783          	lw	a5,-40(s0)
    80000b16:	0007871b          	sext.w	a4,a5
    80000b1a:	07300793          	li	a5,115
    80000b1e:	0ee7cc63          	blt	a5,a4,80000c16 <printf+0x1ee>
    80000b22:	fd842783          	lw	a5,-40(s0)
    80000b26:	0007871b          	sext.w	a4,a5
    80000b2a:	07000793          	li	a5,112
    80000b2e:	06f70863          	beq	a4,a5,80000b9e <printf+0x176>
    80000b32:	fd842783          	lw	a5,-40(s0)
    80000b36:	0007871b          	sext.w	a4,a5
    80000b3a:	07000793          	li	a5,112
    80000b3e:	0ce7cc63          	blt	a5,a4,80000c16 <printf+0x1ee>
    80000b42:	fd842783          	lw	a5,-40(s0)
    80000b46:	0007871b          	sext.w	a4,a5
    80000b4a:	02500793          	li	a5,37
    80000b4e:	0af70d63          	beq	a4,a5,80000c08 <printf+0x1e0>
    80000b52:	fd842783          	lw	a5,-40(s0)
    80000b56:	0007871b          	sext.w	a4,a5
    80000b5a:	06400793          	li	a5,100
    80000b5e:	0af71c63          	bne	a4,a5,80000c16 <printf+0x1ee>
    case 'd':
      printint(va_arg(ap, int), 10, 1);
    80000b62:	fd043783          	ld	a5,-48(s0)
    80000b66:	00878713          	addi	a4,a5,8
    80000b6a:	fce43823          	sd	a4,-48(s0)
    80000b6e:	439c                	lw	a5,0(a5)
    80000b70:	4605                	li	a2,1
    80000b72:	45a9                	li	a1,10
    80000b74:	853e                	mv	a0,a5
    80000b76:	00000097          	auipc	ra,0x0
    80000b7a:	d32080e7          	jalr	-718(ra) # 800008a8 <printint>
      break;
    80000b7e:	a855                	j	80000c32 <printf+0x20a>
    case 'x':
      printint(va_arg(ap, int), 16, 1);
    80000b80:	fd043783          	ld	a5,-48(s0)
    80000b84:	00878713          	addi	a4,a5,8
    80000b88:	fce43823          	sd	a4,-48(s0)
    80000b8c:	439c                	lw	a5,0(a5)
    80000b8e:	4605                	li	a2,1
    80000b90:	45c1                	li	a1,16
    80000b92:	853e                	mv	a0,a5
    80000b94:	00000097          	auipc	ra,0x0
    80000b98:	d14080e7          	jalr	-748(ra) # 800008a8 <printint>
      break;
    80000b9c:	a859                	j	80000c32 <printf+0x20a>
    case 'p':
      printptr(va_arg(ap, uint64));
    80000b9e:	fd043783          	ld	a5,-48(s0)
    80000ba2:	00878713          	addi	a4,a5,8
    80000ba6:	fce43823          	sd	a4,-48(s0)
    80000baa:	639c                	ld	a5,0(a5)
    80000bac:	853e                	mv	a0,a5
    80000bae:	00000097          	auipc	ra,0x0
    80000bb2:	e04080e7          	jalr	-508(ra) # 800009b2 <printptr>
      break;
    80000bb6:	a8b5                	j	80000c32 <printf+0x20a>
    case 's':
      if((s = va_arg(ap, char*)) == 0)
    80000bb8:	fd043783          	ld	a5,-48(s0)
    80000bbc:	00878713          	addi	a4,a5,8
    80000bc0:	fce43823          	sd	a4,-48(s0)
    80000bc4:	639c                	ld	a5,0(a5)
    80000bc6:	fef43023          	sd	a5,-32(s0)
    80000bca:	fe043783          	ld	a5,-32(s0)
    80000bce:	e79d                	bnez	a5,80000bfc <printf+0x1d4>
        s = "(null)";
    80000bd0:	0000b797          	auipc	a5,0xb
    80000bd4:	44878793          	addi	a5,a5,1096 # 8000c018 <etext+0x18>
    80000bd8:	fef43023          	sd	a5,-32(s0)
      for(; *s; s++)
    80000bdc:	a005                	j	80000bfc <printf+0x1d4>
        consputc(*s);
    80000bde:	fe043783          	ld	a5,-32(s0)
    80000be2:	0007c783          	lbu	a5,0(a5)
    80000be6:	2781                	sext.w	a5,a5
    80000be8:	853e                	mv	a0,a5
    80000bea:	fffff097          	auipc	ra,0xfffff
    80000bee:	78a080e7          	jalr	1930(ra) # 80000374 <consputc>
      for(; *s; s++)
    80000bf2:	fe043783          	ld	a5,-32(s0)
    80000bf6:	0785                	addi	a5,a5,1
    80000bf8:	fef43023          	sd	a5,-32(s0)
    80000bfc:	fe043783          	ld	a5,-32(s0)
    80000c00:	0007c783          	lbu	a5,0(a5)
    80000c04:	ffe9                	bnez	a5,80000bde <printf+0x1b6>
      break;
    80000c06:	a035                	j	80000c32 <printf+0x20a>
    case '%':
      consputc('%');
    80000c08:	02500513          	li	a0,37
    80000c0c:	fffff097          	auipc	ra,0xfffff
    80000c10:	768080e7          	jalr	1896(ra) # 80000374 <consputc>
      break;
    80000c14:	a839                	j	80000c32 <printf+0x20a>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
    80000c16:	02500513          	li	a0,37
    80000c1a:	fffff097          	auipc	ra,0xfffff
    80000c1e:	75a080e7          	jalr	1882(ra) # 80000374 <consputc>
      consputc(c);
    80000c22:	fd842783          	lw	a5,-40(s0)
    80000c26:	853e                	mv	a0,a5
    80000c28:	fffff097          	auipc	ra,0xfffff
    80000c2c:	74c080e7          	jalr	1868(ra) # 80000374 <consputc>
      break;
    80000c30:	0001                	nop
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000c32:	fec42783          	lw	a5,-20(s0)
    80000c36:	2785                	addiw	a5,a5,1
    80000c38:	fef42623          	sw	a5,-20(s0)
    80000c3c:	fec42783          	lw	a5,-20(s0)
    80000c40:	fc843703          	ld	a4,-56(s0)
    80000c44:	97ba                	add	a5,a5,a4
    80000c46:	0007c783          	lbu	a5,0(a5)
    80000c4a:	fcf42c23          	sw	a5,-40(s0)
    80000c4e:	fd842783          	lw	a5,-40(s0)
    80000c52:	2781                	sext.w	a5,a5
    80000c54:	e40794e3          	bnez	a5,80000a9c <printf+0x74>
    80000c58:	a011                	j	80000c5c <printf+0x234>
      break;
    80000c5a:	0001                	nop
    }
  }

  if(locking)
    80000c5c:	fdc42783          	lw	a5,-36(s0)
    80000c60:	2781                	sext.w	a5,a5
    80000c62:	cb89                	beqz	a5,80000c74 <printf+0x24c>
    release(&pr.lock);
    80000c64:	00014517          	auipc	a0,0x14
    80000c68:	5d450513          	addi	a0,a0,1492 # 80015238 <pr>
    80000c6c:	00000097          	auipc	ra,0x0
    80000c70:	666080e7          	jalr	1638(ra) # 800012d2 <release>
}
    80000c74:	0001                	nop
    80000c76:	70e2                	ld	ra,56(sp)
    80000c78:	7442                	ld	s0,48(sp)
    80000c7a:	6109                	addi	sp,sp,128
    80000c7c:	8082                	ret

0000000080000c7e <panic>:

void
panic(char *s)
{
    80000c7e:	1101                	addi	sp,sp,-32
    80000c80:	ec06                	sd	ra,24(sp)
    80000c82:	e822                	sd	s0,16(sp)
    80000c84:	1000                	addi	s0,sp,32
    80000c86:	fea43423          	sd	a0,-24(s0)
  pr.locking = 0;
    80000c8a:	00014797          	auipc	a5,0x14
    80000c8e:	5ae78793          	addi	a5,a5,1454 # 80015238 <pr>
    80000c92:	0007ac23          	sw	zero,24(a5)
  printf("panic: ");
    80000c96:	0000b517          	auipc	a0,0xb
    80000c9a:	38a50513          	addi	a0,a0,906 # 8000c020 <etext+0x20>
    80000c9e:	00000097          	auipc	ra,0x0
    80000ca2:	d8a080e7          	jalr	-630(ra) # 80000a28 <printf>
  printf(s);
    80000ca6:	fe843503          	ld	a0,-24(s0)
    80000caa:	00000097          	auipc	ra,0x0
    80000cae:	d7e080e7          	jalr	-642(ra) # 80000a28 <printf>
  printf("\n");
    80000cb2:	0000b517          	auipc	a0,0xb
    80000cb6:	37650513          	addi	a0,a0,886 # 8000c028 <etext+0x28>
    80000cba:	00000097          	auipc	ra,0x0
    80000cbe:	d6e080e7          	jalr	-658(ra) # 80000a28 <printf>
  panicked = 1; // freeze uart output from other CPUs
    80000cc2:	0000c797          	auipc	a5,0xc
    80000cc6:	33e78793          	addi	a5,a5,830 # 8000d000 <panicked>
    80000cca:	4705                	li	a4,1
    80000ccc:	c398                	sw	a4,0(a5)
  for(;;)
    80000cce:	a001                	j	80000cce <panic+0x50>

0000000080000cd0 <printfinit>:
    ;
}

void
printfinit(void)
{
    80000cd0:	1141                	addi	sp,sp,-16
    80000cd2:	e406                	sd	ra,8(sp)
    80000cd4:	e022                	sd	s0,0(sp)
    80000cd6:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
    80000cd8:	0000b597          	auipc	a1,0xb
    80000cdc:	35858593          	addi	a1,a1,856 # 8000c030 <etext+0x30>
    80000ce0:	00014517          	auipc	a0,0x14
    80000ce4:	55850513          	addi	a0,a0,1368 # 80015238 <pr>
    80000ce8:	00000097          	auipc	ra,0x0
    80000cec:	556080e7          	jalr	1366(ra) # 8000123e <initlock>
  pr.locking = 1;
    80000cf0:	00014797          	auipc	a5,0x14
    80000cf4:	54878793          	addi	a5,a5,1352 # 80015238 <pr>
    80000cf8:	4705                	li	a4,1
    80000cfa:	cf98                	sw	a4,24(a5)
}
    80000cfc:	0001                	nop
    80000cfe:	60a2                	ld	ra,8(sp)
    80000d00:	6402                	ld	s0,0(sp)
    80000d02:	0141                	addi	sp,sp,16
    80000d04:	8082                	ret

0000000080000d06 <uartinit>:

void uartstart();

void
uartinit(void)
{
    80000d06:	1141                	addi	sp,sp,-16
    80000d08:	e406                	sd	ra,8(sp)
    80000d0a:	e022                	sd	s0,0(sp)
    80000d0c:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    80000d0e:	100007b7          	lui	a5,0x10000
    80000d12:	0785                	addi	a5,a5,1
    80000d14:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80000d18:	100007b7          	lui	a5,0x10000
    80000d1c:	078d                	addi	a5,a5,3
    80000d1e:	f8000713          	li	a4,-128
    80000d22:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    80000d26:	100007b7          	lui	a5,0x10000
    80000d2a:	470d                	li	a4,3
    80000d2c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80000d30:	100007b7          	lui	a5,0x10000
    80000d34:	0785                	addi	a5,a5,1
    80000d36:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    80000d3a:	100007b7          	lui	a5,0x10000
    80000d3e:	078d                	addi	a5,a5,3
    80000d40:	470d                	li	a4,3
    80000d42:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    80000d46:	100007b7          	lui	a5,0x10000
    80000d4a:	0789                	addi	a5,a5,2
    80000d4c:	471d                	li	a4,7
    80000d4e:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80000d52:	100007b7          	lui	a5,0x10000
    80000d56:	0785                	addi	a5,a5,1
    80000d58:	470d                	li	a4,3
    80000d5a:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  initlock(&uart_tx_lock, "uart");
    80000d5e:	0000b597          	auipc	a1,0xb
    80000d62:	2da58593          	addi	a1,a1,730 # 8000c038 <etext+0x38>
    80000d66:	00014517          	auipc	a0,0x14
    80000d6a:	4f250513          	addi	a0,a0,1266 # 80015258 <uart_tx_lock>
    80000d6e:	00000097          	auipc	ra,0x0
    80000d72:	4d0080e7          	jalr	1232(ra) # 8000123e <initlock>
}
    80000d76:	0001                	nop
    80000d78:	60a2                	ld	ra,8(sp)
    80000d7a:	6402                	ld	s0,0(sp)
    80000d7c:	0141                	addi	sp,sp,16
    80000d7e:	8082                	ret

0000000080000d80 <uartputc>:
// because it may block, it can't be called
// from interrupts; it's only suitable for use
// by write().
void
uartputc(int c)
{
    80000d80:	1101                	addi	sp,sp,-32
    80000d82:	ec06                	sd	ra,24(sp)
    80000d84:	e822                	sd	s0,16(sp)
    80000d86:	1000                	addi	s0,sp,32
    80000d88:	87aa                	mv	a5,a0
    80000d8a:	fef42623          	sw	a5,-20(s0)
  acquire(&uart_tx_lock);
    80000d8e:	00014517          	auipc	a0,0x14
    80000d92:	4ca50513          	addi	a0,a0,1226 # 80015258 <uart_tx_lock>
    80000d96:	00000097          	auipc	ra,0x0
    80000d9a:	4d8080e7          	jalr	1240(ra) # 8000126e <acquire>

  if(panicked){
    80000d9e:	0000c797          	auipc	a5,0xc
    80000da2:	26278793          	addi	a5,a5,610 # 8000d000 <panicked>
    80000da6:	439c                	lw	a5,0(a5)
    80000da8:	2781                	sext.w	a5,a5
    80000daa:	c391                	beqz	a5,80000dae <uartputc+0x2e>
    for(;;)
    80000dac:	a001                	j	80000dac <uartputc+0x2c>
      ;
  }

  while(1){
    if(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    80000dae:	0000c797          	auipc	a5,0xc
    80000db2:	26278793          	addi	a5,a5,610 # 8000d010 <uart_tx_r>
    80000db6:	639c                	ld	a5,0(a5)
    80000db8:	02078713          	addi	a4,a5,32
    80000dbc:	0000c797          	auipc	a5,0xc
    80000dc0:	24c78793          	addi	a5,a5,588 # 8000d008 <uart_tx_w>
    80000dc4:	639c                	ld	a5,0(a5)
    80000dc6:	00f71f63          	bne	a4,a5,80000de4 <uartputc+0x64>
      // buffer is full.
      // wait for uartstart() to open up space in the buffer.
      sleep(&uart_tx_r, &uart_tx_lock);
    80000dca:	00014597          	auipc	a1,0x14
    80000dce:	48e58593          	addi	a1,a1,1166 # 80015258 <uart_tx_lock>
    80000dd2:	0000c517          	auipc	a0,0xc
    80000dd6:	23e50513          	addi	a0,a0,574 # 8000d010 <uart_tx_r>
    80000dda:	00004097          	auipc	ra,0x4
    80000dde:	a9c080e7          	jalr	-1380(ra) # 80004876 <sleep>
    80000de2:	b7f1                	j	80000dae <uartputc+0x2e>
    } else {
      uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
    80000de4:	0000c797          	auipc	a5,0xc
    80000de8:	22478793          	addi	a5,a5,548 # 8000d008 <uart_tx_w>
    80000dec:	639c                	ld	a5,0(a5)
    80000dee:	8bfd                	andi	a5,a5,31
    80000df0:	fec42703          	lw	a4,-20(s0)
    80000df4:	0ff77713          	andi	a4,a4,255
    80000df8:	00014697          	auipc	a3,0x14
    80000dfc:	47868693          	addi	a3,a3,1144 # 80015270 <uart_tx_buf>
    80000e00:	97b6                	add	a5,a5,a3
    80000e02:	00e78023          	sb	a4,0(a5)
      uart_tx_w += 1;
    80000e06:	0000c797          	auipc	a5,0xc
    80000e0a:	20278793          	addi	a5,a5,514 # 8000d008 <uart_tx_w>
    80000e0e:	639c                	ld	a5,0(a5)
    80000e10:	00178713          	addi	a4,a5,1
    80000e14:	0000c797          	auipc	a5,0xc
    80000e18:	1f478793          	addi	a5,a5,500 # 8000d008 <uart_tx_w>
    80000e1c:	e398                	sd	a4,0(a5)
      uartstart();
    80000e1e:	00000097          	auipc	ra,0x0
    80000e22:	084080e7          	jalr	132(ra) # 80000ea2 <uartstart>
      release(&uart_tx_lock);
    80000e26:	00014517          	auipc	a0,0x14
    80000e2a:	43250513          	addi	a0,a0,1074 # 80015258 <uart_tx_lock>
    80000e2e:	00000097          	auipc	ra,0x0
    80000e32:	4a4080e7          	jalr	1188(ra) # 800012d2 <release>
      return;
    80000e36:	0001                	nop
    }
  }
}
    80000e38:	60e2                	ld	ra,24(sp)
    80000e3a:	6442                	ld	s0,16(sp)
    80000e3c:	6105                	addi	sp,sp,32
    80000e3e:	8082                	ret

0000000080000e40 <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    80000e40:	1101                	addi	sp,sp,-32
    80000e42:	ec06                	sd	ra,24(sp)
    80000e44:	e822                	sd	s0,16(sp)
    80000e46:	1000                	addi	s0,sp,32
    80000e48:	87aa                	mv	a5,a0
    80000e4a:	fef42623          	sw	a5,-20(s0)
  push_off();
    80000e4e:	00000097          	auipc	ra,0x0
    80000e52:	51e080e7          	jalr	1310(ra) # 8000136c <push_off>

  if(panicked){
    80000e56:	0000c797          	auipc	a5,0xc
    80000e5a:	1aa78793          	addi	a5,a5,426 # 8000d000 <panicked>
    80000e5e:	439c                	lw	a5,0(a5)
    80000e60:	2781                	sext.w	a5,a5
    80000e62:	c391                	beqz	a5,80000e66 <uartputc_sync+0x26>
    for(;;)
    80000e64:	a001                	j	80000e64 <uartputc_sync+0x24>
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80000e66:	0001                	nop
    80000e68:	100007b7          	lui	a5,0x10000
    80000e6c:	0795                	addi	a5,a5,5
    80000e6e:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000e72:	0ff7f793          	andi	a5,a5,255
    80000e76:	2781                	sext.w	a5,a5
    80000e78:	0207f793          	andi	a5,a5,32
    80000e7c:	2781                	sext.w	a5,a5
    80000e7e:	d7ed                	beqz	a5,80000e68 <uartputc_sync+0x28>
    ;
  WriteReg(THR, c);
    80000e80:	100007b7          	lui	a5,0x10000
    80000e84:	fec42703          	lw	a4,-20(s0)
    80000e88:	0ff77713          	andi	a4,a4,255
    80000e8c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  pop_off();
    80000e90:	00000097          	auipc	ra,0x0
    80000e94:	534080e7          	jalr	1332(ra) # 800013c4 <pop_off>
}
    80000e98:	0001                	nop
    80000e9a:	60e2                	ld	ra,24(sp)
    80000e9c:	6442                	ld	s0,16(sp)
    80000e9e:	6105                	addi	sp,sp,32
    80000ea0:	8082                	ret

0000000080000ea2 <uartstart>:
// in the transmit buffer, send it.
// caller must hold uart_tx_lock.
// called from both the top- and bottom-half.
void
uartstart()
{
    80000ea2:	1101                	addi	sp,sp,-32
    80000ea4:	ec06                	sd	ra,24(sp)
    80000ea6:	e822                	sd	s0,16(sp)
    80000ea8:	1000                	addi	s0,sp,32
  while(1){
    if(uart_tx_w == uart_tx_r){
    80000eaa:	0000c797          	auipc	a5,0xc
    80000eae:	15e78793          	addi	a5,a5,350 # 8000d008 <uart_tx_w>
    80000eb2:	6398                	ld	a4,0(a5)
    80000eb4:	0000c797          	auipc	a5,0xc
    80000eb8:	15c78793          	addi	a5,a5,348 # 8000d010 <uart_tx_r>
    80000ebc:	639c                	ld	a5,0(a5)
    80000ebe:	06f70a63          	beq	a4,a5,80000f32 <uartstart+0x90>
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80000ec2:	100007b7          	lui	a5,0x10000
    80000ec6:	0795                	addi	a5,a5,5
    80000ec8:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000ecc:	0ff7f793          	andi	a5,a5,255
    80000ed0:	2781                	sext.w	a5,a5
    80000ed2:	0207f793          	andi	a5,a5,32
    80000ed6:	2781                	sext.w	a5,a5
    80000ed8:	cfb9                	beqz	a5,80000f36 <uartstart+0x94>
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE];
    80000eda:	0000c797          	auipc	a5,0xc
    80000ede:	13678793          	addi	a5,a5,310 # 8000d010 <uart_tx_r>
    80000ee2:	639c                	ld	a5,0(a5)
    80000ee4:	8bfd                	andi	a5,a5,31
    80000ee6:	00014717          	auipc	a4,0x14
    80000eea:	38a70713          	addi	a4,a4,906 # 80015270 <uart_tx_buf>
    80000eee:	97ba                	add	a5,a5,a4
    80000ef0:	0007c783          	lbu	a5,0(a5)
    80000ef4:	fef42623          	sw	a5,-20(s0)
    uart_tx_r += 1;
    80000ef8:	0000c797          	auipc	a5,0xc
    80000efc:	11878793          	addi	a5,a5,280 # 8000d010 <uart_tx_r>
    80000f00:	639c                	ld	a5,0(a5)
    80000f02:	00178713          	addi	a4,a5,1
    80000f06:	0000c797          	auipc	a5,0xc
    80000f0a:	10a78793          	addi	a5,a5,266 # 8000d010 <uart_tx_r>
    80000f0e:	e398                	sd	a4,0(a5)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    80000f10:	0000c517          	auipc	a0,0xc
    80000f14:	10050513          	addi	a0,a0,256 # 8000d010 <uart_tx_r>
    80000f18:	00004097          	auipc	ra,0x4
    80000f1c:	a00080e7          	jalr	-1536(ra) # 80004918 <wakeup>
    
    WriteReg(THR, c);
    80000f20:	100007b7          	lui	a5,0x10000
    80000f24:	fec42703          	lw	a4,-20(s0)
    80000f28:	0ff77713          	andi	a4,a4,255
    80000f2c:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>
  while(1){
    80000f30:	bfad                	j	80000eaa <uartstart+0x8>
      return;
    80000f32:	0001                	nop
    80000f34:	a011                	j	80000f38 <uartstart+0x96>
      return;
    80000f36:	0001                	nop
  }
}
    80000f38:	60e2                	ld	ra,24(sp)
    80000f3a:	6442                	ld	s0,16(sp)
    80000f3c:	6105                	addi	sp,sp,32
    80000f3e:	8082                	ret

0000000080000f40 <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80000f40:	1141                	addi	sp,sp,-16
    80000f42:	e422                	sd	s0,8(sp)
    80000f44:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    80000f46:	100007b7          	lui	a5,0x10000
    80000f4a:	0795                	addi	a5,a5,5
    80000f4c:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f50:	0ff7f793          	andi	a5,a5,255
    80000f54:	2781                	sext.w	a5,a5
    80000f56:	8b85                	andi	a5,a5,1
    80000f58:	2781                	sext.w	a5,a5
    80000f5a:	cb89                	beqz	a5,80000f6c <uartgetc+0x2c>
    // input data is ready.
    return ReadReg(RHR);
    80000f5c:	100007b7          	lui	a5,0x10000
    80000f60:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f64:	0ff7f793          	andi	a5,a5,255
    80000f68:	2781                	sext.w	a5,a5
    80000f6a:	a011                	j	80000f6e <uartgetc+0x2e>
  } else {
    return -1;
    80000f6c:	57fd                	li	a5,-1
  }
}
    80000f6e:	853e                	mv	a0,a5
    80000f70:	6422                	ld	s0,8(sp)
    80000f72:	0141                	addi	sp,sp,16
    80000f74:	8082                	ret

0000000080000f76 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from trap.c.
void
uartintr(void)
{
    80000f76:	1101                	addi	sp,sp,-32
    80000f78:	ec06                	sd	ra,24(sp)
    80000f7a:	e822                	sd	s0,16(sp)
    80000f7c:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    80000f7e:	00000097          	auipc	ra,0x0
    80000f82:	fc2080e7          	jalr	-62(ra) # 80000f40 <uartgetc>
    80000f86:	87aa                	mv	a5,a0
    80000f88:	fef42623          	sw	a5,-20(s0)
    if(c == -1)
    80000f8c:	fec42783          	lw	a5,-20(s0)
    80000f90:	0007871b          	sext.w	a4,a5
    80000f94:	57fd                	li	a5,-1
    80000f96:	00f70a63          	beq	a4,a5,80000faa <uartintr+0x34>
      break;
    consoleintr(c);
    80000f9a:	fec42783          	lw	a5,-20(s0)
    80000f9e:	853e                	mv	a0,a5
    80000fa0:	fffff097          	auipc	ra,0xfffff
    80000fa4:	64a080e7          	jalr	1610(ra) # 800005ea <consoleintr>
  while(1){
    80000fa8:	bfd9                	j	80000f7e <uartintr+0x8>
      break;
    80000faa:	0001                	nop
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80000fac:	00014517          	auipc	a0,0x14
    80000fb0:	2ac50513          	addi	a0,a0,684 # 80015258 <uart_tx_lock>
    80000fb4:	00000097          	auipc	ra,0x0
    80000fb8:	2ba080e7          	jalr	698(ra) # 8000126e <acquire>
  uartstart();
    80000fbc:	00000097          	auipc	ra,0x0
    80000fc0:	ee6080e7          	jalr	-282(ra) # 80000ea2 <uartstart>
  release(&uart_tx_lock);
    80000fc4:	00014517          	auipc	a0,0x14
    80000fc8:	29450513          	addi	a0,a0,660 # 80015258 <uart_tx_lock>
    80000fcc:	00000097          	auipc	ra,0x0
    80000fd0:	306080e7          	jalr	774(ra) # 800012d2 <release>
}
    80000fd4:	0001                	nop
    80000fd6:	60e2                	ld	ra,24(sp)
    80000fd8:	6442                	ld	s0,16(sp)
    80000fda:	6105                	addi	sp,sp,32
    80000fdc:	8082                	ret

0000000080000fde <kinit>:
  struct run *freelist;
} kmem;

void
kinit()
{
    80000fde:	1141                	addi	sp,sp,-16
    80000fe0:	e406                	sd	ra,8(sp)
    80000fe2:	e022                	sd	s0,0(sp)
    80000fe4:	0800                	addi	s0,sp,16
  initlock(&kmem.lock, "kmem");
    80000fe6:	0000b597          	auipc	a1,0xb
    80000fea:	05a58593          	addi	a1,a1,90 # 8000c040 <etext+0x40>
    80000fee:	00014517          	auipc	a0,0x14
    80000ff2:	2a250513          	addi	a0,a0,674 # 80015290 <kmem>
    80000ff6:	00000097          	auipc	ra,0x0
    80000ffa:	248080e7          	jalr	584(ra) # 8000123e <initlock>
  freerange(end, (void*)PHYSTOP);
    80000ffe:	47c5                	li	a5,17
    80001000:	01b79593          	slli	a1,a5,0x1b
    80001004:	00029517          	auipc	a0,0x29
    80001008:	ffc50513          	addi	a0,a0,-4 # 8002a000 <end>
    8000100c:	00000097          	auipc	ra,0x0
    80001010:	012080e7          	jalr	18(ra) # 8000101e <freerange>
}
    80001014:	0001                	nop
    80001016:	60a2                	ld	ra,8(sp)
    80001018:	6402                	ld	s0,0(sp)
    8000101a:	0141                	addi	sp,sp,16
    8000101c:	8082                	ret

000000008000101e <freerange>:

void
freerange(void *pa_start, void *pa_end)
{
    8000101e:	7179                	addi	sp,sp,-48
    80001020:	f406                	sd	ra,40(sp)
    80001022:	f022                	sd	s0,32(sp)
    80001024:	1800                	addi	s0,sp,48
    80001026:	fca43c23          	sd	a0,-40(s0)
    8000102a:	fcb43823          	sd	a1,-48(s0)
  char *p;
  p = (char*)PGROUNDUP((uint64)pa_start);
    8000102e:	fd843703          	ld	a4,-40(s0)
    80001032:	6785                	lui	a5,0x1
    80001034:	17fd                	addi	a5,a5,-1
    80001036:	973e                	add	a4,a4,a5
    80001038:	77fd                	lui	a5,0xfffff
    8000103a:	8ff9                	and	a5,a5,a4
    8000103c:	fef43423          	sd	a5,-24(s0)
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80001040:	a829                	j	8000105a <freerange+0x3c>
    kfree(p);
    80001042:	fe843503          	ld	a0,-24(s0)
    80001046:	00000097          	auipc	ra,0x0
    8000104a:	030080e7          	jalr	48(ra) # 80001076 <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    8000104e:	fe843703          	ld	a4,-24(s0)
    80001052:	6785                	lui	a5,0x1
    80001054:	97ba                	add	a5,a5,a4
    80001056:	fef43423          	sd	a5,-24(s0)
    8000105a:	fe843703          	ld	a4,-24(s0)
    8000105e:	6785                	lui	a5,0x1
    80001060:	97ba                	add	a5,a5,a4
    80001062:	fd043703          	ld	a4,-48(s0)
    80001066:	fcf77ee3          	bgeu	a4,a5,80001042 <freerange+0x24>
}
    8000106a:	0001                	nop
    8000106c:	0001                	nop
    8000106e:	70a2                	ld	ra,40(sp)
    80001070:	7402                	ld	s0,32(sp)
    80001072:	6145                	addi	sp,sp,48
    80001074:	8082                	ret

0000000080001076 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    80001076:	7179                	addi	sp,sp,-48
    80001078:	f406                	sd	ra,40(sp)
    8000107a:	f022                	sd	s0,32(sp)
    8000107c:	1800                	addi	s0,sp,48
    8000107e:	fca43c23          	sd	a0,-40(s0)
  struct run *r;

  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < end || (uint64)pa >= PHYSTOP)
    80001082:	fd843703          	ld	a4,-40(s0)
    80001086:	6785                	lui	a5,0x1
    80001088:	17fd                	addi	a5,a5,-1
    8000108a:	8ff9                	and	a5,a5,a4
    8000108c:	ef99                	bnez	a5,800010aa <kfree+0x34>
    8000108e:	fd843703          	ld	a4,-40(s0)
    80001092:	00029797          	auipc	a5,0x29
    80001096:	f6e78793          	addi	a5,a5,-146 # 8002a000 <end>
    8000109a:	00f76863          	bltu	a4,a5,800010aa <kfree+0x34>
    8000109e:	fd843703          	ld	a4,-40(s0)
    800010a2:	47c5                	li	a5,17
    800010a4:	07ee                	slli	a5,a5,0x1b
    800010a6:	00f76a63          	bltu	a4,a5,800010ba <kfree+0x44>
    panic("kfree");
    800010aa:	0000b517          	auipc	a0,0xb
    800010ae:	f9e50513          	addi	a0,a0,-98 # 8000c048 <etext+0x48>
    800010b2:	00000097          	auipc	ra,0x0
    800010b6:	bcc080e7          	jalr	-1076(ra) # 80000c7e <panic>

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    800010ba:	6605                	lui	a2,0x1
    800010bc:	4585                	li	a1,1
    800010be:	fd843503          	ld	a0,-40(s0)
    800010c2:	00000097          	auipc	ra,0x0
    800010c6:	380080e7          	jalr	896(ra) # 80001442 <memset>

  r = (struct run*)pa;
    800010ca:	fd843783          	ld	a5,-40(s0)
    800010ce:	fef43423          	sd	a5,-24(s0)

  acquire(&kmem.lock);
    800010d2:	00014517          	auipc	a0,0x14
    800010d6:	1be50513          	addi	a0,a0,446 # 80015290 <kmem>
    800010da:	00000097          	auipc	ra,0x0
    800010de:	194080e7          	jalr	404(ra) # 8000126e <acquire>
  r->next = kmem.freelist;
    800010e2:	00014797          	auipc	a5,0x14
    800010e6:	1ae78793          	addi	a5,a5,430 # 80015290 <kmem>
    800010ea:	6f98                	ld	a4,24(a5)
    800010ec:	fe843783          	ld	a5,-24(s0)
    800010f0:	e398                	sd	a4,0(a5)
  kmem.freelist = r;
    800010f2:	00014797          	auipc	a5,0x14
    800010f6:	19e78793          	addi	a5,a5,414 # 80015290 <kmem>
    800010fa:	fe843703          	ld	a4,-24(s0)
    800010fe:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001100:	00014517          	auipc	a0,0x14
    80001104:	19050513          	addi	a0,a0,400 # 80015290 <kmem>
    80001108:	00000097          	auipc	ra,0x0
    8000110c:	1ca080e7          	jalr	458(ra) # 800012d2 <release>
}
    80001110:	0001                	nop
    80001112:	70a2                	ld	ra,40(sp)
    80001114:	7402                	ld	s0,32(sp)
    80001116:	6145                	addi	sp,sp,48
    80001118:	8082                	ret

000000008000111a <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    8000111a:	1101                	addi	sp,sp,-32
    8000111c:	ec06                	sd	ra,24(sp)
    8000111e:	e822                	sd	s0,16(sp)
    80001120:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    80001122:	00014517          	auipc	a0,0x14
    80001126:	16e50513          	addi	a0,a0,366 # 80015290 <kmem>
    8000112a:	00000097          	auipc	ra,0x0
    8000112e:	144080e7          	jalr	324(ra) # 8000126e <acquire>
  r = kmem.freelist;
    80001132:	00014797          	auipc	a5,0x14
    80001136:	15e78793          	addi	a5,a5,350 # 80015290 <kmem>
    8000113a:	6f9c                	ld	a5,24(a5)
    8000113c:	fef43423          	sd	a5,-24(s0)
  if(r)
    80001140:	fe843783          	ld	a5,-24(s0)
    80001144:	cb89                	beqz	a5,80001156 <kalloc+0x3c>
    kmem.freelist = r->next;
    80001146:	fe843783          	ld	a5,-24(s0)
    8000114a:	6398                	ld	a4,0(a5)
    8000114c:	00014797          	auipc	a5,0x14
    80001150:	14478793          	addi	a5,a5,324 # 80015290 <kmem>
    80001154:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001156:	00014517          	auipc	a0,0x14
    8000115a:	13a50513          	addi	a0,a0,314 # 80015290 <kmem>
    8000115e:	00000097          	auipc	ra,0x0
    80001162:	174080e7          	jalr	372(ra) # 800012d2 <release>

  if(r)
    80001166:	fe843783          	ld	a5,-24(s0)
    8000116a:	cb89                	beqz	a5,8000117c <kalloc+0x62>
    memset((char*)r, 5, PGSIZE); // fill with junk
    8000116c:	6605                	lui	a2,0x1
    8000116e:	4595                	li	a1,5
    80001170:	fe843503          	ld	a0,-24(s0)
    80001174:	00000097          	auipc	ra,0x0
    80001178:	2ce080e7          	jalr	718(ra) # 80001442 <memset>
  return (void*)r;
    8000117c:	fe843783          	ld	a5,-24(s0)
}
    80001180:	853e                	mv	a0,a5
    80001182:	60e2                	ld	ra,24(sp)
    80001184:	6442                	ld	s0,16(sp)
    80001186:	6105                	addi	sp,sp,32
    80001188:	8082                	ret

000000008000118a <r_sstatus>:
{
    8000118a:	1101                	addi	sp,sp,-32
    8000118c:	ec22                	sd	s0,24(sp)
    8000118e:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80001190:	100027f3          	csrr	a5,sstatus
    80001194:	fef43423          	sd	a5,-24(s0)
  return x;
    80001198:	fe843783          	ld	a5,-24(s0)
}
    8000119c:	853e                	mv	a0,a5
    8000119e:	6462                	ld	s0,24(sp)
    800011a0:	6105                	addi	sp,sp,32
    800011a2:	8082                	ret

00000000800011a4 <w_sstatus>:
{
    800011a4:	1101                	addi	sp,sp,-32
    800011a6:	ec22                	sd	s0,24(sp)
    800011a8:	1000                	addi	s0,sp,32
    800011aa:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800011ae:	fe843783          	ld	a5,-24(s0)
    800011b2:	10079073          	csrw	sstatus,a5
}
    800011b6:	0001                	nop
    800011b8:	6462                	ld	s0,24(sp)
    800011ba:	6105                	addi	sp,sp,32
    800011bc:	8082                	ret

00000000800011be <intr_on>:
{
    800011be:	1141                	addi	sp,sp,-16
    800011c0:	e406                	sd	ra,8(sp)
    800011c2:	e022                	sd	s0,0(sp)
    800011c4:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800011c6:	00000097          	auipc	ra,0x0
    800011ca:	fc4080e7          	jalr	-60(ra) # 8000118a <r_sstatus>
    800011ce:	87aa                	mv	a5,a0
    800011d0:	0027e793          	ori	a5,a5,2
    800011d4:	853e                	mv	a0,a5
    800011d6:	00000097          	auipc	ra,0x0
    800011da:	fce080e7          	jalr	-50(ra) # 800011a4 <w_sstatus>
}
    800011de:	0001                	nop
    800011e0:	60a2                	ld	ra,8(sp)
    800011e2:	6402                	ld	s0,0(sp)
    800011e4:	0141                	addi	sp,sp,16
    800011e6:	8082                	ret

00000000800011e8 <intr_off>:
{
    800011e8:	1141                	addi	sp,sp,-16
    800011ea:	e406                	sd	ra,8(sp)
    800011ec:	e022                	sd	s0,0(sp)
    800011ee:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    800011f0:	00000097          	auipc	ra,0x0
    800011f4:	f9a080e7          	jalr	-102(ra) # 8000118a <r_sstatus>
    800011f8:	87aa                	mv	a5,a0
    800011fa:	9bf5                	andi	a5,a5,-3
    800011fc:	853e                	mv	a0,a5
    800011fe:	00000097          	auipc	ra,0x0
    80001202:	fa6080e7          	jalr	-90(ra) # 800011a4 <w_sstatus>
}
    80001206:	0001                	nop
    80001208:	60a2                	ld	ra,8(sp)
    8000120a:	6402                	ld	s0,0(sp)
    8000120c:	0141                	addi	sp,sp,16
    8000120e:	8082                	ret

0000000080001210 <intr_get>:
{
    80001210:	1101                	addi	sp,sp,-32
    80001212:	ec06                	sd	ra,24(sp)
    80001214:	e822                	sd	s0,16(sp)
    80001216:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80001218:	00000097          	auipc	ra,0x0
    8000121c:	f72080e7          	jalr	-142(ra) # 8000118a <r_sstatus>
    80001220:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80001224:	fe843783          	ld	a5,-24(s0)
    80001228:	8b89                	andi	a5,a5,2
    8000122a:	00f037b3          	snez	a5,a5
    8000122e:	0ff7f793          	andi	a5,a5,255
    80001232:	2781                	sext.w	a5,a5
}
    80001234:	853e                	mv	a0,a5
    80001236:	60e2                	ld	ra,24(sp)
    80001238:	6442                	ld	s0,16(sp)
    8000123a:	6105                	addi	sp,sp,32
    8000123c:	8082                	ret

000000008000123e <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
    8000123e:	1101                	addi	sp,sp,-32
    80001240:	ec22                	sd	s0,24(sp)
    80001242:	1000                	addi	s0,sp,32
    80001244:	fea43423          	sd	a0,-24(s0)
    80001248:	feb43023          	sd	a1,-32(s0)
  lk->name = name;
    8000124c:	fe843783          	ld	a5,-24(s0)
    80001250:	fe043703          	ld	a4,-32(s0)
    80001254:	e798                	sd	a4,8(a5)
  lk->locked = 0;
    80001256:	fe843783          	ld	a5,-24(s0)
    8000125a:	0007a023          	sw	zero,0(a5)
  lk->cpu = 0;
    8000125e:	fe843783          	ld	a5,-24(s0)
    80001262:	0007b823          	sd	zero,16(a5)
}
    80001266:	0001                	nop
    80001268:	6462                	ld	s0,24(sp)
    8000126a:	6105                	addi	sp,sp,32
    8000126c:	8082                	ret

000000008000126e <acquire>:

// Acquire the lock.
// Loops (spins) until the lock is acquired.
void
acquire(struct spinlock *lk)
{
    8000126e:	1101                	addi	sp,sp,-32
    80001270:	ec06                	sd	ra,24(sp)
    80001272:	e822                	sd	s0,16(sp)
    80001274:	1000                	addi	s0,sp,32
    80001276:	fea43423          	sd	a0,-24(s0)
  push_off(); // disable interrupts to avoid deadlock.
    8000127a:	00000097          	auipc	ra,0x0
    8000127e:	0f2080e7          	jalr	242(ra) # 8000136c <push_off>
  if(holding(lk))
    80001282:	fe843503          	ld	a0,-24(s0)
    80001286:	00000097          	auipc	ra,0x0
    8000128a:	0a2080e7          	jalr	162(ra) # 80001328 <holding>
    8000128e:	87aa                	mv	a5,a0
    80001290:	cb89                	beqz	a5,800012a2 <acquire+0x34>
    panic("acquire");
    80001292:	0000b517          	auipc	a0,0xb
    80001296:	dbe50513          	addi	a0,a0,-578 # 8000c050 <etext+0x50>
    8000129a:	00000097          	auipc	ra,0x0
    8000129e:	9e4080e7          	jalr	-1564(ra) # 80000c7e <panic>

  // On RISC-V, sync_lock_test_and_set turns into an atomic swap:
  //   a5 = 1
  //   s1 = &lk->locked
  //   amoswap.w.aq a5, a5, (s1)
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    800012a2:	0001                	nop
    800012a4:	fe843783          	ld	a5,-24(s0)
    800012a8:	4705                	li	a4,1
    800012aa:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    800012ae:	0007079b          	sext.w	a5,a4
    800012b2:	fbed                	bnez	a5,800012a4 <acquire+0x36>

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen strictly after the lock is acquired.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    800012b4:	0ff0000f          	fence

  // Record info about lock acquisition for holding() and debugging.
  lk->cpu = mycpu();
    800012b8:	00001097          	auipc	ra,0x1
    800012bc:	53a080e7          	jalr	1338(ra) # 800027f2 <mycpu>
    800012c0:	872a                	mv	a4,a0
    800012c2:	fe843783          	ld	a5,-24(s0)
    800012c6:	eb98                	sd	a4,16(a5)
}
    800012c8:	0001                	nop
    800012ca:	60e2                	ld	ra,24(sp)
    800012cc:	6442                	ld	s0,16(sp)
    800012ce:	6105                	addi	sp,sp,32
    800012d0:	8082                	ret

00000000800012d2 <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
    800012d2:	1101                	addi	sp,sp,-32
    800012d4:	ec06                	sd	ra,24(sp)
    800012d6:	e822                	sd	s0,16(sp)
    800012d8:	1000                	addi	s0,sp,32
    800012da:	fea43423          	sd	a0,-24(s0)
  if(!holding(lk))
    800012de:	fe843503          	ld	a0,-24(s0)
    800012e2:	00000097          	auipc	ra,0x0
    800012e6:	046080e7          	jalr	70(ra) # 80001328 <holding>
    800012ea:	87aa                	mv	a5,a0
    800012ec:	eb89                	bnez	a5,800012fe <release+0x2c>
    panic("release");
    800012ee:	0000b517          	auipc	a0,0xb
    800012f2:	d6a50513          	addi	a0,a0,-662 # 8000c058 <etext+0x58>
    800012f6:	00000097          	auipc	ra,0x0
    800012fa:	988080e7          	jalr	-1656(ra) # 80000c7e <panic>

  lk->cpu = 0;
    800012fe:	fe843783          	ld	a5,-24(s0)
    80001302:	0007b823          	sd	zero,16(a5)
  // past this point, to ensure that all the stores in the critical
  // section are visible to other CPUs before the lock is released,
  // and that loads in the critical section occur strictly before
  // the lock is released.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    80001306:	0ff0000f          	fence
  // implies that an assignment might be implemented with
  // multiple store instructions.
  // On RISC-V, sync_lock_release turns into an atomic swap:
  //   s1 = &lk->locked
  //   amoswap.w zero, zero, (s1)
  __sync_lock_release(&lk->locked);
    8000130a:	fe843783          	ld	a5,-24(s0)
    8000130e:	0f50000f          	fence	iorw,ow
    80001312:	0807a02f          	amoswap.w	zero,zero,(a5)

  pop_off();
    80001316:	00000097          	auipc	ra,0x0
    8000131a:	0ae080e7          	jalr	174(ra) # 800013c4 <pop_off>
}
    8000131e:	0001                	nop
    80001320:	60e2                	ld	ra,24(sp)
    80001322:	6442                	ld	s0,16(sp)
    80001324:	6105                	addi	sp,sp,32
    80001326:	8082                	ret

0000000080001328 <holding>:

// Check whether this cpu is holding the lock.
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
    80001328:	7139                	addi	sp,sp,-64
    8000132a:	fc06                	sd	ra,56(sp)
    8000132c:	f822                	sd	s0,48(sp)
    8000132e:	f426                	sd	s1,40(sp)
    80001330:	0080                	addi	s0,sp,64
    80001332:	fca43423          	sd	a0,-56(s0)
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    80001336:	fc843783          	ld	a5,-56(s0)
    8000133a:	439c                	lw	a5,0(a5)
    8000133c:	cf89                	beqz	a5,80001356 <holding+0x2e>
    8000133e:	fc843783          	ld	a5,-56(s0)
    80001342:	6b84                	ld	s1,16(a5)
    80001344:	00001097          	auipc	ra,0x1
    80001348:	4ae080e7          	jalr	1198(ra) # 800027f2 <mycpu>
    8000134c:	87aa                	mv	a5,a0
    8000134e:	00f49463          	bne	s1,a5,80001356 <holding+0x2e>
    80001352:	4785                	li	a5,1
    80001354:	a011                	j	80001358 <holding+0x30>
    80001356:	4781                	li	a5,0
    80001358:	fcf42e23          	sw	a5,-36(s0)
  return r;
    8000135c:	fdc42783          	lw	a5,-36(s0)
}
    80001360:	853e                	mv	a0,a5
    80001362:	70e2                	ld	ra,56(sp)
    80001364:	7442                	ld	s0,48(sp)
    80001366:	74a2                	ld	s1,40(sp)
    80001368:	6121                	addi	sp,sp,64
    8000136a:	8082                	ret

000000008000136c <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    8000136c:	1101                	addi	sp,sp,-32
    8000136e:	ec06                	sd	ra,24(sp)
    80001370:	e822                	sd	s0,16(sp)
    80001372:	1000                	addi	s0,sp,32
  int old = intr_get();
    80001374:	00000097          	auipc	ra,0x0
    80001378:	e9c080e7          	jalr	-356(ra) # 80001210 <intr_get>
    8000137c:	87aa                	mv	a5,a0
    8000137e:	fef42623          	sw	a5,-20(s0)

  intr_off();
    80001382:	00000097          	auipc	ra,0x0
    80001386:	e66080e7          	jalr	-410(ra) # 800011e8 <intr_off>
  if(mycpu()->noff == 0)
    8000138a:	00001097          	auipc	ra,0x1
    8000138e:	468080e7          	jalr	1128(ra) # 800027f2 <mycpu>
    80001392:	87aa                	mv	a5,a0
    80001394:	5fbc                	lw	a5,120(a5)
    80001396:	eb89                	bnez	a5,800013a8 <push_off+0x3c>
    mycpu()->intena = old;
    80001398:	00001097          	auipc	ra,0x1
    8000139c:	45a080e7          	jalr	1114(ra) # 800027f2 <mycpu>
    800013a0:	872a                	mv	a4,a0
    800013a2:	fec42783          	lw	a5,-20(s0)
    800013a6:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    800013a8:	00001097          	auipc	ra,0x1
    800013ac:	44a080e7          	jalr	1098(ra) # 800027f2 <mycpu>
    800013b0:	87aa                	mv	a5,a0
    800013b2:	5fb8                	lw	a4,120(a5)
    800013b4:	2705                	addiw	a4,a4,1
    800013b6:	2701                	sext.w	a4,a4
    800013b8:	dfb8                	sw	a4,120(a5)
}
    800013ba:	0001                	nop
    800013bc:	60e2                	ld	ra,24(sp)
    800013be:	6442                	ld	s0,16(sp)
    800013c0:	6105                	addi	sp,sp,32
    800013c2:	8082                	ret

00000000800013c4 <pop_off>:

void
pop_off(void)
{
    800013c4:	1101                	addi	sp,sp,-32
    800013c6:	ec06                	sd	ra,24(sp)
    800013c8:	e822                	sd	s0,16(sp)
    800013ca:	1000                	addi	s0,sp,32
  struct cpu *c = mycpu();
    800013cc:	00001097          	auipc	ra,0x1
    800013d0:	426080e7          	jalr	1062(ra) # 800027f2 <mycpu>
    800013d4:	fea43423          	sd	a0,-24(s0)
  if(intr_get())
    800013d8:	00000097          	auipc	ra,0x0
    800013dc:	e38080e7          	jalr	-456(ra) # 80001210 <intr_get>
    800013e0:	87aa                	mv	a5,a0
    800013e2:	cb89                	beqz	a5,800013f4 <pop_off+0x30>
    panic("pop_off - interruptible");
    800013e4:	0000b517          	auipc	a0,0xb
    800013e8:	c7c50513          	addi	a0,a0,-900 # 8000c060 <etext+0x60>
    800013ec:	00000097          	auipc	ra,0x0
    800013f0:	892080e7          	jalr	-1902(ra) # 80000c7e <panic>
  if(c->noff < 1)
    800013f4:	fe843783          	ld	a5,-24(s0)
    800013f8:	5fbc                	lw	a5,120(a5)
    800013fa:	00f04a63          	bgtz	a5,8000140e <pop_off+0x4a>
    panic("pop_off");
    800013fe:	0000b517          	auipc	a0,0xb
    80001402:	c7a50513          	addi	a0,a0,-902 # 8000c078 <etext+0x78>
    80001406:	00000097          	auipc	ra,0x0
    8000140a:	878080e7          	jalr	-1928(ra) # 80000c7e <panic>
  c->noff -= 1;
    8000140e:	fe843783          	ld	a5,-24(s0)
    80001412:	5fbc                	lw	a5,120(a5)
    80001414:	37fd                	addiw	a5,a5,-1
    80001416:	0007871b          	sext.w	a4,a5
    8000141a:	fe843783          	ld	a5,-24(s0)
    8000141e:	dfb8                	sw	a4,120(a5)
  if(c->noff == 0 && c->intena)
    80001420:	fe843783          	ld	a5,-24(s0)
    80001424:	5fbc                	lw	a5,120(a5)
    80001426:	eb89                	bnez	a5,80001438 <pop_off+0x74>
    80001428:	fe843783          	ld	a5,-24(s0)
    8000142c:	5ffc                	lw	a5,124(a5)
    8000142e:	c789                	beqz	a5,80001438 <pop_off+0x74>
    intr_on();
    80001430:	00000097          	auipc	ra,0x0
    80001434:	d8e080e7          	jalr	-626(ra) # 800011be <intr_on>
}
    80001438:	0001                	nop
    8000143a:	60e2                	ld	ra,24(sp)
    8000143c:	6442                	ld	s0,16(sp)
    8000143e:	6105                	addi	sp,sp,32
    80001440:	8082                	ret

0000000080001442 <memset>:
#include "types.h"

void*
memset(void *dst, int c, uint n)
{
    80001442:	7179                	addi	sp,sp,-48
    80001444:	f422                	sd	s0,40(sp)
    80001446:	1800                	addi	s0,sp,48
    80001448:	fca43c23          	sd	a0,-40(s0)
    8000144c:	87ae                	mv	a5,a1
    8000144e:	8732                	mv	a4,a2
    80001450:	fcf42a23          	sw	a5,-44(s0)
    80001454:	87ba                	mv	a5,a4
    80001456:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    8000145a:	fd843783          	ld	a5,-40(s0)
    8000145e:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    80001462:	fe042623          	sw	zero,-20(s0)
    80001466:	a00d                	j	80001488 <memset+0x46>
    cdst[i] = c;
    80001468:	fec42783          	lw	a5,-20(s0)
    8000146c:	fe043703          	ld	a4,-32(s0)
    80001470:	97ba                	add	a5,a5,a4
    80001472:	fd442703          	lw	a4,-44(s0)
    80001476:	0ff77713          	andi	a4,a4,255
    8000147a:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    8000147e:	fec42783          	lw	a5,-20(s0)
    80001482:	2785                	addiw	a5,a5,1
    80001484:	fef42623          	sw	a5,-20(s0)
    80001488:	fec42703          	lw	a4,-20(s0)
    8000148c:	fd042783          	lw	a5,-48(s0)
    80001490:	2781                	sext.w	a5,a5
    80001492:	fcf76be3          	bltu	a4,a5,80001468 <memset+0x26>
  }
  return dst;
    80001496:	fd843783          	ld	a5,-40(s0)
}
    8000149a:	853e                	mv	a0,a5
    8000149c:	7422                	ld	s0,40(sp)
    8000149e:	6145                	addi	sp,sp,48
    800014a0:	8082                	ret

00000000800014a2 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    800014a2:	7139                	addi	sp,sp,-64
    800014a4:	fc22                	sd	s0,56(sp)
    800014a6:	0080                	addi	s0,sp,64
    800014a8:	fca43c23          	sd	a0,-40(s0)
    800014ac:	fcb43823          	sd	a1,-48(s0)
    800014b0:	87b2                	mv	a5,a2
    800014b2:	fcf42623          	sw	a5,-52(s0)
  const uchar *s1, *s2;

  s1 = v1;
    800014b6:	fd843783          	ld	a5,-40(s0)
    800014ba:	fef43423          	sd	a5,-24(s0)
  s2 = v2;
    800014be:	fd043783          	ld	a5,-48(s0)
    800014c2:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    800014c6:	a0a1                	j	8000150e <memcmp+0x6c>
    if(*s1 != *s2)
    800014c8:	fe843783          	ld	a5,-24(s0)
    800014cc:	0007c703          	lbu	a4,0(a5)
    800014d0:	fe043783          	ld	a5,-32(s0)
    800014d4:	0007c783          	lbu	a5,0(a5)
    800014d8:	02f70163          	beq	a4,a5,800014fa <memcmp+0x58>
      return *s1 - *s2;
    800014dc:	fe843783          	ld	a5,-24(s0)
    800014e0:	0007c783          	lbu	a5,0(a5)
    800014e4:	0007871b          	sext.w	a4,a5
    800014e8:	fe043783          	ld	a5,-32(s0)
    800014ec:	0007c783          	lbu	a5,0(a5)
    800014f0:	2781                	sext.w	a5,a5
    800014f2:	40f707bb          	subw	a5,a4,a5
    800014f6:	2781                	sext.w	a5,a5
    800014f8:	a01d                	j	8000151e <memcmp+0x7c>
    s1++, s2++;
    800014fa:	fe843783          	ld	a5,-24(s0)
    800014fe:	0785                	addi	a5,a5,1
    80001500:	fef43423          	sd	a5,-24(s0)
    80001504:	fe043783          	ld	a5,-32(s0)
    80001508:	0785                	addi	a5,a5,1
    8000150a:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    8000150e:	fcc42783          	lw	a5,-52(s0)
    80001512:	fff7871b          	addiw	a4,a5,-1
    80001516:	fce42623          	sw	a4,-52(s0)
    8000151a:	f7dd                	bnez	a5,800014c8 <memcmp+0x26>
  }

  return 0;
    8000151c:	4781                	li	a5,0
}
    8000151e:	853e                	mv	a0,a5
    80001520:	7462                	ld	s0,56(sp)
    80001522:	6121                	addi	sp,sp,64
    80001524:	8082                	ret

0000000080001526 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    80001526:	7139                	addi	sp,sp,-64
    80001528:	fc22                	sd	s0,56(sp)
    8000152a:	0080                	addi	s0,sp,64
    8000152c:	fca43c23          	sd	a0,-40(s0)
    80001530:	fcb43823          	sd	a1,-48(s0)
    80001534:	87b2                	mv	a5,a2
    80001536:	fcf42623          	sw	a5,-52(s0)
  const char *s;
  char *d;

  if(n == 0)
    8000153a:	fcc42783          	lw	a5,-52(s0)
    8000153e:	2781                	sext.w	a5,a5
    80001540:	e781                	bnez	a5,80001548 <memmove+0x22>
    return dst;
    80001542:	fd843783          	ld	a5,-40(s0)
    80001546:	a855                	j	800015fa <memmove+0xd4>
  
  s = src;
    80001548:	fd043783          	ld	a5,-48(s0)
    8000154c:	fef43423          	sd	a5,-24(s0)
  d = dst;
    80001550:	fd843783          	ld	a5,-40(s0)
    80001554:	fef43023          	sd	a5,-32(s0)
  if(s < d && s + n > d){
    80001558:	fe843703          	ld	a4,-24(s0)
    8000155c:	fe043783          	ld	a5,-32(s0)
    80001560:	08f77463          	bgeu	a4,a5,800015e8 <memmove+0xc2>
    80001564:	fcc46783          	lwu	a5,-52(s0)
    80001568:	fe843703          	ld	a4,-24(s0)
    8000156c:	97ba                	add	a5,a5,a4
    8000156e:	fe043703          	ld	a4,-32(s0)
    80001572:	06f77b63          	bgeu	a4,a5,800015e8 <memmove+0xc2>
    s += n;
    80001576:	fcc46783          	lwu	a5,-52(s0)
    8000157a:	fe843703          	ld	a4,-24(s0)
    8000157e:	97ba                	add	a5,a5,a4
    80001580:	fef43423          	sd	a5,-24(s0)
    d += n;
    80001584:	fcc46783          	lwu	a5,-52(s0)
    80001588:	fe043703          	ld	a4,-32(s0)
    8000158c:	97ba                	add	a5,a5,a4
    8000158e:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    80001592:	a01d                	j	800015b8 <memmove+0x92>
      *--d = *--s;
    80001594:	fe843783          	ld	a5,-24(s0)
    80001598:	17fd                	addi	a5,a5,-1
    8000159a:	fef43423          	sd	a5,-24(s0)
    8000159e:	fe043783          	ld	a5,-32(s0)
    800015a2:	17fd                	addi	a5,a5,-1
    800015a4:	fef43023          	sd	a5,-32(s0)
    800015a8:	fe843783          	ld	a5,-24(s0)
    800015ac:	0007c703          	lbu	a4,0(a5)
    800015b0:	fe043783          	ld	a5,-32(s0)
    800015b4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015b8:	fcc42783          	lw	a5,-52(s0)
    800015bc:	fff7871b          	addiw	a4,a5,-1
    800015c0:	fce42623          	sw	a4,-52(s0)
    800015c4:	fbe1                	bnez	a5,80001594 <memmove+0x6e>
  if(s < d && s + n > d){
    800015c6:	a805                	j	800015f6 <memmove+0xd0>
  } else
    while(n-- > 0)
      *d++ = *s++;
    800015c8:	fe843703          	ld	a4,-24(s0)
    800015cc:	00170793          	addi	a5,a4,1
    800015d0:	fef43423          	sd	a5,-24(s0)
    800015d4:	fe043783          	ld	a5,-32(s0)
    800015d8:	00178693          	addi	a3,a5,1
    800015dc:	fed43023          	sd	a3,-32(s0)
    800015e0:	00074703          	lbu	a4,0(a4)
    800015e4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800015e8:	fcc42783          	lw	a5,-52(s0)
    800015ec:	fff7871b          	addiw	a4,a5,-1
    800015f0:	fce42623          	sw	a4,-52(s0)
    800015f4:	fbf1                	bnez	a5,800015c8 <memmove+0xa2>

  return dst;
    800015f6:	fd843783          	ld	a5,-40(s0)
}
    800015fa:	853e                	mv	a0,a5
    800015fc:	7462                	ld	s0,56(sp)
    800015fe:	6121                	addi	sp,sp,64
    80001600:	8082                	ret

0000000080001602 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    80001602:	7179                	addi	sp,sp,-48
    80001604:	f406                	sd	ra,40(sp)
    80001606:	f022                	sd	s0,32(sp)
    80001608:	1800                	addi	s0,sp,48
    8000160a:	fea43423          	sd	a0,-24(s0)
    8000160e:	feb43023          	sd	a1,-32(s0)
    80001612:	87b2                	mv	a5,a2
    80001614:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    80001618:	fdc42783          	lw	a5,-36(s0)
    8000161c:	863e                	mv	a2,a5
    8000161e:	fe043583          	ld	a1,-32(s0)
    80001622:	fe843503          	ld	a0,-24(s0)
    80001626:	00000097          	auipc	ra,0x0
    8000162a:	f00080e7          	jalr	-256(ra) # 80001526 <memmove>
    8000162e:	87aa                	mv	a5,a0
}
    80001630:	853e                	mv	a0,a5
    80001632:	70a2                	ld	ra,40(sp)
    80001634:	7402                	ld	s0,32(sp)
    80001636:	6145                	addi	sp,sp,48
    80001638:	8082                	ret

000000008000163a <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    8000163a:	7179                	addi	sp,sp,-48
    8000163c:	f422                	sd	s0,40(sp)
    8000163e:	1800                	addi	s0,sp,48
    80001640:	fea43423          	sd	a0,-24(s0)
    80001644:	feb43023          	sd	a1,-32(s0)
    80001648:	87b2                	mv	a5,a2
    8000164a:	fcf42e23          	sw	a5,-36(s0)
  while(n > 0 && *p && *p == *q)
    8000164e:	a005                	j	8000166e <strncmp+0x34>
    n--, p++, q++;
    80001650:	fdc42783          	lw	a5,-36(s0)
    80001654:	37fd                	addiw	a5,a5,-1
    80001656:	fcf42e23          	sw	a5,-36(s0)
    8000165a:	fe843783          	ld	a5,-24(s0)
    8000165e:	0785                	addi	a5,a5,1
    80001660:	fef43423          	sd	a5,-24(s0)
    80001664:	fe043783          	ld	a5,-32(s0)
    80001668:	0785                	addi	a5,a5,1
    8000166a:	fef43023          	sd	a5,-32(s0)
  while(n > 0 && *p && *p == *q)
    8000166e:	fdc42783          	lw	a5,-36(s0)
    80001672:	2781                	sext.w	a5,a5
    80001674:	c385                	beqz	a5,80001694 <strncmp+0x5a>
    80001676:	fe843783          	ld	a5,-24(s0)
    8000167a:	0007c783          	lbu	a5,0(a5)
    8000167e:	cb99                	beqz	a5,80001694 <strncmp+0x5a>
    80001680:	fe843783          	ld	a5,-24(s0)
    80001684:	0007c703          	lbu	a4,0(a5)
    80001688:	fe043783          	ld	a5,-32(s0)
    8000168c:	0007c783          	lbu	a5,0(a5)
    80001690:	fcf700e3          	beq	a4,a5,80001650 <strncmp+0x16>
  if(n == 0)
    80001694:	fdc42783          	lw	a5,-36(s0)
    80001698:	2781                	sext.w	a5,a5
    8000169a:	e399                	bnez	a5,800016a0 <strncmp+0x66>
    return 0;
    8000169c:	4781                	li	a5,0
    8000169e:	a839                	j	800016bc <strncmp+0x82>
  return (uchar)*p - (uchar)*q;
    800016a0:	fe843783          	ld	a5,-24(s0)
    800016a4:	0007c783          	lbu	a5,0(a5)
    800016a8:	0007871b          	sext.w	a4,a5
    800016ac:	fe043783          	ld	a5,-32(s0)
    800016b0:	0007c783          	lbu	a5,0(a5)
    800016b4:	2781                	sext.w	a5,a5
    800016b6:	40f707bb          	subw	a5,a4,a5
    800016ba:	2781                	sext.w	a5,a5
}
    800016bc:	853e                	mv	a0,a5
    800016be:	7422                	ld	s0,40(sp)
    800016c0:	6145                	addi	sp,sp,48
    800016c2:	8082                	ret

00000000800016c4 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    800016c4:	7139                	addi	sp,sp,-64
    800016c6:	fc22                	sd	s0,56(sp)
    800016c8:	0080                	addi	s0,sp,64
    800016ca:	fca43c23          	sd	a0,-40(s0)
    800016ce:	fcb43823          	sd	a1,-48(s0)
    800016d2:	87b2                	mv	a5,a2
    800016d4:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    800016d8:	fd843783          	ld	a5,-40(s0)
    800016dc:	fef43423          	sd	a5,-24(s0)
  while(n-- > 0 && (*s++ = *t++) != 0)
    800016e0:	0001                	nop
    800016e2:	fcc42783          	lw	a5,-52(s0)
    800016e6:	fff7871b          	addiw	a4,a5,-1
    800016ea:	fce42623          	sw	a4,-52(s0)
    800016ee:	02f05e63          	blez	a5,8000172a <strncpy+0x66>
    800016f2:	fd043703          	ld	a4,-48(s0)
    800016f6:	00170793          	addi	a5,a4,1
    800016fa:	fcf43823          	sd	a5,-48(s0)
    800016fe:	fd843783          	ld	a5,-40(s0)
    80001702:	00178693          	addi	a3,a5,1
    80001706:	fcd43c23          	sd	a3,-40(s0)
    8000170a:	00074703          	lbu	a4,0(a4)
    8000170e:	00e78023          	sb	a4,0(a5)
    80001712:	0007c783          	lbu	a5,0(a5)
    80001716:	f7f1                	bnez	a5,800016e2 <strncpy+0x1e>
    ;
  while(n-- > 0)
    80001718:	a809                	j	8000172a <strncpy+0x66>
    *s++ = 0;
    8000171a:	fd843783          	ld	a5,-40(s0)
    8000171e:	00178713          	addi	a4,a5,1
    80001722:	fce43c23          	sd	a4,-40(s0)
    80001726:	00078023          	sb	zero,0(a5)
  while(n-- > 0)
    8000172a:	fcc42783          	lw	a5,-52(s0)
    8000172e:	fff7871b          	addiw	a4,a5,-1
    80001732:	fce42623          	sw	a4,-52(s0)
    80001736:	fef042e3          	bgtz	a5,8000171a <strncpy+0x56>
  return os;
    8000173a:	fe843783          	ld	a5,-24(s0)
}
    8000173e:	853e                	mv	a0,a5
    80001740:	7462                	ld	s0,56(sp)
    80001742:	6121                	addi	sp,sp,64
    80001744:	8082                	ret

0000000080001746 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    80001746:	7139                	addi	sp,sp,-64
    80001748:	fc22                	sd	s0,56(sp)
    8000174a:	0080                	addi	s0,sp,64
    8000174c:	fca43c23          	sd	a0,-40(s0)
    80001750:	fcb43823          	sd	a1,-48(s0)
    80001754:	87b2                	mv	a5,a2
    80001756:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    8000175a:	fd843783          	ld	a5,-40(s0)
    8000175e:	fef43423          	sd	a5,-24(s0)
  if(n <= 0)
    80001762:	fcc42783          	lw	a5,-52(s0)
    80001766:	2781                	sext.w	a5,a5
    80001768:	00f04563          	bgtz	a5,80001772 <safestrcpy+0x2c>
    return os;
    8000176c:	fe843783          	ld	a5,-24(s0)
    80001770:	a0a1                	j	800017b8 <safestrcpy+0x72>
  while(--n > 0 && (*s++ = *t++) != 0)
    80001772:	fcc42783          	lw	a5,-52(s0)
    80001776:	37fd                	addiw	a5,a5,-1
    80001778:	fcf42623          	sw	a5,-52(s0)
    8000177c:	fcc42783          	lw	a5,-52(s0)
    80001780:	2781                	sext.w	a5,a5
    80001782:	02f05563          	blez	a5,800017ac <safestrcpy+0x66>
    80001786:	fd043703          	ld	a4,-48(s0)
    8000178a:	00170793          	addi	a5,a4,1
    8000178e:	fcf43823          	sd	a5,-48(s0)
    80001792:	fd843783          	ld	a5,-40(s0)
    80001796:	00178693          	addi	a3,a5,1
    8000179a:	fcd43c23          	sd	a3,-40(s0)
    8000179e:	00074703          	lbu	a4,0(a4)
    800017a2:	00e78023          	sb	a4,0(a5)
    800017a6:	0007c783          	lbu	a5,0(a5)
    800017aa:	f7e1                	bnez	a5,80001772 <safestrcpy+0x2c>
    ;
  *s = 0;
    800017ac:	fd843783          	ld	a5,-40(s0)
    800017b0:	00078023          	sb	zero,0(a5)
  return os;
    800017b4:	fe843783          	ld	a5,-24(s0)
}
    800017b8:	853e                	mv	a0,a5
    800017ba:	7462                	ld	s0,56(sp)
    800017bc:	6121                	addi	sp,sp,64
    800017be:	8082                	ret

00000000800017c0 <strlen>:

int
strlen(const char *s)
{
    800017c0:	7179                	addi	sp,sp,-48
    800017c2:	f422                	sd	s0,40(sp)
    800017c4:	1800                	addi	s0,sp,48
    800017c6:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    800017ca:	fe042623          	sw	zero,-20(s0)
    800017ce:	a031                	j	800017da <strlen+0x1a>
    800017d0:	fec42783          	lw	a5,-20(s0)
    800017d4:	2785                	addiw	a5,a5,1
    800017d6:	fef42623          	sw	a5,-20(s0)
    800017da:	fec42783          	lw	a5,-20(s0)
    800017de:	fd843703          	ld	a4,-40(s0)
    800017e2:	97ba                	add	a5,a5,a4
    800017e4:	0007c783          	lbu	a5,0(a5)
    800017e8:	f7e5                	bnez	a5,800017d0 <strlen+0x10>
    ;
  return n;
    800017ea:	fec42783          	lw	a5,-20(s0)
}
    800017ee:	853e                	mv	a0,a5
    800017f0:	7422                	ld	s0,40(sp)
    800017f2:	6145                	addi	sp,sp,48
    800017f4:	8082                	ret

00000000800017f6 <main>:
volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
    800017f6:	1141                	addi	sp,sp,-16
    800017f8:	e406                	sd	ra,8(sp)
    800017fa:	e022                	sd	s0,0(sp)
    800017fc:	0800                	addi	s0,sp,16
  if(cpuid() == 0){
    800017fe:	00001097          	auipc	ra,0x1
    80001802:	fd0080e7          	jalr	-48(ra) # 800027ce <cpuid>
    80001806:	87aa                	mv	a5,a0
    80001808:	efd5                	bnez	a5,800018c4 <main+0xce>
    consoleinit();
    8000180a:	fffff097          	auipc	ra,0xfffff
    8000180e:	048080e7          	jalr	72(ra) # 80000852 <consoleinit>
    printfinit();
    80001812:	fffff097          	auipc	ra,0xfffff
    80001816:	4be080e7          	jalr	1214(ra) # 80000cd0 <printfinit>
    printf("\n");
    8000181a:	0000b517          	auipc	a0,0xb
    8000181e:	86650513          	addi	a0,a0,-1946 # 8000c080 <etext+0x80>
    80001822:	fffff097          	auipc	ra,0xfffff
    80001826:	206080e7          	jalr	518(ra) # 80000a28 <printf>
    printf("xv6 kernel is booting\n");
    8000182a:	0000b517          	auipc	a0,0xb
    8000182e:	85e50513          	addi	a0,a0,-1954 # 8000c088 <etext+0x88>
    80001832:	fffff097          	auipc	ra,0xfffff
    80001836:	1f6080e7          	jalr	502(ra) # 80000a28 <printf>
    printf("\n");
    8000183a:	0000b517          	auipc	a0,0xb
    8000183e:	84650513          	addi	a0,a0,-1978 # 8000c080 <etext+0x80>
    80001842:	fffff097          	auipc	ra,0xfffff
    80001846:	1e6080e7          	jalr	486(ra) # 80000a28 <printf>
    kinit();         // physical page allocator
    8000184a:	fffff097          	auipc	ra,0xfffff
    8000184e:	794080e7          	jalr	1940(ra) # 80000fde <kinit>
    kvminit();       // create kernel page table
    80001852:	00000097          	auipc	ra,0x0
    80001856:	1f4080e7          	jalr	500(ra) # 80001a46 <kvminit>
    kvminithart();   // turn on paging
    8000185a:	00000097          	auipc	ra,0x0
    8000185e:	212080e7          	jalr	530(ra) # 80001a6c <kvminithart>
    procinit();      // process table
    80001862:	00001097          	auipc	ra,0x1
    80001866:	e8e080e7          	jalr	-370(ra) # 800026f0 <procinit>
    trapinit();      // trap vectors
    8000186a:	00003097          	auipc	ra,0x3
    8000186e:	62c080e7          	jalr	1580(ra) # 80004e96 <trapinit>
    trapinithart();  // install kernel trap vector
    80001872:	00003097          	auipc	ra,0x3
    80001876:	64e080e7          	jalr	1614(ra) # 80004ec0 <trapinithart>
    plicinit();      // set up interrupt controller
    8000187a:	00008097          	auipc	ra,0x8
    8000187e:	550080e7          	jalr	1360(ra) # 80009dca <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    80001882:	00008097          	auipc	ra,0x8
    80001886:	56c080e7          	jalr	1388(ra) # 80009dee <plicinithart>
    binit();         // buffer cache
    8000188a:	00004097          	auipc	ra,0x4
    8000188e:	16a080e7          	jalr	362(ra) # 800059f4 <binit>
    iinit();         // inode table
    80001892:	00005097          	auipc	ra,0x5
    80001896:	9b6080e7          	jalr	-1610(ra) # 80006248 <iinit>
    fileinit();      // file table
    8000189a:	00006097          	auipc	ra,0x6
    8000189e:	358080e7          	jalr	856(ra) # 80007bf2 <fileinit>
    virtio_disk_init(); // emulated hard disk
    800018a2:	00008097          	auipc	ra,0x8
    800018a6:	620080e7          	jalr	1568(ra) # 80009ec2 <virtio_disk_init>
    userinit();      // first user process
    800018aa:	00001097          	auipc	ra,0x1
    800018ae:	3ce080e7          	jalr	974(ra) # 80002c78 <userinit>
    __sync_synchronize();
    800018b2:	0ff0000f          	fence
    started = 1;
    800018b6:	00014797          	auipc	a5,0x14
    800018ba:	9fa78793          	addi	a5,a5,-1542 # 800152b0 <started>
    800018be:	4705                	li	a4,1
    800018c0:	c398                	sw	a4,0(a5)
    800018c2:	a0a9                	j	8000190c <main+0x116>
  } else {
    while(started == 0)
    800018c4:	0001                	nop
    800018c6:	00014797          	auipc	a5,0x14
    800018ca:	9ea78793          	addi	a5,a5,-1558 # 800152b0 <started>
    800018ce:	439c                	lw	a5,0(a5)
    800018d0:	2781                	sext.w	a5,a5
    800018d2:	dbf5                	beqz	a5,800018c6 <main+0xd0>
      ;
    __sync_synchronize();
    800018d4:	0ff0000f          	fence
    printf("hart %d starting\n", cpuid());
    800018d8:	00001097          	auipc	ra,0x1
    800018dc:	ef6080e7          	jalr	-266(ra) # 800027ce <cpuid>
    800018e0:	87aa                	mv	a5,a0
    800018e2:	85be                	mv	a1,a5
    800018e4:	0000a517          	auipc	a0,0xa
    800018e8:	7bc50513          	addi	a0,a0,1980 # 8000c0a0 <etext+0xa0>
    800018ec:	fffff097          	auipc	ra,0xfffff
    800018f0:	13c080e7          	jalr	316(ra) # 80000a28 <printf>
    kvminithart();    // turn on paging
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	178080e7          	jalr	376(ra) # 80001a6c <kvminithart>
    trapinithart();   // install kernel trap vector
    800018fc:	00003097          	auipc	ra,0x3
    80001900:	5c4080e7          	jalr	1476(ra) # 80004ec0 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    80001904:	00008097          	auipc	ra,0x8
    80001908:	4ea080e7          	jalr	1258(ra) # 80009dee <plicinithart>
  }

  scheduler();        
    8000190c:	00003097          	auipc	ra,0x3
    80001910:	b8a080e7          	jalr	-1142(ra) # 80004496 <scheduler>

0000000080001914 <w_satp>:
{
    80001914:	1101                	addi	sp,sp,-32
    80001916:	ec22                	sd	s0,24(sp)
    80001918:	1000                	addi	s0,sp,32
    8000191a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    8000191e:	fe843783          	ld	a5,-24(s0)
    80001922:	18079073          	csrw	satp,a5
}
    80001926:	0001                	nop
    80001928:	6462                	ld	s0,24(sp)
    8000192a:	6105                	addi	sp,sp,32
    8000192c:	8082                	ret

000000008000192e <sfence_vma>:
}

// flush the TLB.
static inline void
sfence_vma()
{
    8000192e:	1141                	addi	sp,sp,-16
    80001930:	e422                	sd	s0,8(sp)
    80001932:	0800                	addi	s0,sp,16
  // the zero, zero means flush all TLB entries.
  asm volatile("sfence.vma zero, zero");
    80001934:	12000073          	sfence.vma
}
    80001938:	0001                	nop
    8000193a:	6422                	ld	s0,8(sp)
    8000193c:	0141                	addi	sp,sp,16
    8000193e:	8082                	ret

0000000080001940 <kvmmake>:
extern char trampoline[]; // trampoline.S

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    80001940:	1101                	addi	sp,sp,-32
    80001942:	ec06                	sd	ra,24(sp)
    80001944:	e822                	sd	s0,16(sp)
    80001946:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    80001948:	fffff097          	auipc	ra,0xfffff
    8000194c:	7d2080e7          	jalr	2002(ra) # 8000111a <kalloc>
    80001950:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001954:	6605                	lui	a2,0x1
    80001956:	4581                	li	a1,0
    80001958:	fe843503          	ld	a0,-24(s0)
    8000195c:	00000097          	auipc	ra,0x0
    80001960:	ae6080e7          	jalr	-1306(ra) # 80001442 <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001964:	4719                	li	a4,6
    80001966:	6685                	lui	a3,0x1
    80001968:	10000637          	lui	a2,0x10000
    8000196c:	100005b7          	lui	a1,0x10000
    80001970:	fe843503          	ld	a0,-24(s0)
    80001974:	00000097          	auipc	ra,0x0
    80001978:	298080e7          	jalr	664(ra) # 80001c0c <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    8000197c:	4719                	li	a4,6
    8000197e:	6685                	lui	a3,0x1
    80001980:	10001637          	lui	a2,0x10001
    80001984:	100015b7          	lui	a1,0x10001
    80001988:	fe843503          	ld	a0,-24(s0)
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	280080e7          	jalr	640(ra) # 80001c0c <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001994:	4719                	li	a4,6
    80001996:	004006b7          	lui	a3,0x400
    8000199a:	0c000637          	lui	a2,0xc000
    8000199e:	0c0005b7          	lui	a1,0xc000
    800019a2:	fe843503          	ld	a0,-24(s0)
    800019a6:	00000097          	auipc	ra,0x0
    800019aa:	266080e7          	jalr	614(ra) # 80001c0c <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    800019ae:	0000a717          	auipc	a4,0xa
    800019b2:	65270713          	addi	a4,a4,1618 # 8000c000 <etext>
    800019b6:	800007b7          	lui	a5,0x80000
    800019ba:	97ba                	add	a5,a5,a4
    800019bc:	4729                	li	a4,10
    800019be:	86be                	mv	a3,a5
    800019c0:	4785                	li	a5,1
    800019c2:	01f79613          	slli	a2,a5,0x1f
    800019c6:	4785                	li	a5,1
    800019c8:	01f79593          	slli	a1,a5,0x1f
    800019cc:	fe843503          	ld	a0,-24(s0)
    800019d0:	00000097          	auipc	ra,0x0
    800019d4:	23c080e7          	jalr	572(ra) # 80001c0c <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    800019d8:	0000a597          	auipc	a1,0xa
    800019dc:	62858593          	addi	a1,a1,1576 # 8000c000 <etext>
    800019e0:	0000a617          	auipc	a2,0xa
    800019e4:	62060613          	addi	a2,a2,1568 # 8000c000 <etext>
    800019e8:	0000a797          	auipc	a5,0xa
    800019ec:	61878793          	addi	a5,a5,1560 # 8000c000 <etext>
    800019f0:	4745                	li	a4,17
    800019f2:	076e                	slli	a4,a4,0x1b
    800019f4:	40f707b3          	sub	a5,a4,a5
    800019f8:	4719                	li	a4,6
    800019fa:	86be                	mv	a3,a5
    800019fc:	fe843503          	ld	a0,-24(s0)
    80001a00:	00000097          	auipc	ra,0x0
    80001a04:	20c080e7          	jalr	524(ra) # 80001c0c <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001a08:	00009797          	auipc	a5,0x9
    80001a0c:	5f878793          	addi	a5,a5,1528 # 8000b000 <_trampoline>
    80001a10:	4729                	li	a4,10
    80001a12:	6685                	lui	a3,0x1
    80001a14:	863e                	mv	a2,a5
    80001a16:	040007b7          	lui	a5,0x4000
    80001a1a:	17fd                	addi	a5,a5,-1
    80001a1c:	00c79593          	slli	a1,a5,0xc
    80001a20:	fe843503          	ld	a0,-24(s0)
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	1e8080e7          	jalr	488(ra) # 80001c0c <kvmmap>

  // map kernel stacks
  proc_mapstacks(kpgtbl);
    80001a2c:	fe843503          	ld	a0,-24(s0)
    80001a30:	00001097          	auipc	ra,0x1
    80001a34:	c04080e7          	jalr	-1020(ra) # 80002634 <proc_mapstacks>
  
  return kpgtbl;
    80001a38:	fe843783          	ld	a5,-24(s0)
}
    80001a3c:	853e                	mv	a0,a5
    80001a3e:	60e2                	ld	ra,24(sp)
    80001a40:	6442                	ld	s0,16(sp)
    80001a42:	6105                	addi	sp,sp,32
    80001a44:	8082                	ret

0000000080001a46 <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001a46:	1141                	addi	sp,sp,-16
    80001a48:	e406                	sd	ra,8(sp)
    80001a4a:	e022                	sd	s0,0(sp)
    80001a4c:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001a4e:	00000097          	auipc	ra,0x0
    80001a52:	ef2080e7          	jalr	-270(ra) # 80001940 <kvmmake>
    80001a56:	872a                	mv	a4,a0
    80001a58:	0000b797          	auipc	a5,0xb
    80001a5c:	5c078793          	addi	a5,a5,1472 # 8000d018 <kernel_pagetable>
    80001a60:	e398                	sd	a4,0(a5)
}
    80001a62:	0001                	nop
    80001a64:	60a2                	ld	ra,8(sp)
    80001a66:	6402                	ld	s0,0(sp)
    80001a68:	0141                	addi	sp,sp,16
    80001a6a:	8082                	ret

0000000080001a6c <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80001a6c:	1141                	addi	sp,sp,-16
    80001a6e:	e406                	sd	ra,8(sp)
    80001a70:	e022                	sd	s0,0(sp)
    80001a72:	0800                	addi	s0,sp,16
  w_satp(MAKE_SATP(kernel_pagetable));
    80001a74:	0000b797          	auipc	a5,0xb
    80001a78:	5a478793          	addi	a5,a5,1444 # 8000d018 <kernel_pagetable>
    80001a7c:	639c                	ld	a5,0(a5)
    80001a7e:	00c7d713          	srli	a4,a5,0xc
    80001a82:	57fd                	li	a5,-1
    80001a84:	17fe                	slli	a5,a5,0x3f
    80001a86:	8fd9                	or	a5,a5,a4
    80001a88:	853e                	mv	a0,a5
    80001a8a:	00000097          	auipc	ra,0x0
    80001a8e:	e8a080e7          	jalr	-374(ra) # 80001914 <w_satp>
  sfence_vma();
    80001a92:	00000097          	auipc	ra,0x0
    80001a96:	e9c080e7          	jalr	-356(ra) # 8000192e <sfence_vma>
}
    80001a9a:	0001                	nop
    80001a9c:	60a2                	ld	ra,8(sp)
    80001a9e:	6402                	ld	s0,0(sp)
    80001aa0:	0141                	addi	sp,sp,16
    80001aa2:	8082                	ret

0000000080001aa4 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80001aa4:	7139                	addi	sp,sp,-64
    80001aa6:	fc06                	sd	ra,56(sp)
    80001aa8:	f822                	sd	s0,48(sp)
    80001aaa:	0080                	addi	s0,sp,64
    80001aac:	fca43c23          	sd	a0,-40(s0)
    80001ab0:	fcb43823          	sd	a1,-48(s0)
    80001ab4:	87b2                	mv	a5,a2
    80001ab6:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80001aba:	fd043703          	ld	a4,-48(s0)
    80001abe:	57fd                	li	a5,-1
    80001ac0:	83e9                	srli	a5,a5,0x1a
    80001ac2:	00e7fa63          	bgeu	a5,a4,80001ad6 <walk+0x32>
    panic("walk");
    80001ac6:	0000a517          	auipc	a0,0xa
    80001aca:	5f250513          	addi	a0,a0,1522 # 8000c0b8 <etext+0xb8>
    80001ace:	fffff097          	auipc	ra,0xfffff
    80001ad2:	1b0080e7          	jalr	432(ra) # 80000c7e <panic>

  for(int level = 2; level > 0; level--) {
    80001ad6:	4789                	li	a5,2
    80001ad8:	fef42623          	sw	a5,-20(s0)
    80001adc:	a849                	j	80001b6e <walk+0xca>
    pte_t *pte = &pagetable[PX(level, va)];
    80001ade:	fec42703          	lw	a4,-20(s0)
    80001ae2:	87ba                	mv	a5,a4
    80001ae4:	0037979b          	slliw	a5,a5,0x3
    80001ae8:	9fb9                	addw	a5,a5,a4
    80001aea:	2781                	sext.w	a5,a5
    80001aec:	27b1                	addiw	a5,a5,12
    80001aee:	2781                	sext.w	a5,a5
    80001af0:	873e                	mv	a4,a5
    80001af2:	fd043783          	ld	a5,-48(s0)
    80001af6:	00e7d7b3          	srl	a5,a5,a4
    80001afa:	1ff7f793          	andi	a5,a5,511
    80001afe:	078e                	slli	a5,a5,0x3
    80001b00:	fd843703          	ld	a4,-40(s0)
    80001b04:	97ba                	add	a5,a5,a4
    80001b06:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    80001b0a:	fe043783          	ld	a5,-32(s0)
    80001b0e:	639c                	ld	a5,0(a5)
    80001b10:	8b85                	andi	a5,a5,1
    80001b12:	cb89                	beqz	a5,80001b24 <walk+0x80>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001b14:	fe043783          	ld	a5,-32(s0)
    80001b18:	639c                	ld	a5,0(a5)
    80001b1a:	83a9                	srli	a5,a5,0xa
    80001b1c:	07b2                	slli	a5,a5,0xc
    80001b1e:	fcf43c23          	sd	a5,-40(s0)
    80001b22:	a089                	j	80001b64 <walk+0xc0>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001b24:	fcc42783          	lw	a5,-52(s0)
    80001b28:	2781                	sext.w	a5,a5
    80001b2a:	cb91                	beqz	a5,80001b3e <walk+0x9a>
    80001b2c:	fffff097          	auipc	ra,0xfffff
    80001b30:	5ee080e7          	jalr	1518(ra) # 8000111a <kalloc>
    80001b34:	fca43c23          	sd	a0,-40(s0)
    80001b38:	fd843783          	ld	a5,-40(s0)
    80001b3c:	e399                	bnez	a5,80001b42 <walk+0x9e>
        return 0;
    80001b3e:	4781                	li	a5,0
    80001b40:	a0a9                	j	80001b8a <walk+0xe6>
      memset(pagetable, 0, PGSIZE);
    80001b42:	6605                	lui	a2,0x1
    80001b44:	4581                	li	a1,0
    80001b46:	fd843503          	ld	a0,-40(s0)
    80001b4a:	00000097          	auipc	ra,0x0
    80001b4e:	8f8080e7          	jalr	-1800(ra) # 80001442 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001b52:	fd843783          	ld	a5,-40(s0)
    80001b56:	83b1                	srli	a5,a5,0xc
    80001b58:	07aa                	slli	a5,a5,0xa
    80001b5a:	0017e713          	ori	a4,a5,1
    80001b5e:	fe043783          	ld	a5,-32(s0)
    80001b62:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001b64:	fec42783          	lw	a5,-20(s0)
    80001b68:	37fd                	addiw	a5,a5,-1
    80001b6a:	fef42623          	sw	a5,-20(s0)
    80001b6e:	fec42783          	lw	a5,-20(s0)
    80001b72:	2781                	sext.w	a5,a5
    80001b74:	f6f045e3          	bgtz	a5,80001ade <walk+0x3a>
    }
  }
  return &pagetable[PX(0, va)];
    80001b78:	fd043783          	ld	a5,-48(s0)
    80001b7c:	83b1                	srli	a5,a5,0xc
    80001b7e:	1ff7f793          	andi	a5,a5,511
    80001b82:	078e                	slli	a5,a5,0x3
    80001b84:	fd843703          	ld	a4,-40(s0)
    80001b88:	97ba                	add	a5,a5,a4
}
    80001b8a:	853e                	mv	a0,a5
    80001b8c:	70e2                	ld	ra,56(sp)
    80001b8e:	7442                	ld	s0,48(sp)
    80001b90:	6121                	addi	sp,sp,64
    80001b92:	8082                	ret

0000000080001b94 <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001b94:	7179                	addi	sp,sp,-48
    80001b96:	f406                	sd	ra,40(sp)
    80001b98:	f022                	sd	s0,32(sp)
    80001b9a:	1800                	addi	s0,sp,48
    80001b9c:	fca43c23          	sd	a0,-40(s0)
    80001ba0:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001ba4:	fd043703          	ld	a4,-48(s0)
    80001ba8:	57fd                	li	a5,-1
    80001baa:	83e9                	srli	a5,a5,0x1a
    80001bac:	00e7f463          	bgeu	a5,a4,80001bb4 <walkaddr+0x20>
    return 0;
    80001bb0:	4781                	li	a5,0
    80001bb2:	a881                	j	80001c02 <walkaddr+0x6e>

  pte = walk(pagetable, va, 0);
    80001bb4:	4601                	li	a2,0
    80001bb6:	fd043583          	ld	a1,-48(s0)
    80001bba:	fd843503          	ld	a0,-40(s0)
    80001bbe:	00000097          	auipc	ra,0x0
    80001bc2:	ee6080e7          	jalr	-282(ra) # 80001aa4 <walk>
    80001bc6:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001bca:	fe843783          	ld	a5,-24(s0)
    80001bce:	e399                	bnez	a5,80001bd4 <walkaddr+0x40>
    return 0;
    80001bd0:	4781                	li	a5,0
    80001bd2:	a805                	j	80001c02 <walkaddr+0x6e>
  if((*pte & PTE_V) == 0)
    80001bd4:	fe843783          	ld	a5,-24(s0)
    80001bd8:	639c                	ld	a5,0(a5)
    80001bda:	8b85                	andi	a5,a5,1
    80001bdc:	e399                	bnez	a5,80001be2 <walkaddr+0x4e>
    return 0;
    80001bde:	4781                	li	a5,0
    80001be0:	a00d                	j	80001c02 <walkaddr+0x6e>
  if((*pte & PTE_U) == 0)
    80001be2:	fe843783          	ld	a5,-24(s0)
    80001be6:	639c                	ld	a5,0(a5)
    80001be8:	8bc1                	andi	a5,a5,16
    80001bea:	e399                	bnez	a5,80001bf0 <walkaddr+0x5c>
    return 0;
    80001bec:	4781                	li	a5,0
    80001bee:	a811                	j	80001c02 <walkaddr+0x6e>
  pa = PTE2PA(*pte);
    80001bf0:	fe843783          	ld	a5,-24(s0)
    80001bf4:	639c                	ld	a5,0(a5)
    80001bf6:	83a9                	srli	a5,a5,0xa
    80001bf8:	07b2                	slli	a5,a5,0xc
    80001bfa:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001bfe:	fe043783          	ld	a5,-32(s0)
}
    80001c02:	853e                	mv	a0,a5
    80001c04:	70a2                	ld	ra,40(sp)
    80001c06:	7402                	ld	s0,32(sp)
    80001c08:	6145                	addi	sp,sp,48
    80001c0a:	8082                	ret

0000000080001c0c <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001c0c:	7139                	addi	sp,sp,-64
    80001c0e:	fc06                	sd	ra,56(sp)
    80001c10:	f822                	sd	s0,48(sp)
    80001c12:	0080                	addi	s0,sp,64
    80001c14:	fea43423          	sd	a0,-24(s0)
    80001c18:	feb43023          	sd	a1,-32(s0)
    80001c1c:	fcc43c23          	sd	a2,-40(s0)
    80001c20:	fcd43823          	sd	a3,-48(s0)
    80001c24:	87ba                	mv	a5,a4
    80001c26:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001c2a:	fcc42783          	lw	a5,-52(s0)
    80001c2e:	873e                	mv	a4,a5
    80001c30:	fd843683          	ld	a3,-40(s0)
    80001c34:	fd043603          	ld	a2,-48(s0)
    80001c38:	fe043583          	ld	a1,-32(s0)
    80001c3c:	fe843503          	ld	a0,-24(s0)
    80001c40:	00000097          	auipc	ra,0x0
    80001c44:	026080e7          	jalr	38(ra) # 80001c66 <mappages>
    80001c48:	87aa                	mv	a5,a0
    80001c4a:	cb89                	beqz	a5,80001c5c <kvmmap+0x50>
    panic("kvmmap");
    80001c4c:	0000a517          	auipc	a0,0xa
    80001c50:	47450513          	addi	a0,a0,1140 # 8000c0c0 <etext+0xc0>
    80001c54:	fffff097          	auipc	ra,0xfffff
    80001c58:	02a080e7          	jalr	42(ra) # 80000c7e <panic>
}
    80001c5c:	0001                	nop
    80001c5e:	70e2                	ld	ra,56(sp)
    80001c60:	7442                	ld	s0,48(sp)
    80001c62:	6121                	addi	sp,sp,64
    80001c64:	8082                	ret

0000000080001c66 <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001c66:	711d                	addi	sp,sp,-96
    80001c68:	ec86                	sd	ra,88(sp)
    80001c6a:	e8a2                	sd	s0,80(sp)
    80001c6c:	1080                	addi	s0,sp,96
    80001c6e:	fca43423          	sd	a0,-56(s0)
    80001c72:	fcb43023          	sd	a1,-64(s0)
    80001c76:	fac43c23          	sd	a2,-72(s0)
    80001c7a:	fad43823          	sd	a3,-80(s0)
    80001c7e:	87ba                	mv	a5,a4
    80001c80:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80001c84:	fb843783          	ld	a5,-72(s0)
    80001c88:	eb89                	bnez	a5,80001c9a <mappages+0x34>
    panic("mappages: size");
    80001c8a:	0000a517          	auipc	a0,0xa
    80001c8e:	43e50513          	addi	a0,a0,1086 # 8000c0c8 <etext+0xc8>
    80001c92:	fffff097          	auipc	ra,0xfffff
    80001c96:	fec080e7          	jalr	-20(ra) # 80000c7e <panic>
  
  a = PGROUNDDOWN(va);
    80001c9a:	fc043703          	ld	a4,-64(s0)
    80001c9e:	77fd                	lui	a5,0xfffff
    80001ca0:	8ff9                	and	a5,a5,a4
    80001ca2:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001ca6:	fc043703          	ld	a4,-64(s0)
    80001caa:	fb843783          	ld	a5,-72(s0)
    80001cae:	97ba                	add	a5,a5,a4
    80001cb0:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ffd4fff>
    80001cb4:	77fd                	lui	a5,0xfffff
    80001cb6:	8ff9                	and	a5,a5,a4
    80001cb8:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001cbc:	4605                	li	a2,1
    80001cbe:	fe843583          	ld	a1,-24(s0)
    80001cc2:	fc843503          	ld	a0,-56(s0)
    80001cc6:	00000097          	auipc	ra,0x0
    80001cca:	dde080e7          	jalr	-546(ra) # 80001aa4 <walk>
    80001cce:	fca43c23          	sd	a0,-40(s0)
    80001cd2:	fd843783          	ld	a5,-40(s0)
    80001cd6:	e399                	bnez	a5,80001cdc <mappages+0x76>
      return -1;
    80001cd8:	57fd                	li	a5,-1
    80001cda:	a085                	j	80001d3a <mappages+0xd4>
    if(*pte & PTE_V)
    80001cdc:	fd843783          	ld	a5,-40(s0)
    80001ce0:	639c                	ld	a5,0(a5)
    80001ce2:	8b85                	andi	a5,a5,1
    80001ce4:	cb89                	beqz	a5,80001cf6 <mappages+0x90>
      panic("mappages: remap");
    80001ce6:	0000a517          	auipc	a0,0xa
    80001cea:	3f250513          	addi	a0,a0,1010 # 8000c0d8 <etext+0xd8>
    80001cee:	fffff097          	auipc	ra,0xfffff
    80001cf2:	f90080e7          	jalr	-112(ra) # 80000c7e <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001cf6:	fb043783          	ld	a5,-80(s0)
    80001cfa:	83b1                	srli	a5,a5,0xc
    80001cfc:	00a79713          	slli	a4,a5,0xa
    80001d00:	fac42783          	lw	a5,-84(s0)
    80001d04:	8fd9                	or	a5,a5,a4
    80001d06:	0017e713          	ori	a4,a5,1
    80001d0a:	fd843783          	ld	a5,-40(s0)
    80001d0e:	e398                	sd	a4,0(a5)
    if(a == last)
    80001d10:	fe843703          	ld	a4,-24(s0)
    80001d14:	fe043783          	ld	a5,-32(s0)
    80001d18:	00f70f63          	beq	a4,a5,80001d36 <mappages+0xd0>
      break;
    a += PGSIZE;
    80001d1c:	fe843703          	ld	a4,-24(s0)
    80001d20:	6785                	lui	a5,0x1
    80001d22:	97ba                	add	a5,a5,a4
    80001d24:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001d28:	fb043703          	ld	a4,-80(s0)
    80001d2c:	6785                	lui	a5,0x1
    80001d2e:	97ba                	add	a5,a5,a4
    80001d30:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80001d34:	b761                	j	80001cbc <mappages+0x56>
      break;
    80001d36:	0001                	nop
  }
  return 0;
    80001d38:	4781                	li	a5,0
}
    80001d3a:	853e                	mv	a0,a5
    80001d3c:	60e6                	ld	ra,88(sp)
    80001d3e:	6446                	ld	s0,80(sp)
    80001d40:	6125                	addi	sp,sp,96
    80001d42:	8082                	ret

0000000080001d44 <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80001d44:	715d                	addi	sp,sp,-80
    80001d46:	e486                	sd	ra,72(sp)
    80001d48:	e0a2                	sd	s0,64(sp)
    80001d4a:	0880                	addi	s0,sp,80
    80001d4c:	fca43423          	sd	a0,-56(s0)
    80001d50:	fcb43023          	sd	a1,-64(s0)
    80001d54:	fac43c23          	sd	a2,-72(s0)
    80001d58:	87b6                	mv	a5,a3
    80001d5a:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80001d5e:	fc043703          	ld	a4,-64(s0)
    80001d62:	6785                	lui	a5,0x1
    80001d64:	17fd                	addi	a5,a5,-1
    80001d66:	8ff9                	and	a5,a5,a4
    80001d68:	cb89                	beqz	a5,80001d7a <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80001d6a:	0000a517          	auipc	a0,0xa
    80001d6e:	37e50513          	addi	a0,a0,894 # 8000c0e8 <etext+0xe8>
    80001d72:	fffff097          	auipc	ra,0xfffff
    80001d76:	f0c080e7          	jalr	-244(ra) # 80000c7e <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001d7a:	fc043783          	ld	a5,-64(s0)
    80001d7e:	fef43423          	sd	a5,-24(s0)
    80001d82:	a045                	j	80001e22 <uvmunmap+0xde>
    if((pte = walk(pagetable, a, 0)) == 0)
    80001d84:	4601                	li	a2,0
    80001d86:	fe843583          	ld	a1,-24(s0)
    80001d8a:	fc843503          	ld	a0,-56(s0)
    80001d8e:	00000097          	auipc	ra,0x0
    80001d92:	d16080e7          	jalr	-746(ra) # 80001aa4 <walk>
    80001d96:	fea43023          	sd	a0,-32(s0)
    80001d9a:	fe043783          	ld	a5,-32(s0)
    80001d9e:	eb89                	bnez	a5,80001db0 <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80001da0:	0000a517          	auipc	a0,0xa
    80001da4:	36050513          	addi	a0,a0,864 # 8000c100 <etext+0x100>
    80001da8:	fffff097          	auipc	ra,0xfffff
    80001dac:	ed6080e7          	jalr	-298(ra) # 80000c7e <panic>
    if((*pte & PTE_V) == 0)
    80001db0:	fe043783          	ld	a5,-32(s0)
    80001db4:	639c                	ld	a5,0(a5)
    80001db6:	8b85                	andi	a5,a5,1
    80001db8:	eb89                	bnez	a5,80001dca <uvmunmap+0x86>
      panic("uvmunmap: not mapped");
    80001dba:	0000a517          	auipc	a0,0xa
    80001dbe:	35650513          	addi	a0,a0,854 # 8000c110 <etext+0x110>
    80001dc2:	fffff097          	auipc	ra,0xfffff
    80001dc6:	ebc080e7          	jalr	-324(ra) # 80000c7e <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    80001dca:	fe043783          	ld	a5,-32(s0)
    80001dce:	639c                	ld	a5,0(a5)
    80001dd0:	3ff7f713          	andi	a4,a5,1023
    80001dd4:	4785                	li	a5,1
    80001dd6:	00f71a63          	bne	a4,a5,80001dea <uvmunmap+0xa6>
      panic("uvmunmap: not a leaf");
    80001dda:	0000a517          	auipc	a0,0xa
    80001dde:	34e50513          	addi	a0,a0,846 # 8000c128 <etext+0x128>
    80001de2:	fffff097          	auipc	ra,0xfffff
    80001de6:	e9c080e7          	jalr	-356(ra) # 80000c7e <panic>
    if(do_free){
    80001dea:	fb442783          	lw	a5,-76(s0)
    80001dee:	2781                	sext.w	a5,a5
    80001df0:	cf99                	beqz	a5,80001e0e <uvmunmap+0xca>
      uint64 pa = PTE2PA(*pte);
    80001df2:	fe043783          	ld	a5,-32(s0)
    80001df6:	639c                	ld	a5,0(a5)
    80001df8:	83a9                	srli	a5,a5,0xa
    80001dfa:	07b2                	slli	a5,a5,0xc
    80001dfc:	fcf43c23          	sd	a5,-40(s0)
      kfree((void*)pa);
    80001e00:	fd843783          	ld	a5,-40(s0)
    80001e04:	853e                	mv	a0,a5
    80001e06:	fffff097          	auipc	ra,0xfffff
    80001e0a:	270080e7          	jalr	624(ra) # 80001076 <kfree>
    }
    *pte = 0;
    80001e0e:	fe043783          	ld	a5,-32(s0)
    80001e12:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001e16:	fe843703          	ld	a4,-24(s0)
    80001e1a:	6785                	lui	a5,0x1
    80001e1c:	97ba                	add	a5,a5,a4
    80001e1e:	fef43423          	sd	a5,-24(s0)
    80001e22:	fb843783          	ld	a5,-72(s0)
    80001e26:	00c79713          	slli	a4,a5,0xc
    80001e2a:	fc043783          	ld	a5,-64(s0)
    80001e2e:	97ba                	add	a5,a5,a4
    80001e30:	fe843703          	ld	a4,-24(s0)
    80001e34:	f4f768e3          	bltu	a4,a5,80001d84 <uvmunmap+0x40>
  }
}
    80001e38:	0001                	nop
    80001e3a:	0001                	nop
    80001e3c:	60a6                	ld	ra,72(sp)
    80001e3e:	6406                	ld	s0,64(sp)
    80001e40:	6161                	addi	sp,sp,80
    80001e42:	8082                	ret

0000000080001e44 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80001e44:	1101                	addi	sp,sp,-32
    80001e46:	ec06                	sd	ra,24(sp)
    80001e48:	e822                	sd	s0,16(sp)
    80001e4a:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80001e4c:	fffff097          	auipc	ra,0xfffff
    80001e50:	2ce080e7          	jalr	718(ra) # 8000111a <kalloc>
    80001e54:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80001e58:	fe843783          	ld	a5,-24(s0)
    80001e5c:	e399                	bnez	a5,80001e62 <uvmcreate+0x1e>
    return 0;
    80001e5e:	4781                	li	a5,0
    80001e60:	a819                	j	80001e76 <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    80001e62:	6605                	lui	a2,0x1
    80001e64:	4581                	li	a1,0
    80001e66:	fe843503          	ld	a0,-24(s0)
    80001e6a:	fffff097          	auipc	ra,0xfffff
    80001e6e:	5d8080e7          	jalr	1496(ra) # 80001442 <memset>
  return pagetable;
    80001e72:	fe843783          	ld	a5,-24(s0)
}
    80001e76:	853e                	mv	a0,a5
    80001e78:	60e2                	ld	ra,24(sp)
    80001e7a:	6442                	ld	s0,16(sp)
    80001e7c:	6105                	addi	sp,sp,32
    80001e7e:	8082                	ret

0000000080001e80 <uvminit>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvminit(pagetable_t pagetable, uchar *src, uint sz)
{
    80001e80:	7139                	addi	sp,sp,-64
    80001e82:	fc06                	sd	ra,56(sp)
    80001e84:	f822                	sd	s0,48(sp)
    80001e86:	0080                	addi	s0,sp,64
    80001e88:	fca43c23          	sd	a0,-40(s0)
    80001e8c:	fcb43823          	sd	a1,-48(s0)
    80001e90:	87b2                	mv	a5,a2
    80001e92:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    80001e96:	fcc42783          	lw	a5,-52(s0)
    80001e9a:	0007871b          	sext.w	a4,a5
    80001e9e:	6785                	lui	a5,0x1
    80001ea0:	00f76a63          	bltu	a4,a5,80001eb4 <uvminit+0x34>
    panic("inituvm: more than a page");
    80001ea4:	0000a517          	auipc	a0,0xa
    80001ea8:	29c50513          	addi	a0,a0,668 # 8000c140 <etext+0x140>
    80001eac:	fffff097          	auipc	ra,0xfffff
    80001eb0:	dd2080e7          	jalr	-558(ra) # 80000c7e <panic>
  mem = kalloc();
    80001eb4:	fffff097          	auipc	ra,0xfffff
    80001eb8:	266080e7          	jalr	614(ra) # 8000111a <kalloc>
    80001ebc:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80001ec0:	6605                	lui	a2,0x1
    80001ec2:	4581                	li	a1,0
    80001ec4:	fe843503          	ld	a0,-24(s0)
    80001ec8:	fffff097          	auipc	ra,0xfffff
    80001ecc:	57a080e7          	jalr	1402(ra) # 80001442 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80001ed0:	fe843783          	ld	a5,-24(s0)
    80001ed4:	4779                	li	a4,30
    80001ed6:	86be                	mv	a3,a5
    80001ed8:	6605                	lui	a2,0x1
    80001eda:	4581                	li	a1,0
    80001edc:	fd843503          	ld	a0,-40(s0)
    80001ee0:	00000097          	auipc	ra,0x0
    80001ee4:	d86080e7          	jalr	-634(ra) # 80001c66 <mappages>
  memmove(mem, src, sz);
    80001ee8:	fcc42783          	lw	a5,-52(s0)
    80001eec:	863e                	mv	a2,a5
    80001eee:	fd043583          	ld	a1,-48(s0)
    80001ef2:	fe843503          	ld	a0,-24(s0)
    80001ef6:	fffff097          	auipc	ra,0xfffff
    80001efa:	630080e7          	jalr	1584(ra) # 80001526 <memmove>
}
    80001efe:	0001                	nop
    80001f00:	70e2                	ld	ra,56(sp)
    80001f02:	7442                	ld	s0,48(sp)
    80001f04:	6121                	addi	sp,sp,64
    80001f06:	8082                	ret

0000000080001f08 <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80001f08:	7139                	addi	sp,sp,-64
    80001f0a:	fc06                	sd	ra,56(sp)
    80001f0c:	f822                	sd	s0,48(sp)
    80001f0e:	0080                	addi	s0,sp,64
    80001f10:	fca43c23          	sd	a0,-40(s0)
    80001f14:	fcb43823          	sd	a1,-48(s0)
    80001f18:	fcc43423          	sd	a2,-56(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    80001f1c:	fc843703          	ld	a4,-56(s0)
    80001f20:	fd043783          	ld	a5,-48(s0)
    80001f24:	00f77563          	bgeu	a4,a5,80001f2e <uvmalloc+0x26>
    return oldsz;
    80001f28:	fd043783          	ld	a5,-48(s0)
    80001f2c:	a85d                	j	80001fe2 <uvmalloc+0xda>

  oldsz = PGROUNDUP(oldsz);
    80001f2e:	fd043703          	ld	a4,-48(s0)
    80001f32:	6785                	lui	a5,0x1
    80001f34:	17fd                	addi	a5,a5,-1
    80001f36:	973e                	add	a4,a4,a5
    80001f38:	77fd                	lui	a5,0xfffff
    80001f3a:	8ff9                	and	a5,a5,a4
    80001f3c:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001f40:	fd043783          	ld	a5,-48(s0)
    80001f44:	fef43423          	sd	a5,-24(s0)
    80001f48:	a069                	j	80001fd2 <uvmalloc+0xca>
    mem = kalloc();
    80001f4a:	fffff097          	auipc	ra,0xfffff
    80001f4e:	1d0080e7          	jalr	464(ra) # 8000111a <kalloc>
    80001f52:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    80001f56:	fe043783          	ld	a5,-32(s0)
    80001f5a:	ef89                	bnez	a5,80001f74 <uvmalloc+0x6c>
      uvmdealloc(pagetable, a, oldsz);
    80001f5c:	fd043603          	ld	a2,-48(s0)
    80001f60:	fe843583          	ld	a1,-24(s0)
    80001f64:	fd843503          	ld	a0,-40(s0)
    80001f68:	00000097          	auipc	ra,0x0
    80001f6c:	084080e7          	jalr	132(ra) # 80001fec <uvmdealloc>
      return 0;
    80001f70:	4781                	li	a5,0
    80001f72:	a885                	j	80001fe2 <uvmalloc+0xda>
    }
    memset(mem, 0, PGSIZE);
    80001f74:	6605                	lui	a2,0x1
    80001f76:	4581                	li	a1,0
    80001f78:	fe043503          	ld	a0,-32(s0)
    80001f7c:	fffff097          	auipc	ra,0xfffff
    80001f80:	4c6080e7          	jalr	1222(ra) # 80001442 <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0){
    80001f84:	fe043783          	ld	a5,-32(s0)
    80001f88:	4779                	li	a4,30
    80001f8a:	86be                	mv	a3,a5
    80001f8c:	6605                	lui	a2,0x1
    80001f8e:	fe843583          	ld	a1,-24(s0)
    80001f92:	fd843503          	ld	a0,-40(s0)
    80001f96:	00000097          	auipc	ra,0x0
    80001f9a:	cd0080e7          	jalr	-816(ra) # 80001c66 <mappages>
    80001f9e:	87aa                	mv	a5,a0
    80001fa0:	c39d                	beqz	a5,80001fc6 <uvmalloc+0xbe>
      kfree(mem);
    80001fa2:	fe043503          	ld	a0,-32(s0)
    80001fa6:	fffff097          	auipc	ra,0xfffff
    80001faa:	0d0080e7          	jalr	208(ra) # 80001076 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    80001fae:	fd043603          	ld	a2,-48(s0)
    80001fb2:	fe843583          	ld	a1,-24(s0)
    80001fb6:	fd843503          	ld	a0,-40(s0)
    80001fba:	00000097          	auipc	ra,0x0
    80001fbe:	032080e7          	jalr	50(ra) # 80001fec <uvmdealloc>
      return 0;
    80001fc2:	4781                	li	a5,0
    80001fc4:	a839                	j	80001fe2 <uvmalloc+0xda>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80001fc6:	fe843703          	ld	a4,-24(s0)
    80001fca:	6785                	lui	a5,0x1
    80001fcc:	97ba                	add	a5,a5,a4
    80001fce:	fef43423          	sd	a5,-24(s0)
    80001fd2:	fe843703          	ld	a4,-24(s0)
    80001fd6:	fc843783          	ld	a5,-56(s0)
    80001fda:	f6f768e3          	bltu	a4,a5,80001f4a <uvmalloc+0x42>
    }
  }
  return newsz;
    80001fde:	fc843783          	ld	a5,-56(s0)
}
    80001fe2:	853e                	mv	a0,a5
    80001fe4:	70e2                	ld	ra,56(sp)
    80001fe6:	7442                	ld	s0,48(sp)
    80001fe8:	6121                	addi	sp,sp,64
    80001fea:	8082                	ret

0000000080001fec <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80001fec:	7139                	addi	sp,sp,-64
    80001fee:	fc06                	sd	ra,56(sp)
    80001ff0:	f822                	sd	s0,48(sp)
    80001ff2:	0080                	addi	s0,sp,64
    80001ff4:	fca43c23          	sd	a0,-40(s0)
    80001ff8:	fcb43823          	sd	a1,-48(s0)
    80001ffc:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    80002000:	fc843703          	ld	a4,-56(s0)
    80002004:	fd043783          	ld	a5,-48(s0)
    80002008:	00f76563          	bltu	a4,a5,80002012 <uvmdealloc+0x26>
    return oldsz;
    8000200c:	fd043783          	ld	a5,-48(s0)
    80002010:	a885                	j	80002080 <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    80002012:	fc843703          	ld	a4,-56(s0)
    80002016:	6785                	lui	a5,0x1
    80002018:	17fd                	addi	a5,a5,-1
    8000201a:	973e                	add	a4,a4,a5
    8000201c:	77fd                	lui	a5,0xfffff
    8000201e:	8f7d                	and	a4,a4,a5
    80002020:	fd043683          	ld	a3,-48(s0)
    80002024:	6785                	lui	a5,0x1
    80002026:	17fd                	addi	a5,a5,-1
    80002028:	96be                	add	a3,a3,a5
    8000202a:	77fd                	lui	a5,0xfffff
    8000202c:	8ff5                	and	a5,a5,a3
    8000202e:	04f77763          	bgeu	a4,a5,8000207c <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80002032:	fd043703          	ld	a4,-48(s0)
    80002036:	6785                	lui	a5,0x1
    80002038:	17fd                	addi	a5,a5,-1
    8000203a:	973e                	add	a4,a4,a5
    8000203c:	77fd                	lui	a5,0xfffff
    8000203e:	8f7d                	and	a4,a4,a5
    80002040:	fc843683          	ld	a3,-56(s0)
    80002044:	6785                	lui	a5,0x1
    80002046:	17fd                	addi	a5,a5,-1
    80002048:	96be                	add	a3,a3,a5
    8000204a:	77fd                	lui	a5,0xfffff
    8000204c:	8ff5                	and	a5,a5,a3
    8000204e:	40f707b3          	sub	a5,a4,a5
    80002052:	83b1                	srli	a5,a5,0xc
    80002054:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    80002058:	fc843703          	ld	a4,-56(s0)
    8000205c:	6785                	lui	a5,0x1
    8000205e:	17fd                	addi	a5,a5,-1
    80002060:	973e                	add	a4,a4,a5
    80002062:	77fd                	lui	a5,0xfffff
    80002064:	8ff9                	and	a5,a5,a4
    80002066:	fec42703          	lw	a4,-20(s0)
    8000206a:	4685                	li	a3,1
    8000206c:	863a                	mv	a2,a4
    8000206e:	85be                	mv	a1,a5
    80002070:	fd843503          	ld	a0,-40(s0)
    80002074:	00000097          	auipc	ra,0x0
    80002078:	cd0080e7          	jalr	-816(ra) # 80001d44 <uvmunmap>
  }

  return newsz;
    8000207c:	fc843783          	ld	a5,-56(s0)
}
    80002080:	853e                	mv	a0,a5
    80002082:	70e2                	ld	ra,56(sp)
    80002084:	7442                	ld	s0,48(sp)
    80002086:	6121                	addi	sp,sp,64
    80002088:	8082                	ret

000000008000208a <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    8000208a:	7139                	addi	sp,sp,-64
    8000208c:	fc06                	sd	ra,56(sp)
    8000208e:	f822                	sd	s0,48(sp)
    80002090:	0080                	addi	s0,sp,64
    80002092:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80002096:	fe042623          	sw	zero,-20(s0)
    8000209a:	a88d                	j	8000210c <freewalk+0x82>
    pte_t pte = pagetable[i];
    8000209c:	fec42783          	lw	a5,-20(s0)
    800020a0:	078e                	slli	a5,a5,0x3
    800020a2:	fc843703          	ld	a4,-56(s0)
    800020a6:	97ba                	add	a5,a5,a4
    800020a8:	639c                	ld	a5,0(a5)
    800020aa:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800020ae:	fe043783          	ld	a5,-32(s0)
    800020b2:	8b85                	andi	a5,a5,1
    800020b4:	cb9d                	beqz	a5,800020ea <freewalk+0x60>
    800020b6:	fe043783          	ld	a5,-32(s0)
    800020ba:	8bb9                	andi	a5,a5,14
    800020bc:	e79d                	bnez	a5,800020ea <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    800020be:	fe043783          	ld	a5,-32(s0)
    800020c2:	83a9                	srli	a5,a5,0xa
    800020c4:	07b2                	slli	a5,a5,0xc
    800020c6:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    800020ca:	fd843783          	ld	a5,-40(s0)
    800020ce:	853e                	mv	a0,a5
    800020d0:	00000097          	auipc	ra,0x0
    800020d4:	fba080e7          	jalr	-70(ra) # 8000208a <freewalk>
      pagetable[i] = 0;
    800020d8:	fec42783          	lw	a5,-20(s0)
    800020dc:	078e                	slli	a5,a5,0x3
    800020de:	fc843703          	ld	a4,-56(s0)
    800020e2:	97ba                	add	a5,a5,a4
    800020e4:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ffd5000>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800020e8:	a829                	j	80002102 <freewalk+0x78>
    } else if(pte & PTE_V){
    800020ea:	fe043783          	ld	a5,-32(s0)
    800020ee:	8b85                	andi	a5,a5,1
    800020f0:	cb89                	beqz	a5,80002102 <freewalk+0x78>
      panic("freewalk: leaf");
    800020f2:	0000a517          	auipc	a0,0xa
    800020f6:	06e50513          	addi	a0,a0,110 # 8000c160 <etext+0x160>
    800020fa:	fffff097          	auipc	ra,0xfffff
    800020fe:	b84080e7          	jalr	-1148(ra) # 80000c7e <panic>
  for(int i = 0; i < 512; i++){
    80002102:	fec42783          	lw	a5,-20(s0)
    80002106:	2785                	addiw	a5,a5,1
    80002108:	fef42623          	sw	a5,-20(s0)
    8000210c:	fec42783          	lw	a5,-20(s0)
    80002110:	0007871b          	sext.w	a4,a5
    80002114:	1ff00793          	li	a5,511
    80002118:	f8e7d2e3          	bge	a5,a4,8000209c <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    8000211c:	fc843503          	ld	a0,-56(s0)
    80002120:	fffff097          	auipc	ra,0xfffff
    80002124:	f56080e7          	jalr	-170(ra) # 80001076 <kfree>
}
    80002128:	0001                	nop
    8000212a:	70e2                	ld	ra,56(sp)
    8000212c:	7442                	ld	s0,48(sp)
    8000212e:	6121                	addi	sp,sp,64
    80002130:	8082                	ret

0000000080002132 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    80002132:	1101                	addi	sp,sp,-32
    80002134:	ec06                	sd	ra,24(sp)
    80002136:	e822                	sd	s0,16(sp)
    80002138:	1000                	addi	s0,sp,32
    8000213a:	fea43423          	sd	a0,-24(s0)
    8000213e:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    80002142:	fe043783          	ld	a5,-32(s0)
    80002146:	c385                	beqz	a5,80002166 <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    80002148:	fe043703          	ld	a4,-32(s0)
    8000214c:	6785                	lui	a5,0x1
    8000214e:	17fd                	addi	a5,a5,-1
    80002150:	97ba                	add	a5,a5,a4
    80002152:	83b1                	srli	a5,a5,0xc
    80002154:	4685                	li	a3,1
    80002156:	863e                	mv	a2,a5
    80002158:	4581                	li	a1,0
    8000215a:	fe843503          	ld	a0,-24(s0)
    8000215e:	00000097          	auipc	ra,0x0
    80002162:	be6080e7          	jalr	-1050(ra) # 80001d44 <uvmunmap>
  freewalk(pagetable);
    80002166:	fe843503          	ld	a0,-24(s0)
    8000216a:	00000097          	auipc	ra,0x0
    8000216e:	f20080e7          	jalr	-224(ra) # 8000208a <freewalk>
}
    80002172:	0001                	nop
    80002174:	60e2                	ld	ra,24(sp)
    80002176:	6442                	ld	s0,16(sp)
    80002178:	6105                	addi	sp,sp,32
    8000217a:	8082                	ret

000000008000217c <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    8000217c:	711d                	addi	sp,sp,-96
    8000217e:	ec86                	sd	ra,88(sp)
    80002180:	e8a2                	sd	s0,80(sp)
    80002182:	1080                	addi	s0,sp,96
    80002184:	faa43c23          	sd	a0,-72(s0)
    80002188:	fab43823          	sd	a1,-80(s0)
    8000218c:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    80002190:	fe043423          	sd	zero,-24(s0)
    80002194:	a0d9                	j	8000225a <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    80002196:	4601                	li	a2,0
    80002198:	fe843583          	ld	a1,-24(s0)
    8000219c:	fb843503          	ld	a0,-72(s0)
    800021a0:	00000097          	auipc	ra,0x0
    800021a4:	904080e7          	jalr	-1788(ra) # 80001aa4 <walk>
    800021a8:	fea43023          	sd	a0,-32(s0)
    800021ac:	fe043783          	ld	a5,-32(s0)
    800021b0:	eb89                	bnez	a5,800021c2 <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    800021b2:	0000a517          	auipc	a0,0xa
    800021b6:	fbe50513          	addi	a0,a0,-66 # 8000c170 <etext+0x170>
    800021ba:	fffff097          	auipc	ra,0xfffff
    800021be:	ac4080e7          	jalr	-1340(ra) # 80000c7e <panic>
    if((*pte & PTE_V) == 0)
    800021c2:	fe043783          	ld	a5,-32(s0)
    800021c6:	639c                	ld	a5,0(a5)
    800021c8:	8b85                	andi	a5,a5,1
    800021ca:	eb89                	bnez	a5,800021dc <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    800021cc:	0000a517          	auipc	a0,0xa
    800021d0:	fc450513          	addi	a0,a0,-60 # 8000c190 <etext+0x190>
    800021d4:	fffff097          	auipc	ra,0xfffff
    800021d8:	aaa080e7          	jalr	-1366(ra) # 80000c7e <panic>
    pa = PTE2PA(*pte);
    800021dc:	fe043783          	ld	a5,-32(s0)
    800021e0:	639c                	ld	a5,0(a5)
    800021e2:	83a9                	srli	a5,a5,0xa
    800021e4:	07b2                	slli	a5,a5,0xc
    800021e6:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    800021ea:	fe043783          	ld	a5,-32(s0)
    800021ee:	639c                	ld	a5,0(a5)
    800021f0:	2781                	sext.w	a5,a5
    800021f2:	3ff7f793          	andi	a5,a5,1023
    800021f6:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    800021fa:	fffff097          	auipc	ra,0xfffff
    800021fe:	f20080e7          	jalr	-224(ra) # 8000111a <kalloc>
    80002202:	fca43423          	sd	a0,-56(s0)
    80002206:	fc843783          	ld	a5,-56(s0)
    8000220a:	c3a5                	beqz	a5,8000226a <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    8000220c:	fd843783          	ld	a5,-40(s0)
    80002210:	6605                	lui	a2,0x1
    80002212:	85be                	mv	a1,a5
    80002214:	fc843503          	ld	a0,-56(s0)
    80002218:	fffff097          	auipc	ra,0xfffff
    8000221c:	30e080e7          	jalr	782(ra) # 80001526 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    80002220:	fc843783          	ld	a5,-56(s0)
    80002224:	fd442703          	lw	a4,-44(s0)
    80002228:	86be                	mv	a3,a5
    8000222a:	6605                	lui	a2,0x1
    8000222c:	fe843583          	ld	a1,-24(s0)
    80002230:	fb043503          	ld	a0,-80(s0)
    80002234:	00000097          	auipc	ra,0x0
    80002238:	a32080e7          	jalr	-1486(ra) # 80001c66 <mappages>
    8000223c:	87aa                	mv	a5,a0
    8000223e:	cb81                	beqz	a5,8000224e <uvmcopy+0xd2>
      kfree(mem);
    80002240:	fc843503          	ld	a0,-56(s0)
    80002244:	fffff097          	auipc	ra,0xfffff
    80002248:	e32080e7          	jalr	-462(ra) # 80001076 <kfree>
      goto err;
    8000224c:	a005                	j	8000226c <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    8000224e:	fe843703          	ld	a4,-24(s0)
    80002252:	6785                	lui	a5,0x1
    80002254:	97ba                	add	a5,a5,a4
    80002256:	fef43423          	sd	a5,-24(s0)
    8000225a:	fe843703          	ld	a4,-24(s0)
    8000225e:	fa843783          	ld	a5,-88(s0)
    80002262:	f2f76ae3          	bltu	a4,a5,80002196 <uvmcopy+0x1a>
    }
  }
  return 0;
    80002266:	4781                	li	a5,0
    80002268:	a839                	j	80002286 <uvmcopy+0x10a>
      goto err;
    8000226a:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    8000226c:	fe843783          	ld	a5,-24(s0)
    80002270:	83b1                	srli	a5,a5,0xc
    80002272:	4685                	li	a3,1
    80002274:	863e                	mv	a2,a5
    80002276:	4581                	li	a1,0
    80002278:	fb043503          	ld	a0,-80(s0)
    8000227c:	00000097          	auipc	ra,0x0
    80002280:	ac8080e7          	jalr	-1336(ra) # 80001d44 <uvmunmap>
  return -1;
    80002284:	57fd                	li	a5,-1
}
    80002286:	853e                	mv	a0,a5
    80002288:	60e6                	ld	ra,88(sp)
    8000228a:	6446                	ld	s0,80(sp)
    8000228c:	6125                	addi	sp,sp,96
    8000228e:	8082                	ret

0000000080002290 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80002290:	7179                	addi	sp,sp,-48
    80002292:	f406                	sd	ra,40(sp)
    80002294:	f022                	sd	s0,32(sp)
    80002296:	1800                	addi	s0,sp,48
    80002298:	fca43c23          	sd	a0,-40(s0)
    8000229c:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    800022a0:	4601                	li	a2,0
    800022a2:	fd043583          	ld	a1,-48(s0)
    800022a6:	fd843503          	ld	a0,-40(s0)
    800022aa:	fffff097          	auipc	ra,0xfffff
    800022ae:	7fa080e7          	jalr	2042(ra) # 80001aa4 <walk>
    800022b2:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    800022b6:	fe843783          	ld	a5,-24(s0)
    800022ba:	eb89                	bnez	a5,800022cc <uvmclear+0x3c>
    panic("uvmclear");
    800022bc:	0000a517          	auipc	a0,0xa
    800022c0:	ef450513          	addi	a0,a0,-268 # 8000c1b0 <etext+0x1b0>
    800022c4:	fffff097          	auipc	ra,0xfffff
    800022c8:	9ba080e7          	jalr	-1606(ra) # 80000c7e <panic>
  *pte &= ~PTE_U;
    800022cc:	fe843783          	ld	a5,-24(s0)
    800022d0:	639c                	ld	a5,0(a5)
    800022d2:	fef7f713          	andi	a4,a5,-17
    800022d6:	fe843783          	ld	a5,-24(s0)
    800022da:	e398                	sd	a4,0(a5)
}
    800022dc:	0001                	nop
    800022de:	70a2                	ld	ra,40(sp)
    800022e0:	7402                	ld	s0,32(sp)
    800022e2:	6145                	addi	sp,sp,48
    800022e4:	8082                	ret

00000000800022e6 <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    800022e6:	715d                	addi	sp,sp,-80
    800022e8:	e486                	sd	ra,72(sp)
    800022ea:	e0a2                	sd	s0,64(sp)
    800022ec:	0880                	addi	s0,sp,80
    800022ee:	fca43423          	sd	a0,-56(s0)
    800022f2:	fcb43023          	sd	a1,-64(s0)
    800022f6:	fac43c23          	sd	a2,-72(s0)
    800022fa:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800022fe:	a055                	j	800023a2 <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    80002300:	fc043703          	ld	a4,-64(s0)
    80002304:	77fd                	lui	a5,0xfffff
    80002306:	8ff9                	and	a5,a5,a4
    80002308:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    8000230c:	fe043583          	ld	a1,-32(s0)
    80002310:	fc843503          	ld	a0,-56(s0)
    80002314:	00000097          	auipc	ra,0x0
    80002318:	880080e7          	jalr	-1920(ra) # 80001b94 <walkaddr>
    8000231c:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002320:	fd843783          	ld	a5,-40(s0)
    80002324:	e399                	bnez	a5,8000232a <copyout+0x44>
      return -1;
    80002326:	57fd                	li	a5,-1
    80002328:	a049                	j	800023aa <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    8000232a:	fe043703          	ld	a4,-32(s0)
    8000232e:	fc043783          	ld	a5,-64(s0)
    80002332:	8f1d                	sub	a4,a4,a5
    80002334:	6785                	lui	a5,0x1
    80002336:	97ba                	add	a5,a5,a4
    80002338:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    8000233c:	fe843703          	ld	a4,-24(s0)
    80002340:	fb043783          	ld	a5,-80(s0)
    80002344:	00e7f663          	bgeu	a5,a4,80002350 <copyout+0x6a>
      n = len;
    80002348:	fb043783          	ld	a5,-80(s0)
    8000234c:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    80002350:	fc043703          	ld	a4,-64(s0)
    80002354:	fe043783          	ld	a5,-32(s0)
    80002358:	8f1d                	sub	a4,a4,a5
    8000235a:	fd843783          	ld	a5,-40(s0)
    8000235e:	97ba                	add	a5,a5,a4
    80002360:	873e                	mv	a4,a5
    80002362:	fe843783          	ld	a5,-24(s0)
    80002366:	2781                	sext.w	a5,a5
    80002368:	863e                	mv	a2,a5
    8000236a:	fb843583          	ld	a1,-72(s0)
    8000236e:	853a                	mv	a0,a4
    80002370:	fffff097          	auipc	ra,0xfffff
    80002374:	1b6080e7          	jalr	438(ra) # 80001526 <memmove>

    len -= n;
    80002378:	fb043703          	ld	a4,-80(s0)
    8000237c:	fe843783          	ld	a5,-24(s0)
    80002380:	40f707b3          	sub	a5,a4,a5
    80002384:	faf43823          	sd	a5,-80(s0)
    src += n;
    80002388:	fb843703          	ld	a4,-72(s0)
    8000238c:	fe843783          	ld	a5,-24(s0)
    80002390:	97ba                	add	a5,a5,a4
    80002392:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    80002396:	fe043703          	ld	a4,-32(s0)
    8000239a:	6785                	lui	a5,0x1
    8000239c:	97ba                	add	a5,a5,a4
    8000239e:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    800023a2:	fb043783          	ld	a5,-80(s0)
    800023a6:	ffa9                	bnez	a5,80002300 <copyout+0x1a>
  }
  return 0;
    800023a8:	4781                	li	a5,0
}
    800023aa:	853e                	mv	a0,a5
    800023ac:	60a6                	ld	ra,72(sp)
    800023ae:	6406                	ld	s0,64(sp)
    800023b0:	6161                	addi	sp,sp,80
    800023b2:	8082                	ret

00000000800023b4 <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    800023b4:	715d                	addi	sp,sp,-80
    800023b6:	e486                	sd	ra,72(sp)
    800023b8:	e0a2                	sd	s0,64(sp)
    800023ba:	0880                	addi	s0,sp,80
    800023bc:	fca43423          	sd	a0,-56(s0)
    800023c0:	fcb43023          	sd	a1,-64(s0)
    800023c4:	fac43c23          	sd	a2,-72(s0)
    800023c8:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800023cc:	a055                	j	80002470 <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    800023ce:	fb843703          	ld	a4,-72(s0)
    800023d2:	77fd                	lui	a5,0xfffff
    800023d4:	8ff9                	and	a5,a5,a4
    800023d6:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800023da:	fe043583          	ld	a1,-32(s0)
    800023de:	fc843503          	ld	a0,-56(s0)
    800023e2:	fffff097          	auipc	ra,0xfffff
    800023e6:	7b2080e7          	jalr	1970(ra) # 80001b94 <walkaddr>
    800023ea:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    800023ee:	fd843783          	ld	a5,-40(s0)
    800023f2:	e399                	bnez	a5,800023f8 <copyin+0x44>
      return -1;
    800023f4:	57fd                	li	a5,-1
    800023f6:	a049                	j	80002478 <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    800023f8:	fe043703          	ld	a4,-32(s0)
    800023fc:	fb843783          	ld	a5,-72(s0)
    80002400:	8f1d                	sub	a4,a4,a5
    80002402:	6785                	lui	a5,0x1
    80002404:	97ba                	add	a5,a5,a4
    80002406:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    8000240a:	fe843703          	ld	a4,-24(s0)
    8000240e:	fb043783          	ld	a5,-80(s0)
    80002412:	00e7f663          	bgeu	a5,a4,8000241e <copyin+0x6a>
      n = len;
    80002416:	fb043783          	ld	a5,-80(s0)
    8000241a:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    8000241e:	fb843703          	ld	a4,-72(s0)
    80002422:	fe043783          	ld	a5,-32(s0)
    80002426:	8f1d                	sub	a4,a4,a5
    80002428:	fd843783          	ld	a5,-40(s0)
    8000242c:	97ba                	add	a5,a5,a4
    8000242e:	873e                	mv	a4,a5
    80002430:	fe843783          	ld	a5,-24(s0)
    80002434:	2781                	sext.w	a5,a5
    80002436:	863e                	mv	a2,a5
    80002438:	85ba                	mv	a1,a4
    8000243a:	fc043503          	ld	a0,-64(s0)
    8000243e:	fffff097          	auipc	ra,0xfffff
    80002442:	0e8080e7          	jalr	232(ra) # 80001526 <memmove>

    len -= n;
    80002446:	fb043703          	ld	a4,-80(s0)
    8000244a:	fe843783          	ld	a5,-24(s0)
    8000244e:	40f707b3          	sub	a5,a4,a5
    80002452:	faf43823          	sd	a5,-80(s0)
    dst += n;
    80002456:	fc043703          	ld	a4,-64(s0)
    8000245a:	fe843783          	ld	a5,-24(s0)
    8000245e:	97ba                	add	a5,a5,a4
    80002460:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    80002464:	fe043703          	ld	a4,-32(s0)
    80002468:	6785                	lui	a5,0x1
    8000246a:	97ba                	add	a5,a5,a4
    8000246c:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    80002470:	fb043783          	ld	a5,-80(s0)
    80002474:	ffa9                	bnez	a5,800023ce <copyin+0x1a>
  }
  return 0;
    80002476:	4781                	li	a5,0
}
    80002478:	853e                	mv	a0,a5
    8000247a:	60a6                	ld	ra,72(sp)
    8000247c:	6406                	ld	s0,64(sp)
    8000247e:	6161                	addi	sp,sp,80
    80002480:	8082                	ret

0000000080002482 <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    80002482:	711d                	addi	sp,sp,-96
    80002484:	ec86                	sd	ra,88(sp)
    80002486:	e8a2                	sd	s0,80(sp)
    80002488:	1080                	addi	s0,sp,96
    8000248a:	faa43c23          	sd	a0,-72(s0)
    8000248e:	fab43823          	sd	a1,-80(s0)
    80002492:	fac43423          	sd	a2,-88(s0)
    80002496:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    8000249a:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    8000249e:	a0f1                	j	8000256a <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    800024a0:	fa843703          	ld	a4,-88(s0)
    800024a4:	77fd                	lui	a5,0xfffff
    800024a6:	8ff9                	and	a5,a5,a4
    800024a8:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    800024ac:	fd043583          	ld	a1,-48(s0)
    800024b0:	fb843503          	ld	a0,-72(s0)
    800024b4:	fffff097          	auipc	ra,0xfffff
    800024b8:	6e0080e7          	jalr	1760(ra) # 80001b94 <walkaddr>
    800024bc:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    800024c0:	fc843783          	ld	a5,-56(s0)
    800024c4:	e399                	bnez	a5,800024ca <copyinstr+0x48>
      return -1;
    800024c6:	57fd                	li	a5,-1
    800024c8:	a87d                	j	80002586 <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    800024ca:	fd043703          	ld	a4,-48(s0)
    800024ce:	fa843783          	ld	a5,-88(s0)
    800024d2:	8f1d                	sub	a4,a4,a5
    800024d4:	6785                	lui	a5,0x1
    800024d6:	97ba                	add	a5,a5,a4
    800024d8:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    800024dc:	fe843703          	ld	a4,-24(s0)
    800024e0:	fa043783          	ld	a5,-96(s0)
    800024e4:	00e7f663          	bgeu	a5,a4,800024f0 <copyinstr+0x6e>
      n = max;
    800024e8:	fa043783          	ld	a5,-96(s0)
    800024ec:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    800024f0:	fa843703          	ld	a4,-88(s0)
    800024f4:	fd043783          	ld	a5,-48(s0)
    800024f8:	8f1d                	sub	a4,a4,a5
    800024fa:	fc843783          	ld	a5,-56(s0)
    800024fe:	97ba                	add	a5,a5,a4
    80002500:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    80002504:	a891                	j	80002558 <copyinstr+0xd6>
      if(*p == '\0'){
    80002506:	fd843783          	ld	a5,-40(s0)
    8000250a:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    8000250e:	eb89                	bnez	a5,80002520 <copyinstr+0x9e>
        *dst = '\0';
    80002510:	fb043783          	ld	a5,-80(s0)
    80002514:	00078023          	sb	zero,0(a5)
        got_null = 1;
    80002518:	4785                	li	a5,1
    8000251a:	fef42223          	sw	a5,-28(s0)
        break;
    8000251e:	a081                	j	8000255e <copyinstr+0xdc>
      } else {
        *dst = *p;
    80002520:	fd843783          	ld	a5,-40(s0)
    80002524:	0007c703          	lbu	a4,0(a5)
    80002528:	fb043783          	ld	a5,-80(s0)
    8000252c:	00e78023          	sb	a4,0(a5)
      }
      --n;
    80002530:	fe843783          	ld	a5,-24(s0)
    80002534:	17fd                	addi	a5,a5,-1
    80002536:	fef43423          	sd	a5,-24(s0)
      --max;
    8000253a:	fa043783          	ld	a5,-96(s0)
    8000253e:	17fd                	addi	a5,a5,-1
    80002540:	faf43023          	sd	a5,-96(s0)
      p++;
    80002544:	fd843783          	ld	a5,-40(s0)
    80002548:	0785                	addi	a5,a5,1
    8000254a:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    8000254e:	fb043783          	ld	a5,-80(s0)
    80002552:	0785                	addi	a5,a5,1
    80002554:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    80002558:	fe843783          	ld	a5,-24(s0)
    8000255c:	f7cd                	bnez	a5,80002506 <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    8000255e:	fd043703          	ld	a4,-48(s0)
    80002562:	6785                	lui	a5,0x1
    80002564:	97ba                	add	a5,a5,a4
    80002566:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    8000256a:	fe442783          	lw	a5,-28(s0)
    8000256e:	2781                	sext.w	a5,a5
    80002570:	e781                	bnez	a5,80002578 <copyinstr+0xf6>
    80002572:	fa043783          	ld	a5,-96(s0)
    80002576:	f78d                	bnez	a5,800024a0 <copyinstr+0x1e>
  }
  if(got_null){
    80002578:	fe442783          	lw	a5,-28(s0)
    8000257c:	2781                	sext.w	a5,a5
    8000257e:	c399                	beqz	a5,80002584 <copyinstr+0x102>
    return 0;
    80002580:	4781                	li	a5,0
    80002582:	a011                	j	80002586 <copyinstr+0x104>
  } else {
    return -1;
    80002584:	57fd                	li	a5,-1
  }
}
    80002586:	853e                	mv	a0,a5
    80002588:	60e6                	ld	ra,88(sp)
    8000258a:	6446                	ld	s0,80(sp)
    8000258c:	6125                	addi	sp,sp,96
    8000258e:	8082                	ret

0000000080002590 <r_sstatus>:
{
    80002590:	1101                	addi	sp,sp,-32
    80002592:	ec22                	sd	s0,24(sp)
    80002594:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80002596:	100027f3          	csrr	a5,sstatus
    8000259a:	fef43423          	sd	a5,-24(s0)
  return x;
    8000259e:	fe843783          	ld	a5,-24(s0)
}
    800025a2:	853e                	mv	a0,a5
    800025a4:	6462                	ld	s0,24(sp)
    800025a6:	6105                	addi	sp,sp,32
    800025a8:	8082                	ret

00000000800025aa <w_sstatus>:
{
    800025aa:	1101                	addi	sp,sp,-32
    800025ac:	ec22                	sd	s0,24(sp)
    800025ae:	1000                	addi	s0,sp,32
    800025b0:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800025b4:	fe843783          	ld	a5,-24(s0)
    800025b8:	10079073          	csrw	sstatus,a5
}
    800025bc:	0001                	nop
    800025be:	6462                	ld	s0,24(sp)
    800025c0:	6105                	addi	sp,sp,32
    800025c2:	8082                	ret

00000000800025c4 <intr_on>:
{
    800025c4:	1141                	addi	sp,sp,-16
    800025c6:	e406                	sd	ra,8(sp)
    800025c8:	e022                	sd	s0,0(sp)
    800025ca:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800025cc:	00000097          	auipc	ra,0x0
    800025d0:	fc4080e7          	jalr	-60(ra) # 80002590 <r_sstatus>
    800025d4:	87aa                	mv	a5,a0
    800025d6:	0027e793          	ori	a5,a5,2
    800025da:	853e                	mv	a0,a5
    800025dc:	00000097          	auipc	ra,0x0
    800025e0:	fce080e7          	jalr	-50(ra) # 800025aa <w_sstatus>
}
    800025e4:	0001                	nop
    800025e6:	60a2                	ld	ra,8(sp)
    800025e8:	6402                	ld	s0,0(sp)
    800025ea:	0141                	addi	sp,sp,16
    800025ec:	8082                	ret

00000000800025ee <intr_get>:
{
    800025ee:	1101                	addi	sp,sp,-32
    800025f0:	ec06                	sd	ra,24(sp)
    800025f2:	e822                	sd	s0,16(sp)
    800025f4:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800025f6:	00000097          	auipc	ra,0x0
    800025fa:	f9a080e7          	jalr	-102(ra) # 80002590 <r_sstatus>
    800025fe:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80002602:	fe843783          	ld	a5,-24(s0)
    80002606:	8b89                	andi	a5,a5,2
    80002608:	00f037b3          	snez	a5,a5
    8000260c:	0ff7f793          	andi	a5,a5,255
    80002610:	2781                	sext.w	a5,a5
}
    80002612:	853e                	mv	a0,a5
    80002614:	60e2                	ld	ra,24(sp)
    80002616:	6442                	ld	s0,16(sp)
    80002618:	6105                	addi	sp,sp,32
    8000261a:	8082                	ret

000000008000261c <r_tp>:
{
    8000261c:	1101                	addi	sp,sp,-32
    8000261e:	ec22                	sd	s0,24(sp)
    80002620:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80002622:	8792                	mv	a5,tp
    80002624:	fef43423          	sd	a5,-24(s0)
  return x;
    80002628:	fe843783          	ld	a5,-24(s0)
}
    8000262c:	853e                	mv	a0,a5
    8000262e:	6462                	ld	s0,24(sp)
    80002630:	6105                	addi	sp,sp,32
    80002632:	8082                	ret

0000000080002634 <proc_mapstacks>:

// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl) {
    80002634:	7139                	addi	sp,sp,-64
    80002636:	fc06                	sd	ra,56(sp)
    80002638:	f822                	sd	s0,48(sp)
    8000263a:	0080                	addi	s0,sp,64
    8000263c:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    80002640:	00013797          	auipc	a5,0x13
    80002644:	09078793          	addi	a5,a5,144 # 800156d0 <proc>
    80002648:	fef43423          	sd	a5,-24(s0)
    8000264c:	a061                	j	800026d4 <proc_mapstacks+0xa0>
    char *pa = kalloc();
    8000264e:	fffff097          	auipc	ra,0xfffff
    80002652:	acc080e7          	jalr	-1332(ra) # 8000111a <kalloc>
    80002656:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    8000265a:	fe043783          	ld	a5,-32(s0)
    8000265e:	eb89                	bnez	a5,80002670 <proc_mapstacks+0x3c>
      panic("kalloc");
    80002660:	0000a517          	auipc	a0,0xa
    80002664:	b6050513          	addi	a0,a0,-1184 # 8000c1c0 <etext+0x1c0>
    80002668:	ffffe097          	auipc	ra,0xffffe
    8000266c:	616080e7          	jalr	1558(ra) # 80000c7e <panic>
    uint64 va = KSTACK((int) (p - proc));
    80002670:	fe843703          	ld	a4,-24(s0)
    80002674:	00013797          	auipc	a5,0x13
    80002678:	05c78793          	addi	a5,a5,92 # 800156d0 <proc>
    8000267c:	40f707b3          	sub	a5,a4,a5
    80002680:	4037d713          	srai	a4,a5,0x3
    80002684:	0000a797          	auipc	a5,0xa
    80002688:	c3478793          	addi	a5,a5,-972 # 8000c2b8 <etext+0x2b8>
    8000268c:	639c                	ld	a5,0(a5)
    8000268e:	02f707b3          	mul	a5,a4,a5
    80002692:	2781                	sext.w	a5,a5
    80002694:	2785                	addiw	a5,a5,1
    80002696:	2781                	sext.w	a5,a5
    80002698:	00d7979b          	slliw	a5,a5,0xd
    8000269c:	2781                	sext.w	a5,a5
    8000269e:	873e                	mv	a4,a5
    800026a0:	040007b7          	lui	a5,0x4000
    800026a4:	17fd                	addi	a5,a5,-1
    800026a6:	07b2                	slli	a5,a5,0xc
    800026a8:	8f99                	sub	a5,a5,a4
    800026aa:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    800026ae:	fe043783          	ld	a5,-32(s0)
    800026b2:	4719                	li	a4,6
    800026b4:	6685                	lui	a3,0x1
    800026b6:	863e                	mv	a2,a5
    800026b8:	fd843583          	ld	a1,-40(s0)
    800026bc:	fc843503          	ld	a0,-56(s0)
    800026c0:	fffff097          	auipc	ra,0xfffff
    800026c4:	54c080e7          	jalr	1356(ra) # 80001c0c <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    800026c8:	fe843783          	ld	a5,-24(s0)
    800026cc:	19878793          	addi	a5,a5,408 # 4000198 <_entry-0x7bfffe68>
    800026d0:	fef43423          	sd	a5,-24(s0)
    800026d4:	fe843703          	ld	a4,-24(s0)
    800026d8:	00019797          	auipc	a5,0x19
    800026dc:	5f878793          	addi	a5,a5,1528 # 8001bcd0 <pid_lock>
    800026e0:	f6f767e3          	bltu	a4,a5,8000264e <proc_mapstacks+0x1a>
  }
}
    800026e4:	0001                	nop
    800026e6:	0001                	nop
    800026e8:	70e2                	ld	ra,56(sp)
    800026ea:	7442                	ld	s0,48(sp)
    800026ec:	6121                	addi	sp,sp,64
    800026ee:	8082                	ret

00000000800026f0 <procinit>:

// initialize the proc table at boot time.
void
procinit(void)
{
    800026f0:	1101                	addi	sp,sp,-32
    800026f2:	ec06                	sd	ra,24(sp)
    800026f4:	e822                	sd	s0,16(sp)
    800026f6:	1000                	addi	s0,sp,32
  struct proc *p;

    initlock(&mutex, "mutex");
    800026f8:	0000a597          	auipc	a1,0xa
    800026fc:	ad058593          	addi	a1,a1,-1328 # 8000c1c8 <etext+0x1c8>
    80002700:	00013517          	auipc	a0,0x13
    80002704:	bb850513          	addi	a0,a0,-1096 # 800152b8 <mutex>
    80002708:	fffff097          	auipc	ra,0xfffff
    8000270c:	b36080e7          	jalr	-1226(ra) # 8000123e <initlock>
  initlock(&pid_lock, "nextpid");
    80002710:	0000a597          	auipc	a1,0xa
    80002714:	ac058593          	addi	a1,a1,-1344 # 8000c1d0 <etext+0x1d0>
    80002718:	00019517          	auipc	a0,0x19
    8000271c:	5b850513          	addi	a0,a0,1464 # 8001bcd0 <pid_lock>
    80002720:	fffff097          	auipc	ra,0xfffff
    80002724:	b1e080e7          	jalr	-1250(ra) # 8000123e <initlock>
  initlock(&wait_lock, "wait_lock");
    80002728:	0000a597          	auipc	a1,0xa
    8000272c:	ab058593          	addi	a1,a1,-1360 # 8000c1d8 <etext+0x1d8>
    80002730:	00019517          	auipc	a0,0x19
    80002734:	5b850513          	addi	a0,a0,1464 # 8001bce8 <wait_lock>
    80002738:	fffff097          	auipc	ra,0xfffff
    8000273c:	b06080e7          	jalr	-1274(ra) # 8000123e <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002740:	00013797          	auipc	a5,0x13
    80002744:	f9078793          	addi	a5,a5,-112 # 800156d0 <proc>
    80002748:	fef43423          	sd	a5,-24(s0)
    8000274c:	a09d                	j	800027b2 <procinit+0xc2>
      initlock(&p->lock, "proc");
    8000274e:	fe843783          	ld	a5,-24(s0)
    80002752:	0000a597          	auipc	a1,0xa
    80002756:	a9658593          	addi	a1,a1,-1386 # 8000c1e8 <etext+0x1e8>
    8000275a:	853e                	mv	a0,a5
    8000275c:	fffff097          	auipc	ra,0xfffff
    80002760:	ae2080e7          	jalr	-1310(ra) # 8000123e <initlock>
      p->kstack = KSTACK((int) (p - proc));
    80002764:	fe843703          	ld	a4,-24(s0)
    80002768:	00013797          	auipc	a5,0x13
    8000276c:	f6878793          	addi	a5,a5,-152 # 800156d0 <proc>
    80002770:	40f707b3          	sub	a5,a4,a5
    80002774:	4037d713          	srai	a4,a5,0x3
    80002778:	0000a797          	auipc	a5,0xa
    8000277c:	b4078793          	addi	a5,a5,-1216 # 8000c2b8 <etext+0x2b8>
    80002780:	639c                	ld	a5,0(a5)
    80002782:	02f707b3          	mul	a5,a4,a5
    80002786:	2781                	sext.w	a5,a5
    80002788:	2785                	addiw	a5,a5,1
    8000278a:	2781                	sext.w	a5,a5
    8000278c:	00d7979b          	slliw	a5,a5,0xd
    80002790:	2781                	sext.w	a5,a5
    80002792:	873e                	mv	a4,a5
    80002794:	040007b7          	lui	a5,0x4000
    80002798:	17fd                	addi	a5,a5,-1
    8000279a:	07b2                	slli	a5,a5,0xc
    8000279c:	8f99                	sub	a5,a5,a4
    8000279e:	873e                	mv	a4,a5
    800027a0:	fe843783          	ld	a5,-24(s0)
    800027a4:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    800027a6:	fe843783          	ld	a5,-24(s0)
    800027aa:	19878793          	addi	a5,a5,408 # 4000198 <_entry-0x7bfffe68>
    800027ae:	fef43423          	sd	a5,-24(s0)
    800027b2:	fe843703          	ld	a4,-24(s0)
    800027b6:	00019797          	auipc	a5,0x19
    800027ba:	51a78793          	addi	a5,a5,1306 # 8001bcd0 <pid_lock>
    800027be:	f8f768e3          	bltu	a4,a5,8000274e <procinit+0x5e>
  }
}
    800027c2:	0001                	nop
    800027c4:	0001                	nop
    800027c6:	60e2                	ld	ra,24(sp)
    800027c8:	6442                	ld	s0,16(sp)
    800027ca:	6105                	addi	sp,sp,32
    800027cc:	8082                	ret

00000000800027ce <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    800027ce:	1101                	addi	sp,sp,-32
    800027d0:	ec06                	sd	ra,24(sp)
    800027d2:	e822                	sd	s0,16(sp)
    800027d4:	1000                	addi	s0,sp,32
  int id = r_tp();
    800027d6:	00000097          	auipc	ra,0x0
    800027da:	e46080e7          	jalr	-442(ra) # 8000261c <r_tp>
    800027de:	87aa                	mv	a5,a0
    800027e0:	fef42623          	sw	a5,-20(s0)
  return id;
    800027e4:	fec42783          	lw	a5,-20(s0)
}
    800027e8:	853e                	mv	a0,a5
    800027ea:	60e2                	ld	ra,24(sp)
    800027ec:	6442                	ld	s0,16(sp)
    800027ee:	6105                	addi	sp,sp,32
    800027f0:	8082                	ret

00000000800027f2 <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void) {
    800027f2:	1101                	addi	sp,sp,-32
    800027f4:	ec06                	sd	ra,24(sp)
    800027f6:	e822                	sd	s0,16(sp)
    800027f8:	1000                	addi	s0,sp,32
  int id = cpuid();
    800027fa:	00000097          	auipc	ra,0x0
    800027fe:	fd4080e7          	jalr	-44(ra) # 800027ce <cpuid>
    80002802:	87aa                	mv	a5,a0
    80002804:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    80002808:	fec42783          	lw	a5,-20(s0)
    8000280c:	00779713          	slli	a4,a5,0x7
    80002810:	00013797          	auipc	a5,0x13
    80002814:	ac078793          	addi	a5,a5,-1344 # 800152d0 <cpus>
    80002818:	97ba                	add	a5,a5,a4
    8000281a:	fef43023          	sd	a5,-32(s0)
  return c;
    8000281e:	fe043783          	ld	a5,-32(s0)
}
    80002822:	853e                	mv	a0,a5
    80002824:	60e2                	ld	ra,24(sp)
    80002826:	6442                	ld	s0,16(sp)
    80002828:	6105                	addi	sp,sp,32
    8000282a:	8082                	ret

000000008000282c <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void) {
    8000282c:	1101                	addi	sp,sp,-32
    8000282e:	ec06                	sd	ra,24(sp)
    80002830:	e822                	sd	s0,16(sp)
    80002832:	1000                	addi	s0,sp,32
  push_off();
    80002834:	fffff097          	auipc	ra,0xfffff
    80002838:	b38080e7          	jalr	-1224(ra) # 8000136c <push_off>
  struct cpu *c = mycpu();
    8000283c:	00000097          	auipc	ra,0x0
    80002840:	fb6080e7          	jalr	-74(ra) # 800027f2 <mycpu>
    80002844:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    80002848:	fe843783          	ld	a5,-24(s0)
    8000284c:	639c                	ld	a5,0(a5)
    8000284e:	fef43023          	sd	a5,-32(s0)
  pop_off();
    80002852:	fffff097          	auipc	ra,0xfffff
    80002856:	b72080e7          	jalr	-1166(ra) # 800013c4 <pop_off>
  return p;
    8000285a:	fe043783          	ld	a5,-32(s0)
}
    8000285e:	853e                	mv	a0,a5
    80002860:	60e2                	ld	ra,24(sp)
    80002862:	6442                	ld	s0,16(sp)
    80002864:	6105                	addi	sp,sp,32
    80002866:	8082                	ret

0000000080002868 <allocpid>:

int
allocpid() {
    80002868:	1101                	addi	sp,sp,-32
    8000286a:	ec06                	sd	ra,24(sp)
    8000286c:	e822                	sd	s0,16(sp)
    8000286e:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002870:	00019517          	auipc	a0,0x19
    80002874:	46050513          	addi	a0,a0,1120 # 8001bcd0 <pid_lock>
    80002878:	fffff097          	auipc	ra,0xfffff
    8000287c:	9f6080e7          	jalr	-1546(ra) # 8000126e <acquire>
  pid = nextpid;
    80002880:	0000a797          	auipc	a5,0xa
    80002884:	ecc78793          	addi	a5,a5,-308 # 8000c74c <nextpid>
    80002888:	439c                	lw	a5,0(a5)
    8000288a:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    8000288e:	0000a797          	auipc	a5,0xa
    80002892:	ebe78793          	addi	a5,a5,-322 # 8000c74c <nextpid>
    80002896:	439c                	lw	a5,0(a5)
    80002898:	2785                	addiw	a5,a5,1
    8000289a:	0007871b          	sext.w	a4,a5
    8000289e:	0000a797          	auipc	a5,0xa
    800028a2:	eae78793          	addi	a5,a5,-338 # 8000c74c <nextpid>
    800028a6:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    800028a8:	00019517          	auipc	a0,0x19
    800028ac:	42850513          	addi	a0,a0,1064 # 8001bcd0 <pid_lock>
    800028b0:	fffff097          	auipc	ra,0xfffff
    800028b4:	a22080e7          	jalr	-1502(ra) # 800012d2 <release>

  return pid;
    800028b8:	fec42783          	lw	a5,-20(s0)
}
    800028bc:	853e                	mv	a0,a5
    800028be:	60e2                	ld	ra,24(sp)
    800028c0:	6442                	ld	s0,16(sp)
    800028c2:	6105                	addi	sp,sp,32
    800028c4:	8082                	ret

00000000800028c6 <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    800028c6:	1101                	addi	sp,sp,-32
    800028c8:	ec06                	sd	ra,24(sp)
    800028ca:	e822                	sd	s0,16(sp)
    800028cc:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    800028ce:	00013797          	auipc	a5,0x13
    800028d2:	e0278793          	addi	a5,a5,-510 # 800156d0 <proc>
    800028d6:	fef43423          	sd	a5,-24(s0)
    800028da:	a80d                	j	8000290c <allocproc+0x46>
    acquire(&p->lock);
    800028dc:	fe843783          	ld	a5,-24(s0)
    800028e0:	853e                	mv	a0,a5
    800028e2:	fffff097          	auipc	ra,0xfffff
    800028e6:	98c080e7          	jalr	-1652(ra) # 8000126e <acquire>
    if(p->state == UNUSED) {
    800028ea:	fe843783          	ld	a5,-24(s0)
    800028ee:	4f9c                	lw	a5,24(a5)
    800028f0:	cb85                	beqz	a5,80002920 <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    800028f2:	fe843783          	ld	a5,-24(s0)
    800028f6:	853e                	mv	a0,a5
    800028f8:	fffff097          	auipc	ra,0xfffff
    800028fc:	9da080e7          	jalr	-1574(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002900:	fe843783          	ld	a5,-24(s0)
    80002904:	19878793          	addi	a5,a5,408
    80002908:	fef43423          	sd	a5,-24(s0)
    8000290c:	fe843703          	ld	a4,-24(s0)
    80002910:	00019797          	auipc	a5,0x19
    80002914:	3c078793          	addi	a5,a5,960 # 8001bcd0 <pid_lock>
    80002918:	fcf762e3          	bltu	a4,a5,800028dc <allocproc+0x16>
    }
  }
  return 0;
    8000291c:	4781                	li	a5,0
    8000291e:	a2b9                	j	80002a6c <allocproc+0x1a6>
      goto found;
    80002920:	0001                	nop

found:
    procnum++;
    80002922:	0000a797          	auipc	a5,0xa
    80002926:	70678793          	addi	a5,a5,1798 # 8000d028 <procnum>
    8000292a:	439c                	lw	a5,0(a5)
    8000292c:	2785                	addiw	a5,a5,1
    8000292e:	0007871b          	sext.w	a4,a5
    80002932:	0000a797          	auipc	a5,0xa
    80002936:	6f678793          	addi	a5,a5,1782 # 8000d028 <procnum>
    8000293a:	c398                	sw	a4,0(a5)
  p->pid = allocpid();
    8000293c:	00000097          	auipc	ra,0x0
    80002940:	f2c080e7          	jalr	-212(ra) # 80002868 <allocpid>
    80002944:	87aa                	mv	a5,a0
    80002946:	873e                	mv	a4,a5
    80002948:	fe843783          	ld	a5,-24(s0)
    8000294c:	db98                	sw	a4,48(a5)
  p->state = USED;
    8000294e:	fe843783          	ld	a5,-24(s0)
    80002952:	4705                	li	a4,1
    80002954:	cf98                	sw	a4,24(a5)
  p->t = 1;
    80002956:	fe843783          	ld	a5,-24(s0)
    8000295a:	4705                	li	a4,1
    8000295c:	18e7a623          	sw	a4,396(a5)
  p->preempted = 0;
    80002960:	fe843783          	ld	a5,-24(s0)
    80002964:	1807a423          	sw	zero,392(a5)
  p->affinity = -1;
    80002968:	fe843783          	ld	a5,-24(s0)
    8000296c:	577d                	li	a4,-1
    8000296e:	18e7aa23          	sw	a4,404(a5)
  if (algid != 2)
    80002972:	0000a797          	auipc	a5,0xa
    80002976:	6ae78793          	addi	a5,a5,1710 # 8000d020 <algid>
    8000297a:	439c                	lw	a5,0(a5)
    8000297c:	873e                	mv	a4,a5
    8000297e:	4789                	li	a5,2
    80002980:	00f70c63          	beq	a4,a5,80002998 <allocproc+0xd2>
  {
      p->tau = 1;
    80002984:	fe843783          	ld	a5,-24(s0)
    80002988:	4705                	li	a4,1
    8000298a:	16e7a623          	sw	a4,364(a5)
      p->quantum = 0;
    8000298e:	fe843783          	ld	a5,-24(s0)
    80002992:	1807a823          	sw	zero,400(a5)
    80002996:	a811                	j	800029aa <allocproc+0xe4>
  }
  else
  {
      p->tau = 0;
    80002998:	fe843783          	ld	a5,-24(s0)
    8000299c:	1607a623          	sw	zero,364(a5)
      p->quantum = 1;
    800029a0:	fe843783          	ld	a5,-24(s0)
    800029a4:	4705                	li	a4,1
    800029a6:	18e7a823          	sw	a4,400(a5)
  }
  p->left = 0;
    800029aa:	fe843783          	ld	a5,-24(s0)
    800029ae:	1607b823          	sd	zero,368(a5)
  p->right = 0;
    800029b2:	fe843783          	ld	a5,-24(s0)
    800029b6:	1607bc23          	sd	zero,376(a5)
  p->next = 0;
    800029ba:	fe843783          	ld	a5,-24(s0)
    800029be:	1807b023          	sd	zero,384(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    800029c2:	ffffe097          	auipc	ra,0xffffe
    800029c6:	758080e7          	jalr	1880(ra) # 8000111a <kalloc>
    800029ca:	872a                	mv	a4,a0
    800029cc:	fe843783          	ld	a5,-24(s0)
    800029d0:	efb8                	sd	a4,88(a5)
    800029d2:	fe843783          	ld	a5,-24(s0)
    800029d6:	6fbc                	ld	a5,88(a5)
    800029d8:	e385                	bnez	a5,800029f8 <allocproc+0x132>
    freeproc(p);
    800029da:	fe843503          	ld	a0,-24(s0)
    800029de:	00000097          	auipc	ra,0x0
    800029e2:	098080e7          	jalr	152(ra) # 80002a76 <freeproc>
    release(&p->lock);
    800029e6:	fe843783          	ld	a5,-24(s0)
    800029ea:	853e                	mv	a0,a5
    800029ec:	fffff097          	auipc	ra,0xfffff
    800029f0:	8e6080e7          	jalr	-1818(ra) # 800012d2 <release>
    return 0;
    800029f4:	4781                	li	a5,0
    800029f6:	a89d                	j	80002a6c <allocproc+0x1a6>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    800029f8:	fe843503          	ld	a0,-24(s0)
    800029fc:	00000097          	auipc	ra,0x0
    80002a00:	15e080e7          	jalr	350(ra) # 80002b5a <proc_pagetable>
    80002a04:	872a                	mv	a4,a0
    80002a06:	fe843783          	ld	a5,-24(s0)
    80002a0a:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    80002a0c:	fe843783          	ld	a5,-24(s0)
    80002a10:	6bbc                	ld	a5,80(a5)
    80002a12:	e385                	bnez	a5,80002a32 <allocproc+0x16c>
    freeproc(p);
    80002a14:	fe843503          	ld	a0,-24(s0)
    80002a18:	00000097          	auipc	ra,0x0
    80002a1c:	05e080e7          	jalr	94(ra) # 80002a76 <freeproc>
    release(&p->lock);
    80002a20:	fe843783          	ld	a5,-24(s0)
    80002a24:	853e                	mv	a0,a5
    80002a26:	fffff097          	auipc	ra,0xfffff
    80002a2a:	8ac080e7          	jalr	-1876(ra) # 800012d2 <release>
    return 0;
    80002a2e:	4781                	li	a5,0
    80002a30:	a835                	j	80002a6c <allocproc+0x1a6>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80002a32:	fe843783          	ld	a5,-24(s0)
    80002a36:	06078793          	addi	a5,a5,96
    80002a3a:	07000613          	li	a2,112
    80002a3e:	4581                	li	a1,0
    80002a40:	853e                	mv	a0,a5
    80002a42:	fffff097          	auipc	ra,0xfffff
    80002a46:	a00080e7          	jalr	-1536(ra) # 80001442 <memset>
  p->context.ra = (uint64)forkret;
    80002a4a:	00002717          	auipc	a4,0x2
    80002a4e:	ddc70713          	addi	a4,a4,-548 # 80004826 <forkret>
    80002a52:	fe843783          	ld	a5,-24(s0)
    80002a56:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    80002a58:	fe843783          	ld	a5,-24(s0)
    80002a5c:	63b8                	ld	a4,64(a5)
    80002a5e:	6785                	lui	a5,0x1
    80002a60:	973e                	add	a4,a4,a5
    80002a62:	fe843783          	ld	a5,-24(s0)
    80002a66:	f7b8                	sd	a4,104(a5)

  return p;
    80002a68:	fe843783          	ld	a5,-24(s0)
}
    80002a6c:	853e                	mv	a0,a5
    80002a6e:	60e2                	ld	ra,24(sp)
    80002a70:	6442                	ld	s0,16(sp)
    80002a72:	6105                	addi	sp,sp,32
    80002a74:	8082                	ret

0000000080002a76 <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    80002a76:	1101                	addi	sp,sp,-32
    80002a78:	ec06                	sd	ra,24(sp)
    80002a7a:	e822                	sd	s0,16(sp)
    80002a7c:	1000                	addi	s0,sp,32
    80002a7e:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    80002a82:	fe843783          	ld	a5,-24(s0)
    80002a86:	6fbc                	ld	a5,88(a5)
    80002a88:	cb89                	beqz	a5,80002a9a <freeproc+0x24>
    kfree((void*)p->trapframe);
    80002a8a:	fe843783          	ld	a5,-24(s0)
    80002a8e:	6fbc                	ld	a5,88(a5)
    80002a90:	853e                	mv	a0,a5
    80002a92:	ffffe097          	auipc	ra,0xffffe
    80002a96:	5e4080e7          	jalr	1508(ra) # 80001076 <kfree>
  p->trapframe = 0;
    80002a9a:	fe843783          	ld	a5,-24(s0)
    80002a9e:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80002aa2:	fe843783          	ld	a5,-24(s0)
    80002aa6:	6bbc                	ld	a5,80(a5)
    80002aa8:	cf89                	beqz	a5,80002ac2 <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002aaa:	fe843783          	ld	a5,-24(s0)
    80002aae:	6bb8                	ld	a4,80(a5)
    80002ab0:	fe843783          	ld	a5,-24(s0)
    80002ab4:	67bc                	ld	a5,72(a5)
    80002ab6:	85be                	mv	a1,a5
    80002ab8:	853a                	mv	a0,a4
    80002aba:	00000097          	auipc	ra,0x0
    80002abe:	160080e7          	jalr	352(ra) # 80002c1a <proc_freepagetable>
  p->pagetable = 0;
    80002ac2:	fe843783          	ld	a5,-24(s0)
    80002ac6:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80002aca:	fe843783          	ld	a5,-24(s0)
    80002ace:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80002ad2:	fe843783          	ld	a5,-24(s0)
    80002ad6:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    80002ada:	fe843783          	ld	a5,-24(s0)
    80002ade:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    80002ae2:	fe843783          	ld	a5,-24(s0)
    80002ae6:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    80002aea:	fe843783          	ld	a5,-24(s0)
    80002aee:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    80002af2:	fe843783          	ld	a5,-24(s0)
    80002af6:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    80002afa:	fe843783          	ld	a5,-24(s0)
    80002afe:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    80002b02:	fe843783          	ld	a5,-24(s0)
    80002b06:	0007ac23          	sw	zero,24(a5)

  p->tau = 1;
    80002b0a:	fe843783          	ld	a5,-24(s0)
    80002b0e:	4705                	li	a4,1
    80002b10:	16e7a623          	sw	a4,364(a5)
  p->t = 1;
    80002b14:	fe843783          	ld	a5,-24(s0)
    80002b18:	4705                	li	a4,1
    80002b1a:	18e7a623          	sw	a4,396(a5)
  p->left = 0;
    80002b1e:	fe843783          	ld	a5,-24(s0)
    80002b22:	1607b823          	sd	zero,368(a5)
  p->right = 0;
    80002b26:	fe843783          	ld	a5,-24(s0)
    80002b2a:	1607bc23          	sd	zero,376(a5)
  p->next = 0;
    80002b2e:	fe843783          	ld	a5,-24(s0)
    80002b32:	1807b023          	sd	zero,384(a5)
  procnum--;
    80002b36:	0000a797          	auipc	a5,0xa
    80002b3a:	4f278793          	addi	a5,a5,1266 # 8000d028 <procnum>
    80002b3e:	439c                	lw	a5,0(a5)
    80002b40:	37fd                	addiw	a5,a5,-1
    80002b42:	0007871b          	sext.w	a4,a5
    80002b46:	0000a797          	auipc	a5,0xa
    80002b4a:	4e278793          	addi	a5,a5,1250 # 8000d028 <procnum>
    80002b4e:	c398                	sw	a4,0(a5)
}
    80002b50:	0001                	nop
    80002b52:	60e2                	ld	ra,24(sp)
    80002b54:	6442                	ld	s0,16(sp)
    80002b56:	6105                	addi	sp,sp,32
    80002b58:	8082                	ret

0000000080002b5a <proc_pagetable>:

// Create a user page table for a given process,
// with no user memory, but with trampoline pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002b5a:	7179                	addi	sp,sp,-48
    80002b5c:	f406                	sd	ra,40(sp)
    80002b5e:	f022                	sd	s0,32(sp)
    80002b60:	1800                	addi	s0,sp,48
    80002b62:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002b66:	fffff097          	auipc	ra,0xfffff
    80002b6a:	2de080e7          	jalr	734(ra) # 80001e44 <uvmcreate>
    80002b6e:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002b72:	fe843783          	ld	a5,-24(s0)
    80002b76:	e399                	bnez	a5,80002b7c <proc_pagetable+0x22>
    return 0;
    80002b78:	4781                	li	a5,0
    80002b7a:	a859                	j	80002c10 <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002b7c:	00008797          	auipc	a5,0x8
    80002b80:	48478793          	addi	a5,a5,1156 # 8000b000 <_trampoline>
    80002b84:	4729                	li	a4,10
    80002b86:	86be                	mv	a3,a5
    80002b88:	6605                	lui	a2,0x1
    80002b8a:	040007b7          	lui	a5,0x4000
    80002b8e:	17fd                	addi	a5,a5,-1
    80002b90:	00c79593          	slli	a1,a5,0xc
    80002b94:	fe843503          	ld	a0,-24(s0)
    80002b98:	fffff097          	auipc	ra,0xfffff
    80002b9c:	0ce080e7          	jalr	206(ra) # 80001c66 <mappages>
    80002ba0:	87aa                	mv	a5,a0
    80002ba2:	0007db63          	bgez	a5,80002bb8 <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002ba6:	4581                	li	a1,0
    80002ba8:	fe843503          	ld	a0,-24(s0)
    80002bac:	fffff097          	auipc	ra,0xfffff
    80002bb0:	586080e7          	jalr	1414(ra) # 80002132 <uvmfree>
    return 0;
    80002bb4:	4781                	li	a5,0
    80002bb6:	a8a9                	j	80002c10 <proc_pagetable+0xb6>
  }

  // map the trapframe just below TRAMPOLINE, for trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002bb8:	fd843783          	ld	a5,-40(s0)
    80002bbc:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002bbe:	4719                	li	a4,6
    80002bc0:	86be                	mv	a3,a5
    80002bc2:	6605                	lui	a2,0x1
    80002bc4:	020007b7          	lui	a5,0x2000
    80002bc8:	17fd                	addi	a5,a5,-1
    80002bca:	00d79593          	slli	a1,a5,0xd
    80002bce:	fe843503          	ld	a0,-24(s0)
    80002bd2:	fffff097          	auipc	ra,0xfffff
    80002bd6:	094080e7          	jalr	148(ra) # 80001c66 <mappages>
    80002bda:	87aa                	mv	a5,a0
    80002bdc:	0207d863          	bgez	a5,80002c0c <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002be0:	4681                	li	a3,0
    80002be2:	4605                	li	a2,1
    80002be4:	040007b7          	lui	a5,0x4000
    80002be8:	17fd                	addi	a5,a5,-1
    80002bea:	00c79593          	slli	a1,a5,0xc
    80002bee:	fe843503          	ld	a0,-24(s0)
    80002bf2:	fffff097          	auipc	ra,0xfffff
    80002bf6:	152080e7          	jalr	338(ra) # 80001d44 <uvmunmap>
    uvmfree(pagetable, 0);
    80002bfa:	4581                	li	a1,0
    80002bfc:	fe843503          	ld	a0,-24(s0)
    80002c00:	fffff097          	auipc	ra,0xfffff
    80002c04:	532080e7          	jalr	1330(ra) # 80002132 <uvmfree>
    return 0;
    80002c08:	4781                	li	a5,0
    80002c0a:	a019                	j	80002c10 <proc_pagetable+0xb6>
  }

  return pagetable;
    80002c0c:	fe843783          	ld	a5,-24(s0)
}
    80002c10:	853e                	mv	a0,a5
    80002c12:	70a2                	ld	ra,40(sp)
    80002c14:	7402                	ld	s0,32(sp)
    80002c16:	6145                	addi	sp,sp,48
    80002c18:	8082                	ret

0000000080002c1a <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002c1a:	1101                	addi	sp,sp,-32
    80002c1c:	ec06                	sd	ra,24(sp)
    80002c1e:	e822                	sd	s0,16(sp)
    80002c20:	1000                	addi	s0,sp,32
    80002c22:	fea43423          	sd	a0,-24(s0)
    80002c26:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002c2a:	4681                	li	a3,0
    80002c2c:	4605                	li	a2,1
    80002c2e:	040007b7          	lui	a5,0x4000
    80002c32:	17fd                	addi	a5,a5,-1
    80002c34:	00c79593          	slli	a1,a5,0xc
    80002c38:	fe843503          	ld	a0,-24(s0)
    80002c3c:	fffff097          	auipc	ra,0xfffff
    80002c40:	108080e7          	jalr	264(ra) # 80001d44 <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002c44:	4681                	li	a3,0
    80002c46:	4605                	li	a2,1
    80002c48:	020007b7          	lui	a5,0x2000
    80002c4c:	17fd                	addi	a5,a5,-1
    80002c4e:	00d79593          	slli	a1,a5,0xd
    80002c52:	fe843503          	ld	a0,-24(s0)
    80002c56:	fffff097          	auipc	ra,0xfffff
    80002c5a:	0ee080e7          	jalr	238(ra) # 80001d44 <uvmunmap>
  uvmfree(pagetable, sz);
    80002c5e:	fe043583          	ld	a1,-32(s0)
    80002c62:	fe843503          	ld	a0,-24(s0)
    80002c66:	fffff097          	auipc	ra,0xfffff
    80002c6a:	4cc080e7          	jalr	1228(ra) # 80002132 <uvmfree>
}
    80002c6e:	0001                	nop
    80002c70:	60e2                	ld	ra,24(sp)
    80002c72:	6442                	ld	s0,16(sp)
    80002c74:	6105                	addi	sp,sp,32
    80002c76:	8082                	ret

0000000080002c78 <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002c78:	1101                	addi	sp,sp,-32
    80002c7a:	ec06                	sd	ra,24(sp)
    80002c7c:	e822                	sd	s0,16(sp)
    80002c7e:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002c80:	00000097          	auipc	ra,0x0
    80002c84:	c46080e7          	jalr	-954(ra) # 800028c6 <allocproc>
    80002c88:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002c8c:	0000a797          	auipc	a5,0xa
    80002c90:	3ac78793          	addi	a5,a5,940 # 8000d038 <initproc>
    80002c94:	fe843703          	ld	a4,-24(s0)
    80002c98:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy init's instructions
  // and data into it.
  uvminit(p->pagetable, initcode, sizeof(initcode));
    80002c9a:	fe843783          	ld	a5,-24(s0)
    80002c9e:	6bbc                	ld	a5,80(a5)
    80002ca0:	03400613          	li	a2,52
    80002ca4:	0000a597          	auipc	a1,0xa
    80002ca8:	ad458593          	addi	a1,a1,-1324 # 8000c778 <initcode>
    80002cac:	853e                	mv	a0,a5
    80002cae:	fffff097          	auipc	ra,0xfffff
    80002cb2:	1d2080e7          	jalr	466(ra) # 80001e80 <uvminit>
  p->sz = PGSIZE;
    80002cb6:	fe843783          	ld	a5,-24(s0)
    80002cba:	6705                	lui	a4,0x1
    80002cbc:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002cbe:	fe843783          	ld	a5,-24(s0)
    80002cc2:	6fbc                	ld	a5,88(a5)
    80002cc4:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002cc8:	fe843783          	ld	a5,-24(s0)
    80002ccc:	6fbc                	ld	a5,88(a5)
    80002cce:	6705                	lui	a4,0x1
    80002cd0:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002cd2:	fe843783          	ld	a5,-24(s0)
    80002cd6:	15878793          	addi	a5,a5,344
    80002cda:	4641                	li	a2,16
    80002cdc:	00009597          	auipc	a1,0x9
    80002ce0:	51458593          	addi	a1,a1,1300 # 8000c1f0 <etext+0x1f0>
    80002ce4:	853e                	mv	a0,a5
    80002ce6:	fffff097          	auipc	ra,0xfffff
    80002cea:	a60080e7          	jalr	-1440(ra) # 80001746 <safestrcpy>
  p->cwd = namei("/");
    80002cee:	00009517          	auipc	a0,0x9
    80002cf2:	51250513          	addi	a0,a0,1298 # 8000c200 <etext+0x200>
    80002cf6:	00004097          	auipc	ra,0x4
    80002cfa:	612080e7          	jalr	1554(ra) # 80007308 <namei>
    80002cfe:	872a                	mv	a4,a0
    80002d00:	fe843783          	ld	a5,-24(s0)
    80002d04:	14e7b823          	sd	a4,336(a5)

  int preempt = put(p);
    80002d08:	fe843503          	ld	a0,-24(s0)
    80002d0c:	00000097          	auipc	ra,0x0
    80002d10:	61e080e7          	jalr	1566(ra) # 8000332a <put>
    80002d14:	87aa                	mv	a5,a0
    80002d16:	fef42223          	sw	a5,-28(s0)

  release(&p->lock);
    80002d1a:	fe843783          	ld	a5,-24(s0)
    80002d1e:	853e                	mv	a0,a5
    80002d20:	ffffe097          	auipc	ra,0xffffe
    80002d24:	5b2080e7          	jalr	1458(ra) # 800012d2 <release>
  if (preempt)
    80002d28:	fe442783          	lw	a5,-28(s0)
    80002d2c:	2781                	sext.w	a5,a5
    80002d2e:	c789                	beqz	a5,80002d38 <userinit+0xc0>
      yield();
    80002d30:	00002097          	auipc	ra,0x2
    80002d34:	aa8080e7          	jalr	-1368(ra) # 800047d8 <yield>
}
    80002d38:	0001                	nop
    80002d3a:	60e2                	ld	ra,24(sp)
    80002d3c:	6442                	ld	s0,16(sp)
    80002d3e:	6105                	addi	sp,sp,32
    80002d40:	8082                	ret

0000000080002d42 <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002d42:	7179                	addi	sp,sp,-48
    80002d44:	f406                	sd	ra,40(sp)
    80002d46:	f022                	sd	s0,32(sp)
    80002d48:	1800                	addi	s0,sp,48
    80002d4a:	87aa                	mv	a5,a0
    80002d4c:	fcf42e23          	sw	a5,-36(s0)
  uint sz;
  struct proc *p = myproc();
    80002d50:	00000097          	auipc	ra,0x0
    80002d54:	adc080e7          	jalr	-1316(ra) # 8000282c <myproc>
    80002d58:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002d5c:	fe043783          	ld	a5,-32(s0)
    80002d60:	67bc                	ld	a5,72(a5)
    80002d62:	fef42623          	sw	a5,-20(s0)
  if(n > 0){
    80002d66:	fdc42783          	lw	a5,-36(s0)
    80002d6a:	2781                	sext.w	a5,a5
    80002d6c:	02f05e63          	blez	a5,80002da8 <growproc+0x66>
    if((sz = uvmalloc(p->pagetable, sz, sz + n)) == 0) {
    80002d70:	fe043783          	ld	a5,-32(s0)
    80002d74:	6bb4                	ld	a3,80(a5)
    80002d76:	fec46583          	lwu	a1,-20(s0)
    80002d7a:	fdc42783          	lw	a5,-36(s0)
    80002d7e:	fec42703          	lw	a4,-20(s0)
    80002d82:	9fb9                	addw	a5,a5,a4
    80002d84:	2781                	sext.w	a5,a5
    80002d86:	1782                	slli	a5,a5,0x20
    80002d88:	9381                	srli	a5,a5,0x20
    80002d8a:	863e                	mv	a2,a5
    80002d8c:	8536                	mv	a0,a3
    80002d8e:	fffff097          	auipc	ra,0xfffff
    80002d92:	17a080e7          	jalr	378(ra) # 80001f08 <uvmalloc>
    80002d96:	87aa                	mv	a5,a0
    80002d98:	fef42623          	sw	a5,-20(s0)
    80002d9c:	fec42783          	lw	a5,-20(s0)
    80002da0:	2781                	sext.w	a5,a5
    80002da2:	ef95                	bnez	a5,80002dde <growproc+0x9c>
      return -1;
    80002da4:	57fd                	li	a5,-1
    80002da6:	a091                	j	80002dea <growproc+0xa8>
    }
  } else if(n < 0){
    80002da8:	fdc42783          	lw	a5,-36(s0)
    80002dac:	2781                	sext.w	a5,a5
    80002dae:	0207d863          	bgez	a5,80002dde <growproc+0x9c>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002db2:	fe043783          	ld	a5,-32(s0)
    80002db6:	6bb4                	ld	a3,80(a5)
    80002db8:	fec46583          	lwu	a1,-20(s0)
    80002dbc:	fdc42783          	lw	a5,-36(s0)
    80002dc0:	fec42703          	lw	a4,-20(s0)
    80002dc4:	9fb9                	addw	a5,a5,a4
    80002dc6:	2781                	sext.w	a5,a5
    80002dc8:	1782                	slli	a5,a5,0x20
    80002dca:	9381                	srli	a5,a5,0x20
    80002dcc:	863e                	mv	a2,a5
    80002dce:	8536                	mv	a0,a3
    80002dd0:	fffff097          	auipc	ra,0xfffff
    80002dd4:	21c080e7          	jalr	540(ra) # 80001fec <uvmdealloc>
    80002dd8:	87aa                	mv	a5,a0
    80002dda:	fef42623          	sw	a5,-20(s0)
  }
  p->sz = sz;
    80002dde:	fec46703          	lwu	a4,-20(s0)
    80002de2:	fe043783          	ld	a5,-32(s0)
    80002de6:	e7b8                	sd	a4,72(a5)
  return 0;
    80002de8:	4781                	li	a5,0
}
    80002dea:	853e                	mv	a0,a5
    80002dec:	70a2                	ld	ra,40(sp)
    80002dee:	7402                	ld	s0,32(sp)
    80002df0:	6145                	addi	sp,sp,48
    80002df2:	8082                	ret

0000000080002df4 <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002df4:	7179                	addi	sp,sp,-48
    80002df6:	f406                	sd	ra,40(sp)
    80002df8:	f022                	sd	s0,32(sp)
    80002dfa:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002dfc:	00000097          	auipc	ra,0x0
    80002e00:	a30080e7          	jalr	-1488(ra) # 8000282c <myproc>
    80002e04:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002e08:	00000097          	auipc	ra,0x0
    80002e0c:	abe080e7          	jalr	-1346(ra) # 800028c6 <allocproc>
    80002e10:	fca43c23          	sd	a0,-40(s0)
    80002e14:	fd843783          	ld	a5,-40(s0)
    80002e18:	e399                	bnez	a5,80002e1e <fork+0x2a>
    return -1;
    80002e1a:	57fd                	li	a5,-1
    80002e1c:	aa5d                	j	80002fd2 <fork+0x1de>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002e1e:	fe043783          	ld	a5,-32(s0)
    80002e22:	6bb8                	ld	a4,80(a5)
    80002e24:	fd843783          	ld	a5,-40(s0)
    80002e28:	6bb4                	ld	a3,80(a5)
    80002e2a:	fe043783          	ld	a5,-32(s0)
    80002e2e:	67bc                	ld	a5,72(a5)
    80002e30:	863e                	mv	a2,a5
    80002e32:	85b6                	mv	a1,a3
    80002e34:	853a                	mv	a0,a4
    80002e36:	fffff097          	auipc	ra,0xfffff
    80002e3a:	346080e7          	jalr	838(ra) # 8000217c <uvmcopy>
    80002e3e:	87aa                	mv	a5,a0
    80002e40:	0207d163          	bgez	a5,80002e62 <fork+0x6e>
    freeproc(np);
    80002e44:	fd843503          	ld	a0,-40(s0)
    80002e48:	00000097          	auipc	ra,0x0
    80002e4c:	c2e080e7          	jalr	-978(ra) # 80002a76 <freeproc>
    release(&np->lock);
    80002e50:	fd843783          	ld	a5,-40(s0)
    80002e54:	853e                	mv	a0,a5
    80002e56:	ffffe097          	auipc	ra,0xffffe
    80002e5a:	47c080e7          	jalr	1148(ra) # 800012d2 <release>
    return -1;
    80002e5e:	57fd                	li	a5,-1
    80002e60:	aa8d                	j	80002fd2 <fork+0x1de>
  }
  np->sz = p->sz;
    80002e62:	fe043783          	ld	a5,-32(s0)
    80002e66:	67b8                	ld	a4,72(a5)
    80002e68:	fd843783          	ld	a5,-40(s0)
    80002e6c:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80002e6e:	fe043783          	ld	a5,-32(s0)
    80002e72:	6fb8                	ld	a4,88(a5)
    80002e74:	fd843783          	ld	a5,-40(s0)
    80002e78:	6fbc                	ld	a5,88(a5)
    80002e7a:	86be                	mv	a3,a5
    80002e7c:	12000793          	li	a5,288
    80002e80:	863e                	mv	a2,a5
    80002e82:	85ba                	mv	a1,a4
    80002e84:	8536                	mv	a0,a3
    80002e86:	ffffe097          	auipc	ra,0xffffe
    80002e8a:	77c080e7          	jalr	1916(ra) # 80001602 <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80002e8e:	fd843783          	ld	a5,-40(s0)
    80002e92:	6fbc                	ld	a5,88(a5)
    80002e94:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    80002e98:	fe042623          	sw	zero,-20(s0)
    80002e9c:	a0a9                	j	80002ee6 <fork+0xf2>
    if(p->ofile[i])
    80002e9e:	fe043703          	ld	a4,-32(s0)
    80002ea2:	fec42783          	lw	a5,-20(s0)
    80002ea6:	07e9                	addi	a5,a5,26
    80002ea8:	078e                	slli	a5,a5,0x3
    80002eaa:	97ba                	add	a5,a5,a4
    80002eac:	639c                	ld	a5,0(a5)
    80002eae:	c79d                	beqz	a5,80002edc <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    80002eb0:	fe043703          	ld	a4,-32(s0)
    80002eb4:	fec42783          	lw	a5,-20(s0)
    80002eb8:	07e9                	addi	a5,a5,26
    80002eba:	078e                	slli	a5,a5,0x3
    80002ebc:	97ba                	add	a5,a5,a4
    80002ebe:	639c                	ld	a5,0(a5)
    80002ec0:	853e                	mv	a0,a5
    80002ec2:	00005097          	auipc	ra,0x5
    80002ec6:	dde080e7          	jalr	-546(ra) # 80007ca0 <filedup>
    80002eca:	86aa                	mv	a3,a0
    80002ecc:	fd843703          	ld	a4,-40(s0)
    80002ed0:	fec42783          	lw	a5,-20(s0)
    80002ed4:	07e9                	addi	a5,a5,26
    80002ed6:	078e                	slli	a5,a5,0x3
    80002ed8:	97ba                	add	a5,a5,a4
    80002eda:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    80002edc:	fec42783          	lw	a5,-20(s0)
    80002ee0:	2785                	addiw	a5,a5,1
    80002ee2:	fef42623          	sw	a5,-20(s0)
    80002ee6:	fec42783          	lw	a5,-20(s0)
    80002eea:	0007871b          	sext.w	a4,a5
    80002eee:	47bd                	li	a5,15
    80002ef0:	fae7d7e3          	bge	a5,a4,80002e9e <fork+0xaa>
  np->cwd = idup(p->cwd);
    80002ef4:	fe043783          	ld	a5,-32(s0)
    80002ef8:	1507b783          	ld	a5,336(a5)
    80002efc:	853e                	mv	a0,a5
    80002efe:	00003097          	auipc	ra,0x3
    80002f02:	6c8080e7          	jalr	1736(ra) # 800065c6 <idup>
    80002f06:	872a                	mv	a4,a0
    80002f08:	fd843783          	ld	a5,-40(s0)
    80002f0c:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80002f10:	fd843783          	ld	a5,-40(s0)
    80002f14:	15878713          	addi	a4,a5,344
    80002f18:	fe043783          	ld	a5,-32(s0)
    80002f1c:	15878793          	addi	a5,a5,344
    80002f20:	4641                	li	a2,16
    80002f22:	85be                	mv	a1,a5
    80002f24:	853a                	mv	a0,a4
    80002f26:	fffff097          	auipc	ra,0xfffff
    80002f2a:	820080e7          	jalr	-2016(ra) # 80001746 <safestrcpy>

  pid = np->pid;
    80002f2e:	fd843783          	ld	a5,-40(s0)
    80002f32:	5b9c                	lw	a5,48(a5)
    80002f34:	fcf42a23          	sw	a5,-44(s0)

  np->t = p->t;
    80002f38:	fe043783          	ld	a5,-32(s0)
    80002f3c:	18c7a703          	lw	a4,396(a5)
    80002f40:	fd843783          	ld	a5,-40(s0)
    80002f44:	18e7a623          	sw	a4,396(a5)
  np->tau = p->tau;
    80002f48:	fe043783          	ld	a5,-32(s0)
    80002f4c:	16c7a703          	lw	a4,364(a5)
    80002f50:	fd843783          	ld	a5,-40(s0)
    80002f54:	16e7a623          	sw	a4,364(a5)
  release(&np->lock);
    80002f58:	fd843783          	ld	a5,-40(s0)
    80002f5c:	853e                	mv	a0,a5
    80002f5e:	ffffe097          	auipc	ra,0xffffe
    80002f62:	374080e7          	jalr	884(ra) # 800012d2 <release>

  acquire(&wait_lock);
    80002f66:	00019517          	auipc	a0,0x19
    80002f6a:	d8250513          	addi	a0,a0,-638 # 8001bce8 <wait_lock>
    80002f6e:	ffffe097          	auipc	ra,0xffffe
    80002f72:	300080e7          	jalr	768(ra) # 8000126e <acquire>
  np->parent = p;
    80002f76:	fd843783          	ld	a5,-40(s0)
    80002f7a:	fe043703          	ld	a4,-32(s0)
    80002f7e:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    80002f80:	00019517          	auipc	a0,0x19
    80002f84:	d6850513          	addi	a0,a0,-664 # 8001bce8 <wait_lock>
    80002f88:	ffffe097          	auipc	ra,0xffffe
    80002f8c:	34a080e7          	jalr	842(ra) # 800012d2 <release>

  acquire(&np->lock);
    80002f90:	fd843783          	ld	a5,-40(s0)
    80002f94:	853e                	mv	a0,a5
    80002f96:	ffffe097          	auipc	ra,0xffffe
    80002f9a:	2d8080e7          	jalr	728(ra) # 8000126e <acquire>
  int preempt = put(np); // where is preempt checked?
    80002f9e:	fd843503          	ld	a0,-40(s0)
    80002fa2:	00000097          	auipc	ra,0x0
    80002fa6:	388080e7          	jalr	904(ra) # 8000332a <put>
    80002faa:	87aa                	mv	a5,a0
    80002fac:	fcf42823          	sw	a5,-48(s0)
  release(&np->lock);
    80002fb0:	fd843783          	ld	a5,-40(s0)
    80002fb4:	853e                	mv	a0,a5
    80002fb6:	ffffe097          	auipc	ra,0xffffe
    80002fba:	31c080e7          	jalr	796(ra) # 800012d2 <release>
  if (preempt)
    80002fbe:	fd042783          	lw	a5,-48(s0)
    80002fc2:	2781                	sext.w	a5,a5
    80002fc4:	c789                	beqz	a5,80002fce <fork+0x1da>
      yield();  // here?
    80002fc6:	00002097          	auipc	ra,0x2
    80002fca:	812080e7          	jalr	-2030(ra) # 800047d8 <yield>

  return pid;
    80002fce:	fd442783          	lw	a5,-44(s0)
}
    80002fd2:	853e                	mv	a0,a5
    80002fd4:	70a2                	ld	ra,40(sp)
    80002fd6:	7402                	ld	s0,32(sp)
    80002fd8:	6145                	addi	sp,sp,48
    80002fda:	8082                	ret

0000000080002fdc <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    80002fdc:	7179                	addi	sp,sp,-48
    80002fde:	f406                	sd	ra,40(sp)
    80002fe0:	f022                	sd	s0,32(sp)
    80002fe2:	1800                	addi	s0,sp,48
    80002fe4:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    80002fe8:	00012797          	auipc	a5,0x12
    80002fec:	6e878793          	addi	a5,a5,1768 # 800156d0 <proc>
    80002ff0:	fef43423          	sd	a5,-24(s0)
    80002ff4:	a081                	j	80003034 <reparent+0x58>
    if(pp->parent == p){
    80002ff6:	fe843783          	ld	a5,-24(s0)
    80002ffa:	7f9c                	ld	a5,56(a5)
    80002ffc:	fd843703          	ld	a4,-40(s0)
    80003000:	02f71463          	bne	a4,a5,80003028 <reparent+0x4c>
      pp->parent = initproc;
    80003004:	0000a797          	auipc	a5,0xa
    80003008:	03478793          	addi	a5,a5,52 # 8000d038 <initproc>
    8000300c:	6398                	ld	a4,0(a5)
    8000300e:	fe843783          	ld	a5,-24(s0)
    80003012:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    80003014:	0000a797          	auipc	a5,0xa
    80003018:	02478793          	addi	a5,a5,36 # 8000d038 <initproc>
    8000301c:	639c                	ld	a5,0(a5)
    8000301e:	853e                	mv	a0,a5
    80003020:	00002097          	auipc	ra,0x2
    80003024:	8f8080e7          	jalr	-1800(ra) # 80004918 <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80003028:	fe843783          	ld	a5,-24(s0)
    8000302c:	19878793          	addi	a5,a5,408
    80003030:	fef43423          	sd	a5,-24(s0)
    80003034:	fe843703          	ld	a4,-24(s0)
    80003038:	00019797          	auipc	a5,0x19
    8000303c:	c9878793          	addi	a5,a5,-872 # 8001bcd0 <pid_lock>
    80003040:	faf76be3          	bltu	a4,a5,80002ff6 <reparent+0x1a>
    }
  }
}
    80003044:	0001                	nop
    80003046:	0001                	nop
    80003048:	70a2                	ld	ra,40(sp)
    8000304a:	7402                	ld	s0,32(sp)
    8000304c:	6145                	addi	sp,sp,48
    8000304e:	8082                	ret

0000000080003050 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    80003050:	7139                	addi	sp,sp,-64
    80003052:	fc06                	sd	ra,56(sp)
    80003054:	f822                	sd	s0,48(sp)
    80003056:	0080                	addi	s0,sp,64
    80003058:	87aa                	mv	a5,a0
    8000305a:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    8000305e:	fffff097          	auipc	ra,0xfffff
    80003062:	7ce080e7          	jalr	1998(ra) # 8000282c <myproc>
    80003066:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    8000306a:	0000a797          	auipc	a5,0xa
    8000306e:	fce78793          	addi	a5,a5,-50 # 8000d038 <initproc>
    80003072:	639c                	ld	a5,0(a5)
    80003074:	fe043703          	ld	a4,-32(s0)
    80003078:	00f71a63          	bne	a4,a5,8000308c <exit+0x3c>
    panic("init exiting");
    8000307c:	00009517          	auipc	a0,0x9
    80003080:	18c50513          	addi	a0,a0,396 # 8000c208 <etext+0x208>
    80003084:	ffffe097          	auipc	ra,0xffffe
    80003088:	bfa080e7          	jalr	-1030(ra) # 80000c7e <panic>

  acquire(&p->lock);
    8000308c:	fe043783          	ld	a5,-32(s0)
    80003090:	853e                	mv	a0,a5
    80003092:	ffffe097          	auipc	ra,0xffffe
    80003096:	1dc080e7          	jalr	476(ra) # 8000126e <acquire>
  p->preempted = -1;    // can't be preempted, process wants to exit
    8000309a:	fe043783          	ld	a5,-32(s0)
    8000309e:	577d                	li	a4,-1
    800030a0:	18e7a423          	sw	a4,392(a5)
  release(&p->lock);
    800030a4:	fe043783          	ld	a5,-32(s0)
    800030a8:	853e                	mv	a0,a5
    800030aa:	ffffe097          	auipc	ra,0xffffe
    800030ae:	228080e7          	jalr	552(ra) # 800012d2 <release>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    800030b2:	fe042623          	sw	zero,-20(s0)
    800030b6:	a881                	j	80003106 <exit+0xb6>
    if(p->ofile[fd]){
    800030b8:	fe043703          	ld	a4,-32(s0)
    800030bc:	fec42783          	lw	a5,-20(s0)
    800030c0:	07e9                	addi	a5,a5,26
    800030c2:	078e                	slli	a5,a5,0x3
    800030c4:	97ba                	add	a5,a5,a4
    800030c6:	639c                	ld	a5,0(a5)
    800030c8:	cb95                	beqz	a5,800030fc <exit+0xac>
      struct file *f = p->ofile[fd];
    800030ca:	fe043703          	ld	a4,-32(s0)
    800030ce:	fec42783          	lw	a5,-20(s0)
    800030d2:	07e9                	addi	a5,a5,26
    800030d4:	078e                	slli	a5,a5,0x3
    800030d6:	97ba                	add	a5,a5,a4
    800030d8:	639c                	ld	a5,0(a5)
    800030da:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    800030de:	fd843503          	ld	a0,-40(s0)
    800030e2:	00005097          	auipc	ra,0x5
    800030e6:	c24080e7          	jalr	-988(ra) # 80007d06 <fileclose>
      p->ofile[fd] = 0;
    800030ea:	fe043703          	ld	a4,-32(s0)
    800030ee:	fec42783          	lw	a5,-20(s0)
    800030f2:	07e9                	addi	a5,a5,26
    800030f4:	078e                	slli	a5,a5,0x3
    800030f6:	97ba                	add	a5,a5,a4
    800030f8:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    800030fc:	fec42783          	lw	a5,-20(s0)
    80003100:	2785                	addiw	a5,a5,1
    80003102:	fef42623          	sw	a5,-20(s0)
    80003106:	fec42783          	lw	a5,-20(s0)
    8000310a:	0007871b          	sext.w	a4,a5
    8000310e:	47bd                	li	a5,15
    80003110:	fae7d4e3          	bge	a5,a4,800030b8 <exit+0x68>
    }
  }

  begin_op();
    80003114:	00004097          	auipc	ra,0x4
    80003118:	558080e7          	jalr	1368(ra) # 8000766c <begin_op>
  iput(p->cwd);
    8000311c:	fe043783          	ld	a5,-32(s0)
    80003120:	1507b783          	ld	a5,336(a5)
    80003124:	853e                	mv	a0,a5
    80003126:	00003097          	auipc	ra,0x3
    8000312a:	67a080e7          	jalr	1658(ra) # 800067a0 <iput>
  end_op();
    8000312e:	00004097          	auipc	ra,0x4
    80003132:	600080e7          	jalr	1536(ra) # 8000772e <end_op>
  p->cwd = 0;
    80003136:	fe043783          	ld	a5,-32(s0)
    8000313a:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    8000313e:	00019517          	auipc	a0,0x19
    80003142:	baa50513          	addi	a0,a0,-1110 # 8001bce8 <wait_lock>
    80003146:	ffffe097          	auipc	ra,0xffffe
    8000314a:	128080e7          	jalr	296(ra) # 8000126e <acquire>

  // Give any children to init.
  reparent(p);
    8000314e:	fe043503          	ld	a0,-32(s0)
    80003152:	00000097          	auipc	ra,0x0
    80003156:	e8a080e7          	jalr	-374(ra) # 80002fdc <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    8000315a:	fe043783          	ld	a5,-32(s0)
    8000315e:	7f9c                	ld	a5,56(a5)
    80003160:	853e                	mv	a0,a5
    80003162:	00001097          	auipc	ra,0x1
    80003166:	7b6080e7          	jalr	1974(ra) # 80004918 <wakeup>
  
  acquire(&p->lock);
    8000316a:	fe043783          	ld	a5,-32(s0)
    8000316e:	853e                	mv	a0,a5
    80003170:	ffffe097          	auipc	ra,0xffffe
    80003174:	0fe080e7          	jalr	254(ra) # 8000126e <acquire>

  p->xstate = status;
    80003178:	fe043783          	ld	a5,-32(s0)
    8000317c:	fcc42703          	lw	a4,-52(s0)
    80003180:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    80003182:	fe043783          	ld	a5,-32(s0)
    80003186:	4715                	li	a4,5
    80003188:	cf98                	sw	a4,24(a5)
  p->left = 0;
    8000318a:	fe043783          	ld	a5,-32(s0)
    8000318e:	1607b823          	sd	zero,368(a5)
  p->right = 0;
    80003192:	fe043783          	ld	a5,-32(s0)
    80003196:	1607bc23          	sd	zero,376(a5)
  p->next = 0;
    8000319a:	fe043783          	ld	a5,-32(s0)
    8000319e:	1807b023          	sd	zero,384(a5)

  release(&wait_lock);
    800031a2:	00019517          	auipc	a0,0x19
    800031a6:	b4650513          	addi	a0,a0,-1210 # 8001bce8 <wait_lock>
    800031aa:	ffffe097          	auipc	ra,0xffffe
    800031ae:	128080e7          	jalr	296(ra) # 800012d2 <release>
  // Jump into the scheduler, never to return.
  sched();
    800031b2:	00001097          	auipc	ra,0x1
    800031b6:	460080e7          	jalr	1120(ra) # 80004612 <sched>
  panic("zombie exit");
    800031ba:	00009517          	auipc	a0,0x9
    800031be:	05e50513          	addi	a0,a0,94 # 8000c218 <etext+0x218>
    800031c2:	ffffe097          	auipc	ra,0xffffe
    800031c6:	abc080e7          	jalr	-1348(ra) # 80000c7e <panic>

00000000800031ca <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    800031ca:	7139                	addi	sp,sp,-64
    800031cc:	fc06                	sd	ra,56(sp)
    800031ce:	f822                	sd	s0,48(sp)
    800031d0:	0080                	addi	s0,sp,64
    800031d2:	fca43423          	sd	a0,-56(s0)
  struct proc *np;
  int havekids, pid;
  struct proc *p = myproc();
    800031d6:	fffff097          	auipc	ra,0xfffff
    800031da:	656080e7          	jalr	1622(ra) # 8000282c <myproc>
    800031de:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    800031e2:	00019517          	auipc	a0,0x19
    800031e6:	b0650513          	addi	a0,a0,-1274 # 8001bce8 <wait_lock>
    800031ea:	ffffe097          	auipc	ra,0xffffe
    800031ee:	084080e7          	jalr	132(ra) # 8000126e <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    800031f2:	fe042223          	sw	zero,-28(s0)
    for(np = proc; np < &proc[NPROC]; np++){
    800031f6:	00012797          	auipc	a5,0x12
    800031fa:	4da78793          	addi	a5,a5,1242 # 800156d0 <proc>
    800031fe:	fef43423          	sd	a5,-24(s0)
    80003202:	a8d1                	j	800032d6 <wait+0x10c>
      if(np->parent == p){
    80003204:	fe843783          	ld	a5,-24(s0)
    80003208:	7f9c                	ld	a5,56(a5)
    8000320a:	fd843703          	ld	a4,-40(s0)
    8000320e:	0af71e63          	bne	a4,a5,800032ca <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&np->lock);
    80003212:	fe843783          	ld	a5,-24(s0)
    80003216:	853e                	mv	a0,a5
    80003218:	ffffe097          	auipc	ra,0xffffe
    8000321c:	056080e7          	jalr	86(ra) # 8000126e <acquire>

        havekids = 1;
    80003220:	4785                	li	a5,1
    80003222:	fef42223          	sw	a5,-28(s0)
        if(np->state == ZOMBIE){
    80003226:	fe843783          	ld	a5,-24(s0)
    8000322a:	4f9c                	lw	a5,24(a5)
    8000322c:	873e                	mv	a4,a5
    8000322e:	4795                	li	a5,5
    80003230:	08f71663          	bne	a4,a5,800032bc <wait+0xf2>
          // Found one.
          pid = np->pid;
    80003234:	fe843783          	ld	a5,-24(s0)
    80003238:	5b9c                	lw	a5,48(a5)
    8000323a:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&np->xstate,
    8000323e:	fc843783          	ld	a5,-56(s0)
    80003242:	c7a9                	beqz	a5,8000328c <wait+0xc2>
    80003244:	fd843783          	ld	a5,-40(s0)
    80003248:	6bb8                	ld	a4,80(a5)
    8000324a:	fe843783          	ld	a5,-24(s0)
    8000324e:	02c78793          	addi	a5,a5,44
    80003252:	4691                	li	a3,4
    80003254:	863e                	mv	a2,a5
    80003256:	fc843583          	ld	a1,-56(s0)
    8000325a:	853a                	mv	a0,a4
    8000325c:	fffff097          	auipc	ra,0xfffff
    80003260:	08a080e7          	jalr	138(ra) # 800022e6 <copyout>
    80003264:	87aa                	mv	a5,a0
    80003266:	0207d363          	bgez	a5,8000328c <wait+0xc2>
                                  sizeof(np->xstate)) < 0) {
            release(&np->lock);
    8000326a:	fe843783          	ld	a5,-24(s0)
    8000326e:	853e                	mv	a0,a5
    80003270:	ffffe097          	auipc	ra,0xffffe
    80003274:	062080e7          	jalr	98(ra) # 800012d2 <release>
            release(&wait_lock);
    80003278:	00019517          	auipc	a0,0x19
    8000327c:	a7050513          	addi	a0,a0,-1424 # 8001bce8 <wait_lock>
    80003280:	ffffe097          	auipc	ra,0xffffe
    80003284:	052080e7          	jalr	82(ra) # 800012d2 <release>
            return -1;
    80003288:	57fd                	li	a5,-1
    8000328a:	a859                	j	80003320 <wait+0x156>
          }
          freeproc(np);
    8000328c:	fe843503          	ld	a0,-24(s0)
    80003290:	fffff097          	auipc	ra,0xfffff
    80003294:	7e6080e7          	jalr	2022(ra) # 80002a76 <freeproc>
          release(&np->lock);
    80003298:	fe843783          	ld	a5,-24(s0)
    8000329c:	853e                	mv	a0,a5
    8000329e:	ffffe097          	auipc	ra,0xffffe
    800032a2:	034080e7          	jalr	52(ra) # 800012d2 <release>
          release(&wait_lock);
    800032a6:	00019517          	auipc	a0,0x19
    800032aa:	a4250513          	addi	a0,a0,-1470 # 8001bce8 <wait_lock>
    800032ae:	ffffe097          	auipc	ra,0xffffe
    800032b2:	024080e7          	jalr	36(ra) # 800012d2 <release>
          return pid;
    800032b6:	fd442783          	lw	a5,-44(s0)
    800032ba:	a09d                	j	80003320 <wait+0x156>
        }
        release(&np->lock);
    800032bc:	fe843783          	ld	a5,-24(s0)
    800032c0:	853e                	mv	a0,a5
    800032c2:	ffffe097          	auipc	ra,0xffffe
    800032c6:	010080e7          	jalr	16(ra) # 800012d2 <release>
    for(np = proc; np < &proc[NPROC]; np++){
    800032ca:	fe843783          	ld	a5,-24(s0)
    800032ce:	19878793          	addi	a5,a5,408
    800032d2:	fef43423          	sd	a5,-24(s0)
    800032d6:	fe843703          	ld	a4,-24(s0)
    800032da:	00019797          	auipc	a5,0x19
    800032de:	9f678793          	addi	a5,a5,-1546 # 8001bcd0 <pid_lock>
    800032e2:	f2f761e3          	bltu	a4,a5,80003204 <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || p->killed){
    800032e6:	fe442783          	lw	a5,-28(s0)
    800032ea:	2781                	sext.w	a5,a5
    800032ec:	c789                	beqz	a5,800032f6 <wait+0x12c>
    800032ee:	fd843783          	ld	a5,-40(s0)
    800032f2:	579c                	lw	a5,40(a5)
    800032f4:	cb99                	beqz	a5,8000330a <wait+0x140>
      release(&wait_lock);
    800032f6:	00019517          	auipc	a0,0x19
    800032fa:	9f250513          	addi	a0,a0,-1550 # 8001bce8 <wait_lock>
    800032fe:	ffffe097          	auipc	ra,0xffffe
    80003302:	fd4080e7          	jalr	-44(ra) # 800012d2 <release>
      return -1;
    80003306:	57fd                	li	a5,-1
    80003308:	a821                	j	80003320 <wait+0x156>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    8000330a:	00019597          	auipc	a1,0x19
    8000330e:	9de58593          	addi	a1,a1,-1570 # 8001bce8 <wait_lock>
    80003312:	fd843503          	ld	a0,-40(s0)
    80003316:	00001097          	auipc	ra,0x1
    8000331a:	560080e7          	jalr	1376(ra) # 80004876 <sleep>
    havekids = 0;
    8000331e:	bdd1                	j	800031f2 <wait+0x28>
  }
}
    80003320:	853e                	mv	a0,a5
    80003322:	70e2                	ld	ra,56(sp)
    80003324:	7442                	ld	s0,48(sp)
    80003326:	6121                	addi	sp,sp,64
    80003328:	8082                	ret

000000008000332a <put>:

// holds p->lock
// returns 0 if there is no preemption, 1 otherwise
int put(struct proc *p)
{
    8000332a:	711d                	addi	sp,sp,-96
    8000332c:	ec86                	sd	ra,88(sp)
    8000332e:	e8a2                	sd	s0,80(sp)
    80003330:	1080                	addi	s0,sp,96
    80003332:	faa43423          	sd	a0,-88(s0)
    uint currticks = ticks;
    80003336:	0000a797          	auipc	a5,0xa
    8000333a:	d0a78793          	addi	a5,a5,-758 # 8000d040 <ticks>
    8000333e:	439c                	lw	a5,0(a5)
    80003340:	fcf42e23          	sw	a5,-36(s0)
    if (!alg_changing)
    80003344:	0000a797          	auipc	a5,0xa
    80003348:	ce078793          	addi	a5,a5,-800 # 8000d024 <alg_changing>
    8000334c:	439c                	lw	a5,0(a5)
    8000334e:	efdd                	bnez	a5,8000340c <put+0xe2>
    {
        // need mutex, but ensure that no locks are hold before blocking
        release(&p->lock);
    80003350:	fa843783          	ld	a5,-88(s0)
    80003354:	853e                	mv	a0,a5
    80003356:	ffffe097          	auipc	ra,0xffffe
    8000335a:	f7c080e7          	jalr	-132(ra) # 800012d2 <release>
        push_off();
    8000335e:	ffffe097          	auipc	ra,0xffffe
    80003362:	00e080e7          	jalr	14(ra) # 8000136c <push_off>
        struct cpu *mycp = mycpu();
    80003366:	fffff097          	auipc	ra,0xfffff
    8000336a:	48c080e7          	jalr	1164(ra) # 800027f2 <mycpu>
    8000336e:	fca43823          	sd	a0,-48(s0)
        pop_off();
    80003372:	ffffe097          	auipc	ra,0xffffe
    80003376:	052080e7          	jalr	82(ra) # 800013c4 <pop_off>
        if (tickslock.cpu == mycp) {
    8000337a:	00019797          	auipc	a5,0x19
    8000337e:	98678793          	addi	a5,a5,-1658 # 8001bd00 <tickslock>
    80003382:	6b9c                	ld	a5,16(a5)
    80003384:	fd043703          	ld	a4,-48(s0)
    80003388:	04f71263          	bne	a4,a5,800033cc <put+0xa2>
            release(&tickslock);
    8000338c:	00019517          	auipc	a0,0x19
    80003390:	97450513          	addi	a0,a0,-1676 # 8001bd00 <tickslock>
    80003394:	ffffe097          	auipc	ra,0xffffe
    80003398:	f3e080e7          	jalr	-194(ra) # 800012d2 <release>
            acquire(&mutex);
    8000339c:	00012517          	auipc	a0,0x12
    800033a0:	f1c50513          	addi	a0,a0,-228 # 800152b8 <mutex>
    800033a4:	ffffe097          	auipc	ra,0xffffe
    800033a8:	eca080e7          	jalr	-310(ra) # 8000126e <acquire>
            acquire(&tickslock);
    800033ac:	00019517          	auipc	a0,0x19
    800033b0:	95450513          	addi	a0,a0,-1708 # 8001bd00 <tickslock>
    800033b4:	ffffe097          	auipc	ra,0xffffe
    800033b8:	eba080e7          	jalr	-326(ra) # 8000126e <acquire>
            acquire(&p->lock);
    800033bc:	fa843783          	ld	a5,-88(s0)
    800033c0:	853e                	mv	a0,a5
    800033c2:	ffffe097          	auipc	ra,0xffffe
    800033c6:	eac080e7          	jalr	-340(ra) # 8000126e <acquire>
    800033ca:	a005                	j	800033ea <put+0xc0>
        } else {
            acquire(&mutex);
    800033cc:	00012517          	auipc	a0,0x12
    800033d0:	eec50513          	addi	a0,a0,-276 # 800152b8 <mutex>
    800033d4:	ffffe097          	auipc	ra,0xffffe
    800033d8:	e9a080e7          	jalr	-358(ra) # 8000126e <acquire>
            acquire(&p->lock);
    800033dc:	fa843783          	ld	a5,-88(s0)
    800033e0:	853e                	mv	a0,a5
    800033e2:	ffffe097          	auipc	ra,0xffffe
    800033e6:	e8c080e7          	jalr	-372(ra) # 8000126e <acquire>
        }
        // acquired mutex properly
        if (p->state == RUNNABLE)
    800033ea:	fa843783          	ld	a5,-88(s0)
    800033ee:	4f9c                	lw	a5,24(a5)
    800033f0:	873e                	mv	a4,a5
    800033f2:	478d                	li	a5,3
    800033f4:	00f71c63          	bne	a4,a5,8000340c <put+0xe2>
        {
            release(&mutex);
    800033f8:	00012517          	auipc	a0,0x12
    800033fc:	ec050513          	addi	a0,a0,-320 # 800152b8 <mutex>
    80003400:	ffffe097          	auipc	ra,0xffffe
    80003404:	ed2080e7          	jalr	-302(ra) # 800012d2 <release>
            return 0;
    80003408:	4781                	li	a5,0
    8000340a:	a6c9                	j	800037cc <put+0x4a2>
        }
    }

    p->state = RUNNABLE;
    8000340c:	fa843783          	ld	a5,-88(s0)
    80003410:	470d                	li	a4,3
    80003412:	cf98                	sw	a4,24(a5)
    if (algid != 0) // default scheduler doesn't need binary tree searching
    80003414:	0000a797          	auipc	a5,0xa
    80003418:	c0c78793          	addi	a5,a5,-1012 # 8000d020 <algid>
    8000341c:	439c                	lw	a5,0(a5)
    8000341e:	38078863          	beqz	a5,800037ae <put+0x484>
    {
        // if preemptive SJF is active, check if preemption will occur with newly came proc p
        if (sjf_preemptive == 1)
    80003422:	00009797          	auipc	a5,0x9
    80003426:	32278793          	addi	a5,a5,802 # 8000c744 <sjf_preemptive>
    8000342a:	439c                	lw	a5,0(a5)
    8000342c:	873e                	mv	a4,a5
    8000342e:	4785                	li	a5,1
    80003430:	0af71e63          	bne	a4,a5,800034ec <put+0x1c2>
        {
            struct proc *t = myproc();
    80003434:	fffff097          	auipc	ra,0xfffff
    80003438:	3f8080e7          	jalr	1016(ra) # 8000282c <myproc>
    8000343c:	fca43423          	sd	a0,-56(s0)
            if (t != 0 && t != p)
    80003440:	fc843783          	ld	a5,-56(s0)
    80003444:	c7c5                	beqz	a5,800034ec <put+0x1c2>
    80003446:	fc843703          	ld	a4,-56(s0)
    8000344a:	fa843783          	ld	a5,-88(s0)
    8000344e:	08f70f63          	beq	a4,a5,800034ec <put+0x1c2>
            {
                acquire(&t->lock);
    80003452:	fc843783          	ld	a5,-56(s0)
    80003456:	853e                	mv	a0,a5
    80003458:	ffffe097          	auipc	ra,0xffffe
    8000345c:	e16080e7          	jalr	-490(ra) # 8000126e <acquire>
                if (t->killed == 0 && t->preempted != -1)   // if running process wants to stop, dont preempt it
    80003460:	fc843783          	ld	a5,-56(s0)
    80003464:	579c                	lw	a5,40(a5)
    80003466:	efa5                	bnez	a5,800034de <put+0x1b4>
    80003468:	fc843783          	ld	a5,-56(s0)
    8000346c:	1887a783          	lw	a5,392(a5)
    80003470:	873e                	mv	a4,a5
    80003472:	57fd                	li	a5,-1
    80003474:	06f70563          	beq	a4,a5,800034de <put+0x1b4>
                {
                    // preempts only if running process' current t is smaller than its approximated tau,
                    // and if the new proc has smaller approx
                    if ((t->tau - ((int)currticks - (int)t->timestamp)) > p->tau)
    80003478:	fc843783          	ld	a5,-56(s0)
    8000347c:	16c7a703          	lw	a4,364(a5)
    80003480:	fdc42683          	lw	a3,-36(s0)
    80003484:	fc843783          	ld	a5,-56(s0)
    80003488:	1687a783          	lw	a5,360(a5)
    8000348c:	2781                	sext.w	a5,a5
    8000348e:	40f687bb          	subw	a5,a3,a5
    80003492:	2781                	sext.w	a5,a5
    80003494:	40f707bb          	subw	a5,a4,a5
    80003498:	0007871b          	sext.w	a4,a5
    8000349c:	fa843783          	ld	a5,-88(s0)
    800034a0:	16c7a783          	lw	a5,364(a5)
    800034a4:	02e7dd63          	bge	a5,a4,800034de <put+0x1b4>
                    {
                        t->tau -= (int)currticks - (int)t->timestamp;
    800034a8:	fc843783          	ld	a5,-56(s0)
    800034ac:	16c7a703          	lw	a4,364(a5)
    800034b0:	fdc42683          	lw	a3,-36(s0)
    800034b4:	fc843783          	ld	a5,-56(s0)
    800034b8:	1687a783          	lw	a5,360(a5)
    800034bc:	2781                	sext.w	a5,a5
    800034be:	40f687bb          	subw	a5,a3,a5
    800034c2:	2781                	sext.w	a5,a5
    800034c4:	40f707bb          	subw	a5,a4,a5
    800034c8:	0007871b          	sext.w	a4,a5
    800034cc:	fc843783          	ld	a5,-56(s0)
    800034d0:	16e7a623          	sw	a4,364(a5)
                        t->preempted = 1;
    800034d4:	fc843783          	ld	a5,-56(s0)
    800034d8:	4705                	li	a4,1
    800034da:	18e7a423          	sw	a4,392(a5)
                    }
                }
                release(&t->lock);
    800034de:	fc843783          	ld	a5,-56(s0)
    800034e2:	853e                	mv	a0,a5
    800034e4:	ffffe097          	auipc	ra,0xffffe
    800034e8:	dee080e7          	jalr	-530(ra) # 800012d2 <release>
            }
        }

        // for CFS save timestamp when proc entered scheduler
        if (algid == 2)
    800034ec:	0000a797          	auipc	a5,0xa
    800034f0:	b3478793          	addi	a5,a5,-1228 # 8000d020 <algid>
    800034f4:	439c                	lw	a5,0(a5)
    800034f6:	873e                	mv	a4,a5
    800034f8:	4789                	li	a5,2
    800034fa:	00f71863          	bne	a4,a5,8000350a <put+0x1e0>
            p->timestamp = currticks;
    800034fe:	fa843783          	ld	a5,-88(s0)
    80003502:	fdc42703          	lw	a4,-36(s0)
    80003506:	16e7a423          	sw	a4,360(a5)

        // both SJF and CFS use the same binary tree structure, with the same parameter name "tau" but with different usage
        if (tree_head != 0)
    8000350a:	0000a797          	auipc	a5,0xa
    8000350e:	b2678793          	addi	a5,a5,-1242 # 8000d030 <tree_head>
    80003512:	639c                	ld	a5,0(a5)
    80003514:	cb99                	beqz	a5,8000352a <put+0x200>
            acquire(&tree_head->lock);
    80003516:	0000a797          	auipc	a5,0xa
    8000351a:	b1a78793          	addi	a5,a5,-1254 # 8000d030 <tree_head>
    8000351e:	639c                	ld	a5,0(a5)
    80003520:	853e                	mv	a0,a5
    80003522:	ffffe097          	auipc	ra,0xffffe
    80003526:	d4c080e7          	jalr	-692(ra) # 8000126e <acquire>
        struct proc *i = tree_head;  // tree iterator
    8000352a:	0000a797          	auipc	a5,0xa
    8000352e:	b0678793          	addi	a5,a5,-1274 # 8000d030 <tree_head>
    80003532:	639c                	ld	a5,0(a5)
    80003534:	fef43423          	sd	a5,-24(s0)
        struct proc *prev = i;       // remember iterator parent
    80003538:	fe843783          	ld	a5,-24(s0)
    8000353c:	fef43023          	sd	a5,-32(s0)
        while (i != 0)
    80003540:	a251                	j	800036c4 <put+0x39a>
        {
            if (p->tau > i->tau)
    80003542:	fa843783          	ld	a5,-88(s0)
    80003546:	16c7a703          	lw	a4,364(a5)
    8000354a:	fe843783          	ld	a5,-24(s0)
    8000354e:	16c7a783          	lw	a5,364(a5)
    80003552:	04e7d263          	bge	a5,a4,80003596 <put+0x26c>
            {
                if (i->right != 0)
    80003556:	fe843783          	ld	a5,-24(s0)
    8000355a:	1787b783          	ld	a5,376(a5)
    8000355e:	cb91                	beqz	a5,80003572 <put+0x248>
                    acquire(&i->right->lock);
    80003560:	fe843783          	ld	a5,-24(s0)
    80003564:	1787b783          	ld	a5,376(a5)
    80003568:	853e                	mv	a0,a5
    8000356a:	ffffe097          	auipc	ra,0xffffe
    8000356e:	d04080e7          	jalr	-764(ra) # 8000126e <acquire>
                prev = i;
    80003572:	fe843783          	ld	a5,-24(s0)
    80003576:	fef43023          	sd	a5,-32(s0)
                i = i->right;
    8000357a:	fe843783          	ld	a5,-24(s0)
    8000357e:	1787b783          	ld	a5,376(a5)
    80003582:	fef43423          	sd	a5,-24(s0)
                release(&prev->lock);
    80003586:	fe043783          	ld	a5,-32(s0)
    8000358a:	853e                	mv	a0,a5
    8000358c:	ffffe097          	auipc	ra,0xffffe
    80003590:	d46080e7          	jalr	-698(ra) # 800012d2 <release>
    80003594:	aa05                	j	800036c4 <put+0x39a>
            }
            else if (p->tau < i->tau)
    80003596:	fa843783          	ld	a5,-88(s0)
    8000359a:	16c7a703          	lw	a4,364(a5)
    8000359e:	fe843783          	ld	a5,-24(s0)
    800035a2:	16c7a783          	lw	a5,364(a5)
    800035a6:	06f75663          	bge	a4,a5,80003612 <put+0x2e8>
            {
                if (i->left != 0)
    800035aa:	fe843783          	ld	a5,-24(s0)
    800035ae:	1707b783          	ld	a5,368(a5)
    800035b2:	cb91                	beqz	a5,800035c6 <put+0x29c>
                    acquire(&i->left->lock);
    800035b4:	fe843783          	ld	a5,-24(s0)
    800035b8:	1707b783          	ld	a5,368(a5)
    800035bc:	853e                	mv	a0,a5
    800035be:	ffffe097          	auipc	ra,0xffffe
    800035c2:	cb0080e7          	jalr	-848(ra) # 8000126e <acquire>
                prev = i;
    800035c6:	fe843783          	ld	a5,-24(s0)
    800035ca:	fef43023          	sd	a5,-32(s0)
                i = i->left;
    800035ce:	fe843783          	ld	a5,-24(s0)
    800035d2:	1707b783          	ld	a5,368(a5)
    800035d6:	fef43423          	sd	a5,-24(s0)
                release(&prev->lock);
    800035da:	fe043783          	ld	a5,-32(s0)
    800035de:	853e                	mv	a0,a5
    800035e0:	ffffe097          	auipc	ra,0xffffe
    800035e4:	cf2080e7          	jalr	-782(ra) # 800012d2 <release>
    800035e8:	a8f1                	j	800036c4 <put+0x39a>
            }
            else
            {
                while (i->next != 0)
                {
                    release(&i->lock);
    800035ea:	fe843783          	ld	a5,-24(s0)
    800035ee:	853e                	mv	a0,a5
    800035f0:	ffffe097          	auipc	ra,0xffffe
    800035f4:	ce2080e7          	jalr	-798(ra) # 800012d2 <release>
                    i = i->next;
    800035f8:	fe843783          	ld	a5,-24(s0)
    800035fc:	1807b783          	ld	a5,384(a5)
    80003600:	fef43423          	sd	a5,-24(s0)
                    acquire(&i->lock);
    80003604:	fe843783          	ld	a5,-24(s0)
    80003608:	853e                	mv	a0,a5
    8000360a:	ffffe097          	auipc	ra,0xffffe
    8000360e:	c64080e7          	jalr	-924(ra) # 8000126e <acquire>
                while (i->next != 0)
    80003612:	fe843783          	ld	a5,-24(s0)
    80003616:	1807b783          	ld	a5,384(a5)
    8000361a:	fbe1                	bnez	a5,800035ea <put+0x2c0>
                }
                i->next = p;
    8000361c:	fe843783          	ld	a5,-24(s0)
    80003620:	fa843703          	ld	a4,-88(s0)
    80003624:	18e7b023          	sd	a4,384(a5)
                release(&i->lock);
    80003628:	fe843783          	ld	a5,-24(s0)
    8000362c:	853e                	mv	a0,a5
    8000362e:	ffffe097          	auipc	ra,0xffffe
    80003632:	ca4080e7          	jalr	-860(ra) # 800012d2 <release>
                if (!alg_changing)
    80003636:	0000a797          	auipc	a5,0xa
    8000363a:	9ee78793          	addi	a5,a5,-1554 # 8000d024 <alg_changing>
    8000363e:	439c                	lw	a5,0(a5)
    80003640:	eb89                	bnez	a5,80003652 <put+0x328>
                    release(&mutex);
    80003642:	00012517          	auipc	a0,0x12
    80003646:	c7650513          	addi	a0,a0,-906 # 800152b8 <mutex>
    8000364a:	ffffe097          	auipc	ra,0xffffe
    8000364e:	c88080e7          	jalr	-888(ra) # 800012d2 <release>

                // check if there was preemption before returning
                if (sjf_preemptive == 1)
    80003652:	00009797          	auipc	a5,0x9
    80003656:	0f278793          	addi	a5,a5,242 # 8000c744 <sjf_preemptive>
    8000365a:	439c                	lw	a5,0(a5)
    8000365c:	873e                	mv	a4,a5
    8000365e:	4785                	li	a5,1
    80003660:	06f71063          	bne	a4,a5,800036c0 <put+0x396>
                {
                    struct proc *t = myproc();
    80003664:	fffff097          	auipc	ra,0xfffff
    80003668:	1c8080e7          	jalr	456(ra) # 8000282c <myproc>
    8000366c:	faa43c23          	sd	a0,-72(s0)
                    if (t != 0 && t != p)
    80003670:	fb843783          	ld	a5,-72(s0)
    80003674:	c7b1                	beqz	a5,800036c0 <put+0x396>
    80003676:	fb843703          	ld	a4,-72(s0)
    8000367a:	fa843783          	ld	a5,-88(s0)
    8000367e:	04f70163          	beq	a4,a5,800036c0 <put+0x396>
                    {
                        acquire(&t->lock);
    80003682:	fb843783          	ld	a5,-72(s0)
    80003686:	853e                	mv	a0,a5
    80003688:	ffffe097          	auipc	ra,0xffffe
    8000368c:	be6080e7          	jalr	-1050(ra) # 8000126e <acquire>
                        if (t->preempted == 1)
    80003690:	fb843783          	ld	a5,-72(s0)
    80003694:	1887a783          	lw	a5,392(a5)
    80003698:	873e                	mv	a4,a5
    8000369a:	4785                	li	a5,1
    8000369c:	00f71b63          	bne	a4,a5,800036b2 <put+0x388>
                        {
                            release(&t->lock);
    800036a0:	fb843783          	ld	a5,-72(s0)
    800036a4:	853e                	mv	a0,a5
    800036a6:	ffffe097          	auipc	ra,0xffffe
    800036aa:	c2c080e7          	jalr	-980(ra) # 800012d2 <release>
                            return 1;
    800036ae:	4785                	li	a5,1
    800036b0:	aa31                	j	800037cc <put+0x4a2>
                        }
                        release(&t->lock);
    800036b2:	fb843783          	ld	a5,-72(s0)
    800036b6:	853e                	mv	a0,a5
    800036b8:	ffffe097          	auipc	ra,0xffffe
    800036bc:	c1a080e7          	jalr	-998(ra) # 800012d2 <release>
                    }
                }
                return 0;
    800036c0:	4781                	li	a5,0
    800036c2:	a229                	j	800037cc <put+0x4a2>
        while (i != 0)
    800036c4:	fe843783          	ld	a5,-24(s0)
    800036c8:	e6079de3          	bnez	a5,80003542 <put+0x218>
            }
        }
        if (prev != 0)
    800036cc:	fe043783          	ld	a5,-32(s0)
    800036d0:	c7b9                	beqz	a5,8000371e <put+0x3f4>
        {
            acquire(&prev->lock);
    800036d2:	fe043783          	ld	a5,-32(s0)
    800036d6:	853e                	mv	a0,a5
    800036d8:	ffffe097          	auipc	ra,0xffffe
    800036dc:	b96080e7          	jalr	-1130(ra) # 8000126e <acquire>
            if (p->tau > prev->tau)
    800036e0:	fa843783          	ld	a5,-88(s0)
    800036e4:	16c7a703          	lw	a4,364(a5)
    800036e8:	fe043783          	ld	a5,-32(s0)
    800036ec:	16c7a783          	lw	a5,364(a5)
    800036f0:	00e7d963          	bge	a5,a4,80003702 <put+0x3d8>
                prev->right = p;
    800036f4:	fe043783          	ld	a5,-32(s0)
    800036f8:	fa843703          	ld	a4,-88(s0)
    800036fc:	16e7bc23          	sd	a4,376(a5)
    80003700:	a039                	j	8000370e <put+0x3e4>
            else
                prev->left = p;
    80003702:	fe043783          	ld	a5,-32(s0)
    80003706:	fa843703          	ld	a4,-88(s0)
    8000370a:	16e7b823          	sd	a4,368(a5)
            release(&prev->lock);
    8000370e:	fe043783          	ld	a5,-32(s0)
    80003712:	853e                	mv	a0,a5
    80003714:	ffffe097          	auipc	ra,0xffffe
    80003718:	bbe080e7          	jalr	-1090(ra) # 800012d2 <release>
    8000371c:	a801                	j	8000372c <put+0x402>
        }
        else
            tree_head = p;
    8000371e:	0000a797          	auipc	a5,0xa
    80003722:	91278793          	addi	a5,a5,-1774 # 8000d030 <tree_head>
    80003726:	fa843703          	ld	a4,-88(s0)
    8000372a:	e398                	sd	a4,0(a5)

        // check if there was preemption before returning
        if (sjf_preemptive == 1)
    8000372c:	00009797          	auipc	a5,0x9
    80003730:	01878793          	addi	a5,a5,24 # 8000c744 <sjf_preemptive>
    80003734:	439c                	lw	a5,0(a5)
    80003736:	873e                	mv	a4,a5
    80003738:	4785                	li	a5,1
    8000373a:	06f71a63          	bne	a4,a5,800037ae <put+0x484>
        {
            release(&mutex);
    8000373e:	00012517          	auipc	a0,0x12
    80003742:	b7a50513          	addi	a0,a0,-1158 # 800152b8 <mutex>
    80003746:	ffffe097          	auipc	ra,0xffffe
    8000374a:	b8c080e7          	jalr	-1140(ra) # 800012d2 <release>
            struct proc *t = myproc();
    8000374e:	fffff097          	auipc	ra,0xfffff
    80003752:	0de080e7          	jalr	222(ra) # 8000282c <myproc>
    80003756:	fca43023          	sd	a0,-64(s0)
            if (t != 0 && t != p)
    8000375a:	fc043783          	ld	a5,-64(s0)
    8000375e:	c7b1                	beqz	a5,800037aa <put+0x480>
    80003760:	fc043703          	ld	a4,-64(s0)
    80003764:	fa843783          	ld	a5,-88(s0)
    80003768:	04f70163          	beq	a4,a5,800037aa <put+0x480>
            {
                acquire(&t->lock);
    8000376c:	fc043783          	ld	a5,-64(s0)
    80003770:	853e                	mv	a0,a5
    80003772:	ffffe097          	auipc	ra,0xffffe
    80003776:	afc080e7          	jalr	-1284(ra) # 8000126e <acquire>
                if (t->preempted == 1)
    8000377a:	fc043783          	ld	a5,-64(s0)
    8000377e:	1887a783          	lw	a5,392(a5)
    80003782:	873e                	mv	a4,a5
    80003784:	4785                	li	a5,1
    80003786:	00f71b63          	bne	a4,a5,8000379c <put+0x472>
                {
                    release(&t->lock);
    8000378a:	fc043783          	ld	a5,-64(s0)
    8000378e:	853e                	mv	a0,a5
    80003790:	ffffe097          	auipc	ra,0xffffe
    80003794:	b42080e7          	jalr	-1214(ra) # 800012d2 <release>
                    return 1;
    80003798:	4785                	li	a5,1
    8000379a:	a80d                	j	800037cc <put+0x4a2>
                }
                release(&t->lock);
    8000379c:	fc043783          	ld	a5,-64(s0)
    800037a0:	853e                	mv	a0,a5
    800037a2:	ffffe097          	auipc	ra,0xffffe
    800037a6:	b30080e7          	jalr	-1232(ra) # 800012d2 <release>
            }
            return 0;
    800037aa:	4781                	li	a5,0
    800037ac:	a005                	j	800037cc <put+0x4a2>
        }
    }
    if (!alg_changing)
    800037ae:	0000a797          	auipc	a5,0xa
    800037b2:	87678793          	addi	a5,a5,-1930 # 8000d024 <alg_changing>
    800037b6:	439c                	lw	a5,0(a5)
    800037b8:	eb89                	bnez	a5,800037ca <put+0x4a0>
        release(&mutex);
    800037ba:	00012517          	auipc	a0,0x12
    800037be:	afe50513          	addi	a0,a0,-1282 # 800152b8 <mutex>
    800037c2:	ffffe097          	auipc	ra,0xffffe
    800037c6:	b10080e7          	jalr	-1264(ra) # 800012d2 <release>
    return 0;
    800037ca:	4781                	li	a5,0
}
    800037cc:	853e                	mv	a0,a5
    800037ce:	60e6                	ld	ra,88(sp)
    800037d0:	6446                	ld	s0,80(sp)
    800037d2:	6125                	addi	sp,sp,96
    800037d4:	8082                	ret

00000000800037d6 <miniput>:

//for advanced use in get()
void miniput(struct proc *p)
{
    800037d6:	7179                	addi	sp,sp,-48
    800037d8:	f406                	sd	ra,40(sp)
    800037da:	f022                	sd	s0,32(sp)
    800037dc:	1800                	addi	s0,sp,48
    800037de:	fca43c23          	sd	a0,-40(s0)
    if (p == 0)
    800037e2:	fd843783          	ld	a5,-40(s0)
    800037e6:	1c078363          	beqz	a5,800039ac <miniput+0x1d6>
        return;
    acquire(&p->lock);
    800037ea:	fd843783          	ld	a5,-40(s0)
    800037ee:	853e                	mv	a0,a5
    800037f0:	ffffe097          	auipc	ra,0xffffe
    800037f4:	a7e080e7          	jalr	-1410(ra) # 8000126e <acquire>
    if (tree_head != 0)
    800037f8:	0000a797          	auipc	a5,0xa
    800037fc:	83878793          	addi	a5,a5,-1992 # 8000d030 <tree_head>
    80003800:	639c                	ld	a5,0(a5)
    80003802:	cb99                	beqz	a5,80003818 <miniput+0x42>
        acquire(&tree_head->lock);
    80003804:	0000a797          	auipc	a5,0xa
    80003808:	82c78793          	addi	a5,a5,-2004 # 8000d030 <tree_head>
    8000380c:	639c                	ld	a5,0(a5)
    8000380e:	853e                	mv	a0,a5
    80003810:	ffffe097          	auipc	ra,0xffffe
    80003814:	a5e080e7          	jalr	-1442(ra) # 8000126e <acquire>
    struct proc *i = tree_head;  // tree iterator
    80003818:	0000a797          	auipc	a5,0xa
    8000381c:	81878793          	addi	a5,a5,-2024 # 8000d030 <tree_head>
    80003820:	639c                	ld	a5,0(a5)
    80003822:	fef43423          	sd	a5,-24(s0)
    struct proc *prev = i;       // remember iterator parent
    80003826:	fe843783          	ld	a5,-24(s0)
    8000382a:	fef43023          	sd	a5,-32(s0)
    while (i != 0)
    8000382e:	a219                	j	80003934 <miniput+0x15e>
    {
        if (p->tau > i->tau)
    80003830:	fd843783          	ld	a5,-40(s0)
    80003834:	16c7a703          	lw	a4,364(a5)
    80003838:	fe843783          	ld	a5,-24(s0)
    8000383c:	16c7a783          	lw	a5,364(a5)
    80003840:	04e7d263          	bge	a5,a4,80003884 <miniput+0xae>
        {
            if (i->right != 0)
    80003844:	fe843783          	ld	a5,-24(s0)
    80003848:	1787b783          	ld	a5,376(a5)
    8000384c:	cb91                	beqz	a5,80003860 <miniput+0x8a>
                acquire(&i->right->lock);
    8000384e:	fe843783          	ld	a5,-24(s0)
    80003852:	1787b783          	ld	a5,376(a5)
    80003856:	853e                	mv	a0,a5
    80003858:	ffffe097          	auipc	ra,0xffffe
    8000385c:	a16080e7          	jalr	-1514(ra) # 8000126e <acquire>
            prev = i;
    80003860:	fe843783          	ld	a5,-24(s0)
    80003864:	fef43023          	sd	a5,-32(s0)
            i = i->right;
    80003868:	fe843783          	ld	a5,-24(s0)
    8000386c:	1787b783          	ld	a5,376(a5)
    80003870:	fef43423          	sd	a5,-24(s0)
            release(&prev->lock);
    80003874:	fe043783          	ld	a5,-32(s0)
    80003878:	853e                	mv	a0,a5
    8000387a:	ffffe097          	auipc	ra,0xffffe
    8000387e:	a58080e7          	jalr	-1448(ra) # 800012d2 <release>
    80003882:	a84d                	j	80003934 <miniput+0x15e>
        }
        else if (p->tau < i->tau)
    80003884:	fd843783          	ld	a5,-40(s0)
    80003888:	16c7a703          	lw	a4,364(a5)
    8000388c:	fe843783          	ld	a5,-24(s0)
    80003890:	16c7a783          	lw	a5,364(a5)
    80003894:	06f75663          	bge	a4,a5,80003900 <miniput+0x12a>
        {
            if (i->left != 0)
    80003898:	fe843783          	ld	a5,-24(s0)
    8000389c:	1707b783          	ld	a5,368(a5)
    800038a0:	cb91                	beqz	a5,800038b4 <miniput+0xde>
                acquire(&i->left->lock);
    800038a2:	fe843783          	ld	a5,-24(s0)
    800038a6:	1707b783          	ld	a5,368(a5)
    800038aa:	853e                	mv	a0,a5
    800038ac:	ffffe097          	auipc	ra,0xffffe
    800038b0:	9c2080e7          	jalr	-1598(ra) # 8000126e <acquire>
            prev = i;
    800038b4:	fe843783          	ld	a5,-24(s0)
    800038b8:	fef43023          	sd	a5,-32(s0)
            i = i->left;
    800038bc:	fe843783          	ld	a5,-24(s0)
    800038c0:	1707b783          	ld	a5,368(a5)
    800038c4:	fef43423          	sd	a5,-24(s0)
            release(&prev->lock);
    800038c8:	fe043783          	ld	a5,-32(s0)
    800038cc:	853e                	mv	a0,a5
    800038ce:	ffffe097          	auipc	ra,0xffffe
    800038d2:	a04080e7          	jalr	-1532(ra) # 800012d2 <release>
    800038d6:	a8b9                	j	80003934 <miniput+0x15e>
        }
        else
        {
            while (i->next != 0)
            {
                release(&i->lock);
    800038d8:	fe843783          	ld	a5,-24(s0)
    800038dc:	853e                	mv	a0,a5
    800038de:	ffffe097          	auipc	ra,0xffffe
    800038e2:	9f4080e7          	jalr	-1548(ra) # 800012d2 <release>
                i = i->next;
    800038e6:	fe843783          	ld	a5,-24(s0)
    800038ea:	1807b783          	ld	a5,384(a5)
    800038ee:	fef43423          	sd	a5,-24(s0)
                acquire(&i->lock);
    800038f2:	fe843783          	ld	a5,-24(s0)
    800038f6:	853e                	mv	a0,a5
    800038f8:	ffffe097          	auipc	ra,0xffffe
    800038fc:	976080e7          	jalr	-1674(ra) # 8000126e <acquire>
            while (i->next != 0)
    80003900:	fe843783          	ld	a5,-24(s0)
    80003904:	1807b783          	ld	a5,384(a5)
    80003908:	fbe1                	bnez	a5,800038d8 <miniput+0x102>
            }
            i->next = p;
    8000390a:	fe843783          	ld	a5,-24(s0)
    8000390e:	fd843703          	ld	a4,-40(s0)
    80003912:	18e7b023          	sd	a4,384(a5)
            release(&i->lock);
    80003916:	fe843783          	ld	a5,-24(s0)
    8000391a:	853e                	mv	a0,a5
    8000391c:	ffffe097          	auipc	ra,0xffffe
    80003920:	9b6080e7          	jalr	-1610(ra) # 800012d2 <release>
            release(&p->lock);
    80003924:	fd843783          	ld	a5,-40(s0)
    80003928:	853e                	mv	a0,a5
    8000392a:	ffffe097          	auipc	ra,0xffffe
    8000392e:	9a8080e7          	jalr	-1624(ra) # 800012d2 <release>
            return;
    80003932:	a8b5                	j	800039ae <miniput+0x1d8>
    while (i != 0)
    80003934:	fe843783          	ld	a5,-24(s0)
    80003938:	ee079ce3          	bnez	a5,80003830 <miniput+0x5a>
        }
    }
    if (prev != 0)
    8000393c:	fe043783          	ld	a5,-32(s0)
    80003940:	c7b9                	beqz	a5,8000398e <miniput+0x1b8>
    {
        acquire(&prev->lock);
    80003942:	fe043783          	ld	a5,-32(s0)
    80003946:	853e                	mv	a0,a5
    80003948:	ffffe097          	auipc	ra,0xffffe
    8000394c:	926080e7          	jalr	-1754(ra) # 8000126e <acquire>
        if (p->tau > prev->tau)
    80003950:	fd843783          	ld	a5,-40(s0)
    80003954:	16c7a703          	lw	a4,364(a5)
    80003958:	fe043783          	ld	a5,-32(s0)
    8000395c:	16c7a783          	lw	a5,364(a5)
    80003960:	00e7d963          	bge	a5,a4,80003972 <miniput+0x19c>
            prev->right = p;
    80003964:	fe043783          	ld	a5,-32(s0)
    80003968:	fd843703          	ld	a4,-40(s0)
    8000396c:	16e7bc23          	sd	a4,376(a5)
    80003970:	a039                	j	8000397e <miniput+0x1a8>
        else
            prev->left = p;
    80003972:	fe043783          	ld	a5,-32(s0)
    80003976:	fd843703          	ld	a4,-40(s0)
    8000397a:	16e7b823          	sd	a4,368(a5)
        release(&prev->lock);
    8000397e:	fe043783          	ld	a5,-32(s0)
    80003982:	853e                	mv	a0,a5
    80003984:	ffffe097          	auipc	ra,0xffffe
    80003988:	94e080e7          	jalr	-1714(ra) # 800012d2 <release>
    8000398c:	a801                	j	8000399c <miniput+0x1c6>
    }
    else
        tree_head = p;
    8000398e:	00009797          	auipc	a5,0x9
    80003992:	6a278793          	addi	a5,a5,1698 # 8000d030 <tree_head>
    80003996:	fd843703          	ld	a4,-40(s0)
    8000399a:	e398                	sd	a4,0(a5)
    release(&p->lock);
    8000399c:	fd843783          	ld	a5,-40(s0)
    800039a0:	853e                	mv	a0,a5
    800039a2:	ffffe097          	auipc	ra,0xffffe
    800039a6:	930080e7          	jalr	-1744(ra) # 800012d2 <release>
    800039aa:	a011                	j	800039ae <miniput+0x1d8>
        return;
    800039ac:	0001                	nop
}
    800039ae:	70a2                	ld	ra,40(sp)
    800039b0:	7402                	ld	s0,32(sp)
    800039b2:	6145                	addi	sp,sp,48
    800039b4:	8082                	ret

00000000800039b6 <get>:

// returns proc with acquired lock
// or 0 if none are available
struct proc* get()
{
    800039b6:	7159                	addi	sp,sp,-112
    800039b8:	f486                	sd	ra,104(sp)
    800039ba:	f0a2                	sd	s0,96(sp)
    800039bc:	eca6                	sd	s1,88(sp)
    800039be:	1880                	addi	s0,sp,112
    // we can safely acquire mutex without releasing any other spinlock here,
    // since get() is only called from scheduler()
    acquire(&mutex);
    800039c0:	00012517          	auipc	a0,0x12
    800039c4:	8f850513          	addi	a0,a0,-1800 # 800152b8 <mutex>
    800039c8:	ffffe097          	auipc	ra,0xffffe
    800039cc:	8a6080e7          	jalr	-1882(ra) # 8000126e <acquire>
    int affinity_found = 0; // affinity_enabled must be 1
    800039d0:	fc042e23          	sw	zero,-36(s0)
    struct proc *p_aff = 0; // affinity_enabled must be 1
    800039d4:	fc043823          	sd	zero,-48(s0)
    struct proc *prev_aff = 0; // affinity_enabled must be 1
    800039d8:	fc043423          	sd	zero,-56(s0)
    struct proc *p;
    switch (algid)
    800039dc:	00009797          	auipc	a5,0x9
    800039e0:	64478793          	addi	a5,a5,1604 # 8000d020 <algid>
    800039e4:	439c                	lw	a5,0(a5)
    800039e6:	cf81                	beqz	a5,800039fe <get+0x48>
    800039e8:	873e                	mv	a4,a5
    800039ea:	58074263          	bltz	a4,80003f6e <get+0x5b8>
    800039ee:	2781                	sext.w	a5,a5
    800039f0:	37fd                	addiw	a5,a5,-1
    800039f2:	2781                	sext.w	a5,a5
    800039f4:	873e                	mv	a4,a5
    800039f6:	4785                	li	a5,1
    800039f8:	56e7eb63          	bltu	a5,a4,80003f6e <get+0x5b8>
    800039fc:	a8ad                	j	80003a76 <get+0xc0>
    {
        case 0: // default algorithm
        {
            for (p = proc; p < &proc[NPROC] && algid == 0; ++p)
    800039fe:	00012797          	auipc	a5,0x12
    80003a02:	cd278793          	addi	a5,a5,-814 # 800156d0 <proc>
    80003a06:	fcf43023          	sd	a5,-64(s0)
    80003a0a:	a0b9                	j	80003a58 <get+0xa2>
            {
                acquire(&p->lock);
    80003a0c:	fc043783          	ld	a5,-64(s0)
    80003a10:	853e                	mv	a0,a5
    80003a12:	ffffe097          	auipc	ra,0xffffe
    80003a16:	85c080e7          	jalr	-1956(ra) # 8000126e <acquire>
                if(p->state == RUNNABLE)
    80003a1a:	fc043783          	ld	a5,-64(s0)
    80003a1e:	4f9c                	lw	a5,24(a5)
    80003a20:	873e                	mv	a4,a5
    80003a22:	478d                	li	a5,3
    80003a24:	00f71d63          	bne	a4,a5,80003a3e <get+0x88>
                {
                    release(&mutex);
    80003a28:	00012517          	auipc	a0,0x12
    80003a2c:	89050513          	addi	a0,a0,-1904 # 800152b8 <mutex>
    80003a30:	ffffe097          	auipc	ra,0xffffe
    80003a34:	8a2080e7          	jalr	-1886(ra) # 800012d2 <release>
                    return p;
    80003a38:	fc043783          	ld	a5,-64(s0)
    80003a3c:	a391                	j	80003f80 <get+0x5ca>
                }
                release(&p->lock);
    80003a3e:	fc043783          	ld	a5,-64(s0)
    80003a42:	853e                	mv	a0,a5
    80003a44:	ffffe097          	auipc	ra,0xffffe
    80003a48:	88e080e7          	jalr	-1906(ra) # 800012d2 <release>
            for (p = proc; p < &proc[NPROC] && algid == 0; ++p)
    80003a4c:	fc043783          	ld	a5,-64(s0)
    80003a50:	19878793          	addi	a5,a5,408
    80003a54:	fcf43023          	sd	a5,-64(s0)
    80003a58:	fc043703          	ld	a4,-64(s0)
    80003a5c:	00018797          	auipc	a5,0x18
    80003a60:	27478793          	addi	a5,a5,628 # 8001bcd0 <pid_lock>
    80003a64:	50f77263          	bgeu	a4,a5,80003f68 <get+0x5b2>
    80003a68:	00009797          	auipc	a5,0x9
    80003a6c:	5b878793          	addi	a5,a5,1464 # 8000d020 <algid>
    80003a70:	439c                	lw	a5,0(a5)
    80003a72:	dfc9                	beqz	a5,80003a0c <get+0x56>
            }
            break;
    80003a74:	a9d5                	j	80003f68 <get+0x5b2>
        }
        case 1: case 2: // both SJF and CFS use the same binary tree structure
        {
            if (tree_head == 0)
    80003a76:	00009797          	auipc	a5,0x9
    80003a7a:	5ba78793          	addi	a5,a5,1466 # 8000d030 <tree_head>
    80003a7e:	639c                	ld	a5,0(a5)
    80003a80:	4e078663          	beqz	a5,80003f6c <get+0x5b6>
                break;
            p = tree_head;
    80003a84:	00009797          	auipc	a5,0x9
    80003a88:	5ac78793          	addi	a5,a5,1452 # 8000d030 <tree_head>
    80003a8c:	639c                	ld	a5,0(a5)
    80003a8e:	fcf43023          	sd	a5,-64(s0)
            struct proc *prev = p;
    80003a92:	fc043783          	ld	a5,-64(s0)
    80003a96:	faf43c23          	sd	a5,-72(s0)
            acquire(&p->lock);
    80003a9a:	fc043783          	ld	a5,-64(s0)
    80003a9e:	853e                	mv	a0,a5
    80003aa0:	ffffd097          	auipc	ra,0xffffd
    80003aa4:	7ce080e7          	jalr	1998(ra) # 8000126e <acquire>
            if (affinity_enabled) // check affinity; advanced
    80003aa8:	00009797          	auipc	a5,0x9
    80003aac:	ca078793          	addi	a5,a5,-864 # 8000c748 <affinity_enabled>
    80003ab0:	439c                	lw	a5,0(a5)
    80003ab2:	cfd5                	beqz	a5,80003b6e <get+0x1b8>
            {
                push_off();
    80003ab4:	ffffe097          	auipc	ra,0xffffe
    80003ab8:	8b8080e7          	jalr	-1864(ra) # 8000136c <push_off>
                if (p->affinity == cpuid())
    80003abc:	fc043783          	ld	a5,-64(s0)
    80003ac0:	1947a483          	lw	s1,404(a5)
    80003ac4:	fffff097          	auipc	ra,0xfffff
    80003ac8:	d0a080e7          	jalr	-758(ra) # 800027ce <cpuid>
    80003acc:	87aa                	mv	a5,a0
    80003ace:	8726                	mv	a4,s1
    80003ad0:	00f71d63          	bne	a4,a5,80003aea <get+0x134>
                {
                    affinity_found = 1;
    80003ad4:	4785                	li	a5,1
    80003ad6:	fcf42e23          	sw	a5,-36(s0)
                    p_aff = p;
    80003ada:	fc043783          	ld	a5,-64(s0)
    80003ade:	fcf43823          	sd	a5,-48(s0)
                    prev_aff = prev;
    80003ae2:	fb843783          	ld	a5,-72(s0)
    80003ae6:	fcf43423          	sd	a5,-56(s0)
                }
                pop_off();
    80003aea:	ffffe097          	auipc	ra,0xffffe
    80003aee:	8da080e7          	jalr	-1830(ra) # 800013c4 <pop_off>
            }
            while (p->left != 0)
    80003af2:	a8b5                	j	80003b6e <get+0x1b8>
            {
                prev = p;
    80003af4:	fc043783          	ld	a5,-64(s0)
    80003af8:	faf43c23          	sd	a5,-72(s0)
                p = p->left;
    80003afc:	fc043783          	ld	a5,-64(s0)
    80003b00:	1707b783          	ld	a5,368(a5)
    80003b04:	fcf43023          	sd	a5,-64(s0)
                release(&prev->lock);
    80003b08:	fb843783          	ld	a5,-72(s0)
    80003b0c:	853e                	mv	a0,a5
    80003b0e:	ffffd097          	auipc	ra,0xffffd
    80003b12:	7c4080e7          	jalr	1988(ra) # 800012d2 <release>
                acquire(&p->lock);
    80003b16:	fc043783          	ld	a5,-64(s0)
    80003b1a:	853e                	mv	a0,a5
    80003b1c:	ffffd097          	auipc	ra,0xffffd
    80003b20:	752080e7          	jalr	1874(ra) # 8000126e <acquire>
                if (affinity_enabled) // check affinity; advanced
    80003b24:	00009797          	auipc	a5,0x9
    80003b28:	c2478793          	addi	a5,a5,-988 # 8000c748 <affinity_enabled>
    80003b2c:	439c                	lw	a5,0(a5)
    80003b2e:	c3a1                	beqz	a5,80003b6e <get+0x1b8>
                {
                    push_off();
    80003b30:	ffffe097          	auipc	ra,0xffffe
    80003b34:	83c080e7          	jalr	-1988(ra) # 8000136c <push_off>
                    if (p->affinity == cpuid())
    80003b38:	fc043783          	ld	a5,-64(s0)
    80003b3c:	1947a483          	lw	s1,404(a5)
    80003b40:	fffff097          	auipc	ra,0xfffff
    80003b44:	c8e080e7          	jalr	-882(ra) # 800027ce <cpuid>
    80003b48:	87aa                	mv	a5,a0
    80003b4a:	8726                	mv	a4,s1
    80003b4c:	00f71d63          	bne	a4,a5,80003b66 <get+0x1b0>
                    {
                        affinity_found = 1;
    80003b50:	4785                	li	a5,1
    80003b52:	fcf42e23          	sw	a5,-36(s0)
                        p_aff = p;
    80003b56:	fc043783          	ld	a5,-64(s0)
    80003b5a:	fcf43823          	sd	a5,-48(s0)
                        prev_aff = prev;
    80003b5e:	fb843783          	ld	a5,-72(s0)
    80003b62:	fcf43423          	sd	a5,-56(s0)
                    }
                    pop_off();
    80003b66:	ffffe097          	auipc	ra,0xffffe
    80003b6a:	85e080e7          	jalr	-1954(ra) # 800013c4 <pop_off>
            while (p->left != 0)
    80003b6e:	fc043783          	ld	a5,-64(s0)
    80003b72:	1707b783          	ld	a5,368(a5)
    80003b76:	ffbd                	bnez	a5,80003af4 <get+0x13e>
                }
            }
            if (p->pid != prev->pid)
    80003b78:	fc043783          	ld	a5,-64(s0)
    80003b7c:	5b98                	lw	a4,48(a5)
    80003b7e:	fb843783          	ld	a5,-72(s0)
    80003b82:	5b9c                	lw	a5,48(a5)
    80003b84:	14f70863          	beq	a4,a5,80003cd4 <get+0x31e>
            {
                acquire(&prev->lock);
    80003b88:	fb843783          	ld	a5,-72(s0)
    80003b8c:	853e                	mv	a0,a5
    80003b8e:	ffffd097          	auipc	ra,0xffffd
    80003b92:	6e0080e7          	jalr	1760(ra) # 8000126e <acquire>
                if (p->next != 0)
    80003b96:	fc043783          	ld	a5,-64(s0)
    80003b9a:	1807b783          	ld	a5,384(a5)
    80003b9e:	10078163          	beqz	a5,80003ca0 <get+0x2ea>
                {
                    acquire(&p->next->lock);
    80003ba2:	fc043783          	ld	a5,-64(s0)
    80003ba6:	1807b783          	ld	a5,384(a5)
    80003baa:	853e                	mv	a0,a5
    80003bac:	ffffd097          	auipc	ra,0xffffd
    80003bb0:	6c2080e7          	jalr	1730(ra) # 8000126e <acquire>
                    //p->next->left = p->left;
                    p->next->right = p->right;
    80003bb4:	fc043783          	ld	a5,-64(s0)
    80003bb8:	1807b783          	ld	a5,384(a5)
    80003bbc:	fc043703          	ld	a4,-64(s0)
    80003bc0:	17873703          	ld	a4,376(a4) # 1178 <_entry-0x7fffee88>
    80003bc4:	16e7bc23          	sd	a4,376(a5)
                    prev->left = p->next;
    80003bc8:	fc043783          	ld	a5,-64(s0)
    80003bcc:	1807b703          	ld	a4,384(a5)
    80003bd0:	fb843783          	ld	a5,-72(s0)
    80003bd4:	16e7b823          	sd	a4,368(a5)
                    //release(&p->next->lock);
                    if (affinity_enabled) // advanced
    80003bd8:	00009797          	auipc	a5,0x9
    80003bdc:	b7078793          	addi	a5,a5,-1168 # 8000c748 <affinity_enabled>
    80003be0:	439c                	lw	a5,0(a5)
    80003be2:	c7cd                	beqz	a5,80003c8c <get+0x2d6>
                    {
                        struct proc *t = p->next;
    80003be4:	fc043783          	ld	a5,-64(s0)
    80003be8:	1807b783          	ld	a5,384(a5)
    80003bec:	faf43823          	sd	a5,-80(s0)
                        struct proc *prevt = p;
    80003bf0:	fc043783          	ld	a5,-64(s0)
    80003bf4:	faf43423          	sd	a5,-88(s0)
                        while (t != 0)
    80003bf8:	a8b9                	j	80003c56 <get+0x2a0>
                        {
                            push_off();
    80003bfa:	ffffd097          	auipc	ra,0xffffd
    80003bfe:	772080e7          	jalr	1906(ra) # 8000136c <push_off>
                            if (t->affinity == cpuid())
    80003c02:	fb043783          	ld	a5,-80(s0)
    80003c06:	1947a483          	lw	s1,404(a5)
    80003c0a:	fffff097          	auipc	ra,0xfffff
    80003c0e:	bc4080e7          	jalr	-1084(ra) # 800027ce <cpuid>
    80003c12:	87aa                	mv	a5,a0
    80003c14:	8726                	mv	a4,s1
    80003c16:	02f71263          	bne	a4,a5,80003c3a <get+0x284>
                            {
                                affinity_found = 1;
    80003c1a:	4785                	li	a5,1
    80003c1c:	fcf42e23          	sw	a5,-36(s0)
                                p_aff = t;
    80003c20:	fb043783          	ld	a5,-80(s0)
    80003c24:	fcf43823          	sd	a5,-48(s0)
                                prev_aff = prevt;
    80003c28:	fa843783          	ld	a5,-88(s0)
    80003c2c:	fcf43423          	sd	a5,-56(s0)
                                pop_off();
    80003c30:	ffffd097          	auipc	ra,0xffffd
    80003c34:	794080e7          	jalr	1940(ra) # 800013c4 <pop_off>
                                break;
    80003c38:	a015                	j	80003c5c <get+0x2a6>
                            }
                            pop_off();
    80003c3a:	ffffd097          	auipc	ra,0xffffd
    80003c3e:	78a080e7          	jalr	1930(ra) # 800013c4 <pop_off>
                            prevt = t;
    80003c42:	fb043783          	ld	a5,-80(s0)
    80003c46:	faf43423          	sd	a5,-88(s0)
                            t = t->next;
    80003c4a:	fb043783          	ld	a5,-80(s0)
    80003c4e:	1807b783          	ld	a5,384(a5)
    80003c52:	faf43823          	sd	a5,-80(s0)
                        while (t != 0)
    80003c56:	fb043783          	ld	a5,-80(s0)
    80003c5a:	f3c5                	bnez	a5,80003bfa <get+0x244>
                        }
                        if (affinity_found && p_aff == p->next)
    80003c5c:	fdc42783          	lw	a5,-36(s0)
    80003c60:	2781                	sext.w	a5,a5
    80003c62:	c78d                	beqz	a5,80003c8c <get+0x2d6>
    80003c64:	fc043783          	ld	a5,-64(s0)
    80003c68:	1807b783          	ld	a5,384(a5)
    80003c6c:	fd043703          	ld	a4,-48(s0)
    80003c70:	00f71e63          	bne	a4,a5,80003c8c <get+0x2d6>
                        {
                            p->next->right = 0;
    80003c74:	fc043783          	ld	a5,-64(s0)
    80003c78:	1807b783          	ld	a5,384(a5)
    80003c7c:	1607bc23          	sd	zero,376(a5)
                            prev->left = p;
    80003c80:	fb843783          	ld	a5,-72(s0)
    80003c84:	fc043703          	ld	a4,-64(s0)
    80003c88:	16e7b823          	sd	a4,368(a5)
                        }
                    }
                    release(&p->next->lock);
    80003c8c:	fc043783          	ld	a5,-64(s0)
    80003c90:	1807b783          	ld	a5,384(a5)
    80003c94:	853e                	mv	a0,a5
    80003c96:	ffffd097          	auipc	ra,0xffffd
    80003c9a:	63c080e7          	jalr	1596(ra) # 800012d2 <release>
    80003c9e:	a01d                	j	80003cc4 <get+0x30e>
                }
                else if (p->right != 0)
    80003ca0:	fc043783          	ld	a5,-64(s0)
    80003ca4:	1787b783          	ld	a5,376(a5)
    80003ca8:	cb91                	beqz	a5,80003cbc <get+0x306>
                    prev->left = p->right;
    80003caa:	fc043783          	ld	a5,-64(s0)
    80003cae:	1787b703          	ld	a4,376(a5)
    80003cb2:	fb843783          	ld	a5,-72(s0)
    80003cb6:	16e7b823          	sd	a4,368(a5)
    80003cba:	a029                	j	80003cc4 <get+0x30e>
                else
                    prev->left = 0;
    80003cbc:	fb843783          	ld	a5,-72(s0)
    80003cc0:	1607b823          	sd	zero,368(a5)
                release(&prev->lock);
    80003cc4:	fb843783          	ld	a5,-72(s0)
    80003cc8:	853e                	mv	a0,a5
    80003cca:	ffffd097          	auipc	ra,0xffffd
    80003cce:	608080e7          	jalr	1544(ra) # 800012d2 <release>
    80003cd2:	a20d                	j	80003df4 <get+0x43e>
            }
            else
            {
                if (p->next != 0)
    80003cd4:	fc043783          	ld	a5,-64(s0)
    80003cd8:	1807b783          	ld	a5,384(a5)
    80003cdc:	10078363          	beqz	a5,80003de2 <get+0x42c>
                {
                    acquire(&p->next->lock);
    80003ce0:	fc043783          	ld	a5,-64(s0)
    80003ce4:	1807b783          	ld	a5,384(a5)
    80003ce8:	853e                	mv	a0,a5
    80003cea:	ffffd097          	auipc	ra,0xffffd
    80003cee:	584080e7          	jalr	1412(ra) # 8000126e <acquire>
                    //p->next->left = p->left;
                    p->next->right = p->right;
    80003cf2:	fc043783          	ld	a5,-64(s0)
    80003cf6:	1807b783          	ld	a5,384(a5)
    80003cfa:	fc043703          	ld	a4,-64(s0)
    80003cfe:	17873703          	ld	a4,376(a4)
    80003d02:	16e7bc23          	sd	a4,376(a5)
                    tree_head = p->next;
    80003d06:	fc043783          	ld	a5,-64(s0)
    80003d0a:	1807b703          	ld	a4,384(a5)
    80003d0e:	00009797          	auipc	a5,0x9
    80003d12:	32278793          	addi	a5,a5,802 # 8000d030 <tree_head>
    80003d16:	e398                	sd	a4,0(a5)
                    //release(&p->next->lock);
                    if (affinity_enabled) // advanced
    80003d18:	00009797          	auipc	a5,0x9
    80003d1c:	a3078793          	addi	a5,a5,-1488 # 8000c748 <affinity_enabled>
    80003d20:	439c                	lw	a5,0(a5)
    80003d22:	c7d5                	beqz	a5,80003dce <get+0x418>
                    {
                        struct proc *t = p->next;
    80003d24:	fc043783          	ld	a5,-64(s0)
    80003d28:	1807b783          	ld	a5,384(a5)
    80003d2c:	faf43023          	sd	a5,-96(s0)
                        struct proc *prevt = p;
    80003d30:	fc043783          	ld	a5,-64(s0)
    80003d34:	f8f43c23          	sd	a5,-104(s0)
                        while (t != 0)
    80003d38:	a8b9                	j	80003d96 <get+0x3e0>
                        {
                            push_off();
    80003d3a:	ffffd097          	auipc	ra,0xffffd
    80003d3e:	632080e7          	jalr	1586(ra) # 8000136c <push_off>
                            if (t->affinity == cpuid())
    80003d42:	fa043783          	ld	a5,-96(s0)
    80003d46:	1947a483          	lw	s1,404(a5)
    80003d4a:	fffff097          	auipc	ra,0xfffff
    80003d4e:	a84080e7          	jalr	-1404(ra) # 800027ce <cpuid>
    80003d52:	87aa                	mv	a5,a0
    80003d54:	8726                	mv	a4,s1
    80003d56:	02f71263          	bne	a4,a5,80003d7a <get+0x3c4>
                            {
                                affinity_found = 1;
    80003d5a:	4785                	li	a5,1
    80003d5c:	fcf42e23          	sw	a5,-36(s0)
                                p_aff = t;
    80003d60:	fa043783          	ld	a5,-96(s0)
    80003d64:	fcf43823          	sd	a5,-48(s0)
                                prev_aff = prevt;
    80003d68:	f9843783          	ld	a5,-104(s0)
    80003d6c:	fcf43423          	sd	a5,-56(s0)
                                pop_off();
    80003d70:	ffffd097          	auipc	ra,0xffffd
    80003d74:	654080e7          	jalr	1620(ra) # 800013c4 <pop_off>
                                break;
    80003d78:	a015                	j	80003d9c <get+0x3e6>
                            }
                            pop_off();
    80003d7a:	ffffd097          	auipc	ra,0xffffd
    80003d7e:	64a080e7          	jalr	1610(ra) # 800013c4 <pop_off>
                            prevt = t;
    80003d82:	fa043783          	ld	a5,-96(s0)
    80003d86:	f8f43c23          	sd	a5,-104(s0)
                            t = t->next;
    80003d8a:	fa043783          	ld	a5,-96(s0)
    80003d8e:	1807b783          	ld	a5,384(a5)
    80003d92:	faf43023          	sd	a5,-96(s0)
                        while (t != 0)
    80003d96:	fa043783          	ld	a5,-96(s0)
    80003d9a:	f3c5                	bnez	a5,80003d3a <get+0x384>
                        }
                        if (affinity_found && p_aff == p->next)
    80003d9c:	fdc42783          	lw	a5,-36(s0)
    80003da0:	2781                	sext.w	a5,a5
    80003da2:	c795                	beqz	a5,80003dce <get+0x418>
    80003da4:	fc043783          	ld	a5,-64(s0)
    80003da8:	1807b783          	ld	a5,384(a5)
    80003dac:	fd043703          	ld	a4,-48(s0)
    80003db0:	00f71f63          	bne	a4,a5,80003dce <get+0x418>
                        {
                            tree_head = p;
    80003db4:	00009797          	auipc	a5,0x9
    80003db8:	27c78793          	addi	a5,a5,636 # 8000d030 <tree_head>
    80003dbc:	fc043703          	ld	a4,-64(s0)
    80003dc0:	e398                	sd	a4,0(a5)
                            p->next->right = 0;
    80003dc2:	fc043783          	ld	a5,-64(s0)
    80003dc6:	1807b783          	ld	a5,384(a5)
    80003dca:	1607bc23          	sd	zero,376(a5)
                        }
                    }
                    release(&p->next->lock);
    80003dce:	fc043783          	ld	a5,-64(s0)
    80003dd2:	1807b783          	ld	a5,384(a5)
    80003dd6:	853e                	mv	a0,a5
    80003dd8:	ffffd097          	auipc	ra,0xffffd
    80003ddc:	4fa080e7          	jalr	1274(ra) # 800012d2 <release>
    80003de0:	a811                	j	80003df4 <get+0x43e>
                }
                else
                    tree_head = p->right;
    80003de2:	fc043783          	ld	a5,-64(s0)
    80003de6:	1787b703          	ld	a4,376(a5)
    80003dea:	00009797          	auipc	a5,0x9
    80003dee:	24678793          	addi	a5,a5,582 # 8000d030 <tree_head>
    80003df2:	e398                	sd	a4,0(a5)
            }
            if (affinity_found && p_aff != p)
    80003df4:	fdc42783          	lw	a5,-36(s0)
    80003df8:	2781                	sext.w	a5,a5
    80003dfa:	14078063          	beqz	a5,80003f3a <get+0x584>
    80003dfe:	fd043703          	ld	a4,-48(s0)
    80003e02:	fc043783          	ld	a5,-64(s0)
    80003e06:	12f70a63          	beq	a4,a5,80003f3a <get+0x584>
            {
                release(&p->lock);
    80003e0a:	fc043783          	ld	a5,-64(s0)
    80003e0e:	853e                	mv	a0,a5
    80003e10:	ffffd097          	auipc	ra,0xffffd
    80003e14:	4c2080e7          	jalr	1218(ra) # 800012d2 <release>
                acquire(&p_aff->lock);
    80003e18:	fd043783          	ld	a5,-48(s0)
    80003e1c:	853e                	mv	a0,a5
    80003e1e:	ffffd097          	auipc	ra,0xffffd
    80003e22:	450080e7          	jalr	1104(ra) # 8000126e <acquire>
                if (p_aff != prev_aff) {
    80003e26:	fd043703          	ld	a4,-48(s0)
    80003e2a:	fc843783          	ld	a5,-56(s0)
    80003e2e:	08f70e63          	beq	a4,a5,80003eca <get+0x514>
                    acquire(&prev_aff->lock);
    80003e32:	fc843783          	ld	a5,-56(s0)
    80003e36:	853e                	mv	a0,a5
    80003e38:	ffffd097          	auipc	ra,0xffffd
    80003e3c:	436080e7          	jalr	1078(ra) # 8000126e <acquire>
                    if (prev_aff->tau == p_aff->tau)
    80003e40:	fc843783          	ld	a5,-56(s0)
    80003e44:	16c7a703          	lw	a4,364(a5)
    80003e48:	fd043783          	ld	a5,-48(s0)
    80003e4c:	16c7a783          	lw	a5,364(a5)
    80003e50:	00f71763          	bne	a4,a5,80003e5e <get+0x4a8>
                        prev_aff->next = 0;
    80003e54:	fc843783          	ld	a5,-56(s0)
    80003e58:	1807b023          	sd	zero,384(a5)
    80003e5c:	a025                	j	80003e84 <get+0x4ce>
                    else if (prev_aff->tau > p_aff->tau)
    80003e5e:	fc843783          	ld	a5,-56(s0)
    80003e62:	16c7a703          	lw	a4,364(a5)
    80003e66:	fd043783          	ld	a5,-48(s0)
    80003e6a:	16c7a783          	lw	a5,364(a5)
    80003e6e:	00e7d763          	bge	a5,a4,80003e7c <get+0x4c6>
                        prev_aff->left = 0;
    80003e72:	fc843783          	ld	a5,-56(s0)
    80003e76:	1607b823          	sd	zero,368(a5)
    80003e7a:	a029                	j	80003e84 <get+0x4ce>
                    else
                        prev_aff->right = 0;
    80003e7c:	fc843783          	ld	a5,-56(s0)
    80003e80:	1607bc23          	sd	zero,376(a5)
                    release(&prev_aff->lock);
    80003e84:	fc843783          	ld	a5,-56(s0)
    80003e88:	853e                	mv	a0,a5
    80003e8a:	ffffd097          	auipc	ra,0xffffd
    80003e8e:	448080e7          	jalr	1096(ra) # 800012d2 <release>
                    miniput(p_aff->next);
    80003e92:	fd043783          	ld	a5,-48(s0)
    80003e96:	1807b783          	ld	a5,384(a5)
    80003e9a:	853e                	mv	a0,a5
    80003e9c:	00000097          	auipc	ra,0x0
    80003ea0:	93a080e7          	jalr	-1734(ra) # 800037d6 <miniput>
                    miniput(p_aff->right);
    80003ea4:	fd043783          	ld	a5,-48(s0)
    80003ea8:	1787b783          	ld	a5,376(a5)
    80003eac:	853e                	mv	a0,a5
    80003eae:	00000097          	auipc	ra,0x0
    80003eb2:	928080e7          	jalr	-1752(ra) # 800037d6 <miniput>
                    miniput(p_aff->left);
    80003eb6:	fd043783          	ld	a5,-48(s0)
    80003eba:	1707b783          	ld	a5,368(a5)
    80003ebe:	853e                	mv	a0,a5
    80003ec0:	00000097          	auipc	ra,0x0
    80003ec4:	916080e7          	jalr	-1770(ra) # 800037d6 <miniput>
    80003ec8:	a091                	j	80003f0c <get+0x556>
                }
                else {
                    tree_head = 0;
    80003eca:	00009797          	auipc	a5,0x9
    80003ece:	16678793          	addi	a5,a5,358 # 8000d030 <tree_head>
    80003ed2:	0007b023          	sd	zero,0(a5)
                    miniput(p_aff->next);
    80003ed6:	fd043783          	ld	a5,-48(s0)
    80003eda:	1807b783          	ld	a5,384(a5)
    80003ede:	853e                	mv	a0,a5
    80003ee0:	00000097          	auipc	ra,0x0
    80003ee4:	8f6080e7          	jalr	-1802(ra) # 800037d6 <miniput>
                    miniput(p_aff->right);
    80003ee8:	fd043783          	ld	a5,-48(s0)
    80003eec:	1787b783          	ld	a5,376(a5)
    80003ef0:	853e                	mv	a0,a5
    80003ef2:	00000097          	auipc	ra,0x0
    80003ef6:	8e4080e7          	jalr	-1820(ra) # 800037d6 <miniput>
                    miniput(p_aff->left);
    80003efa:	fd043783          	ld	a5,-48(s0)
    80003efe:	1707b783          	ld	a5,368(a5)
    80003f02:	853e                	mv	a0,a5
    80003f04:	00000097          	auipc	ra,0x0
    80003f08:	8d2080e7          	jalr	-1838(ra) # 800037d6 <miniput>
                }
                p_aff->next = 0;
    80003f0c:	fd043783          	ld	a5,-48(s0)
    80003f10:	1807b023          	sd	zero,384(a5)
                p_aff->left = 0;
    80003f14:	fd043783          	ld	a5,-48(s0)
    80003f18:	1607b823          	sd	zero,368(a5)
                p_aff->right = 0;
    80003f1c:	fd043783          	ld	a5,-48(s0)
    80003f20:	1607bc23          	sd	zero,376(a5)
                release(&mutex);
    80003f24:	00011517          	auipc	a0,0x11
    80003f28:	39450513          	addi	a0,a0,916 # 800152b8 <mutex>
    80003f2c:	ffffd097          	auipc	ra,0xffffd
    80003f30:	3a6080e7          	jalr	934(ra) # 800012d2 <release>
                return p_aff;
    80003f34:	fd043783          	ld	a5,-48(s0)
    80003f38:	a0a1                	j	80003f80 <get+0x5ca>
            }
            p->next = 0;
    80003f3a:	fc043783          	ld	a5,-64(s0)
    80003f3e:	1807b023          	sd	zero,384(a5)
            p->left = 0;
    80003f42:	fc043783          	ld	a5,-64(s0)
    80003f46:	1607b823          	sd	zero,368(a5)
            p->right = 0;
    80003f4a:	fc043783          	ld	a5,-64(s0)
    80003f4e:	1607bc23          	sd	zero,376(a5)
            release(&mutex);
    80003f52:	00011517          	auipc	a0,0x11
    80003f56:	36650513          	addi	a0,a0,870 # 800152b8 <mutex>
    80003f5a:	ffffd097          	auipc	ra,0xffffd
    80003f5e:	378080e7          	jalr	888(ra) # 800012d2 <release>
            return p;
    80003f62:	fc043783          	ld	a5,-64(s0)
    80003f66:	a829                	j	80003f80 <get+0x5ca>
            break;
    80003f68:	0001                	nop
    80003f6a:	a011                	j	80003f6e <get+0x5b8>
                break;
    80003f6c:	0001                	nop
        }
    }
    release(&mutex);
    80003f6e:	00011517          	auipc	a0,0x11
    80003f72:	34a50513          	addi	a0,a0,842 # 800152b8 <mutex>
    80003f76:	ffffd097          	auipc	ra,0xffffd
    80003f7a:	35c080e7          	jalr	860(ra) # 800012d2 <release>
    return 0;
    80003f7e:	4781                	li	a5,0
}
    80003f80:	853e                	mv	a0,a5
    80003f82:	70a6                	ld	ra,104(sp)
    80003f84:	7406                	ld	s0,96(sp)
    80003f86:	64e6                	ld	s1,88(sp)
    80003f88:	6165                	addi	sp,sp,112
    80003f8a:	8082                	ret

0000000080003f8c <setSchedAlg>:

int setSchedAlg(int alg, int arg1, int arg2)
{
    80003f8c:	715d                	addi	sp,sp,-80
    80003f8e:	e486                	sd	ra,72(sp)
    80003f90:	e0a2                	sd	s0,64(sp)
    80003f92:	0880                	addi	s0,sp,80
    80003f94:	87aa                	mv	a5,a0
    80003f96:	86ae                	mv	a3,a1
    80003f98:	8732                	mv	a4,a2
    80003f9a:	faf42e23          	sw	a5,-68(s0)
    80003f9e:	87b6                	mv	a5,a3
    80003fa0:	faf42c23          	sw	a5,-72(s0)
    80003fa4:	87ba                	mv	a5,a4
    80003fa6:	faf42a23          	sw	a5,-76(s0)
    if (alg < 0 || alg > 2)
    80003faa:	fbc42783          	lw	a5,-68(s0)
    80003fae:	2781                	sext.w	a5,a5
    80003fb0:	0007c963          	bltz	a5,80003fc2 <setSchedAlg+0x36>
    80003fb4:	fbc42783          	lw	a5,-68(s0)
    80003fb8:	0007871b          	sext.w	a4,a5
    80003fbc:	4789                	li	a5,2
    80003fbe:	00e7d463          	bge	a5,a4,80003fc6 <setSchedAlg+0x3a>
        return -1;
    80003fc2:	57fd                	li	a5,-1
    80003fc4:	a1e1                	j	8000448c <setSchedAlg+0x500>
    if (alg == 1 && (arg1 < 0 || arg1 > 100))
    80003fc6:	fbc42783          	lw	a5,-68(s0)
    80003fca:	0007871b          	sext.w	a4,a5
    80003fce:	4785                	li	a5,1
    80003fd0:	02f71163          	bne	a4,a5,80003ff2 <setSchedAlg+0x66>
    80003fd4:	fb842783          	lw	a5,-72(s0)
    80003fd8:	2781                	sext.w	a5,a5
    80003fda:	0007ca63          	bltz	a5,80003fee <setSchedAlg+0x62>
    80003fde:	fb842783          	lw	a5,-72(s0)
    80003fe2:	0007871b          	sext.w	a4,a5
    80003fe6:	06400793          	li	a5,100
    80003fea:	00e7d463          	bge	a5,a4,80003ff2 <setSchedAlg+0x66>
        return -1;
    80003fee:	57fd                	li	a5,-1
    80003ff0:	a971                	j	8000448c <setSchedAlg+0x500>
    if (alg == 1 && (arg2 < 0 || arg2 > 1))
    80003ff2:	fbc42783          	lw	a5,-68(s0)
    80003ff6:	0007871b          	sext.w	a4,a5
    80003ffa:	4785                	li	a5,1
    80003ffc:	02f71063          	bne	a4,a5,8000401c <setSchedAlg+0x90>
    80004000:	fb442783          	lw	a5,-76(s0)
    80004004:	2781                	sext.w	a5,a5
    80004006:	0007c963          	bltz	a5,80004018 <setSchedAlg+0x8c>
    8000400a:	fb442783          	lw	a5,-76(s0)
    8000400e:	0007871b          	sext.w	a4,a5
    80004012:	4785                	li	a5,1
    80004014:	00e7d463          	bge	a5,a4,8000401c <setSchedAlg+0x90>
        return -1;
    80004018:	57fd                	li	a5,-1
    8000401a:	a98d                	j	8000448c <setSchedAlg+0x500>
    acquire(&mutex);
    8000401c:	00011517          	auipc	a0,0x11
    80004020:	29c50513          	addi	a0,a0,668 # 800152b8 <mutex>
    80004024:	ffffd097          	auipc	ra,0xffffd
    80004028:	24a080e7          	jalr	586(ra) # 8000126e <acquire>
    // alg is changing: grant exclusive right for mutex
    alg_changing = 1;
    8000402c:	00009797          	auipc	a5,0x9
    80004030:	ff878793          	addi	a5,a5,-8 # 8000d024 <alg_changing>
    80004034:	4705                	li	a4,1
    80004036:	c398                	sw	a4,0(a5)
    switch (algid)
    80004038:	00009797          	auipc	a5,0x9
    8000403c:	fe878793          	addi	a5,a5,-24 # 8000d020 <algid>
    80004040:	439c                	lw	a5,0(a5)
    80004042:	86be                	mv	a3,a5
    80004044:	4709                	li	a4,2
    80004046:	2ee68d63          	beq	a3,a4,80004340 <setSchedAlg+0x3b4>
    8000404a:	86be                	mv	a3,a5
    8000404c:	4709                	li	a4,2
    8000404e:	42d74063          	blt	a4,a3,8000446e <setSchedAlg+0x4e2>
    80004052:	c791                	beqz	a5,8000405e <setSchedAlg+0xd2>
    80004054:	873e                	mv	a4,a5
    80004056:	4785                	li	a5,1
    80004058:	16f70263          	beq	a4,a5,800041bc <setSchedAlg+0x230>
    8000405c:	a909                	j	8000446e <setSchedAlg+0x4e2>
    {
        case 0: // was default
        {
            if (alg == 1) // switch to SJF
    8000405e:	fbc42783          	lw	a5,-68(s0)
    80004062:	0007871b          	sext.w	a4,a5
    80004066:	4785                	li	a5,1
    80004068:	08f71863          	bne	a4,a5,800040f8 <setSchedAlg+0x16c>
            {
                algid = alg;
    8000406c:	00009797          	auipc	a5,0x9
    80004070:	fb478793          	addi	a5,a5,-76 # 8000d020 <algid>
    80004074:	fbc42703          	lw	a4,-68(s0)
    80004078:	c398                	sw	a4,0(a5)
                sjf_coefficient = arg1;
    8000407a:	00008797          	auipc	a5,0x8
    8000407e:	6c678793          	addi	a5,a5,1734 # 8000c740 <sjf_coefficient>
    80004082:	fb842703          	lw	a4,-72(s0)
    80004086:	c398                	sw	a4,0(a5)
                for (struct proc *p = proc; p < &proc[NPROC]; ++p)
    80004088:	00011797          	auipc	a5,0x11
    8000408c:	64878793          	addi	a5,a5,1608 # 800156d0 <proc>
    80004090:	fef43423          	sd	a5,-24(s0)
    80004094:	a091                	j	800040d8 <setSchedAlg+0x14c>
                {
                    acquire(&p->lock);
    80004096:	fe843783          	ld	a5,-24(s0)
    8000409a:	853e                	mv	a0,a5
    8000409c:	ffffd097          	auipc	ra,0xffffd
    800040a0:	1d2080e7          	jalr	466(ra) # 8000126e <acquire>
                    if (p->state == RUNNABLE)
    800040a4:	fe843783          	ld	a5,-24(s0)
    800040a8:	4f9c                	lw	a5,24(a5)
    800040aa:	873e                	mv	a4,a5
    800040ac:	478d                	li	a5,3
    800040ae:	00f71863          	bne	a4,a5,800040be <setSchedAlg+0x132>
                        put(p);
    800040b2:	fe843503          	ld	a0,-24(s0)
    800040b6:	fffff097          	auipc	ra,0xfffff
    800040ba:	274080e7          	jalr	628(ra) # 8000332a <put>
                    release(&p->lock);
    800040be:	fe843783          	ld	a5,-24(s0)
    800040c2:	853e                	mv	a0,a5
    800040c4:	ffffd097          	auipc	ra,0xffffd
    800040c8:	20e080e7          	jalr	526(ra) # 800012d2 <release>
                for (struct proc *p = proc; p < &proc[NPROC]; ++p)
    800040cc:	fe843783          	ld	a5,-24(s0)
    800040d0:	19878793          	addi	a5,a5,408
    800040d4:	fef43423          	sd	a5,-24(s0)
    800040d8:	fe843703          	ld	a4,-24(s0)
    800040dc:	00018797          	auipc	a5,0x18
    800040e0:	bf478793          	addi	a5,a5,-1036 # 8001bcd0 <pid_lock>
    800040e4:	faf769e3          	bltu	a4,a5,80004096 <setSchedAlg+0x10a>
                }
                sjf_preemptive = arg2; // no preemption until every proc has settled in
    800040e8:	00008797          	auipc	a5,0x8
    800040ec:	65c78793          	addi	a5,a5,1628 # 8000c744 <sjf_preemptive>
    800040f0:	fb442703          	lw	a4,-76(s0)
    800040f4:	c398                	sw	a4,0(a5)
                        p->timestamp = ticks;
                    release(&p->lock);
                }
                release(&tickslock);
            }
            break;
    800040f6:	a6bd                	j	80004464 <setSchedAlg+0x4d8>
            else if (alg == 2) // switch to CFS
    800040f8:	fbc42783          	lw	a5,-68(s0)
    800040fc:	0007871b          	sext.w	a4,a5
    80004100:	4789                	li	a5,2
    80004102:	36f71163          	bne	a4,a5,80004464 <setSchedAlg+0x4d8>
                acquire(&tickslock);
    80004106:	00018517          	auipc	a0,0x18
    8000410a:	bfa50513          	addi	a0,a0,-1030 # 8001bd00 <tickslock>
    8000410e:	ffffd097          	auipc	ra,0xffffd
    80004112:	160080e7          	jalr	352(ra) # 8000126e <acquire>
                algid = alg;
    80004116:	00009797          	auipc	a5,0x9
    8000411a:	f0a78793          	addi	a5,a5,-246 # 8000d020 <algid>
    8000411e:	fbc42703          	lw	a4,-68(s0)
    80004122:	c398                	sw	a4,0(a5)
                for (struct proc *p = proc; p < &proc[NPROC]; ++p)
    80004124:	00011797          	auipc	a5,0x11
    80004128:	5ac78793          	addi	a5,a5,1452 # 800156d0 <proc>
    8000412c:	fef43023          	sd	a5,-32(s0)
    80004130:	a0ad                	j	8000419a <setSchedAlg+0x20e>
                    acquire(&p->lock);
    80004132:	fe043783          	ld	a5,-32(s0)
    80004136:	853e                	mv	a0,a5
    80004138:	ffffd097          	auipc	ra,0xffffd
    8000413c:	136080e7          	jalr	310(ra) # 8000126e <acquire>
                    p->tau = 0;
    80004140:	fe043783          	ld	a5,-32(s0)
    80004144:	1607a623          	sw	zero,364(a5)
                    p->quantum = 1;
    80004148:	fe043783          	ld	a5,-32(s0)
    8000414c:	4705                	li	a4,1
    8000414e:	18e7a823          	sw	a4,400(a5)
                    if (p->state == RUNNABLE)
    80004152:	fe043783          	ld	a5,-32(s0)
    80004156:	4f9c                	lw	a5,24(a5)
    80004158:	873e                	mv	a4,a5
    8000415a:	478d                	li	a5,3
    8000415c:	00f71963          	bne	a4,a5,8000416e <setSchedAlg+0x1e2>
                        put(p);
    80004160:	fe043503          	ld	a0,-32(s0)
    80004164:	fffff097          	auipc	ra,0xfffff
    80004168:	1c6080e7          	jalr	454(ra) # 8000332a <put>
    8000416c:	a811                	j	80004180 <setSchedAlg+0x1f4>
                        p->timestamp = ticks;
    8000416e:	00009797          	auipc	a5,0x9
    80004172:	ed278793          	addi	a5,a5,-302 # 8000d040 <ticks>
    80004176:	4398                	lw	a4,0(a5)
    80004178:	fe043783          	ld	a5,-32(s0)
    8000417c:	16e7a423          	sw	a4,360(a5)
                    release(&p->lock);
    80004180:	fe043783          	ld	a5,-32(s0)
    80004184:	853e                	mv	a0,a5
    80004186:	ffffd097          	auipc	ra,0xffffd
    8000418a:	14c080e7          	jalr	332(ra) # 800012d2 <release>
                for (struct proc *p = proc; p < &proc[NPROC]; ++p)
    8000418e:	fe043783          	ld	a5,-32(s0)
    80004192:	19878793          	addi	a5,a5,408
    80004196:	fef43023          	sd	a5,-32(s0)
    8000419a:	fe043703          	ld	a4,-32(s0)
    8000419e:	00018797          	auipc	a5,0x18
    800041a2:	b3278793          	addi	a5,a5,-1230 # 8001bcd0 <pid_lock>
    800041a6:	f8f766e3          	bltu	a4,a5,80004132 <setSchedAlg+0x1a6>
                release(&tickslock);
    800041aa:	00018517          	auipc	a0,0x18
    800041ae:	b5650513          	addi	a0,a0,-1194 # 8001bd00 <tickslock>
    800041b2:	ffffd097          	auipc	ra,0xffffd
    800041b6:	120080e7          	jalr	288(ra) # 800012d2 <release>
            break;
    800041ba:	a46d                	j	80004464 <setSchedAlg+0x4d8>
        }
        case 1: // was SJF
        {
            if (alg != 1)
    800041bc:	fbc42783          	lw	a5,-68(s0)
    800041c0:	0007871b          	sext.w	a4,a5
    800041c4:	4785                	li	a5,1
    800041c6:	14f70e63          	beq	a4,a5,80004322 <setSchedAlg+0x396>
            {
                // first, clear the proc binary tree
                for (struct proc *p = proc; p < &proc[NPROC]; ++p)
    800041ca:	00011797          	auipc	a5,0x11
    800041ce:	50678793          	addi	a5,a5,1286 # 800156d0 <proc>
    800041d2:	fcf43c23          	sd	a5,-40(s0)
    800041d6:	a891                	j	8000422a <setSchedAlg+0x29e>
                {
                    acquire(&p->lock);
    800041d8:	fd843783          	ld	a5,-40(s0)
    800041dc:	853e                	mv	a0,a5
    800041de:	ffffd097          	auipc	ra,0xffffd
    800041e2:	090080e7          	jalr	144(ra) # 8000126e <acquire>
                    p->tau = 1;
    800041e6:	fd843783          	ld	a5,-40(s0)
    800041ea:	4705                	li	a4,1
    800041ec:	16e7a623          	sw	a4,364(a5)
                    p->quantum = 0;
    800041f0:	fd843783          	ld	a5,-40(s0)
    800041f4:	1807a823          	sw	zero,400(a5)
                    p->next = 0;
    800041f8:	fd843783          	ld	a5,-40(s0)
    800041fc:	1807b023          	sd	zero,384(a5)
                    p->right = 0;
    80004200:	fd843783          	ld	a5,-40(s0)
    80004204:	1607bc23          	sd	zero,376(a5)
                    p->left = 0;
    80004208:	fd843783          	ld	a5,-40(s0)
    8000420c:	1607b823          	sd	zero,368(a5)
                    release(&p->lock);
    80004210:	fd843783          	ld	a5,-40(s0)
    80004214:	853e                	mv	a0,a5
    80004216:	ffffd097          	auipc	ra,0xffffd
    8000421a:	0bc080e7          	jalr	188(ra) # 800012d2 <release>
                for (struct proc *p = proc; p < &proc[NPROC]; ++p)
    8000421e:	fd843783          	ld	a5,-40(s0)
    80004222:	19878793          	addi	a5,a5,408
    80004226:	fcf43c23          	sd	a5,-40(s0)
    8000422a:	fd843703          	ld	a4,-40(s0)
    8000422e:	00018797          	auipc	a5,0x18
    80004232:	aa278793          	addi	a5,a5,-1374 # 8001bcd0 <pid_lock>
    80004236:	faf761e3          	bltu	a4,a5,800041d8 <setSchedAlg+0x24c>
                }
                tree_head = 0;
    8000423a:	00009797          	auipc	a5,0x9
    8000423e:	df678793          	addi	a5,a5,-522 # 8000d030 <tree_head>
    80004242:	0007b023          	sd	zero,0(a5)
                sjf_preemptive = -1;
    80004246:	00008797          	auipc	a5,0x8
    8000424a:	4fe78793          	addi	a5,a5,1278 # 8000c744 <sjf_preemptive>
    8000424e:	577d                	li	a4,-1
    80004250:	c398                	sw	a4,0(a5)
                sjf_coefficient = -1;
    80004252:	00008797          	auipc	a5,0x8
    80004256:	4ee78793          	addi	a5,a5,1262 # 8000c740 <sjf_coefficient>
    8000425a:	577d                	li	a4,-1
    8000425c:	c398                	sw	a4,0(a5)
                if (alg == 2) // switch to CFS
    8000425e:	fbc42783          	lw	a5,-68(s0)
    80004262:	0007871b          	sext.w	a4,a5
    80004266:	4789                	li	a5,2
    80004268:	20f71063          	bne	a4,a5,80004468 <setSchedAlg+0x4dc>
                {
                    acquire(&tickslock);
    8000426c:	00018517          	auipc	a0,0x18
    80004270:	a9450513          	addi	a0,a0,-1388 # 8001bd00 <tickslock>
    80004274:	ffffd097          	auipc	ra,0xffffd
    80004278:	ffa080e7          	jalr	-6(ra) # 8000126e <acquire>
                    algid = alg;
    8000427c:	00009797          	auipc	a5,0x9
    80004280:	da478793          	addi	a5,a5,-604 # 8000d020 <algid>
    80004284:	fbc42703          	lw	a4,-68(s0)
    80004288:	c398                	sw	a4,0(a5)
                    for (struct proc *p = proc; p < &proc[NPROC]; ++p)
    8000428a:	00011797          	auipc	a5,0x11
    8000428e:	44678793          	addi	a5,a5,1094 # 800156d0 <proc>
    80004292:	fcf43823          	sd	a5,-48(s0)
    80004296:	a0ad                	j	80004300 <setSchedAlg+0x374>
                    {
                        acquire(&p->lock);
    80004298:	fd043783          	ld	a5,-48(s0)
    8000429c:	853e                	mv	a0,a5
    8000429e:	ffffd097          	auipc	ra,0xffffd
    800042a2:	fd0080e7          	jalr	-48(ra) # 8000126e <acquire>
                        p->tau = 0;
    800042a6:	fd043783          	ld	a5,-48(s0)
    800042aa:	1607a623          	sw	zero,364(a5)
                        p->quantum = 1;
    800042ae:	fd043783          	ld	a5,-48(s0)
    800042b2:	4705                	li	a4,1
    800042b4:	18e7a823          	sw	a4,400(a5)
                        if (p->state == RUNNABLE)
    800042b8:	fd043783          	ld	a5,-48(s0)
    800042bc:	4f9c                	lw	a5,24(a5)
    800042be:	873e                	mv	a4,a5
    800042c0:	478d                	li	a5,3
    800042c2:	00f71963          	bne	a4,a5,800042d4 <setSchedAlg+0x348>
                            put(p);
    800042c6:	fd043503          	ld	a0,-48(s0)
    800042ca:	fffff097          	auipc	ra,0xfffff
    800042ce:	060080e7          	jalr	96(ra) # 8000332a <put>
    800042d2:	a811                	j	800042e6 <setSchedAlg+0x35a>
                        else
                            p->timestamp = ticks;
    800042d4:	00009797          	auipc	a5,0x9
    800042d8:	d6c78793          	addi	a5,a5,-660 # 8000d040 <ticks>
    800042dc:	4398                	lw	a4,0(a5)
    800042de:	fd043783          	ld	a5,-48(s0)
    800042e2:	16e7a423          	sw	a4,360(a5)
                        release(&p->lock);
    800042e6:	fd043783          	ld	a5,-48(s0)
    800042ea:	853e                	mv	a0,a5
    800042ec:	ffffd097          	auipc	ra,0xffffd
    800042f0:	fe6080e7          	jalr	-26(ra) # 800012d2 <release>
                    for (struct proc *p = proc; p < &proc[NPROC]; ++p)
    800042f4:	fd043783          	ld	a5,-48(s0)
    800042f8:	19878793          	addi	a5,a5,408
    800042fc:	fcf43823          	sd	a5,-48(s0)
    80004300:	fd043703          	ld	a4,-48(s0)
    80004304:	00018797          	auipc	a5,0x18
    80004308:	9cc78793          	addi	a5,a5,-1588 # 8001bcd0 <pid_lock>
    8000430c:	f8f766e3          	bltu	a4,a5,80004298 <setSchedAlg+0x30c>
                    }
                    release(&tickslock);
    80004310:	00018517          	auipc	a0,0x18
    80004314:	9f050513          	addi	a0,a0,-1552 # 8001bd00 <tickslock>
    80004318:	ffffd097          	auipc	ra,0xffffd
    8000431c:	fba080e7          	jalr	-70(ra) # 800012d2 <release>
            else
            {
                sjf_coefficient = arg1;
                sjf_preemptive = arg2;
            }
            break;
    80004320:	a2a1                	j	80004468 <setSchedAlg+0x4dc>
                sjf_coefficient = arg1;
    80004322:	00008797          	auipc	a5,0x8
    80004326:	41e78793          	addi	a5,a5,1054 # 8000c740 <sjf_coefficient>
    8000432a:	fb842703          	lw	a4,-72(s0)
    8000432e:	c398                	sw	a4,0(a5)
                sjf_preemptive = arg2;
    80004330:	00008797          	auipc	a5,0x8
    80004334:	41478793          	addi	a5,a5,1044 # 8000c744 <sjf_preemptive>
    80004338:	fb442703          	lw	a4,-76(s0)
    8000433c:	c398                	sw	a4,0(a5)
            break;
    8000433e:	a22d                	j	80004468 <setSchedAlg+0x4dc>
        }
        case 2: // was CFS
        {
            if (alg != 2)
    80004340:	fbc42783          	lw	a5,-68(s0)
    80004344:	0007871b          	sext.w	a4,a5
    80004348:	4789                	li	a5,2
    8000434a:	12f70163          	beq	a4,a5,8000446c <setSchedAlg+0x4e0>
            {
                // first, clear the proc binary tree
                for (struct proc *p = proc; p < &proc[NPROC]; ++p)
    8000434e:	00011797          	auipc	a5,0x11
    80004352:	38278793          	addi	a5,a5,898 # 800156d0 <proc>
    80004356:	fcf43423          	sd	a5,-56(s0)
    8000435a:	a891                	j	800043ae <setSchedAlg+0x422>
                {
                    acquire(&p->lock);
    8000435c:	fc843783          	ld	a5,-56(s0)
    80004360:	853e                	mv	a0,a5
    80004362:	ffffd097          	auipc	ra,0xffffd
    80004366:	f0c080e7          	jalr	-244(ra) # 8000126e <acquire>
                    p->tau = 1;
    8000436a:	fc843783          	ld	a5,-56(s0)
    8000436e:	4705                	li	a4,1
    80004370:	16e7a623          	sw	a4,364(a5)
                    p->quantum = 0;
    80004374:	fc843783          	ld	a5,-56(s0)
    80004378:	1807a823          	sw	zero,400(a5)
                    p->next = 0;
    8000437c:	fc843783          	ld	a5,-56(s0)
    80004380:	1807b023          	sd	zero,384(a5)
                    p->right = 0;
    80004384:	fc843783          	ld	a5,-56(s0)
    80004388:	1607bc23          	sd	zero,376(a5)
                    p->left = 0;
    8000438c:	fc843783          	ld	a5,-56(s0)
    80004390:	1607b823          	sd	zero,368(a5)
                    release(&p->lock);
    80004394:	fc843783          	ld	a5,-56(s0)
    80004398:	853e                	mv	a0,a5
    8000439a:	ffffd097          	auipc	ra,0xffffd
    8000439e:	f38080e7          	jalr	-200(ra) # 800012d2 <release>
                for (struct proc *p = proc; p < &proc[NPROC]; ++p)
    800043a2:	fc843783          	ld	a5,-56(s0)
    800043a6:	19878793          	addi	a5,a5,408
    800043aa:	fcf43423          	sd	a5,-56(s0)
    800043ae:	fc843703          	ld	a4,-56(s0)
    800043b2:	00018797          	auipc	a5,0x18
    800043b6:	91e78793          	addi	a5,a5,-1762 # 8001bcd0 <pid_lock>
    800043ba:	faf761e3          	bltu	a4,a5,8000435c <setSchedAlg+0x3d0>
                }
                tree_head = 0;
    800043be:	00009797          	auipc	a5,0x9
    800043c2:	c7278793          	addi	a5,a5,-910 # 8000d030 <tree_head>
    800043c6:	0007b023          	sd	zero,0(a5)
                if (alg == 1) // switch to SJF
    800043ca:	fbc42783          	lw	a5,-68(s0)
    800043ce:	0007871b          	sext.w	a4,a5
    800043d2:	4785                	li	a5,1
    800043d4:	08f71c63          	bne	a4,a5,8000446c <setSchedAlg+0x4e0>
                {
                    algid = alg;
    800043d8:	00009797          	auipc	a5,0x9
    800043dc:	c4878793          	addi	a5,a5,-952 # 8000d020 <algid>
    800043e0:	fbc42703          	lw	a4,-68(s0)
    800043e4:	c398                	sw	a4,0(a5)
                    sjf_coefficient = arg1;
    800043e6:	00008797          	auipc	a5,0x8
    800043ea:	35a78793          	addi	a5,a5,858 # 8000c740 <sjf_coefficient>
    800043ee:	fb842703          	lw	a4,-72(s0)
    800043f2:	c398                	sw	a4,0(a5)
                    for (struct proc *p = proc; p < &proc[NPROC]; ++p)
    800043f4:	00011797          	auipc	a5,0x11
    800043f8:	2dc78793          	addi	a5,a5,732 # 800156d0 <proc>
    800043fc:	fcf43023          	sd	a5,-64(s0)
    80004400:	a091                	j	80004444 <setSchedAlg+0x4b8>
                    {
                        acquire(&p->lock);
    80004402:	fc043783          	ld	a5,-64(s0)
    80004406:	853e                	mv	a0,a5
    80004408:	ffffd097          	auipc	ra,0xffffd
    8000440c:	e66080e7          	jalr	-410(ra) # 8000126e <acquire>
                        if (p->state == RUNNABLE)
    80004410:	fc043783          	ld	a5,-64(s0)
    80004414:	4f9c                	lw	a5,24(a5)
    80004416:	873e                	mv	a4,a5
    80004418:	478d                	li	a5,3
    8000441a:	00f71863          	bne	a4,a5,8000442a <setSchedAlg+0x49e>
                            put(p);
    8000441e:	fc043503          	ld	a0,-64(s0)
    80004422:	fffff097          	auipc	ra,0xfffff
    80004426:	f08080e7          	jalr	-248(ra) # 8000332a <put>
                        release(&p->lock);
    8000442a:	fc043783          	ld	a5,-64(s0)
    8000442e:	853e                	mv	a0,a5
    80004430:	ffffd097          	auipc	ra,0xffffd
    80004434:	ea2080e7          	jalr	-350(ra) # 800012d2 <release>
                    for (struct proc *p = proc; p < &proc[NPROC]; ++p)
    80004438:	fc043783          	ld	a5,-64(s0)
    8000443c:	19878793          	addi	a5,a5,408
    80004440:	fcf43023          	sd	a5,-64(s0)
    80004444:	fc043703          	ld	a4,-64(s0)
    80004448:	00018797          	auipc	a5,0x18
    8000444c:	88878793          	addi	a5,a5,-1912 # 8001bcd0 <pid_lock>
    80004450:	faf769e3          	bltu	a4,a5,80004402 <setSchedAlg+0x476>
                    }
                    sjf_preemptive = arg2; // no preemption until every proc has settled in
    80004454:	00008797          	auipc	a5,0x8
    80004458:	2f078793          	addi	a5,a5,752 # 8000c744 <sjf_preemptive>
    8000445c:	fb442703          	lw	a4,-76(s0)
    80004460:	c398                	sw	a4,0(a5)
                }
            }
            break;
    80004462:	a029                	j	8000446c <setSchedAlg+0x4e0>
            break;
    80004464:	0001                	nop
    80004466:	a021                	j	8000446e <setSchedAlg+0x4e2>
            break;
    80004468:	0001                	nop
    8000446a:	a011                	j	8000446e <setSchedAlg+0x4e2>
            break;
    8000446c:	0001                	nop
        }
    }
    alg_changing = 0;
    8000446e:	00009797          	auipc	a5,0x9
    80004472:	bb678793          	addi	a5,a5,-1098 # 8000d024 <alg_changing>
    80004476:	0007a023          	sw	zero,0(a5)
    release(&mutex);
    8000447a:	00011517          	auipc	a0,0x11
    8000447e:	e3e50513          	addi	a0,a0,-450 # 800152b8 <mutex>
    80004482:	ffffd097          	auipc	ra,0xffffd
    80004486:	e50080e7          	jalr	-432(ra) # 800012d2 <release>
    return 0;
    8000448a:	4781                	li	a5,0
}
    8000448c:	853e                	mv	a0,a5
    8000448e:	60a6                	ld	ra,72(sp)
    80004490:	6406                	ld	s0,64(sp)
    80004492:	6161                	addi	sp,sp,80
    80004494:	8082                	ret

0000000080004496 <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    80004496:	7179                	addi	sp,sp,-48
    80004498:	f406                	sd	ra,40(sp)
    8000449a:	f022                	sd	s0,32(sp)
    8000449c:	1800                	addi	s0,sp,48
  struct proc *p;
  struct cpu *c = mycpu();
    8000449e:	ffffe097          	auipc	ra,0xffffe
    800044a2:	354080e7          	jalr	852(ra) # 800027f2 <mycpu>
    800044a6:	fea43423          	sd	a0,-24(s0)
  uint currticks;
  
  c->proc = 0;
    800044aa:	fe843783          	ld	a5,-24(s0)
    800044ae:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    800044b2:	ffffe097          	auipc	ra,0xffffe
    800044b6:	112080e7          	jalr	274(ra) # 800025c4 <intr_on>

    p = get();
    800044ba:	fffff097          	auipc	ra,0xfffff
    800044be:	4fc080e7          	jalr	1276(ra) # 800039b6 <get>
    800044c2:	fea43023          	sd	a0,-32(s0)
    if (p != 0)
    800044c6:	fe043783          	ld	a5,-32(s0)
    800044ca:	d7e5                	beqz	a5,800044b2 <scheduler+0x1c>
    {
        if (algid != 0)
    800044cc:	00009797          	auipc	a5,0x9
    800044d0:	b5478793          	addi	a5,a5,-1196 # 8000d020 <algid>
    800044d4:	439c                	lw	a5,0(a5)
    800044d6:	c3f9                	beqz	a5,8000459c <scheduler+0x106>
        {
            currticks = ticks;
    800044d8:	00009797          	auipc	a5,0x9
    800044dc:	b6878793          	addi	a5,a5,-1176 # 8000d040 <ticks>
    800044e0:	439c                	lw	a5,0(a5)
    800044e2:	fcf42e23          	sw	a5,-36(s0)
            if (algid == 2) // set maximum execution time for the process, if CFS is active alg
    800044e6:	00009797          	auipc	a5,0x9
    800044ea:	b3a78793          	addi	a5,a5,-1222 # 8000d020 <algid>
    800044ee:	439c                	lw	a5,0(a5)
    800044f0:	873e                	mv	a4,a5
    800044f2:	4789                	li	a5,2
    800044f4:	08f71e63          	bne	a4,a5,80004590 <scheduler+0xfa>
            {
                p->quantum = ((int)currticks - (int)p->timestamp) / procnum
    800044f8:	fdc42703          	lw	a4,-36(s0)
    800044fc:	fe043783          	ld	a5,-32(s0)
    80004500:	1687a783          	lw	a5,360(a5)
    80004504:	2781                	sext.w	a5,a5
    80004506:	40f707bb          	subw	a5,a4,a5
    8000450a:	0007871b          	sext.w	a4,a5
    8000450e:	00009797          	auipc	a5,0x9
    80004512:	b1a78793          	addi	a5,a5,-1254 # 8000d028 <procnum>
    80004516:	439c                	lw	a5,0(a5)
    80004518:	02f747bb          	divw	a5,a4,a5
    8000451c:	0007871b          	sext.w	a4,a5
                           + (((int)currticks - (int)p->timestamp) % procnum >= procnum / 2?1:0);
    80004520:	fdc42683          	lw	a3,-36(s0)
    80004524:	fe043783          	ld	a5,-32(s0)
    80004528:	1687a783          	lw	a5,360(a5)
    8000452c:	2781                	sext.w	a5,a5
    8000452e:	40f687bb          	subw	a5,a3,a5
    80004532:	0007869b          	sext.w	a3,a5
    80004536:	00009797          	auipc	a5,0x9
    8000453a:	af278793          	addi	a5,a5,-1294 # 8000d028 <procnum>
    8000453e:	439c                	lw	a5,0(a5)
    80004540:	02f6e7bb          	remw	a5,a3,a5
    80004544:	0007861b          	sext.w	a2,a5
    80004548:	00009797          	auipc	a5,0x9
    8000454c:	ae078793          	addi	a5,a5,-1312 # 8000d028 <procnum>
    80004550:	439c                	lw	a5,0(a5)
    80004552:	01f7d69b          	srliw	a3,a5,0x1f
    80004556:	9fb5                	addw	a5,a5,a3
    80004558:	4017d79b          	sraiw	a5,a5,0x1
    8000455c:	2781                	sext.w	a5,a5
    8000455e:	86b2                	mv	a3,a2
    80004560:	00f6a7b3          	slt	a5,a3,a5
    80004564:	0017c793          	xori	a5,a5,1
    80004568:	0ff7f793          	andi	a5,a5,255
    8000456c:	2781                	sext.w	a5,a5
    8000456e:	9fb9                	addw	a5,a5,a4
    80004570:	0007871b          	sext.w	a4,a5
                p->quantum = ((int)currticks - (int)p->timestamp) / procnum
    80004574:	fe043783          	ld	a5,-32(s0)
    80004578:	18e7a823          	sw	a4,400(a5)
                if (p->quantum == 0)
    8000457c:	fe043783          	ld	a5,-32(s0)
    80004580:	1907a783          	lw	a5,400(a5)
    80004584:	e791                	bnez	a5,80004590 <scheduler+0xfa>
                    p->quantum = 1;
    80004586:	fe043783          	ld	a5,-32(s0)
    8000458a:	4705                	li	a4,1
    8000458c:	18e7a823          	sw	a4,400(a5)
            }
            p->timestamp = currticks;
    80004590:	fe043783          	ld	a5,-32(s0)
    80004594:	fdc42703          	lw	a4,-36(s0)
    80004598:	16e7a423          	sw	a4,360(a5)
        }

        if (affinity_enabled) // advanced
    8000459c:	00008797          	auipc	a5,0x8
    800045a0:	1ac78793          	addi	a5,a5,428 # 8000c748 <affinity_enabled>
    800045a4:	439c                	lw	a5,0(a5)
    800045a6:	c39d                	beqz	a5,800045cc <scheduler+0x136>
        {
            push_off();
    800045a8:	ffffd097          	auipc	ra,0xffffd
    800045ac:	dc4080e7          	jalr	-572(ra) # 8000136c <push_off>
            p->affinity = cpuid();
    800045b0:	ffffe097          	auipc	ra,0xffffe
    800045b4:	21e080e7          	jalr	542(ra) # 800027ce <cpuid>
    800045b8:	87aa                	mv	a5,a0
    800045ba:	873e                	mv	a4,a5
    800045bc:	fe043783          	ld	a5,-32(s0)
    800045c0:	18e7aa23          	sw	a4,404(a5)
            pop_off();
    800045c4:	ffffd097          	auipc	ra,0xffffd
    800045c8:	e00080e7          	jalr	-512(ra) # 800013c4 <pop_off>
        }

        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
    800045cc:	fe043783          	ld	a5,-32(s0)
    800045d0:	4711                	li	a4,4
    800045d2:	cf98                	sw	a4,24(a5)
        c->proc = p;
    800045d4:	fe843783          	ld	a5,-24(s0)
    800045d8:	fe043703          	ld	a4,-32(s0)
    800045dc:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    800045de:	fe843783          	ld	a5,-24(s0)
    800045e2:	00878713          	addi	a4,a5,8
    800045e6:	fe043783          	ld	a5,-32(s0)
    800045ea:	06078793          	addi	a5,a5,96
    800045ee:	85be                	mv	a1,a5
    800045f0:	853a                	mv	a0,a4
    800045f2:	00000097          	auipc	ra,0x0
    800045f6:	69e080e7          	jalr	1694(ra) # 80004c90 <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    800045fa:	fe843783          	ld	a5,-24(s0)
    800045fe:	0007b023          	sd	zero,0(a5)
        release(&p->lock);
    80004602:	fe043783          	ld	a5,-32(s0)
    80004606:	853e                	mv	a0,a5
    80004608:	ffffd097          	auipc	ra,0xffffd
    8000460c:	cca080e7          	jalr	-822(ra) # 800012d2 <release>
    intr_on();
    80004610:	b54d                	j	800044b2 <scheduler+0x1c>

0000000080004612 <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    80004612:	7179                	addi	sp,sp,-48
    80004614:	f406                	sd	ra,40(sp)
    80004616:	f022                	sd	s0,32(sp)
    80004618:	ec26                	sd	s1,24(sp)
    8000461a:	1800                	addi	s0,sp,48
    uint formula;  // for SJF approx
  int intena;
  struct proc *p = myproc();
    8000461c:	ffffe097          	auipc	ra,0xffffe
    80004620:	210080e7          	jalr	528(ra) # 8000282c <myproc>
    80004624:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    80004628:	fd843783          	ld	a5,-40(s0)
    8000462c:	853e                	mv	a0,a5
    8000462e:	ffffd097          	auipc	ra,0xffffd
    80004632:	cfa080e7          	jalr	-774(ra) # 80001328 <holding>
    80004636:	87aa                	mv	a5,a0
    80004638:	eb89                	bnez	a5,8000464a <sched+0x38>
    panic("sched p->lock");
    8000463a:	00008517          	auipc	a0,0x8
    8000463e:	bee50513          	addi	a0,a0,-1042 # 8000c228 <etext+0x228>
    80004642:	ffffc097          	auipc	ra,0xffffc
    80004646:	63c080e7          	jalr	1596(ra) # 80000c7e <panic>
  if(mycpu()->noff != 1)
    8000464a:	ffffe097          	auipc	ra,0xffffe
    8000464e:	1a8080e7          	jalr	424(ra) # 800027f2 <mycpu>
    80004652:	87aa                	mv	a5,a0
    80004654:	5fbc                	lw	a5,120(a5)
    80004656:	873e                	mv	a4,a5
    80004658:	4785                	li	a5,1
    8000465a:	00f70a63          	beq	a4,a5,8000466e <sched+0x5c>
    panic("sched locks");
    8000465e:	00008517          	auipc	a0,0x8
    80004662:	bda50513          	addi	a0,a0,-1062 # 8000c238 <etext+0x238>
    80004666:	ffffc097          	auipc	ra,0xffffc
    8000466a:	618080e7          	jalr	1560(ra) # 80000c7e <panic>
  if(p->state == RUNNING)
    8000466e:	fd843783          	ld	a5,-40(s0)
    80004672:	4f9c                	lw	a5,24(a5)
    80004674:	873e                	mv	a4,a5
    80004676:	4791                	li	a5,4
    80004678:	00f71a63          	bne	a4,a5,8000468c <sched+0x7a>
    panic("sched running");
    8000467c:	00008517          	auipc	a0,0x8
    80004680:	bcc50513          	addi	a0,a0,-1076 # 8000c248 <etext+0x248>
    80004684:	ffffc097          	auipc	ra,0xffffc
    80004688:	5fa080e7          	jalr	1530(ra) # 80000c7e <panic>
  if(intr_get())
    8000468c:	ffffe097          	auipc	ra,0xffffe
    80004690:	f62080e7          	jalr	-158(ra) # 800025ee <intr_get>
    80004694:	87aa                	mv	a5,a0
    80004696:	cb89                	beqz	a5,800046a8 <sched+0x96>
    panic("sched interruptible");
    80004698:	00008517          	auipc	a0,0x8
    8000469c:	bc050513          	addi	a0,a0,-1088 # 8000c258 <etext+0x258>
    800046a0:	ffffc097          	auipc	ra,0xffffc
    800046a4:	5de080e7          	jalr	1502(ra) # 80000c7e <panic>

  if (algid == 1 && p->preempted != 1)
    800046a8:	00009797          	auipc	a5,0x9
    800046ac:	97878793          	addi	a5,a5,-1672 # 8000d020 <algid>
    800046b0:	439c                	lw	a5,0(a5)
    800046b2:	873e                	mv	a4,a5
    800046b4:	4785                	li	a5,1
    800046b6:	0af71f63          	bne	a4,a5,80004774 <sched+0x162>
    800046ba:	fd843783          	ld	a5,-40(s0)
    800046be:	1887a783          	lw	a5,392(a5)
    800046c2:	873e                	mv	a4,a5
    800046c4:	4785                	li	a5,1
    800046c6:	0af70763          	beq	a4,a5,80004774 <sched+0x162>
  {
      p->t = ticks - p->timestamp;
    800046ca:	00009797          	auipc	a5,0x9
    800046ce:	97678793          	addi	a5,a5,-1674 # 8000d040 <ticks>
    800046d2:	4398                	lw	a4,0(a5)
    800046d4:	fd843783          	ld	a5,-40(s0)
    800046d8:	1687a783          	lw	a5,360(a5)
    800046dc:	40f707bb          	subw	a5,a4,a5
    800046e0:	2781                	sext.w	a5,a5
    800046e2:	0007871b          	sext.w	a4,a5
    800046e6:	fd843783          	ld	a5,-40(s0)
    800046ea:	18e7a623          	sw	a4,396(a5)
      formula = sjf_coefficient * p->t + (100 - sjf_coefficient) * p->tau;
    800046ee:	fd843783          	ld	a5,-40(s0)
    800046f2:	18c7a703          	lw	a4,396(a5)
    800046f6:	00008797          	auipc	a5,0x8
    800046fa:	04a78793          	addi	a5,a5,74 # 8000c740 <sjf_coefficient>
    800046fe:	439c                	lw	a5,0(a5)
    80004700:	02f707bb          	mulw	a5,a4,a5
    80004704:	0007871b          	sext.w	a4,a5
    80004708:	00008797          	auipc	a5,0x8
    8000470c:	03878793          	addi	a5,a5,56 # 8000c740 <sjf_coefficient>
    80004710:	439c                	lw	a5,0(a5)
    80004712:	06400693          	li	a3,100
    80004716:	40f687bb          	subw	a5,a3,a5
    8000471a:	0007869b          	sext.w	a3,a5
    8000471e:	fd843783          	ld	a5,-40(s0)
    80004722:	16c7a783          	lw	a5,364(a5)
    80004726:	02f687bb          	mulw	a5,a3,a5
    8000472a:	2781                	sext.w	a5,a5
    8000472c:	9fb9                	addw	a5,a5,a4
    8000472e:	2781                	sext.w	a5,a5
    80004730:	fcf42a23          	sw	a5,-44(s0)
      p->tau =  formula / 100 + (formula%100>=50?1:0);
    80004734:	fd442703          	lw	a4,-44(s0)
    80004738:	06400793          	li	a5,100
    8000473c:	02f757bb          	divuw	a5,a4,a5
    80004740:	0007871b          	sext.w	a4,a5
    80004744:	fd442683          	lw	a3,-44(s0)
    80004748:	06400793          	li	a5,100
    8000474c:	02f6f7bb          	remuw	a5,a3,a5
    80004750:	2781                	sext.w	a5,a5
    80004752:	86be                	mv	a3,a5
    80004754:	03100793          	li	a5,49
    80004758:	00d7f463          	bgeu	a5,a3,80004760 <sched+0x14e>
    8000475c:	4785                	li	a5,1
    8000475e:	a011                	j	80004762 <sched+0x150>
    80004760:	4781                	li	a5,0
    80004762:	9fb9                	addw	a5,a5,a4
    80004764:	2781                	sext.w	a5,a5
    80004766:	0007871b          	sext.w	a4,a5
    8000476a:	fd843783          	ld	a5,-40(s0)
    8000476e:	16e7a623          	sw	a4,364(a5)
    80004772:	a829                	j	8000478c <sched+0x17a>
  }
  else if (p->preempted == 1)
    80004774:	fd843783          	ld	a5,-40(s0)
    80004778:	1887a783          	lw	a5,392(a5)
    8000477c:	873e                	mv	a4,a5
    8000477e:	4785                	li	a5,1
    80004780:	00f71663          	bne	a4,a5,8000478c <sched+0x17a>
      p->preempted = 0;
    80004784:	fd843783          	ld	a5,-40(s0)
    80004788:	1807a423          	sw	zero,392(a5)

  intena = mycpu()->intena;
    8000478c:	ffffe097          	auipc	ra,0xffffe
    80004790:	066080e7          	jalr	102(ra) # 800027f2 <mycpu>
    80004794:	87aa                	mv	a5,a0
    80004796:	5ffc                	lw	a5,124(a5)
    80004798:	fcf42823          	sw	a5,-48(s0)
  swtch(&p->context, &mycpu()->context);
    8000479c:	fd843783          	ld	a5,-40(s0)
    800047a0:	06078493          	addi	s1,a5,96
    800047a4:	ffffe097          	auipc	ra,0xffffe
    800047a8:	04e080e7          	jalr	78(ra) # 800027f2 <mycpu>
    800047ac:	87aa                	mv	a5,a0
    800047ae:	07a1                	addi	a5,a5,8
    800047b0:	85be                	mv	a1,a5
    800047b2:	8526                	mv	a0,s1
    800047b4:	00000097          	auipc	ra,0x0
    800047b8:	4dc080e7          	jalr	1244(ra) # 80004c90 <swtch>
  mycpu()->intena = intena;
    800047bc:	ffffe097          	auipc	ra,0xffffe
    800047c0:	036080e7          	jalr	54(ra) # 800027f2 <mycpu>
    800047c4:	872a                	mv	a4,a0
    800047c6:	fd042783          	lw	a5,-48(s0)
    800047ca:	df7c                	sw	a5,124(a4)
}
    800047cc:	0001                	nop
    800047ce:	70a2                	ld	ra,40(sp)
    800047d0:	7402                	ld	s0,32(sp)
    800047d2:	64e2                	ld	s1,24(sp)
    800047d4:	6145                	addi	sp,sp,48
    800047d6:	8082                	ret

00000000800047d8 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    800047d8:	1101                	addi	sp,sp,-32
    800047da:	ec06                	sd	ra,24(sp)
    800047dc:	e822                	sd	s0,16(sp)
    800047de:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    800047e0:	ffffe097          	auipc	ra,0xffffe
    800047e4:	04c080e7          	jalr	76(ra) # 8000282c <myproc>
    800047e8:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800047ec:	fe843783          	ld	a5,-24(s0)
    800047f0:	853e                	mv	a0,a5
    800047f2:	ffffd097          	auipc	ra,0xffffd
    800047f6:	a7c080e7          	jalr	-1412(ra) # 8000126e <acquire>
  put(p);
    800047fa:	fe843503          	ld	a0,-24(s0)
    800047fe:	fffff097          	auipc	ra,0xfffff
    80004802:	b2c080e7          	jalr	-1236(ra) # 8000332a <put>
  sched();
    80004806:	00000097          	auipc	ra,0x0
    8000480a:	e0c080e7          	jalr	-500(ra) # 80004612 <sched>
  release(&p->lock);
    8000480e:	fe843783          	ld	a5,-24(s0)
    80004812:	853e                	mv	a0,a5
    80004814:	ffffd097          	auipc	ra,0xffffd
    80004818:	abe080e7          	jalr	-1346(ra) # 800012d2 <release>
}
    8000481c:	0001                	nop
    8000481e:	60e2                	ld	ra,24(sp)
    80004820:	6442                	ld	s0,16(sp)
    80004822:	6105                	addi	sp,sp,32
    80004824:	8082                	ret

0000000080004826 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    80004826:	1141                	addi	sp,sp,-16
    80004828:	e406                	sd	ra,8(sp)
    8000482a:	e022                	sd	s0,0(sp)
    8000482c:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    8000482e:	ffffe097          	auipc	ra,0xffffe
    80004832:	ffe080e7          	jalr	-2(ra) # 8000282c <myproc>
    80004836:	87aa                	mv	a5,a0
    80004838:	853e                	mv	a0,a5
    8000483a:	ffffd097          	auipc	ra,0xffffd
    8000483e:	a98080e7          	jalr	-1384(ra) # 800012d2 <release>

  if (first) {
    80004842:	00008797          	auipc	a5,0x8
    80004846:	f0e78793          	addi	a5,a5,-242 # 8000c750 <first.1788>
    8000484a:	439c                	lw	a5,0(a5)
    8000484c:	cf81                	beqz	a5,80004864 <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    8000484e:	00008797          	auipc	a5,0x8
    80004852:	f0278793          	addi	a5,a5,-254 # 8000c750 <first.1788>
    80004856:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    8000485a:	4505                	li	a0,1
    8000485c:	00001097          	auipc	ra,0x1
    80004860:	644080e7          	jalr	1604(ra) # 80005ea0 <fsinit>
  }

  usertrapret();
    80004864:	00000097          	auipc	ra,0x0
    80004868:	7b4080e7          	jalr	1972(ra) # 80005018 <usertrapret>
}
    8000486c:	0001                	nop
    8000486e:	60a2                	ld	ra,8(sp)
    80004870:	6402                	ld	s0,0(sp)
    80004872:	0141                	addi	sp,sp,16
    80004874:	8082                	ret

0000000080004876 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    80004876:	7179                	addi	sp,sp,-48
    80004878:	f406                	sd	ra,40(sp)
    8000487a:	f022                	sd	s0,32(sp)
    8000487c:	1800                	addi	s0,sp,48
    8000487e:	fca43c23          	sd	a0,-40(s0)
    80004882:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80004886:	ffffe097          	auipc	ra,0xffffe
    8000488a:	fa6080e7          	jalr	-90(ra) # 8000282c <myproc>
    8000488e:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    80004892:	fe843783          	ld	a5,-24(s0)
    80004896:	853e                	mv	a0,a5
    80004898:	ffffd097          	auipc	ra,0xffffd
    8000489c:	9d6080e7          	jalr	-1578(ra) # 8000126e <acquire>
  release(lk);
    800048a0:	fd043503          	ld	a0,-48(s0)
    800048a4:	ffffd097          	auipc	ra,0xffffd
    800048a8:	a2e080e7          	jalr	-1490(ra) # 800012d2 <release>

  // Go to sleep.
  p->chan = chan;
    800048ac:	fe843783          	ld	a5,-24(s0)
    800048b0:	fd843703          	ld	a4,-40(s0)
    800048b4:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    800048b6:	fe843783          	ld	a5,-24(s0)
    800048ba:	4709                	li	a4,2
    800048bc:	cf98                	sw	a4,24(a5)

  if (algid == 2 && alg_changing == 0)
    800048be:	00008797          	auipc	a5,0x8
    800048c2:	76278793          	addi	a5,a5,1890 # 8000d020 <algid>
    800048c6:	439c                	lw	a5,0(a5)
    800048c8:	873e                	mv	a4,a5
    800048ca:	4789                	li	a5,2
    800048cc:	00f71c63          	bne	a4,a5,800048e4 <sleep+0x6e>
    800048d0:	00008797          	auipc	a5,0x8
    800048d4:	75478793          	addi	a5,a5,1876 # 8000d024 <alg_changing>
    800048d8:	439c                	lw	a5,0(a5)
    800048da:	e789                	bnez	a5,800048e4 <sleep+0x6e>
      /*uint currticks = ticks;
      if (currticks != p->timestamp)
        p->tau += (int) currticks - (int) p->timestamp;
      else  // if the proc ran for less than a tick, add one tick to its exec time anyway...
        p->tau++;*/
      p->tau = 0;
    800048dc:	fe843783          	ld	a5,-24(s0)
    800048e0:	1607a623          	sw	zero,364(a5)
  }

  sched();
    800048e4:	00000097          	auipc	ra,0x0
    800048e8:	d2e080e7          	jalr	-722(ra) # 80004612 <sched>

  // Tidy up.
  p->chan = 0;
    800048ec:	fe843783          	ld	a5,-24(s0)
    800048f0:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    800048f4:	fe843783          	ld	a5,-24(s0)
    800048f8:	853e                	mv	a0,a5
    800048fa:	ffffd097          	auipc	ra,0xffffd
    800048fe:	9d8080e7          	jalr	-1576(ra) # 800012d2 <release>
  acquire(lk);
    80004902:	fd043503          	ld	a0,-48(s0)
    80004906:	ffffd097          	auipc	ra,0xffffd
    8000490a:	968080e7          	jalr	-1688(ra) # 8000126e <acquire>
}
    8000490e:	0001                	nop
    80004910:	70a2                	ld	ra,40(sp)
    80004912:	7402                	ld	s0,32(sp)
    80004914:	6145                	addi	sp,sp,48
    80004916:	8082                	ret

0000000080004918 <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    80004918:	7139                	addi	sp,sp,-64
    8000491a:	fc06                	sd	ra,56(sp)
    8000491c:	f822                	sd	s0,48(sp)
    8000491e:	0080                	addi	s0,sp,64
    80004920:	fca43423          	sd	a0,-56(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80004924:	00011797          	auipc	a5,0x11
    80004928:	dac78793          	addi	a5,a5,-596 # 800156d0 <proc>
    8000492c:	fef43423          	sd	a5,-24(s0)
    80004930:	a8d9                	j	80004a06 <wakeup+0xee>
    if(p != myproc()){
    80004932:	ffffe097          	auipc	ra,0xffffe
    80004936:	efa080e7          	jalr	-262(ra) # 8000282c <myproc>
    8000493a:	872a                	mv	a4,a0
    8000493c:	fe843783          	ld	a5,-24(s0)
    80004940:	0ae78d63          	beq	a5,a4,800049fa <wakeup+0xe2>
      acquire(&p->lock);
    80004944:	fe843783          	ld	a5,-24(s0)
    80004948:	853e                	mv	a0,a5
    8000494a:	ffffd097          	auipc	ra,0xffffd
    8000494e:	924080e7          	jalr	-1756(ra) # 8000126e <acquire>
      int preempt = 0;
    80004952:	fe042223          	sw	zero,-28(s0)
      if(p->state == SLEEPING && p->chan == chan) {
    80004956:	fe843783          	ld	a5,-24(s0)
    8000495a:	4f9c                	lw	a5,24(a5)
    8000495c:	873e                	mv	a4,a5
    8000495e:	4789                	li	a5,2
    80004960:	02f71263          	bne	a4,a5,80004984 <wakeup+0x6c>
    80004964:	fe843783          	ld	a5,-24(s0)
    80004968:	739c                	ld	a5,32(a5)
    8000496a:	fc843703          	ld	a4,-56(s0)
    8000496e:	00f71b63          	bne	a4,a5,80004984 <wakeup+0x6c>
        preempt = put(p);
    80004972:	fe843503          	ld	a0,-24(s0)
    80004976:	fffff097          	auipc	ra,0xfffff
    8000497a:	9b4080e7          	jalr	-1612(ra) # 8000332a <put>
    8000497e:	87aa                	mv	a5,a0
    80004980:	fef42223          	sw	a5,-28(s0)
      }
      release(&p->lock);
    80004984:	fe843783          	ld	a5,-24(s0)
    80004988:	853e                	mv	a0,a5
    8000498a:	ffffd097          	auipc	ra,0xffffd
    8000498e:	948080e7          	jalr	-1720(ra) # 800012d2 <release>
      if (preempt)
    80004992:	fe442783          	lw	a5,-28(s0)
    80004996:	2781                	sext.w	a5,a5
    80004998:	c3ad                	beqz	a5,800049fa <wakeup+0xe2>
      {
          push_off();
    8000499a:	ffffd097          	auipc	ra,0xffffd
    8000499e:	9d2080e7          	jalr	-1582(ra) # 8000136c <push_off>
          struct cpu * mycp = mycpu();
    800049a2:	ffffe097          	auipc	ra,0xffffe
    800049a6:	e50080e7          	jalr	-432(ra) # 800027f2 <mycpu>
    800049aa:	fca43c23          	sd	a0,-40(s0)
          pop_off();
    800049ae:	ffffd097          	auipc	ra,0xffffd
    800049b2:	a16080e7          	jalr	-1514(ra) # 800013c4 <pop_off>
          if (tickslock.cpu == mycp)
    800049b6:	00017797          	auipc	a5,0x17
    800049ba:	34a78793          	addi	a5,a5,842 # 8001bd00 <tickslock>
    800049be:	6b9c                	ld	a5,16(a5)
    800049c0:	fd843703          	ld	a4,-40(s0)
    800049c4:	02f71763          	bne	a4,a5,800049f2 <wakeup+0xda>
          {
              release(&tickslock);
    800049c8:	00017517          	auipc	a0,0x17
    800049cc:	33850513          	addi	a0,a0,824 # 8001bd00 <tickslock>
    800049d0:	ffffd097          	auipc	ra,0xffffd
    800049d4:	902080e7          	jalr	-1790(ra) # 800012d2 <release>
              yield();
    800049d8:	00000097          	auipc	ra,0x0
    800049dc:	e00080e7          	jalr	-512(ra) # 800047d8 <yield>
              acquire(&tickslock);
    800049e0:	00017517          	auipc	a0,0x17
    800049e4:	32050513          	addi	a0,a0,800 # 8001bd00 <tickslock>
    800049e8:	ffffd097          	auipc	ra,0xffffd
    800049ec:	886080e7          	jalr	-1914(ra) # 8000126e <acquire>
    800049f0:	a029                	j	800049fa <wakeup+0xe2>
          }
          else
              yield();
    800049f2:	00000097          	auipc	ra,0x0
    800049f6:	de6080e7          	jalr	-538(ra) # 800047d8 <yield>
  for(p = proc; p < &proc[NPROC]; p++) {
    800049fa:	fe843783          	ld	a5,-24(s0)
    800049fe:	19878793          	addi	a5,a5,408
    80004a02:	fef43423          	sd	a5,-24(s0)
    80004a06:	fe843703          	ld	a4,-24(s0)
    80004a0a:	00017797          	auipc	a5,0x17
    80004a0e:	2c678793          	addi	a5,a5,710 # 8001bcd0 <pid_lock>
    80004a12:	f2f760e3          	bltu	a4,a5,80004932 <wakeup+0x1a>
      }
    }
  }
}
    80004a16:	0001                	nop
    80004a18:	0001                	nop
    80004a1a:	70e2                	ld	ra,56(sp)
    80004a1c:	7442                	ld	s0,48(sp)
    80004a1e:	6121                	addi	sp,sp,64
    80004a20:	8082                	ret

0000000080004a22 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    80004a22:	7179                	addi	sp,sp,-48
    80004a24:	f406                	sd	ra,40(sp)
    80004a26:	f022                	sd	s0,32(sp)
    80004a28:	1800                	addi	s0,sp,48
    80004a2a:	87aa                	mv	a5,a0
    80004a2c:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    80004a30:	00011797          	auipc	a5,0x11
    80004a34:	ca078793          	addi	a5,a5,-864 # 800156d0 <proc>
    80004a38:	fef43423          	sd	a5,-24(s0)
    80004a3c:	a0bd                	j	80004aaa <kill+0x88>
    acquire(&p->lock);
    80004a3e:	fe843783          	ld	a5,-24(s0)
    80004a42:	853e                	mv	a0,a5
    80004a44:	ffffd097          	auipc	ra,0xffffd
    80004a48:	82a080e7          	jalr	-2006(ra) # 8000126e <acquire>
    if(p->pid == pid){
    80004a4c:	fe843783          	ld	a5,-24(s0)
    80004a50:	5b98                	lw	a4,48(a5)
    80004a52:	fdc42783          	lw	a5,-36(s0)
    80004a56:	2781                	sext.w	a5,a5
    80004a58:	02e79c63          	bne	a5,a4,80004a90 <kill+0x6e>
      p->killed = 1;
    80004a5c:	fe843783          	ld	a5,-24(s0)
    80004a60:	4705                	li	a4,1
    80004a62:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    80004a64:	fe843783          	ld	a5,-24(s0)
    80004a68:	4f9c                	lw	a5,24(a5)
    80004a6a:	873e                	mv	a4,a5
    80004a6c:	4789                	li	a5,2
    80004a6e:	00f71863          	bne	a4,a5,80004a7e <kill+0x5c>
        // Wake process from sleep().
        put(p);
    80004a72:	fe843503          	ld	a0,-24(s0)
    80004a76:	fffff097          	auipc	ra,0xfffff
    80004a7a:	8b4080e7          	jalr	-1868(ra) # 8000332a <put>
      }
      release(&p->lock);
    80004a7e:	fe843783          	ld	a5,-24(s0)
    80004a82:	853e                	mv	a0,a5
    80004a84:	ffffd097          	auipc	ra,0xffffd
    80004a88:	84e080e7          	jalr	-1970(ra) # 800012d2 <release>
      return 0;
    80004a8c:	4781                	li	a5,0
    80004a8e:	a03d                	j	80004abc <kill+0x9a>
    }
    release(&p->lock);
    80004a90:	fe843783          	ld	a5,-24(s0)
    80004a94:	853e                	mv	a0,a5
    80004a96:	ffffd097          	auipc	ra,0xffffd
    80004a9a:	83c080e7          	jalr	-1988(ra) # 800012d2 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80004a9e:	fe843783          	ld	a5,-24(s0)
    80004aa2:	19878793          	addi	a5,a5,408
    80004aa6:	fef43423          	sd	a5,-24(s0)
    80004aaa:	fe843703          	ld	a4,-24(s0)
    80004aae:	00017797          	auipc	a5,0x17
    80004ab2:	22278793          	addi	a5,a5,546 # 8001bcd0 <pid_lock>
    80004ab6:	f8f764e3          	bltu	a4,a5,80004a3e <kill+0x1c>
  }
  return -1;
    80004aba:	57fd                	li	a5,-1
}
    80004abc:	853e                	mv	a0,a5
    80004abe:	70a2                	ld	ra,40(sp)
    80004ac0:	7402                	ld	s0,32(sp)
    80004ac2:	6145                	addi	sp,sp,48
    80004ac4:	8082                	ret

0000000080004ac6 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80004ac6:	7139                	addi	sp,sp,-64
    80004ac8:	fc06                	sd	ra,56(sp)
    80004aca:	f822                	sd	s0,48(sp)
    80004acc:	0080                	addi	s0,sp,64
    80004ace:	87aa                	mv	a5,a0
    80004ad0:	fcb43823          	sd	a1,-48(s0)
    80004ad4:	fcc43423          	sd	a2,-56(s0)
    80004ad8:	fcd43023          	sd	a3,-64(s0)
    80004adc:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    80004ae0:	ffffe097          	auipc	ra,0xffffe
    80004ae4:	d4c080e7          	jalr	-692(ra) # 8000282c <myproc>
    80004ae8:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    80004aec:	fdc42783          	lw	a5,-36(s0)
    80004af0:	2781                	sext.w	a5,a5
    80004af2:	c38d                	beqz	a5,80004b14 <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    80004af4:	fe843783          	ld	a5,-24(s0)
    80004af8:	6bbc                	ld	a5,80(a5)
    80004afa:	fc043683          	ld	a3,-64(s0)
    80004afe:	fc843603          	ld	a2,-56(s0)
    80004b02:	fd043583          	ld	a1,-48(s0)
    80004b06:	853e                	mv	a0,a5
    80004b08:	ffffd097          	auipc	ra,0xffffd
    80004b0c:	7de080e7          	jalr	2014(ra) # 800022e6 <copyout>
    80004b10:	87aa                	mv	a5,a0
    80004b12:	a839                	j	80004b30 <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    80004b14:	fd043783          	ld	a5,-48(s0)
    80004b18:	fc043703          	ld	a4,-64(s0)
    80004b1c:	2701                	sext.w	a4,a4
    80004b1e:	863a                	mv	a2,a4
    80004b20:	fc843583          	ld	a1,-56(s0)
    80004b24:	853e                	mv	a0,a5
    80004b26:	ffffd097          	auipc	ra,0xffffd
    80004b2a:	a00080e7          	jalr	-1536(ra) # 80001526 <memmove>
    return 0;
    80004b2e:	4781                	li	a5,0
  }
}
    80004b30:	853e                	mv	a0,a5
    80004b32:	70e2                	ld	ra,56(sp)
    80004b34:	7442                	ld	s0,48(sp)
    80004b36:	6121                	addi	sp,sp,64
    80004b38:	8082                	ret

0000000080004b3a <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80004b3a:	7139                	addi	sp,sp,-64
    80004b3c:	fc06                	sd	ra,56(sp)
    80004b3e:	f822                	sd	s0,48(sp)
    80004b40:	0080                	addi	s0,sp,64
    80004b42:	fca43c23          	sd	a0,-40(s0)
    80004b46:	87ae                	mv	a5,a1
    80004b48:	fcc43423          	sd	a2,-56(s0)
    80004b4c:	fcd43023          	sd	a3,-64(s0)
    80004b50:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    80004b54:	ffffe097          	auipc	ra,0xffffe
    80004b58:	cd8080e7          	jalr	-808(ra) # 8000282c <myproc>
    80004b5c:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    80004b60:	fd442783          	lw	a5,-44(s0)
    80004b64:	2781                	sext.w	a5,a5
    80004b66:	c38d                	beqz	a5,80004b88 <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    80004b68:	fe843783          	ld	a5,-24(s0)
    80004b6c:	6bbc                	ld	a5,80(a5)
    80004b6e:	fc043683          	ld	a3,-64(s0)
    80004b72:	fc843603          	ld	a2,-56(s0)
    80004b76:	fd843583          	ld	a1,-40(s0)
    80004b7a:	853e                	mv	a0,a5
    80004b7c:	ffffe097          	auipc	ra,0xffffe
    80004b80:	838080e7          	jalr	-1992(ra) # 800023b4 <copyin>
    80004b84:	87aa                	mv	a5,a0
    80004b86:	a839                	j	80004ba4 <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    80004b88:	fc843783          	ld	a5,-56(s0)
    80004b8c:	fc043703          	ld	a4,-64(s0)
    80004b90:	2701                	sext.w	a4,a4
    80004b92:	863a                	mv	a2,a4
    80004b94:	85be                	mv	a1,a5
    80004b96:	fd843503          	ld	a0,-40(s0)
    80004b9a:	ffffd097          	auipc	ra,0xffffd
    80004b9e:	98c080e7          	jalr	-1652(ra) # 80001526 <memmove>
    return 0;
    80004ba2:	4781                	li	a5,0
  }
}
    80004ba4:	853e                	mv	a0,a5
    80004ba6:	70e2                	ld	ra,56(sp)
    80004ba8:	7442                	ld	s0,48(sp)
    80004baa:	6121                	addi	sp,sp,64
    80004bac:	8082                	ret

0000000080004bae <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80004bae:	1101                	addi	sp,sp,-32
    80004bb0:	ec06                	sd	ra,24(sp)
    80004bb2:	e822                	sd	s0,16(sp)
    80004bb4:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    80004bb6:	00007517          	auipc	a0,0x7
    80004bba:	6ba50513          	addi	a0,a0,1722 # 8000c270 <etext+0x270>
    80004bbe:	ffffc097          	auipc	ra,0xffffc
    80004bc2:	e6a080e7          	jalr	-406(ra) # 80000a28 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80004bc6:	00011797          	auipc	a5,0x11
    80004bca:	b0a78793          	addi	a5,a5,-1270 # 800156d0 <proc>
    80004bce:	fef43423          	sd	a5,-24(s0)
    80004bd2:	a04d                	j	80004c74 <procdump+0xc6>
    if(p->state == UNUSED)
    80004bd4:	fe843783          	ld	a5,-24(s0)
    80004bd8:	4f9c                	lw	a5,24(a5)
    80004bda:	c7d1                	beqz	a5,80004c66 <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80004bdc:	fe843783          	ld	a5,-24(s0)
    80004be0:	4f9c                	lw	a5,24(a5)
    80004be2:	873e                	mv	a4,a5
    80004be4:	4795                	li	a5,5
    80004be6:	02e7ee63          	bltu	a5,a4,80004c22 <procdump+0x74>
    80004bea:	fe843783          	ld	a5,-24(s0)
    80004bee:	4f9c                	lw	a5,24(a5)
    80004bf0:	00008717          	auipc	a4,0x8
    80004bf4:	bc070713          	addi	a4,a4,-1088 # 8000c7b0 <states.1827>
    80004bf8:	1782                	slli	a5,a5,0x20
    80004bfa:	9381                	srli	a5,a5,0x20
    80004bfc:	078e                	slli	a5,a5,0x3
    80004bfe:	97ba                	add	a5,a5,a4
    80004c00:	639c                	ld	a5,0(a5)
    80004c02:	c385                	beqz	a5,80004c22 <procdump+0x74>
      state = states[p->state];
    80004c04:	fe843783          	ld	a5,-24(s0)
    80004c08:	4f9c                	lw	a5,24(a5)
    80004c0a:	00008717          	auipc	a4,0x8
    80004c0e:	ba670713          	addi	a4,a4,-1114 # 8000c7b0 <states.1827>
    80004c12:	1782                	slli	a5,a5,0x20
    80004c14:	9381                	srli	a5,a5,0x20
    80004c16:	078e                	slli	a5,a5,0x3
    80004c18:	97ba                	add	a5,a5,a4
    80004c1a:	639c                	ld	a5,0(a5)
    80004c1c:	fef43023          	sd	a5,-32(s0)
    80004c20:	a039                	j	80004c2e <procdump+0x80>
    else
      state = "???";
    80004c22:	00007797          	auipc	a5,0x7
    80004c26:	65678793          	addi	a5,a5,1622 # 8000c278 <etext+0x278>
    80004c2a:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80004c2e:	fe843783          	ld	a5,-24(s0)
    80004c32:	5b98                	lw	a4,48(a5)
    80004c34:	fe843783          	ld	a5,-24(s0)
    80004c38:	15878793          	addi	a5,a5,344
    80004c3c:	86be                	mv	a3,a5
    80004c3e:	fe043603          	ld	a2,-32(s0)
    80004c42:	85ba                	mv	a1,a4
    80004c44:	00007517          	auipc	a0,0x7
    80004c48:	63c50513          	addi	a0,a0,1596 # 8000c280 <etext+0x280>
    80004c4c:	ffffc097          	auipc	ra,0xffffc
    80004c50:	ddc080e7          	jalr	-548(ra) # 80000a28 <printf>
    printf("\n");
    80004c54:	00007517          	auipc	a0,0x7
    80004c58:	61c50513          	addi	a0,a0,1564 # 8000c270 <etext+0x270>
    80004c5c:	ffffc097          	auipc	ra,0xffffc
    80004c60:	dcc080e7          	jalr	-564(ra) # 80000a28 <printf>
    80004c64:	a011                	j	80004c68 <procdump+0xba>
      continue;
    80004c66:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    80004c68:	fe843783          	ld	a5,-24(s0)
    80004c6c:	19878793          	addi	a5,a5,408
    80004c70:	fef43423          	sd	a5,-24(s0)
    80004c74:	fe843703          	ld	a4,-24(s0)
    80004c78:	00017797          	auipc	a5,0x17
    80004c7c:	05878793          	addi	a5,a5,88 # 8001bcd0 <pid_lock>
    80004c80:	f4f76ae3          	bltu	a4,a5,80004bd4 <procdump+0x26>
  }
}
    80004c84:	0001                	nop
    80004c86:	0001                	nop
    80004c88:	60e2                	ld	ra,24(sp)
    80004c8a:	6442                	ld	s0,16(sp)
    80004c8c:	6105                	addi	sp,sp,32
    80004c8e:	8082                	ret

0000000080004c90 <swtch>:
    80004c90:	00153023          	sd	ra,0(a0)
    80004c94:	00253423          	sd	sp,8(a0)
    80004c98:	e900                	sd	s0,16(a0)
    80004c9a:	ed04                	sd	s1,24(a0)
    80004c9c:	03253023          	sd	s2,32(a0)
    80004ca0:	03353423          	sd	s3,40(a0)
    80004ca4:	03453823          	sd	s4,48(a0)
    80004ca8:	03553c23          	sd	s5,56(a0)
    80004cac:	05653023          	sd	s6,64(a0)
    80004cb0:	05753423          	sd	s7,72(a0)
    80004cb4:	05853823          	sd	s8,80(a0)
    80004cb8:	05953c23          	sd	s9,88(a0)
    80004cbc:	07a53023          	sd	s10,96(a0)
    80004cc0:	07b53423          	sd	s11,104(a0)
    80004cc4:	0005b083          	ld	ra,0(a1)
    80004cc8:	0085b103          	ld	sp,8(a1)
    80004ccc:	6980                	ld	s0,16(a1)
    80004cce:	6d84                	ld	s1,24(a1)
    80004cd0:	0205b903          	ld	s2,32(a1)
    80004cd4:	0285b983          	ld	s3,40(a1)
    80004cd8:	0305ba03          	ld	s4,48(a1)
    80004cdc:	0385ba83          	ld	s5,56(a1)
    80004ce0:	0405bb03          	ld	s6,64(a1)
    80004ce4:	0485bb83          	ld	s7,72(a1)
    80004ce8:	0505bc03          	ld	s8,80(a1)
    80004cec:	0585bc83          	ld	s9,88(a1)
    80004cf0:	0605bd03          	ld	s10,96(a1)
    80004cf4:	0685bd83          	ld	s11,104(a1)
    80004cf8:	8082                	ret

0000000080004cfa <r_sstatus>:
{
    80004cfa:	1101                	addi	sp,sp,-32
    80004cfc:	ec22                	sd	s0,24(sp)
    80004cfe:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80004d00:	100027f3          	csrr	a5,sstatus
    80004d04:	fef43423          	sd	a5,-24(s0)
  return x;
    80004d08:	fe843783          	ld	a5,-24(s0)
}
    80004d0c:	853e                	mv	a0,a5
    80004d0e:	6462                	ld	s0,24(sp)
    80004d10:	6105                	addi	sp,sp,32
    80004d12:	8082                	ret

0000000080004d14 <w_sstatus>:
{
    80004d14:	1101                	addi	sp,sp,-32
    80004d16:	ec22                	sd	s0,24(sp)
    80004d18:	1000                	addi	s0,sp,32
    80004d1a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80004d1e:	fe843783          	ld	a5,-24(s0)
    80004d22:	10079073          	csrw	sstatus,a5
}
    80004d26:	0001                	nop
    80004d28:	6462                	ld	s0,24(sp)
    80004d2a:	6105                	addi	sp,sp,32
    80004d2c:	8082                	ret

0000000080004d2e <r_sip>:
{
    80004d2e:	1101                	addi	sp,sp,-32
    80004d30:	ec22                	sd	s0,24(sp)
    80004d32:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    80004d34:	144027f3          	csrr	a5,sip
    80004d38:	fef43423          	sd	a5,-24(s0)
  return x;
    80004d3c:	fe843783          	ld	a5,-24(s0)
}
    80004d40:	853e                	mv	a0,a5
    80004d42:	6462                	ld	s0,24(sp)
    80004d44:	6105                	addi	sp,sp,32
    80004d46:	8082                	ret

0000000080004d48 <w_sip>:
{
    80004d48:	1101                	addi	sp,sp,-32
    80004d4a:	ec22                	sd	s0,24(sp)
    80004d4c:	1000                	addi	s0,sp,32
    80004d4e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    80004d52:	fe843783          	ld	a5,-24(s0)
    80004d56:	14479073          	csrw	sip,a5
}
    80004d5a:	0001                	nop
    80004d5c:	6462                	ld	s0,24(sp)
    80004d5e:	6105                	addi	sp,sp,32
    80004d60:	8082                	ret

0000000080004d62 <w_sepc>:
{
    80004d62:	1101                	addi	sp,sp,-32
    80004d64:	ec22                	sd	s0,24(sp)
    80004d66:	1000                	addi	s0,sp,32
    80004d68:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80004d6c:	fe843783          	ld	a5,-24(s0)
    80004d70:	14179073          	csrw	sepc,a5
}
    80004d74:	0001                	nop
    80004d76:	6462                	ld	s0,24(sp)
    80004d78:	6105                	addi	sp,sp,32
    80004d7a:	8082                	ret

0000000080004d7c <r_sepc>:
{
    80004d7c:	1101                	addi	sp,sp,-32
    80004d7e:	ec22                	sd	s0,24(sp)
    80004d80:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80004d82:	141027f3          	csrr	a5,sepc
    80004d86:	fef43423          	sd	a5,-24(s0)
  return x;
    80004d8a:	fe843783          	ld	a5,-24(s0)
}
    80004d8e:	853e                	mv	a0,a5
    80004d90:	6462                	ld	s0,24(sp)
    80004d92:	6105                	addi	sp,sp,32
    80004d94:	8082                	ret

0000000080004d96 <w_stvec>:
{
    80004d96:	1101                	addi	sp,sp,-32
    80004d98:	ec22                	sd	s0,24(sp)
    80004d9a:	1000                	addi	s0,sp,32
    80004d9c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80004da0:	fe843783          	ld	a5,-24(s0)
    80004da4:	10579073          	csrw	stvec,a5
}
    80004da8:	0001                	nop
    80004daa:	6462                	ld	s0,24(sp)
    80004dac:	6105                	addi	sp,sp,32
    80004dae:	8082                	ret

0000000080004db0 <r_satp>:
{
    80004db0:	1101                	addi	sp,sp,-32
    80004db2:	ec22                	sd	s0,24(sp)
    80004db4:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80004db6:	180027f3          	csrr	a5,satp
    80004dba:	fef43423          	sd	a5,-24(s0)
  return x;
    80004dbe:	fe843783          	ld	a5,-24(s0)
}
    80004dc2:	853e                	mv	a0,a5
    80004dc4:	6462                	ld	s0,24(sp)
    80004dc6:	6105                	addi	sp,sp,32
    80004dc8:	8082                	ret

0000000080004dca <r_scause>:
{
    80004dca:	1101                	addi	sp,sp,-32
    80004dcc:	ec22                	sd	s0,24(sp)
    80004dce:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80004dd0:	142027f3          	csrr	a5,scause
    80004dd4:	fef43423          	sd	a5,-24(s0)
  return x;
    80004dd8:	fe843783          	ld	a5,-24(s0)
}
    80004ddc:	853e                	mv	a0,a5
    80004dde:	6462                	ld	s0,24(sp)
    80004de0:	6105                	addi	sp,sp,32
    80004de2:	8082                	ret

0000000080004de4 <r_stval>:
{
    80004de4:	1101                	addi	sp,sp,-32
    80004de6:	ec22                	sd	s0,24(sp)
    80004de8:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80004dea:	143027f3          	csrr	a5,stval
    80004dee:	fef43423          	sd	a5,-24(s0)
  return x;
    80004df2:	fe843783          	ld	a5,-24(s0)
}
    80004df6:	853e                	mv	a0,a5
    80004df8:	6462                	ld	s0,24(sp)
    80004dfa:	6105                	addi	sp,sp,32
    80004dfc:	8082                	ret

0000000080004dfe <intr_on>:
{
    80004dfe:	1141                	addi	sp,sp,-16
    80004e00:	e406                	sd	ra,8(sp)
    80004e02:	e022                	sd	s0,0(sp)
    80004e04:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80004e06:	00000097          	auipc	ra,0x0
    80004e0a:	ef4080e7          	jalr	-268(ra) # 80004cfa <r_sstatus>
    80004e0e:	87aa                	mv	a5,a0
    80004e10:	0027e793          	ori	a5,a5,2
    80004e14:	853e                	mv	a0,a5
    80004e16:	00000097          	auipc	ra,0x0
    80004e1a:	efe080e7          	jalr	-258(ra) # 80004d14 <w_sstatus>
}
    80004e1e:	0001                	nop
    80004e20:	60a2                	ld	ra,8(sp)
    80004e22:	6402                	ld	s0,0(sp)
    80004e24:	0141                	addi	sp,sp,16
    80004e26:	8082                	ret

0000000080004e28 <intr_off>:
{
    80004e28:	1141                	addi	sp,sp,-16
    80004e2a:	e406                	sd	ra,8(sp)
    80004e2c:	e022                	sd	s0,0(sp)
    80004e2e:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80004e30:	00000097          	auipc	ra,0x0
    80004e34:	eca080e7          	jalr	-310(ra) # 80004cfa <r_sstatus>
    80004e38:	87aa                	mv	a5,a0
    80004e3a:	9bf5                	andi	a5,a5,-3
    80004e3c:	853e                	mv	a0,a5
    80004e3e:	00000097          	auipc	ra,0x0
    80004e42:	ed6080e7          	jalr	-298(ra) # 80004d14 <w_sstatus>
}
    80004e46:	0001                	nop
    80004e48:	60a2                	ld	ra,8(sp)
    80004e4a:	6402                	ld	s0,0(sp)
    80004e4c:	0141                	addi	sp,sp,16
    80004e4e:	8082                	ret

0000000080004e50 <intr_get>:
{
    80004e50:	1101                	addi	sp,sp,-32
    80004e52:	ec06                	sd	ra,24(sp)
    80004e54:	e822                	sd	s0,16(sp)
    80004e56:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80004e58:	00000097          	auipc	ra,0x0
    80004e5c:	ea2080e7          	jalr	-350(ra) # 80004cfa <r_sstatus>
    80004e60:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80004e64:	fe843783          	ld	a5,-24(s0)
    80004e68:	8b89                	andi	a5,a5,2
    80004e6a:	00f037b3          	snez	a5,a5
    80004e6e:	0ff7f793          	andi	a5,a5,255
    80004e72:	2781                	sext.w	a5,a5
}
    80004e74:	853e                	mv	a0,a5
    80004e76:	60e2                	ld	ra,24(sp)
    80004e78:	6442                	ld	s0,16(sp)
    80004e7a:	6105                	addi	sp,sp,32
    80004e7c:	8082                	ret

0000000080004e7e <r_tp>:
{
    80004e7e:	1101                	addi	sp,sp,-32
    80004e80:	ec22                	sd	s0,24(sp)
    80004e82:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80004e84:	8792                	mv	a5,tp
    80004e86:	fef43423          	sd	a5,-24(s0)
  return x;
    80004e8a:	fe843783          	ld	a5,-24(s0)
}
    80004e8e:	853e                	mv	a0,a5
    80004e90:	6462                	ld	s0,24(sp)
    80004e92:	6105                	addi	sp,sp,32
    80004e94:	8082                	ret

0000000080004e96 <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80004e96:	1141                	addi	sp,sp,-16
    80004e98:	e406                	sd	ra,8(sp)
    80004e9a:	e022                	sd	s0,0(sp)
    80004e9c:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80004e9e:	00007597          	auipc	a1,0x7
    80004ea2:	42258593          	addi	a1,a1,1058 # 8000c2c0 <etext+0x2c0>
    80004ea6:	00017517          	auipc	a0,0x17
    80004eaa:	e5a50513          	addi	a0,a0,-422 # 8001bd00 <tickslock>
    80004eae:	ffffc097          	auipc	ra,0xffffc
    80004eb2:	390080e7          	jalr	912(ra) # 8000123e <initlock>
}
    80004eb6:	0001                	nop
    80004eb8:	60a2                	ld	ra,8(sp)
    80004eba:	6402                	ld	s0,0(sp)
    80004ebc:	0141                	addi	sp,sp,16
    80004ebe:	8082                	ret

0000000080004ec0 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80004ec0:	1141                	addi	sp,sp,-16
    80004ec2:	e406                	sd	ra,8(sp)
    80004ec4:	e022                	sd	s0,0(sp)
    80004ec6:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80004ec8:	00005797          	auipc	a5,0x5
    80004ecc:	e4878793          	addi	a5,a5,-440 # 80009d10 <kernelvec>
    80004ed0:	853e                	mv	a0,a5
    80004ed2:	00000097          	auipc	ra,0x0
    80004ed6:	ec4080e7          	jalr	-316(ra) # 80004d96 <w_stvec>
}
    80004eda:	0001                	nop
    80004edc:	60a2                	ld	ra,8(sp)
    80004ede:	6402                	ld	s0,0(sp)
    80004ee0:	0141                	addi	sp,sp,16
    80004ee2:	8082                	ret

0000000080004ee4 <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80004ee4:	7179                	addi	sp,sp,-48
    80004ee6:	f406                	sd	ra,40(sp)
    80004ee8:	f022                	sd	s0,32(sp)
    80004eea:	ec26                	sd	s1,24(sp)
    80004eec:	1800                	addi	s0,sp,48
  int which_dev = 0;
    80004eee:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80004ef2:	00000097          	auipc	ra,0x0
    80004ef6:	e08080e7          	jalr	-504(ra) # 80004cfa <r_sstatus>
    80004efa:	87aa                	mv	a5,a0
    80004efc:	1007f793          	andi	a5,a5,256
    80004f00:	cb89                	beqz	a5,80004f12 <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80004f02:	00007517          	auipc	a0,0x7
    80004f06:	3c650513          	addi	a0,a0,966 # 8000c2c8 <etext+0x2c8>
    80004f0a:	ffffc097          	auipc	ra,0xffffc
    80004f0e:	d74080e7          	jalr	-652(ra) # 80000c7e <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80004f12:	00005797          	auipc	a5,0x5
    80004f16:	dfe78793          	addi	a5,a5,-514 # 80009d10 <kernelvec>
    80004f1a:	853e                	mv	a0,a5
    80004f1c:	00000097          	auipc	ra,0x0
    80004f20:	e7a080e7          	jalr	-390(ra) # 80004d96 <w_stvec>

  struct proc *p = myproc();
    80004f24:	ffffe097          	auipc	ra,0xffffe
    80004f28:	908080e7          	jalr	-1784(ra) # 8000282c <myproc>
    80004f2c:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80004f30:	fd043783          	ld	a5,-48(s0)
    80004f34:	6fa4                	ld	s1,88(a5)
    80004f36:	00000097          	auipc	ra,0x0
    80004f3a:	e46080e7          	jalr	-442(ra) # 80004d7c <r_sepc>
    80004f3e:	87aa                	mv	a5,a0
    80004f40:	ec9c                	sd	a5,24(s1)
  
  if(r_scause() == 8){
    80004f42:	00000097          	auipc	ra,0x0
    80004f46:	e88080e7          	jalr	-376(ra) # 80004dca <r_scause>
    80004f4a:	872a                	mv	a4,a0
    80004f4c:	47a1                	li	a5,8
    80004f4e:	02f71d63          	bne	a4,a5,80004f88 <usertrap+0xa4>
    // system call

    if(p->killed)
    80004f52:	fd043783          	ld	a5,-48(s0)
    80004f56:	579c                	lw	a5,40(a5)
    80004f58:	c791                	beqz	a5,80004f64 <usertrap+0x80>
      exit(-1);
    80004f5a:	557d                	li	a0,-1
    80004f5c:	ffffe097          	auipc	ra,0xffffe
    80004f60:	0f4080e7          	jalr	244(ra) # 80003050 <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80004f64:	fd043783          	ld	a5,-48(s0)
    80004f68:	6fbc                	ld	a5,88(a5)
    80004f6a:	6f98                	ld	a4,24(a5)
    80004f6c:	fd043783          	ld	a5,-48(s0)
    80004f70:	6fbc                	ld	a5,88(a5)
    80004f72:	0711                	addi	a4,a4,4
    80004f74:	ef98                	sd	a4,24(a5)

    // an interrupt will change sstatus &c registers,
    // so don't enable until done with those registers.
    intr_on();
    80004f76:	00000097          	auipc	ra,0x0
    80004f7a:	e88080e7          	jalr	-376(ra) # 80004dfe <intr_on>

    syscall();
    80004f7e:	00000097          	auipc	ra,0x0
    80004f82:	6f2080e7          	jalr	1778(ra) # 80005670 <syscall>
    80004f86:	a0b5                	j	80004ff2 <usertrap+0x10e>
  } else if((which_dev = devintr()) != 0){
    80004f88:	00000097          	auipc	ra,0x0
    80004f8c:	3ba080e7          	jalr	954(ra) # 80005342 <devintr>
    80004f90:	87aa                	mv	a5,a0
    80004f92:	fcf42e23          	sw	a5,-36(s0)
    80004f96:	fdc42783          	lw	a5,-36(s0)
    80004f9a:	2781                	sext.w	a5,a5
    80004f9c:	ebb9                	bnez	a5,80004ff2 <usertrap+0x10e>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80004f9e:	00000097          	auipc	ra,0x0
    80004fa2:	e2c080e7          	jalr	-468(ra) # 80004dca <r_scause>
    80004fa6:	872a                	mv	a4,a0
    80004fa8:	fd043783          	ld	a5,-48(s0)
    80004fac:	5b9c                	lw	a5,48(a5)
    80004fae:	863e                	mv	a2,a5
    80004fb0:	85ba                	mv	a1,a4
    80004fb2:	00007517          	auipc	a0,0x7
    80004fb6:	33650513          	addi	a0,a0,822 # 8000c2e8 <etext+0x2e8>
    80004fba:	ffffc097          	auipc	ra,0xffffc
    80004fbe:	a6e080e7          	jalr	-1426(ra) # 80000a28 <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80004fc2:	00000097          	auipc	ra,0x0
    80004fc6:	dba080e7          	jalr	-582(ra) # 80004d7c <r_sepc>
    80004fca:	84aa                	mv	s1,a0
    80004fcc:	00000097          	auipc	ra,0x0
    80004fd0:	e18080e7          	jalr	-488(ra) # 80004de4 <r_stval>
    80004fd4:	87aa                	mv	a5,a0
    80004fd6:	863e                	mv	a2,a5
    80004fd8:	85a6                	mv	a1,s1
    80004fda:	00007517          	auipc	a0,0x7
    80004fde:	33e50513          	addi	a0,a0,830 # 8000c318 <etext+0x318>
    80004fe2:	ffffc097          	auipc	ra,0xffffc
    80004fe6:	a46080e7          	jalr	-1466(ra) # 80000a28 <printf>
    p->killed = 1;
    80004fea:	fd043783          	ld	a5,-48(s0)
    80004fee:	4705                	li	a4,1
    80004ff0:	d798                	sw	a4,40(a5)
  }

  if(p->killed)
    80004ff2:	fd043783          	ld	a5,-48(s0)
    80004ff6:	579c                	lw	a5,40(a5)
    80004ff8:	c791                	beqz	a5,80005004 <usertrap+0x120>
    exit(-1);
    80004ffa:	557d                	li	a0,-1
    80004ffc:	ffffe097          	auipc	ra,0xffffe
    80005000:	054080e7          	jalr	84(ra) # 80003050 <exit>
      {
          cfs_tickyield(p);
      }
  }*/

  usertrapret();
    80005004:	00000097          	auipc	ra,0x0
    80005008:	014080e7          	jalr	20(ra) # 80005018 <usertrapret>
}
    8000500c:	0001                	nop
    8000500e:	70a2                	ld	ra,40(sp)
    80005010:	7402                	ld	s0,32(sp)
    80005012:	64e2                	ld	s1,24(sp)
    80005014:	6145                	addi	sp,sp,48
    80005016:	8082                	ret

0000000080005018 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80005018:	7139                	addi	sp,sp,-64
    8000501a:	fc06                	sd	ra,56(sp)
    8000501c:	f822                	sd	s0,48(sp)
    8000501e:	f426                	sd	s1,40(sp)
    80005020:	0080                	addi	s0,sp,64
  struct proc *p = myproc();
    80005022:	ffffe097          	auipc	ra,0xffffe
    80005026:	80a080e7          	jalr	-2038(ra) # 8000282c <myproc>
    8000502a:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    8000502e:	00000097          	auipc	ra,0x0
    80005032:	dfa080e7          	jalr	-518(ra) # 80004e28 <intr_off>

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80005036:	00006717          	auipc	a4,0x6
    8000503a:	fca70713          	addi	a4,a4,-54 # 8000b000 <_trampoline>
    8000503e:	00006797          	auipc	a5,0x6
    80005042:	fc278793          	addi	a5,a5,-62 # 8000b000 <_trampoline>
    80005046:	8f1d                	sub	a4,a4,a5
    80005048:	040007b7          	lui	a5,0x4000
    8000504c:	17fd                	addi	a5,a5,-1
    8000504e:	07b2                	slli	a5,a5,0xc
    80005050:	97ba                	add	a5,a5,a4
    80005052:	853e                	mv	a0,a5
    80005054:	00000097          	auipc	ra,0x0
    80005058:	d42080e7          	jalr	-702(ra) # 80004d96 <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    8000505c:	fd843783          	ld	a5,-40(s0)
    80005060:	6fa4                	ld	s1,88(a5)
    80005062:	00000097          	auipc	ra,0x0
    80005066:	d4e080e7          	jalr	-690(ra) # 80004db0 <r_satp>
    8000506a:	87aa                	mv	a5,a0
    8000506c:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    8000506e:	fd843783          	ld	a5,-40(s0)
    80005072:	63b4                	ld	a3,64(a5)
    80005074:	fd843783          	ld	a5,-40(s0)
    80005078:	6fbc                	ld	a5,88(a5)
    8000507a:	6705                	lui	a4,0x1
    8000507c:	9736                	add	a4,a4,a3
    8000507e:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80005080:	fd843783          	ld	a5,-40(s0)
    80005084:	6fbc                	ld	a5,88(a5)
    80005086:	00000717          	auipc	a4,0x0
    8000508a:	e5e70713          	addi	a4,a4,-418 # 80004ee4 <usertrap>
    8000508e:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80005090:	fd843783          	ld	a5,-40(s0)
    80005094:	6fa4                	ld	s1,88(a5)
    80005096:	00000097          	auipc	ra,0x0
    8000509a:	de8080e7          	jalr	-536(ra) # 80004e7e <r_tp>
    8000509e:	87aa                	mv	a5,a0
    800050a0:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    800050a2:	00000097          	auipc	ra,0x0
    800050a6:	c58080e7          	jalr	-936(ra) # 80004cfa <r_sstatus>
    800050aa:	fca43823          	sd	a0,-48(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    800050ae:	fd043783          	ld	a5,-48(s0)
    800050b2:	eff7f793          	andi	a5,a5,-257
    800050b6:	fcf43823          	sd	a5,-48(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    800050ba:	fd043783          	ld	a5,-48(s0)
    800050be:	0207e793          	ori	a5,a5,32
    800050c2:	fcf43823          	sd	a5,-48(s0)
  w_sstatus(x);
    800050c6:	fd043503          	ld	a0,-48(s0)
    800050ca:	00000097          	auipc	ra,0x0
    800050ce:	c4a080e7          	jalr	-950(ra) # 80004d14 <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    800050d2:	fd843783          	ld	a5,-40(s0)
    800050d6:	6fbc                	ld	a5,88(a5)
    800050d8:	6f9c                	ld	a5,24(a5)
    800050da:	853e                	mv	a0,a5
    800050dc:	00000097          	auipc	ra,0x0
    800050e0:	c86080e7          	jalr	-890(ra) # 80004d62 <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    800050e4:	fd843783          	ld	a5,-40(s0)
    800050e8:	6bbc                	ld	a5,80(a5)
    800050ea:	00c7d713          	srli	a4,a5,0xc
    800050ee:	57fd                	li	a5,-1
    800050f0:	17fe                	slli	a5,a5,0x3f
    800050f2:	8fd9                	or	a5,a5,a4
    800050f4:	fcf43423          	sd	a5,-56(s0)

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    800050f8:	00006717          	auipc	a4,0x6
    800050fc:	f9870713          	addi	a4,a4,-104 # 8000b090 <userret>
    80005100:	00006797          	auipc	a5,0x6
    80005104:	f0078793          	addi	a5,a5,-256 # 8000b000 <_trampoline>
    80005108:	8f1d                	sub	a4,a4,a5
    8000510a:	040007b7          	lui	a5,0x4000
    8000510e:	17fd                	addi	a5,a5,-1
    80005110:	07b2                	slli	a5,a5,0xc
    80005112:	97ba                	add	a5,a5,a4
    80005114:	fcf43023          	sd	a5,-64(s0)
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    80005118:	fc043703          	ld	a4,-64(s0)
    8000511c:	fc843583          	ld	a1,-56(s0)
    80005120:	020007b7          	lui	a5,0x2000
    80005124:	17fd                	addi	a5,a5,-1
    80005126:	00d79513          	slli	a0,a5,0xd
    8000512a:	9702                	jalr	a4
}
    8000512c:	0001                	nop
    8000512e:	70e2                	ld	ra,56(sp)
    80005130:	7442                	ld	s0,48(sp)
    80005132:	74a2                	ld	s1,40(sp)
    80005134:	6121                	addi	sp,sp,64
    80005136:	8082                	ret

0000000080005138 <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80005138:	7139                	addi	sp,sp,-64
    8000513a:	fc06                	sd	ra,56(sp)
    8000513c:	f822                	sd	s0,48(sp)
    8000513e:	f426                	sd	s1,40(sp)
    80005140:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80005142:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80005146:	00000097          	auipc	ra,0x0
    8000514a:	c36080e7          	jalr	-970(ra) # 80004d7c <r_sepc>
    8000514e:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80005152:	00000097          	auipc	ra,0x0
    80005156:	ba8080e7          	jalr	-1112(ra) # 80004cfa <r_sstatus>
    8000515a:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    8000515e:	00000097          	auipc	ra,0x0
    80005162:	c6c080e7          	jalr	-916(ra) # 80004dca <r_scause>
    80005166:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    8000516a:	fc843783          	ld	a5,-56(s0)
    8000516e:	1007f793          	andi	a5,a5,256
    80005172:	eb89                	bnez	a5,80005184 <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80005174:	00007517          	auipc	a0,0x7
    80005178:	1c450513          	addi	a0,a0,452 # 8000c338 <etext+0x338>
    8000517c:	ffffc097          	auipc	ra,0xffffc
    80005180:	b02080e7          	jalr	-1278(ra) # 80000c7e <panic>
  if(intr_get() != 0)
    80005184:	00000097          	auipc	ra,0x0
    80005188:	ccc080e7          	jalr	-820(ra) # 80004e50 <intr_get>
    8000518c:	87aa                	mv	a5,a0
    8000518e:	cb89                	beqz	a5,800051a0 <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    80005190:	00007517          	auipc	a0,0x7
    80005194:	1d050513          	addi	a0,a0,464 # 8000c360 <etext+0x360>
    80005198:	ffffc097          	auipc	ra,0xffffc
    8000519c:	ae6080e7          	jalr	-1306(ra) # 80000c7e <panic>

  if((which_dev = devintr()) == 0){
    800051a0:	00000097          	auipc	ra,0x0
    800051a4:	1a2080e7          	jalr	418(ra) # 80005342 <devintr>
    800051a8:	87aa                	mv	a5,a0
    800051aa:	fcf42e23          	sw	a5,-36(s0)
    800051ae:	fdc42783          	lw	a5,-36(s0)
    800051b2:	2781                	sext.w	a5,a5
    800051b4:	e7b9                	bnez	a5,80005202 <kerneltrap+0xca>
    printf("scause %p\n", scause);
    800051b6:	fc043583          	ld	a1,-64(s0)
    800051ba:	00007517          	auipc	a0,0x7
    800051be:	1c650513          	addi	a0,a0,454 # 8000c380 <etext+0x380>
    800051c2:	ffffc097          	auipc	ra,0xffffc
    800051c6:	866080e7          	jalr	-1946(ra) # 80000a28 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    800051ca:	00000097          	auipc	ra,0x0
    800051ce:	bb2080e7          	jalr	-1102(ra) # 80004d7c <r_sepc>
    800051d2:	84aa                	mv	s1,a0
    800051d4:	00000097          	auipc	ra,0x0
    800051d8:	c10080e7          	jalr	-1008(ra) # 80004de4 <r_stval>
    800051dc:	87aa                	mv	a5,a0
    800051de:	863e                	mv	a2,a5
    800051e0:	85a6                	mv	a1,s1
    800051e2:	00007517          	auipc	a0,0x7
    800051e6:	1ae50513          	addi	a0,a0,430 # 8000c390 <etext+0x390>
    800051ea:	ffffc097          	auipc	ra,0xffffc
    800051ee:	83e080e7          	jalr	-1986(ra) # 80000a28 <printf>
    panic("kerneltrap");
    800051f2:	00007517          	auipc	a0,0x7
    800051f6:	1b650513          	addi	a0,a0,438 # 8000c3a8 <etext+0x3a8>
    800051fa:	ffffc097          	auipc	ra,0xffffc
    800051fe:	a84080e7          	jalr	-1404(ra) # 80000c7e <panic>
      }
  }*/

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    80005202:	fd043503          	ld	a0,-48(s0)
    80005206:	00000097          	auipc	ra,0x0
    8000520a:	b5c080e7          	jalr	-1188(ra) # 80004d62 <w_sepc>
  w_sstatus(sstatus);
    8000520e:	fc843503          	ld	a0,-56(s0)
    80005212:	00000097          	auipc	ra,0x0
    80005216:	b02080e7          	jalr	-1278(ra) # 80004d14 <w_sstatus>
}
    8000521a:	0001                	nop
    8000521c:	70e2                	ld	ra,56(sp)
    8000521e:	7442                	ld	s0,48(sp)
    80005220:	74a2                	ld	s1,40(sp)
    80005222:	6121                	addi	sp,sp,64
    80005224:	8082                	ret

0000000080005226 <cfs_tickyield>:

// if CFS is active sched algorithm,
// every tick check if running proc quantum has expired
void cfs_tickyield(struct proc *p)
{
    80005226:	1101                	addi	sp,sp,-32
    80005228:	ec06                	sd	ra,24(sp)
    8000522a:	e822                	sd	s0,16(sp)
    8000522c:	1000                	addi	s0,sp,32
    8000522e:	fea43423          	sd	a0,-24(s0)
    if (p != 0 && p->quantum != 0)
    80005232:	fe843783          	ld	a5,-24(s0)
    80005236:	cbb5                	beqz	a5,800052aa <cfs_tickyield+0x84>
    80005238:	fe843783          	ld	a5,-24(s0)
    8000523c:	1907a783          	lw	a5,400(a5) # 2000190 <_entry-0x7dfffe70>
    80005240:	c7ad                	beqz	a5,800052aa <cfs_tickyield+0x84>
    {
        if ((int) ticks - (int) p->timestamp >= p->quantum)
    80005242:	00008797          	auipc	a5,0x8
    80005246:	dfe78793          	addi	a5,a5,-514 # 8000d040 <ticks>
    8000524a:	439c                	lw	a5,0(a5)
    8000524c:	0007871b          	sext.w	a4,a5
    80005250:	fe843783          	ld	a5,-24(s0)
    80005254:	1687a783          	lw	a5,360(a5)
    80005258:	2781                	sext.w	a5,a5
    8000525a:	40f707bb          	subw	a5,a4,a5
    8000525e:	0007871b          	sext.w	a4,a5
    80005262:	fe843783          	ld	a5,-24(s0)
    80005266:	1907a783          	lw	a5,400(a5)
    8000526a:	04f74063          	blt	a4,a5,800052aa <cfs_tickyield+0x84>
        {
            p->tau += (int) ticks - (int) p->timestamp;
    8000526e:	fe843783          	ld	a5,-24(s0)
    80005272:	16c7a703          	lw	a4,364(a5)
    80005276:	00008797          	auipc	a5,0x8
    8000527a:	dca78793          	addi	a5,a5,-566 # 8000d040 <ticks>
    8000527e:	439c                	lw	a5,0(a5)
    80005280:	0007869b          	sext.w	a3,a5
    80005284:	fe843783          	ld	a5,-24(s0)
    80005288:	1687a783          	lw	a5,360(a5)
    8000528c:	2781                	sext.w	a5,a5
    8000528e:	40f687bb          	subw	a5,a3,a5
    80005292:	2781                	sext.w	a5,a5
    80005294:	9fb9                	addw	a5,a5,a4
    80005296:	0007871b          	sext.w	a4,a5
    8000529a:	fe843783          	ld	a5,-24(s0)
    8000529e:	16e7a623          	sw	a4,364(a5)
            yield();
    800052a2:	fffff097          	auipc	ra,0xfffff
    800052a6:	536080e7          	jalr	1334(ra) # 800047d8 <yield>
        }
    }
}
    800052aa:	0001                	nop
    800052ac:	60e2                	ld	ra,24(sp)
    800052ae:	6442                	ld	s0,16(sp)
    800052b0:	6105                	addi	sp,sp,32
    800052b2:	8082                	ret

00000000800052b4 <clockintr>:

void
clockintr()
{
    800052b4:	1141                	addi	sp,sp,-16
    800052b6:	e406                	sd	ra,8(sp)
    800052b8:	e022                	sd	s0,0(sp)
    800052ba:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    800052bc:	00017517          	auipc	a0,0x17
    800052c0:	a4450513          	addi	a0,a0,-1468 # 8001bd00 <tickslock>
    800052c4:	ffffc097          	auipc	ra,0xffffc
    800052c8:	faa080e7          	jalr	-86(ra) # 8000126e <acquire>
  ticks++;
    800052cc:	00008797          	auipc	a5,0x8
    800052d0:	d7478793          	addi	a5,a5,-652 # 8000d040 <ticks>
    800052d4:	439c                	lw	a5,0(a5)
    800052d6:	2785                	addiw	a5,a5,1
    800052d8:	0007871b          	sext.w	a4,a5
    800052dc:	00008797          	auipc	a5,0x8
    800052e0:	d6478793          	addi	a5,a5,-668 # 8000d040 <ticks>
    800052e4:	c398                	sw	a4,0(a5)
  wakeup(&ticks);
    800052e6:	00008517          	auipc	a0,0x8
    800052ea:	d5a50513          	addi	a0,a0,-678 # 8000d040 <ticks>
    800052ee:	fffff097          	auipc	ra,0xfffff
    800052f2:	62a080e7          	jalr	1578(ra) # 80004918 <wakeup>
  release(&tickslock);
    800052f6:	00017517          	auipc	a0,0x17
    800052fa:	a0a50513          	addi	a0,a0,-1526 # 8001bd00 <tickslock>
    800052fe:	ffffc097          	auipc	ra,0xffffc
    80005302:	fd4080e7          	jalr	-44(ra) # 800012d2 <release>
  if (algid == 2 && alg_changing == 0)
    80005306:	00008797          	auipc	a5,0x8
    8000530a:	d1a78793          	addi	a5,a5,-742 # 8000d020 <algid>
    8000530e:	439c                	lw	a5,0(a5)
    80005310:	873e                	mv	a4,a5
    80005312:	4789                	li	a5,2
    80005314:	02f71263          	bne	a4,a5,80005338 <clockintr+0x84>
    80005318:	00008797          	auipc	a5,0x8
    8000531c:	d0c78793          	addi	a5,a5,-756 # 8000d024 <alg_changing>
    80005320:	439c                	lw	a5,0(a5)
    80005322:	eb99                	bnez	a5,80005338 <clockintr+0x84>
      cfs_tickyield(myproc());
    80005324:	ffffd097          	auipc	ra,0xffffd
    80005328:	508080e7          	jalr	1288(ra) # 8000282c <myproc>
    8000532c:	87aa                	mv	a5,a0
    8000532e:	853e                	mv	a0,a5
    80005330:	00000097          	auipc	ra,0x0
    80005334:	ef6080e7          	jalr	-266(ra) # 80005226 <cfs_tickyield>
}
    80005338:	0001                	nop
    8000533a:	60a2                	ld	ra,8(sp)
    8000533c:	6402                	ld	s0,0(sp)
    8000533e:	0141                	addi	sp,sp,16
    80005340:	8082                	ret

0000000080005342 <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    80005342:	1101                	addi	sp,sp,-32
    80005344:	ec06                	sd	ra,24(sp)
    80005346:	e822                	sd	s0,16(sp)
    80005348:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    8000534a:	00000097          	auipc	ra,0x0
    8000534e:	a80080e7          	jalr	-1408(ra) # 80004dca <r_scause>
    80005352:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    80005356:	fe843783          	ld	a5,-24(s0)
    8000535a:	0807d463          	bgez	a5,800053e2 <devintr+0xa0>
     (scause & 0xff) == 9){
    8000535e:	fe843783          	ld	a5,-24(s0)
    80005362:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    80005366:	47a5                	li	a5,9
    80005368:	06f71d63          	bne	a4,a5,800053e2 <devintr+0xa0>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    8000536c:	00005097          	auipc	ra,0x5
    80005370:	ad6080e7          	jalr	-1322(ra) # 80009e42 <plic_claim>
    80005374:	87aa                	mv	a5,a0
    80005376:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    8000537a:	fe442783          	lw	a5,-28(s0)
    8000537e:	0007871b          	sext.w	a4,a5
    80005382:	47a9                	li	a5,10
    80005384:	00f71763          	bne	a4,a5,80005392 <devintr+0x50>
      uartintr();
    80005388:	ffffc097          	auipc	ra,0xffffc
    8000538c:	bee080e7          	jalr	-1042(ra) # 80000f76 <uartintr>
    80005390:	a825                	j	800053c8 <devintr+0x86>
    } else if(irq == VIRTIO0_IRQ){
    80005392:	fe442783          	lw	a5,-28(s0)
    80005396:	0007871b          	sext.w	a4,a5
    8000539a:	4785                	li	a5,1
    8000539c:	00f71763          	bne	a4,a5,800053aa <devintr+0x68>
      virtio_disk_intr();
    800053a0:	00005097          	auipc	ra,0x5
    800053a4:	3b6080e7          	jalr	950(ra) # 8000a756 <virtio_disk_intr>
    800053a8:	a005                	j	800053c8 <devintr+0x86>
    } else if(irq){
    800053aa:	fe442783          	lw	a5,-28(s0)
    800053ae:	2781                	sext.w	a5,a5
    800053b0:	cf81                	beqz	a5,800053c8 <devintr+0x86>
      printf("unexpected interrupt irq=%d\n", irq);
    800053b2:	fe442783          	lw	a5,-28(s0)
    800053b6:	85be                	mv	a1,a5
    800053b8:	00007517          	auipc	a0,0x7
    800053bc:	00050513          	mv	a0,a0
    800053c0:	ffffb097          	auipc	ra,0xffffb
    800053c4:	668080e7          	jalr	1640(ra) # 80000a28 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    800053c8:	fe442783          	lw	a5,-28(s0)
    800053cc:	2781                	sext.w	a5,a5
    800053ce:	cb81                	beqz	a5,800053de <devintr+0x9c>
      plic_complete(irq);
    800053d0:	fe442783          	lw	a5,-28(s0)
    800053d4:	853e                	mv	a0,a5
    800053d6:	00005097          	auipc	ra,0x5
    800053da:	aaa080e7          	jalr	-1366(ra) # 80009e80 <plic_complete>

    return 1;
    800053de:	4785                	li	a5,1
    800053e0:	a081                	j	80005420 <devintr+0xde>
  } else if(scause == 0x8000000000000001L){
    800053e2:	fe843703          	ld	a4,-24(s0)
    800053e6:	57fd                	li	a5,-1
    800053e8:	17fe                	slli	a5,a5,0x3f
    800053ea:	0785                	addi	a5,a5,1
    800053ec:	02f71963          	bne	a4,a5,8000541e <devintr+0xdc>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    800053f0:	ffffd097          	auipc	ra,0xffffd
    800053f4:	3de080e7          	jalr	990(ra) # 800027ce <cpuid>
    800053f8:	87aa                	mv	a5,a0
    800053fa:	e789                	bnez	a5,80005404 <devintr+0xc2>
      clockintr();
    800053fc:	00000097          	auipc	ra,0x0
    80005400:	eb8080e7          	jalr	-328(ra) # 800052b4 <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    80005404:	00000097          	auipc	ra,0x0
    80005408:	92a080e7          	jalr	-1750(ra) # 80004d2e <r_sip>
    8000540c:	87aa                	mv	a5,a0
    8000540e:	9bf5                	andi	a5,a5,-3
    80005410:	853e                	mv	a0,a5
    80005412:	00000097          	auipc	ra,0x0
    80005416:	936080e7          	jalr	-1738(ra) # 80004d48 <w_sip>

    return 2;
    8000541a:	4789                	li	a5,2
    8000541c:	a011                	j	80005420 <devintr+0xde>
  } else {
    return 0;
    8000541e:	4781                	li	a5,0
  }
}
    80005420:	853e                	mv	a0,a5
    80005422:	60e2                	ld	ra,24(sp)
    80005424:	6442                	ld	s0,16(sp)
    80005426:	6105                	addi	sp,sp,32
    80005428:	8082                	ret

000000008000542a <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    8000542a:	7179                	addi	sp,sp,-48
    8000542c:	f406                	sd	ra,40(sp)
    8000542e:	f022                	sd	s0,32(sp)
    80005430:	1800                	addi	s0,sp,48
    80005432:	fca43c23          	sd	a0,-40(s0)
    80005436:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    8000543a:	ffffd097          	auipc	ra,0xffffd
    8000543e:	3f2080e7          	jalr	1010(ra) # 8000282c <myproc>
    80005442:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80005446:	fe843783          	ld	a5,-24(s0)
    8000544a:	67bc                	ld	a5,72(a5)
    8000544c:	fd843703          	ld	a4,-40(s0)
    80005450:	00f77b63          	bgeu	a4,a5,80005466 <fetchaddr+0x3c>
    80005454:	fd843783          	ld	a5,-40(s0)
    80005458:	00878713          	addi	a4,a5,8
    8000545c:	fe843783          	ld	a5,-24(s0)
    80005460:	67bc                	ld	a5,72(a5)
    80005462:	00e7f463          	bgeu	a5,a4,8000546a <fetchaddr+0x40>
    return -1;
    80005466:	57fd                	li	a5,-1
    80005468:	a01d                	j	8000548e <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    8000546a:	fe843783          	ld	a5,-24(s0)
    8000546e:	6bbc                	ld	a5,80(a5)
    80005470:	46a1                	li	a3,8
    80005472:	fd843603          	ld	a2,-40(s0)
    80005476:	fd043583          	ld	a1,-48(s0)
    8000547a:	853e                	mv	a0,a5
    8000547c:	ffffd097          	auipc	ra,0xffffd
    80005480:	f38080e7          	jalr	-200(ra) # 800023b4 <copyin>
    80005484:	87aa                	mv	a5,a0
    80005486:	c399                	beqz	a5,8000548c <fetchaddr+0x62>
    return -1;
    80005488:	57fd                	li	a5,-1
    8000548a:	a011                	j	8000548e <fetchaddr+0x64>
  return 0;
    8000548c:	4781                	li	a5,0
}
    8000548e:	853e                	mv	a0,a5
    80005490:	70a2                	ld	ra,40(sp)
    80005492:	7402                	ld	s0,32(sp)
    80005494:	6145                	addi	sp,sp,48
    80005496:	8082                	ret

0000000080005498 <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    80005498:	7139                	addi	sp,sp,-64
    8000549a:	fc06                	sd	ra,56(sp)
    8000549c:	f822                	sd	s0,48(sp)
    8000549e:	0080                	addi	s0,sp,64
    800054a0:	fca43c23          	sd	a0,-40(s0)
    800054a4:	fcb43823          	sd	a1,-48(s0)
    800054a8:	87b2                	mv	a5,a2
    800054aa:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    800054ae:	ffffd097          	auipc	ra,0xffffd
    800054b2:	37e080e7          	jalr	894(ra) # 8000282c <myproc>
    800054b6:	fea43423          	sd	a0,-24(s0)
  int err = copyinstr(p->pagetable, buf, addr, max);
    800054ba:	fe843783          	ld	a5,-24(s0)
    800054be:	6bbc                	ld	a5,80(a5)
    800054c0:	fcc42703          	lw	a4,-52(s0)
    800054c4:	86ba                	mv	a3,a4
    800054c6:	fd843603          	ld	a2,-40(s0)
    800054ca:	fd043583          	ld	a1,-48(s0)
    800054ce:	853e                	mv	a0,a5
    800054d0:	ffffd097          	auipc	ra,0xffffd
    800054d4:	fb2080e7          	jalr	-78(ra) # 80002482 <copyinstr>
    800054d8:	87aa                	mv	a5,a0
    800054da:	fef42223          	sw	a5,-28(s0)
  if(err < 0)
    800054de:	fe442783          	lw	a5,-28(s0)
    800054e2:	2781                	sext.w	a5,a5
    800054e4:	0007d563          	bgez	a5,800054ee <fetchstr+0x56>
    return err;
    800054e8:	fe442783          	lw	a5,-28(s0)
    800054ec:	a801                	j	800054fc <fetchstr+0x64>
  return strlen(buf);
    800054ee:	fd043503          	ld	a0,-48(s0)
    800054f2:	ffffc097          	auipc	ra,0xffffc
    800054f6:	2ce080e7          	jalr	718(ra) # 800017c0 <strlen>
    800054fa:	87aa                	mv	a5,a0
}
    800054fc:	853e                	mv	a0,a5
    800054fe:	70e2                	ld	ra,56(sp)
    80005500:	7442                	ld	s0,48(sp)
    80005502:	6121                	addi	sp,sp,64
    80005504:	8082                	ret

0000000080005506 <argraw>:

static uint64
argraw(int n)
{
    80005506:	7179                	addi	sp,sp,-48
    80005508:	f406                	sd	ra,40(sp)
    8000550a:	f022                	sd	s0,32(sp)
    8000550c:	1800                	addi	s0,sp,48
    8000550e:	87aa                	mv	a5,a0
    80005510:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    80005514:	ffffd097          	auipc	ra,0xffffd
    80005518:	318080e7          	jalr	792(ra) # 8000282c <myproc>
    8000551c:	fea43423          	sd	a0,-24(s0)
    80005520:	fdc42783          	lw	a5,-36(s0)
    80005524:	0007871b          	sext.w	a4,a5
    80005528:	4795                	li	a5,5
    8000552a:	06e7e263          	bltu	a5,a4,8000558e <argraw+0x88>
    8000552e:	fdc46783          	lwu	a5,-36(s0)
    80005532:	00279713          	slli	a4,a5,0x2
    80005536:	00007797          	auipc	a5,0x7
    8000553a:	eaa78793          	addi	a5,a5,-342 # 8000c3e0 <etext+0x3e0>
    8000553e:	97ba                	add	a5,a5,a4
    80005540:	439c                	lw	a5,0(a5)
    80005542:	0007871b          	sext.w	a4,a5
    80005546:	00007797          	auipc	a5,0x7
    8000554a:	e9a78793          	addi	a5,a5,-358 # 8000c3e0 <etext+0x3e0>
    8000554e:	97ba                	add	a5,a5,a4
    80005550:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    80005552:	fe843783          	ld	a5,-24(s0)
    80005556:	6fbc                	ld	a5,88(a5)
    80005558:	7bbc                	ld	a5,112(a5)
    8000555a:	a091                	j	8000559e <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    8000555c:	fe843783          	ld	a5,-24(s0)
    80005560:	6fbc                	ld	a5,88(a5)
    80005562:	7fbc                	ld	a5,120(a5)
    80005564:	a82d                	j	8000559e <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    80005566:	fe843783          	ld	a5,-24(s0)
    8000556a:	6fbc                	ld	a5,88(a5)
    8000556c:	63dc                	ld	a5,128(a5)
    8000556e:	a805                	j	8000559e <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    80005570:	fe843783          	ld	a5,-24(s0)
    80005574:	6fbc                	ld	a5,88(a5)
    80005576:	67dc                	ld	a5,136(a5)
    80005578:	a01d                	j	8000559e <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    8000557a:	fe843783          	ld	a5,-24(s0)
    8000557e:	6fbc                	ld	a5,88(a5)
    80005580:	6bdc                	ld	a5,144(a5)
    80005582:	a831                	j	8000559e <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    80005584:	fe843783          	ld	a5,-24(s0)
    80005588:	6fbc                	ld	a5,88(a5)
    8000558a:	6fdc                	ld	a5,152(a5)
    8000558c:	a809                	j	8000559e <argraw+0x98>
  }
  panic("argraw");
    8000558e:	00007517          	auipc	a0,0x7
    80005592:	e4a50513          	addi	a0,a0,-438 # 8000c3d8 <etext+0x3d8>
    80005596:	ffffb097          	auipc	ra,0xffffb
    8000559a:	6e8080e7          	jalr	1768(ra) # 80000c7e <panic>
  return -1;
}
    8000559e:	853e                	mv	a0,a5
    800055a0:	70a2                	ld	ra,40(sp)
    800055a2:	7402                	ld	s0,32(sp)
    800055a4:	6145                	addi	sp,sp,48
    800055a6:	8082                	ret

00000000800055a8 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
    800055a8:	1101                	addi	sp,sp,-32
    800055aa:	ec06                	sd	ra,24(sp)
    800055ac:	e822                	sd	s0,16(sp)
    800055ae:	1000                	addi	s0,sp,32
    800055b0:	87aa                	mv	a5,a0
    800055b2:	feb43023          	sd	a1,-32(s0)
    800055b6:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800055ba:	fec42783          	lw	a5,-20(s0)
    800055be:	853e                	mv	a0,a5
    800055c0:	00000097          	auipc	ra,0x0
    800055c4:	f46080e7          	jalr	-186(ra) # 80005506 <argraw>
    800055c8:	87aa                	mv	a5,a0
    800055ca:	0007871b          	sext.w	a4,a5
    800055ce:	fe043783          	ld	a5,-32(s0)
    800055d2:	c398                	sw	a4,0(a5)
  return 0;
    800055d4:	4781                	li	a5,0
}
    800055d6:	853e                	mv	a0,a5
    800055d8:	60e2                	ld	ra,24(sp)
    800055da:	6442                	ld	s0,16(sp)
    800055dc:	6105                	addi	sp,sp,32
    800055de:	8082                	ret

00000000800055e0 <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
int
argaddr(int n, uint64 *ip)
{
    800055e0:	1101                	addi	sp,sp,-32
    800055e2:	ec06                	sd	ra,24(sp)
    800055e4:	e822                	sd	s0,16(sp)
    800055e6:	1000                	addi	s0,sp,32
    800055e8:	87aa                	mv	a5,a0
    800055ea:	feb43023          	sd	a1,-32(s0)
    800055ee:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800055f2:	fec42783          	lw	a5,-20(s0)
    800055f6:	853e                	mv	a0,a5
    800055f8:	00000097          	auipc	ra,0x0
    800055fc:	f0e080e7          	jalr	-242(ra) # 80005506 <argraw>
    80005600:	872a                	mv	a4,a0
    80005602:	fe043783          	ld	a5,-32(s0)
    80005606:	e398                	sd	a4,0(a5)
  return 0;
    80005608:	4781                	li	a5,0
}
    8000560a:	853e                	mv	a0,a5
    8000560c:	60e2                	ld	ra,24(sp)
    8000560e:	6442                	ld	s0,16(sp)
    80005610:	6105                	addi	sp,sp,32
    80005612:	8082                	ret

0000000080005614 <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    80005614:	7179                	addi	sp,sp,-48
    80005616:	f406                	sd	ra,40(sp)
    80005618:	f022                	sd	s0,32(sp)
    8000561a:	1800                	addi	s0,sp,48
    8000561c:	87aa                	mv	a5,a0
    8000561e:	fcb43823          	sd	a1,-48(s0)
    80005622:	8732                	mv	a4,a2
    80005624:	fcf42e23          	sw	a5,-36(s0)
    80005628:	87ba                	mv	a5,a4
    8000562a:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  if(argaddr(n, &addr) < 0)
    8000562e:	fe840713          	addi	a4,s0,-24
    80005632:	fdc42783          	lw	a5,-36(s0)
    80005636:	85ba                	mv	a1,a4
    80005638:	853e                	mv	a0,a5
    8000563a:	00000097          	auipc	ra,0x0
    8000563e:	fa6080e7          	jalr	-90(ra) # 800055e0 <argaddr>
    80005642:	87aa                	mv	a5,a0
    80005644:	0007d463          	bgez	a5,8000564c <argstr+0x38>
    return -1;
    80005648:	57fd                	li	a5,-1
    8000564a:	a831                	j	80005666 <argstr+0x52>
  return fetchstr(addr, buf, max);
    8000564c:	fe843783          	ld	a5,-24(s0)
    80005650:	fd842703          	lw	a4,-40(s0)
    80005654:	863a                	mv	a2,a4
    80005656:	fd043583          	ld	a1,-48(s0)
    8000565a:	853e                	mv	a0,a5
    8000565c:	00000097          	auipc	ra,0x0
    80005660:	e3c080e7          	jalr	-452(ra) # 80005498 <fetchstr>
    80005664:	87aa                	mv	a5,a0
}
    80005666:	853e                	mv	a0,a5
    80005668:	70a2                	ld	ra,40(sp)
    8000566a:	7402                	ld	s0,32(sp)
    8000566c:	6145                	addi	sp,sp,48
    8000566e:	8082                	ret

0000000080005670 <syscall>:
[SYS_setSchedAlg]   sys_setSchedAlg,
};

void
syscall(void)
{
    80005670:	7179                	addi	sp,sp,-48
    80005672:	f406                	sd	ra,40(sp)
    80005674:	f022                	sd	s0,32(sp)
    80005676:	ec26                	sd	s1,24(sp)
    80005678:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    8000567a:	ffffd097          	auipc	ra,0xffffd
    8000567e:	1b2080e7          	jalr	434(ra) # 8000282c <myproc>
    80005682:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    80005686:	fd843783          	ld	a5,-40(s0)
    8000568a:	6fbc                	ld	a5,88(a5)
    8000568c:	77dc                	ld	a5,168(a5)
    8000568e:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    80005692:	fd442783          	lw	a5,-44(s0)
    80005696:	2781                	sext.w	a5,a5
    80005698:	04f05263          	blez	a5,800056dc <syscall+0x6c>
    8000569c:	fd442783          	lw	a5,-44(s0)
    800056a0:	873e                	mv	a4,a5
    800056a2:	47d9                	li	a5,22
    800056a4:	02e7ec63          	bltu	a5,a4,800056dc <syscall+0x6c>
    800056a8:	00007717          	auipc	a4,0x7
    800056ac:	13870713          	addi	a4,a4,312 # 8000c7e0 <syscalls>
    800056b0:	fd442783          	lw	a5,-44(s0)
    800056b4:	078e                	slli	a5,a5,0x3
    800056b6:	97ba                	add	a5,a5,a4
    800056b8:	639c                	ld	a5,0(a5)
    800056ba:	c38d                	beqz	a5,800056dc <syscall+0x6c>
    p->trapframe->a0 = syscalls[num]();
    800056bc:	00007717          	auipc	a4,0x7
    800056c0:	12470713          	addi	a4,a4,292 # 8000c7e0 <syscalls>
    800056c4:	fd442783          	lw	a5,-44(s0)
    800056c8:	078e                	slli	a5,a5,0x3
    800056ca:	97ba                	add	a5,a5,a4
    800056cc:	6398                	ld	a4,0(a5)
    800056ce:	fd843783          	ld	a5,-40(s0)
    800056d2:	6fa4                	ld	s1,88(a5)
    800056d4:	9702                	jalr	a4
    800056d6:	87aa                	mv	a5,a0
    800056d8:	f8bc                	sd	a5,112(s1)
    800056da:	a815                	j	8000570e <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    800056dc:	fd843783          	ld	a5,-40(s0)
    800056e0:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    800056e2:	fd843783          	ld	a5,-40(s0)
    800056e6:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    800056ea:	fd442683          	lw	a3,-44(s0)
    800056ee:	863e                	mv	a2,a5
    800056f0:	85ba                	mv	a1,a4
    800056f2:	00007517          	auipc	a0,0x7
    800056f6:	d0650513          	addi	a0,a0,-762 # 8000c3f8 <etext+0x3f8>
    800056fa:	ffffb097          	auipc	ra,0xffffb
    800056fe:	32e080e7          	jalr	814(ra) # 80000a28 <printf>
    p->trapframe->a0 = -1;
    80005702:	fd843783          	ld	a5,-40(s0)
    80005706:	6fbc                	ld	a5,88(a5)
    80005708:	577d                	li	a4,-1
    8000570a:	fbb8                	sd	a4,112(a5)
  }
}
    8000570c:	0001                	nop
    8000570e:	0001                	nop
    80005710:	70a2                	ld	ra,40(sp)
    80005712:	7402                	ld	s0,32(sp)
    80005714:	64e2                	ld	s1,24(sp)
    80005716:	6145                	addi	sp,sp,48
    80005718:	8082                	ret

000000008000571a <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    8000571a:	1101                	addi	sp,sp,-32
    8000571c:	ec06                	sd	ra,24(sp)
    8000571e:	e822                	sd	s0,16(sp)
    80005720:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    80005722:	fec40793          	addi	a5,s0,-20
    80005726:	85be                	mv	a1,a5
    80005728:	4501                	li	a0,0
    8000572a:	00000097          	auipc	ra,0x0
    8000572e:	e7e080e7          	jalr	-386(ra) # 800055a8 <argint>
    80005732:	87aa                	mv	a5,a0
    80005734:	0007d463          	bgez	a5,8000573c <sys_exit+0x22>
    return -1;
    80005738:	57fd                	li	a5,-1
    8000573a:	a809                	j	8000574c <sys_exit+0x32>
  exit(n);
    8000573c:	fec42783          	lw	a5,-20(s0)
    80005740:	853e                	mv	a0,a5
    80005742:	ffffe097          	auipc	ra,0xffffe
    80005746:	90e080e7          	jalr	-1778(ra) # 80003050 <exit>
  return 0;  // not reached
    8000574a:	4781                	li	a5,0
}
    8000574c:	853e                	mv	a0,a5
    8000574e:	60e2                	ld	ra,24(sp)
    80005750:	6442                	ld	s0,16(sp)
    80005752:	6105                	addi	sp,sp,32
    80005754:	8082                	ret

0000000080005756 <sys_getpid>:

uint64
sys_getpid(void)
{
    80005756:	1141                	addi	sp,sp,-16
    80005758:	e406                	sd	ra,8(sp)
    8000575a:	e022                	sd	s0,0(sp)
    8000575c:	0800                	addi	s0,sp,16
  return myproc()->pid;
    8000575e:	ffffd097          	auipc	ra,0xffffd
    80005762:	0ce080e7          	jalr	206(ra) # 8000282c <myproc>
    80005766:	87aa                	mv	a5,a0
    80005768:	5b9c                	lw	a5,48(a5)
}
    8000576a:	853e                	mv	a0,a5
    8000576c:	60a2                	ld	ra,8(sp)
    8000576e:	6402                	ld	s0,0(sp)
    80005770:	0141                	addi	sp,sp,16
    80005772:	8082                	ret

0000000080005774 <sys_fork>:

uint64
sys_fork(void)
{
    80005774:	1141                	addi	sp,sp,-16
    80005776:	e406                	sd	ra,8(sp)
    80005778:	e022                	sd	s0,0(sp)
    8000577a:	0800                	addi	s0,sp,16
  return fork();
    8000577c:	ffffd097          	auipc	ra,0xffffd
    80005780:	678080e7          	jalr	1656(ra) # 80002df4 <fork>
    80005784:	87aa                	mv	a5,a0
}
    80005786:	853e                	mv	a0,a5
    80005788:	60a2                	ld	ra,8(sp)
    8000578a:	6402                	ld	s0,0(sp)
    8000578c:	0141                	addi	sp,sp,16
    8000578e:	8082                	ret

0000000080005790 <sys_wait>:

uint64
sys_wait(void)
{
    80005790:	1101                	addi	sp,sp,-32
    80005792:	ec06                	sd	ra,24(sp)
    80005794:	e822                	sd	s0,16(sp)
    80005796:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    80005798:	fe840793          	addi	a5,s0,-24
    8000579c:	85be                	mv	a1,a5
    8000579e:	4501                	li	a0,0
    800057a0:	00000097          	auipc	ra,0x0
    800057a4:	e40080e7          	jalr	-448(ra) # 800055e0 <argaddr>
    800057a8:	87aa                	mv	a5,a0
    800057aa:	0007d463          	bgez	a5,800057b2 <sys_wait+0x22>
    return -1;
    800057ae:	57fd                	li	a5,-1
    800057b0:	a809                	j	800057c2 <sys_wait+0x32>
  return wait(p);
    800057b2:	fe843783          	ld	a5,-24(s0)
    800057b6:	853e                	mv	a0,a5
    800057b8:	ffffe097          	auipc	ra,0xffffe
    800057bc:	a12080e7          	jalr	-1518(ra) # 800031ca <wait>
    800057c0:	87aa                	mv	a5,a0
}
    800057c2:	853e                	mv	a0,a5
    800057c4:	60e2                	ld	ra,24(sp)
    800057c6:	6442                	ld	s0,16(sp)
    800057c8:	6105                	addi	sp,sp,32
    800057ca:	8082                	ret

00000000800057cc <sys_sbrk>:

uint64
sys_sbrk(void)
{
    800057cc:	1101                	addi	sp,sp,-32
    800057ce:	ec06                	sd	ra,24(sp)
    800057d0:	e822                	sd	s0,16(sp)
    800057d2:	1000                	addi	s0,sp,32
  int addr;
  int n;

  if(argint(0, &n) < 0)
    800057d4:	fe840793          	addi	a5,s0,-24
    800057d8:	85be                	mv	a1,a5
    800057da:	4501                	li	a0,0
    800057dc:	00000097          	auipc	ra,0x0
    800057e0:	dcc080e7          	jalr	-564(ra) # 800055a8 <argint>
    800057e4:	87aa                	mv	a5,a0
    800057e6:	0007d463          	bgez	a5,800057ee <sys_sbrk+0x22>
    return -1;
    800057ea:	57fd                	li	a5,-1
    800057ec:	a03d                	j	8000581a <sys_sbrk+0x4e>
  addr = myproc()->sz;
    800057ee:	ffffd097          	auipc	ra,0xffffd
    800057f2:	03e080e7          	jalr	62(ra) # 8000282c <myproc>
    800057f6:	87aa                	mv	a5,a0
    800057f8:	67bc                	ld	a5,72(a5)
    800057fa:	fef42623          	sw	a5,-20(s0)
  if(growproc(n) < 0)
    800057fe:	fe842783          	lw	a5,-24(s0)
    80005802:	853e                	mv	a0,a5
    80005804:	ffffd097          	auipc	ra,0xffffd
    80005808:	53e080e7          	jalr	1342(ra) # 80002d42 <growproc>
    8000580c:	87aa                	mv	a5,a0
    8000580e:	0007d463          	bgez	a5,80005816 <sys_sbrk+0x4a>
    return -1;
    80005812:	57fd                	li	a5,-1
    80005814:	a019                	j	8000581a <sys_sbrk+0x4e>
  return addr;
    80005816:	fec42783          	lw	a5,-20(s0)
}
    8000581a:	853e                	mv	a0,a5
    8000581c:	60e2                	ld	ra,24(sp)
    8000581e:	6442                	ld	s0,16(sp)
    80005820:	6105                	addi	sp,sp,32
    80005822:	8082                	ret

0000000080005824 <sys_sleep>:

uint64
sys_sleep(void)
{
    80005824:	1101                	addi	sp,sp,-32
    80005826:	ec06                	sd	ra,24(sp)
    80005828:	e822                	sd	s0,16(sp)
    8000582a:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    8000582c:	fe840793          	addi	a5,s0,-24
    80005830:	85be                	mv	a1,a5
    80005832:	4501                	li	a0,0
    80005834:	00000097          	auipc	ra,0x0
    80005838:	d74080e7          	jalr	-652(ra) # 800055a8 <argint>
    8000583c:	87aa                	mv	a5,a0
    8000583e:	0007d463          	bgez	a5,80005846 <sys_sleep+0x22>
    return -1;
    80005842:	57fd                	li	a5,-1
    80005844:	a079                	j	800058d2 <sys_sleep+0xae>
  acquire(&tickslock);
    80005846:	00016517          	auipc	a0,0x16
    8000584a:	4ba50513          	addi	a0,a0,1210 # 8001bd00 <tickslock>
    8000584e:	ffffc097          	auipc	ra,0xffffc
    80005852:	a20080e7          	jalr	-1504(ra) # 8000126e <acquire>
  ticks0 = ticks;
    80005856:	00007797          	auipc	a5,0x7
    8000585a:	7ea78793          	addi	a5,a5,2026 # 8000d040 <ticks>
    8000585e:	439c                	lw	a5,0(a5)
    80005860:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    80005864:	a835                	j	800058a0 <sys_sleep+0x7c>
    if(myproc()->killed){
    80005866:	ffffd097          	auipc	ra,0xffffd
    8000586a:	fc6080e7          	jalr	-58(ra) # 8000282c <myproc>
    8000586e:	87aa                	mv	a5,a0
    80005870:	579c                	lw	a5,40(a5)
    80005872:	cb99                	beqz	a5,80005888 <sys_sleep+0x64>
      release(&tickslock);
    80005874:	00016517          	auipc	a0,0x16
    80005878:	48c50513          	addi	a0,a0,1164 # 8001bd00 <tickslock>
    8000587c:	ffffc097          	auipc	ra,0xffffc
    80005880:	a56080e7          	jalr	-1450(ra) # 800012d2 <release>
      return -1;
    80005884:	57fd                	li	a5,-1
    80005886:	a0b1                	j	800058d2 <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    80005888:	00016597          	auipc	a1,0x16
    8000588c:	47858593          	addi	a1,a1,1144 # 8001bd00 <tickslock>
    80005890:	00007517          	auipc	a0,0x7
    80005894:	7b050513          	addi	a0,a0,1968 # 8000d040 <ticks>
    80005898:	fffff097          	auipc	ra,0xfffff
    8000589c:	fde080e7          	jalr	-34(ra) # 80004876 <sleep>
  while(ticks - ticks0 < n){
    800058a0:	00007797          	auipc	a5,0x7
    800058a4:	7a078793          	addi	a5,a5,1952 # 8000d040 <ticks>
    800058a8:	4398                	lw	a4,0(a5)
    800058aa:	fec42783          	lw	a5,-20(s0)
    800058ae:	40f707bb          	subw	a5,a4,a5
    800058b2:	0007871b          	sext.w	a4,a5
    800058b6:	fe842783          	lw	a5,-24(s0)
    800058ba:	2781                	sext.w	a5,a5
    800058bc:	faf765e3          	bltu	a4,a5,80005866 <sys_sleep+0x42>
  }
  release(&tickslock);
    800058c0:	00016517          	auipc	a0,0x16
    800058c4:	44050513          	addi	a0,a0,1088 # 8001bd00 <tickslock>
    800058c8:	ffffc097          	auipc	ra,0xffffc
    800058cc:	a0a080e7          	jalr	-1526(ra) # 800012d2 <release>
  return 0;
    800058d0:	4781                	li	a5,0
}
    800058d2:	853e                	mv	a0,a5
    800058d4:	60e2                	ld	ra,24(sp)
    800058d6:	6442                	ld	s0,16(sp)
    800058d8:	6105                	addi	sp,sp,32
    800058da:	8082                	ret

00000000800058dc <sys_kill>:

uint64
sys_kill(void)
{
    800058dc:	1101                	addi	sp,sp,-32
    800058de:	ec06                	sd	ra,24(sp)
    800058e0:	e822                	sd	s0,16(sp)
    800058e2:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    800058e4:	fec40793          	addi	a5,s0,-20
    800058e8:	85be                	mv	a1,a5
    800058ea:	4501                	li	a0,0
    800058ec:	00000097          	auipc	ra,0x0
    800058f0:	cbc080e7          	jalr	-836(ra) # 800055a8 <argint>
    800058f4:	87aa                	mv	a5,a0
    800058f6:	0007d463          	bgez	a5,800058fe <sys_kill+0x22>
    return -1;
    800058fa:	57fd                	li	a5,-1
    800058fc:	a809                	j	8000590e <sys_kill+0x32>
  return kill(pid);
    800058fe:	fec42783          	lw	a5,-20(s0)
    80005902:	853e                	mv	a0,a5
    80005904:	fffff097          	auipc	ra,0xfffff
    80005908:	11e080e7          	jalr	286(ra) # 80004a22 <kill>
    8000590c:	87aa                	mv	a5,a0
}
    8000590e:	853e                	mv	a0,a5
    80005910:	60e2                	ld	ra,24(sp)
    80005912:	6442                	ld	s0,16(sp)
    80005914:	6105                	addi	sp,sp,32
    80005916:	8082                	ret

0000000080005918 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80005918:	1101                	addi	sp,sp,-32
    8000591a:	ec06                	sd	ra,24(sp)
    8000591c:	e822                	sd	s0,16(sp)
    8000591e:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80005920:	00016517          	auipc	a0,0x16
    80005924:	3e050513          	addi	a0,a0,992 # 8001bd00 <tickslock>
    80005928:	ffffc097          	auipc	ra,0xffffc
    8000592c:	946080e7          	jalr	-1722(ra) # 8000126e <acquire>
  xticks = ticks;
    80005930:	00007797          	auipc	a5,0x7
    80005934:	71078793          	addi	a5,a5,1808 # 8000d040 <ticks>
    80005938:	439c                	lw	a5,0(a5)
    8000593a:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    8000593e:	00016517          	auipc	a0,0x16
    80005942:	3c250513          	addi	a0,a0,962 # 8001bd00 <tickslock>
    80005946:	ffffc097          	auipc	ra,0xffffc
    8000594a:	98c080e7          	jalr	-1652(ra) # 800012d2 <release>
  return xticks;
    8000594e:	fec46783          	lwu	a5,-20(s0)
}
    80005952:	853e                	mv	a0,a5
    80005954:	60e2                	ld	ra,24(sp)
    80005956:	6442                	ld	s0,16(sp)
    80005958:	6105                	addi	sp,sp,32
    8000595a:	8082                	ret

000000008000595c <sys_setSchedAlg>:

// algid: 1-SJF, 2-CFS
// arg1: SJF_COEFFICIENT
// arg2: SJF_PREEMPTIVE
uint64 sys_setSchedAlg(void)
{
    8000595c:	1101                	addi	sp,sp,-32
    8000595e:	ec06                	sd	ra,24(sp)
    80005960:	e822                	sd	s0,16(sp)
    80005962:	1000                	addi	s0,sp,32
    int algid = 0, arg1 = -1, arg2 = -1;
    80005964:	fe042623          	sw	zero,-20(s0)
    80005968:	57fd                	li	a5,-1
    8000596a:	fef42423          	sw	a5,-24(s0)
    8000596e:	57fd                	li	a5,-1
    80005970:	fef42223          	sw	a5,-28(s0)
    if (argint(0, &algid) < 0)
    80005974:	fec40793          	addi	a5,s0,-20
    80005978:	85be                	mv	a1,a5
    8000597a:	4501                	li	a0,0
    8000597c:	00000097          	auipc	ra,0x0
    80005980:	c2c080e7          	jalr	-980(ra) # 800055a8 <argint>
    80005984:	87aa                	mv	a5,a0
    80005986:	0007d463          	bgez	a5,8000598e <sys_setSchedAlg+0x32>
        return -1;
    8000598a:	57fd                	li	a5,-1
    8000598c:	a8b9                	j	800059ea <sys_setSchedAlg+0x8e>
    if (algid == 1)
    8000598e:	fec42783          	lw	a5,-20(s0)
    80005992:	873e                	mv	a4,a5
    80005994:	4785                	li	a5,1
    80005996:	02f71c63          	bne	a4,a5,800059ce <sys_setSchedAlg+0x72>
    {
        if (argint(1, &arg1) < 0)
    8000599a:	fe840793          	addi	a5,s0,-24
    8000599e:	85be                	mv	a1,a5
    800059a0:	4505                	li	a0,1
    800059a2:	00000097          	auipc	ra,0x0
    800059a6:	c06080e7          	jalr	-1018(ra) # 800055a8 <argint>
    800059aa:	87aa                	mv	a5,a0
    800059ac:	0007d463          	bgez	a5,800059b4 <sys_setSchedAlg+0x58>
            return -1;
    800059b0:	57fd                	li	a5,-1
    800059b2:	a825                	j	800059ea <sys_setSchedAlg+0x8e>
        if (argint(2, &arg2) < 0)
    800059b4:	fe440793          	addi	a5,s0,-28
    800059b8:	85be                	mv	a1,a5
    800059ba:	4509                	li	a0,2
    800059bc:	00000097          	auipc	ra,0x0
    800059c0:	bec080e7          	jalr	-1044(ra) # 800055a8 <argint>
    800059c4:	87aa                	mv	a5,a0
    800059c6:	0007d463          	bgez	a5,800059ce <sys_setSchedAlg+0x72>
            return -1;
    800059ca:	57fd                	li	a5,-1
    800059cc:	a839                	j	800059ea <sys_setSchedAlg+0x8e>
    }
    return setSchedAlg(algid, arg1, arg2);
    800059ce:	fec42783          	lw	a5,-20(s0)
    800059d2:	fe842703          	lw	a4,-24(s0)
    800059d6:	fe442683          	lw	a3,-28(s0)
    800059da:	8636                	mv	a2,a3
    800059dc:	85ba                	mv	a1,a4
    800059de:	853e                	mv	a0,a5
    800059e0:	ffffe097          	auipc	ra,0xffffe
    800059e4:	5ac080e7          	jalr	1452(ra) # 80003f8c <setSchedAlg>
    800059e8:	87aa                	mv	a5,a0
}
    800059ea:	853e                	mv	a0,a5
    800059ec:	60e2                	ld	ra,24(sp)
    800059ee:	6442                	ld	s0,16(sp)
    800059f0:	6105                	addi	sp,sp,32
    800059f2:	8082                	ret

00000000800059f4 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    800059f4:	1101                	addi	sp,sp,-32
    800059f6:	ec06                	sd	ra,24(sp)
    800059f8:	e822                	sd	s0,16(sp)
    800059fa:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    800059fc:	00007597          	auipc	a1,0x7
    80005a00:	a1c58593          	addi	a1,a1,-1508 # 8000c418 <etext+0x418>
    80005a04:	00016517          	auipc	a0,0x16
    80005a08:	31450513          	addi	a0,a0,788 # 8001bd18 <bcache>
    80005a0c:	ffffc097          	auipc	ra,0xffffc
    80005a10:	832080e7          	jalr	-1998(ra) # 8000123e <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80005a14:	00016717          	auipc	a4,0x16
    80005a18:	30470713          	addi	a4,a4,772 # 8001bd18 <bcache>
    80005a1c:	67a1                	lui	a5,0x8
    80005a1e:	97ba                	add	a5,a5,a4
    80005a20:	0001e717          	auipc	a4,0x1e
    80005a24:	56070713          	addi	a4,a4,1376 # 80023f80 <bcache+0x8268>
    80005a28:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    80005a2c:	00016717          	auipc	a4,0x16
    80005a30:	2ec70713          	addi	a4,a4,748 # 8001bd18 <bcache>
    80005a34:	67a1                	lui	a5,0x8
    80005a36:	97ba                	add	a5,a5,a4
    80005a38:	0001e717          	auipc	a4,0x1e
    80005a3c:	54870713          	addi	a4,a4,1352 # 80023f80 <bcache+0x8268>
    80005a40:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80005a44:	00016797          	auipc	a5,0x16
    80005a48:	2ec78793          	addi	a5,a5,748 # 8001bd30 <bcache+0x18>
    80005a4c:	fef43423          	sd	a5,-24(s0)
    80005a50:	a895                	j	80005ac4 <binit+0xd0>
    b->next = bcache.head.next;
    80005a52:	00016717          	auipc	a4,0x16
    80005a56:	2c670713          	addi	a4,a4,710 # 8001bd18 <bcache>
    80005a5a:	67a1                	lui	a5,0x8
    80005a5c:	97ba                	add	a5,a5,a4
    80005a5e:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80005a62:	fe843783          	ld	a5,-24(s0)
    80005a66:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80005a68:	fe843783          	ld	a5,-24(s0)
    80005a6c:	0001e717          	auipc	a4,0x1e
    80005a70:	51470713          	addi	a4,a4,1300 # 80023f80 <bcache+0x8268>
    80005a74:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    80005a76:	fe843783          	ld	a5,-24(s0)
    80005a7a:	07c1                	addi	a5,a5,16
    80005a7c:	00007597          	auipc	a1,0x7
    80005a80:	9a458593          	addi	a1,a1,-1628 # 8000c420 <etext+0x420>
    80005a84:	853e                	mv	a0,a5
    80005a86:	00002097          	auipc	ra,0x2
    80005a8a:	ff8080e7          	jalr	-8(ra) # 80007a7e <initsleeplock>
    bcache.head.next->prev = b;
    80005a8e:	00016717          	auipc	a4,0x16
    80005a92:	28a70713          	addi	a4,a4,650 # 8001bd18 <bcache>
    80005a96:	67a1                	lui	a5,0x8
    80005a98:	97ba                	add	a5,a5,a4
    80005a9a:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80005a9e:	fe843703          	ld	a4,-24(s0)
    80005aa2:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80005aa4:	00016717          	auipc	a4,0x16
    80005aa8:	27470713          	addi	a4,a4,628 # 8001bd18 <bcache>
    80005aac:	67a1                	lui	a5,0x8
    80005aae:	97ba                	add	a5,a5,a4
    80005ab0:	fe843703          	ld	a4,-24(s0)
    80005ab4:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80005ab8:	fe843783          	ld	a5,-24(s0)
    80005abc:	45878793          	addi	a5,a5,1112
    80005ac0:	fef43423          	sd	a5,-24(s0)
    80005ac4:	0001e797          	auipc	a5,0x1e
    80005ac8:	4bc78793          	addi	a5,a5,1212 # 80023f80 <bcache+0x8268>
    80005acc:	fe843703          	ld	a4,-24(s0)
    80005ad0:	f8f761e3          	bltu	a4,a5,80005a52 <binit+0x5e>
  }
}
    80005ad4:	0001                	nop
    80005ad6:	0001                	nop
    80005ad8:	60e2                	ld	ra,24(sp)
    80005ada:	6442                	ld	s0,16(sp)
    80005adc:	6105                	addi	sp,sp,32
    80005ade:	8082                	ret

0000000080005ae0 <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    80005ae0:	7179                	addi	sp,sp,-48
    80005ae2:	f406                	sd	ra,40(sp)
    80005ae4:	f022                	sd	s0,32(sp)
    80005ae6:	1800                	addi	s0,sp,48
    80005ae8:	87aa                	mv	a5,a0
    80005aea:	872e                	mv	a4,a1
    80005aec:	fcf42e23          	sw	a5,-36(s0)
    80005af0:	87ba                	mv	a5,a4
    80005af2:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    80005af6:	00016517          	auipc	a0,0x16
    80005afa:	22250513          	addi	a0,a0,546 # 8001bd18 <bcache>
    80005afe:	ffffb097          	auipc	ra,0xffffb
    80005b02:	770080e7          	jalr	1904(ra) # 8000126e <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80005b06:	00016717          	auipc	a4,0x16
    80005b0a:	21270713          	addi	a4,a4,530 # 8001bd18 <bcache>
    80005b0e:	67a1                	lui	a5,0x8
    80005b10:	97ba                	add	a5,a5,a4
    80005b12:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80005b16:	fef43423          	sd	a5,-24(s0)
    80005b1a:	a095                	j	80005b7e <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    80005b1c:	fe843783          	ld	a5,-24(s0)
    80005b20:	4798                	lw	a4,8(a5)
    80005b22:	fdc42783          	lw	a5,-36(s0)
    80005b26:	2781                	sext.w	a5,a5
    80005b28:	04e79663          	bne	a5,a4,80005b74 <bget+0x94>
    80005b2c:	fe843783          	ld	a5,-24(s0)
    80005b30:	47d8                	lw	a4,12(a5)
    80005b32:	fd842783          	lw	a5,-40(s0)
    80005b36:	2781                	sext.w	a5,a5
    80005b38:	02e79e63          	bne	a5,a4,80005b74 <bget+0x94>
      b->refcnt++;
    80005b3c:	fe843783          	ld	a5,-24(s0)
    80005b40:	43bc                	lw	a5,64(a5)
    80005b42:	2785                	addiw	a5,a5,1
    80005b44:	0007871b          	sext.w	a4,a5
    80005b48:	fe843783          	ld	a5,-24(s0)
    80005b4c:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80005b4e:	00016517          	auipc	a0,0x16
    80005b52:	1ca50513          	addi	a0,a0,458 # 8001bd18 <bcache>
    80005b56:	ffffb097          	auipc	ra,0xffffb
    80005b5a:	77c080e7          	jalr	1916(ra) # 800012d2 <release>
      acquiresleep(&b->lock);
    80005b5e:	fe843783          	ld	a5,-24(s0)
    80005b62:	07c1                	addi	a5,a5,16
    80005b64:	853e                	mv	a0,a5
    80005b66:	00002097          	auipc	ra,0x2
    80005b6a:	f64080e7          	jalr	-156(ra) # 80007aca <acquiresleep>
      return b;
    80005b6e:	fe843783          	ld	a5,-24(s0)
    80005b72:	a07d                	j	80005c20 <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80005b74:	fe843783          	ld	a5,-24(s0)
    80005b78:	6bbc                	ld	a5,80(a5)
    80005b7a:	fef43423          	sd	a5,-24(s0)
    80005b7e:	fe843703          	ld	a4,-24(s0)
    80005b82:	0001e797          	auipc	a5,0x1e
    80005b86:	3fe78793          	addi	a5,a5,1022 # 80023f80 <bcache+0x8268>
    80005b8a:	f8f719e3          	bne	a4,a5,80005b1c <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80005b8e:	00016717          	auipc	a4,0x16
    80005b92:	18a70713          	addi	a4,a4,394 # 8001bd18 <bcache>
    80005b96:	67a1                	lui	a5,0x8
    80005b98:	97ba                	add	a5,a5,a4
    80005b9a:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    80005b9e:	fef43423          	sd	a5,-24(s0)
    80005ba2:	a8b9                	j	80005c00 <bget+0x120>
    if(b->refcnt == 0) {
    80005ba4:	fe843783          	ld	a5,-24(s0)
    80005ba8:	43bc                	lw	a5,64(a5)
    80005baa:	e7b1                	bnez	a5,80005bf6 <bget+0x116>
      b->dev = dev;
    80005bac:	fe843783          	ld	a5,-24(s0)
    80005bb0:	fdc42703          	lw	a4,-36(s0)
    80005bb4:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    80005bb6:	fe843783          	ld	a5,-24(s0)
    80005bba:	fd842703          	lw	a4,-40(s0)
    80005bbe:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    80005bc0:	fe843783          	ld	a5,-24(s0)
    80005bc4:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    80005bc8:	fe843783          	ld	a5,-24(s0)
    80005bcc:	4705                	li	a4,1
    80005bce:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80005bd0:	00016517          	auipc	a0,0x16
    80005bd4:	14850513          	addi	a0,a0,328 # 8001bd18 <bcache>
    80005bd8:	ffffb097          	auipc	ra,0xffffb
    80005bdc:	6fa080e7          	jalr	1786(ra) # 800012d2 <release>
      acquiresleep(&b->lock);
    80005be0:	fe843783          	ld	a5,-24(s0)
    80005be4:	07c1                	addi	a5,a5,16
    80005be6:	853e                	mv	a0,a5
    80005be8:	00002097          	auipc	ra,0x2
    80005bec:	ee2080e7          	jalr	-286(ra) # 80007aca <acquiresleep>
      return b;
    80005bf0:	fe843783          	ld	a5,-24(s0)
    80005bf4:	a035                	j	80005c20 <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80005bf6:	fe843783          	ld	a5,-24(s0)
    80005bfa:	67bc                	ld	a5,72(a5)
    80005bfc:	fef43423          	sd	a5,-24(s0)
    80005c00:	fe843703          	ld	a4,-24(s0)
    80005c04:	0001e797          	auipc	a5,0x1e
    80005c08:	37c78793          	addi	a5,a5,892 # 80023f80 <bcache+0x8268>
    80005c0c:	f8f71ce3          	bne	a4,a5,80005ba4 <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    80005c10:	00007517          	auipc	a0,0x7
    80005c14:	81850513          	addi	a0,a0,-2024 # 8000c428 <etext+0x428>
    80005c18:	ffffb097          	auipc	ra,0xffffb
    80005c1c:	066080e7          	jalr	102(ra) # 80000c7e <panic>
}
    80005c20:	853e                	mv	a0,a5
    80005c22:	70a2                	ld	ra,40(sp)
    80005c24:	7402                	ld	s0,32(sp)
    80005c26:	6145                	addi	sp,sp,48
    80005c28:	8082                	ret

0000000080005c2a <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    80005c2a:	7179                	addi	sp,sp,-48
    80005c2c:	f406                	sd	ra,40(sp)
    80005c2e:	f022                	sd	s0,32(sp)
    80005c30:	1800                	addi	s0,sp,48
    80005c32:	87aa                	mv	a5,a0
    80005c34:	872e                	mv	a4,a1
    80005c36:	fcf42e23          	sw	a5,-36(s0)
    80005c3a:	87ba                	mv	a5,a4
    80005c3c:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    80005c40:	fd842703          	lw	a4,-40(s0)
    80005c44:	fdc42783          	lw	a5,-36(s0)
    80005c48:	85ba                	mv	a1,a4
    80005c4a:	853e                	mv	a0,a5
    80005c4c:	00000097          	auipc	ra,0x0
    80005c50:	e94080e7          	jalr	-364(ra) # 80005ae0 <bget>
    80005c54:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    80005c58:	fe843783          	ld	a5,-24(s0)
    80005c5c:	439c                	lw	a5,0(a5)
    80005c5e:	ef81                	bnez	a5,80005c76 <bread+0x4c>
    virtio_disk_rw(b, 0);
    80005c60:	4581                	li	a1,0
    80005c62:	fe843503          	ld	a0,-24(s0)
    80005c66:	00004097          	auipc	ra,0x4
    80005c6a:	754080e7          	jalr	1876(ra) # 8000a3ba <virtio_disk_rw>
    b->valid = 1;
    80005c6e:	fe843783          	ld	a5,-24(s0)
    80005c72:	4705                	li	a4,1
    80005c74:	c398                	sw	a4,0(a5)
  }
  return b;
    80005c76:	fe843783          	ld	a5,-24(s0)
}
    80005c7a:	853e                	mv	a0,a5
    80005c7c:	70a2                	ld	ra,40(sp)
    80005c7e:	7402                	ld	s0,32(sp)
    80005c80:	6145                	addi	sp,sp,48
    80005c82:	8082                	ret

0000000080005c84 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    80005c84:	1101                	addi	sp,sp,-32
    80005c86:	ec06                	sd	ra,24(sp)
    80005c88:	e822                	sd	s0,16(sp)
    80005c8a:	1000                	addi	s0,sp,32
    80005c8c:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80005c90:	fe843783          	ld	a5,-24(s0)
    80005c94:	07c1                	addi	a5,a5,16
    80005c96:	853e                	mv	a0,a5
    80005c98:	00002097          	auipc	ra,0x2
    80005c9c:	ef2080e7          	jalr	-270(ra) # 80007b8a <holdingsleep>
    80005ca0:	87aa                	mv	a5,a0
    80005ca2:	eb89                	bnez	a5,80005cb4 <bwrite+0x30>
    panic("bwrite");
    80005ca4:	00006517          	auipc	a0,0x6
    80005ca8:	79c50513          	addi	a0,a0,1948 # 8000c440 <etext+0x440>
    80005cac:	ffffb097          	auipc	ra,0xffffb
    80005cb0:	fd2080e7          	jalr	-46(ra) # 80000c7e <panic>
  virtio_disk_rw(b, 1);
    80005cb4:	4585                	li	a1,1
    80005cb6:	fe843503          	ld	a0,-24(s0)
    80005cba:	00004097          	auipc	ra,0x4
    80005cbe:	700080e7          	jalr	1792(ra) # 8000a3ba <virtio_disk_rw>
}
    80005cc2:	0001                	nop
    80005cc4:	60e2                	ld	ra,24(sp)
    80005cc6:	6442                	ld	s0,16(sp)
    80005cc8:	6105                	addi	sp,sp,32
    80005cca:	8082                	ret

0000000080005ccc <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80005ccc:	1101                	addi	sp,sp,-32
    80005cce:	ec06                	sd	ra,24(sp)
    80005cd0:	e822                	sd	s0,16(sp)
    80005cd2:	1000                	addi	s0,sp,32
    80005cd4:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80005cd8:	fe843783          	ld	a5,-24(s0)
    80005cdc:	07c1                	addi	a5,a5,16
    80005cde:	853e                	mv	a0,a5
    80005ce0:	00002097          	auipc	ra,0x2
    80005ce4:	eaa080e7          	jalr	-342(ra) # 80007b8a <holdingsleep>
    80005ce8:	87aa                	mv	a5,a0
    80005cea:	eb89                	bnez	a5,80005cfc <brelse+0x30>
    panic("brelse");
    80005cec:	00006517          	auipc	a0,0x6
    80005cf0:	75c50513          	addi	a0,a0,1884 # 8000c448 <etext+0x448>
    80005cf4:	ffffb097          	auipc	ra,0xffffb
    80005cf8:	f8a080e7          	jalr	-118(ra) # 80000c7e <panic>

  releasesleep(&b->lock);
    80005cfc:	fe843783          	ld	a5,-24(s0)
    80005d00:	07c1                	addi	a5,a5,16
    80005d02:	853e                	mv	a0,a5
    80005d04:	00002097          	auipc	ra,0x2
    80005d08:	e34080e7          	jalr	-460(ra) # 80007b38 <releasesleep>

  acquire(&bcache.lock);
    80005d0c:	00016517          	auipc	a0,0x16
    80005d10:	00c50513          	addi	a0,a0,12 # 8001bd18 <bcache>
    80005d14:	ffffb097          	auipc	ra,0xffffb
    80005d18:	55a080e7          	jalr	1370(ra) # 8000126e <acquire>
  b->refcnt--;
    80005d1c:	fe843783          	ld	a5,-24(s0)
    80005d20:	43bc                	lw	a5,64(a5)
    80005d22:	37fd                	addiw	a5,a5,-1
    80005d24:	0007871b          	sext.w	a4,a5
    80005d28:	fe843783          	ld	a5,-24(s0)
    80005d2c:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    80005d2e:	fe843783          	ld	a5,-24(s0)
    80005d32:	43bc                	lw	a5,64(a5)
    80005d34:	e7b5                	bnez	a5,80005da0 <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80005d36:	fe843783          	ld	a5,-24(s0)
    80005d3a:	6bbc                	ld	a5,80(a5)
    80005d3c:	fe843703          	ld	a4,-24(s0)
    80005d40:	6738                	ld	a4,72(a4)
    80005d42:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80005d44:	fe843783          	ld	a5,-24(s0)
    80005d48:	67bc                	ld	a5,72(a5)
    80005d4a:	fe843703          	ld	a4,-24(s0)
    80005d4e:	6b38                	ld	a4,80(a4)
    80005d50:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80005d52:	00016717          	auipc	a4,0x16
    80005d56:	fc670713          	addi	a4,a4,-58 # 8001bd18 <bcache>
    80005d5a:	67a1                	lui	a5,0x8
    80005d5c:	97ba                	add	a5,a5,a4
    80005d5e:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80005d62:	fe843783          	ld	a5,-24(s0)
    80005d66:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80005d68:	fe843783          	ld	a5,-24(s0)
    80005d6c:	0001e717          	auipc	a4,0x1e
    80005d70:	21470713          	addi	a4,a4,532 # 80023f80 <bcache+0x8268>
    80005d74:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80005d76:	00016717          	auipc	a4,0x16
    80005d7a:	fa270713          	addi	a4,a4,-94 # 8001bd18 <bcache>
    80005d7e:	67a1                	lui	a5,0x8
    80005d80:	97ba                	add	a5,a5,a4
    80005d82:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80005d86:	fe843703          	ld	a4,-24(s0)
    80005d8a:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80005d8c:	00016717          	auipc	a4,0x16
    80005d90:	f8c70713          	addi	a4,a4,-116 # 8001bd18 <bcache>
    80005d94:	67a1                	lui	a5,0x8
    80005d96:	97ba                	add	a5,a5,a4
    80005d98:	fe843703          	ld	a4,-24(s0)
    80005d9c:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80005da0:	00016517          	auipc	a0,0x16
    80005da4:	f7850513          	addi	a0,a0,-136 # 8001bd18 <bcache>
    80005da8:	ffffb097          	auipc	ra,0xffffb
    80005dac:	52a080e7          	jalr	1322(ra) # 800012d2 <release>
}
    80005db0:	0001                	nop
    80005db2:	60e2                	ld	ra,24(sp)
    80005db4:	6442                	ld	s0,16(sp)
    80005db6:	6105                	addi	sp,sp,32
    80005db8:	8082                	ret

0000000080005dba <bpin>:

void
bpin(struct buf *b) {
    80005dba:	1101                	addi	sp,sp,-32
    80005dbc:	ec06                	sd	ra,24(sp)
    80005dbe:	e822                	sd	s0,16(sp)
    80005dc0:	1000                	addi	s0,sp,32
    80005dc2:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80005dc6:	00016517          	auipc	a0,0x16
    80005dca:	f5250513          	addi	a0,a0,-174 # 8001bd18 <bcache>
    80005dce:	ffffb097          	auipc	ra,0xffffb
    80005dd2:	4a0080e7          	jalr	1184(ra) # 8000126e <acquire>
  b->refcnt++;
    80005dd6:	fe843783          	ld	a5,-24(s0)
    80005dda:	43bc                	lw	a5,64(a5)
    80005ddc:	2785                	addiw	a5,a5,1
    80005dde:	0007871b          	sext.w	a4,a5
    80005de2:	fe843783          	ld	a5,-24(s0)
    80005de6:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80005de8:	00016517          	auipc	a0,0x16
    80005dec:	f3050513          	addi	a0,a0,-208 # 8001bd18 <bcache>
    80005df0:	ffffb097          	auipc	ra,0xffffb
    80005df4:	4e2080e7          	jalr	1250(ra) # 800012d2 <release>
}
    80005df8:	0001                	nop
    80005dfa:	60e2                	ld	ra,24(sp)
    80005dfc:	6442                	ld	s0,16(sp)
    80005dfe:	6105                	addi	sp,sp,32
    80005e00:	8082                	ret

0000000080005e02 <bunpin>:

void
bunpin(struct buf *b) {
    80005e02:	1101                	addi	sp,sp,-32
    80005e04:	ec06                	sd	ra,24(sp)
    80005e06:	e822                	sd	s0,16(sp)
    80005e08:	1000                	addi	s0,sp,32
    80005e0a:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80005e0e:	00016517          	auipc	a0,0x16
    80005e12:	f0a50513          	addi	a0,a0,-246 # 8001bd18 <bcache>
    80005e16:	ffffb097          	auipc	ra,0xffffb
    80005e1a:	458080e7          	jalr	1112(ra) # 8000126e <acquire>
  b->refcnt--;
    80005e1e:	fe843783          	ld	a5,-24(s0)
    80005e22:	43bc                	lw	a5,64(a5)
    80005e24:	37fd                	addiw	a5,a5,-1
    80005e26:	0007871b          	sext.w	a4,a5
    80005e2a:	fe843783          	ld	a5,-24(s0)
    80005e2e:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80005e30:	00016517          	auipc	a0,0x16
    80005e34:	ee850513          	addi	a0,a0,-280 # 8001bd18 <bcache>
    80005e38:	ffffb097          	auipc	ra,0xffffb
    80005e3c:	49a080e7          	jalr	1178(ra) # 800012d2 <release>
}
    80005e40:	0001                	nop
    80005e42:	60e2                	ld	ra,24(sp)
    80005e44:	6442                	ld	s0,16(sp)
    80005e46:	6105                	addi	sp,sp,32
    80005e48:	8082                	ret

0000000080005e4a <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80005e4a:	7179                	addi	sp,sp,-48
    80005e4c:	f406                	sd	ra,40(sp)
    80005e4e:	f022                	sd	s0,32(sp)
    80005e50:	1800                	addi	s0,sp,48
    80005e52:	87aa                	mv	a5,a0
    80005e54:	fcb43823          	sd	a1,-48(s0)
    80005e58:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80005e5c:	fdc42783          	lw	a5,-36(s0)
    80005e60:	4585                	li	a1,1
    80005e62:	853e                	mv	a0,a5
    80005e64:	00000097          	auipc	ra,0x0
    80005e68:	dc6080e7          	jalr	-570(ra) # 80005c2a <bread>
    80005e6c:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80005e70:	fe843783          	ld	a5,-24(s0)
    80005e74:	05878793          	addi	a5,a5,88
    80005e78:	02000613          	li	a2,32
    80005e7c:	85be                	mv	a1,a5
    80005e7e:	fd043503          	ld	a0,-48(s0)
    80005e82:	ffffb097          	auipc	ra,0xffffb
    80005e86:	6a4080e7          	jalr	1700(ra) # 80001526 <memmove>
  brelse(bp);
    80005e8a:	fe843503          	ld	a0,-24(s0)
    80005e8e:	00000097          	auipc	ra,0x0
    80005e92:	e3e080e7          	jalr	-450(ra) # 80005ccc <brelse>
}
    80005e96:	0001                	nop
    80005e98:	70a2                	ld	ra,40(sp)
    80005e9a:	7402                	ld	s0,32(sp)
    80005e9c:	6145                	addi	sp,sp,48
    80005e9e:	8082                	ret

0000000080005ea0 <fsinit>:

// Init fs
void
fsinit(int dev) {
    80005ea0:	1101                	addi	sp,sp,-32
    80005ea2:	ec06                	sd	ra,24(sp)
    80005ea4:	e822                	sd	s0,16(sp)
    80005ea6:	1000                	addi	s0,sp,32
    80005ea8:	87aa                	mv	a5,a0
    80005eaa:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80005eae:	fec42783          	lw	a5,-20(s0)
    80005eb2:	0001e597          	auipc	a1,0x1e
    80005eb6:	52658593          	addi	a1,a1,1318 # 800243d8 <sb>
    80005eba:	853e                	mv	a0,a5
    80005ebc:	00000097          	auipc	ra,0x0
    80005ec0:	f8e080e7          	jalr	-114(ra) # 80005e4a <readsb>
  if(sb.magic != FSMAGIC)
    80005ec4:	0001e797          	auipc	a5,0x1e
    80005ec8:	51478793          	addi	a5,a5,1300 # 800243d8 <sb>
    80005ecc:	439c                	lw	a5,0(a5)
    80005ece:	873e                	mv	a4,a5
    80005ed0:	102037b7          	lui	a5,0x10203
    80005ed4:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80005ed8:	00f70a63          	beq	a4,a5,80005eec <fsinit+0x4c>
    panic("invalid file system");
    80005edc:	00006517          	auipc	a0,0x6
    80005ee0:	57450513          	addi	a0,a0,1396 # 8000c450 <etext+0x450>
    80005ee4:	ffffb097          	auipc	ra,0xffffb
    80005ee8:	d9a080e7          	jalr	-614(ra) # 80000c7e <panic>
  initlog(dev, &sb);
    80005eec:	fec42783          	lw	a5,-20(s0)
    80005ef0:	0001e597          	auipc	a1,0x1e
    80005ef4:	4e858593          	addi	a1,a1,1256 # 800243d8 <sb>
    80005ef8:	853e                	mv	a0,a5
    80005efa:	00001097          	auipc	ra,0x1
    80005efe:	468080e7          	jalr	1128(ra) # 80007362 <initlog>
}
    80005f02:	0001                	nop
    80005f04:	60e2                	ld	ra,24(sp)
    80005f06:	6442                	ld	s0,16(sp)
    80005f08:	6105                	addi	sp,sp,32
    80005f0a:	8082                	ret

0000000080005f0c <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    80005f0c:	7179                	addi	sp,sp,-48
    80005f0e:	f406                	sd	ra,40(sp)
    80005f10:	f022                	sd	s0,32(sp)
    80005f12:	1800                	addi	s0,sp,48
    80005f14:	87aa                	mv	a5,a0
    80005f16:	872e                	mv	a4,a1
    80005f18:	fcf42e23          	sw	a5,-36(s0)
    80005f1c:	87ba                	mv	a5,a4
    80005f1e:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80005f22:	fdc42783          	lw	a5,-36(s0)
    80005f26:	fd842703          	lw	a4,-40(s0)
    80005f2a:	85ba                	mv	a1,a4
    80005f2c:	853e                	mv	a0,a5
    80005f2e:	00000097          	auipc	ra,0x0
    80005f32:	cfc080e7          	jalr	-772(ra) # 80005c2a <bread>
    80005f36:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80005f3a:	fe843783          	ld	a5,-24(s0)
    80005f3e:	05878793          	addi	a5,a5,88
    80005f42:	40000613          	li	a2,1024
    80005f46:	4581                	li	a1,0
    80005f48:	853e                	mv	a0,a5
    80005f4a:	ffffb097          	auipc	ra,0xffffb
    80005f4e:	4f8080e7          	jalr	1272(ra) # 80001442 <memset>
  log_write(bp);
    80005f52:	fe843503          	ld	a0,-24(s0)
    80005f56:	00002097          	auipc	ra,0x2
    80005f5a:	9f4080e7          	jalr	-1548(ra) # 8000794a <log_write>
  brelse(bp);
    80005f5e:	fe843503          	ld	a0,-24(s0)
    80005f62:	00000097          	auipc	ra,0x0
    80005f66:	d6a080e7          	jalr	-662(ra) # 80005ccc <brelse>
}
    80005f6a:	0001                	nop
    80005f6c:	70a2                	ld	ra,40(sp)
    80005f6e:	7402                	ld	s0,32(sp)
    80005f70:	6145                	addi	sp,sp,48
    80005f72:	8082                	ret

0000000080005f74 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
    80005f74:	7139                	addi	sp,sp,-64
    80005f76:	fc06                	sd	ra,56(sp)
    80005f78:	f822                	sd	s0,48(sp)
    80005f7a:	0080                	addi	s0,sp,64
    80005f7c:	87aa                	mv	a5,a0
    80005f7e:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80005f82:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80005f86:	fe042623          	sw	zero,-20(s0)
    80005f8a:	a2b5                	j	800060f6 <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    80005f8c:	fec42783          	lw	a5,-20(s0)
    80005f90:	41f7d71b          	sraiw	a4,a5,0x1f
    80005f94:	0137571b          	srliw	a4,a4,0x13
    80005f98:	9fb9                	addw	a5,a5,a4
    80005f9a:	40d7d79b          	sraiw	a5,a5,0xd
    80005f9e:	2781                	sext.w	a5,a5
    80005fa0:	0007871b          	sext.w	a4,a5
    80005fa4:	0001e797          	auipc	a5,0x1e
    80005fa8:	43478793          	addi	a5,a5,1076 # 800243d8 <sb>
    80005fac:	4fdc                	lw	a5,28(a5)
    80005fae:	9fb9                	addw	a5,a5,a4
    80005fb0:	0007871b          	sext.w	a4,a5
    80005fb4:	fcc42783          	lw	a5,-52(s0)
    80005fb8:	85ba                	mv	a1,a4
    80005fba:	853e                	mv	a0,a5
    80005fbc:	00000097          	auipc	ra,0x0
    80005fc0:	c6e080e7          	jalr	-914(ra) # 80005c2a <bread>
    80005fc4:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80005fc8:	fe042423          	sw	zero,-24(s0)
    80005fcc:	a0dd                	j	800060b2 <balloc+0x13e>
      m = 1 << (bi % 8);
    80005fce:	fe842703          	lw	a4,-24(s0)
    80005fd2:	41f7579b          	sraiw	a5,a4,0x1f
    80005fd6:	01d7d79b          	srliw	a5,a5,0x1d
    80005fda:	9f3d                	addw	a4,a4,a5
    80005fdc:	8b1d                	andi	a4,a4,7
    80005fde:	40f707bb          	subw	a5,a4,a5
    80005fe2:	2781                	sext.w	a5,a5
    80005fe4:	4705                	li	a4,1
    80005fe6:	00f717bb          	sllw	a5,a4,a5
    80005fea:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80005fee:	fe842783          	lw	a5,-24(s0)
    80005ff2:	41f7d71b          	sraiw	a4,a5,0x1f
    80005ff6:	01d7571b          	srliw	a4,a4,0x1d
    80005ffa:	9fb9                	addw	a5,a5,a4
    80005ffc:	4037d79b          	sraiw	a5,a5,0x3
    80006000:	2781                	sext.w	a5,a5
    80006002:	fe043703          	ld	a4,-32(s0)
    80006006:	97ba                	add	a5,a5,a4
    80006008:	0587c783          	lbu	a5,88(a5)
    8000600c:	0007871b          	sext.w	a4,a5
    80006010:	fdc42783          	lw	a5,-36(s0)
    80006014:	8ff9                	and	a5,a5,a4
    80006016:	2781                	sext.w	a5,a5
    80006018:	ebc1                	bnez	a5,800060a8 <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    8000601a:	fe842783          	lw	a5,-24(s0)
    8000601e:	41f7d71b          	sraiw	a4,a5,0x1f
    80006022:	01d7571b          	srliw	a4,a4,0x1d
    80006026:	9fb9                	addw	a5,a5,a4
    80006028:	4037d79b          	sraiw	a5,a5,0x3
    8000602c:	2781                	sext.w	a5,a5
    8000602e:	fe043703          	ld	a4,-32(s0)
    80006032:	973e                	add	a4,a4,a5
    80006034:	05874703          	lbu	a4,88(a4)
    80006038:	0187169b          	slliw	a3,a4,0x18
    8000603c:	4186d69b          	sraiw	a3,a3,0x18
    80006040:	fdc42703          	lw	a4,-36(s0)
    80006044:	0187171b          	slliw	a4,a4,0x18
    80006048:	4187571b          	sraiw	a4,a4,0x18
    8000604c:	8f55                	or	a4,a4,a3
    8000604e:	0187171b          	slliw	a4,a4,0x18
    80006052:	4187571b          	sraiw	a4,a4,0x18
    80006056:	0ff77713          	andi	a4,a4,255
    8000605a:	fe043683          	ld	a3,-32(s0)
    8000605e:	97b6                	add	a5,a5,a3
    80006060:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80006064:	fe043503          	ld	a0,-32(s0)
    80006068:	00002097          	auipc	ra,0x2
    8000606c:	8e2080e7          	jalr	-1822(ra) # 8000794a <log_write>
        brelse(bp);
    80006070:	fe043503          	ld	a0,-32(s0)
    80006074:	00000097          	auipc	ra,0x0
    80006078:	c58080e7          	jalr	-936(ra) # 80005ccc <brelse>
        bzero(dev, b + bi);
    8000607c:	fcc42683          	lw	a3,-52(s0)
    80006080:	fec42703          	lw	a4,-20(s0)
    80006084:	fe842783          	lw	a5,-24(s0)
    80006088:	9fb9                	addw	a5,a5,a4
    8000608a:	2781                	sext.w	a5,a5
    8000608c:	85be                	mv	a1,a5
    8000608e:	8536                	mv	a0,a3
    80006090:	00000097          	auipc	ra,0x0
    80006094:	e7c080e7          	jalr	-388(ra) # 80005f0c <bzero>
        return b + bi;
    80006098:	fec42703          	lw	a4,-20(s0)
    8000609c:	fe842783          	lw	a5,-24(s0)
    800060a0:	9fb9                	addw	a5,a5,a4
    800060a2:	2781                	sext.w	a5,a5
    800060a4:	2781                	sext.w	a5,a5
    800060a6:	a88d                	j	80006118 <balloc+0x1a4>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    800060a8:	fe842783          	lw	a5,-24(s0)
    800060ac:	2785                	addiw	a5,a5,1
    800060ae:	fef42423          	sw	a5,-24(s0)
    800060b2:	fe842783          	lw	a5,-24(s0)
    800060b6:	0007871b          	sext.w	a4,a5
    800060ba:	6789                	lui	a5,0x2
    800060bc:	02f75163          	bge	a4,a5,800060de <balloc+0x16a>
    800060c0:	fec42703          	lw	a4,-20(s0)
    800060c4:	fe842783          	lw	a5,-24(s0)
    800060c8:	9fb9                	addw	a5,a5,a4
    800060ca:	2781                	sext.w	a5,a5
    800060cc:	0007871b          	sext.w	a4,a5
    800060d0:	0001e797          	auipc	a5,0x1e
    800060d4:	30878793          	addi	a5,a5,776 # 800243d8 <sb>
    800060d8:	43dc                	lw	a5,4(a5)
    800060da:	eef76ae3          	bltu	a4,a5,80005fce <balloc+0x5a>
      }
    }
    brelse(bp);
    800060de:	fe043503          	ld	a0,-32(s0)
    800060e2:	00000097          	auipc	ra,0x0
    800060e6:	bea080e7          	jalr	-1046(ra) # 80005ccc <brelse>
  for(b = 0; b < sb.size; b += BPB){
    800060ea:	fec42703          	lw	a4,-20(s0)
    800060ee:	6789                	lui	a5,0x2
    800060f0:	9fb9                	addw	a5,a5,a4
    800060f2:	fef42623          	sw	a5,-20(s0)
    800060f6:	0001e797          	auipc	a5,0x1e
    800060fa:	2e278793          	addi	a5,a5,738 # 800243d8 <sb>
    800060fe:	43d8                	lw	a4,4(a5)
    80006100:	fec42783          	lw	a5,-20(s0)
    80006104:	e8e7e4e3          	bltu	a5,a4,80005f8c <balloc+0x18>
  }
  panic("balloc: out of blocks");
    80006108:	00006517          	auipc	a0,0x6
    8000610c:	36050513          	addi	a0,a0,864 # 8000c468 <etext+0x468>
    80006110:	ffffb097          	auipc	ra,0xffffb
    80006114:	b6e080e7          	jalr	-1170(ra) # 80000c7e <panic>
}
    80006118:	853e                	mv	a0,a5
    8000611a:	70e2                	ld	ra,56(sp)
    8000611c:	7442                	ld	s0,48(sp)
    8000611e:	6121                	addi	sp,sp,64
    80006120:	8082                	ret

0000000080006122 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80006122:	7179                	addi	sp,sp,-48
    80006124:	f406                	sd	ra,40(sp)
    80006126:	f022                	sd	s0,32(sp)
    80006128:	1800                	addi	s0,sp,48
    8000612a:	87aa                	mv	a5,a0
    8000612c:	872e                	mv	a4,a1
    8000612e:	fcf42e23          	sw	a5,-36(s0)
    80006132:	87ba                	mv	a5,a4
    80006134:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80006138:	fdc42683          	lw	a3,-36(s0)
    8000613c:	fd842783          	lw	a5,-40(s0)
    80006140:	00d7d79b          	srliw	a5,a5,0xd
    80006144:	0007871b          	sext.w	a4,a5
    80006148:	0001e797          	auipc	a5,0x1e
    8000614c:	29078793          	addi	a5,a5,656 # 800243d8 <sb>
    80006150:	4fdc                	lw	a5,28(a5)
    80006152:	9fb9                	addw	a5,a5,a4
    80006154:	2781                	sext.w	a5,a5
    80006156:	85be                	mv	a1,a5
    80006158:	8536                	mv	a0,a3
    8000615a:	00000097          	auipc	ra,0x0
    8000615e:	ad0080e7          	jalr	-1328(ra) # 80005c2a <bread>
    80006162:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80006166:	fd842703          	lw	a4,-40(s0)
    8000616a:	6789                	lui	a5,0x2
    8000616c:	17fd                	addi	a5,a5,-1
    8000616e:	8ff9                	and	a5,a5,a4
    80006170:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80006174:	fe442703          	lw	a4,-28(s0)
    80006178:	41f7579b          	sraiw	a5,a4,0x1f
    8000617c:	01d7d79b          	srliw	a5,a5,0x1d
    80006180:	9f3d                	addw	a4,a4,a5
    80006182:	8b1d                	andi	a4,a4,7
    80006184:	40f707bb          	subw	a5,a4,a5
    80006188:	2781                	sext.w	a5,a5
    8000618a:	4705                	li	a4,1
    8000618c:	00f717bb          	sllw	a5,a4,a5
    80006190:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80006194:	fe442783          	lw	a5,-28(s0)
    80006198:	41f7d71b          	sraiw	a4,a5,0x1f
    8000619c:	01d7571b          	srliw	a4,a4,0x1d
    800061a0:	9fb9                	addw	a5,a5,a4
    800061a2:	4037d79b          	sraiw	a5,a5,0x3
    800061a6:	2781                	sext.w	a5,a5
    800061a8:	fe843703          	ld	a4,-24(s0)
    800061ac:	97ba                	add	a5,a5,a4
    800061ae:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    800061b2:	0007871b          	sext.w	a4,a5
    800061b6:	fe042783          	lw	a5,-32(s0)
    800061ba:	8ff9                	and	a5,a5,a4
    800061bc:	2781                	sext.w	a5,a5
    800061be:	eb89                	bnez	a5,800061d0 <bfree+0xae>
    panic("freeing free block");
    800061c0:	00006517          	auipc	a0,0x6
    800061c4:	2c050513          	addi	a0,a0,704 # 8000c480 <etext+0x480>
    800061c8:	ffffb097          	auipc	ra,0xffffb
    800061cc:	ab6080e7          	jalr	-1354(ra) # 80000c7e <panic>
  bp->data[bi/8] &= ~m;
    800061d0:	fe442783          	lw	a5,-28(s0)
    800061d4:	41f7d71b          	sraiw	a4,a5,0x1f
    800061d8:	01d7571b          	srliw	a4,a4,0x1d
    800061dc:	9fb9                	addw	a5,a5,a4
    800061de:	4037d79b          	sraiw	a5,a5,0x3
    800061e2:	2781                	sext.w	a5,a5
    800061e4:	fe843703          	ld	a4,-24(s0)
    800061e8:	973e                	add	a4,a4,a5
    800061ea:	05874703          	lbu	a4,88(a4)
    800061ee:	0187169b          	slliw	a3,a4,0x18
    800061f2:	4186d69b          	sraiw	a3,a3,0x18
    800061f6:	fe042703          	lw	a4,-32(s0)
    800061fa:	0187171b          	slliw	a4,a4,0x18
    800061fe:	4187571b          	sraiw	a4,a4,0x18
    80006202:	fff74713          	not	a4,a4
    80006206:	0187171b          	slliw	a4,a4,0x18
    8000620a:	4187571b          	sraiw	a4,a4,0x18
    8000620e:	8f75                	and	a4,a4,a3
    80006210:	0187171b          	slliw	a4,a4,0x18
    80006214:	4187571b          	sraiw	a4,a4,0x18
    80006218:	0ff77713          	andi	a4,a4,255
    8000621c:	fe843683          	ld	a3,-24(s0)
    80006220:	97b6                	add	a5,a5,a3
    80006222:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80006226:	fe843503          	ld	a0,-24(s0)
    8000622a:	00001097          	auipc	ra,0x1
    8000622e:	720080e7          	jalr	1824(ra) # 8000794a <log_write>
  brelse(bp);
    80006232:	fe843503          	ld	a0,-24(s0)
    80006236:	00000097          	auipc	ra,0x0
    8000623a:	a96080e7          	jalr	-1386(ra) # 80005ccc <brelse>
}
    8000623e:	0001                	nop
    80006240:	70a2                	ld	ra,40(sp)
    80006242:	7402                	ld	s0,32(sp)
    80006244:	6145                	addi	sp,sp,48
    80006246:	8082                	ret

0000000080006248 <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    80006248:	1101                	addi	sp,sp,-32
    8000624a:	ec06                	sd	ra,24(sp)
    8000624c:	e822                	sd	s0,16(sp)
    8000624e:	1000                	addi	s0,sp,32
  int i = 0;
    80006250:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80006254:	00006597          	auipc	a1,0x6
    80006258:	24458593          	addi	a1,a1,580 # 8000c498 <etext+0x498>
    8000625c:	0001e517          	auipc	a0,0x1e
    80006260:	19c50513          	addi	a0,a0,412 # 800243f8 <itable>
    80006264:	ffffb097          	auipc	ra,0xffffb
    80006268:	fda080e7          	jalr	-38(ra) # 8000123e <initlock>
  for(i = 0; i < NINODE; i++) {
    8000626c:	fe042623          	sw	zero,-20(s0)
    80006270:	a82d                	j	800062aa <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80006272:	fec42703          	lw	a4,-20(s0)
    80006276:	87ba                	mv	a5,a4
    80006278:	0792                	slli	a5,a5,0x4
    8000627a:	97ba                	add	a5,a5,a4
    8000627c:	078e                	slli	a5,a5,0x3
    8000627e:	02078713          	addi	a4,a5,32
    80006282:	0001e797          	auipc	a5,0x1e
    80006286:	17678793          	addi	a5,a5,374 # 800243f8 <itable>
    8000628a:	97ba                	add	a5,a5,a4
    8000628c:	07a1                	addi	a5,a5,8
    8000628e:	00006597          	auipc	a1,0x6
    80006292:	21258593          	addi	a1,a1,530 # 8000c4a0 <etext+0x4a0>
    80006296:	853e                	mv	a0,a5
    80006298:	00001097          	auipc	ra,0x1
    8000629c:	7e6080e7          	jalr	2022(ra) # 80007a7e <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    800062a0:	fec42783          	lw	a5,-20(s0)
    800062a4:	2785                	addiw	a5,a5,1
    800062a6:	fef42623          	sw	a5,-20(s0)
    800062aa:	fec42783          	lw	a5,-20(s0)
    800062ae:	0007871b          	sext.w	a4,a5
    800062b2:	03100793          	li	a5,49
    800062b6:	fae7dee3          	bge	a5,a4,80006272 <iinit+0x2a>
  }
}
    800062ba:	0001                	nop
    800062bc:	0001                	nop
    800062be:	60e2                	ld	ra,24(sp)
    800062c0:	6442                	ld	s0,16(sp)
    800062c2:	6105                	addi	sp,sp,32
    800062c4:	8082                	ret

00000000800062c6 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
    800062c6:	7139                	addi	sp,sp,-64
    800062c8:	fc06                	sd	ra,56(sp)
    800062ca:	f822                	sd	s0,48(sp)
    800062cc:	0080                	addi	s0,sp,64
    800062ce:	87aa                	mv	a5,a0
    800062d0:	872e                	mv	a4,a1
    800062d2:	fcf42623          	sw	a5,-52(s0)
    800062d6:	87ba                	mv	a5,a4
    800062d8:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    800062dc:	4785                	li	a5,1
    800062de:	fef42623          	sw	a5,-20(s0)
    800062e2:	a855                	j	80006396 <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    800062e4:	fec42783          	lw	a5,-20(s0)
    800062e8:	8391                	srli	a5,a5,0x4
    800062ea:	0007871b          	sext.w	a4,a5
    800062ee:	0001e797          	auipc	a5,0x1e
    800062f2:	0ea78793          	addi	a5,a5,234 # 800243d8 <sb>
    800062f6:	4f9c                	lw	a5,24(a5)
    800062f8:	9fb9                	addw	a5,a5,a4
    800062fa:	0007871b          	sext.w	a4,a5
    800062fe:	fcc42783          	lw	a5,-52(s0)
    80006302:	85ba                	mv	a1,a4
    80006304:	853e                	mv	a0,a5
    80006306:	00000097          	auipc	ra,0x0
    8000630a:	924080e7          	jalr	-1756(ra) # 80005c2a <bread>
    8000630e:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    80006312:	fe043783          	ld	a5,-32(s0)
    80006316:	05878713          	addi	a4,a5,88
    8000631a:	fec42783          	lw	a5,-20(s0)
    8000631e:	8bbd                	andi	a5,a5,15
    80006320:	079a                	slli	a5,a5,0x6
    80006322:	97ba                	add	a5,a5,a4
    80006324:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    80006328:	fd843783          	ld	a5,-40(s0)
    8000632c:	00079783          	lh	a5,0(a5)
    80006330:	eba1                	bnez	a5,80006380 <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80006332:	04000613          	li	a2,64
    80006336:	4581                	li	a1,0
    80006338:	fd843503          	ld	a0,-40(s0)
    8000633c:	ffffb097          	auipc	ra,0xffffb
    80006340:	106080e7          	jalr	262(ra) # 80001442 <memset>
      dip->type = type;
    80006344:	fd843783          	ld	a5,-40(s0)
    80006348:	fca45703          	lhu	a4,-54(s0)
    8000634c:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80006350:	fe043503          	ld	a0,-32(s0)
    80006354:	00001097          	auipc	ra,0x1
    80006358:	5f6080e7          	jalr	1526(ra) # 8000794a <log_write>
      brelse(bp);
    8000635c:	fe043503          	ld	a0,-32(s0)
    80006360:	00000097          	auipc	ra,0x0
    80006364:	96c080e7          	jalr	-1684(ra) # 80005ccc <brelse>
      return iget(dev, inum);
    80006368:	fec42703          	lw	a4,-20(s0)
    8000636c:	fcc42783          	lw	a5,-52(s0)
    80006370:	85ba                	mv	a1,a4
    80006372:	853e                	mv	a0,a5
    80006374:	00000097          	auipc	ra,0x0
    80006378:	136080e7          	jalr	310(ra) # 800064aa <iget>
    8000637c:	87aa                	mv	a5,a0
    8000637e:	a82d                	j	800063b8 <ialloc+0xf2>
    }
    brelse(bp);
    80006380:	fe043503          	ld	a0,-32(s0)
    80006384:	00000097          	auipc	ra,0x0
    80006388:	948080e7          	jalr	-1720(ra) # 80005ccc <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    8000638c:	fec42783          	lw	a5,-20(s0)
    80006390:	2785                	addiw	a5,a5,1
    80006392:	fef42623          	sw	a5,-20(s0)
    80006396:	0001e797          	auipc	a5,0x1e
    8000639a:	04278793          	addi	a5,a5,66 # 800243d8 <sb>
    8000639e:	47d8                	lw	a4,12(a5)
    800063a0:	fec42783          	lw	a5,-20(s0)
    800063a4:	f4e7e0e3          	bltu	a5,a4,800062e4 <ialloc+0x1e>
  }
  panic("ialloc: no inodes");
    800063a8:	00006517          	auipc	a0,0x6
    800063ac:	10050513          	addi	a0,a0,256 # 8000c4a8 <etext+0x4a8>
    800063b0:	ffffb097          	auipc	ra,0xffffb
    800063b4:	8ce080e7          	jalr	-1842(ra) # 80000c7e <panic>
}
    800063b8:	853e                	mv	a0,a5
    800063ba:	70e2                	ld	ra,56(sp)
    800063bc:	7442                	ld	s0,48(sp)
    800063be:	6121                	addi	sp,sp,64
    800063c0:	8082                	ret

00000000800063c2 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    800063c2:	7179                	addi	sp,sp,-48
    800063c4:	f406                	sd	ra,40(sp)
    800063c6:	f022                	sd	s0,32(sp)
    800063c8:	1800                	addi	s0,sp,48
    800063ca:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    800063ce:	fd843783          	ld	a5,-40(s0)
    800063d2:	4394                	lw	a3,0(a5)
    800063d4:	fd843783          	ld	a5,-40(s0)
    800063d8:	43dc                	lw	a5,4(a5)
    800063da:	0047d79b          	srliw	a5,a5,0x4
    800063de:	0007871b          	sext.w	a4,a5
    800063e2:	0001e797          	auipc	a5,0x1e
    800063e6:	ff678793          	addi	a5,a5,-10 # 800243d8 <sb>
    800063ea:	4f9c                	lw	a5,24(a5)
    800063ec:	9fb9                	addw	a5,a5,a4
    800063ee:	2781                	sext.w	a5,a5
    800063f0:	85be                	mv	a1,a5
    800063f2:	8536                	mv	a0,a3
    800063f4:	00000097          	auipc	ra,0x0
    800063f8:	836080e7          	jalr	-1994(ra) # 80005c2a <bread>
    800063fc:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    80006400:	fe843783          	ld	a5,-24(s0)
    80006404:	05878713          	addi	a4,a5,88
    80006408:	fd843783          	ld	a5,-40(s0)
    8000640c:	43dc                	lw	a5,4(a5)
    8000640e:	1782                	slli	a5,a5,0x20
    80006410:	9381                	srli	a5,a5,0x20
    80006412:	8bbd                	andi	a5,a5,15
    80006414:	079a                	slli	a5,a5,0x6
    80006416:	97ba                	add	a5,a5,a4
    80006418:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    8000641c:	fd843783          	ld	a5,-40(s0)
    80006420:	04479703          	lh	a4,68(a5)
    80006424:	fe043783          	ld	a5,-32(s0)
    80006428:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    8000642c:	fd843783          	ld	a5,-40(s0)
    80006430:	04679703          	lh	a4,70(a5)
    80006434:	fe043783          	ld	a5,-32(s0)
    80006438:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    8000643c:	fd843783          	ld	a5,-40(s0)
    80006440:	04879703          	lh	a4,72(a5)
    80006444:	fe043783          	ld	a5,-32(s0)
    80006448:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    8000644c:	fd843783          	ld	a5,-40(s0)
    80006450:	04a79703          	lh	a4,74(a5)
    80006454:	fe043783          	ld	a5,-32(s0)
    80006458:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    8000645c:	fd843783          	ld	a5,-40(s0)
    80006460:	47f8                	lw	a4,76(a5)
    80006462:	fe043783          	ld	a5,-32(s0)
    80006466:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    80006468:	fe043783          	ld	a5,-32(s0)
    8000646c:	00c78713          	addi	a4,a5,12
    80006470:	fd843783          	ld	a5,-40(s0)
    80006474:	05078793          	addi	a5,a5,80
    80006478:	03400613          	li	a2,52
    8000647c:	85be                	mv	a1,a5
    8000647e:	853a                	mv	a0,a4
    80006480:	ffffb097          	auipc	ra,0xffffb
    80006484:	0a6080e7          	jalr	166(ra) # 80001526 <memmove>
  log_write(bp);
    80006488:	fe843503          	ld	a0,-24(s0)
    8000648c:	00001097          	auipc	ra,0x1
    80006490:	4be080e7          	jalr	1214(ra) # 8000794a <log_write>
  brelse(bp);
    80006494:	fe843503          	ld	a0,-24(s0)
    80006498:	00000097          	auipc	ra,0x0
    8000649c:	834080e7          	jalr	-1996(ra) # 80005ccc <brelse>
}
    800064a0:	0001                	nop
    800064a2:	70a2                	ld	ra,40(sp)
    800064a4:	7402                	ld	s0,32(sp)
    800064a6:	6145                	addi	sp,sp,48
    800064a8:	8082                	ret

00000000800064aa <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    800064aa:	7179                	addi	sp,sp,-48
    800064ac:	f406                	sd	ra,40(sp)
    800064ae:	f022                	sd	s0,32(sp)
    800064b0:	1800                	addi	s0,sp,48
    800064b2:	87aa                	mv	a5,a0
    800064b4:	872e                	mv	a4,a1
    800064b6:	fcf42e23          	sw	a5,-36(s0)
    800064ba:	87ba                	mv	a5,a4
    800064bc:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    800064c0:	0001e517          	auipc	a0,0x1e
    800064c4:	f3850513          	addi	a0,a0,-200 # 800243f8 <itable>
    800064c8:	ffffb097          	auipc	ra,0xffffb
    800064cc:	da6080e7          	jalr	-602(ra) # 8000126e <acquire>

  // Is the inode already in the table?
  empty = 0;
    800064d0:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    800064d4:	0001e797          	auipc	a5,0x1e
    800064d8:	f3c78793          	addi	a5,a5,-196 # 80024410 <itable+0x18>
    800064dc:	fef43423          	sd	a5,-24(s0)
    800064e0:	a89d                	j	80006556 <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    800064e2:	fe843783          	ld	a5,-24(s0)
    800064e6:	479c                	lw	a5,8(a5)
    800064e8:	04f05663          	blez	a5,80006534 <iget+0x8a>
    800064ec:	fe843783          	ld	a5,-24(s0)
    800064f0:	4398                	lw	a4,0(a5)
    800064f2:	fdc42783          	lw	a5,-36(s0)
    800064f6:	2781                	sext.w	a5,a5
    800064f8:	02e79e63          	bne	a5,a4,80006534 <iget+0x8a>
    800064fc:	fe843783          	ld	a5,-24(s0)
    80006500:	43d8                	lw	a4,4(a5)
    80006502:	fd842783          	lw	a5,-40(s0)
    80006506:	2781                	sext.w	a5,a5
    80006508:	02e79663          	bne	a5,a4,80006534 <iget+0x8a>
      ip->ref++;
    8000650c:	fe843783          	ld	a5,-24(s0)
    80006510:	479c                	lw	a5,8(a5)
    80006512:	2785                	addiw	a5,a5,1
    80006514:	0007871b          	sext.w	a4,a5
    80006518:	fe843783          	ld	a5,-24(s0)
    8000651c:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    8000651e:	0001e517          	auipc	a0,0x1e
    80006522:	eda50513          	addi	a0,a0,-294 # 800243f8 <itable>
    80006526:	ffffb097          	auipc	ra,0xffffb
    8000652a:	dac080e7          	jalr	-596(ra) # 800012d2 <release>
      return ip;
    8000652e:	fe843783          	ld	a5,-24(s0)
    80006532:	a069                	j	800065bc <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    80006534:	fe043783          	ld	a5,-32(s0)
    80006538:	eb89                	bnez	a5,8000654a <iget+0xa0>
    8000653a:	fe843783          	ld	a5,-24(s0)
    8000653e:	479c                	lw	a5,8(a5)
    80006540:	e789                	bnez	a5,8000654a <iget+0xa0>
      empty = ip;
    80006542:	fe843783          	ld	a5,-24(s0)
    80006546:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    8000654a:	fe843783          	ld	a5,-24(s0)
    8000654e:	08878793          	addi	a5,a5,136
    80006552:	fef43423          	sd	a5,-24(s0)
    80006556:	fe843703          	ld	a4,-24(s0)
    8000655a:	00020797          	auipc	a5,0x20
    8000655e:	94678793          	addi	a5,a5,-1722 # 80025ea0 <log>
    80006562:	f8f760e3          	bltu	a4,a5,800064e2 <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    80006566:	fe043783          	ld	a5,-32(s0)
    8000656a:	eb89                	bnez	a5,8000657c <iget+0xd2>
    panic("iget: no inodes");
    8000656c:	00006517          	auipc	a0,0x6
    80006570:	f5450513          	addi	a0,a0,-172 # 8000c4c0 <etext+0x4c0>
    80006574:	ffffa097          	auipc	ra,0xffffa
    80006578:	70a080e7          	jalr	1802(ra) # 80000c7e <panic>

  ip = empty;
    8000657c:	fe043783          	ld	a5,-32(s0)
    80006580:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    80006584:	fe843783          	ld	a5,-24(s0)
    80006588:	fdc42703          	lw	a4,-36(s0)
    8000658c:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    8000658e:	fe843783          	ld	a5,-24(s0)
    80006592:	fd842703          	lw	a4,-40(s0)
    80006596:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    80006598:	fe843783          	ld	a5,-24(s0)
    8000659c:	4705                	li	a4,1
    8000659e:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    800065a0:	fe843783          	ld	a5,-24(s0)
    800065a4:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    800065a8:	0001e517          	auipc	a0,0x1e
    800065ac:	e5050513          	addi	a0,a0,-432 # 800243f8 <itable>
    800065b0:	ffffb097          	auipc	ra,0xffffb
    800065b4:	d22080e7          	jalr	-734(ra) # 800012d2 <release>

  return ip;
    800065b8:	fe843783          	ld	a5,-24(s0)
}
    800065bc:	853e                	mv	a0,a5
    800065be:	70a2                	ld	ra,40(sp)
    800065c0:	7402                	ld	s0,32(sp)
    800065c2:	6145                	addi	sp,sp,48
    800065c4:	8082                	ret

00000000800065c6 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    800065c6:	1101                	addi	sp,sp,-32
    800065c8:	ec06                	sd	ra,24(sp)
    800065ca:	e822                	sd	s0,16(sp)
    800065cc:	1000                	addi	s0,sp,32
    800065ce:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800065d2:	0001e517          	auipc	a0,0x1e
    800065d6:	e2650513          	addi	a0,a0,-474 # 800243f8 <itable>
    800065da:	ffffb097          	auipc	ra,0xffffb
    800065de:	c94080e7          	jalr	-876(ra) # 8000126e <acquire>
  ip->ref++;
    800065e2:	fe843783          	ld	a5,-24(s0)
    800065e6:	479c                	lw	a5,8(a5)
    800065e8:	2785                	addiw	a5,a5,1
    800065ea:	0007871b          	sext.w	a4,a5
    800065ee:	fe843783          	ld	a5,-24(s0)
    800065f2:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    800065f4:	0001e517          	auipc	a0,0x1e
    800065f8:	e0450513          	addi	a0,a0,-508 # 800243f8 <itable>
    800065fc:	ffffb097          	auipc	ra,0xffffb
    80006600:	cd6080e7          	jalr	-810(ra) # 800012d2 <release>
  return ip;
    80006604:	fe843783          	ld	a5,-24(s0)
}
    80006608:	853e                	mv	a0,a5
    8000660a:	60e2                	ld	ra,24(sp)
    8000660c:	6442                	ld	s0,16(sp)
    8000660e:	6105                	addi	sp,sp,32
    80006610:	8082                	ret

0000000080006612 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    80006612:	7179                	addi	sp,sp,-48
    80006614:	f406                	sd	ra,40(sp)
    80006616:	f022                	sd	s0,32(sp)
    80006618:	1800                	addi	s0,sp,48
    8000661a:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    8000661e:	fd843783          	ld	a5,-40(s0)
    80006622:	c791                	beqz	a5,8000662e <ilock+0x1c>
    80006624:	fd843783          	ld	a5,-40(s0)
    80006628:	479c                	lw	a5,8(a5)
    8000662a:	00f04a63          	bgtz	a5,8000663e <ilock+0x2c>
    panic("ilock");
    8000662e:	00006517          	auipc	a0,0x6
    80006632:	ea250513          	addi	a0,a0,-350 # 8000c4d0 <etext+0x4d0>
    80006636:	ffffa097          	auipc	ra,0xffffa
    8000663a:	648080e7          	jalr	1608(ra) # 80000c7e <panic>

  acquiresleep(&ip->lock);
    8000663e:	fd843783          	ld	a5,-40(s0)
    80006642:	07c1                	addi	a5,a5,16
    80006644:	853e                	mv	a0,a5
    80006646:	00001097          	auipc	ra,0x1
    8000664a:	484080e7          	jalr	1156(ra) # 80007aca <acquiresleep>

  if(ip->valid == 0){
    8000664e:	fd843783          	ld	a5,-40(s0)
    80006652:	43bc                	lw	a5,64(a5)
    80006654:	e7e5                	bnez	a5,8000673c <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80006656:	fd843783          	ld	a5,-40(s0)
    8000665a:	4394                	lw	a3,0(a5)
    8000665c:	fd843783          	ld	a5,-40(s0)
    80006660:	43dc                	lw	a5,4(a5)
    80006662:	0047d79b          	srliw	a5,a5,0x4
    80006666:	0007871b          	sext.w	a4,a5
    8000666a:	0001e797          	auipc	a5,0x1e
    8000666e:	d6e78793          	addi	a5,a5,-658 # 800243d8 <sb>
    80006672:	4f9c                	lw	a5,24(a5)
    80006674:	9fb9                	addw	a5,a5,a4
    80006676:	2781                	sext.w	a5,a5
    80006678:	85be                	mv	a1,a5
    8000667a:	8536                	mv	a0,a3
    8000667c:	fffff097          	auipc	ra,0xfffff
    80006680:	5ae080e7          	jalr	1454(ra) # 80005c2a <bread>
    80006684:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    80006688:	fe843783          	ld	a5,-24(s0)
    8000668c:	05878713          	addi	a4,a5,88
    80006690:	fd843783          	ld	a5,-40(s0)
    80006694:	43dc                	lw	a5,4(a5)
    80006696:	1782                	slli	a5,a5,0x20
    80006698:	9381                	srli	a5,a5,0x20
    8000669a:	8bbd                	andi	a5,a5,15
    8000669c:	079a                	slli	a5,a5,0x6
    8000669e:	97ba                	add	a5,a5,a4
    800066a0:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    800066a4:	fe043783          	ld	a5,-32(s0)
    800066a8:	00079703          	lh	a4,0(a5)
    800066ac:	fd843783          	ld	a5,-40(s0)
    800066b0:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    800066b4:	fe043783          	ld	a5,-32(s0)
    800066b8:	00279703          	lh	a4,2(a5)
    800066bc:	fd843783          	ld	a5,-40(s0)
    800066c0:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    800066c4:	fe043783          	ld	a5,-32(s0)
    800066c8:	00479703          	lh	a4,4(a5)
    800066cc:	fd843783          	ld	a5,-40(s0)
    800066d0:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    800066d4:	fe043783          	ld	a5,-32(s0)
    800066d8:	00679703          	lh	a4,6(a5)
    800066dc:	fd843783          	ld	a5,-40(s0)
    800066e0:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    800066e4:	fe043783          	ld	a5,-32(s0)
    800066e8:	4798                	lw	a4,8(a5)
    800066ea:	fd843783          	ld	a5,-40(s0)
    800066ee:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    800066f0:	fd843783          	ld	a5,-40(s0)
    800066f4:	05078713          	addi	a4,a5,80
    800066f8:	fe043783          	ld	a5,-32(s0)
    800066fc:	07b1                	addi	a5,a5,12
    800066fe:	03400613          	li	a2,52
    80006702:	85be                	mv	a1,a5
    80006704:	853a                	mv	a0,a4
    80006706:	ffffb097          	auipc	ra,0xffffb
    8000670a:	e20080e7          	jalr	-480(ra) # 80001526 <memmove>
    brelse(bp);
    8000670e:	fe843503          	ld	a0,-24(s0)
    80006712:	fffff097          	auipc	ra,0xfffff
    80006716:	5ba080e7          	jalr	1466(ra) # 80005ccc <brelse>
    ip->valid = 1;
    8000671a:	fd843783          	ld	a5,-40(s0)
    8000671e:	4705                	li	a4,1
    80006720:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    80006722:	fd843783          	ld	a5,-40(s0)
    80006726:	04479783          	lh	a5,68(a5)
    8000672a:	eb89                	bnez	a5,8000673c <ilock+0x12a>
      panic("ilock: no type");
    8000672c:	00006517          	auipc	a0,0x6
    80006730:	dac50513          	addi	a0,a0,-596 # 8000c4d8 <etext+0x4d8>
    80006734:	ffffa097          	auipc	ra,0xffffa
    80006738:	54a080e7          	jalr	1354(ra) # 80000c7e <panic>
  }
}
    8000673c:	0001                	nop
    8000673e:	70a2                	ld	ra,40(sp)
    80006740:	7402                	ld	s0,32(sp)
    80006742:	6145                	addi	sp,sp,48
    80006744:	8082                	ret

0000000080006746 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    80006746:	1101                	addi	sp,sp,-32
    80006748:	ec06                	sd	ra,24(sp)
    8000674a:	e822                	sd	s0,16(sp)
    8000674c:	1000                	addi	s0,sp,32
    8000674e:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    80006752:	fe843783          	ld	a5,-24(s0)
    80006756:	c385                	beqz	a5,80006776 <iunlock+0x30>
    80006758:	fe843783          	ld	a5,-24(s0)
    8000675c:	07c1                	addi	a5,a5,16
    8000675e:	853e                	mv	a0,a5
    80006760:	00001097          	auipc	ra,0x1
    80006764:	42a080e7          	jalr	1066(ra) # 80007b8a <holdingsleep>
    80006768:	87aa                	mv	a5,a0
    8000676a:	c791                	beqz	a5,80006776 <iunlock+0x30>
    8000676c:	fe843783          	ld	a5,-24(s0)
    80006770:	479c                	lw	a5,8(a5)
    80006772:	00f04a63          	bgtz	a5,80006786 <iunlock+0x40>
    panic("iunlock");
    80006776:	00006517          	auipc	a0,0x6
    8000677a:	d7250513          	addi	a0,a0,-654 # 8000c4e8 <etext+0x4e8>
    8000677e:	ffffa097          	auipc	ra,0xffffa
    80006782:	500080e7          	jalr	1280(ra) # 80000c7e <panic>

  releasesleep(&ip->lock);
    80006786:	fe843783          	ld	a5,-24(s0)
    8000678a:	07c1                	addi	a5,a5,16
    8000678c:	853e                	mv	a0,a5
    8000678e:	00001097          	auipc	ra,0x1
    80006792:	3aa080e7          	jalr	938(ra) # 80007b38 <releasesleep>
}
    80006796:	0001                	nop
    80006798:	60e2                	ld	ra,24(sp)
    8000679a:	6442                	ld	s0,16(sp)
    8000679c:	6105                	addi	sp,sp,32
    8000679e:	8082                	ret

00000000800067a0 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    800067a0:	1101                	addi	sp,sp,-32
    800067a2:	ec06                	sd	ra,24(sp)
    800067a4:	e822                	sd	s0,16(sp)
    800067a6:	1000                	addi	s0,sp,32
    800067a8:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800067ac:	0001e517          	auipc	a0,0x1e
    800067b0:	c4c50513          	addi	a0,a0,-948 # 800243f8 <itable>
    800067b4:	ffffb097          	auipc	ra,0xffffb
    800067b8:	aba080e7          	jalr	-1350(ra) # 8000126e <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    800067bc:	fe843783          	ld	a5,-24(s0)
    800067c0:	479c                	lw	a5,8(a5)
    800067c2:	873e                	mv	a4,a5
    800067c4:	4785                	li	a5,1
    800067c6:	06f71f63          	bne	a4,a5,80006844 <iput+0xa4>
    800067ca:	fe843783          	ld	a5,-24(s0)
    800067ce:	43bc                	lw	a5,64(a5)
    800067d0:	cbb5                	beqz	a5,80006844 <iput+0xa4>
    800067d2:	fe843783          	ld	a5,-24(s0)
    800067d6:	04a79783          	lh	a5,74(a5)
    800067da:	e7ad                	bnez	a5,80006844 <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    800067dc:	fe843783          	ld	a5,-24(s0)
    800067e0:	07c1                	addi	a5,a5,16
    800067e2:	853e                	mv	a0,a5
    800067e4:	00001097          	auipc	ra,0x1
    800067e8:	2e6080e7          	jalr	742(ra) # 80007aca <acquiresleep>

    release(&itable.lock);
    800067ec:	0001e517          	auipc	a0,0x1e
    800067f0:	c0c50513          	addi	a0,a0,-1012 # 800243f8 <itable>
    800067f4:	ffffb097          	auipc	ra,0xffffb
    800067f8:	ade080e7          	jalr	-1314(ra) # 800012d2 <release>

    itrunc(ip);
    800067fc:	fe843503          	ld	a0,-24(s0)
    80006800:	00000097          	auipc	ra,0x0
    80006804:	1fa080e7          	jalr	506(ra) # 800069fa <itrunc>
    ip->type = 0;
    80006808:	fe843783          	ld	a5,-24(s0)
    8000680c:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    80006810:	fe843503          	ld	a0,-24(s0)
    80006814:	00000097          	auipc	ra,0x0
    80006818:	bae080e7          	jalr	-1106(ra) # 800063c2 <iupdate>
    ip->valid = 0;
    8000681c:	fe843783          	ld	a5,-24(s0)
    80006820:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    80006824:	fe843783          	ld	a5,-24(s0)
    80006828:	07c1                	addi	a5,a5,16
    8000682a:	853e                	mv	a0,a5
    8000682c:	00001097          	auipc	ra,0x1
    80006830:	30c080e7          	jalr	780(ra) # 80007b38 <releasesleep>

    acquire(&itable.lock);
    80006834:	0001e517          	auipc	a0,0x1e
    80006838:	bc450513          	addi	a0,a0,-1084 # 800243f8 <itable>
    8000683c:	ffffb097          	auipc	ra,0xffffb
    80006840:	a32080e7          	jalr	-1486(ra) # 8000126e <acquire>
  }

  ip->ref--;
    80006844:	fe843783          	ld	a5,-24(s0)
    80006848:	479c                	lw	a5,8(a5)
    8000684a:	37fd                	addiw	a5,a5,-1
    8000684c:	0007871b          	sext.w	a4,a5
    80006850:	fe843783          	ld	a5,-24(s0)
    80006854:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    80006856:	0001e517          	auipc	a0,0x1e
    8000685a:	ba250513          	addi	a0,a0,-1118 # 800243f8 <itable>
    8000685e:	ffffb097          	auipc	ra,0xffffb
    80006862:	a74080e7          	jalr	-1420(ra) # 800012d2 <release>
}
    80006866:	0001                	nop
    80006868:	60e2                	ld	ra,24(sp)
    8000686a:	6442                	ld	s0,16(sp)
    8000686c:	6105                	addi	sp,sp,32
    8000686e:	8082                	ret

0000000080006870 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    80006870:	1101                	addi	sp,sp,-32
    80006872:	ec06                	sd	ra,24(sp)
    80006874:	e822                	sd	s0,16(sp)
    80006876:	1000                	addi	s0,sp,32
    80006878:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    8000687c:	fe843503          	ld	a0,-24(s0)
    80006880:	00000097          	auipc	ra,0x0
    80006884:	ec6080e7          	jalr	-314(ra) # 80006746 <iunlock>
  iput(ip);
    80006888:	fe843503          	ld	a0,-24(s0)
    8000688c:	00000097          	auipc	ra,0x0
    80006890:	f14080e7          	jalr	-236(ra) # 800067a0 <iput>
}
    80006894:	0001                	nop
    80006896:	60e2                	ld	ra,24(sp)
    80006898:	6442                	ld	s0,16(sp)
    8000689a:	6105                	addi	sp,sp,32
    8000689c:	8082                	ret

000000008000689e <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
    8000689e:	7139                	addi	sp,sp,-64
    800068a0:	fc06                	sd	ra,56(sp)
    800068a2:	f822                	sd	s0,48(sp)
    800068a4:	0080                	addi	s0,sp,64
    800068a6:	fca43423          	sd	a0,-56(s0)
    800068aa:	87ae                	mv	a5,a1
    800068ac:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    800068b0:	fc442783          	lw	a5,-60(s0)
    800068b4:	0007871b          	sext.w	a4,a5
    800068b8:	47ad                	li	a5,11
    800068ba:	04e7e863          	bltu	a5,a4,8000690a <bmap+0x6c>
    if((addr = ip->addrs[bn]) == 0)
    800068be:	fc843703          	ld	a4,-56(s0)
    800068c2:	fc446783          	lwu	a5,-60(s0)
    800068c6:	07d1                	addi	a5,a5,20
    800068c8:	078a                	slli	a5,a5,0x2
    800068ca:	97ba                	add	a5,a5,a4
    800068cc:	439c                	lw	a5,0(a5)
    800068ce:	fef42623          	sw	a5,-20(s0)
    800068d2:	fec42783          	lw	a5,-20(s0)
    800068d6:	2781                	sext.w	a5,a5
    800068d8:	e795                	bnez	a5,80006904 <bmap+0x66>
      ip->addrs[bn] = addr = balloc(ip->dev);
    800068da:	fc843783          	ld	a5,-56(s0)
    800068de:	439c                	lw	a5,0(a5)
    800068e0:	853e                	mv	a0,a5
    800068e2:	fffff097          	auipc	ra,0xfffff
    800068e6:	692080e7          	jalr	1682(ra) # 80005f74 <balloc>
    800068ea:	87aa                	mv	a5,a0
    800068ec:	fef42623          	sw	a5,-20(s0)
    800068f0:	fc843703          	ld	a4,-56(s0)
    800068f4:	fc446783          	lwu	a5,-60(s0)
    800068f8:	07d1                	addi	a5,a5,20
    800068fa:	078a                	slli	a5,a5,0x2
    800068fc:	97ba                	add	a5,a5,a4
    800068fe:	fec42703          	lw	a4,-20(s0)
    80006902:	c398                	sw	a4,0(a5)
    return addr;
    80006904:	fec42783          	lw	a5,-20(s0)
    80006908:	a0e5                	j	800069f0 <bmap+0x152>
  }
  bn -= NDIRECT;
    8000690a:	fc442783          	lw	a5,-60(s0)
    8000690e:	37d1                	addiw	a5,a5,-12
    80006910:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    80006914:	fc442783          	lw	a5,-60(s0)
    80006918:	0007871b          	sext.w	a4,a5
    8000691c:	0ff00793          	li	a5,255
    80006920:	0ce7e063          	bltu	a5,a4,800069e0 <bmap+0x142>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
    80006924:	fc843783          	ld	a5,-56(s0)
    80006928:	0807a783          	lw	a5,128(a5)
    8000692c:	fef42623          	sw	a5,-20(s0)
    80006930:	fec42783          	lw	a5,-20(s0)
    80006934:	2781                	sext.w	a5,a5
    80006936:	e395                	bnez	a5,8000695a <bmap+0xbc>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    80006938:	fc843783          	ld	a5,-56(s0)
    8000693c:	439c                	lw	a5,0(a5)
    8000693e:	853e                	mv	a0,a5
    80006940:	fffff097          	auipc	ra,0xfffff
    80006944:	634080e7          	jalr	1588(ra) # 80005f74 <balloc>
    80006948:	87aa                	mv	a5,a0
    8000694a:	fef42623          	sw	a5,-20(s0)
    8000694e:	fc843783          	ld	a5,-56(s0)
    80006952:	fec42703          	lw	a4,-20(s0)
    80006956:	08e7a023          	sw	a4,128(a5)
    bp = bread(ip->dev, addr);
    8000695a:	fc843783          	ld	a5,-56(s0)
    8000695e:	439c                	lw	a5,0(a5)
    80006960:	fec42703          	lw	a4,-20(s0)
    80006964:	85ba                	mv	a1,a4
    80006966:	853e                	mv	a0,a5
    80006968:	fffff097          	auipc	ra,0xfffff
    8000696c:	2c2080e7          	jalr	706(ra) # 80005c2a <bread>
    80006970:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80006974:	fe043783          	ld	a5,-32(s0)
    80006978:	05878793          	addi	a5,a5,88
    8000697c:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    80006980:	fc446783          	lwu	a5,-60(s0)
    80006984:	078a                	slli	a5,a5,0x2
    80006986:	fd843703          	ld	a4,-40(s0)
    8000698a:	97ba                	add	a5,a5,a4
    8000698c:	439c                	lw	a5,0(a5)
    8000698e:	fef42623          	sw	a5,-20(s0)
    80006992:	fec42783          	lw	a5,-20(s0)
    80006996:	2781                	sext.w	a5,a5
    80006998:	eb9d                	bnez	a5,800069ce <bmap+0x130>
      a[bn] = addr = balloc(ip->dev);
    8000699a:	fc843783          	ld	a5,-56(s0)
    8000699e:	439c                	lw	a5,0(a5)
    800069a0:	853e                	mv	a0,a5
    800069a2:	fffff097          	auipc	ra,0xfffff
    800069a6:	5d2080e7          	jalr	1490(ra) # 80005f74 <balloc>
    800069aa:	87aa                	mv	a5,a0
    800069ac:	fef42623          	sw	a5,-20(s0)
    800069b0:	fc446783          	lwu	a5,-60(s0)
    800069b4:	078a                	slli	a5,a5,0x2
    800069b6:	fd843703          	ld	a4,-40(s0)
    800069ba:	97ba                	add	a5,a5,a4
    800069bc:	fec42703          	lw	a4,-20(s0)
    800069c0:	c398                	sw	a4,0(a5)
      log_write(bp);
    800069c2:	fe043503          	ld	a0,-32(s0)
    800069c6:	00001097          	auipc	ra,0x1
    800069ca:	f84080e7          	jalr	-124(ra) # 8000794a <log_write>
    }
    brelse(bp);
    800069ce:	fe043503          	ld	a0,-32(s0)
    800069d2:	fffff097          	auipc	ra,0xfffff
    800069d6:	2fa080e7          	jalr	762(ra) # 80005ccc <brelse>
    return addr;
    800069da:	fec42783          	lw	a5,-20(s0)
    800069de:	a809                	j	800069f0 <bmap+0x152>
  }

  panic("bmap: out of range");
    800069e0:	00006517          	auipc	a0,0x6
    800069e4:	b1050513          	addi	a0,a0,-1264 # 8000c4f0 <etext+0x4f0>
    800069e8:	ffffa097          	auipc	ra,0xffffa
    800069ec:	296080e7          	jalr	662(ra) # 80000c7e <panic>
}
    800069f0:	853e                	mv	a0,a5
    800069f2:	70e2                	ld	ra,56(sp)
    800069f4:	7442                	ld	s0,48(sp)
    800069f6:	6121                	addi	sp,sp,64
    800069f8:	8082                	ret

00000000800069fa <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    800069fa:	7139                	addi	sp,sp,-64
    800069fc:	fc06                	sd	ra,56(sp)
    800069fe:	f822                	sd	s0,48(sp)
    80006a00:	0080                	addi	s0,sp,64
    80006a02:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    80006a06:	fe042623          	sw	zero,-20(s0)
    80006a0a:	a899                	j	80006a60 <itrunc+0x66>
    if(ip->addrs[i]){
    80006a0c:	fc843703          	ld	a4,-56(s0)
    80006a10:	fec42783          	lw	a5,-20(s0)
    80006a14:	07d1                	addi	a5,a5,20
    80006a16:	078a                	slli	a5,a5,0x2
    80006a18:	97ba                	add	a5,a5,a4
    80006a1a:	439c                	lw	a5,0(a5)
    80006a1c:	cf8d                	beqz	a5,80006a56 <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    80006a1e:	fc843783          	ld	a5,-56(s0)
    80006a22:	439c                	lw	a5,0(a5)
    80006a24:	0007869b          	sext.w	a3,a5
    80006a28:	fc843703          	ld	a4,-56(s0)
    80006a2c:	fec42783          	lw	a5,-20(s0)
    80006a30:	07d1                	addi	a5,a5,20
    80006a32:	078a                	slli	a5,a5,0x2
    80006a34:	97ba                	add	a5,a5,a4
    80006a36:	439c                	lw	a5,0(a5)
    80006a38:	85be                	mv	a1,a5
    80006a3a:	8536                	mv	a0,a3
    80006a3c:	fffff097          	auipc	ra,0xfffff
    80006a40:	6e6080e7          	jalr	1766(ra) # 80006122 <bfree>
      ip->addrs[i] = 0;
    80006a44:	fc843703          	ld	a4,-56(s0)
    80006a48:	fec42783          	lw	a5,-20(s0)
    80006a4c:	07d1                	addi	a5,a5,20
    80006a4e:	078a                	slli	a5,a5,0x2
    80006a50:	97ba                	add	a5,a5,a4
    80006a52:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    80006a56:	fec42783          	lw	a5,-20(s0)
    80006a5a:	2785                	addiw	a5,a5,1
    80006a5c:	fef42623          	sw	a5,-20(s0)
    80006a60:	fec42783          	lw	a5,-20(s0)
    80006a64:	0007871b          	sext.w	a4,a5
    80006a68:	47ad                	li	a5,11
    80006a6a:	fae7d1e3          	bge	a5,a4,80006a0c <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    80006a6e:	fc843783          	ld	a5,-56(s0)
    80006a72:	0807a783          	lw	a5,128(a5)
    80006a76:	cbc5                	beqz	a5,80006b26 <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    80006a78:	fc843783          	ld	a5,-56(s0)
    80006a7c:	4398                	lw	a4,0(a5)
    80006a7e:	fc843783          	ld	a5,-56(s0)
    80006a82:	0807a783          	lw	a5,128(a5)
    80006a86:	85be                	mv	a1,a5
    80006a88:	853a                	mv	a0,a4
    80006a8a:	fffff097          	auipc	ra,0xfffff
    80006a8e:	1a0080e7          	jalr	416(ra) # 80005c2a <bread>
    80006a92:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80006a96:	fe043783          	ld	a5,-32(s0)
    80006a9a:	05878793          	addi	a5,a5,88
    80006a9e:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    80006aa2:	fe042423          	sw	zero,-24(s0)
    80006aa6:	a081                	j	80006ae6 <itrunc+0xec>
      if(a[j])
    80006aa8:	fe842783          	lw	a5,-24(s0)
    80006aac:	078a                	slli	a5,a5,0x2
    80006aae:	fd843703          	ld	a4,-40(s0)
    80006ab2:	97ba                	add	a5,a5,a4
    80006ab4:	439c                	lw	a5,0(a5)
    80006ab6:	c39d                	beqz	a5,80006adc <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    80006ab8:	fc843783          	ld	a5,-56(s0)
    80006abc:	439c                	lw	a5,0(a5)
    80006abe:	0007869b          	sext.w	a3,a5
    80006ac2:	fe842783          	lw	a5,-24(s0)
    80006ac6:	078a                	slli	a5,a5,0x2
    80006ac8:	fd843703          	ld	a4,-40(s0)
    80006acc:	97ba                	add	a5,a5,a4
    80006ace:	439c                	lw	a5,0(a5)
    80006ad0:	85be                	mv	a1,a5
    80006ad2:	8536                	mv	a0,a3
    80006ad4:	fffff097          	auipc	ra,0xfffff
    80006ad8:	64e080e7          	jalr	1614(ra) # 80006122 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    80006adc:	fe842783          	lw	a5,-24(s0)
    80006ae0:	2785                	addiw	a5,a5,1
    80006ae2:	fef42423          	sw	a5,-24(s0)
    80006ae6:	fe842783          	lw	a5,-24(s0)
    80006aea:	873e                	mv	a4,a5
    80006aec:	0ff00793          	li	a5,255
    80006af0:	fae7fce3          	bgeu	a5,a4,80006aa8 <itrunc+0xae>
    }
    brelse(bp);
    80006af4:	fe043503          	ld	a0,-32(s0)
    80006af8:	fffff097          	auipc	ra,0xfffff
    80006afc:	1d4080e7          	jalr	468(ra) # 80005ccc <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    80006b00:	fc843783          	ld	a5,-56(s0)
    80006b04:	439c                	lw	a5,0(a5)
    80006b06:	0007871b          	sext.w	a4,a5
    80006b0a:	fc843783          	ld	a5,-56(s0)
    80006b0e:	0807a783          	lw	a5,128(a5)
    80006b12:	85be                	mv	a1,a5
    80006b14:	853a                	mv	a0,a4
    80006b16:	fffff097          	auipc	ra,0xfffff
    80006b1a:	60c080e7          	jalr	1548(ra) # 80006122 <bfree>
    ip->addrs[NDIRECT] = 0;
    80006b1e:	fc843783          	ld	a5,-56(s0)
    80006b22:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    80006b26:	fc843783          	ld	a5,-56(s0)
    80006b2a:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    80006b2e:	fc843503          	ld	a0,-56(s0)
    80006b32:	00000097          	auipc	ra,0x0
    80006b36:	890080e7          	jalr	-1904(ra) # 800063c2 <iupdate>
}
    80006b3a:	0001                	nop
    80006b3c:	70e2                	ld	ra,56(sp)
    80006b3e:	7442                	ld	s0,48(sp)
    80006b40:	6121                	addi	sp,sp,64
    80006b42:	8082                	ret

0000000080006b44 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    80006b44:	1101                	addi	sp,sp,-32
    80006b46:	ec22                	sd	s0,24(sp)
    80006b48:	1000                	addi	s0,sp,32
    80006b4a:	fea43423          	sd	a0,-24(s0)
    80006b4e:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    80006b52:	fe843783          	ld	a5,-24(s0)
    80006b56:	439c                	lw	a5,0(a5)
    80006b58:	0007871b          	sext.w	a4,a5
    80006b5c:	fe043783          	ld	a5,-32(s0)
    80006b60:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    80006b62:	fe843783          	ld	a5,-24(s0)
    80006b66:	43d8                	lw	a4,4(a5)
    80006b68:	fe043783          	ld	a5,-32(s0)
    80006b6c:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    80006b6e:	fe843783          	ld	a5,-24(s0)
    80006b72:	04479703          	lh	a4,68(a5)
    80006b76:	fe043783          	ld	a5,-32(s0)
    80006b7a:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    80006b7e:	fe843783          	ld	a5,-24(s0)
    80006b82:	04a79703          	lh	a4,74(a5)
    80006b86:	fe043783          	ld	a5,-32(s0)
    80006b8a:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    80006b8e:	fe843783          	ld	a5,-24(s0)
    80006b92:	47fc                	lw	a5,76(a5)
    80006b94:	02079713          	slli	a4,a5,0x20
    80006b98:	9301                	srli	a4,a4,0x20
    80006b9a:	fe043783          	ld	a5,-32(s0)
    80006b9e:	eb98                	sd	a4,16(a5)
}
    80006ba0:	0001                	nop
    80006ba2:	6462                	ld	s0,24(sp)
    80006ba4:	6105                	addi	sp,sp,32
    80006ba6:	8082                	ret

0000000080006ba8 <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    80006ba8:	711d                	addi	sp,sp,-96
    80006baa:	ec86                	sd	ra,88(sp)
    80006bac:	e8a2                	sd	s0,80(sp)
    80006bae:	e4a6                	sd	s1,72(sp)
    80006bb0:	1080                	addi	s0,sp,96
    80006bb2:	faa43c23          	sd	a0,-72(s0)
    80006bb6:	87ae                	mv	a5,a1
    80006bb8:	fac43423          	sd	a2,-88(s0)
    80006bbc:	faf42a23          	sw	a5,-76(s0)
    80006bc0:	87b6                	mv	a5,a3
    80006bc2:	faf42823          	sw	a5,-80(s0)
    80006bc6:	87ba                	mv	a5,a4
    80006bc8:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80006bcc:	fb843783          	ld	a5,-72(s0)
    80006bd0:	47f8                	lw	a4,76(a5)
    80006bd2:	fb042783          	lw	a5,-80(s0)
    80006bd6:	2781                	sext.w	a5,a5
    80006bd8:	00f76e63          	bltu	a4,a5,80006bf4 <readi+0x4c>
    80006bdc:	fb042703          	lw	a4,-80(s0)
    80006be0:	fa442783          	lw	a5,-92(s0)
    80006be4:	9fb9                	addw	a5,a5,a4
    80006be6:	0007871b          	sext.w	a4,a5
    80006bea:	fb042783          	lw	a5,-80(s0)
    80006bee:	2781                	sext.w	a5,a5
    80006bf0:	00f77463          	bgeu	a4,a5,80006bf8 <readi+0x50>
    return 0;
    80006bf4:	4781                	li	a5,0
    80006bf6:	aa05                	j	80006d26 <readi+0x17e>
  if(off + n > ip->size)
    80006bf8:	fb042703          	lw	a4,-80(s0)
    80006bfc:	fa442783          	lw	a5,-92(s0)
    80006c00:	9fb9                	addw	a5,a5,a4
    80006c02:	0007871b          	sext.w	a4,a5
    80006c06:	fb843783          	ld	a5,-72(s0)
    80006c0a:	47fc                	lw	a5,76(a5)
    80006c0c:	00e7fb63          	bgeu	a5,a4,80006c22 <readi+0x7a>
    n = ip->size - off;
    80006c10:	fb843783          	ld	a5,-72(s0)
    80006c14:	47f8                	lw	a4,76(a5)
    80006c16:	fb042783          	lw	a5,-80(s0)
    80006c1a:	40f707bb          	subw	a5,a4,a5
    80006c1e:	faf42223          	sw	a5,-92(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80006c22:	fc042e23          	sw	zero,-36(s0)
    80006c26:	a0f5                	j	80006d12 <readi+0x16a>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    80006c28:	fb843783          	ld	a5,-72(s0)
    80006c2c:	4384                	lw	s1,0(a5)
    80006c2e:	fb042783          	lw	a5,-80(s0)
    80006c32:	00a7d79b          	srliw	a5,a5,0xa
    80006c36:	2781                	sext.w	a5,a5
    80006c38:	85be                	mv	a1,a5
    80006c3a:	fb843503          	ld	a0,-72(s0)
    80006c3e:	00000097          	auipc	ra,0x0
    80006c42:	c60080e7          	jalr	-928(ra) # 8000689e <bmap>
    80006c46:	87aa                	mv	a5,a0
    80006c48:	2781                	sext.w	a5,a5
    80006c4a:	85be                	mv	a1,a5
    80006c4c:	8526                	mv	a0,s1
    80006c4e:	fffff097          	auipc	ra,0xfffff
    80006c52:	fdc080e7          	jalr	-36(ra) # 80005c2a <bread>
    80006c56:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80006c5a:	fb042783          	lw	a5,-80(s0)
    80006c5e:	3ff7f793          	andi	a5,a5,1023
    80006c62:	2781                	sext.w	a5,a5
    80006c64:	40000713          	li	a4,1024
    80006c68:	40f707bb          	subw	a5,a4,a5
    80006c6c:	0007869b          	sext.w	a3,a5
    80006c70:	fa442703          	lw	a4,-92(s0)
    80006c74:	fdc42783          	lw	a5,-36(s0)
    80006c78:	40f707bb          	subw	a5,a4,a5
    80006c7c:	2781                	sext.w	a5,a5
    80006c7e:	863e                	mv	a2,a5
    80006c80:	87b6                	mv	a5,a3
    80006c82:	0007869b          	sext.w	a3,a5
    80006c86:	0006071b          	sext.w	a4,a2
    80006c8a:	00d77363          	bgeu	a4,a3,80006c90 <readi+0xe8>
    80006c8e:	87b2                	mv	a5,a2
    80006c90:	fcf42623          	sw	a5,-52(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    80006c94:	fd043783          	ld	a5,-48(s0)
    80006c98:	05878713          	addi	a4,a5,88
    80006c9c:	fb046783          	lwu	a5,-80(s0)
    80006ca0:	3ff7f793          	andi	a5,a5,1023
    80006ca4:	973e                	add	a4,a4,a5
    80006ca6:	fcc46683          	lwu	a3,-52(s0)
    80006caa:	fb442783          	lw	a5,-76(s0)
    80006cae:	863a                	mv	a2,a4
    80006cb0:	fa843583          	ld	a1,-88(s0)
    80006cb4:	853e                	mv	a0,a5
    80006cb6:	ffffe097          	auipc	ra,0xffffe
    80006cba:	e10080e7          	jalr	-496(ra) # 80004ac6 <either_copyout>
    80006cbe:	87aa                	mv	a5,a0
    80006cc0:	873e                	mv	a4,a5
    80006cc2:	57fd                	li	a5,-1
    80006cc4:	00f71c63          	bne	a4,a5,80006cdc <readi+0x134>
      brelse(bp);
    80006cc8:	fd043503          	ld	a0,-48(s0)
    80006ccc:	fffff097          	auipc	ra,0xfffff
    80006cd0:	000080e7          	jalr	ra # 80005ccc <brelse>
      tot = -1;
    80006cd4:	57fd                	li	a5,-1
    80006cd6:	fcf42e23          	sw	a5,-36(s0)
      break;
    80006cda:	a0a1                	j	80006d22 <readi+0x17a>
    }
    brelse(bp);
    80006cdc:	fd043503          	ld	a0,-48(s0)
    80006ce0:	fffff097          	auipc	ra,0xfffff
    80006ce4:	fec080e7          	jalr	-20(ra) # 80005ccc <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80006ce8:	fdc42703          	lw	a4,-36(s0)
    80006cec:	fcc42783          	lw	a5,-52(s0)
    80006cf0:	9fb9                	addw	a5,a5,a4
    80006cf2:	fcf42e23          	sw	a5,-36(s0)
    80006cf6:	fb042703          	lw	a4,-80(s0)
    80006cfa:	fcc42783          	lw	a5,-52(s0)
    80006cfe:	9fb9                	addw	a5,a5,a4
    80006d00:	faf42823          	sw	a5,-80(s0)
    80006d04:	fcc46783          	lwu	a5,-52(s0)
    80006d08:	fa843703          	ld	a4,-88(s0)
    80006d0c:	97ba                	add	a5,a5,a4
    80006d0e:	faf43423          	sd	a5,-88(s0)
    80006d12:	fdc42703          	lw	a4,-36(s0)
    80006d16:	fa442783          	lw	a5,-92(s0)
    80006d1a:	2701                	sext.w	a4,a4
    80006d1c:	2781                	sext.w	a5,a5
    80006d1e:	f0f765e3          	bltu	a4,a5,80006c28 <readi+0x80>
  }
  return tot;
    80006d22:	fdc42783          	lw	a5,-36(s0)
}
    80006d26:	853e                	mv	a0,a5
    80006d28:	60e6                	ld	ra,88(sp)
    80006d2a:	6446                	ld	s0,80(sp)
    80006d2c:	64a6                	ld	s1,72(sp)
    80006d2e:	6125                	addi	sp,sp,96
    80006d30:	8082                	ret

0000000080006d32 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80006d32:	711d                	addi	sp,sp,-96
    80006d34:	ec86                	sd	ra,88(sp)
    80006d36:	e8a2                	sd	s0,80(sp)
    80006d38:	e4a6                	sd	s1,72(sp)
    80006d3a:	1080                	addi	s0,sp,96
    80006d3c:	faa43c23          	sd	a0,-72(s0)
    80006d40:	87ae                	mv	a5,a1
    80006d42:	fac43423          	sd	a2,-88(s0)
    80006d46:	faf42a23          	sw	a5,-76(s0)
    80006d4a:	87b6                	mv	a5,a3
    80006d4c:	faf42823          	sw	a5,-80(s0)
    80006d50:	87ba                	mv	a5,a4
    80006d52:	faf42223          	sw	a5,-92(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80006d56:	fb843783          	ld	a5,-72(s0)
    80006d5a:	47f8                	lw	a4,76(a5)
    80006d5c:	fb042783          	lw	a5,-80(s0)
    80006d60:	2781                	sext.w	a5,a5
    80006d62:	00f76e63          	bltu	a4,a5,80006d7e <writei+0x4c>
    80006d66:	fb042703          	lw	a4,-80(s0)
    80006d6a:	fa442783          	lw	a5,-92(s0)
    80006d6e:	9fb9                	addw	a5,a5,a4
    80006d70:	0007871b          	sext.w	a4,a5
    80006d74:	fb042783          	lw	a5,-80(s0)
    80006d78:	2781                	sext.w	a5,a5
    80006d7a:	00f77463          	bgeu	a4,a5,80006d82 <writei+0x50>
    return -1;
    80006d7e:	57fd                	li	a5,-1
    80006d80:	a2b1                	j	80006ecc <writei+0x19a>
  if(off + n > MAXFILE*BSIZE)
    80006d82:	fb042703          	lw	a4,-80(s0)
    80006d86:	fa442783          	lw	a5,-92(s0)
    80006d8a:	9fb9                	addw	a5,a5,a4
    80006d8c:	2781                	sext.w	a5,a5
    80006d8e:	873e                	mv	a4,a5
    80006d90:	000437b7          	lui	a5,0x43
    80006d94:	00e7f463          	bgeu	a5,a4,80006d9c <writei+0x6a>
    return -1;
    80006d98:	57fd                	li	a5,-1
    80006d9a:	aa0d                	j	80006ecc <writei+0x19a>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80006d9c:	fc042e23          	sw	zero,-36(s0)
    80006da0:	a8cd                	j	80006e92 <writei+0x160>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    80006da2:	fb843783          	ld	a5,-72(s0)
    80006da6:	4384                	lw	s1,0(a5)
    80006da8:	fb042783          	lw	a5,-80(s0)
    80006dac:	00a7d79b          	srliw	a5,a5,0xa
    80006db0:	2781                	sext.w	a5,a5
    80006db2:	85be                	mv	a1,a5
    80006db4:	fb843503          	ld	a0,-72(s0)
    80006db8:	00000097          	auipc	ra,0x0
    80006dbc:	ae6080e7          	jalr	-1306(ra) # 8000689e <bmap>
    80006dc0:	87aa                	mv	a5,a0
    80006dc2:	2781                	sext.w	a5,a5
    80006dc4:	85be                	mv	a1,a5
    80006dc6:	8526                	mv	a0,s1
    80006dc8:	fffff097          	auipc	ra,0xfffff
    80006dcc:	e62080e7          	jalr	-414(ra) # 80005c2a <bread>
    80006dd0:	fca43823          	sd	a0,-48(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80006dd4:	fb042783          	lw	a5,-80(s0)
    80006dd8:	3ff7f793          	andi	a5,a5,1023
    80006ddc:	2781                	sext.w	a5,a5
    80006dde:	40000713          	li	a4,1024
    80006de2:	40f707bb          	subw	a5,a4,a5
    80006de6:	0007869b          	sext.w	a3,a5
    80006dea:	fa442703          	lw	a4,-92(s0)
    80006dee:	fdc42783          	lw	a5,-36(s0)
    80006df2:	40f707bb          	subw	a5,a4,a5
    80006df6:	2781                	sext.w	a5,a5
    80006df8:	863e                	mv	a2,a5
    80006dfa:	87b6                	mv	a5,a3
    80006dfc:	0007869b          	sext.w	a3,a5
    80006e00:	0006071b          	sext.w	a4,a2
    80006e04:	00d77363          	bgeu	a4,a3,80006e0a <writei+0xd8>
    80006e08:	87b2                	mv	a5,a2
    80006e0a:	fcf42623          	sw	a5,-52(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80006e0e:	fd043783          	ld	a5,-48(s0)
    80006e12:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80006e16:	fb046783          	lwu	a5,-80(s0)
    80006e1a:	3ff7f793          	andi	a5,a5,1023
    80006e1e:	97ba                	add	a5,a5,a4
    80006e20:	fcc46683          	lwu	a3,-52(s0)
    80006e24:	fb442703          	lw	a4,-76(s0)
    80006e28:	fa843603          	ld	a2,-88(s0)
    80006e2c:	85ba                	mv	a1,a4
    80006e2e:	853e                	mv	a0,a5
    80006e30:	ffffe097          	auipc	ra,0xffffe
    80006e34:	d0a080e7          	jalr	-758(ra) # 80004b3a <either_copyin>
    80006e38:	87aa                	mv	a5,a0
    80006e3a:	873e                	mv	a4,a5
    80006e3c:	57fd                	li	a5,-1
    80006e3e:	00f71963          	bne	a4,a5,80006e50 <writei+0x11e>
      brelse(bp);
    80006e42:	fd043503          	ld	a0,-48(s0)
    80006e46:	fffff097          	auipc	ra,0xfffff
    80006e4a:	e86080e7          	jalr	-378(ra) # 80005ccc <brelse>
      break;
    80006e4e:	a891                	j	80006ea2 <writei+0x170>
    }
    log_write(bp);
    80006e50:	fd043503          	ld	a0,-48(s0)
    80006e54:	00001097          	auipc	ra,0x1
    80006e58:	af6080e7          	jalr	-1290(ra) # 8000794a <log_write>
    brelse(bp);
    80006e5c:	fd043503          	ld	a0,-48(s0)
    80006e60:	fffff097          	auipc	ra,0xfffff
    80006e64:	e6c080e7          	jalr	-404(ra) # 80005ccc <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80006e68:	fdc42703          	lw	a4,-36(s0)
    80006e6c:	fcc42783          	lw	a5,-52(s0)
    80006e70:	9fb9                	addw	a5,a5,a4
    80006e72:	fcf42e23          	sw	a5,-36(s0)
    80006e76:	fb042703          	lw	a4,-80(s0)
    80006e7a:	fcc42783          	lw	a5,-52(s0)
    80006e7e:	9fb9                	addw	a5,a5,a4
    80006e80:	faf42823          	sw	a5,-80(s0)
    80006e84:	fcc46783          	lwu	a5,-52(s0)
    80006e88:	fa843703          	ld	a4,-88(s0)
    80006e8c:	97ba                	add	a5,a5,a4
    80006e8e:	faf43423          	sd	a5,-88(s0)
    80006e92:	fdc42703          	lw	a4,-36(s0)
    80006e96:	fa442783          	lw	a5,-92(s0)
    80006e9a:	2701                	sext.w	a4,a4
    80006e9c:	2781                	sext.w	a5,a5
    80006e9e:	f0f762e3          	bltu	a4,a5,80006da2 <writei+0x70>
  }

  if(off > ip->size)
    80006ea2:	fb843783          	ld	a5,-72(s0)
    80006ea6:	47f8                	lw	a4,76(a5)
    80006ea8:	fb042783          	lw	a5,-80(s0)
    80006eac:	2781                	sext.w	a5,a5
    80006eae:	00f77763          	bgeu	a4,a5,80006ebc <writei+0x18a>
    ip->size = off;
    80006eb2:	fb843783          	ld	a5,-72(s0)
    80006eb6:	fb042703          	lw	a4,-80(s0)
    80006eba:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    80006ebc:	fb843503          	ld	a0,-72(s0)
    80006ec0:	fffff097          	auipc	ra,0xfffff
    80006ec4:	502080e7          	jalr	1282(ra) # 800063c2 <iupdate>

  return tot;
    80006ec8:	fdc42783          	lw	a5,-36(s0)
}
    80006ecc:	853e                	mv	a0,a5
    80006ece:	60e6                	ld	ra,88(sp)
    80006ed0:	6446                	ld	s0,80(sp)
    80006ed2:	64a6                	ld	s1,72(sp)
    80006ed4:	6125                	addi	sp,sp,96
    80006ed6:	8082                	ret

0000000080006ed8 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80006ed8:	1101                	addi	sp,sp,-32
    80006eda:	ec06                	sd	ra,24(sp)
    80006edc:	e822                	sd	s0,16(sp)
    80006ede:	1000                	addi	s0,sp,32
    80006ee0:	fea43423          	sd	a0,-24(s0)
    80006ee4:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80006ee8:	4639                	li	a2,14
    80006eea:	fe043583          	ld	a1,-32(s0)
    80006eee:	fe843503          	ld	a0,-24(s0)
    80006ef2:	ffffa097          	auipc	ra,0xffffa
    80006ef6:	748080e7          	jalr	1864(ra) # 8000163a <strncmp>
    80006efa:	87aa                	mv	a5,a0
}
    80006efc:	853e                	mv	a0,a5
    80006efe:	60e2                	ld	ra,24(sp)
    80006f00:	6442                	ld	s0,16(sp)
    80006f02:	6105                	addi	sp,sp,32
    80006f04:	8082                	ret

0000000080006f06 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80006f06:	715d                	addi	sp,sp,-80
    80006f08:	e486                	sd	ra,72(sp)
    80006f0a:	e0a2                	sd	s0,64(sp)
    80006f0c:	0880                	addi	s0,sp,80
    80006f0e:	fca43423          	sd	a0,-56(s0)
    80006f12:	fcb43023          	sd	a1,-64(s0)
    80006f16:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80006f1a:	fc843783          	ld	a5,-56(s0)
    80006f1e:	04479783          	lh	a5,68(a5)
    80006f22:	0007871b          	sext.w	a4,a5
    80006f26:	4785                	li	a5,1
    80006f28:	00f70a63          	beq	a4,a5,80006f3c <dirlookup+0x36>
    panic("dirlookup not DIR");
    80006f2c:	00005517          	auipc	a0,0x5
    80006f30:	5dc50513          	addi	a0,a0,1500 # 8000c508 <etext+0x508>
    80006f34:	ffffa097          	auipc	ra,0xffffa
    80006f38:	d4a080e7          	jalr	-694(ra) # 80000c7e <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80006f3c:	fe042623          	sw	zero,-20(s0)
    80006f40:	a849                	j	80006fd2 <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80006f42:	fd840793          	addi	a5,s0,-40
    80006f46:	fec42683          	lw	a3,-20(s0)
    80006f4a:	4741                	li	a4,16
    80006f4c:	863e                	mv	a2,a5
    80006f4e:	4581                	li	a1,0
    80006f50:	fc843503          	ld	a0,-56(s0)
    80006f54:	00000097          	auipc	ra,0x0
    80006f58:	c54080e7          	jalr	-940(ra) # 80006ba8 <readi>
    80006f5c:	87aa                	mv	a5,a0
    80006f5e:	873e                	mv	a4,a5
    80006f60:	47c1                	li	a5,16
    80006f62:	00f70a63          	beq	a4,a5,80006f76 <dirlookup+0x70>
      panic("dirlookup read");
    80006f66:	00005517          	auipc	a0,0x5
    80006f6a:	5ba50513          	addi	a0,a0,1466 # 8000c520 <etext+0x520>
    80006f6e:	ffffa097          	auipc	ra,0xffffa
    80006f72:	d10080e7          	jalr	-752(ra) # 80000c7e <panic>
    if(de.inum == 0)
    80006f76:	fd845783          	lhu	a5,-40(s0)
    80006f7a:	c7b1                	beqz	a5,80006fc6 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    80006f7c:	fd840793          	addi	a5,s0,-40
    80006f80:	0789                	addi	a5,a5,2
    80006f82:	85be                	mv	a1,a5
    80006f84:	fc043503          	ld	a0,-64(s0)
    80006f88:	00000097          	auipc	ra,0x0
    80006f8c:	f50080e7          	jalr	-176(ra) # 80006ed8 <namecmp>
    80006f90:	87aa                	mv	a5,a0
    80006f92:	eb9d                	bnez	a5,80006fc8 <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    80006f94:	fb843783          	ld	a5,-72(s0)
    80006f98:	c791                	beqz	a5,80006fa4 <dirlookup+0x9e>
        *poff = off;
    80006f9a:	fb843783          	ld	a5,-72(s0)
    80006f9e:	fec42703          	lw	a4,-20(s0)
    80006fa2:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80006fa4:	fd845783          	lhu	a5,-40(s0)
    80006fa8:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80006fac:	fc843783          	ld	a5,-56(s0)
    80006fb0:	439c                	lw	a5,0(a5)
    80006fb2:	fe842703          	lw	a4,-24(s0)
    80006fb6:	85ba                	mv	a1,a4
    80006fb8:	853e                	mv	a0,a5
    80006fba:	fffff097          	auipc	ra,0xfffff
    80006fbe:	4f0080e7          	jalr	1264(ra) # 800064aa <iget>
    80006fc2:	87aa                	mv	a5,a0
    80006fc4:	a005                	j	80006fe4 <dirlookup+0xde>
      continue;
    80006fc6:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80006fc8:	fec42783          	lw	a5,-20(s0)
    80006fcc:	27c1                	addiw	a5,a5,16
    80006fce:	fef42623          	sw	a5,-20(s0)
    80006fd2:	fc843783          	ld	a5,-56(s0)
    80006fd6:	47f8                	lw	a4,76(a5)
    80006fd8:	fec42783          	lw	a5,-20(s0)
    80006fdc:	2781                	sext.w	a5,a5
    80006fde:	f6e7e2e3          	bltu	a5,a4,80006f42 <dirlookup+0x3c>
    }
  }

  return 0;
    80006fe2:	4781                	li	a5,0
}
    80006fe4:	853e                	mv	a0,a5
    80006fe6:	60a6                	ld	ra,72(sp)
    80006fe8:	6406                	ld	s0,64(sp)
    80006fea:	6161                	addi	sp,sp,80
    80006fec:	8082                	ret

0000000080006fee <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80006fee:	715d                	addi	sp,sp,-80
    80006ff0:	e486                	sd	ra,72(sp)
    80006ff2:	e0a2                	sd	s0,64(sp)
    80006ff4:	0880                	addi	s0,sp,80
    80006ff6:	fca43423          	sd	a0,-56(s0)
    80006ffa:	fcb43023          	sd	a1,-64(s0)
    80006ffe:	87b2                	mv	a5,a2
    80007000:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80007004:	4601                	li	a2,0
    80007006:	fc043583          	ld	a1,-64(s0)
    8000700a:	fc843503          	ld	a0,-56(s0)
    8000700e:	00000097          	auipc	ra,0x0
    80007012:	ef8080e7          	jalr	-264(ra) # 80006f06 <dirlookup>
    80007016:	fea43023          	sd	a0,-32(s0)
    8000701a:	fe043783          	ld	a5,-32(s0)
    8000701e:	cb89                	beqz	a5,80007030 <dirlink+0x42>
    iput(ip);
    80007020:	fe043503          	ld	a0,-32(s0)
    80007024:	fffff097          	auipc	ra,0xfffff
    80007028:	77c080e7          	jalr	1916(ra) # 800067a0 <iput>
    return -1;
    8000702c:	57fd                	li	a5,-1
    8000702e:	a865                	j	800070e6 <dirlink+0xf8>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80007030:	fe042623          	sw	zero,-20(s0)
    80007034:	a0a1                	j	8000707c <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007036:	fd040793          	addi	a5,s0,-48
    8000703a:	fec42683          	lw	a3,-20(s0)
    8000703e:	4741                	li	a4,16
    80007040:	863e                	mv	a2,a5
    80007042:	4581                	li	a1,0
    80007044:	fc843503          	ld	a0,-56(s0)
    80007048:	00000097          	auipc	ra,0x0
    8000704c:	b60080e7          	jalr	-1184(ra) # 80006ba8 <readi>
    80007050:	87aa                	mv	a5,a0
    80007052:	873e                	mv	a4,a5
    80007054:	47c1                	li	a5,16
    80007056:	00f70a63          	beq	a4,a5,8000706a <dirlink+0x7c>
      panic("dirlink read");
    8000705a:	00005517          	auipc	a0,0x5
    8000705e:	4d650513          	addi	a0,a0,1238 # 8000c530 <etext+0x530>
    80007062:	ffffa097          	auipc	ra,0xffffa
    80007066:	c1c080e7          	jalr	-996(ra) # 80000c7e <panic>
    if(de.inum == 0)
    8000706a:	fd045783          	lhu	a5,-48(s0)
    8000706e:	cf99                	beqz	a5,8000708c <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80007070:	fec42783          	lw	a5,-20(s0)
    80007074:	27c1                	addiw	a5,a5,16
    80007076:	2781                	sext.w	a5,a5
    80007078:	fef42623          	sw	a5,-20(s0)
    8000707c:	fc843783          	ld	a5,-56(s0)
    80007080:	47f8                	lw	a4,76(a5)
    80007082:	fec42783          	lw	a5,-20(s0)
    80007086:	fae7e8e3          	bltu	a5,a4,80007036 <dirlink+0x48>
    8000708a:	a011                	j	8000708e <dirlink+0xa0>
      break;
    8000708c:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    8000708e:	fd040793          	addi	a5,s0,-48
    80007092:	0789                	addi	a5,a5,2
    80007094:	4639                	li	a2,14
    80007096:	fc043583          	ld	a1,-64(s0)
    8000709a:	853e                	mv	a0,a5
    8000709c:	ffffa097          	auipc	ra,0xffffa
    800070a0:	628080e7          	jalr	1576(ra) # 800016c4 <strncpy>
  de.inum = inum;
    800070a4:	fbc42783          	lw	a5,-68(s0)
    800070a8:	17c2                	slli	a5,a5,0x30
    800070aa:	93c1                	srli	a5,a5,0x30
    800070ac:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    800070b0:	fd040793          	addi	a5,s0,-48
    800070b4:	fec42683          	lw	a3,-20(s0)
    800070b8:	4741                	li	a4,16
    800070ba:	863e                	mv	a2,a5
    800070bc:	4581                	li	a1,0
    800070be:	fc843503          	ld	a0,-56(s0)
    800070c2:	00000097          	auipc	ra,0x0
    800070c6:	c70080e7          	jalr	-912(ra) # 80006d32 <writei>
    800070ca:	87aa                	mv	a5,a0
    800070cc:	873e                	mv	a4,a5
    800070ce:	47c1                	li	a5,16
    800070d0:	00f70a63          	beq	a4,a5,800070e4 <dirlink+0xf6>
    panic("dirlink");
    800070d4:	00005517          	auipc	a0,0x5
    800070d8:	46c50513          	addi	a0,a0,1132 # 8000c540 <etext+0x540>
    800070dc:	ffffa097          	auipc	ra,0xffffa
    800070e0:	ba2080e7          	jalr	-1118(ra) # 80000c7e <panic>

  return 0;
    800070e4:	4781                	li	a5,0
}
    800070e6:	853e                	mv	a0,a5
    800070e8:	60a6                	ld	ra,72(sp)
    800070ea:	6406                	ld	s0,64(sp)
    800070ec:	6161                	addi	sp,sp,80
    800070ee:	8082                	ret

00000000800070f0 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    800070f0:	7179                	addi	sp,sp,-48
    800070f2:	f406                	sd	ra,40(sp)
    800070f4:	f022                	sd	s0,32(sp)
    800070f6:	1800                	addi	s0,sp,48
    800070f8:	fca43c23          	sd	a0,-40(s0)
    800070fc:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80007100:	a031                	j	8000710c <skipelem+0x1c>
    path++;
    80007102:	fd843783          	ld	a5,-40(s0)
    80007106:	0785                	addi	a5,a5,1
    80007108:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    8000710c:	fd843783          	ld	a5,-40(s0)
    80007110:	0007c783          	lbu	a5,0(a5)
    80007114:	873e                	mv	a4,a5
    80007116:	02f00793          	li	a5,47
    8000711a:	fef704e3          	beq	a4,a5,80007102 <skipelem+0x12>
  if(*path == 0)
    8000711e:	fd843783          	ld	a5,-40(s0)
    80007122:	0007c783          	lbu	a5,0(a5)
    80007126:	e399                	bnez	a5,8000712c <skipelem+0x3c>
    return 0;
    80007128:	4781                	li	a5,0
    8000712a:	a06d                	j	800071d4 <skipelem+0xe4>
  s = path;
    8000712c:	fd843783          	ld	a5,-40(s0)
    80007130:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80007134:	a031                	j	80007140 <skipelem+0x50>
    path++;
    80007136:	fd843783          	ld	a5,-40(s0)
    8000713a:	0785                	addi	a5,a5,1
    8000713c:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80007140:	fd843783          	ld	a5,-40(s0)
    80007144:	0007c783          	lbu	a5,0(a5)
    80007148:	873e                	mv	a4,a5
    8000714a:	02f00793          	li	a5,47
    8000714e:	00f70763          	beq	a4,a5,8000715c <skipelem+0x6c>
    80007152:	fd843783          	ld	a5,-40(s0)
    80007156:	0007c783          	lbu	a5,0(a5)
    8000715a:	fff1                	bnez	a5,80007136 <skipelem+0x46>
  len = path - s;
    8000715c:	fd843703          	ld	a4,-40(s0)
    80007160:	fe843783          	ld	a5,-24(s0)
    80007164:	40f707b3          	sub	a5,a4,a5
    80007168:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    8000716c:	fe442783          	lw	a5,-28(s0)
    80007170:	0007871b          	sext.w	a4,a5
    80007174:	47b5                	li	a5,13
    80007176:	00e7dc63          	bge	a5,a4,8000718e <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    8000717a:	4639                	li	a2,14
    8000717c:	fe843583          	ld	a1,-24(s0)
    80007180:	fd043503          	ld	a0,-48(s0)
    80007184:	ffffa097          	auipc	ra,0xffffa
    80007188:	3a2080e7          	jalr	930(ra) # 80001526 <memmove>
    8000718c:	a80d                	j	800071be <skipelem+0xce>
  else {
    memmove(name, s, len);
    8000718e:	fe442783          	lw	a5,-28(s0)
    80007192:	863e                	mv	a2,a5
    80007194:	fe843583          	ld	a1,-24(s0)
    80007198:	fd043503          	ld	a0,-48(s0)
    8000719c:	ffffa097          	auipc	ra,0xffffa
    800071a0:	38a080e7          	jalr	906(ra) # 80001526 <memmove>
    name[len] = 0;
    800071a4:	fe442783          	lw	a5,-28(s0)
    800071a8:	fd043703          	ld	a4,-48(s0)
    800071ac:	97ba                	add	a5,a5,a4
    800071ae:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    800071b2:	a031                	j	800071be <skipelem+0xce>
    path++;
    800071b4:	fd843783          	ld	a5,-40(s0)
    800071b8:	0785                	addi	a5,a5,1
    800071ba:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    800071be:	fd843783          	ld	a5,-40(s0)
    800071c2:	0007c783          	lbu	a5,0(a5)
    800071c6:	873e                	mv	a4,a5
    800071c8:	02f00793          	li	a5,47
    800071cc:	fef704e3          	beq	a4,a5,800071b4 <skipelem+0xc4>
  return path;
    800071d0:	fd843783          	ld	a5,-40(s0)
}
    800071d4:	853e                	mv	a0,a5
    800071d6:	70a2                	ld	ra,40(sp)
    800071d8:	7402                	ld	s0,32(sp)
    800071da:	6145                	addi	sp,sp,48
    800071dc:	8082                	ret

00000000800071de <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    800071de:	7139                	addi	sp,sp,-64
    800071e0:	fc06                	sd	ra,56(sp)
    800071e2:	f822                	sd	s0,48(sp)
    800071e4:	0080                	addi	s0,sp,64
    800071e6:	fca43c23          	sd	a0,-40(s0)
    800071ea:	87ae                	mv	a5,a1
    800071ec:	fcc43423          	sd	a2,-56(s0)
    800071f0:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    800071f4:	fd843783          	ld	a5,-40(s0)
    800071f8:	0007c783          	lbu	a5,0(a5)
    800071fc:	873e                	mv	a4,a5
    800071fe:	02f00793          	li	a5,47
    80007202:	00f71b63          	bne	a4,a5,80007218 <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    80007206:	4585                	li	a1,1
    80007208:	4505                	li	a0,1
    8000720a:	fffff097          	auipc	ra,0xfffff
    8000720e:	2a0080e7          	jalr	672(ra) # 800064aa <iget>
    80007212:	fea43423          	sd	a0,-24(s0)
    80007216:	a84d                	j	800072c8 <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    80007218:	ffffb097          	auipc	ra,0xffffb
    8000721c:	614080e7          	jalr	1556(ra) # 8000282c <myproc>
    80007220:	87aa                	mv	a5,a0
    80007222:	1507b783          	ld	a5,336(a5)
    80007226:	853e                	mv	a0,a5
    80007228:	fffff097          	auipc	ra,0xfffff
    8000722c:	39e080e7          	jalr	926(ra) # 800065c6 <idup>
    80007230:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80007234:	a851                	j	800072c8 <namex+0xea>
    ilock(ip);
    80007236:	fe843503          	ld	a0,-24(s0)
    8000723a:	fffff097          	auipc	ra,0xfffff
    8000723e:	3d8080e7          	jalr	984(ra) # 80006612 <ilock>
    if(ip->type != T_DIR){
    80007242:	fe843783          	ld	a5,-24(s0)
    80007246:	04479783          	lh	a5,68(a5)
    8000724a:	0007871b          	sext.w	a4,a5
    8000724e:	4785                	li	a5,1
    80007250:	00f70a63          	beq	a4,a5,80007264 <namex+0x86>
      iunlockput(ip);
    80007254:	fe843503          	ld	a0,-24(s0)
    80007258:	fffff097          	auipc	ra,0xfffff
    8000725c:	618080e7          	jalr	1560(ra) # 80006870 <iunlockput>
      return 0;
    80007260:	4781                	li	a5,0
    80007262:	a871                	j	800072fe <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    80007264:	fd442783          	lw	a5,-44(s0)
    80007268:	2781                	sext.w	a5,a5
    8000726a:	cf99                	beqz	a5,80007288 <namex+0xaa>
    8000726c:	fd843783          	ld	a5,-40(s0)
    80007270:	0007c783          	lbu	a5,0(a5)
    80007274:	eb91                	bnez	a5,80007288 <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    80007276:	fe843503          	ld	a0,-24(s0)
    8000727a:	fffff097          	auipc	ra,0xfffff
    8000727e:	4cc080e7          	jalr	1228(ra) # 80006746 <iunlock>
      return ip;
    80007282:	fe843783          	ld	a5,-24(s0)
    80007286:	a8a5                	j	800072fe <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    80007288:	4601                	li	a2,0
    8000728a:	fc843583          	ld	a1,-56(s0)
    8000728e:	fe843503          	ld	a0,-24(s0)
    80007292:	00000097          	auipc	ra,0x0
    80007296:	c74080e7          	jalr	-908(ra) # 80006f06 <dirlookup>
    8000729a:	fea43023          	sd	a0,-32(s0)
    8000729e:	fe043783          	ld	a5,-32(s0)
    800072a2:	eb89                	bnez	a5,800072b4 <namex+0xd6>
      iunlockput(ip);
    800072a4:	fe843503          	ld	a0,-24(s0)
    800072a8:	fffff097          	auipc	ra,0xfffff
    800072ac:	5c8080e7          	jalr	1480(ra) # 80006870 <iunlockput>
      return 0;
    800072b0:	4781                	li	a5,0
    800072b2:	a0b1                	j	800072fe <namex+0x120>
    }
    iunlockput(ip);
    800072b4:	fe843503          	ld	a0,-24(s0)
    800072b8:	fffff097          	auipc	ra,0xfffff
    800072bc:	5b8080e7          	jalr	1464(ra) # 80006870 <iunlockput>
    ip = next;
    800072c0:	fe043783          	ld	a5,-32(s0)
    800072c4:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    800072c8:	fc843583          	ld	a1,-56(s0)
    800072cc:	fd843503          	ld	a0,-40(s0)
    800072d0:	00000097          	auipc	ra,0x0
    800072d4:	e20080e7          	jalr	-480(ra) # 800070f0 <skipelem>
    800072d8:	fca43c23          	sd	a0,-40(s0)
    800072dc:	fd843783          	ld	a5,-40(s0)
    800072e0:	fbb9                	bnez	a5,80007236 <namex+0x58>
  }
  if(nameiparent){
    800072e2:	fd442783          	lw	a5,-44(s0)
    800072e6:	2781                	sext.w	a5,a5
    800072e8:	cb89                	beqz	a5,800072fa <namex+0x11c>
    iput(ip);
    800072ea:	fe843503          	ld	a0,-24(s0)
    800072ee:	fffff097          	auipc	ra,0xfffff
    800072f2:	4b2080e7          	jalr	1202(ra) # 800067a0 <iput>
    return 0;
    800072f6:	4781                	li	a5,0
    800072f8:	a019                	j	800072fe <namex+0x120>
  }
  return ip;
    800072fa:	fe843783          	ld	a5,-24(s0)
}
    800072fe:	853e                	mv	a0,a5
    80007300:	70e2                	ld	ra,56(sp)
    80007302:	7442                	ld	s0,48(sp)
    80007304:	6121                	addi	sp,sp,64
    80007306:	8082                	ret

0000000080007308 <namei>:

struct inode*
namei(char *path)
{
    80007308:	7179                	addi	sp,sp,-48
    8000730a:	f406                	sd	ra,40(sp)
    8000730c:	f022                	sd	s0,32(sp)
    8000730e:	1800                	addi	s0,sp,48
    80007310:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    80007314:	fe040793          	addi	a5,s0,-32
    80007318:	863e                	mv	a2,a5
    8000731a:	4581                	li	a1,0
    8000731c:	fd843503          	ld	a0,-40(s0)
    80007320:	00000097          	auipc	ra,0x0
    80007324:	ebe080e7          	jalr	-322(ra) # 800071de <namex>
    80007328:	87aa                	mv	a5,a0
}
    8000732a:	853e                	mv	a0,a5
    8000732c:	70a2                	ld	ra,40(sp)
    8000732e:	7402                	ld	s0,32(sp)
    80007330:	6145                	addi	sp,sp,48
    80007332:	8082                	ret

0000000080007334 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    80007334:	1101                	addi	sp,sp,-32
    80007336:	ec06                	sd	ra,24(sp)
    80007338:	e822                	sd	s0,16(sp)
    8000733a:	1000                	addi	s0,sp,32
    8000733c:	fea43423          	sd	a0,-24(s0)
    80007340:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    80007344:	fe043603          	ld	a2,-32(s0)
    80007348:	4585                	li	a1,1
    8000734a:	fe843503          	ld	a0,-24(s0)
    8000734e:	00000097          	auipc	ra,0x0
    80007352:	e90080e7          	jalr	-368(ra) # 800071de <namex>
    80007356:	87aa                	mv	a5,a0
}
    80007358:	853e                	mv	a0,a5
    8000735a:	60e2                	ld	ra,24(sp)
    8000735c:	6442                	ld	s0,16(sp)
    8000735e:	6105                	addi	sp,sp,32
    80007360:	8082                	ret

0000000080007362 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    80007362:	1101                	addi	sp,sp,-32
    80007364:	ec06                	sd	ra,24(sp)
    80007366:	e822                	sd	s0,16(sp)
    80007368:	1000                	addi	s0,sp,32
    8000736a:	87aa                	mv	a5,a0
    8000736c:	feb43023          	sd	a1,-32(s0)
    80007370:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    80007374:	00005597          	auipc	a1,0x5
    80007378:	1d458593          	addi	a1,a1,468 # 8000c548 <etext+0x548>
    8000737c:	0001f517          	auipc	a0,0x1f
    80007380:	b2450513          	addi	a0,a0,-1244 # 80025ea0 <log>
    80007384:	ffffa097          	auipc	ra,0xffffa
    80007388:	eba080e7          	jalr	-326(ra) # 8000123e <initlock>
  log.start = sb->logstart;
    8000738c:	fe043783          	ld	a5,-32(s0)
    80007390:	4bdc                	lw	a5,20(a5)
    80007392:	0007871b          	sext.w	a4,a5
    80007396:	0001f797          	auipc	a5,0x1f
    8000739a:	b0a78793          	addi	a5,a5,-1270 # 80025ea0 <log>
    8000739e:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    800073a0:	fe043783          	ld	a5,-32(s0)
    800073a4:	4b9c                	lw	a5,16(a5)
    800073a6:	0007871b          	sext.w	a4,a5
    800073aa:	0001f797          	auipc	a5,0x1f
    800073ae:	af678793          	addi	a5,a5,-1290 # 80025ea0 <log>
    800073b2:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    800073b4:	0001f797          	auipc	a5,0x1f
    800073b8:	aec78793          	addi	a5,a5,-1300 # 80025ea0 <log>
    800073bc:	fec42703          	lw	a4,-20(s0)
    800073c0:	d798                	sw	a4,40(a5)
  recover_from_log();
    800073c2:	00000097          	auipc	ra,0x0
    800073c6:	272080e7          	jalr	626(ra) # 80007634 <recover_from_log>
}
    800073ca:	0001                	nop
    800073cc:	60e2                	ld	ra,24(sp)
    800073ce:	6442                	ld	s0,16(sp)
    800073d0:	6105                	addi	sp,sp,32
    800073d2:	8082                	ret

00000000800073d4 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    800073d4:	7139                	addi	sp,sp,-64
    800073d6:	fc06                	sd	ra,56(sp)
    800073d8:	f822                	sd	s0,48(sp)
    800073da:	0080                	addi	s0,sp,64
    800073dc:	87aa                	mv	a5,a0
    800073de:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    800073e2:	fe042623          	sw	zero,-20(s0)
    800073e6:	a0f9                	j	800074b4 <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    800073e8:	0001f797          	auipc	a5,0x1f
    800073ec:	ab878793          	addi	a5,a5,-1352 # 80025ea0 <log>
    800073f0:	579c                	lw	a5,40(a5)
    800073f2:	0007869b          	sext.w	a3,a5
    800073f6:	0001f797          	auipc	a5,0x1f
    800073fa:	aaa78793          	addi	a5,a5,-1366 # 80025ea0 <log>
    800073fe:	4f9c                	lw	a5,24(a5)
    80007400:	fec42703          	lw	a4,-20(s0)
    80007404:	9fb9                	addw	a5,a5,a4
    80007406:	2781                	sext.w	a5,a5
    80007408:	2785                	addiw	a5,a5,1
    8000740a:	2781                	sext.w	a5,a5
    8000740c:	2781                	sext.w	a5,a5
    8000740e:	85be                	mv	a1,a5
    80007410:	8536                	mv	a0,a3
    80007412:	fffff097          	auipc	ra,0xfffff
    80007416:	818080e7          	jalr	-2024(ra) # 80005c2a <bread>
    8000741a:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    8000741e:	0001f797          	auipc	a5,0x1f
    80007422:	a8278793          	addi	a5,a5,-1406 # 80025ea0 <log>
    80007426:	579c                	lw	a5,40(a5)
    80007428:	0007869b          	sext.w	a3,a5
    8000742c:	0001f717          	auipc	a4,0x1f
    80007430:	a7470713          	addi	a4,a4,-1420 # 80025ea0 <log>
    80007434:	fec42783          	lw	a5,-20(s0)
    80007438:	07a1                	addi	a5,a5,8
    8000743a:	078a                	slli	a5,a5,0x2
    8000743c:	97ba                	add	a5,a5,a4
    8000743e:	4b9c                	lw	a5,16(a5)
    80007440:	2781                	sext.w	a5,a5
    80007442:	85be                	mv	a1,a5
    80007444:	8536                	mv	a0,a3
    80007446:	ffffe097          	auipc	ra,0xffffe
    8000744a:	7e4080e7          	jalr	2020(ra) # 80005c2a <bread>
    8000744e:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80007452:	fd843783          	ld	a5,-40(s0)
    80007456:	05878713          	addi	a4,a5,88
    8000745a:	fe043783          	ld	a5,-32(s0)
    8000745e:	05878793          	addi	a5,a5,88
    80007462:	40000613          	li	a2,1024
    80007466:	85be                	mv	a1,a5
    80007468:	853a                	mv	a0,a4
    8000746a:	ffffa097          	auipc	ra,0xffffa
    8000746e:	0bc080e7          	jalr	188(ra) # 80001526 <memmove>
    bwrite(dbuf);  // write dst to disk
    80007472:	fd843503          	ld	a0,-40(s0)
    80007476:	fffff097          	auipc	ra,0xfffff
    8000747a:	80e080e7          	jalr	-2034(ra) # 80005c84 <bwrite>
    if(recovering == 0)
    8000747e:	fcc42783          	lw	a5,-52(s0)
    80007482:	2781                	sext.w	a5,a5
    80007484:	e799                	bnez	a5,80007492 <install_trans+0xbe>
      bunpin(dbuf);
    80007486:	fd843503          	ld	a0,-40(s0)
    8000748a:	fffff097          	auipc	ra,0xfffff
    8000748e:	978080e7          	jalr	-1672(ra) # 80005e02 <bunpin>
    brelse(lbuf);
    80007492:	fe043503          	ld	a0,-32(s0)
    80007496:	fffff097          	auipc	ra,0xfffff
    8000749a:	836080e7          	jalr	-1994(ra) # 80005ccc <brelse>
    brelse(dbuf);
    8000749e:	fd843503          	ld	a0,-40(s0)
    800074a2:	fffff097          	auipc	ra,0xfffff
    800074a6:	82a080e7          	jalr	-2006(ra) # 80005ccc <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800074aa:	fec42783          	lw	a5,-20(s0)
    800074ae:	2785                	addiw	a5,a5,1
    800074b0:	fef42623          	sw	a5,-20(s0)
    800074b4:	0001f797          	auipc	a5,0x1f
    800074b8:	9ec78793          	addi	a5,a5,-1556 # 80025ea0 <log>
    800074bc:	57d8                	lw	a4,44(a5)
    800074be:	fec42783          	lw	a5,-20(s0)
    800074c2:	2781                	sext.w	a5,a5
    800074c4:	f2e7c2e3          	blt	a5,a4,800073e8 <install_trans+0x14>
  }
}
    800074c8:	0001                	nop
    800074ca:	0001                	nop
    800074cc:	70e2                	ld	ra,56(sp)
    800074ce:	7442                	ld	s0,48(sp)
    800074d0:	6121                	addi	sp,sp,64
    800074d2:	8082                	ret

00000000800074d4 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    800074d4:	7179                	addi	sp,sp,-48
    800074d6:	f406                	sd	ra,40(sp)
    800074d8:	f022                	sd	s0,32(sp)
    800074da:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800074dc:	0001f797          	auipc	a5,0x1f
    800074e0:	9c478793          	addi	a5,a5,-1596 # 80025ea0 <log>
    800074e4:	579c                	lw	a5,40(a5)
    800074e6:	0007871b          	sext.w	a4,a5
    800074ea:	0001f797          	auipc	a5,0x1f
    800074ee:	9b678793          	addi	a5,a5,-1610 # 80025ea0 <log>
    800074f2:	4f9c                	lw	a5,24(a5)
    800074f4:	2781                	sext.w	a5,a5
    800074f6:	85be                	mv	a1,a5
    800074f8:	853a                	mv	a0,a4
    800074fa:	ffffe097          	auipc	ra,0xffffe
    800074fe:	730080e7          	jalr	1840(ra) # 80005c2a <bread>
    80007502:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    80007506:	fe043783          	ld	a5,-32(s0)
    8000750a:	05878793          	addi	a5,a5,88
    8000750e:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    80007512:	fd843783          	ld	a5,-40(s0)
    80007516:	4398                	lw	a4,0(a5)
    80007518:	0001f797          	auipc	a5,0x1f
    8000751c:	98878793          	addi	a5,a5,-1656 # 80025ea0 <log>
    80007520:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    80007522:	fe042623          	sw	zero,-20(s0)
    80007526:	a03d                	j	80007554 <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    80007528:	fd843703          	ld	a4,-40(s0)
    8000752c:	fec42783          	lw	a5,-20(s0)
    80007530:	078a                	slli	a5,a5,0x2
    80007532:	97ba                	add	a5,a5,a4
    80007534:	43d8                	lw	a4,4(a5)
    80007536:	0001f697          	auipc	a3,0x1f
    8000753a:	96a68693          	addi	a3,a3,-1686 # 80025ea0 <log>
    8000753e:	fec42783          	lw	a5,-20(s0)
    80007542:	07a1                	addi	a5,a5,8
    80007544:	078a                	slli	a5,a5,0x2
    80007546:	97b6                	add	a5,a5,a3
    80007548:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000754a:	fec42783          	lw	a5,-20(s0)
    8000754e:	2785                	addiw	a5,a5,1
    80007550:	fef42623          	sw	a5,-20(s0)
    80007554:	0001f797          	auipc	a5,0x1f
    80007558:	94c78793          	addi	a5,a5,-1716 # 80025ea0 <log>
    8000755c:	57d8                	lw	a4,44(a5)
    8000755e:	fec42783          	lw	a5,-20(s0)
    80007562:	2781                	sext.w	a5,a5
    80007564:	fce7c2e3          	blt	a5,a4,80007528 <read_head+0x54>
  }
  brelse(buf);
    80007568:	fe043503          	ld	a0,-32(s0)
    8000756c:	ffffe097          	auipc	ra,0xffffe
    80007570:	760080e7          	jalr	1888(ra) # 80005ccc <brelse>
}
    80007574:	0001                	nop
    80007576:	70a2                	ld	ra,40(sp)
    80007578:	7402                	ld	s0,32(sp)
    8000757a:	6145                	addi	sp,sp,48
    8000757c:	8082                	ret

000000008000757e <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    8000757e:	7179                	addi	sp,sp,-48
    80007580:	f406                	sd	ra,40(sp)
    80007582:	f022                	sd	s0,32(sp)
    80007584:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80007586:	0001f797          	auipc	a5,0x1f
    8000758a:	91a78793          	addi	a5,a5,-1766 # 80025ea0 <log>
    8000758e:	579c                	lw	a5,40(a5)
    80007590:	0007871b          	sext.w	a4,a5
    80007594:	0001f797          	auipc	a5,0x1f
    80007598:	90c78793          	addi	a5,a5,-1780 # 80025ea0 <log>
    8000759c:	4f9c                	lw	a5,24(a5)
    8000759e:	2781                	sext.w	a5,a5
    800075a0:	85be                	mv	a1,a5
    800075a2:	853a                	mv	a0,a4
    800075a4:	ffffe097          	auipc	ra,0xffffe
    800075a8:	686080e7          	jalr	1670(ra) # 80005c2a <bread>
    800075ac:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    800075b0:	fe043783          	ld	a5,-32(s0)
    800075b4:	05878793          	addi	a5,a5,88
    800075b8:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    800075bc:	0001f797          	auipc	a5,0x1f
    800075c0:	8e478793          	addi	a5,a5,-1820 # 80025ea0 <log>
    800075c4:	57d8                	lw	a4,44(a5)
    800075c6:	fd843783          	ld	a5,-40(s0)
    800075ca:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    800075cc:	fe042623          	sw	zero,-20(s0)
    800075d0:	a03d                	j	800075fe <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    800075d2:	0001f717          	auipc	a4,0x1f
    800075d6:	8ce70713          	addi	a4,a4,-1842 # 80025ea0 <log>
    800075da:	fec42783          	lw	a5,-20(s0)
    800075de:	07a1                	addi	a5,a5,8
    800075e0:	078a                	slli	a5,a5,0x2
    800075e2:	97ba                	add	a5,a5,a4
    800075e4:	4b98                	lw	a4,16(a5)
    800075e6:	fd843683          	ld	a3,-40(s0)
    800075ea:	fec42783          	lw	a5,-20(s0)
    800075ee:	078a                	slli	a5,a5,0x2
    800075f0:	97b6                	add	a5,a5,a3
    800075f2:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    800075f4:	fec42783          	lw	a5,-20(s0)
    800075f8:	2785                	addiw	a5,a5,1
    800075fa:	fef42623          	sw	a5,-20(s0)
    800075fe:	0001f797          	auipc	a5,0x1f
    80007602:	8a278793          	addi	a5,a5,-1886 # 80025ea0 <log>
    80007606:	57d8                	lw	a4,44(a5)
    80007608:	fec42783          	lw	a5,-20(s0)
    8000760c:	2781                	sext.w	a5,a5
    8000760e:	fce7c2e3          	blt	a5,a4,800075d2 <write_head+0x54>
  }
  bwrite(buf);
    80007612:	fe043503          	ld	a0,-32(s0)
    80007616:	ffffe097          	auipc	ra,0xffffe
    8000761a:	66e080e7          	jalr	1646(ra) # 80005c84 <bwrite>
  brelse(buf);
    8000761e:	fe043503          	ld	a0,-32(s0)
    80007622:	ffffe097          	auipc	ra,0xffffe
    80007626:	6aa080e7          	jalr	1706(ra) # 80005ccc <brelse>
}
    8000762a:	0001                	nop
    8000762c:	70a2                	ld	ra,40(sp)
    8000762e:	7402                	ld	s0,32(sp)
    80007630:	6145                	addi	sp,sp,48
    80007632:	8082                	ret

0000000080007634 <recover_from_log>:

static void
recover_from_log(void)
{
    80007634:	1141                	addi	sp,sp,-16
    80007636:	e406                	sd	ra,8(sp)
    80007638:	e022                	sd	s0,0(sp)
    8000763a:	0800                	addi	s0,sp,16
  read_head();
    8000763c:	00000097          	auipc	ra,0x0
    80007640:	e98080e7          	jalr	-360(ra) # 800074d4 <read_head>
  install_trans(1); // if committed, copy from log to disk
    80007644:	4505                	li	a0,1
    80007646:	00000097          	auipc	ra,0x0
    8000764a:	d8e080e7          	jalr	-626(ra) # 800073d4 <install_trans>
  log.lh.n = 0;
    8000764e:	0001f797          	auipc	a5,0x1f
    80007652:	85278793          	addi	a5,a5,-1966 # 80025ea0 <log>
    80007656:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    8000765a:	00000097          	auipc	ra,0x0
    8000765e:	f24080e7          	jalr	-220(ra) # 8000757e <write_head>
}
    80007662:	0001                	nop
    80007664:	60a2                	ld	ra,8(sp)
    80007666:	6402                	ld	s0,0(sp)
    80007668:	0141                	addi	sp,sp,16
    8000766a:	8082                	ret

000000008000766c <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    8000766c:	1141                	addi	sp,sp,-16
    8000766e:	e406                	sd	ra,8(sp)
    80007670:	e022                	sd	s0,0(sp)
    80007672:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    80007674:	0001f517          	auipc	a0,0x1f
    80007678:	82c50513          	addi	a0,a0,-2004 # 80025ea0 <log>
    8000767c:	ffffa097          	auipc	ra,0xffffa
    80007680:	bf2080e7          	jalr	-1038(ra) # 8000126e <acquire>
  while(1){
    if(log.committing){
    80007684:	0001f797          	auipc	a5,0x1f
    80007688:	81c78793          	addi	a5,a5,-2020 # 80025ea0 <log>
    8000768c:	53dc                	lw	a5,36(a5)
    8000768e:	cf91                	beqz	a5,800076aa <begin_op+0x3e>
      sleep(&log, &log.lock);
    80007690:	0001f597          	auipc	a1,0x1f
    80007694:	81058593          	addi	a1,a1,-2032 # 80025ea0 <log>
    80007698:	0001f517          	auipc	a0,0x1f
    8000769c:	80850513          	addi	a0,a0,-2040 # 80025ea0 <log>
    800076a0:	ffffd097          	auipc	ra,0xffffd
    800076a4:	1d6080e7          	jalr	470(ra) # 80004876 <sleep>
    800076a8:	bff1                	j	80007684 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    800076aa:	0001e797          	auipc	a5,0x1e
    800076ae:	7f678793          	addi	a5,a5,2038 # 80025ea0 <log>
    800076b2:	57d8                	lw	a4,44(a5)
    800076b4:	0001e797          	auipc	a5,0x1e
    800076b8:	7ec78793          	addi	a5,a5,2028 # 80025ea0 <log>
    800076bc:	539c                	lw	a5,32(a5)
    800076be:	2785                	addiw	a5,a5,1
    800076c0:	2781                	sext.w	a5,a5
    800076c2:	86be                	mv	a3,a5
    800076c4:	87b6                	mv	a5,a3
    800076c6:	0027979b          	slliw	a5,a5,0x2
    800076ca:	9fb5                	addw	a5,a5,a3
    800076cc:	0017979b          	slliw	a5,a5,0x1
    800076d0:	2781                	sext.w	a5,a5
    800076d2:	9fb9                	addw	a5,a5,a4
    800076d4:	2781                	sext.w	a5,a5
    800076d6:	873e                	mv	a4,a5
    800076d8:	47f9                	li	a5,30
    800076da:	00e7df63          	bge	a5,a4,800076f8 <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    800076de:	0001e597          	auipc	a1,0x1e
    800076e2:	7c258593          	addi	a1,a1,1986 # 80025ea0 <log>
    800076e6:	0001e517          	auipc	a0,0x1e
    800076ea:	7ba50513          	addi	a0,a0,1978 # 80025ea0 <log>
    800076ee:	ffffd097          	auipc	ra,0xffffd
    800076f2:	188080e7          	jalr	392(ra) # 80004876 <sleep>
    800076f6:	b779                	j	80007684 <begin_op+0x18>
    } else {
      log.outstanding += 1;
    800076f8:	0001e797          	auipc	a5,0x1e
    800076fc:	7a878793          	addi	a5,a5,1960 # 80025ea0 <log>
    80007700:	539c                	lw	a5,32(a5)
    80007702:	2785                	addiw	a5,a5,1
    80007704:	0007871b          	sext.w	a4,a5
    80007708:	0001e797          	auipc	a5,0x1e
    8000770c:	79878793          	addi	a5,a5,1944 # 80025ea0 <log>
    80007710:	d398                	sw	a4,32(a5)
      release(&log.lock);
    80007712:	0001e517          	auipc	a0,0x1e
    80007716:	78e50513          	addi	a0,a0,1934 # 80025ea0 <log>
    8000771a:	ffffa097          	auipc	ra,0xffffa
    8000771e:	bb8080e7          	jalr	-1096(ra) # 800012d2 <release>
      break;
    80007722:	0001                	nop
    }
  }
}
    80007724:	0001                	nop
    80007726:	60a2                	ld	ra,8(sp)
    80007728:	6402                	ld	s0,0(sp)
    8000772a:	0141                	addi	sp,sp,16
    8000772c:	8082                	ret

000000008000772e <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    8000772e:	1101                	addi	sp,sp,-32
    80007730:	ec06                	sd	ra,24(sp)
    80007732:	e822                	sd	s0,16(sp)
    80007734:	1000                	addi	s0,sp,32
  int do_commit = 0;
    80007736:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    8000773a:	0001e517          	auipc	a0,0x1e
    8000773e:	76650513          	addi	a0,a0,1894 # 80025ea0 <log>
    80007742:	ffffa097          	auipc	ra,0xffffa
    80007746:	b2c080e7          	jalr	-1236(ra) # 8000126e <acquire>
  log.outstanding -= 1;
    8000774a:	0001e797          	auipc	a5,0x1e
    8000774e:	75678793          	addi	a5,a5,1878 # 80025ea0 <log>
    80007752:	539c                	lw	a5,32(a5)
    80007754:	37fd                	addiw	a5,a5,-1
    80007756:	0007871b          	sext.w	a4,a5
    8000775a:	0001e797          	auipc	a5,0x1e
    8000775e:	74678793          	addi	a5,a5,1862 # 80025ea0 <log>
    80007762:	d398                	sw	a4,32(a5)
  if(log.committing)
    80007764:	0001e797          	auipc	a5,0x1e
    80007768:	73c78793          	addi	a5,a5,1852 # 80025ea0 <log>
    8000776c:	53dc                	lw	a5,36(a5)
    8000776e:	cb89                	beqz	a5,80007780 <end_op+0x52>
    panic("log.committing");
    80007770:	00005517          	auipc	a0,0x5
    80007774:	de050513          	addi	a0,a0,-544 # 8000c550 <etext+0x550>
    80007778:	ffff9097          	auipc	ra,0xffff9
    8000777c:	506080e7          	jalr	1286(ra) # 80000c7e <panic>
  if(log.outstanding == 0){
    80007780:	0001e797          	auipc	a5,0x1e
    80007784:	72078793          	addi	a5,a5,1824 # 80025ea0 <log>
    80007788:	539c                	lw	a5,32(a5)
    8000778a:	eb99                	bnez	a5,800077a0 <end_op+0x72>
    do_commit = 1;
    8000778c:	4785                	li	a5,1
    8000778e:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    80007792:	0001e797          	auipc	a5,0x1e
    80007796:	70e78793          	addi	a5,a5,1806 # 80025ea0 <log>
    8000779a:	4705                	li	a4,1
    8000779c:	d3d8                	sw	a4,36(a5)
    8000779e:	a809                	j	800077b0 <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    800077a0:	0001e517          	auipc	a0,0x1e
    800077a4:	70050513          	addi	a0,a0,1792 # 80025ea0 <log>
    800077a8:	ffffd097          	auipc	ra,0xffffd
    800077ac:	170080e7          	jalr	368(ra) # 80004918 <wakeup>
  }
  release(&log.lock);
    800077b0:	0001e517          	auipc	a0,0x1e
    800077b4:	6f050513          	addi	a0,a0,1776 # 80025ea0 <log>
    800077b8:	ffffa097          	auipc	ra,0xffffa
    800077bc:	b1a080e7          	jalr	-1254(ra) # 800012d2 <release>

  if(do_commit){
    800077c0:	fec42783          	lw	a5,-20(s0)
    800077c4:	2781                	sext.w	a5,a5
    800077c6:	c3b9                	beqz	a5,8000780c <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    800077c8:	00000097          	auipc	ra,0x0
    800077cc:	134080e7          	jalr	308(ra) # 800078fc <commit>
    acquire(&log.lock);
    800077d0:	0001e517          	auipc	a0,0x1e
    800077d4:	6d050513          	addi	a0,a0,1744 # 80025ea0 <log>
    800077d8:	ffffa097          	auipc	ra,0xffffa
    800077dc:	a96080e7          	jalr	-1386(ra) # 8000126e <acquire>
    log.committing = 0;
    800077e0:	0001e797          	auipc	a5,0x1e
    800077e4:	6c078793          	addi	a5,a5,1728 # 80025ea0 <log>
    800077e8:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    800077ec:	0001e517          	auipc	a0,0x1e
    800077f0:	6b450513          	addi	a0,a0,1716 # 80025ea0 <log>
    800077f4:	ffffd097          	auipc	ra,0xffffd
    800077f8:	124080e7          	jalr	292(ra) # 80004918 <wakeup>
    release(&log.lock);
    800077fc:	0001e517          	auipc	a0,0x1e
    80007800:	6a450513          	addi	a0,a0,1700 # 80025ea0 <log>
    80007804:	ffffa097          	auipc	ra,0xffffa
    80007808:	ace080e7          	jalr	-1330(ra) # 800012d2 <release>
  }
}
    8000780c:	0001                	nop
    8000780e:	60e2                	ld	ra,24(sp)
    80007810:	6442                	ld	s0,16(sp)
    80007812:	6105                	addi	sp,sp,32
    80007814:	8082                	ret

0000000080007816 <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    80007816:	7179                	addi	sp,sp,-48
    80007818:	f406                	sd	ra,40(sp)
    8000781a:	f022                	sd	s0,32(sp)
    8000781c:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    8000781e:	fe042623          	sw	zero,-20(s0)
    80007822:	a86d                	j	800078dc <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    80007824:	0001e797          	auipc	a5,0x1e
    80007828:	67c78793          	addi	a5,a5,1660 # 80025ea0 <log>
    8000782c:	579c                	lw	a5,40(a5)
    8000782e:	0007869b          	sext.w	a3,a5
    80007832:	0001e797          	auipc	a5,0x1e
    80007836:	66e78793          	addi	a5,a5,1646 # 80025ea0 <log>
    8000783a:	4f9c                	lw	a5,24(a5)
    8000783c:	fec42703          	lw	a4,-20(s0)
    80007840:	9fb9                	addw	a5,a5,a4
    80007842:	2781                	sext.w	a5,a5
    80007844:	2785                	addiw	a5,a5,1
    80007846:	2781                	sext.w	a5,a5
    80007848:	2781                	sext.w	a5,a5
    8000784a:	85be                	mv	a1,a5
    8000784c:	8536                	mv	a0,a3
    8000784e:	ffffe097          	auipc	ra,0xffffe
    80007852:	3dc080e7          	jalr	988(ra) # 80005c2a <bread>
    80007856:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    8000785a:	0001e797          	auipc	a5,0x1e
    8000785e:	64678793          	addi	a5,a5,1606 # 80025ea0 <log>
    80007862:	579c                	lw	a5,40(a5)
    80007864:	0007869b          	sext.w	a3,a5
    80007868:	0001e717          	auipc	a4,0x1e
    8000786c:	63870713          	addi	a4,a4,1592 # 80025ea0 <log>
    80007870:	fec42783          	lw	a5,-20(s0)
    80007874:	07a1                	addi	a5,a5,8
    80007876:	078a                	slli	a5,a5,0x2
    80007878:	97ba                	add	a5,a5,a4
    8000787a:	4b9c                	lw	a5,16(a5)
    8000787c:	2781                	sext.w	a5,a5
    8000787e:	85be                	mv	a1,a5
    80007880:	8536                	mv	a0,a3
    80007882:	ffffe097          	auipc	ra,0xffffe
    80007886:	3a8080e7          	jalr	936(ra) # 80005c2a <bread>
    8000788a:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    8000788e:	fe043783          	ld	a5,-32(s0)
    80007892:	05878713          	addi	a4,a5,88
    80007896:	fd843783          	ld	a5,-40(s0)
    8000789a:	05878793          	addi	a5,a5,88
    8000789e:	40000613          	li	a2,1024
    800078a2:	85be                	mv	a1,a5
    800078a4:	853a                	mv	a0,a4
    800078a6:	ffffa097          	auipc	ra,0xffffa
    800078aa:	c80080e7          	jalr	-896(ra) # 80001526 <memmove>
    bwrite(to);  // write the log
    800078ae:	fe043503          	ld	a0,-32(s0)
    800078b2:	ffffe097          	auipc	ra,0xffffe
    800078b6:	3d2080e7          	jalr	978(ra) # 80005c84 <bwrite>
    brelse(from);
    800078ba:	fd843503          	ld	a0,-40(s0)
    800078be:	ffffe097          	auipc	ra,0xffffe
    800078c2:	40e080e7          	jalr	1038(ra) # 80005ccc <brelse>
    brelse(to);
    800078c6:	fe043503          	ld	a0,-32(s0)
    800078ca:	ffffe097          	auipc	ra,0xffffe
    800078ce:	402080e7          	jalr	1026(ra) # 80005ccc <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800078d2:	fec42783          	lw	a5,-20(s0)
    800078d6:	2785                	addiw	a5,a5,1
    800078d8:	fef42623          	sw	a5,-20(s0)
    800078dc:	0001e797          	auipc	a5,0x1e
    800078e0:	5c478793          	addi	a5,a5,1476 # 80025ea0 <log>
    800078e4:	57d8                	lw	a4,44(a5)
    800078e6:	fec42783          	lw	a5,-20(s0)
    800078ea:	2781                	sext.w	a5,a5
    800078ec:	f2e7cce3          	blt	a5,a4,80007824 <write_log+0xe>
  }
}
    800078f0:	0001                	nop
    800078f2:	0001                	nop
    800078f4:	70a2                	ld	ra,40(sp)
    800078f6:	7402                	ld	s0,32(sp)
    800078f8:	6145                	addi	sp,sp,48
    800078fa:	8082                	ret

00000000800078fc <commit>:

static void
commit()
{
    800078fc:	1141                	addi	sp,sp,-16
    800078fe:	e406                	sd	ra,8(sp)
    80007900:	e022                	sd	s0,0(sp)
    80007902:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    80007904:	0001e797          	auipc	a5,0x1e
    80007908:	59c78793          	addi	a5,a5,1436 # 80025ea0 <log>
    8000790c:	57dc                	lw	a5,44(a5)
    8000790e:	02f05963          	blez	a5,80007940 <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    80007912:	00000097          	auipc	ra,0x0
    80007916:	f04080e7          	jalr	-252(ra) # 80007816 <write_log>
    write_head();    // Write header to disk -- the real commit
    8000791a:	00000097          	auipc	ra,0x0
    8000791e:	c64080e7          	jalr	-924(ra) # 8000757e <write_head>
    install_trans(0); // Now install writes to home locations
    80007922:	4501                	li	a0,0
    80007924:	00000097          	auipc	ra,0x0
    80007928:	ab0080e7          	jalr	-1360(ra) # 800073d4 <install_trans>
    log.lh.n = 0;
    8000792c:	0001e797          	auipc	a5,0x1e
    80007930:	57478793          	addi	a5,a5,1396 # 80025ea0 <log>
    80007934:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    80007938:	00000097          	auipc	ra,0x0
    8000793c:	c46080e7          	jalr	-954(ra) # 8000757e <write_head>
  }
}
    80007940:	0001                	nop
    80007942:	60a2                	ld	ra,8(sp)
    80007944:	6402                	ld	s0,0(sp)
    80007946:	0141                	addi	sp,sp,16
    80007948:	8082                	ret

000000008000794a <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    8000794a:	7179                	addi	sp,sp,-48
    8000794c:	f406                	sd	ra,40(sp)
    8000794e:	f022                	sd	s0,32(sp)
    80007950:	1800                	addi	s0,sp,48
    80007952:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    80007956:	0001e517          	auipc	a0,0x1e
    8000795a:	54a50513          	addi	a0,a0,1354 # 80025ea0 <log>
    8000795e:	ffffa097          	auipc	ra,0xffffa
    80007962:	910080e7          	jalr	-1776(ra) # 8000126e <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    80007966:	0001e797          	auipc	a5,0x1e
    8000796a:	53a78793          	addi	a5,a5,1338 # 80025ea0 <log>
    8000796e:	57dc                	lw	a5,44(a5)
    80007970:	873e                	mv	a4,a5
    80007972:	47f5                	li	a5,29
    80007974:	02e7c063          	blt	a5,a4,80007994 <log_write+0x4a>
    80007978:	0001e797          	auipc	a5,0x1e
    8000797c:	52878793          	addi	a5,a5,1320 # 80025ea0 <log>
    80007980:	57d8                	lw	a4,44(a5)
    80007982:	0001e797          	auipc	a5,0x1e
    80007986:	51e78793          	addi	a5,a5,1310 # 80025ea0 <log>
    8000798a:	4fdc                	lw	a5,28(a5)
    8000798c:	37fd                	addiw	a5,a5,-1
    8000798e:	2781                	sext.w	a5,a5
    80007990:	00f74a63          	blt	a4,a5,800079a4 <log_write+0x5a>
    panic("too big a transaction");
    80007994:	00005517          	auipc	a0,0x5
    80007998:	bcc50513          	addi	a0,a0,-1076 # 8000c560 <etext+0x560>
    8000799c:	ffff9097          	auipc	ra,0xffff9
    800079a0:	2e2080e7          	jalr	738(ra) # 80000c7e <panic>
  if (log.outstanding < 1)
    800079a4:	0001e797          	auipc	a5,0x1e
    800079a8:	4fc78793          	addi	a5,a5,1276 # 80025ea0 <log>
    800079ac:	539c                	lw	a5,32(a5)
    800079ae:	00f04a63          	bgtz	a5,800079c2 <log_write+0x78>
    panic("log_write outside of trans");
    800079b2:	00005517          	auipc	a0,0x5
    800079b6:	bc650513          	addi	a0,a0,-1082 # 8000c578 <etext+0x578>
    800079ba:	ffff9097          	auipc	ra,0xffff9
    800079be:	2c4080e7          	jalr	708(ra) # 80000c7e <panic>

  for (i = 0; i < log.lh.n; i++) {
    800079c2:	fe042623          	sw	zero,-20(s0)
    800079c6:	a03d                	j	800079f4 <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    800079c8:	0001e717          	auipc	a4,0x1e
    800079cc:	4d870713          	addi	a4,a4,1240 # 80025ea0 <log>
    800079d0:	fec42783          	lw	a5,-20(s0)
    800079d4:	07a1                	addi	a5,a5,8
    800079d6:	078a                	slli	a5,a5,0x2
    800079d8:	97ba                	add	a5,a5,a4
    800079da:	4b9c                	lw	a5,16(a5)
    800079dc:	0007871b          	sext.w	a4,a5
    800079e0:	fd843783          	ld	a5,-40(s0)
    800079e4:	47dc                	lw	a5,12(a5)
    800079e6:	02f70263          	beq	a4,a5,80007a0a <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    800079ea:	fec42783          	lw	a5,-20(s0)
    800079ee:	2785                	addiw	a5,a5,1
    800079f0:	fef42623          	sw	a5,-20(s0)
    800079f4:	0001e797          	auipc	a5,0x1e
    800079f8:	4ac78793          	addi	a5,a5,1196 # 80025ea0 <log>
    800079fc:	57d8                	lw	a4,44(a5)
    800079fe:	fec42783          	lw	a5,-20(s0)
    80007a02:	2781                	sext.w	a5,a5
    80007a04:	fce7c2e3          	blt	a5,a4,800079c8 <log_write+0x7e>
    80007a08:	a011                	j	80007a0c <log_write+0xc2>
      break;
    80007a0a:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    80007a0c:	fd843783          	ld	a5,-40(s0)
    80007a10:	47dc                	lw	a5,12(a5)
    80007a12:	0007871b          	sext.w	a4,a5
    80007a16:	0001e697          	auipc	a3,0x1e
    80007a1a:	48a68693          	addi	a3,a3,1162 # 80025ea0 <log>
    80007a1e:	fec42783          	lw	a5,-20(s0)
    80007a22:	07a1                	addi	a5,a5,8
    80007a24:	078a                	slli	a5,a5,0x2
    80007a26:	97b6                	add	a5,a5,a3
    80007a28:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    80007a2a:	0001e797          	auipc	a5,0x1e
    80007a2e:	47678793          	addi	a5,a5,1142 # 80025ea0 <log>
    80007a32:	57d8                	lw	a4,44(a5)
    80007a34:	fec42783          	lw	a5,-20(s0)
    80007a38:	2781                	sext.w	a5,a5
    80007a3a:	02e79563          	bne	a5,a4,80007a64 <log_write+0x11a>
    bpin(b);
    80007a3e:	fd843503          	ld	a0,-40(s0)
    80007a42:	ffffe097          	auipc	ra,0xffffe
    80007a46:	378080e7          	jalr	888(ra) # 80005dba <bpin>
    log.lh.n++;
    80007a4a:	0001e797          	auipc	a5,0x1e
    80007a4e:	45678793          	addi	a5,a5,1110 # 80025ea0 <log>
    80007a52:	57dc                	lw	a5,44(a5)
    80007a54:	2785                	addiw	a5,a5,1
    80007a56:	0007871b          	sext.w	a4,a5
    80007a5a:	0001e797          	auipc	a5,0x1e
    80007a5e:	44678793          	addi	a5,a5,1094 # 80025ea0 <log>
    80007a62:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    80007a64:	0001e517          	auipc	a0,0x1e
    80007a68:	43c50513          	addi	a0,a0,1084 # 80025ea0 <log>
    80007a6c:	ffffa097          	auipc	ra,0xffffa
    80007a70:	866080e7          	jalr	-1946(ra) # 800012d2 <release>
}
    80007a74:	0001                	nop
    80007a76:	70a2                	ld	ra,40(sp)
    80007a78:	7402                	ld	s0,32(sp)
    80007a7a:	6145                	addi	sp,sp,48
    80007a7c:	8082                	ret

0000000080007a7e <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80007a7e:	1101                	addi	sp,sp,-32
    80007a80:	ec06                	sd	ra,24(sp)
    80007a82:	e822                	sd	s0,16(sp)
    80007a84:	1000                	addi	s0,sp,32
    80007a86:	fea43423          	sd	a0,-24(s0)
    80007a8a:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    80007a8e:	fe843783          	ld	a5,-24(s0)
    80007a92:	07a1                	addi	a5,a5,8
    80007a94:	00005597          	auipc	a1,0x5
    80007a98:	b0458593          	addi	a1,a1,-1276 # 8000c598 <etext+0x598>
    80007a9c:	853e                	mv	a0,a5
    80007a9e:	ffff9097          	auipc	ra,0xffff9
    80007aa2:	7a0080e7          	jalr	1952(ra) # 8000123e <initlock>
  lk->name = name;
    80007aa6:	fe843783          	ld	a5,-24(s0)
    80007aaa:	fe043703          	ld	a4,-32(s0)
    80007aae:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    80007ab0:	fe843783          	ld	a5,-24(s0)
    80007ab4:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80007ab8:	fe843783          	ld	a5,-24(s0)
    80007abc:	0207a423          	sw	zero,40(a5)
}
    80007ac0:	0001                	nop
    80007ac2:	60e2                	ld	ra,24(sp)
    80007ac4:	6442                	ld	s0,16(sp)
    80007ac6:	6105                	addi	sp,sp,32
    80007ac8:	8082                	ret

0000000080007aca <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80007aca:	1101                	addi	sp,sp,-32
    80007acc:	ec06                	sd	ra,24(sp)
    80007ace:	e822                	sd	s0,16(sp)
    80007ad0:	1000                	addi	s0,sp,32
    80007ad2:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80007ad6:	fe843783          	ld	a5,-24(s0)
    80007ada:	07a1                	addi	a5,a5,8
    80007adc:	853e                	mv	a0,a5
    80007ade:	ffff9097          	auipc	ra,0xffff9
    80007ae2:	790080e7          	jalr	1936(ra) # 8000126e <acquire>
  while (lk->locked) {
    80007ae6:	a819                	j	80007afc <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    80007ae8:	fe843783          	ld	a5,-24(s0)
    80007aec:	07a1                	addi	a5,a5,8
    80007aee:	85be                	mv	a1,a5
    80007af0:	fe843503          	ld	a0,-24(s0)
    80007af4:	ffffd097          	auipc	ra,0xffffd
    80007af8:	d82080e7          	jalr	-638(ra) # 80004876 <sleep>
  while (lk->locked) {
    80007afc:	fe843783          	ld	a5,-24(s0)
    80007b00:	439c                	lw	a5,0(a5)
    80007b02:	f3fd                	bnez	a5,80007ae8 <acquiresleep+0x1e>
  }
  lk->locked = 1;
    80007b04:	fe843783          	ld	a5,-24(s0)
    80007b08:	4705                	li	a4,1
    80007b0a:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    80007b0c:	ffffb097          	auipc	ra,0xffffb
    80007b10:	d20080e7          	jalr	-736(ra) # 8000282c <myproc>
    80007b14:	87aa                	mv	a5,a0
    80007b16:	5b98                	lw	a4,48(a5)
    80007b18:	fe843783          	ld	a5,-24(s0)
    80007b1c:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    80007b1e:	fe843783          	ld	a5,-24(s0)
    80007b22:	07a1                	addi	a5,a5,8
    80007b24:	853e                	mv	a0,a5
    80007b26:	ffff9097          	auipc	ra,0xffff9
    80007b2a:	7ac080e7          	jalr	1964(ra) # 800012d2 <release>
}
    80007b2e:	0001                	nop
    80007b30:	60e2                	ld	ra,24(sp)
    80007b32:	6442                	ld	s0,16(sp)
    80007b34:	6105                	addi	sp,sp,32
    80007b36:	8082                	ret

0000000080007b38 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80007b38:	1101                	addi	sp,sp,-32
    80007b3a:	ec06                	sd	ra,24(sp)
    80007b3c:	e822                	sd	s0,16(sp)
    80007b3e:	1000                	addi	s0,sp,32
    80007b40:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80007b44:	fe843783          	ld	a5,-24(s0)
    80007b48:	07a1                	addi	a5,a5,8
    80007b4a:	853e                	mv	a0,a5
    80007b4c:	ffff9097          	auipc	ra,0xffff9
    80007b50:	722080e7          	jalr	1826(ra) # 8000126e <acquire>
  lk->locked = 0;
    80007b54:	fe843783          	ld	a5,-24(s0)
    80007b58:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80007b5c:	fe843783          	ld	a5,-24(s0)
    80007b60:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    80007b64:	fe843503          	ld	a0,-24(s0)
    80007b68:	ffffd097          	auipc	ra,0xffffd
    80007b6c:	db0080e7          	jalr	-592(ra) # 80004918 <wakeup>
  release(&lk->lk);
    80007b70:	fe843783          	ld	a5,-24(s0)
    80007b74:	07a1                	addi	a5,a5,8
    80007b76:	853e                	mv	a0,a5
    80007b78:	ffff9097          	auipc	ra,0xffff9
    80007b7c:	75a080e7          	jalr	1882(ra) # 800012d2 <release>
}
    80007b80:	0001                	nop
    80007b82:	60e2                	ld	ra,24(sp)
    80007b84:	6442                	ld	s0,16(sp)
    80007b86:	6105                	addi	sp,sp,32
    80007b88:	8082                	ret

0000000080007b8a <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80007b8a:	7139                	addi	sp,sp,-64
    80007b8c:	fc06                	sd	ra,56(sp)
    80007b8e:	f822                	sd	s0,48(sp)
    80007b90:	f426                	sd	s1,40(sp)
    80007b92:	0080                	addi	s0,sp,64
    80007b94:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    80007b98:	fc843783          	ld	a5,-56(s0)
    80007b9c:	07a1                	addi	a5,a5,8
    80007b9e:	853e                	mv	a0,a5
    80007ba0:	ffff9097          	auipc	ra,0xffff9
    80007ba4:	6ce080e7          	jalr	1742(ra) # 8000126e <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80007ba8:	fc843783          	ld	a5,-56(s0)
    80007bac:	439c                	lw	a5,0(a5)
    80007bae:	cf99                	beqz	a5,80007bcc <holdingsleep+0x42>
    80007bb0:	fc843783          	ld	a5,-56(s0)
    80007bb4:	5784                	lw	s1,40(a5)
    80007bb6:	ffffb097          	auipc	ra,0xffffb
    80007bba:	c76080e7          	jalr	-906(ra) # 8000282c <myproc>
    80007bbe:	87aa                	mv	a5,a0
    80007bc0:	5b9c                	lw	a5,48(a5)
    80007bc2:	8726                	mv	a4,s1
    80007bc4:	00f71463          	bne	a4,a5,80007bcc <holdingsleep+0x42>
    80007bc8:	4785                	li	a5,1
    80007bca:	a011                	j	80007bce <holdingsleep+0x44>
    80007bcc:	4781                	li	a5,0
    80007bce:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    80007bd2:	fc843783          	ld	a5,-56(s0)
    80007bd6:	07a1                	addi	a5,a5,8
    80007bd8:	853e                	mv	a0,a5
    80007bda:	ffff9097          	auipc	ra,0xffff9
    80007bde:	6f8080e7          	jalr	1784(ra) # 800012d2 <release>
  return r;
    80007be2:	fdc42783          	lw	a5,-36(s0)
}
    80007be6:	853e                	mv	a0,a5
    80007be8:	70e2                	ld	ra,56(sp)
    80007bea:	7442                	ld	s0,48(sp)
    80007bec:	74a2                	ld	s1,40(sp)
    80007bee:	6121                	addi	sp,sp,64
    80007bf0:	8082                	ret

0000000080007bf2 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80007bf2:	1141                	addi	sp,sp,-16
    80007bf4:	e406                	sd	ra,8(sp)
    80007bf6:	e022                	sd	s0,0(sp)
    80007bf8:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    80007bfa:	00005597          	auipc	a1,0x5
    80007bfe:	9ae58593          	addi	a1,a1,-1618 # 8000c5a8 <etext+0x5a8>
    80007c02:	0001e517          	auipc	a0,0x1e
    80007c06:	3e650513          	addi	a0,a0,998 # 80025fe8 <ftable>
    80007c0a:	ffff9097          	auipc	ra,0xffff9
    80007c0e:	634080e7          	jalr	1588(ra) # 8000123e <initlock>
}
    80007c12:	0001                	nop
    80007c14:	60a2                	ld	ra,8(sp)
    80007c16:	6402                	ld	s0,0(sp)
    80007c18:	0141                	addi	sp,sp,16
    80007c1a:	8082                	ret

0000000080007c1c <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80007c1c:	1101                	addi	sp,sp,-32
    80007c1e:	ec06                	sd	ra,24(sp)
    80007c20:	e822                	sd	s0,16(sp)
    80007c22:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80007c24:	0001e517          	auipc	a0,0x1e
    80007c28:	3c450513          	addi	a0,a0,964 # 80025fe8 <ftable>
    80007c2c:	ffff9097          	auipc	ra,0xffff9
    80007c30:	642080e7          	jalr	1602(ra) # 8000126e <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80007c34:	0001e797          	auipc	a5,0x1e
    80007c38:	3cc78793          	addi	a5,a5,972 # 80026000 <ftable+0x18>
    80007c3c:	fef43423          	sd	a5,-24(s0)
    80007c40:	a815                	j	80007c74 <filealloc+0x58>
    if(f->ref == 0){
    80007c42:	fe843783          	ld	a5,-24(s0)
    80007c46:	43dc                	lw	a5,4(a5)
    80007c48:	e385                	bnez	a5,80007c68 <filealloc+0x4c>
      f->ref = 1;
    80007c4a:	fe843783          	ld	a5,-24(s0)
    80007c4e:	4705                	li	a4,1
    80007c50:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    80007c52:	0001e517          	auipc	a0,0x1e
    80007c56:	39650513          	addi	a0,a0,918 # 80025fe8 <ftable>
    80007c5a:	ffff9097          	auipc	ra,0xffff9
    80007c5e:	678080e7          	jalr	1656(ra) # 800012d2 <release>
      return f;
    80007c62:	fe843783          	ld	a5,-24(s0)
    80007c66:	a805                	j	80007c96 <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80007c68:	fe843783          	ld	a5,-24(s0)
    80007c6c:	02878793          	addi	a5,a5,40
    80007c70:	fef43423          	sd	a5,-24(s0)
    80007c74:	0001f797          	auipc	a5,0x1f
    80007c78:	32c78793          	addi	a5,a5,812 # 80026fa0 <ftable+0xfb8>
    80007c7c:	fe843703          	ld	a4,-24(s0)
    80007c80:	fcf761e3          	bltu	a4,a5,80007c42 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    80007c84:	0001e517          	auipc	a0,0x1e
    80007c88:	36450513          	addi	a0,a0,868 # 80025fe8 <ftable>
    80007c8c:	ffff9097          	auipc	ra,0xffff9
    80007c90:	646080e7          	jalr	1606(ra) # 800012d2 <release>
  return 0;
    80007c94:	4781                	li	a5,0
}
    80007c96:	853e                	mv	a0,a5
    80007c98:	60e2                	ld	ra,24(sp)
    80007c9a:	6442                	ld	s0,16(sp)
    80007c9c:	6105                	addi	sp,sp,32
    80007c9e:	8082                	ret

0000000080007ca0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80007ca0:	1101                	addi	sp,sp,-32
    80007ca2:	ec06                	sd	ra,24(sp)
    80007ca4:	e822                	sd	s0,16(sp)
    80007ca6:	1000                	addi	s0,sp,32
    80007ca8:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    80007cac:	0001e517          	auipc	a0,0x1e
    80007cb0:	33c50513          	addi	a0,a0,828 # 80025fe8 <ftable>
    80007cb4:	ffff9097          	auipc	ra,0xffff9
    80007cb8:	5ba080e7          	jalr	1466(ra) # 8000126e <acquire>
  if(f->ref < 1)
    80007cbc:	fe843783          	ld	a5,-24(s0)
    80007cc0:	43dc                	lw	a5,4(a5)
    80007cc2:	00f04a63          	bgtz	a5,80007cd6 <filedup+0x36>
    panic("filedup");
    80007cc6:	00005517          	auipc	a0,0x5
    80007cca:	8ea50513          	addi	a0,a0,-1814 # 8000c5b0 <etext+0x5b0>
    80007cce:	ffff9097          	auipc	ra,0xffff9
    80007cd2:	fb0080e7          	jalr	-80(ra) # 80000c7e <panic>
  f->ref++;
    80007cd6:	fe843783          	ld	a5,-24(s0)
    80007cda:	43dc                	lw	a5,4(a5)
    80007cdc:	2785                	addiw	a5,a5,1
    80007cde:	0007871b          	sext.w	a4,a5
    80007ce2:	fe843783          	ld	a5,-24(s0)
    80007ce6:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80007ce8:	0001e517          	auipc	a0,0x1e
    80007cec:	30050513          	addi	a0,a0,768 # 80025fe8 <ftable>
    80007cf0:	ffff9097          	auipc	ra,0xffff9
    80007cf4:	5e2080e7          	jalr	1506(ra) # 800012d2 <release>
  return f;
    80007cf8:	fe843783          	ld	a5,-24(s0)
}
    80007cfc:	853e                	mv	a0,a5
    80007cfe:	60e2                	ld	ra,24(sp)
    80007d00:	6442                	ld	s0,16(sp)
    80007d02:	6105                	addi	sp,sp,32
    80007d04:	8082                	ret

0000000080007d06 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80007d06:	715d                	addi	sp,sp,-80
    80007d08:	e486                	sd	ra,72(sp)
    80007d0a:	e0a2                	sd	s0,64(sp)
    80007d0c:	0880                	addi	s0,sp,80
    80007d0e:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    80007d12:	0001e517          	auipc	a0,0x1e
    80007d16:	2d650513          	addi	a0,a0,726 # 80025fe8 <ftable>
    80007d1a:	ffff9097          	auipc	ra,0xffff9
    80007d1e:	554080e7          	jalr	1364(ra) # 8000126e <acquire>
  if(f->ref < 1)
    80007d22:	fb843783          	ld	a5,-72(s0)
    80007d26:	43dc                	lw	a5,4(a5)
    80007d28:	00f04a63          	bgtz	a5,80007d3c <fileclose+0x36>
    panic("fileclose");
    80007d2c:	00005517          	auipc	a0,0x5
    80007d30:	88c50513          	addi	a0,a0,-1908 # 8000c5b8 <etext+0x5b8>
    80007d34:	ffff9097          	auipc	ra,0xffff9
    80007d38:	f4a080e7          	jalr	-182(ra) # 80000c7e <panic>
  if(--f->ref > 0){
    80007d3c:	fb843783          	ld	a5,-72(s0)
    80007d40:	43dc                	lw	a5,4(a5)
    80007d42:	37fd                	addiw	a5,a5,-1
    80007d44:	0007871b          	sext.w	a4,a5
    80007d48:	fb843783          	ld	a5,-72(s0)
    80007d4c:	c3d8                	sw	a4,4(a5)
    80007d4e:	fb843783          	ld	a5,-72(s0)
    80007d52:	43dc                	lw	a5,4(a5)
    80007d54:	00f05b63          	blez	a5,80007d6a <fileclose+0x64>
    release(&ftable.lock);
    80007d58:	0001e517          	auipc	a0,0x1e
    80007d5c:	29050513          	addi	a0,a0,656 # 80025fe8 <ftable>
    80007d60:	ffff9097          	auipc	ra,0xffff9
    80007d64:	572080e7          	jalr	1394(ra) # 800012d2 <release>
    80007d68:	a879                	j	80007e06 <fileclose+0x100>
    return;
  }
  ff = *f;
    80007d6a:	fb843783          	ld	a5,-72(s0)
    80007d6e:	638c                	ld	a1,0(a5)
    80007d70:	6790                	ld	a2,8(a5)
    80007d72:	6b94                	ld	a3,16(a5)
    80007d74:	6f98                	ld	a4,24(a5)
    80007d76:	739c                	ld	a5,32(a5)
    80007d78:	fcb43423          	sd	a1,-56(s0)
    80007d7c:	fcc43823          	sd	a2,-48(s0)
    80007d80:	fcd43c23          	sd	a3,-40(s0)
    80007d84:	fee43023          	sd	a4,-32(s0)
    80007d88:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    80007d8c:	fb843783          	ld	a5,-72(s0)
    80007d90:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80007d94:	fb843783          	ld	a5,-72(s0)
    80007d98:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    80007d9c:	0001e517          	auipc	a0,0x1e
    80007da0:	24c50513          	addi	a0,a0,588 # 80025fe8 <ftable>
    80007da4:	ffff9097          	auipc	ra,0xffff9
    80007da8:	52e080e7          	jalr	1326(ra) # 800012d2 <release>

  if(ff.type == FD_PIPE){
    80007dac:	fc842783          	lw	a5,-56(s0)
    80007db0:	873e                	mv	a4,a5
    80007db2:	4785                	li	a5,1
    80007db4:	00f71e63          	bne	a4,a5,80007dd0 <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80007db8:	fd843783          	ld	a5,-40(s0)
    80007dbc:	fd144703          	lbu	a4,-47(s0)
    80007dc0:	2701                	sext.w	a4,a4
    80007dc2:	85ba                	mv	a1,a4
    80007dc4:	853e                	mv	a0,a5
    80007dc6:	00000097          	auipc	ra,0x0
    80007dca:	5aa080e7          	jalr	1450(ra) # 80008370 <pipeclose>
    80007dce:	a825                	j	80007e06 <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80007dd0:	fc842783          	lw	a5,-56(s0)
    80007dd4:	873e                	mv	a4,a5
    80007dd6:	4789                	li	a5,2
    80007dd8:	00f70863          	beq	a4,a5,80007de8 <fileclose+0xe2>
    80007ddc:	fc842783          	lw	a5,-56(s0)
    80007de0:	873e                	mv	a4,a5
    80007de2:	478d                	li	a5,3
    80007de4:	02f71163          	bne	a4,a5,80007e06 <fileclose+0x100>
    begin_op();
    80007de8:	00000097          	auipc	ra,0x0
    80007dec:	884080e7          	jalr	-1916(ra) # 8000766c <begin_op>
    iput(ff.ip);
    80007df0:	fe043783          	ld	a5,-32(s0)
    80007df4:	853e                	mv	a0,a5
    80007df6:	fffff097          	auipc	ra,0xfffff
    80007dfa:	9aa080e7          	jalr	-1622(ra) # 800067a0 <iput>
    end_op();
    80007dfe:	00000097          	auipc	ra,0x0
    80007e02:	930080e7          	jalr	-1744(ra) # 8000772e <end_op>
  }
}
    80007e06:	60a6                	ld	ra,72(sp)
    80007e08:	6406                	ld	s0,64(sp)
    80007e0a:	6161                	addi	sp,sp,80
    80007e0c:	8082                	ret

0000000080007e0e <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80007e0e:	7139                	addi	sp,sp,-64
    80007e10:	fc06                	sd	ra,56(sp)
    80007e12:	f822                	sd	s0,48(sp)
    80007e14:	0080                	addi	s0,sp,64
    80007e16:	fca43423          	sd	a0,-56(s0)
    80007e1a:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80007e1e:	ffffb097          	auipc	ra,0xffffb
    80007e22:	a0e080e7          	jalr	-1522(ra) # 8000282c <myproc>
    80007e26:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80007e2a:	fc843783          	ld	a5,-56(s0)
    80007e2e:	439c                	lw	a5,0(a5)
    80007e30:	873e                	mv	a4,a5
    80007e32:	4789                	li	a5,2
    80007e34:	00f70963          	beq	a4,a5,80007e46 <filestat+0x38>
    80007e38:	fc843783          	ld	a5,-56(s0)
    80007e3c:	439c                	lw	a5,0(a5)
    80007e3e:	873e                	mv	a4,a5
    80007e40:	478d                	li	a5,3
    80007e42:	06f71263          	bne	a4,a5,80007ea6 <filestat+0x98>
    ilock(f->ip);
    80007e46:	fc843783          	ld	a5,-56(s0)
    80007e4a:	6f9c                	ld	a5,24(a5)
    80007e4c:	853e                	mv	a0,a5
    80007e4e:	ffffe097          	auipc	ra,0xffffe
    80007e52:	7c4080e7          	jalr	1988(ra) # 80006612 <ilock>
    stati(f->ip, &st);
    80007e56:	fc843783          	ld	a5,-56(s0)
    80007e5a:	6f9c                	ld	a5,24(a5)
    80007e5c:	fd040713          	addi	a4,s0,-48
    80007e60:	85ba                	mv	a1,a4
    80007e62:	853e                	mv	a0,a5
    80007e64:	fffff097          	auipc	ra,0xfffff
    80007e68:	ce0080e7          	jalr	-800(ra) # 80006b44 <stati>
    iunlock(f->ip);
    80007e6c:	fc843783          	ld	a5,-56(s0)
    80007e70:	6f9c                	ld	a5,24(a5)
    80007e72:	853e                	mv	a0,a5
    80007e74:	fffff097          	auipc	ra,0xfffff
    80007e78:	8d2080e7          	jalr	-1838(ra) # 80006746 <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80007e7c:	fe843783          	ld	a5,-24(s0)
    80007e80:	6bbc                	ld	a5,80(a5)
    80007e82:	fd040713          	addi	a4,s0,-48
    80007e86:	46e1                	li	a3,24
    80007e88:	863a                	mv	a2,a4
    80007e8a:	fc043583          	ld	a1,-64(s0)
    80007e8e:	853e                	mv	a0,a5
    80007e90:	ffffa097          	auipc	ra,0xffffa
    80007e94:	456080e7          	jalr	1110(ra) # 800022e6 <copyout>
    80007e98:	87aa                	mv	a5,a0
    80007e9a:	0007d463          	bgez	a5,80007ea2 <filestat+0x94>
      return -1;
    80007e9e:	57fd                	li	a5,-1
    80007ea0:	a021                	j	80007ea8 <filestat+0x9a>
    return 0;
    80007ea2:	4781                	li	a5,0
    80007ea4:	a011                	j	80007ea8 <filestat+0x9a>
  }
  return -1;
    80007ea6:	57fd                	li	a5,-1
}
    80007ea8:	853e                	mv	a0,a5
    80007eaa:	70e2                	ld	ra,56(sp)
    80007eac:	7442                	ld	s0,48(sp)
    80007eae:	6121                	addi	sp,sp,64
    80007eb0:	8082                	ret

0000000080007eb2 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80007eb2:	7139                	addi	sp,sp,-64
    80007eb4:	fc06                	sd	ra,56(sp)
    80007eb6:	f822                	sd	s0,48(sp)
    80007eb8:	0080                	addi	s0,sp,64
    80007eba:	fca43c23          	sd	a0,-40(s0)
    80007ebe:	fcb43823          	sd	a1,-48(s0)
    80007ec2:	87b2                	mv	a5,a2
    80007ec4:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80007ec8:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80007ecc:	fd843783          	ld	a5,-40(s0)
    80007ed0:	0087c783          	lbu	a5,8(a5)
    80007ed4:	e399                	bnez	a5,80007eda <fileread+0x28>
    return -1;
    80007ed6:	57fd                	li	a5,-1
    80007ed8:	aa1d                	j	8000800e <fileread+0x15c>

  if(f->type == FD_PIPE){
    80007eda:	fd843783          	ld	a5,-40(s0)
    80007ede:	439c                	lw	a5,0(a5)
    80007ee0:	873e                	mv	a4,a5
    80007ee2:	4785                	li	a5,1
    80007ee4:	02f71363          	bne	a4,a5,80007f0a <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80007ee8:	fd843783          	ld	a5,-40(s0)
    80007eec:	6b9c                	ld	a5,16(a5)
    80007eee:	fcc42703          	lw	a4,-52(s0)
    80007ef2:	863a                	mv	a2,a4
    80007ef4:	fd043583          	ld	a1,-48(s0)
    80007ef8:	853e                	mv	a0,a5
    80007efa:	00000097          	auipc	ra,0x0
    80007efe:	668080e7          	jalr	1640(ra) # 80008562 <piperead>
    80007f02:	87aa                	mv	a5,a0
    80007f04:	fef42623          	sw	a5,-20(s0)
    80007f08:	a209                	j	8000800a <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    80007f0a:	fd843783          	ld	a5,-40(s0)
    80007f0e:	439c                	lw	a5,0(a5)
    80007f10:	873e                	mv	a4,a5
    80007f12:	478d                	li	a5,3
    80007f14:	06f71863          	bne	a4,a5,80007f84 <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80007f18:	fd843783          	ld	a5,-40(s0)
    80007f1c:	02479783          	lh	a5,36(a5)
    80007f20:	2781                	sext.w	a5,a5
    80007f22:	0207c863          	bltz	a5,80007f52 <fileread+0xa0>
    80007f26:	fd843783          	ld	a5,-40(s0)
    80007f2a:	02479783          	lh	a5,36(a5)
    80007f2e:	0007871b          	sext.w	a4,a5
    80007f32:	47a5                	li	a5,9
    80007f34:	00e7cf63          	blt	a5,a4,80007f52 <fileread+0xa0>
    80007f38:	fd843783          	ld	a5,-40(s0)
    80007f3c:	02479783          	lh	a5,36(a5)
    80007f40:	2781                	sext.w	a5,a5
    80007f42:	0001e717          	auipc	a4,0x1e
    80007f46:	00670713          	addi	a4,a4,6 # 80025f48 <devsw>
    80007f4a:	0792                	slli	a5,a5,0x4
    80007f4c:	97ba                	add	a5,a5,a4
    80007f4e:	639c                	ld	a5,0(a5)
    80007f50:	e399                	bnez	a5,80007f56 <fileread+0xa4>
      return -1;
    80007f52:	57fd                	li	a5,-1
    80007f54:	a86d                	j	8000800e <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    80007f56:	fd843783          	ld	a5,-40(s0)
    80007f5a:	02479783          	lh	a5,36(a5)
    80007f5e:	2781                	sext.w	a5,a5
    80007f60:	0001e717          	auipc	a4,0x1e
    80007f64:	fe870713          	addi	a4,a4,-24 # 80025f48 <devsw>
    80007f68:	0792                	slli	a5,a5,0x4
    80007f6a:	97ba                	add	a5,a5,a4
    80007f6c:	6398                	ld	a4,0(a5)
    80007f6e:	fcc42783          	lw	a5,-52(s0)
    80007f72:	863e                	mv	a2,a5
    80007f74:	fd043583          	ld	a1,-48(s0)
    80007f78:	4505                	li	a0,1
    80007f7a:	9702                	jalr	a4
    80007f7c:	87aa                	mv	a5,a0
    80007f7e:	fef42623          	sw	a5,-20(s0)
    80007f82:	a061                	j	8000800a <fileread+0x158>
  } else if(f->type == FD_INODE){
    80007f84:	fd843783          	ld	a5,-40(s0)
    80007f88:	439c                	lw	a5,0(a5)
    80007f8a:	873e                	mv	a4,a5
    80007f8c:	4789                	li	a5,2
    80007f8e:	06f71663          	bne	a4,a5,80007ffa <fileread+0x148>
    ilock(f->ip);
    80007f92:	fd843783          	ld	a5,-40(s0)
    80007f96:	6f9c                	ld	a5,24(a5)
    80007f98:	853e                	mv	a0,a5
    80007f9a:	ffffe097          	auipc	ra,0xffffe
    80007f9e:	678080e7          	jalr	1656(ra) # 80006612 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80007fa2:	fd843783          	ld	a5,-40(s0)
    80007fa6:	6f88                	ld	a0,24(a5)
    80007fa8:	fd843783          	ld	a5,-40(s0)
    80007fac:	539c                	lw	a5,32(a5)
    80007fae:	fcc42703          	lw	a4,-52(s0)
    80007fb2:	86be                	mv	a3,a5
    80007fb4:	fd043603          	ld	a2,-48(s0)
    80007fb8:	4585                	li	a1,1
    80007fba:	fffff097          	auipc	ra,0xfffff
    80007fbe:	bee080e7          	jalr	-1042(ra) # 80006ba8 <readi>
    80007fc2:	87aa                	mv	a5,a0
    80007fc4:	fef42623          	sw	a5,-20(s0)
    80007fc8:	fec42783          	lw	a5,-20(s0)
    80007fcc:	2781                	sext.w	a5,a5
    80007fce:	00f05d63          	blez	a5,80007fe8 <fileread+0x136>
      f->off += r;
    80007fd2:	fd843783          	ld	a5,-40(s0)
    80007fd6:	5398                	lw	a4,32(a5)
    80007fd8:	fec42783          	lw	a5,-20(s0)
    80007fdc:	9fb9                	addw	a5,a5,a4
    80007fde:	0007871b          	sext.w	a4,a5
    80007fe2:	fd843783          	ld	a5,-40(s0)
    80007fe6:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80007fe8:	fd843783          	ld	a5,-40(s0)
    80007fec:	6f9c                	ld	a5,24(a5)
    80007fee:	853e                	mv	a0,a5
    80007ff0:	ffffe097          	auipc	ra,0xffffe
    80007ff4:	756080e7          	jalr	1878(ra) # 80006746 <iunlock>
    80007ff8:	a809                	j	8000800a <fileread+0x158>
  } else {
    panic("fileread");
    80007ffa:	00004517          	auipc	a0,0x4
    80007ffe:	5ce50513          	addi	a0,a0,1486 # 8000c5c8 <etext+0x5c8>
    80008002:	ffff9097          	auipc	ra,0xffff9
    80008006:	c7c080e7          	jalr	-900(ra) # 80000c7e <panic>
  }

  return r;
    8000800a:	fec42783          	lw	a5,-20(s0)
}
    8000800e:	853e                	mv	a0,a5
    80008010:	70e2                	ld	ra,56(sp)
    80008012:	7442                	ld	s0,48(sp)
    80008014:	6121                	addi	sp,sp,64
    80008016:	8082                	ret

0000000080008018 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80008018:	715d                	addi	sp,sp,-80
    8000801a:	e486                	sd	ra,72(sp)
    8000801c:	e0a2                	sd	s0,64(sp)
    8000801e:	0880                	addi	s0,sp,80
    80008020:	fca43423          	sd	a0,-56(s0)
    80008024:	fcb43023          	sd	a1,-64(s0)
    80008028:	87b2                	mv	a5,a2
    8000802a:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    8000802e:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80008032:	fc843783          	ld	a5,-56(s0)
    80008036:	0097c783          	lbu	a5,9(a5)
    8000803a:	e399                	bnez	a5,80008040 <filewrite+0x28>
    return -1;
    8000803c:	57fd                	li	a5,-1
    8000803e:	aad1                	j	80008212 <filewrite+0x1fa>

  if(f->type == FD_PIPE){
    80008040:	fc843783          	ld	a5,-56(s0)
    80008044:	439c                	lw	a5,0(a5)
    80008046:	873e                	mv	a4,a5
    80008048:	4785                	li	a5,1
    8000804a:	02f71363          	bne	a4,a5,80008070 <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    8000804e:	fc843783          	ld	a5,-56(s0)
    80008052:	6b9c                	ld	a5,16(a5)
    80008054:	fbc42703          	lw	a4,-68(s0)
    80008058:	863a                	mv	a2,a4
    8000805a:	fc043583          	ld	a1,-64(s0)
    8000805e:	853e                	mv	a0,a5
    80008060:	00000097          	auipc	ra,0x0
    80008064:	3b8080e7          	jalr	952(ra) # 80008418 <pipewrite>
    80008068:	87aa                	mv	a5,a0
    8000806a:	fef42623          	sw	a5,-20(s0)
    8000806e:	a245                	j	8000820e <filewrite+0x1f6>
  } else if(f->type == FD_DEVICE){
    80008070:	fc843783          	ld	a5,-56(s0)
    80008074:	439c                	lw	a5,0(a5)
    80008076:	873e                	mv	a4,a5
    80008078:	478d                	li	a5,3
    8000807a:	06f71863          	bne	a4,a5,800080ea <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    8000807e:	fc843783          	ld	a5,-56(s0)
    80008082:	02479783          	lh	a5,36(a5)
    80008086:	2781                	sext.w	a5,a5
    80008088:	0207c863          	bltz	a5,800080b8 <filewrite+0xa0>
    8000808c:	fc843783          	ld	a5,-56(s0)
    80008090:	02479783          	lh	a5,36(a5)
    80008094:	0007871b          	sext.w	a4,a5
    80008098:	47a5                	li	a5,9
    8000809a:	00e7cf63          	blt	a5,a4,800080b8 <filewrite+0xa0>
    8000809e:	fc843783          	ld	a5,-56(s0)
    800080a2:	02479783          	lh	a5,36(a5)
    800080a6:	2781                	sext.w	a5,a5
    800080a8:	0001e717          	auipc	a4,0x1e
    800080ac:	ea070713          	addi	a4,a4,-352 # 80025f48 <devsw>
    800080b0:	0792                	slli	a5,a5,0x4
    800080b2:	97ba                	add	a5,a5,a4
    800080b4:	679c                	ld	a5,8(a5)
    800080b6:	e399                	bnez	a5,800080bc <filewrite+0xa4>
      return -1;
    800080b8:	57fd                	li	a5,-1
    800080ba:	aaa1                	j	80008212 <filewrite+0x1fa>
    ret = devsw[f->major].write(1, addr, n);
    800080bc:	fc843783          	ld	a5,-56(s0)
    800080c0:	02479783          	lh	a5,36(a5)
    800080c4:	2781                	sext.w	a5,a5
    800080c6:	0001e717          	auipc	a4,0x1e
    800080ca:	e8270713          	addi	a4,a4,-382 # 80025f48 <devsw>
    800080ce:	0792                	slli	a5,a5,0x4
    800080d0:	97ba                	add	a5,a5,a4
    800080d2:	6798                	ld	a4,8(a5)
    800080d4:	fbc42783          	lw	a5,-68(s0)
    800080d8:	863e                	mv	a2,a5
    800080da:	fc043583          	ld	a1,-64(s0)
    800080de:	4505                	li	a0,1
    800080e0:	9702                	jalr	a4
    800080e2:	87aa                	mv	a5,a0
    800080e4:	fef42623          	sw	a5,-20(s0)
    800080e8:	a21d                	j	8000820e <filewrite+0x1f6>
  } else if(f->type == FD_INODE){
    800080ea:	fc843783          	ld	a5,-56(s0)
    800080ee:	439c                	lw	a5,0(a5)
    800080f0:	873e                	mv	a4,a5
    800080f2:	4789                	li	a5,2
    800080f4:	10f71563          	bne	a4,a5,800081fe <filewrite+0x1e6>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    800080f8:	6785                	lui	a5,0x1
    800080fa:	c007879b          	addiw	a5,a5,-1024
    800080fe:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80008102:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80008106:	a0d9                	j	800081cc <filewrite+0x1b4>
      int n1 = n - i;
    80008108:	fbc42703          	lw	a4,-68(s0)
    8000810c:	fe842783          	lw	a5,-24(s0)
    80008110:	40f707bb          	subw	a5,a4,a5
    80008114:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80008118:	fe442703          	lw	a4,-28(s0)
    8000811c:	fe042783          	lw	a5,-32(s0)
    80008120:	2701                	sext.w	a4,a4
    80008122:	2781                	sext.w	a5,a5
    80008124:	00e7d663          	bge	a5,a4,80008130 <filewrite+0x118>
        n1 = max;
    80008128:	fe042783          	lw	a5,-32(s0)
    8000812c:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80008130:	fffff097          	auipc	ra,0xfffff
    80008134:	53c080e7          	jalr	1340(ra) # 8000766c <begin_op>
      ilock(f->ip);
    80008138:	fc843783          	ld	a5,-56(s0)
    8000813c:	6f9c                	ld	a5,24(a5)
    8000813e:	853e                	mv	a0,a5
    80008140:	ffffe097          	auipc	ra,0xffffe
    80008144:	4d2080e7          	jalr	1234(ra) # 80006612 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80008148:	fc843783          	ld	a5,-56(s0)
    8000814c:	6f88                	ld	a0,24(a5)
    8000814e:	fe842703          	lw	a4,-24(s0)
    80008152:	fc043783          	ld	a5,-64(s0)
    80008156:	00f70633          	add	a2,a4,a5
    8000815a:	fc843783          	ld	a5,-56(s0)
    8000815e:	539c                	lw	a5,32(a5)
    80008160:	fe442703          	lw	a4,-28(s0)
    80008164:	86be                	mv	a3,a5
    80008166:	4585                	li	a1,1
    80008168:	fffff097          	auipc	ra,0xfffff
    8000816c:	bca080e7          	jalr	-1078(ra) # 80006d32 <writei>
    80008170:	87aa                	mv	a5,a0
    80008172:	fcf42e23          	sw	a5,-36(s0)
    80008176:	fdc42783          	lw	a5,-36(s0)
    8000817a:	2781                	sext.w	a5,a5
    8000817c:	00f05d63          	blez	a5,80008196 <filewrite+0x17e>
        f->off += r;
    80008180:	fc843783          	ld	a5,-56(s0)
    80008184:	5398                	lw	a4,32(a5)
    80008186:	fdc42783          	lw	a5,-36(s0)
    8000818a:	9fb9                	addw	a5,a5,a4
    8000818c:	0007871b          	sext.w	a4,a5
    80008190:	fc843783          	ld	a5,-56(s0)
    80008194:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80008196:	fc843783          	ld	a5,-56(s0)
    8000819a:	6f9c                	ld	a5,24(a5)
    8000819c:	853e                	mv	a0,a5
    8000819e:	ffffe097          	auipc	ra,0xffffe
    800081a2:	5a8080e7          	jalr	1448(ra) # 80006746 <iunlock>
      end_op();
    800081a6:	fffff097          	auipc	ra,0xfffff
    800081aa:	588080e7          	jalr	1416(ra) # 8000772e <end_op>

      if(r != n1){
    800081ae:	fdc42703          	lw	a4,-36(s0)
    800081b2:	fe442783          	lw	a5,-28(s0)
    800081b6:	2701                	sext.w	a4,a4
    800081b8:	2781                	sext.w	a5,a5
    800081ba:	02f71263          	bne	a4,a5,800081de <filewrite+0x1c6>
        // error from writei
        break;
      }
      i += r;
    800081be:	fe842703          	lw	a4,-24(s0)
    800081c2:	fdc42783          	lw	a5,-36(s0)
    800081c6:	9fb9                	addw	a5,a5,a4
    800081c8:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    800081cc:	fe842703          	lw	a4,-24(s0)
    800081d0:	fbc42783          	lw	a5,-68(s0)
    800081d4:	2701                	sext.w	a4,a4
    800081d6:	2781                	sext.w	a5,a5
    800081d8:	f2f748e3          	blt	a4,a5,80008108 <filewrite+0xf0>
    800081dc:	a011                	j	800081e0 <filewrite+0x1c8>
        break;
    800081de:	0001                	nop
    }
    ret = (i == n ? n : -1);
    800081e0:	fe842703          	lw	a4,-24(s0)
    800081e4:	fbc42783          	lw	a5,-68(s0)
    800081e8:	2701                	sext.w	a4,a4
    800081ea:	2781                	sext.w	a5,a5
    800081ec:	00f71563          	bne	a4,a5,800081f6 <filewrite+0x1de>
    800081f0:	fbc42783          	lw	a5,-68(s0)
    800081f4:	a011                	j	800081f8 <filewrite+0x1e0>
    800081f6:	57fd                	li	a5,-1
    800081f8:	fef42623          	sw	a5,-20(s0)
    800081fc:	a809                	j	8000820e <filewrite+0x1f6>
  } else {
    panic("filewrite");
    800081fe:	00004517          	auipc	a0,0x4
    80008202:	3da50513          	addi	a0,a0,986 # 8000c5d8 <etext+0x5d8>
    80008206:	ffff9097          	auipc	ra,0xffff9
    8000820a:	a78080e7          	jalr	-1416(ra) # 80000c7e <panic>
  }

  return ret;
    8000820e:	fec42783          	lw	a5,-20(s0)
}
    80008212:	853e                	mv	a0,a5
    80008214:	60a6                	ld	ra,72(sp)
    80008216:	6406                	ld	s0,64(sp)
    80008218:	6161                	addi	sp,sp,80
    8000821a:	8082                	ret

000000008000821c <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    8000821c:	7179                	addi	sp,sp,-48
    8000821e:	f406                	sd	ra,40(sp)
    80008220:	f022                	sd	s0,32(sp)
    80008222:	1800                	addi	s0,sp,48
    80008224:	fca43c23          	sd	a0,-40(s0)
    80008228:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    8000822c:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80008230:	fd043783          	ld	a5,-48(s0)
    80008234:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    80008238:	fd043783          	ld	a5,-48(s0)
    8000823c:	6398                	ld	a4,0(a5)
    8000823e:	fd843783          	ld	a5,-40(s0)
    80008242:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80008244:	00000097          	auipc	ra,0x0
    80008248:	9d8080e7          	jalr	-1576(ra) # 80007c1c <filealloc>
    8000824c:	872a                	mv	a4,a0
    8000824e:	fd843783          	ld	a5,-40(s0)
    80008252:	e398                	sd	a4,0(a5)
    80008254:	fd843783          	ld	a5,-40(s0)
    80008258:	639c                	ld	a5,0(a5)
    8000825a:	c3e9                	beqz	a5,8000831c <pipealloc+0x100>
    8000825c:	00000097          	auipc	ra,0x0
    80008260:	9c0080e7          	jalr	-1600(ra) # 80007c1c <filealloc>
    80008264:	872a                	mv	a4,a0
    80008266:	fd043783          	ld	a5,-48(s0)
    8000826a:	e398                	sd	a4,0(a5)
    8000826c:	fd043783          	ld	a5,-48(s0)
    80008270:	639c                	ld	a5,0(a5)
    80008272:	c7cd                	beqz	a5,8000831c <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    80008274:	ffff9097          	auipc	ra,0xffff9
    80008278:	ea6080e7          	jalr	-346(ra) # 8000111a <kalloc>
    8000827c:	fea43423          	sd	a0,-24(s0)
    80008280:	fe843783          	ld	a5,-24(s0)
    80008284:	cfd1                	beqz	a5,80008320 <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    80008286:	fe843783          	ld	a5,-24(s0)
    8000828a:	4705                	li	a4,1
    8000828c:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    80008290:	fe843783          	ld	a5,-24(s0)
    80008294:	4705                	li	a4,1
    80008296:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    8000829a:	fe843783          	ld	a5,-24(s0)
    8000829e:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    800082a2:	fe843783          	ld	a5,-24(s0)
    800082a6:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    800082aa:	fe843783          	ld	a5,-24(s0)
    800082ae:	00004597          	auipc	a1,0x4
    800082b2:	33a58593          	addi	a1,a1,826 # 8000c5e8 <etext+0x5e8>
    800082b6:	853e                	mv	a0,a5
    800082b8:	ffff9097          	auipc	ra,0xffff9
    800082bc:	f86080e7          	jalr	-122(ra) # 8000123e <initlock>
  (*f0)->type = FD_PIPE;
    800082c0:	fd843783          	ld	a5,-40(s0)
    800082c4:	639c                	ld	a5,0(a5)
    800082c6:	4705                	li	a4,1
    800082c8:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    800082ca:	fd843783          	ld	a5,-40(s0)
    800082ce:	639c                	ld	a5,0(a5)
    800082d0:	4705                	li	a4,1
    800082d2:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    800082d6:	fd843783          	ld	a5,-40(s0)
    800082da:	639c                	ld	a5,0(a5)
    800082dc:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    800082e0:	fd843783          	ld	a5,-40(s0)
    800082e4:	639c                	ld	a5,0(a5)
    800082e6:	fe843703          	ld	a4,-24(s0)
    800082ea:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    800082ec:	fd043783          	ld	a5,-48(s0)
    800082f0:	639c                	ld	a5,0(a5)
    800082f2:	4705                	li	a4,1
    800082f4:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    800082f6:	fd043783          	ld	a5,-48(s0)
    800082fa:	639c                	ld	a5,0(a5)
    800082fc:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80008300:	fd043783          	ld	a5,-48(s0)
    80008304:	639c                	ld	a5,0(a5)
    80008306:	4705                	li	a4,1
    80008308:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    8000830c:	fd043783          	ld	a5,-48(s0)
    80008310:	639c                	ld	a5,0(a5)
    80008312:	fe843703          	ld	a4,-24(s0)
    80008316:	eb98                	sd	a4,16(a5)
  return 0;
    80008318:	4781                	li	a5,0
    8000831a:	a0b1                	j	80008366 <pipealloc+0x14a>
    goto bad;
    8000831c:	0001                	nop
    8000831e:	a011                	j	80008322 <pipealloc+0x106>
    goto bad;
    80008320:	0001                	nop

 bad:
  if(pi)
    80008322:	fe843783          	ld	a5,-24(s0)
    80008326:	c799                	beqz	a5,80008334 <pipealloc+0x118>
    kfree((char*)pi);
    80008328:	fe843503          	ld	a0,-24(s0)
    8000832c:	ffff9097          	auipc	ra,0xffff9
    80008330:	d4a080e7          	jalr	-694(ra) # 80001076 <kfree>
  if(*f0)
    80008334:	fd843783          	ld	a5,-40(s0)
    80008338:	639c                	ld	a5,0(a5)
    8000833a:	cb89                	beqz	a5,8000834c <pipealloc+0x130>
    fileclose(*f0);
    8000833c:	fd843783          	ld	a5,-40(s0)
    80008340:	639c                	ld	a5,0(a5)
    80008342:	853e                	mv	a0,a5
    80008344:	00000097          	auipc	ra,0x0
    80008348:	9c2080e7          	jalr	-1598(ra) # 80007d06 <fileclose>
  if(*f1)
    8000834c:	fd043783          	ld	a5,-48(s0)
    80008350:	639c                	ld	a5,0(a5)
    80008352:	cb89                	beqz	a5,80008364 <pipealloc+0x148>
    fileclose(*f1);
    80008354:	fd043783          	ld	a5,-48(s0)
    80008358:	639c                	ld	a5,0(a5)
    8000835a:	853e                	mv	a0,a5
    8000835c:	00000097          	auipc	ra,0x0
    80008360:	9aa080e7          	jalr	-1622(ra) # 80007d06 <fileclose>
  return -1;
    80008364:	57fd                	li	a5,-1
}
    80008366:	853e                	mv	a0,a5
    80008368:	70a2                	ld	ra,40(sp)
    8000836a:	7402                	ld	s0,32(sp)
    8000836c:	6145                	addi	sp,sp,48
    8000836e:	8082                	ret

0000000080008370 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80008370:	1101                	addi	sp,sp,-32
    80008372:	ec06                	sd	ra,24(sp)
    80008374:	e822                	sd	s0,16(sp)
    80008376:	1000                	addi	s0,sp,32
    80008378:	fea43423          	sd	a0,-24(s0)
    8000837c:	87ae                	mv	a5,a1
    8000837e:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    80008382:	fe843783          	ld	a5,-24(s0)
    80008386:	853e                	mv	a0,a5
    80008388:	ffff9097          	auipc	ra,0xffff9
    8000838c:	ee6080e7          	jalr	-282(ra) # 8000126e <acquire>
  if(writable){
    80008390:	fe442783          	lw	a5,-28(s0)
    80008394:	2781                	sext.w	a5,a5
    80008396:	cf99                	beqz	a5,800083b4 <pipeclose+0x44>
    pi->writeopen = 0;
    80008398:	fe843783          	ld	a5,-24(s0)
    8000839c:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    800083a0:	fe843783          	ld	a5,-24(s0)
    800083a4:	21878793          	addi	a5,a5,536
    800083a8:	853e                	mv	a0,a5
    800083aa:	ffffc097          	auipc	ra,0xffffc
    800083ae:	56e080e7          	jalr	1390(ra) # 80004918 <wakeup>
    800083b2:	a831                	j	800083ce <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    800083b4:	fe843783          	ld	a5,-24(s0)
    800083b8:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    800083bc:	fe843783          	ld	a5,-24(s0)
    800083c0:	21c78793          	addi	a5,a5,540
    800083c4:	853e                	mv	a0,a5
    800083c6:	ffffc097          	auipc	ra,0xffffc
    800083ca:	552080e7          	jalr	1362(ra) # 80004918 <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    800083ce:	fe843783          	ld	a5,-24(s0)
    800083d2:	2207a783          	lw	a5,544(a5)
    800083d6:	e785                	bnez	a5,800083fe <pipeclose+0x8e>
    800083d8:	fe843783          	ld	a5,-24(s0)
    800083dc:	2247a783          	lw	a5,548(a5)
    800083e0:	ef99                	bnez	a5,800083fe <pipeclose+0x8e>
    release(&pi->lock);
    800083e2:	fe843783          	ld	a5,-24(s0)
    800083e6:	853e                	mv	a0,a5
    800083e8:	ffff9097          	auipc	ra,0xffff9
    800083ec:	eea080e7          	jalr	-278(ra) # 800012d2 <release>
    kfree((char*)pi);
    800083f0:	fe843503          	ld	a0,-24(s0)
    800083f4:	ffff9097          	auipc	ra,0xffff9
    800083f8:	c82080e7          	jalr	-894(ra) # 80001076 <kfree>
    800083fc:	a809                	j	8000840e <pipeclose+0x9e>
  } else
    release(&pi->lock);
    800083fe:	fe843783          	ld	a5,-24(s0)
    80008402:	853e                	mv	a0,a5
    80008404:	ffff9097          	auipc	ra,0xffff9
    80008408:	ece080e7          	jalr	-306(ra) # 800012d2 <release>
}
    8000840c:	0001                	nop
    8000840e:	0001                	nop
    80008410:	60e2                	ld	ra,24(sp)
    80008412:	6442                	ld	s0,16(sp)
    80008414:	6105                	addi	sp,sp,32
    80008416:	8082                	ret

0000000080008418 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80008418:	715d                	addi	sp,sp,-80
    8000841a:	e486                	sd	ra,72(sp)
    8000841c:	e0a2                	sd	s0,64(sp)
    8000841e:	0880                	addi	s0,sp,80
    80008420:	fca43423          	sd	a0,-56(s0)
    80008424:	fcb43023          	sd	a1,-64(s0)
    80008428:	87b2                	mv	a5,a2
    8000842a:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    8000842e:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    80008432:	ffffa097          	auipc	ra,0xffffa
    80008436:	3fa080e7          	jalr	1018(ra) # 8000282c <myproc>
    8000843a:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    8000843e:	fc843783          	ld	a5,-56(s0)
    80008442:	853e                	mv	a0,a5
    80008444:	ffff9097          	auipc	ra,0xffff9
    80008448:	e2a080e7          	jalr	-470(ra) # 8000126e <acquire>
  while(i < n){
    8000844c:	a8d1                	j	80008520 <pipewrite+0x108>
    if(pi->readopen == 0 || pr->killed){
    8000844e:	fc843783          	ld	a5,-56(s0)
    80008452:	2207a783          	lw	a5,544(a5)
    80008456:	c789                	beqz	a5,80008460 <pipewrite+0x48>
    80008458:	fe043783          	ld	a5,-32(s0)
    8000845c:	579c                	lw	a5,40(a5)
    8000845e:	cb91                	beqz	a5,80008472 <pipewrite+0x5a>
      release(&pi->lock);
    80008460:	fc843783          	ld	a5,-56(s0)
    80008464:	853e                	mv	a0,a5
    80008466:	ffff9097          	auipc	ra,0xffff9
    8000846a:	e6c080e7          	jalr	-404(ra) # 800012d2 <release>
      return -1;
    8000846e:	57fd                	li	a5,-1
    80008470:	a0e5                	j	80008558 <pipewrite+0x140>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    80008472:	fc843783          	ld	a5,-56(s0)
    80008476:	21c7a703          	lw	a4,540(a5)
    8000847a:	fc843783          	ld	a5,-56(s0)
    8000847e:	2187a783          	lw	a5,536(a5)
    80008482:	2007879b          	addiw	a5,a5,512
    80008486:	2781                	sext.w	a5,a5
    80008488:	02f71863          	bne	a4,a5,800084b8 <pipewrite+0xa0>
      wakeup(&pi->nread);
    8000848c:	fc843783          	ld	a5,-56(s0)
    80008490:	21878793          	addi	a5,a5,536
    80008494:	853e                	mv	a0,a5
    80008496:	ffffc097          	auipc	ra,0xffffc
    8000849a:	482080e7          	jalr	1154(ra) # 80004918 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    8000849e:	fc843783          	ld	a5,-56(s0)
    800084a2:	21c78793          	addi	a5,a5,540
    800084a6:	fc843703          	ld	a4,-56(s0)
    800084aa:	85ba                	mv	a1,a4
    800084ac:	853e                	mv	a0,a5
    800084ae:	ffffc097          	auipc	ra,0xffffc
    800084b2:	3c8080e7          	jalr	968(ra) # 80004876 <sleep>
    800084b6:	a0ad                	j	80008520 <pipewrite+0x108>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    800084b8:	fe043783          	ld	a5,-32(s0)
    800084bc:	6ba8                	ld	a0,80(a5)
    800084be:	fec42703          	lw	a4,-20(s0)
    800084c2:	fc043783          	ld	a5,-64(s0)
    800084c6:	973e                	add	a4,a4,a5
    800084c8:	fdf40793          	addi	a5,s0,-33
    800084cc:	4685                	li	a3,1
    800084ce:	863a                	mv	a2,a4
    800084d0:	85be                	mv	a1,a5
    800084d2:	ffffa097          	auipc	ra,0xffffa
    800084d6:	ee2080e7          	jalr	-286(ra) # 800023b4 <copyin>
    800084da:	87aa                	mv	a5,a0
    800084dc:	873e                	mv	a4,a5
    800084de:	57fd                	li	a5,-1
    800084e0:	04f70963          	beq	a4,a5,80008532 <pipewrite+0x11a>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    800084e4:	fc843783          	ld	a5,-56(s0)
    800084e8:	21c7a783          	lw	a5,540(a5)
    800084ec:	2781                	sext.w	a5,a5
    800084ee:	0017871b          	addiw	a4,a5,1
    800084f2:	0007069b          	sext.w	a3,a4
    800084f6:	fc843703          	ld	a4,-56(s0)
    800084fa:	20d72e23          	sw	a3,540(a4)
    800084fe:	1ff7f793          	andi	a5,a5,511
    80008502:	2781                	sext.w	a5,a5
    80008504:	fdf44703          	lbu	a4,-33(s0)
    80008508:	fc843683          	ld	a3,-56(s0)
    8000850c:	1782                	slli	a5,a5,0x20
    8000850e:	9381                	srli	a5,a5,0x20
    80008510:	97b6                	add	a5,a5,a3
    80008512:	00e78c23          	sb	a4,24(a5)
      i++;
    80008516:	fec42783          	lw	a5,-20(s0)
    8000851a:	2785                	addiw	a5,a5,1
    8000851c:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    80008520:	fec42703          	lw	a4,-20(s0)
    80008524:	fbc42783          	lw	a5,-68(s0)
    80008528:	2701                	sext.w	a4,a4
    8000852a:	2781                	sext.w	a5,a5
    8000852c:	f2f741e3          	blt	a4,a5,8000844e <pipewrite+0x36>
    80008530:	a011                	j	80008534 <pipewrite+0x11c>
        break;
    80008532:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    80008534:	fc843783          	ld	a5,-56(s0)
    80008538:	21878793          	addi	a5,a5,536
    8000853c:	853e                	mv	a0,a5
    8000853e:	ffffc097          	auipc	ra,0xffffc
    80008542:	3da080e7          	jalr	986(ra) # 80004918 <wakeup>
  release(&pi->lock);
    80008546:	fc843783          	ld	a5,-56(s0)
    8000854a:	853e                	mv	a0,a5
    8000854c:	ffff9097          	auipc	ra,0xffff9
    80008550:	d86080e7          	jalr	-634(ra) # 800012d2 <release>

  return i;
    80008554:	fec42783          	lw	a5,-20(s0)
}
    80008558:	853e                	mv	a0,a5
    8000855a:	60a6                	ld	ra,72(sp)
    8000855c:	6406                	ld	s0,64(sp)
    8000855e:	6161                	addi	sp,sp,80
    80008560:	8082                	ret

0000000080008562 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80008562:	715d                	addi	sp,sp,-80
    80008564:	e486                	sd	ra,72(sp)
    80008566:	e0a2                	sd	s0,64(sp)
    80008568:	0880                	addi	s0,sp,80
    8000856a:	fca43423          	sd	a0,-56(s0)
    8000856e:	fcb43023          	sd	a1,-64(s0)
    80008572:	87b2                	mv	a5,a2
    80008574:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    80008578:	ffffa097          	auipc	ra,0xffffa
    8000857c:	2b4080e7          	jalr	692(ra) # 8000282c <myproc>
    80008580:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    80008584:	fc843783          	ld	a5,-56(s0)
    80008588:	853e                	mv	a0,a5
    8000858a:	ffff9097          	auipc	ra,0xffff9
    8000858e:	ce4080e7          	jalr	-796(ra) # 8000126e <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80008592:	a815                	j	800085c6 <piperead+0x64>
    if(pr->killed){
    80008594:	fe043783          	ld	a5,-32(s0)
    80008598:	579c                	lw	a5,40(a5)
    8000859a:	cb91                	beqz	a5,800085ae <piperead+0x4c>
      release(&pi->lock);
    8000859c:	fc843783          	ld	a5,-56(s0)
    800085a0:	853e                	mv	a0,a5
    800085a2:	ffff9097          	auipc	ra,0xffff9
    800085a6:	d30080e7          	jalr	-720(ra) # 800012d2 <release>
      return -1;
    800085aa:	57fd                	li	a5,-1
    800085ac:	a8dd                	j	800086a2 <piperead+0x140>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    800085ae:	fc843783          	ld	a5,-56(s0)
    800085b2:	21878793          	addi	a5,a5,536
    800085b6:	fc843703          	ld	a4,-56(s0)
    800085ba:	85ba                	mv	a1,a4
    800085bc:	853e                	mv	a0,a5
    800085be:	ffffc097          	auipc	ra,0xffffc
    800085c2:	2b8080e7          	jalr	696(ra) # 80004876 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800085c6:	fc843783          	ld	a5,-56(s0)
    800085ca:	2187a703          	lw	a4,536(a5)
    800085ce:	fc843783          	ld	a5,-56(s0)
    800085d2:	21c7a783          	lw	a5,540(a5)
    800085d6:	00f71763          	bne	a4,a5,800085e4 <piperead+0x82>
    800085da:	fc843783          	ld	a5,-56(s0)
    800085de:	2247a783          	lw	a5,548(a5)
    800085e2:	fbcd                	bnez	a5,80008594 <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800085e4:	fe042623          	sw	zero,-20(s0)
    800085e8:	a8bd                	j	80008666 <piperead+0x104>
    if(pi->nread == pi->nwrite)
    800085ea:	fc843783          	ld	a5,-56(s0)
    800085ee:	2187a703          	lw	a4,536(a5)
    800085f2:	fc843783          	ld	a5,-56(s0)
    800085f6:	21c7a783          	lw	a5,540(a5)
    800085fa:	06f70f63          	beq	a4,a5,80008678 <piperead+0x116>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    800085fe:	fc843783          	ld	a5,-56(s0)
    80008602:	2187a783          	lw	a5,536(a5)
    80008606:	2781                	sext.w	a5,a5
    80008608:	0017871b          	addiw	a4,a5,1
    8000860c:	0007069b          	sext.w	a3,a4
    80008610:	fc843703          	ld	a4,-56(s0)
    80008614:	20d72c23          	sw	a3,536(a4)
    80008618:	1ff7f793          	andi	a5,a5,511
    8000861c:	2781                	sext.w	a5,a5
    8000861e:	fc843703          	ld	a4,-56(s0)
    80008622:	1782                	slli	a5,a5,0x20
    80008624:	9381                	srli	a5,a5,0x20
    80008626:	97ba                	add	a5,a5,a4
    80008628:	0187c783          	lbu	a5,24(a5)
    8000862c:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    80008630:	fe043783          	ld	a5,-32(s0)
    80008634:	6ba8                	ld	a0,80(a5)
    80008636:	fec42703          	lw	a4,-20(s0)
    8000863a:	fc043783          	ld	a5,-64(s0)
    8000863e:	97ba                	add	a5,a5,a4
    80008640:	fdf40713          	addi	a4,s0,-33
    80008644:	4685                	li	a3,1
    80008646:	863a                	mv	a2,a4
    80008648:	85be                	mv	a1,a5
    8000864a:	ffffa097          	auipc	ra,0xffffa
    8000864e:	c9c080e7          	jalr	-868(ra) # 800022e6 <copyout>
    80008652:	87aa                	mv	a5,a0
    80008654:	873e                	mv	a4,a5
    80008656:	57fd                	li	a5,-1
    80008658:	02f70263          	beq	a4,a5,8000867c <piperead+0x11a>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8000865c:	fec42783          	lw	a5,-20(s0)
    80008660:	2785                	addiw	a5,a5,1
    80008662:	fef42623          	sw	a5,-20(s0)
    80008666:	fec42703          	lw	a4,-20(s0)
    8000866a:	fbc42783          	lw	a5,-68(s0)
    8000866e:	2701                	sext.w	a4,a4
    80008670:	2781                	sext.w	a5,a5
    80008672:	f6f74ce3          	blt	a4,a5,800085ea <piperead+0x88>
    80008676:	a021                	j	8000867e <piperead+0x11c>
      break;
    80008678:	0001                	nop
    8000867a:	a011                	j	8000867e <piperead+0x11c>
      break;
    8000867c:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    8000867e:	fc843783          	ld	a5,-56(s0)
    80008682:	21c78793          	addi	a5,a5,540
    80008686:	853e                	mv	a0,a5
    80008688:	ffffc097          	auipc	ra,0xffffc
    8000868c:	290080e7          	jalr	656(ra) # 80004918 <wakeup>
  release(&pi->lock);
    80008690:	fc843783          	ld	a5,-56(s0)
    80008694:	853e                	mv	a0,a5
    80008696:	ffff9097          	auipc	ra,0xffff9
    8000869a:	c3c080e7          	jalr	-964(ra) # 800012d2 <release>
  return i;
    8000869e:	fec42783          	lw	a5,-20(s0)
}
    800086a2:	853e                	mv	a0,a5
    800086a4:	60a6                	ld	ra,72(sp)
    800086a6:	6406                	ld	s0,64(sp)
    800086a8:	6161                	addi	sp,sp,80
    800086aa:	8082                	ret

00000000800086ac <exec>:

static int loadseg(pde_t *pgdir, uint64 addr, struct inode *ip, uint offset, uint sz);

int
exec(char *path, char **argv)
{
    800086ac:	de010113          	addi	sp,sp,-544
    800086b0:	20113c23          	sd	ra,536(sp)
    800086b4:	20813823          	sd	s0,528(sp)
    800086b8:	20913423          	sd	s1,520(sp)
    800086bc:	1400                	addi	s0,sp,544
    800086be:	dea43423          	sd	a0,-536(s0)
    800086c2:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    800086c6:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    800086ca:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    800086ce:	ffffa097          	auipc	ra,0xffffa
    800086d2:	15e080e7          	jalr	350(ra) # 8000282c <myproc>
    800086d6:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    800086da:	fffff097          	auipc	ra,0xfffff
    800086de:	f92080e7          	jalr	-110(ra) # 8000766c <begin_op>

  if((ip = namei(path)) == 0){
    800086e2:	de843503          	ld	a0,-536(s0)
    800086e6:	fffff097          	auipc	ra,0xfffff
    800086ea:	c22080e7          	jalr	-990(ra) # 80007308 <namei>
    800086ee:	faa43423          	sd	a0,-88(s0)
    800086f2:	fa843783          	ld	a5,-88(s0)
    800086f6:	e799                	bnez	a5,80008704 <exec+0x58>
    end_op();
    800086f8:	fffff097          	auipc	ra,0xfffff
    800086fc:	036080e7          	jalr	54(ra) # 8000772e <end_op>
    return -1;
    80008700:	57fd                	li	a5,-1
    80008702:	a90d                	j	80008b34 <exec+0x488>
  }
  ilock(ip);
    80008704:	fa843503          	ld	a0,-88(s0)
    80008708:	ffffe097          	auipc	ra,0xffffe
    8000870c:	f0a080e7          	jalr	-246(ra) # 80006612 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    80008710:	e3040793          	addi	a5,s0,-464
    80008714:	04000713          	li	a4,64
    80008718:	4681                	li	a3,0
    8000871a:	863e                	mv	a2,a5
    8000871c:	4581                	li	a1,0
    8000871e:	fa843503          	ld	a0,-88(s0)
    80008722:	ffffe097          	auipc	ra,0xffffe
    80008726:	486080e7          	jalr	1158(ra) # 80006ba8 <readi>
    8000872a:	87aa                	mv	a5,a0
    8000872c:	873e                	mv	a4,a5
    8000872e:	04000793          	li	a5,64
    80008732:	38f71b63          	bne	a4,a5,80008ac8 <exec+0x41c>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80008736:	e3042783          	lw	a5,-464(s0)
    8000873a:	873e                	mv	a4,a5
    8000873c:	464c47b7          	lui	a5,0x464c4
    80008740:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    80008744:	38f71463          	bne	a4,a5,80008acc <exec+0x420>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    80008748:	f9843503          	ld	a0,-104(s0)
    8000874c:	ffffa097          	auipc	ra,0xffffa
    80008750:	40e080e7          	jalr	1038(ra) # 80002b5a <proc_pagetable>
    80008754:	faa43023          	sd	a0,-96(s0)
    80008758:	fa043783          	ld	a5,-96(s0)
    8000875c:	36078a63          	beqz	a5,80008ad0 <exec+0x424>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80008760:	fc042623          	sw	zero,-52(s0)
    80008764:	e5043783          	ld	a5,-432(s0)
    80008768:	fcf42423          	sw	a5,-56(s0)
    8000876c:	a8e1                	j	80008844 <exec+0x198>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    8000876e:	df840793          	addi	a5,s0,-520
    80008772:	fc842683          	lw	a3,-56(s0)
    80008776:	03800713          	li	a4,56
    8000877a:	863e                	mv	a2,a5
    8000877c:	4581                	li	a1,0
    8000877e:	fa843503          	ld	a0,-88(s0)
    80008782:	ffffe097          	auipc	ra,0xffffe
    80008786:	426080e7          	jalr	1062(ra) # 80006ba8 <readi>
    8000878a:	87aa                	mv	a5,a0
    8000878c:	873e                	mv	a4,a5
    8000878e:	03800793          	li	a5,56
    80008792:	34f71163          	bne	a4,a5,80008ad4 <exec+0x428>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    80008796:	df842783          	lw	a5,-520(s0)
    8000879a:	873e                	mv	a4,a5
    8000879c:	4785                	li	a5,1
    8000879e:	08f71663          	bne	a4,a5,8000882a <exec+0x17e>
      continue;
    if(ph.memsz < ph.filesz)
    800087a2:	e2043703          	ld	a4,-480(s0)
    800087a6:	e1843783          	ld	a5,-488(s0)
    800087aa:	32f76763          	bltu	a4,a5,80008ad8 <exec+0x42c>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    800087ae:	e0843703          	ld	a4,-504(s0)
    800087b2:	e2043783          	ld	a5,-480(s0)
    800087b6:	973e                	add	a4,a4,a5
    800087b8:	e0843783          	ld	a5,-504(s0)
    800087bc:	32f76063          	bltu	a4,a5,80008adc <exec+0x430>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz)) == 0)
    800087c0:	e0843703          	ld	a4,-504(s0)
    800087c4:	e2043783          	ld	a5,-480(s0)
    800087c8:	97ba                	add	a5,a5,a4
    800087ca:	863e                	mv	a2,a5
    800087cc:	fb843583          	ld	a1,-72(s0)
    800087d0:	fa043503          	ld	a0,-96(s0)
    800087d4:	ffff9097          	auipc	ra,0xffff9
    800087d8:	734080e7          	jalr	1844(ra) # 80001f08 <uvmalloc>
    800087dc:	f6a43823          	sd	a0,-144(s0)
    800087e0:	f7043783          	ld	a5,-144(s0)
    800087e4:	2e078e63          	beqz	a5,80008ae0 <exec+0x434>
      goto bad;
    sz = sz1;
    800087e8:	f7043783          	ld	a5,-144(s0)
    800087ec:	faf43c23          	sd	a5,-72(s0)
    if((ph.vaddr % PGSIZE) != 0)
    800087f0:	e0843703          	ld	a4,-504(s0)
    800087f4:	6785                	lui	a5,0x1
    800087f6:	17fd                	addi	a5,a5,-1
    800087f8:	8ff9                	and	a5,a5,a4
    800087fa:	2e079563          	bnez	a5,80008ae4 <exec+0x438>
      goto bad;
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    800087fe:	e0843783          	ld	a5,-504(s0)
    80008802:	e0043703          	ld	a4,-512(s0)
    80008806:	0007069b          	sext.w	a3,a4
    8000880a:	e1843703          	ld	a4,-488(s0)
    8000880e:	2701                	sext.w	a4,a4
    80008810:	fa843603          	ld	a2,-88(s0)
    80008814:	85be                	mv	a1,a5
    80008816:	fa043503          	ld	a0,-96(s0)
    8000881a:	00000097          	auipc	ra,0x0
    8000881e:	32e080e7          	jalr	814(ra) # 80008b48 <loadseg>
    80008822:	87aa                	mv	a5,a0
    80008824:	2c07c263          	bltz	a5,80008ae8 <exec+0x43c>
    80008828:	a011                	j	8000882c <exec+0x180>
      continue;
    8000882a:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8000882c:	fcc42783          	lw	a5,-52(s0)
    80008830:	2785                	addiw	a5,a5,1
    80008832:	fcf42623          	sw	a5,-52(s0)
    80008836:	fc842783          	lw	a5,-56(s0)
    8000883a:	0387879b          	addiw	a5,a5,56
    8000883e:	2781                	sext.w	a5,a5
    80008840:	fcf42423          	sw	a5,-56(s0)
    80008844:	e6845783          	lhu	a5,-408(s0)
    80008848:	0007871b          	sext.w	a4,a5
    8000884c:	fcc42783          	lw	a5,-52(s0)
    80008850:	2781                	sext.w	a5,a5
    80008852:	f0e7cee3          	blt	a5,a4,8000876e <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    80008856:	fa843503          	ld	a0,-88(s0)
    8000885a:	ffffe097          	auipc	ra,0xffffe
    8000885e:	016080e7          	jalr	22(ra) # 80006870 <iunlockput>
  end_op();
    80008862:	fffff097          	auipc	ra,0xfffff
    80008866:	ecc080e7          	jalr	-308(ra) # 8000772e <end_op>
  ip = 0;
    8000886a:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    8000886e:	ffffa097          	auipc	ra,0xffffa
    80008872:	fbe080e7          	jalr	-66(ra) # 8000282c <myproc>
    80008876:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    8000887a:	f9843783          	ld	a5,-104(s0)
    8000887e:	67bc                	ld	a5,72(a5)
    80008880:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    80008884:	fb843703          	ld	a4,-72(s0)
    80008888:	6785                	lui	a5,0x1
    8000888a:	17fd                	addi	a5,a5,-1
    8000888c:	973e                	add	a4,a4,a5
    8000888e:	77fd                	lui	a5,0xfffff
    80008890:	8ff9                	and	a5,a5,a4
    80008892:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE)) == 0)
    80008896:	fb843703          	ld	a4,-72(s0)
    8000889a:	6789                	lui	a5,0x2
    8000889c:	97ba                	add	a5,a5,a4
    8000889e:	863e                	mv	a2,a5
    800088a0:	fb843583          	ld	a1,-72(s0)
    800088a4:	fa043503          	ld	a0,-96(s0)
    800088a8:	ffff9097          	auipc	ra,0xffff9
    800088ac:	660080e7          	jalr	1632(ra) # 80001f08 <uvmalloc>
    800088b0:	f8a43423          	sd	a0,-120(s0)
    800088b4:	f8843783          	ld	a5,-120(s0)
    800088b8:	22078a63          	beqz	a5,80008aec <exec+0x440>
    goto bad;
  sz = sz1;
    800088bc:	f8843783          	ld	a5,-120(s0)
    800088c0:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    800088c4:	fb843703          	ld	a4,-72(s0)
    800088c8:	77f9                	lui	a5,0xffffe
    800088ca:	97ba                	add	a5,a5,a4
    800088cc:	85be                	mv	a1,a5
    800088ce:	fa043503          	ld	a0,-96(s0)
    800088d2:	ffffa097          	auipc	ra,0xffffa
    800088d6:	9be080e7          	jalr	-1602(ra) # 80002290 <uvmclear>
  sp = sz;
    800088da:	fb843783          	ld	a5,-72(s0)
    800088de:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    800088e2:	fb043703          	ld	a4,-80(s0)
    800088e6:	77fd                	lui	a5,0xfffff
    800088e8:	97ba                	add	a5,a5,a4
    800088ea:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    800088ee:	fc043023          	sd	zero,-64(s0)
    800088f2:	a845                	j	800089a2 <exec+0x2f6>
    if(argc >= MAXARG)
    800088f4:	fc043703          	ld	a4,-64(s0)
    800088f8:	47fd                	li	a5,31
    800088fa:	1ee7eb63          	bltu	a5,a4,80008af0 <exec+0x444>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    800088fe:	fc043783          	ld	a5,-64(s0)
    80008902:	078e                	slli	a5,a5,0x3
    80008904:	de043703          	ld	a4,-544(s0)
    80008908:	97ba                	add	a5,a5,a4
    8000890a:	639c                	ld	a5,0(a5)
    8000890c:	853e                	mv	a0,a5
    8000890e:	ffff9097          	auipc	ra,0xffff9
    80008912:	eb2080e7          	jalr	-334(ra) # 800017c0 <strlen>
    80008916:	87aa                	mv	a5,a0
    80008918:	2785                	addiw	a5,a5,1
    8000891a:	2781                	sext.w	a5,a5
    8000891c:	873e                	mv	a4,a5
    8000891e:	fb043783          	ld	a5,-80(s0)
    80008922:	8f99                	sub	a5,a5,a4
    80008924:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80008928:	fb043783          	ld	a5,-80(s0)
    8000892c:	9bc1                	andi	a5,a5,-16
    8000892e:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    80008932:	fb043703          	ld	a4,-80(s0)
    80008936:	f8043783          	ld	a5,-128(s0)
    8000893a:	1af76d63          	bltu	a4,a5,80008af4 <exec+0x448>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    8000893e:	fc043783          	ld	a5,-64(s0)
    80008942:	078e                	slli	a5,a5,0x3
    80008944:	de043703          	ld	a4,-544(s0)
    80008948:	97ba                	add	a5,a5,a4
    8000894a:	6384                	ld	s1,0(a5)
    8000894c:	fc043783          	ld	a5,-64(s0)
    80008950:	078e                	slli	a5,a5,0x3
    80008952:	de043703          	ld	a4,-544(s0)
    80008956:	97ba                	add	a5,a5,a4
    80008958:	639c                	ld	a5,0(a5)
    8000895a:	853e                	mv	a0,a5
    8000895c:	ffff9097          	auipc	ra,0xffff9
    80008960:	e64080e7          	jalr	-412(ra) # 800017c0 <strlen>
    80008964:	87aa                	mv	a5,a0
    80008966:	2785                	addiw	a5,a5,1
    80008968:	2781                	sext.w	a5,a5
    8000896a:	86be                	mv	a3,a5
    8000896c:	8626                	mv	a2,s1
    8000896e:	fb043583          	ld	a1,-80(s0)
    80008972:	fa043503          	ld	a0,-96(s0)
    80008976:	ffffa097          	auipc	ra,0xffffa
    8000897a:	970080e7          	jalr	-1680(ra) # 800022e6 <copyout>
    8000897e:	87aa                	mv	a5,a0
    80008980:	1607cc63          	bltz	a5,80008af8 <exec+0x44c>
      goto bad;
    ustack[argc] = sp;
    80008984:	fc043783          	ld	a5,-64(s0)
    80008988:	078e                	slli	a5,a5,0x3
    8000898a:	fe040713          	addi	a4,s0,-32
    8000898e:	97ba                	add	a5,a5,a4
    80008990:	fb043703          	ld	a4,-80(s0)
    80008994:	e8e7b823          	sd	a4,-368(a5) # ffffffffffffee90 <end+0xffffffff7ffd4e90>
  for(argc = 0; argv[argc]; argc++) {
    80008998:	fc043783          	ld	a5,-64(s0)
    8000899c:	0785                	addi	a5,a5,1
    8000899e:	fcf43023          	sd	a5,-64(s0)
    800089a2:	fc043783          	ld	a5,-64(s0)
    800089a6:	078e                	slli	a5,a5,0x3
    800089a8:	de043703          	ld	a4,-544(s0)
    800089ac:	97ba                	add	a5,a5,a4
    800089ae:	639c                	ld	a5,0(a5)
    800089b0:	f3b1                	bnez	a5,800088f4 <exec+0x248>
  }
  ustack[argc] = 0;
    800089b2:	fc043783          	ld	a5,-64(s0)
    800089b6:	078e                	slli	a5,a5,0x3
    800089b8:	fe040713          	addi	a4,s0,-32
    800089bc:	97ba                	add	a5,a5,a4
    800089be:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    800089c2:	fc043783          	ld	a5,-64(s0)
    800089c6:	0785                	addi	a5,a5,1
    800089c8:	078e                	slli	a5,a5,0x3
    800089ca:	fb043703          	ld	a4,-80(s0)
    800089ce:	40f707b3          	sub	a5,a4,a5
    800089d2:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    800089d6:	fb043783          	ld	a5,-80(s0)
    800089da:	9bc1                	andi	a5,a5,-16
    800089dc:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    800089e0:	fb043703          	ld	a4,-80(s0)
    800089e4:	f8043783          	ld	a5,-128(s0)
    800089e8:	10f76a63          	bltu	a4,a5,80008afc <exec+0x450>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    800089ec:	fc043783          	ld	a5,-64(s0)
    800089f0:	0785                	addi	a5,a5,1
    800089f2:	00379713          	slli	a4,a5,0x3
    800089f6:	e7040793          	addi	a5,s0,-400
    800089fa:	86ba                	mv	a3,a4
    800089fc:	863e                	mv	a2,a5
    800089fe:	fb043583          	ld	a1,-80(s0)
    80008a02:	fa043503          	ld	a0,-96(s0)
    80008a06:	ffffa097          	auipc	ra,0xffffa
    80008a0a:	8e0080e7          	jalr	-1824(ra) # 800022e6 <copyout>
    80008a0e:	87aa                	mv	a5,a0
    80008a10:	0e07c863          	bltz	a5,80008b00 <exec+0x454>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    80008a14:	f9843783          	ld	a5,-104(s0)
    80008a18:	6fbc                	ld	a5,88(a5)
    80008a1a:	fb043703          	ld	a4,-80(s0)
    80008a1e:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    80008a20:	de843783          	ld	a5,-536(s0)
    80008a24:	fcf43c23          	sd	a5,-40(s0)
    80008a28:	fd843783          	ld	a5,-40(s0)
    80008a2c:	fcf43823          	sd	a5,-48(s0)
    80008a30:	a025                	j	80008a58 <exec+0x3ac>
    if(*s == '/')
    80008a32:	fd843783          	ld	a5,-40(s0)
    80008a36:	0007c783          	lbu	a5,0(a5)
    80008a3a:	873e                	mv	a4,a5
    80008a3c:	02f00793          	li	a5,47
    80008a40:	00f71763          	bne	a4,a5,80008a4e <exec+0x3a2>
      last = s+1;
    80008a44:	fd843783          	ld	a5,-40(s0)
    80008a48:	0785                	addi	a5,a5,1
    80008a4a:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    80008a4e:	fd843783          	ld	a5,-40(s0)
    80008a52:	0785                	addi	a5,a5,1
    80008a54:	fcf43c23          	sd	a5,-40(s0)
    80008a58:	fd843783          	ld	a5,-40(s0)
    80008a5c:	0007c783          	lbu	a5,0(a5)
    80008a60:	fbe9                	bnez	a5,80008a32 <exec+0x386>
  safestrcpy(p->name, last, sizeof(p->name));
    80008a62:	f9843783          	ld	a5,-104(s0)
    80008a66:	15878793          	addi	a5,a5,344
    80008a6a:	4641                	li	a2,16
    80008a6c:	fd043583          	ld	a1,-48(s0)
    80008a70:	853e                	mv	a0,a5
    80008a72:	ffff9097          	auipc	ra,0xffff9
    80008a76:	cd4080e7          	jalr	-812(ra) # 80001746 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    80008a7a:	f9843783          	ld	a5,-104(s0)
    80008a7e:	6bbc                	ld	a5,80(a5)
    80008a80:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    80008a84:	f9843783          	ld	a5,-104(s0)
    80008a88:	fa043703          	ld	a4,-96(s0)
    80008a8c:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    80008a8e:	f9843783          	ld	a5,-104(s0)
    80008a92:	fb843703          	ld	a4,-72(s0)
    80008a96:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80008a98:	f9843783          	ld	a5,-104(s0)
    80008a9c:	6fbc                	ld	a5,88(a5)
    80008a9e:	e4843703          	ld	a4,-440(s0)
    80008aa2:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80008aa4:	f9843783          	ld	a5,-104(s0)
    80008aa8:	6fbc                	ld	a5,88(a5)
    80008aaa:	fb043703          	ld	a4,-80(s0)
    80008aae:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80008ab0:	f9043583          	ld	a1,-112(s0)
    80008ab4:	f7843503          	ld	a0,-136(s0)
    80008ab8:	ffffa097          	auipc	ra,0xffffa
    80008abc:	162080e7          	jalr	354(ra) # 80002c1a <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80008ac0:	fc043783          	ld	a5,-64(s0)
    80008ac4:	2781                	sext.w	a5,a5
    80008ac6:	a0bd                	j	80008b34 <exec+0x488>
    goto bad;
    80008ac8:	0001                	nop
    80008aca:	a825                	j	80008b02 <exec+0x456>
    goto bad;
    80008acc:	0001                	nop
    80008ace:	a815                	j	80008b02 <exec+0x456>
    goto bad;
    80008ad0:	0001                	nop
    80008ad2:	a805                	j	80008b02 <exec+0x456>
      goto bad;
    80008ad4:	0001                	nop
    80008ad6:	a035                	j	80008b02 <exec+0x456>
      goto bad;
    80008ad8:	0001                	nop
    80008ada:	a025                	j	80008b02 <exec+0x456>
      goto bad;
    80008adc:	0001                	nop
    80008ade:	a015                	j	80008b02 <exec+0x456>
      goto bad;
    80008ae0:	0001                	nop
    80008ae2:	a005                	j	80008b02 <exec+0x456>
      goto bad;
    80008ae4:	0001                	nop
    80008ae6:	a831                	j	80008b02 <exec+0x456>
      goto bad;
    80008ae8:	0001                	nop
    80008aea:	a821                	j	80008b02 <exec+0x456>
    goto bad;
    80008aec:	0001                	nop
    80008aee:	a811                	j	80008b02 <exec+0x456>
      goto bad;
    80008af0:	0001                	nop
    80008af2:	a801                	j	80008b02 <exec+0x456>
      goto bad;
    80008af4:	0001                	nop
    80008af6:	a031                	j	80008b02 <exec+0x456>
      goto bad;
    80008af8:	0001                	nop
    80008afa:	a021                	j	80008b02 <exec+0x456>
    goto bad;
    80008afc:	0001                	nop
    80008afe:	a011                	j	80008b02 <exec+0x456>
    goto bad;
    80008b00:	0001                	nop

 bad:
  if(pagetable)
    80008b02:	fa043783          	ld	a5,-96(s0)
    80008b06:	cb89                	beqz	a5,80008b18 <exec+0x46c>
    proc_freepagetable(pagetable, sz);
    80008b08:	fb843583          	ld	a1,-72(s0)
    80008b0c:	fa043503          	ld	a0,-96(s0)
    80008b10:	ffffa097          	auipc	ra,0xffffa
    80008b14:	10a080e7          	jalr	266(ra) # 80002c1a <proc_freepagetable>
  if(ip){
    80008b18:	fa843783          	ld	a5,-88(s0)
    80008b1c:	cb99                	beqz	a5,80008b32 <exec+0x486>
    iunlockput(ip);
    80008b1e:	fa843503          	ld	a0,-88(s0)
    80008b22:	ffffe097          	auipc	ra,0xffffe
    80008b26:	d4e080e7          	jalr	-690(ra) # 80006870 <iunlockput>
    end_op();
    80008b2a:	fffff097          	auipc	ra,0xfffff
    80008b2e:	c04080e7          	jalr	-1020(ra) # 8000772e <end_op>
  }
  return -1;
    80008b32:	57fd                	li	a5,-1
}
    80008b34:	853e                	mv	a0,a5
    80008b36:	21813083          	ld	ra,536(sp)
    80008b3a:	21013403          	ld	s0,528(sp)
    80008b3e:	20813483          	ld	s1,520(sp)
    80008b42:	22010113          	addi	sp,sp,544
    80008b46:	8082                	ret

0000000080008b48 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    80008b48:	7139                	addi	sp,sp,-64
    80008b4a:	fc06                	sd	ra,56(sp)
    80008b4c:	f822                	sd	s0,48(sp)
    80008b4e:	0080                	addi	s0,sp,64
    80008b50:	fca43c23          	sd	a0,-40(s0)
    80008b54:	fcb43823          	sd	a1,-48(s0)
    80008b58:	fcc43423          	sd	a2,-56(s0)
    80008b5c:	87b6                	mv	a5,a3
    80008b5e:	fcf42223          	sw	a5,-60(s0)
    80008b62:	87ba                	mv	a5,a4
    80008b64:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    80008b68:	fe042623          	sw	zero,-20(s0)
    80008b6c:	a05d                	j	80008c12 <loadseg+0xca>
    pa = walkaddr(pagetable, va + i);
    80008b6e:	fec46703          	lwu	a4,-20(s0)
    80008b72:	fd043783          	ld	a5,-48(s0)
    80008b76:	97ba                	add	a5,a5,a4
    80008b78:	85be                	mv	a1,a5
    80008b7a:	fd843503          	ld	a0,-40(s0)
    80008b7e:	ffff9097          	auipc	ra,0xffff9
    80008b82:	016080e7          	jalr	22(ra) # 80001b94 <walkaddr>
    80008b86:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80008b8a:	fe043783          	ld	a5,-32(s0)
    80008b8e:	eb89                	bnez	a5,80008ba0 <loadseg+0x58>
      panic("loadseg: address should exist");
    80008b90:	00004517          	auipc	a0,0x4
    80008b94:	a6050513          	addi	a0,a0,-1440 # 8000c5f0 <etext+0x5f0>
    80008b98:	ffff8097          	auipc	ra,0xffff8
    80008b9c:	0e6080e7          	jalr	230(ra) # 80000c7e <panic>
    if(sz - i < PGSIZE)
    80008ba0:	fc042703          	lw	a4,-64(s0)
    80008ba4:	fec42783          	lw	a5,-20(s0)
    80008ba8:	40f707bb          	subw	a5,a4,a5
    80008bac:	2781                	sext.w	a5,a5
    80008bae:	873e                	mv	a4,a5
    80008bb0:	6785                	lui	a5,0x1
    80008bb2:	00f77b63          	bgeu	a4,a5,80008bc8 <loadseg+0x80>
      n = sz - i;
    80008bb6:	fc042703          	lw	a4,-64(s0)
    80008bba:	fec42783          	lw	a5,-20(s0)
    80008bbe:	40f707bb          	subw	a5,a4,a5
    80008bc2:	fef42423          	sw	a5,-24(s0)
    80008bc6:	a021                	j	80008bce <loadseg+0x86>
    else
      n = PGSIZE;
    80008bc8:	6785                	lui	a5,0x1
    80008bca:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    80008bce:	fc442703          	lw	a4,-60(s0)
    80008bd2:	fec42783          	lw	a5,-20(s0)
    80008bd6:	9fb9                	addw	a5,a5,a4
    80008bd8:	2781                	sext.w	a5,a5
    80008bda:	fe842703          	lw	a4,-24(s0)
    80008bde:	86be                	mv	a3,a5
    80008be0:	fe043603          	ld	a2,-32(s0)
    80008be4:	4581                	li	a1,0
    80008be6:	fc843503          	ld	a0,-56(s0)
    80008bea:	ffffe097          	auipc	ra,0xffffe
    80008bee:	fbe080e7          	jalr	-66(ra) # 80006ba8 <readi>
    80008bf2:	87aa                	mv	a5,a0
    80008bf4:	0007871b          	sext.w	a4,a5
    80008bf8:	fe842783          	lw	a5,-24(s0)
    80008bfc:	2781                	sext.w	a5,a5
    80008bfe:	00e78463          	beq	a5,a4,80008c06 <loadseg+0xbe>
      return -1;
    80008c02:	57fd                	li	a5,-1
    80008c04:	a005                	j	80008c24 <loadseg+0xdc>
  for(i = 0; i < sz; i += PGSIZE){
    80008c06:	fec42703          	lw	a4,-20(s0)
    80008c0a:	6785                	lui	a5,0x1
    80008c0c:	9fb9                	addw	a5,a5,a4
    80008c0e:	fef42623          	sw	a5,-20(s0)
    80008c12:	fec42703          	lw	a4,-20(s0)
    80008c16:	fc042783          	lw	a5,-64(s0)
    80008c1a:	2701                	sext.w	a4,a4
    80008c1c:	2781                	sext.w	a5,a5
    80008c1e:	f4f768e3          	bltu	a4,a5,80008b6e <loadseg+0x26>
  }
  
  return 0;
    80008c22:	4781                	li	a5,0
}
    80008c24:	853e                	mv	a0,a5
    80008c26:	70e2                	ld	ra,56(sp)
    80008c28:	7442                	ld	s0,48(sp)
    80008c2a:	6121                	addi	sp,sp,64
    80008c2c:	8082                	ret

0000000080008c2e <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80008c2e:	7139                	addi	sp,sp,-64
    80008c30:	fc06                	sd	ra,56(sp)
    80008c32:	f822                	sd	s0,48(sp)
    80008c34:	0080                	addi	s0,sp,64
    80008c36:	87aa                	mv	a5,a0
    80008c38:	fcb43823          	sd	a1,-48(s0)
    80008c3c:	fcc43423          	sd	a2,-56(s0)
    80008c40:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    80008c44:	fe440713          	addi	a4,s0,-28
    80008c48:	fdc42783          	lw	a5,-36(s0)
    80008c4c:	85ba                	mv	a1,a4
    80008c4e:	853e                	mv	a0,a5
    80008c50:	ffffd097          	auipc	ra,0xffffd
    80008c54:	958080e7          	jalr	-1704(ra) # 800055a8 <argint>
    80008c58:	87aa                	mv	a5,a0
    80008c5a:	0007d463          	bgez	a5,80008c62 <argfd+0x34>
    return -1;
    80008c5e:	57fd                	li	a5,-1
    80008c60:	a8b1                	j	80008cbc <argfd+0x8e>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80008c62:	fe442783          	lw	a5,-28(s0)
    80008c66:	0207c863          	bltz	a5,80008c96 <argfd+0x68>
    80008c6a:	fe442783          	lw	a5,-28(s0)
    80008c6e:	873e                	mv	a4,a5
    80008c70:	47bd                	li	a5,15
    80008c72:	02e7c263          	blt	a5,a4,80008c96 <argfd+0x68>
    80008c76:	ffffa097          	auipc	ra,0xffffa
    80008c7a:	bb6080e7          	jalr	-1098(ra) # 8000282c <myproc>
    80008c7e:	872a                	mv	a4,a0
    80008c80:	fe442783          	lw	a5,-28(s0)
    80008c84:	07e9                	addi	a5,a5,26
    80008c86:	078e                	slli	a5,a5,0x3
    80008c88:	97ba                	add	a5,a5,a4
    80008c8a:	639c                	ld	a5,0(a5)
    80008c8c:	fef43423          	sd	a5,-24(s0)
    80008c90:	fe843783          	ld	a5,-24(s0)
    80008c94:	e399                	bnez	a5,80008c9a <argfd+0x6c>
    return -1;
    80008c96:	57fd                	li	a5,-1
    80008c98:	a015                	j	80008cbc <argfd+0x8e>
  if(pfd)
    80008c9a:	fd043783          	ld	a5,-48(s0)
    80008c9e:	c791                	beqz	a5,80008caa <argfd+0x7c>
    *pfd = fd;
    80008ca0:	fe442703          	lw	a4,-28(s0)
    80008ca4:	fd043783          	ld	a5,-48(s0)
    80008ca8:	c398                	sw	a4,0(a5)
  if(pf)
    80008caa:	fc843783          	ld	a5,-56(s0)
    80008cae:	c791                	beqz	a5,80008cba <argfd+0x8c>
    *pf = f;
    80008cb0:	fc843783          	ld	a5,-56(s0)
    80008cb4:	fe843703          	ld	a4,-24(s0)
    80008cb8:	e398                	sd	a4,0(a5)
  return 0;
    80008cba:	4781                	li	a5,0
}
    80008cbc:	853e                	mv	a0,a5
    80008cbe:	70e2                	ld	ra,56(sp)
    80008cc0:	7442                	ld	s0,48(sp)
    80008cc2:	6121                	addi	sp,sp,64
    80008cc4:	8082                	ret

0000000080008cc6 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80008cc6:	7179                	addi	sp,sp,-48
    80008cc8:	f406                	sd	ra,40(sp)
    80008cca:	f022                	sd	s0,32(sp)
    80008ccc:	1800                	addi	s0,sp,48
    80008cce:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80008cd2:	ffffa097          	auipc	ra,0xffffa
    80008cd6:	b5a080e7          	jalr	-1190(ra) # 8000282c <myproc>
    80008cda:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    80008cde:	fe042623          	sw	zero,-20(s0)
    80008ce2:	a825                	j	80008d1a <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    80008ce4:	fe043703          	ld	a4,-32(s0)
    80008ce8:	fec42783          	lw	a5,-20(s0)
    80008cec:	07e9                	addi	a5,a5,26
    80008cee:	078e                	slli	a5,a5,0x3
    80008cf0:	97ba                	add	a5,a5,a4
    80008cf2:	639c                	ld	a5,0(a5)
    80008cf4:	ef91                	bnez	a5,80008d10 <fdalloc+0x4a>
      p->ofile[fd] = f;
    80008cf6:	fe043703          	ld	a4,-32(s0)
    80008cfa:	fec42783          	lw	a5,-20(s0)
    80008cfe:	07e9                	addi	a5,a5,26
    80008d00:	078e                	slli	a5,a5,0x3
    80008d02:	97ba                	add	a5,a5,a4
    80008d04:	fd843703          	ld	a4,-40(s0)
    80008d08:	e398                	sd	a4,0(a5)
      return fd;
    80008d0a:	fec42783          	lw	a5,-20(s0)
    80008d0e:	a831                	j	80008d2a <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    80008d10:	fec42783          	lw	a5,-20(s0)
    80008d14:	2785                	addiw	a5,a5,1
    80008d16:	fef42623          	sw	a5,-20(s0)
    80008d1a:	fec42783          	lw	a5,-20(s0)
    80008d1e:	0007871b          	sext.w	a4,a5
    80008d22:	47bd                	li	a5,15
    80008d24:	fce7d0e3          	bge	a5,a4,80008ce4 <fdalloc+0x1e>
    }
  }
  return -1;
    80008d28:	57fd                	li	a5,-1
}
    80008d2a:	853e                	mv	a0,a5
    80008d2c:	70a2                	ld	ra,40(sp)
    80008d2e:	7402                	ld	s0,32(sp)
    80008d30:	6145                	addi	sp,sp,48
    80008d32:	8082                	ret

0000000080008d34 <sys_dup>:

uint64
sys_dup(void)
{
    80008d34:	1101                	addi	sp,sp,-32
    80008d36:	ec06                	sd	ra,24(sp)
    80008d38:	e822                	sd	s0,16(sp)
    80008d3a:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80008d3c:	fe040793          	addi	a5,s0,-32
    80008d40:	863e                	mv	a2,a5
    80008d42:	4581                	li	a1,0
    80008d44:	4501                	li	a0,0
    80008d46:	00000097          	auipc	ra,0x0
    80008d4a:	ee8080e7          	jalr	-280(ra) # 80008c2e <argfd>
    80008d4e:	87aa                	mv	a5,a0
    80008d50:	0007d463          	bgez	a5,80008d58 <sys_dup+0x24>
    return -1;
    80008d54:	57fd                	li	a5,-1
    80008d56:	a81d                	j	80008d8c <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80008d58:	fe043783          	ld	a5,-32(s0)
    80008d5c:	853e                	mv	a0,a5
    80008d5e:	00000097          	auipc	ra,0x0
    80008d62:	f68080e7          	jalr	-152(ra) # 80008cc6 <fdalloc>
    80008d66:	87aa                	mv	a5,a0
    80008d68:	fef42623          	sw	a5,-20(s0)
    80008d6c:	fec42783          	lw	a5,-20(s0)
    80008d70:	2781                	sext.w	a5,a5
    80008d72:	0007d463          	bgez	a5,80008d7a <sys_dup+0x46>
    return -1;
    80008d76:	57fd                	li	a5,-1
    80008d78:	a811                	j	80008d8c <sys_dup+0x58>
  filedup(f);
    80008d7a:	fe043783          	ld	a5,-32(s0)
    80008d7e:	853e                	mv	a0,a5
    80008d80:	fffff097          	auipc	ra,0xfffff
    80008d84:	f20080e7          	jalr	-224(ra) # 80007ca0 <filedup>
  return fd;
    80008d88:	fec42783          	lw	a5,-20(s0)
}
    80008d8c:	853e                	mv	a0,a5
    80008d8e:	60e2                	ld	ra,24(sp)
    80008d90:	6442                	ld	s0,16(sp)
    80008d92:	6105                	addi	sp,sp,32
    80008d94:	8082                	ret

0000000080008d96 <sys_read>:

uint64
sys_read(void)
{
    80008d96:	7179                	addi	sp,sp,-48
    80008d98:	f406                	sd	ra,40(sp)
    80008d9a:	f022                	sd	s0,32(sp)
    80008d9c:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80008d9e:	fe840793          	addi	a5,s0,-24
    80008da2:	863e                	mv	a2,a5
    80008da4:	4581                	li	a1,0
    80008da6:	4501                	li	a0,0
    80008da8:	00000097          	auipc	ra,0x0
    80008dac:	e86080e7          	jalr	-378(ra) # 80008c2e <argfd>
    80008db0:	87aa                	mv	a5,a0
    80008db2:	0207c863          	bltz	a5,80008de2 <sys_read+0x4c>
    80008db6:	fe440793          	addi	a5,s0,-28
    80008dba:	85be                	mv	a1,a5
    80008dbc:	4509                	li	a0,2
    80008dbe:	ffffc097          	auipc	ra,0xffffc
    80008dc2:	7ea080e7          	jalr	2026(ra) # 800055a8 <argint>
    80008dc6:	87aa                	mv	a5,a0
    80008dc8:	0007cd63          	bltz	a5,80008de2 <sys_read+0x4c>
    80008dcc:	fd840793          	addi	a5,s0,-40
    80008dd0:	85be                	mv	a1,a5
    80008dd2:	4505                	li	a0,1
    80008dd4:	ffffd097          	auipc	ra,0xffffd
    80008dd8:	80c080e7          	jalr	-2036(ra) # 800055e0 <argaddr>
    80008ddc:	87aa                	mv	a5,a0
    80008dde:	0007d463          	bgez	a5,80008de6 <sys_read+0x50>
    return -1;
    80008de2:	57fd                	li	a5,-1
    80008de4:	a839                	j	80008e02 <sys_read+0x6c>
  return fileread(f, p, n);
    80008de6:	fe843783          	ld	a5,-24(s0)
    80008dea:	fd843703          	ld	a4,-40(s0)
    80008dee:	fe442683          	lw	a3,-28(s0)
    80008df2:	8636                	mv	a2,a3
    80008df4:	85ba                	mv	a1,a4
    80008df6:	853e                	mv	a0,a5
    80008df8:	fffff097          	auipc	ra,0xfffff
    80008dfc:	0ba080e7          	jalr	186(ra) # 80007eb2 <fileread>
    80008e00:	87aa                	mv	a5,a0
}
    80008e02:	853e                	mv	a0,a5
    80008e04:	70a2                	ld	ra,40(sp)
    80008e06:	7402                	ld	s0,32(sp)
    80008e08:	6145                	addi	sp,sp,48
    80008e0a:	8082                	ret

0000000080008e0c <sys_write>:

uint64
sys_write(void)
{
    80008e0c:	7179                	addi	sp,sp,-48
    80008e0e:	f406                	sd	ra,40(sp)
    80008e10:	f022                	sd	s0,32(sp)
    80008e12:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80008e14:	fe840793          	addi	a5,s0,-24
    80008e18:	863e                	mv	a2,a5
    80008e1a:	4581                	li	a1,0
    80008e1c:	4501                	li	a0,0
    80008e1e:	00000097          	auipc	ra,0x0
    80008e22:	e10080e7          	jalr	-496(ra) # 80008c2e <argfd>
    80008e26:	87aa                	mv	a5,a0
    80008e28:	0207c863          	bltz	a5,80008e58 <sys_write+0x4c>
    80008e2c:	fe440793          	addi	a5,s0,-28
    80008e30:	85be                	mv	a1,a5
    80008e32:	4509                	li	a0,2
    80008e34:	ffffc097          	auipc	ra,0xffffc
    80008e38:	774080e7          	jalr	1908(ra) # 800055a8 <argint>
    80008e3c:	87aa                	mv	a5,a0
    80008e3e:	0007cd63          	bltz	a5,80008e58 <sys_write+0x4c>
    80008e42:	fd840793          	addi	a5,s0,-40
    80008e46:	85be                	mv	a1,a5
    80008e48:	4505                	li	a0,1
    80008e4a:	ffffc097          	auipc	ra,0xffffc
    80008e4e:	796080e7          	jalr	1942(ra) # 800055e0 <argaddr>
    80008e52:	87aa                	mv	a5,a0
    80008e54:	0007d463          	bgez	a5,80008e5c <sys_write+0x50>
    return -1;
    80008e58:	57fd                	li	a5,-1
    80008e5a:	a839                	j	80008e78 <sys_write+0x6c>

  return filewrite(f, p, n);
    80008e5c:	fe843783          	ld	a5,-24(s0)
    80008e60:	fd843703          	ld	a4,-40(s0)
    80008e64:	fe442683          	lw	a3,-28(s0)
    80008e68:	8636                	mv	a2,a3
    80008e6a:	85ba                	mv	a1,a4
    80008e6c:	853e                	mv	a0,a5
    80008e6e:	fffff097          	auipc	ra,0xfffff
    80008e72:	1aa080e7          	jalr	426(ra) # 80008018 <filewrite>
    80008e76:	87aa                	mv	a5,a0
}
    80008e78:	853e                	mv	a0,a5
    80008e7a:	70a2                	ld	ra,40(sp)
    80008e7c:	7402                	ld	s0,32(sp)
    80008e7e:	6145                	addi	sp,sp,48
    80008e80:	8082                	ret

0000000080008e82 <sys_close>:

uint64
sys_close(void)
{
    80008e82:	1101                	addi	sp,sp,-32
    80008e84:	ec06                	sd	ra,24(sp)
    80008e86:	e822                	sd	s0,16(sp)
    80008e88:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80008e8a:	fe040713          	addi	a4,s0,-32
    80008e8e:	fec40793          	addi	a5,s0,-20
    80008e92:	863a                	mv	a2,a4
    80008e94:	85be                	mv	a1,a5
    80008e96:	4501                	li	a0,0
    80008e98:	00000097          	auipc	ra,0x0
    80008e9c:	d96080e7          	jalr	-618(ra) # 80008c2e <argfd>
    80008ea0:	87aa                	mv	a5,a0
    80008ea2:	0007d463          	bgez	a5,80008eaa <sys_close+0x28>
    return -1;
    80008ea6:	57fd                	li	a5,-1
    80008ea8:	a02d                	j	80008ed2 <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80008eaa:	ffffa097          	auipc	ra,0xffffa
    80008eae:	982080e7          	jalr	-1662(ra) # 8000282c <myproc>
    80008eb2:	872a                	mv	a4,a0
    80008eb4:	fec42783          	lw	a5,-20(s0)
    80008eb8:	07e9                	addi	a5,a5,26
    80008eba:	078e                	slli	a5,a5,0x3
    80008ebc:	97ba                	add	a5,a5,a4
    80008ebe:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    80008ec2:	fe043783          	ld	a5,-32(s0)
    80008ec6:	853e                	mv	a0,a5
    80008ec8:	fffff097          	auipc	ra,0xfffff
    80008ecc:	e3e080e7          	jalr	-450(ra) # 80007d06 <fileclose>
  return 0;
    80008ed0:	4781                	li	a5,0
}
    80008ed2:	853e                	mv	a0,a5
    80008ed4:	60e2                	ld	ra,24(sp)
    80008ed6:	6442                	ld	s0,16(sp)
    80008ed8:	6105                	addi	sp,sp,32
    80008eda:	8082                	ret

0000000080008edc <sys_fstat>:

uint64
sys_fstat(void)
{
    80008edc:	1101                	addi	sp,sp,-32
    80008ede:	ec06                	sd	ra,24(sp)
    80008ee0:	e822                	sd	s0,16(sp)
    80008ee2:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80008ee4:	fe840793          	addi	a5,s0,-24
    80008ee8:	863e                	mv	a2,a5
    80008eea:	4581                	li	a1,0
    80008eec:	4501                	li	a0,0
    80008eee:	00000097          	auipc	ra,0x0
    80008ef2:	d40080e7          	jalr	-704(ra) # 80008c2e <argfd>
    80008ef6:	87aa                	mv	a5,a0
    80008ef8:	0007cd63          	bltz	a5,80008f12 <sys_fstat+0x36>
    80008efc:	fe040793          	addi	a5,s0,-32
    80008f00:	85be                	mv	a1,a5
    80008f02:	4505                	li	a0,1
    80008f04:	ffffc097          	auipc	ra,0xffffc
    80008f08:	6dc080e7          	jalr	1756(ra) # 800055e0 <argaddr>
    80008f0c:	87aa                	mv	a5,a0
    80008f0e:	0007d463          	bgez	a5,80008f16 <sys_fstat+0x3a>
    return -1;
    80008f12:	57fd                	li	a5,-1
    80008f14:	a821                	j	80008f2c <sys_fstat+0x50>
  return filestat(f, st);
    80008f16:	fe843783          	ld	a5,-24(s0)
    80008f1a:	fe043703          	ld	a4,-32(s0)
    80008f1e:	85ba                	mv	a1,a4
    80008f20:	853e                	mv	a0,a5
    80008f22:	fffff097          	auipc	ra,0xfffff
    80008f26:	eec080e7          	jalr	-276(ra) # 80007e0e <filestat>
    80008f2a:	87aa                	mv	a5,a0
}
    80008f2c:	853e                	mv	a0,a5
    80008f2e:	60e2                	ld	ra,24(sp)
    80008f30:	6442                	ld	s0,16(sp)
    80008f32:	6105                	addi	sp,sp,32
    80008f34:	8082                	ret

0000000080008f36 <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80008f36:	7169                	addi	sp,sp,-304
    80008f38:	f606                	sd	ra,296(sp)
    80008f3a:	f222                	sd	s0,288(sp)
    80008f3c:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80008f3e:	ed040793          	addi	a5,s0,-304
    80008f42:	08000613          	li	a2,128
    80008f46:	85be                	mv	a1,a5
    80008f48:	4501                	li	a0,0
    80008f4a:	ffffc097          	auipc	ra,0xffffc
    80008f4e:	6ca080e7          	jalr	1738(ra) # 80005614 <argstr>
    80008f52:	87aa                	mv	a5,a0
    80008f54:	0007cf63          	bltz	a5,80008f72 <sys_link+0x3c>
    80008f58:	f5040793          	addi	a5,s0,-176
    80008f5c:	08000613          	li	a2,128
    80008f60:	85be                	mv	a1,a5
    80008f62:	4505                	li	a0,1
    80008f64:	ffffc097          	auipc	ra,0xffffc
    80008f68:	6b0080e7          	jalr	1712(ra) # 80005614 <argstr>
    80008f6c:	87aa                	mv	a5,a0
    80008f6e:	0007d463          	bgez	a5,80008f76 <sys_link+0x40>
    return -1;
    80008f72:	57fd                	li	a5,-1
    80008f74:	aab5                	j	800090f0 <sys_link+0x1ba>

  begin_op();
    80008f76:	ffffe097          	auipc	ra,0xffffe
    80008f7a:	6f6080e7          	jalr	1782(ra) # 8000766c <begin_op>
  if((ip = namei(old)) == 0){
    80008f7e:	ed040793          	addi	a5,s0,-304
    80008f82:	853e                	mv	a0,a5
    80008f84:	ffffe097          	auipc	ra,0xffffe
    80008f88:	384080e7          	jalr	900(ra) # 80007308 <namei>
    80008f8c:	fea43423          	sd	a0,-24(s0)
    80008f90:	fe843783          	ld	a5,-24(s0)
    80008f94:	e799                	bnez	a5,80008fa2 <sys_link+0x6c>
    end_op();
    80008f96:	ffffe097          	auipc	ra,0xffffe
    80008f9a:	798080e7          	jalr	1944(ra) # 8000772e <end_op>
    return -1;
    80008f9e:	57fd                	li	a5,-1
    80008fa0:	aa81                	j	800090f0 <sys_link+0x1ba>
  }

  ilock(ip);
    80008fa2:	fe843503          	ld	a0,-24(s0)
    80008fa6:	ffffd097          	auipc	ra,0xffffd
    80008faa:	66c080e7          	jalr	1644(ra) # 80006612 <ilock>
  if(ip->type == T_DIR){
    80008fae:	fe843783          	ld	a5,-24(s0)
    80008fb2:	04479783          	lh	a5,68(a5)
    80008fb6:	0007871b          	sext.w	a4,a5
    80008fba:	4785                	li	a5,1
    80008fbc:	00f71e63          	bne	a4,a5,80008fd8 <sys_link+0xa2>
    iunlockput(ip);
    80008fc0:	fe843503          	ld	a0,-24(s0)
    80008fc4:	ffffe097          	auipc	ra,0xffffe
    80008fc8:	8ac080e7          	jalr	-1876(ra) # 80006870 <iunlockput>
    end_op();
    80008fcc:	ffffe097          	auipc	ra,0xffffe
    80008fd0:	762080e7          	jalr	1890(ra) # 8000772e <end_op>
    return -1;
    80008fd4:	57fd                	li	a5,-1
    80008fd6:	aa29                	j	800090f0 <sys_link+0x1ba>
  }

  ip->nlink++;
    80008fd8:	fe843783          	ld	a5,-24(s0)
    80008fdc:	04a79783          	lh	a5,74(a5)
    80008fe0:	17c2                	slli	a5,a5,0x30
    80008fe2:	93c1                	srli	a5,a5,0x30
    80008fe4:	2785                	addiw	a5,a5,1
    80008fe6:	17c2                	slli	a5,a5,0x30
    80008fe8:	93c1                	srli	a5,a5,0x30
    80008fea:	0107971b          	slliw	a4,a5,0x10
    80008fee:	4107571b          	sraiw	a4,a4,0x10
    80008ff2:	fe843783          	ld	a5,-24(s0)
    80008ff6:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008ffa:	fe843503          	ld	a0,-24(s0)
    80008ffe:	ffffd097          	auipc	ra,0xffffd
    80009002:	3c4080e7          	jalr	964(ra) # 800063c2 <iupdate>
  iunlock(ip);
    80009006:	fe843503          	ld	a0,-24(s0)
    8000900a:	ffffd097          	auipc	ra,0xffffd
    8000900e:	73c080e7          	jalr	1852(ra) # 80006746 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80009012:	fd040713          	addi	a4,s0,-48
    80009016:	f5040793          	addi	a5,s0,-176
    8000901a:	85ba                	mv	a1,a4
    8000901c:	853e                	mv	a0,a5
    8000901e:	ffffe097          	auipc	ra,0xffffe
    80009022:	316080e7          	jalr	790(ra) # 80007334 <nameiparent>
    80009026:	fea43023          	sd	a0,-32(s0)
    8000902a:	fe043783          	ld	a5,-32(s0)
    8000902e:	cba5                	beqz	a5,8000909e <sys_link+0x168>
    goto bad;
  ilock(dp);
    80009030:	fe043503          	ld	a0,-32(s0)
    80009034:	ffffd097          	auipc	ra,0xffffd
    80009038:	5de080e7          	jalr	1502(ra) # 80006612 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    8000903c:	fe043783          	ld	a5,-32(s0)
    80009040:	4398                	lw	a4,0(a5)
    80009042:	fe843783          	ld	a5,-24(s0)
    80009046:	439c                	lw	a5,0(a5)
    80009048:	02f71263          	bne	a4,a5,8000906c <sys_link+0x136>
    8000904c:	fe843783          	ld	a5,-24(s0)
    80009050:	43d8                	lw	a4,4(a5)
    80009052:	fd040793          	addi	a5,s0,-48
    80009056:	863a                	mv	a2,a4
    80009058:	85be                	mv	a1,a5
    8000905a:	fe043503          	ld	a0,-32(s0)
    8000905e:	ffffe097          	auipc	ra,0xffffe
    80009062:	f90080e7          	jalr	-112(ra) # 80006fee <dirlink>
    80009066:	87aa                	mv	a5,a0
    80009068:	0007d963          	bgez	a5,8000907a <sys_link+0x144>
    iunlockput(dp);
    8000906c:	fe043503          	ld	a0,-32(s0)
    80009070:	ffffe097          	auipc	ra,0xffffe
    80009074:	800080e7          	jalr	-2048(ra) # 80006870 <iunlockput>
    goto bad;
    80009078:	a025                	j	800090a0 <sys_link+0x16a>
  }
  iunlockput(dp);
    8000907a:	fe043503          	ld	a0,-32(s0)
    8000907e:	ffffd097          	auipc	ra,0xffffd
    80009082:	7f2080e7          	jalr	2034(ra) # 80006870 <iunlockput>
  iput(ip);
    80009086:	fe843503          	ld	a0,-24(s0)
    8000908a:	ffffd097          	auipc	ra,0xffffd
    8000908e:	716080e7          	jalr	1814(ra) # 800067a0 <iput>

  end_op();
    80009092:	ffffe097          	auipc	ra,0xffffe
    80009096:	69c080e7          	jalr	1692(ra) # 8000772e <end_op>

  return 0;
    8000909a:	4781                	li	a5,0
    8000909c:	a891                	j	800090f0 <sys_link+0x1ba>
    goto bad;
    8000909e:	0001                	nop

bad:
  ilock(ip);
    800090a0:	fe843503          	ld	a0,-24(s0)
    800090a4:	ffffd097          	auipc	ra,0xffffd
    800090a8:	56e080e7          	jalr	1390(ra) # 80006612 <ilock>
  ip->nlink--;
    800090ac:	fe843783          	ld	a5,-24(s0)
    800090b0:	04a79783          	lh	a5,74(a5)
    800090b4:	17c2                	slli	a5,a5,0x30
    800090b6:	93c1                	srli	a5,a5,0x30
    800090b8:	37fd                	addiw	a5,a5,-1
    800090ba:	17c2                	slli	a5,a5,0x30
    800090bc:	93c1                	srli	a5,a5,0x30
    800090be:	0107971b          	slliw	a4,a5,0x10
    800090c2:	4107571b          	sraiw	a4,a4,0x10
    800090c6:	fe843783          	ld	a5,-24(s0)
    800090ca:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    800090ce:	fe843503          	ld	a0,-24(s0)
    800090d2:	ffffd097          	auipc	ra,0xffffd
    800090d6:	2f0080e7          	jalr	752(ra) # 800063c2 <iupdate>
  iunlockput(ip);
    800090da:	fe843503          	ld	a0,-24(s0)
    800090de:	ffffd097          	auipc	ra,0xffffd
    800090e2:	792080e7          	jalr	1938(ra) # 80006870 <iunlockput>
  end_op();
    800090e6:	ffffe097          	auipc	ra,0xffffe
    800090ea:	648080e7          	jalr	1608(ra) # 8000772e <end_op>
  return -1;
    800090ee:	57fd                	li	a5,-1
}
    800090f0:	853e                	mv	a0,a5
    800090f2:	70b2                	ld	ra,296(sp)
    800090f4:	7412                	ld	s0,288(sp)
    800090f6:	6155                	addi	sp,sp,304
    800090f8:	8082                	ret

00000000800090fa <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    800090fa:	7139                	addi	sp,sp,-64
    800090fc:	fc06                	sd	ra,56(sp)
    800090fe:	f822                	sd	s0,48(sp)
    80009100:	0080                	addi	s0,sp,64
    80009102:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80009106:	02000793          	li	a5,32
    8000910a:	fef42623          	sw	a5,-20(s0)
    8000910e:	a0b1                	j	8000915a <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80009110:	fd840793          	addi	a5,s0,-40
    80009114:	fec42683          	lw	a3,-20(s0)
    80009118:	4741                	li	a4,16
    8000911a:	863e                	mv	a2,a5
    8000911c:	4581                	li	a1,0
    8000911e:	fc843503          	ld	a0,-56(s0)
    80009122:	ffffe097          	auipc	ra,0xffffe
    80009126:	a86080e7          	jalr	-1402(ra) # 80006ba8 <readi>
    8000912a:	87aa                	mv	a5,a0
    8000912c:	873e                	mv	a4,a5
    8000912e:	47c1                	li	a5,16
    80009130:	00f70a63          	beq	a4,a5,80009144 <isdirempty+0x4a>
      panic("isdirempty: readi");
    80009134:	00003517          	auipc	a0,0x3
    80009138:	4dc50513          	addi	a0,a0,1244 # 8000c610 <etext+0x610>
    8000913c:	ffff8097          	auipc	ra,0xffff8
    80009140:	b42080e7          	jalr	-1214(ra) # 80000c7e <panic>
    if(de.inum != 0)
    80009144:	fd845783          	lhu	a5,-40(s0)
    80009148:	c399                	beqz	a5,8000914e <isdirempty+0x54>
      return 0;
    8000914a:	4781                	li	a5,0
    8000914c:	a839                	j	8000916a <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    8000914e:	fec42783          	lw	a5,-20(s0)
    80009152:	27c1                	addiw	a5,a5,16
    80009154:	2781                	sext.w	a5,a5
    80009156:	fef42623          	sw	a5,-20(s0)
    8000915a:	fc843783          	ld	a5,-56(s0)
    8000915e:	47f8                	lw	a4,76(a5)
    80009160:	fec42783          	lw	a5,-20(s0)
    80009164:	fae7e6e3          	bltu	a5,a4,80009110 <isdirempty+0x16>
  }
  return 1;
    80009168:	4785                	li	a5,1
}
    8000916a:	853e                	mv	a0,a5
    8000916c:	70e2                	ld	ra,56(sp)
    8000916e:	7442                	ld	s0,48(sp)
    80009170:	6121                	addi	sp,sp,64
    80009172:	8082                	ret

0000000080009174 <sys_unlink>:

uint64
sys_unlink(void)
{
    80009174:	7155                	addi	sp,sp,-208
    80009176:	e586                	sd	ra,200(sp)
    80009178:	e1a2                	sd	s0,192(sp)
    8000917a:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    8000917c:	f4040793          	addi	a5,s0,-192
    80009180:	08000613          	li	a2,128
    80009184:	85be                	mv	a1,a5
    80009186:	4501                	li	a0,0
    80009188:	ffffc097          	auipc	ra,0xffffc
    8000918c:	48c080e7          	jalr	1164(ra) # 80005614 <argstr>
    80009190:	87aa                	mv	a5,a0
    80009192:	0007d463          	bgez	a5,8000919a <sys_unlink+0x26>
    return -1;
    80009196:	57fd                	li	a5,-1
    80009198:	a2ed                	j	80009382 <sys_unlink+0x20e>

  begin_op();
    8000919a:	ffffe097          	auipc	ra,0xffffe
    8000919e:	4d2080e7          	jalr	1234(ra) # 8000766c <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    800091a2:	fc040713          	addi	a4,s0,-64
    800091a6:	f4040793          	addi	a5,s0,-192
    800091aa:	85ba                	mv	a1,a4
    800091ac:	853e                	mv	a0,a5
    800091ae:	ffffe097          	auipc	ra,0xffffe
    800091b2:	186080e7          	jalr	390(ra) # 80007334 <nameiparent>
    800091b6:	fea43423          	sd	a0,-24(s0)
    800091ba:	fe843783          	ld	a5,-24(s0)
    800091be:	e799                	bnez	a5,800091cc <sys_unlink+0x58>
    end_op();
    800091c0:	ffffe097          	auipc	ra,0xffffe
    800091c4:	56e080e7          	jalr	1390(ra) # 8000772e <end_op>
    return -1;
    800091c8:	57fd                	li	a5,-1
    800091ca:	aa65                	j	80009382 <sys_unlink+0x20e>
  }

  ilock(dp);
    800091cc:	fe843503          	ld	a0,-24(s0)
    800091d0:	ffffd097          	auipc	ra,0xffffd
    800091d4:	442080e7          	jalr	1090(ra) # 80006612 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    800091d8:	fc040793          	addi	a5,s0,-64
    800091dc:	00003597          	auipc	a1,0x3
    800091e0:	44c58593          	addi	a1,a1,1100 # 8000c628 <etext+0x628>
    800091e4:	853e                	mv	a0,a5
    800091e6:	ffffe097          	auipc	ra,0xffffe
    800091ea:	cf2080e7          	jalr	-782(ra) # 80006ed8 <namecmp>
    800091ee:	87aa                	mv	a5,a0
    800091f0:	16078b63          	beqz	a5,80009366 <sys_unlink+0x1f2>
    800091f4:	fc040793          	addi	a5,s0,-64
    800091f8:	00003597          	auipc	a1,0x3
    800091fc:	43858593          	addi	a1,a1,1080 # 8000c630 <etext+0x630>
    80009200:	853e                	mv	a0,a5
    80009202:	ffffe097          	auipc	ra,0xffffe
    80009206:	cd6080e7          	jalr	-810(ra) # 80006ed8 <namecmp>
    8000920a:	87aa                	mv	a5,a0
    8000920c:	14078d63          	beqz	a5,80009366 <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80009210:	f3c40713          	addi	a4,s0,-196
    80009214:	fc040793          	addi	a5,s0,-64
    80009218:	863a                	mv	a2,a4
    8000921a:	85be                	mv	a1,a5
    8000921c:	fe843503          	ld	a0,-24(s0)
    80009220:	ffffe097          	auipc	ra,0xffffe
    80009224:	ce6080e7          	jalr	-794(ra) # 80006f06 <dirlookup>
    80009228:	fea43023          	sd	a0,-32(s0)
    8000922c:	fe043783          	ld	a5,-32(s0)
    80009230:	12078d63          	beqz	a5,8000936a <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    80009234:	fe043503          	ld	a0,-32(s0)
    80009238:	ffffd097          	auipc	ra,0xffffd
    8000923c:	3da080e7          	jalr	986(ra) # 80006612 <ilock>

  if(ip->nlink < 1)
    80009240:	fe043783          	ld	a5,-32(s0)
    80009244:	04a79783          	lh	a5,74(a5)
    80009248:	2781                	sext.w	a5,a5
    8000924a:	00f04a63          	bgtz	a5,8000925e <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    8000924e:	00003517          	auipc	a0,0x3
    80009252:	3ea50513          	addi	a0,a0,1002 # 8000c638 <etext+0x638>
    80009256:	ffff8097          	auipc	ra,0xffff8
    8000925a:	a28080e7          	jalr	-1496(ra) # 80000c7e <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    8000925e:	fe043783          	ld	a5,-32(s0)
    80009262:	04479783          	lh	a5,68(a5)
    80009266:	0007871b          	sext.w	a4,a5
    8000926a:	4785                	li	a5,1
    8000926c:	02f71163          	bne	a4,a5,8000928e <sys_unlink+0x11a>
    80009270:	fe043503          	ld	a0,-32(s0)
    80009274:	00000097          	auipc	ra,0x0
    80009278:	e86080e7          	jalr	-378(ra) # 800090fa <isdirempty>
    8000927c:	87aa                	mv	a5,a0
    8000927e:	eb81                	bnez	a5,8000928e <sys_unlink+0x11a>
    iunlockput(ip);
    80009280:	fe043503          	ld	a0,-32(s0)
    80009284:	ffffd097          	auipc	ra,0xffffd
    80009288:	5ec080e7          	jalr	1516(ra) # 80006870 <iunlockput>
    goto bad;
    8000928c:	a0c5                	j	8000936c <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    8000928e:	fd040793          	addi	a5,s0,-48
    80009292:	4641                	li	a2,16
    80009294:	4581                	li	a1,0
    80009296:	853e                	mv	a0,a5
    80009298:	ffff8097          	auipc	ra,0xffff8
    8000929c:	1aa080e7          	jalr	426(ra) # 80001442 <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    800092a0:	fd040793          	addi	a5,s0,-48
    800092a4:	f3c42683          	lw	a3,-196(s0)
    800092a8:	4741                	li	a4,16
    800092aa:	863e                	mv	a2,a5
    800092ac:	4581                	li	a1,0
    800092ae:	fe843503          	ld	a0,-24(s0)
    800092b2:	ffffe097          	auipc	ra,0xffffe
    800092b6:	a80080e7          	jalr	-1408(ra) # 80006d32 <writei>
    800092ba:	87aa                	mv	a5,a0
    800092bc:	873e                	mv	a4,a5
    800092be:	47c1                	li	a5,16
    800092c0:	00f70a63          	beq	a4,a5,800092d4 <sys_unlink+0x160>
    panic("unlink: writei");
    800092c4:	00003517          	auipc	a0,0x3
    800092c8:	38c50513          	addi	a0,a0,908 # 8000c650 <etext+0x650>
    800092cc:	ffff8097          	auipc	ra,0xffff8
    800092d0:	9b2080e7          	jalr	-1614(ra) # 80000c7e <panic>
  if(ip->type == T_DIR){
    800092d4:	fe043783          	ld	a5,-32(s0)
    800092d8:	04479783          	lh	a5,68(a5)
    800092dc:	0007871b          	sext.w	a4,a5
    800092e0:	4785                	li	a5,1
    800092e2:	02f71963          	bne	a4,a5,80009314 <sys_unlink+0x1a0>
    dp->nlink--;
    800092e6:	fe843783          	ld	a5,-24(s0)
    800092ea:	04a79783          	lh	a5,74(a5)
    800092ee:	17c2                	slli	a5,a5,0x30
    800092f0:	93c1                	srli	a5,a5,0x30
    800092f2:	37fd                	addiw	a5,a5,-1
    800092f4:	17c2                	slli	a5,a5,0x30
    800092f6:	93c1                	srli	a5,a5,0x30
    800092f8:	0107971b          	slliw	a4,a5,0x10
    800092fc:	4107571b          	sraiw	a4,a4,0x10
    80009300:	fe843783          	ld	a5,-24(s0)
    80009304:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80009308:	fe843503          	ld	a0,-24(s0)
    8000930c:	ffffd097          	auipc	ra,0xffffd
    80009310:	0b6080e7          	jalr	182(ra) # 800063c2 <iupdate>
  }
  iunlockput(dp);
    80009314:	fe843503          	ld	a0,-24(s0)
    80009318:	ffffd097          	auipc	ra,0xffffd
    8000931c:	558080e7          	jalr	1368(ra) # 80006870 <iunlockput>

  ip->nlink--;
    80009320:	fe043783          	ld	a5,-32(s0)
    80009324:	04a79783          	lh	a5,74(a5)
    80009328:	17c2                	slli	a5,a5,0x30
    8000932a:	93c1                	srli	a5,a5,0x30
    8000932c:	37fd                	addiw	a5,a5,-1
    8000932e:	17c2                	slli	a5,a5,0x30
    80009330:	93c1                	srli	a5,a5,0x30
    80009332:	0107971b          	slliw	a4,a5,0x10
    80009336:	4107571b          	sraiw	a4,a4,0x10
    8000933a:	fe043783          	ld	a5,-32(s0)
    8000933e:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80009342:	fe043503          	ld	a0,-32(s0)
    80009346:	ffffd097          	auipc	ra,0xffffd
    8000934a:	07c080e7          	jalr	124(ra) # 800063c2 <iupdate>
  iunlockput(ip);
    8000934e:	fe043503          	ld	a0,-32(s0)
    80009352:	ffffd097          	auipc	ra,0xffffd
    80009356:	51e080e7          	jalr	1310(ra) # 80006870 <iunlockput>

  end_op();
    8000935a:	ffffe097          	auipc	ra,0xffffe
    8000935e:	3d4080e7          	jalr	980(ra) # 8000772e <end_op>

  return 0;
    80009362:	4781                	li	a5,0
    80009364:	a839                	j	80009382 <sys_unlink+0x20e>
    goto bad;
    80009366:	0001                	nop
    80009368:	a011                	j	8000936c <sys_unlink+0x1f8>
    goto bad;
    8000936a:	0001                	nop

bad:
  iunlockput(dp);
    8000936c:	fe843503          	ld	a0,-24(s0)
    80009370:	ffffd097          	auipc	ra,0xffffd
    80009374:	500080e7          	jalr	1280(ra) # 80006870 <iunlockput>
  end_op();
    80009378:	ffffe097          	auipc	ra,0xffffe
    8000937c:	3b6080e7          	jalr	950(ra) # 8000772e <end_op>
  return -1;
    80009380:	57fd                	li	a5,-1
}
    80009382:	853e                	mv	a0,a5
    80009384:	60ae                	ld	ra,200(sp)
    80009386:	640e                	ld	s0,192(sp)
    80009388:	6169                	addi	sp,sp,208
    8000938a:	8082                	ret

000000008000938c <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    8000938c:	7139                	addi	sp,sp,-64
    8000938e:	fc06                	sd	ra,56(sp)
    80009390:	f822                	sd	s0,48(sp)
    80009392:	0080                	addi	s0,sp,64
    80009394:	fca43423          	sd	a0,-56(s0)
    80009398:	87ae                	mv	a5,a1
    8000939a:	8736                	mv	a4,a3
    8000939c:	fcf41323          	sh	a5,-58(s0)
    800093a0:	87b2                	mv	a5,a2
    800093a2:	fcf41223          	sh	a5,-60(s0)
    800093a6:	87ba                	mv	a5,a4
    800093a8:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    800093ac:	fd040793          	addi	a5,s0,-48
    800093b0:	85be                	mv	a1,a5
    800093b2:	fc843503          	ld	a0,-56(s0)
    800093b6:	ffffe097          	auipc	ra,0xffffe
    800093ba:	f7e080e7          	jalr	-130(ra) # 80007334 <nameiparent>
    800093be:	fea43423          	sd	a0,-24(s0)
    800093c2:	fe843783          	ld	a5,-24(s0)
    800093c6:	e399                	bnez	a5,800093cc <create+0x40>
    return 0;
    800093c8:	4781                	li	a5,0
    800093ca:	a2d9                	j	80009590 <create+0x204>

  ilock(dp);
    800093cc:	fe843503          	ld	a0,-24(s0)
    800093d0:	ffffd097          	auipc	ra,0xffffd
    800093d4:	242080e7          	jalr	578(ra) # 80006612 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    800093d8:	fd040793          	addi	a5,s0,-48
    800093dc:	4601                	li	a2,0
    800093de:	85be                	mv	a1,a5
    800093e0:	fe843503          	ld	a0,-24(s0)
    800093e4:	ffffe097          	auipc	ra,0xffffe
    800093e8:	b22080e7          	jalr	-1246(ra) # 80006f06 <dirlookup>
    800093ec:	fea43023          	sd	a0,-32(s0)
    800093f0:	fe043783          	ld	a5,-32(s0)
    800093f4:	c3ad                	beqz	a5,80009456 <create+0xca>
    iunlockput(dp);
    800093f6:	fe843503          	ld	a0,-24(s0)
    800093fa:	ffffd097          	auipc	ra,0xffffd
    800093fe:	476080e7          	jalr	1142(ra) # 80006870 <iunlockput>
    ilock(ip);
    80009402:	fe043503          	ld	a0,-32(s0)
    80009406:	ffffd097          	auipc	ra,0xffffd
    8000940a:	20c080e7          	jalr	524(ra) # 80006612 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    8000940e:	fc641783          	lh	a5,-58(s0)
    80009412:	0007871b          	sext.w	a4,a5
    80009416:	4789                	li	a5,2
    80009418:	02f71763          	bne	a4,a5,80009446 <create+0xba>
    8000941c:	fe043783          	ld	a5,-32(s0)
    80009420:	04479783          	lh	a5,68(a5)
    80009424:	0007871b          	sext.w	a4,a5
    80009428:	4789                	li	a5,2
    8000942a:	00f70b63          	beq	a4,a5,80009440 <create+0xb4>
    8000942e:	fe043783          	ld	a5,-32(s0)
    80009432:	04479783          	lh	a5,68(a5)
    80009436:	0007871b          	sext.w	a4,a5
    8000943a:	478d                	li	a5,3
    8000943c:	00f71563          	bne	a4,a5,80009446 <create+0xba>
      return ip;
    80009440:	fe043783          	ld	a5,-32(s0)
    80009444:	a2b1                	j	80009590 <create+0x204>
    iunlockput(ip);
    80009446:	fe043503          	ld	a0,-32(s0)
    8000944a:	ffffd097          	auipc	ra,0xffffd
    8000944e:	426080e7          	jalr	1062(ra) # 80006870 <iunlockput>
    return 0;
    80009452:	4781                	li	a5,0
    80009454:	aa35                	j	80009590 <create+0x204>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    80009456:	fe843783          	ld	a5,-24(s0)
    8000945a:	439c                	lw	a5,0(a5)
    8000945c:	fc641703          	lh	a4,-58(s0)
    80009460:	85ba                	mv	a1,a4
    80009462:	853e                	mv	a0,a5
    80009464:	ffffd097          	auipc	ra,0xffffd
    80009468:	e62080e7          	jalr	-414(ra) # 800062c6 <ialloc>
    8000946c:	fea43023          	sd	a0,-32(s0)
    80009470:	fe043783          	ld	a5,-32(s0)
    80009474:	eb89                	bnez	a5,80009486 <create+0xfa>
    panic("create: ialloc");
    80009476:	00003517          	auipc	a0,0x3
    8000947a:	1ea50513          	addi	a0,a0,490 # 8000c660 <etext+0x660>
    8000947e:	ffff8097          	auipc	ra,0xffff8
    80009482:	800080e7          	jalr	-2048(ra) # 80000c7e <panic>

  ilock(ip);
    80009486:	fe043503          	ld	a0,-32(s0)
    8000948a:	ffffd097          	auipc	ra,0xffffd
    8000948e:	188080e7          	jalr	392(ra) # 80006612 <ilock>
  ip->major = major;
    80009492:	fe043783          	ld	a5,-32(s0)
    80009496:	fc445703          	lhu	a4,-60(s0)
    8000949a:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    8000949e:	fe043783          	ld	a5,-32(s0)
    800094a2:	fc245703          	lhu	a4,-62(s0)
    800094a6:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    800094aa:	fe043783          	ld	a5,-32(s0)
    800094ae:	4705                	li	a4,1
    800094b0:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    800094b4:	fe043503          	ld	a0,-32(s0)
    800094b8:	ffffd097          	auipc	ra,0xffffd
    800094bc:	f0a080e7          	jalr	-246(ra) # 800063c2 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    800094c0:	fc641783          	lh	a5,-58(s0)
    800094c4:	0007871b          	sext.w	a4,a5
    800094c8:	4785                	li	a5,1
    800094ca:	08f71363          	bne	a4,a5,80009550 <create+0x1c4>
    dp->nlink++;  // for ".."
    800094ce:	fe843783          	ld	a5,-24(s0)
    800094d2:	04a79783          	lh	a5,74(a5)
    800094d6:	17c2                	slli	a5,a5,0x30
    800094d8:	93c1                	srli	a5,a5,0x30
    800094da:	2785                	addiw	a5,a5,1
    800094dc:	17c2                	slli	a5,a5,0x30
    800094de:	93c1                	srli	a5,a5,0x30
    800094e0:	0107971b          	slliw	a4,a5,0x10
    800094e4:	4107571b          	sraiw	a4,a4,0x10
    800094e8:	fe843783          	ld	a5,-24(s0)
    800094ec:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800094f0:	fe843503          	ld	a0,-24(s0)
    800094f4:	ffffd097          	auipc	ra,0xffffd
    800094f8:	ece080e7          	jalr	-306(ra) # 800063c2 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    800094fc:	fe043783          	ld	a5,-32(s0)
    80009500:	43dc                	lw	a5,4(a5)
    80009502:	863e                	mv	a2,a5
    80009504:	00003597          	auipc	a1,0x3
    80009508:	12458593          	addi	a1,a1,292 # 8000c628 <etext+0x628>
    8000950c:	fe043503          	ld	a0,-32(s0)
    80009510:	ffffe097          	auipc	ra,0xffffe
    80009514:	ade080e7          	jalr	-1314(ra) # 80006fee <dirlink>
    80009518:	87aa                	mv	a5,a0
    8000951a:	0207c363          	bltz	a5,80009540 <create+0x1b4>
    8000951e:	fe843783          	ld	a5,-24(s0)
    80009522:	43dc                	lw	a5,4(a5)
    80009524:	863e                	mv	a2,a5
    80009526:	00003597          	auipc	a1,0x3
    8000952a:	10a58593          	addi	a1,a1,266 # 8000c630 <etext+0x630>
    8000952e:	fe043503          	ld	a0,-32(s0)
    80009532:	ffffe097          	auipc	ra,0xffffe
    80009536:	abc080e7          	jalr	-1348(ra) # 80006fee <dirlink>
    8000953a:	87aa                	mv	a5,a0
    8000953c:	0007da63          	bgez	a5,80009550 <create+0x1c4>
      panic("create dots");
    80009540:	00003517          	auipc	a0,0x3
    80009544:	13050513          	addi	a0,a0,304 # 8000c670 <etext+0x670>
    80009548:	ffff7097          	auipc	ra,0xffff7
    8000954c:	736080e7          	jalr	1846(ra) # 80000c7e <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    80009550:	fe043783          	ld	a5,-32(s0)
    80009554:	43d8                	lw	a4,4(a5)
    80009556:	fd040793          	addi	a5,s0,-48
    8000955a:	863a                	mv	a2,a4
    8000955c:	85be                	mv	a1,a5
    8000955e:	fe843503          	ld	a0,-24(s0)
    80009562:	ffffe097          	auipc	ra,0xffffe
    80009566:	a8c080e7          	jalr	-1396(ra) # 80006fee <dirlink>
    8000956a:	87aa                	mv	a5,a0
    8000956c:	0007da63          	bgez	a5,80009580 <create+0x1f4>
    panic("create: dirlink");
    80009570:	00003517          	auipc	a0,0x3
    80009574:	11050513          	addi	a0,a0,272 # 8000c680 <etext+0x680>
    80009578:	ffff7097          	auipc	ra,0xffff7
    8000957c:	706080e7          	jalr	1798(ra) # 80000c7e <panic>

  iunlockput(dp);
    80009580:	fe843503          	ld	a0,-24(s0)
    80009584:	ffffd097          	auipc	ra,0xffffd
    80009588:	2ec080e7          	jalr	748(ra) # 80006870 <iunlockput>

  return ip;
    8000958c:	fe043783          	ld	a5,-32(s0)
}
    80009590:	853e                	mv	a0,a5
    80009592:	70e2                	ld	ra,56(sp)
    80009594:	7442                	ld	s0,48(sp)
    80009596:	6121                	addi	sp,sp,64
    80009598:	8082                	ret

000000008000959a <sys_open>:

uint64
sys_open(void)
{
    8000959a:	7131                	addi	sp,sp,-192
    8000959c:	fd06                	sd	ra,184(sp)
    8000959e:	f922                	sd	s0,176(sp)
    800095a0:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  if((n = argstr(0, path, MAXPATH)) < 0 || argint(1, &omode) < 0)
    800095a2:	f5040793          	addi	a5,s0,-176
    800095a6:	08000613          	li	a2,128
    800095aa:	85be                	mv	a1,a5
    800095ac:	4501                	li	a0,0
    800095ae:	ffffc097          	auipc	ra,0xffffc
    800095b2:	066080e7          	jalr	102(ra) # 80005614 <argstr>
    800095b6:	87aa                	mv	a5,a0
    800095b8:	fef42223          	sw	a5,-28(s0)
    800095bc:	fe442783          	lw	a5,-28(s0)
    800095c0:	2781                	sext.w	a5,a5
    800095c2:	0007cd63          	bltz	a5,800095dc <sys_open+0x42>
    800095c6:	f4c40793          	addi	a5,s0,-180
    800095ca:	85be                	mv	a1,a5
    800095cc:	4505                	li	a0,1
    800095ce:	ffffc097          	auipc	ra,0xffffc
    800095d2:	fda080e7          	jalr	-38(ra) # 800055a8 <argint>
    800095d6:	87aa                	mv	a5,a0
    800095d8:	0007d463          	bgez	a5,800095e0 <sys_open+0x46>
    return -1;
    800095dc:	57fd                	li	a5,-1
    800095de:	a429                	j	800097e8 <sys_open+0x24e>

  begin_op();
    800095e0:	ffffe097          	auipc	ra,0xffffe
    800095e4:	08c080e7          	jalr	140(ra) # 8000766c <begin_op>

  if(omode & O_CREATE){
    800095e8:	f4c42783          	lw	a5,-180(s0)
    800095ec:	2007f793          	andi	a5,a5,512
    800095f0:	2781                	sext.w	a5,a5
    800095f2:	c795                	beqz	a5,8000961e <sys_open+0x84>
    ip = create(path, T_FILE, 0, 0);
    800095f4:	f5040793          	addi	a5,s0,-176
    800095f8:	4681                	li	a3,0
    800095fa:	4601                	li	a2,0
    800095fc:	4589                	li	a1,2
    800095fe:	853e                	mv	a0,a5
    80009600:	00000097          	auipc	ra,0x0
    80009604:	d8c080e7          	jalr	-628(ra) # 8000938c <create>
    80009608:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    8000960c:	fe843783          	ld	a5,-24(s0)
    80009610:	e7bd                	bnez	a5,8000967e <sys_open+0xe4>
      end_op();
    80009612:	ffffe097          	auipc	ra,0xffffe
    80009616:	11c080e7          	jalr	284(ra) # 8000772e <end_op>
      return -1;
    8000961a:	57fd                	li	a5,-1
    8000961c:	a2f1                	j	800097e8 <sys_open+0x24e>
    }
  } else {
    if((ip = namei(path)) == 0){
    8000961e:	f5040793          	addi	a5,s0,-176
    80009622:	853e                	mv	a0,a5
    80009624:	ffffe097          	auipc	ra,0xffffe
    80009628:	ce4080e7          	jalr	-796(ra) # 80007308 <namei>
    8000962c:	fea43423          	sd	a0,-24(s0)
    80009630:	fe843783          	ld	a5,-24(s0)
    80009634:	e799                	bnez	a5,80009642 <sys_open+0xa8>
      end_op();
    80009636:	ffffe097          	auipc	ra,0xffffe
    8000963a:	0f8080e7          	jalr	248(ra) # 8000772e <end_op>
      return -1;
    8000963e:	57fd                	li	a5,-1
    80009640:	a265                	j	800097e8 <sys_open+0x24e>
    }
    ilock(ip);
    80009642:	fe843503          	ld	a0,-24(s0)
    80009646:	ffffd097          	auipc	ra,0xffffd
    8000964a:	fcc080e7          	jalr	-52(ra) # 80006612 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    8000964e:	fe843783          	ld	a5,-24(s0)
    80009652:	04479783          	lh	a5,68(a5)
    80009656:	0007871b          	sext.w	a4,a5
    8000965a:	4785                	li	a5,1
    8000965c:	02f71163          	bne	a4,a5,8000967e <sys_open+0xe4>
    80009660:	f4c42783          	lw	a5,-180(s0)
    80009664:	cf89                	beqz	a5,8000967e <sys_open+0xe4>
      iunlockput(ip);
    80009666:	fe843503          	ld	a0,-24(s0)
    8000966a:	ffffd097          	auipc	ra,0xffffd
    8000966e:	206080e7          	jalr	518(ra) # 80006870 <iunlockput>
      end_op();
    80009672:	ffffe097          	auipc	ra,0xffffe
    80009676:	0bc080e7          	jalr	188(ra) # 8000772e <end_op>
      return -1;
    8000967a:	57fd                	li	a5,-1
    8000967c:	a2b5                	j	800097e8 <sys_open+0x24e>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    8000967e:	fe843783          	ld	a5,-24(s0)
    80009682:	04479783          	lh	a5,68(a5)
    80009686:	0007871b          	sext.w	a4,a5
    8000968a:	478d                	li	a5,3
    8000968c:	02f71e63          	bne	a4,a5,800096c8 <sys_open+0x12e>
    80009690:	fe843783          	ld	a5,-24(s0)
    80009694:	04679783          	lh	a5,70(a5)
    80009698:	2781                	sext.w	a5,a5
    8000969a:	0007cb63          	bltz	a5,800096b0 <sys_open+0x116>
    8000969e:	fe843783          	ld	a5,-24(s0)
    800096a2:	04679783          	lh	a5,70(a5)
    800096a6:	0007871b          	sext.w	a4,a5
    800096aa:	47a5                	li	a5,9
    800096ac:	00e7de63          	bge	a5,a4,800096c8 <sys_open+0x12e>
    iunlockput(ip);
    800096b0:	fe843503          	ld	a0,-24(s0)
    800096b4:	ffffd097          	auipc	ra,0xffffd
    800096b8:	1bc080e7          	jalr	444(ra) # 80006870 <iunlockput>
    end_op();
    800096bc:	ffffe097          	auipc	ra,0xffffe
    800096c0:	072080e7          	jalr	114(ra) # 8000772e <end_op>
    return -1;
    800096c4:	57fd                	li	a5,-1
    800096c6:	a20d                	j	800097e8 <sys_open+0x24e>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    800096c8:	ffffe097          	auipc	ra,0xffffe
    800096cc:	554080e7          	jalr	1364(ra) # 80007c1c <filealloc>
    800096d0:	fca43c23          	sd	a0,-40(s0)
    800096d4:	fd843783          	ld	a5,-40(s0)
    800096d8:	cf99                	beqz	a5,800096f6 <sys_open+0x15c>
    800096da:	fd843503          	ld	a0,-40(s0)
    800096de:	fffff097          	auipc	ra,0xfffff
    800096e2:	5e8080e7          	jalr	1512(ra) # 80008cc6 <fdalloc>
    800096e6:	87aa                	mv	a5,a0
    800096e8:	fcf42a23          	sw	a5,-44(s0)
    800096ec:	fd442783          	lw	a5,-44(s0)
    800096f0:	2781                	sext.w	a5,a5
    800096f2:	0207d763          	bgez	a5,80009720 <sys_open+0x186>
    if(f)
    800096f6:	fd843783          	ld	a5,-40(s0)
    800096fa:	c799                	beqz	a5,80009708 <sys_open+0x16e>
      fileclose(f);
    800096fc:	fd843503          	ld	a0,-40(s0)
    80009700:	ffffe097          	auipc	ra,0xffffe
    80009704:	606080e7          	jalr	1542(ra) # 80007d06 <fileclose>
    iunlockput(ip);
    80009708:	fe843503          	ld	a0,-24(s0)
    8000970c:	ffffd097          	auipc	ra,0xffffd
    80009710:	164080e7          	jalr	356(ra) # 80006870 <iunlockput>
    end_op();
    80009714:	ffffe097          	auipc	ra,0xffffe
    80009718:	01a080e7          	jalr	26(ra) # 8000772e <end_op>
    return -1;
    8000971c:	57fd                	li	a5,-1
    8000971e:	a0e9                	j	800097e8 <sys_open+0x24e>
  }

  if(ip->type == T_DEVICE){
    80009720:	fe843783          	ld	a5,-24(s0)
    80009724:	04479783          	lh	a5,68(a5)
    80009728:	0007871b          	sext.w	a4,a5
    8000972c:	478d                	li	a5,3
    8000972e:	00f71f63          	bne	a4,a5,8000974c <sys_open+0x1b2>
    f->type = FD_DEVICE;
    80009732:	fd843783          	ld	a5,-40(s0)
    80009736:	470d                	li	a4,3
    80009738:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    8000973a:	fe843783          	ld	a5,-24(s0)
    8000973e:	04679703          	lh	a4,70(a5)
    80009742:	fd843783          	ld	a5,-40(s0)
    80009746:	02e79223          	sh	a4,36(a5)
    8000974a:	a809                	j	8000975c <sys_open+0x1c2>
  } else {
    f->type = FD_INODE;
    8000974c:	fd843783          	ld	a5,-40(s0)
    80009750:	4709                	li	a4,2
    80009752:	c398                	sw	a4,0(a5)
    f->off = 0;
    80009754:	fd843783          	ld	a5,-40(s0)
    80009758:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    8000975c:	fd843783          	ld	a5,-40(s0)
    80009760:	fe843703          	ld	a4,-24(s0)
    80009764:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    80009766:	f4c42783          	lw	a5,-180(s0)
    8000976a:	8b85                	andi	a5,a5,1
    8000976c:	2781                	sext.w	a5,a5
    8000976e:	0017b793          	seqz	a5,a5
    80009772:	0ff7f793          	andi	a5,a5,255
    80009776:	873e                	mv	a4,a5
    80009778:	fd843783          	ld	a5,-40(s0)
    8000977c:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80009780:	f4c42783          	lw	a5,-180(s0)
    80009784:	8b85                	andi	a5,a5,1
    80009786:	2781                	sext.w	a5,a5
    80009788:	e791                	bnez	a5,80009794 <sys_open+0x1fa>
    8000978a:	f4c42783          	lw	a5,-180(s0)
    8000978e:	8b89                	andi	a5,a5,2
    80009790:	2781                	sext.w	a5,a5
    80009792:	c399                	beqz	a5,80009798 <sys_open+0x1fe>
    80009794:	4785                	li	a5,1
    80009796:	a011                	j	8000979a <sys_open+0x200>
    80009798:	4781                	li	a5,0
    8000979a:	0ff7f713          	andi	a4,a5,255
    8000979e:	fd843783          	ld	a5,-40(s0)
    800097a2:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    800097a6:	f4c42783          	lw	a5,-180(s0)
    800097aa:	4007f793          	andi	a5,a5,1024
    800097ae:	2781                	sext.w	a5,a5
    800097b0:	c385                	beqz	a5,800097d0 <sys_open+0x236>
    800097b2:	fe843783          	ld	a5,-24(s0)
    800097b6:	04479783          	lh	a5,68(a5)
    800097ba:	0007871b          	sext.w	a4,a5
    800097be:	4789                	li	a5,2
    800097c0:	00f71863          	bne	a4,a5,800097d0 <sys_open+0x236>
    itrunc(ip);
    800097c4:	fe843503          	ld	a0,-24(s0)
    800097c8:	ffffd097          	auipc	ra,0xffffd
    800097cc:	232080e7          	jalr	562(ra) # 800069fa <itrunc>
  }

  iunlock(ip);
    800097d0:	fe843503          	ld	a0,-24(s0)
    800097d4:	ffffd097          	auipc	ra,0xffffd
    800097d8:	f72080e7          	jalr	-142(ra) # 80006746 <iunlock>
  end_op();
    800097dc:	ffffe097          	auipc	ra,0xffffe
    800097e0:	f52080e7          	jalr	-174(ra) # 8000772e <end_op>

  return fd;
    800097e4:	fd442783          	lw	a5,-44(s0)
}
    800097e8:	853e                	mv	a0,a5
    800097ea:	70ea                	ld	ra,184(sp)
    800097ec:	744a                	ld	s0,176(sp)
    800097ee:	6129                	addi	sp,sp,192
    800097f0:	8082                	ret

00000000800097f2 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    800097f2:	7135                	addi	sp,sp,-160
    800097f4:	ed06                	sd	ra,152(sp)
    800097f6:	e922                	sd	s0,144(sp)
    800097f8:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    800097fa:	ffffe097          	auipc	ra,0xffffe
    800097fe:	e72080e7          	jalr	-398(ra) # 8000766c <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    80009802:	f6840793          	addi	a5,s0,-152
    80009806:	08000613          	li	a2,128
    8000980a:	85be                	mv	a1,a5
    8000980c:	4501                	li	a0,0
    8000980e:	ffffc097          	auipc	ra,0xffffc
    80009812:	e06080e7          	jalr	-506(ra) # 80005614 <argstr>
    80009816:	87aa                	mv	a5,a0
    80009818:	0207c163          	bltz	a5,8000983a <sys_mkdir+0x48>
    8000981c:	f6840793          	addi	a5,s0,-152
    80009820:	4681                	li	a3,0
    80009822:	4601                	li	a2,0
    80009824:	4585                	li	a1,1
    80009826:	853e                	mv	a0,a5
    80009828:	00000097          	auipc	ra,0x0
    8000982c:	b64080e7          	jalr	-1180(ra) # 8000938c <create>
    80009830:	fea43423          	sd	a0,-24(s0)
    80009834:	fe843783          	ld	a5,-24(s0)
    80009838:	e799                	bnez	a5,80009846 <sys_mkdir+0x54>
    end_op();
    8000983a:	ffffe097          	auipc	ra,0xffffe
    8000983e:	ef4080e7          	jalr	-268(ra) # 8000772e <end_op>
    return -1;
    80009842:	57fd                	li	a5,-1
    80009844:	a821                	j	8000985c <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    80009846:	fe843503          	ld	a0,-24(s0)
    8000984a:	ffffd097          	auipc	ra,0xffffd
    8000984e:	026080e7          	jalr	38(ra) # 80006870 <iunlockput>
  end_op();
    80009852:	ffffe097          	auipc	ra,0xffffe
    80009856:	edc080e7          	jalr	-292(ra) # 8000772e <end_op>
  return 0;
    8000985a:	4781                	li	a5,0
}
    8000985c:	853e                	mv	a0,a5
    8000985e:	60ea                	ld	ra,152(sp)
    80009860:	644a                	ld	s0,144(sp)
    80009862:	610d                	addi	sp,sp,160
    80009864:	8082                	ret

0000000080009866 <sys_mknod>:

uint64
sys_mknod(void)
{
    80009866:	7135                	addi	sp,sp,-160
    80009868:	ed06                	sd	ra,152(sp)
    8000986a:	e922                	sd	s0,144(sp)
    8000986c:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    8000986e:	ffffe097          	auipc	ra,0xffffe
    80009872:	dfe080e7          	jalr	-514(ra) # 8000766c <begin_op>
  if((argstr(0, path, MAXPATH)) < 0 ||
    80009876:	f6840793          	addi	a5,s0,-152
    8000987a:	08000613          	li	a2,128
    8000987e:	85be                	mv	a1,a5
    80009880:	4501                	li	a0,0
    80009882:	ffffc097          	auipc	ra,0xffffc
    80009886:	d92080e7          	jalr	-622(ra) # 80005614 <argstr>
    8000988a:	87aa                	mv	a5,a0
    8000988c:	0607c263          	bltz	a5,800098f0 <sys_mknod+0x8a>
     argint(1, &major) < 0 ||
    80009890:	f6440793          	addi	a5,s0,-156
    80009894:	85be                	mv	a1,a5
    80009896:	4505                	li	a0,1
    80009898:	ffffc097          	auipc	ra,0xffffc
    8000989c:	d10080e7          	jalr	-752(ra) # 800055a8 <argint>
    800098a0:	87aa                	mv	a5,a0
  if((argstr(0, path, MAXPATH)) < 0 ||
    800098a2:	0407c763          	bltz	a5,800098f0 <sys_mknod+0x8a>
     argint(2, &minor) < 0 ||
    800098a6:	f6040793          	addi	a5,s0,-160
    800098aa:	85be                	mv	a1,a5
    800098ac:	4509                	li	a0,2
    800098ae:	ffffc097          	auipc	ra,0xffffc
    800098b2:	cfa080e7          	jalr	-774(ra) # 800055a8 <argint>
    800098b6:	87aa                	mv	a5,a0
     argint(1, &major) < 0 ||
    800098b8:	0207cc63          	bltz	a5,800098f0 <sys_mknod+0x8a>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    800098bc:	f6442783          	lw	a5,-156(s0)
    800098c0:	0107971b          	slliw	a4,a5,0x10
    800098c4:	4107571b          	sraiw	a4,a4,0x10
    800098c8:	f6042783          	lw	a5,-160(s0)
    800098cc:	0107969b          	slliw	a3,a5,0x10
    800098d0:	4106d69b          	sraiw	a3,a3,0x10
    800098d4:	f6840793          	addi	a5,s0,-152
    800098d8:	863a                	mv	a2,a4
    800098da:	458d                	li	a1,3
    800098dc:	853e                	mv	a0,a5
    800098de:	00000097          	auipc	ra,0x0
    800098e2:	aae080e7          	jalr	-1362(ra) # 8000938c <create>
    800098e6:	fea43423          	sd	a0,-24(s0)
     argint(2, &minor) < 0 ||
    800098ea:	fe843783          	ld	a5,-24(s0)
    800098ee:	e799                	bnez	a5,800098fc <sys_mknod+0x96>
    end_op();
    800098f0:	ffffe097          	auipc	ra,0xffffe
    800098f4:	e3e080e7          	jalr	-450(ra) # 8000772e <end_op>
    return -1;
    800098f8:	57fd                	li	a5,-1
    800098fa:	a821                	j	80009912 <sys_mknod+0xac>
  }
  iunlockput(ip);
    800098fc:	fe843503          	ld	a0,-24(s0)
    80009900:	ffffd097          	auipc	ra,0xffffd
    80009904:	f70080e7          	jalr	-144(ra) # 80006870 <iunlockput>
  end_op();
    80009908:	ffffe097          	auipc	ra,0xffffe
    8000990c:	e26080e7          	jalr	-474(ra) # 8000772e <end_op>
  return 0;
    80009910:	4781                	li	a5,0
}
    80009912:	853e                	mv	a0,a5
    80009914:	60ea                	ld	ra,152(sp)
    80009916:	644a                	ld	s0,144(sp)
    80009918:	610d                	addi	sp,sp,160
    8000991a:	8082                	ret

000000008000991c <sys_chdir>:

uint64
sys_chdir(void)
{
    8000991c:	7135                	addi	sp,sp,-160
    8000991e:	ed06                	sd	ra,152(sp)
    80009920:	e922                	sd	s0,144(sp)
    80009922:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    80009924:	ffff9097          	auipc	ra,0xffff9
    80009928:	f08080e7          	jalr	-248(ra) # 8000282c <myproc>
    8000992c:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    80009930:	ffffe097          	auipc	ra,0xffffe
    80009934:	d3c080e7          	jalr	-708(ra) # 8000766c <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    80009938:	f6040793          	addi	a5,s0,-160
    8000993c:	08000613          	li	a2,128
    80009940:	85be                	mv	a1,a5
    80009942:	4501                	li	a0,0
    80009944:	ffffc097          	auipc	ra,0xffffc
    80009948:	cd0080e7          	jalr	-816(ra) # 80005614 <argstr>
    8000994c:	87aa                	mv	a5,a0
    8000994e:	0007ce63          	bltz	a5,8000996a <sys_chdir+0x4e>
    80009952:	f6040793          	addi	a5,s0,-160
    80009956:	853e                	mv	a0,a5
    80009958:	ffffe097          	auipc	ra,0xffffe
    8000995c:	9b0080e7          	jalr	-1616(ra) # 80007308 <namei>
    80009960:	fea43023          	sd	a0,-32(s0)
    80009964:	fe043783          	ld	a5,-32(s0)
    80009968:	e799                	bnez	a5,80009976 <sys_chdir+0x5a>
    end_op();
    8000996a:	ffffe097          	auipc	ra,0xffffe
    8000996e:	dc4080e7          	jalr	-572(ra) # 8000772e <end_op>
    return -1;
    80009972:	57fd                	li	a5,-1
    80009974:	a0b5                	j	800099e0 <sys_chdir+0xc4>
  }
  ilock(ip);
    80009976:	fe043503          	ld	a0,-32(s0)
    8000997a:	ffffd097          	auipc	ra,0xffffd
    8000997e:	c98080e7          	jalr	-872(ra) # 80006612 <ilock>
  if(ip->type != T_DIR){
    80009982:	fe043783          	ld	a5,-32(s0)
    80009986:	04479783          	lh	a5,68(a5)
    8000998a:	0007871b          	sext.w	a4,a5
    8000998e:	4785                	li	a5,1
    80009990:	00f70e63          	beq	a4,a5,800099ac <sys_chdir+0x90>
    iunlockput(ip);
    80009994:	fe043503          	ld	a0,-32(s0)
    80009998:	ffffd097          	auipc	ra,0xffffd
    8000999c:	ed8080e7          	jalr	-296(ra) # 80006870 <iunlockput>
    end_op();
    800099a0:	ffffe097          	auipc	ra,0xffffe
    800099a4:	d8e080e7          	jalr	-626(ra) # 8000772e <end_op>
    return -1;
    800099a8:	57fd                	li	a5,-1
    800099aa:	a81d                	j	800099e0 <sys_chdir+0xc4>
  }
  iunlock(ip);
    800099ac:	fe043503          	ld	a0,-32(s0)
    800099b0:	ffffd097          	auipc	ra,0xffffd
    800099b4:	d96080e7          	jalr	-618(ra) # 80006746 <iunlock>
  iput(p->cwd);
    800099b8:	fe843783          	ld	a5,-24(s0)
    800099bc:	1507b783          	ld	a5,336(a5)
    800099c0:	853e                	mv	a0,a5
    800099c2:	ffffd097          	auipc	ra,0xffffd
    800099c6:	dde080e7          	jalr	-546(ra) # 800067a0 <iput>
  end_op();
    800099ca:	ffffe097          	auipc	ra,0xffffe
    800099ce:	d64080e7          	jalr	-668(ra) # 8000772e <end_op>
  p->cwd = ip;
    800099d2:	fe843783          	ld	a5,-24(s0)
    800099d6:	fe043703          	ld	a4,-32(s0)
    800099da:	14e7b823          	sd	a4,336(a5)
  return 0;
    800099de:	4781                	li	a5,0
}
    800099e0:	853e                	mv	a0,a5
    800099e2:	60ea                	ld	ra,152(sp)
    800099e4:	644a                	ld	s0,144(sp)
    800099e6:	610d                	addi	sp,sp,160
    800099e8:	8082                	ret

00000000800099ea <sys_exec>:

uint64
sys_exec(void)
{
    800099ea:	7161                	addi	sp,sp,-432
    800099ec:	f706                	sd	ra,424(sp)
    800099ee:	f322                	sd	s0,416(sp)
    800099f0:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, MAXPATH) < 0 || argaddr(1, &uargv) < 0){
    800099f2:	f6840793          	addi	a5,s0,-152
    800099f6:	08000613          	li	a2,128
    800099fa:	85be                	mv	a1,a5
    800099fc:	4501                	li	a0,0
    800099fe:	ffffc097          	auipc	ra,0xffffc
    80009a02:	c16080e7          	jalr	-1002(ra) # 80005614 <argstr>
    80009a06:	87aa                	mv	a5,a0
    80009a08:	0007cd63          	bltz	a5,80009a22 <sys_exec+0x38>
    80009a0c:	e6040793          	addi	a5,s0,-416
    80009a10:	85be                	mv	a1,a5
    80009a12:	4505                	li	a0,1
    80009a14:	ffffc097          	auipc	ra,0xffffc
    80009a18:	bcc080e7          	jalr	-1076(ra) # 800055e0 <argaddr>
    80009a1c:	87aa                	mv	a5,a0
    80009a1e:	0007d463          	bgez	a5,80009a26 <sys_exec+0x3c>
    return -1;
    80009a22:	57fd                	li	a5,-1
    80009a24:	a249                	j	80009ba6 <sys_exec+0x1bc>
  }
  memset(argv, 0, sizeof(argv));
    80009a26:	e6840793          	addi	a5,s0,-408
    80009a2a:	10000613          	li	a2,256
    80009a2e:	4581                	li	a1,0
    80009a30:	853e                	mv	a0,a5
    80009a32:	ffff8097          	auipc	ra,0xffff8
    80009a36:	a10080e7          	jalr	-1520(ra) # 80001442 <memset>
  for(i=0;; i++){
    80009a3a:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    80009a3e:	fec42783          	lw	a5,-20(s0)
    80009a42:	873e                	mv	a4,a5
    80009a44:	47fd                	li	a5,31
    80009a46:	10e7e463          	bltu	a5,a4,80009b4e <sys_exec+0x164>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80009a4a:	fec42783          	lw	a5,-20(s0)
    80009a4e:	00379713          	slli	a4,a5,0x3
    80009a52:	e6043783          	ld	a5,-416(s0)
    80009a56:	97ba                	add	a5,a5,a4
    80009a58:	e5840713          	addi	a4,s0,-424
    80009a5c:	85ba                	mv	a1,a4
    80009a5e:	853e                	mv	a0,a5
    80009a60:	ffffc097          	auipc	ra,0xffffc
    80009a64:	9ca080e7          	jalr	-1590(ra) # 8000542a <fetchaddr>
    80009a68:	87aa                	mv	a5,a0
    80009a6a:	0e07c463          	bltz	a5,80009b52 <sys_exec+0x168>
      goto bad;
    }
    if(uarg == 0){
    80009a6e:	e5843783          	ld	a5,-424(s0)
    80009a72:	eb95                	bnez	a5,80009aa6 <sys_exec+0xbc>
      argv[i] = 0;
    80009a74:	fec42783          	lw	a5,-20(s0)
    80009a78:	078e                	slli	a5,a5,0x3
    80009a7a:	ff040713          	addi	a4,s0,-16
    80009a7e:	97ba                	add	a5,a5,a4
    80009a80:	e607bc23          	sd	zero,-392(a5)
      break;
    80009a84:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    80009a86:	e6840713          	addi	a4,s0,-408
    80009a8a:	f6840793          	addi	a5,s0,-152
    80009a8e:	85ba                	mv	a1,a4
    80009a90:	853e                	mv	a0,a5
    80009a92:	fffff097          	auipc	ra,0xfffff
    80009a96:	c1a080e7          	jalr	-998(ra) # 800086ac <exec>
    80009a9a:	87aa                	mv	a5,a0
    80009a9c:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80009aa0:	fe042623          	sw	zero,-20(s0)
    80009aa4:	a059                	j	80009b2a <sys_exec+0x140>
    argv[i] = kalloc();
    80009aa6:	ffff7097          	auipc	ra,0xffff7
    80009aaa:	674080e7          	jalr	1652(ra) # 8000111a <kalloc>
    80009aae:	872a                	mv	a4,a0
    80009ab0:	fec42783          	lw	a5,-20(s0)
    80009ab4:	078e                	slli	a5,a5,0x3
    80009ab6:	ff040693          	addi	a3,s0,-16
    80009aba:	97b6                	add	a5,a5,a3
    80009abc:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    80009ac0:	fec42783          	lw	a5,-20(s0)
    80009ac4:	078e                	slli	a5,a5,0x3
    80009ac6:	ff040713          	addi	a4,s0,-16
    80009aca:	97ba                	add	a5,a5,a4
    80009acc:	e787b783          	ld	a5,-392(a5)
    80009ad0:	c3d9                	beqz	a5,80009b56 <sys_exec+0x16c>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80009ad2:	e5843703          	ld	a4,-424(s0)
    80009ad6:	fec42783          	lw	a5,-20(s0)
    80009ada:	078e                	slli	a5,a5,0x3
    80009adc:	ff040693          	addi	a3,s0,-16
    80009ae0:	97b6                	add	a5,a5,a3
    80009ae2:	e787b783          	ld	a5,-392(a5)
    80009ae6:	6605                	lui	a2,0x1
    80009ae8:	85be                	mv	a1,a5
    80009aea:	853a                	mv	a0,a4
    80009aec:	ffffc097          	auipc	ra,0xffffc
    80009af0:	9ac080e7          	jalr	-1620(ra) # 80005498 <fetchstr>
    80009af4:	87aa                	mv	a5,a0
    80009af6:	0607c263          	bltz	a5,80009b5a <sys_exec+0x170>
  for(i=0;; i++){
    80009afa:	fec42783          	lw	a5,-20(s0)
    80009afe:	2785                	addiw	a5,a5,1
    80009b00:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    80009b04:	bf2d                	j	80009a3e <sys_exec+0x54>
    kfree(argv[i]);
    80009b06:	fec42783          	lw	a5,-20(s0)
    80009b0a:	078e                	slli	a5,a5,0x3
    80009b0c:	ff040713          	addi	a4,s0,-16
    80009b10:	97ba                	add	a5,a5,a4
    80009b12:	e787b783          	ld	a5,-392(a5)
    80009b16:	853e                	mv	a0,a5
    80009b18:	ffff7097          	auipc	ra,0xffff7
    80009b1c:	55e080e7          	jalr	1374(ra) # 80001076 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80009b20:	fec42783          	lw	a5,-20(s0)
    80009b24:	2785                	addiw	a5,a5,1
    80009b26:	fef42623          	sw	a5,-20(s0)
    80009b2a:	fec42783          	lw	a5,-20(s0)
    80009b2e:	873e                	mv	a4,a5
    80009b30:	47fd                	li	a5,31
    80009b32:	00e7eb63          	bltu	a5,a4,80009b48 <sys_exec+0x15e>
    80009b36:	fec42783          	lw	a5,-20(s0)
    80009b3a:	078e                	slli	a5,a5,0x3
    80009b3c:	ff040713          	addi	a4,s0,-16
    80009b40:	97ba                	add	a5,a5,a4
    80009b42:	e787b783          	ld	a5,-392(a5)
    80009b46:	f3e1                	bnez	a5,80009b06 <sys_exec+0x11c>

  return ret;
    80009b48:	fe842783          	lw	a5,-24(s0)
    80009b4c:	a8a9                	j	80009ba6 <sys_exec+0x1bc>
      goto bad;
    80009b4e:	0001                	nop
    80009b50:	a031                	j	80009b5c <sys_exec+0x172>
      goto bad;
    80009b52:	0001                	nop
    80009b54:	a021                	j	80009b5c <sys_exec+0x172>
      goto bad;
    80009b56:	0001                	nop
    80009b58:	a011                	j	80009b5c <sys_exec+0x172>
      goto bad;
    80009b5a:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80009b5c:	fe042623          	sw	zero,-20(s0)
    80009b60:	a01d                	j	80009b86 <sys_exec+0x19c>
    kfree(argv[i]);
    80009b62:	fec42783          	lw	a5,-20(s0)
    80009b66:	078e                	slli	a5,a5,0x3
    80009b68:	ff040713          	addi	a4,s0,-16
    80009b6c:	97ba                	add	a5,a5,a4
    80009b6e:	e787b783          	ld	a5,-392(a5)
    80009b72:	853e                	mv	a0,a5
    80009b74:	ffff7097          	auipc	ra,0xffff7
    80009b78:	502080e7          	jalr	1282(ra) # 80001076 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80009b7c:	fec42783          	lw	a5,-20(s0)
    80009b80:	2785                	addiw	a5,a5,1
    80009b82:	fef42623          	sw	a5,-20(s0)
    80009b86:	fec42783          	lw	a5,-20(s0)
    80009b8a:	873e                	mv	a4,a5
    80009b8c:	47fd                	li	a5,31
    80009b8e:	00e7eb63          	bltu	a5,a4,80009ba4 <sys_exec+0x1ba>
    80009b92:	fec42783          	lw	a5,-20(s0)
    80009b96:	078e                	slli	a5,a5,0x3
    80009b98:	ff040713          	addi	a4,s0,-16
    80009b9c:	97ba                	add	a5,a5,a4
    80009b9e:	e787b783          	ld	a5,-392(a5)
    80009ba2:	f3e1                	bnez	a5,80009b62 <sys_exec+0x178>
  return -1;
    80009ba4:	57fd                	li	a5,-1
}
    80009ba6:	853e                	mv	a0,a5
    80009ba8:	70ba                	ld	ra,424(sp)
    80009baa:	741a                	ld	s0,416(sp)
    80009bac:	615d                	addi	sp,sp,432
    80009bae:	8082                	ret

0000000080009bb0 <sys_pipe>:

uint64
sys_pipe(void)
{
    80009bb0:	7139                	addi	sp,sp,-64
    80009bb2:	fc06                	sd	ra,56(sp)
    80009bb4:	f822                	sd	s0,48(sp)
    80009bb6:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80009bb8:	ffff9097          	auipc	ra,0xffff9
    80009bbc:	c74080e7          	jalr	-908(ra) # 8000282c <myproc>
    80009bc0:	fea43423          	sd	a0,-24(s0)

  if(argaddr(0, &fdarray) < 0)
    80009bc4:	fe040793          	addi	a5,s0,-32
    80009bc8:	85be                	mv	a1,a5
    80009bca:	4501                	li	a0,0
    80009bcc:	ffffc097          	auipc	ra,0xffffc
    80009bd0:	a14080e7          	jalr	-1516(ra) # 800055e0 <argaddr>
    80009bd4:	87aa                	mv	a5,a0
    80009bd6:	0007d463          	bgez	a5,80009bde <sys_pipe+0x2e>
    return -1;
    80009bda:	57fd                	li	a5,-1
    80009bdc:	a215                	j	80009d00 <sys_pipe+0x150>
  if(pipealloc(&rf, &wf) < 0)
    80009bde:	fd040713          	addi	a4,s0,-48
    80009be2:	fd840793          	addi	a5,s0,-40
    80009be6:	85ba                	mv	a1,a4
    80009be8:	853e                	mv	a0,a5
    80009bea:	ffffe097          	auipc	ra,0xffffe
    80009bee:	632080e7          	jalr	1586(ra) # 8000821c <pipealloc>
    80009bf2:	87aa                	mv	a5,a0
    80009bf4:	0007d463          	bgez	a5,80009bfc <sys_pipe+0x4c>
    return -1;
    80009bf8:	57fd                	li	a5,-1
    80009bfa:	a219                	j	80009d00 <sys_pipe+0x150>
  fd0 = -1;
    80009bfc:	57fd                	li	a5,-1
    80009bfe:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80009c02:	fd843783          	ld	a5,-40(s0)
    80009c06:	853e                	mv	a0,a5
    80009c08:	fffff097          	auipc	ra,0xfffff
    80009c0c:	0be080e7          	jalr	190(ra) # 80008cc6 <fdalloc>
    80009c10:	87aa                	mv	a5,a0
    80009c12:	fcf42623          	sw	a5,-52(s0)
    80009c16:	fcc42783          	lw	a5,-52(s0)
    80009c1a:	0207c063          	bltz	a5,80009c3a <sys_pipe+0x8a>
    80009c1e:	fd043783          	ld	a5,-48(s0)
    80009c22:	853e                	mv	a0,a5
    80009c24:	fffff097          	auipc	ra,0xfffff
    80009c28:	0a2080e7          	jalr	162(ra) # 80008cc6 <fdalloc>
    80009c2c:	87aa                	mv	a5,a0
    80009c2e:	fcf42423          	sw	a5,-56(s0)
    80009c32:	fc842783          	lw	a5,-56(s0)
    80009c36:	0207df63          	bgez	a5,80009c74 <sys_pipe+0xc4>
    if(fd0 >= 0)
    80009c3a:	fcc42783          	lw	a5,-52(s0)
    80009c3e:	0007cb63          	bltz	a5,80009c54 <sys_pipe+0xa4>
      p->ofile[fd0] = 0;
    80009c42:	fcc42783          	lw	a5,-52(s0)
    80009c46:	fe843703          	ld	a4,-24(s0)
    80009c4a:	07e9                	addi	a5,a5,26
    80009c4c:	078e                	slli	a5,a5,0x3
    80009c4e:	97ba                	add	a5,a5,a4
    80009c50:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80009c54:	fd843783          	ld	a5,-40(s0)
    80009c58:	853e                	mv	a0,a5
    80009c5a:	ffffe097          	auipc	ra,0xffffe
    80009c5e:	0ac080e7          	jalr	172(ra) # 80007d06 <fileclose>
    fileclose(wf);
    80009c62:	fd043783          	ld	a5,-48(s0)
    80009c66:	853e                	mv	a0,a5
    80009c68:	ffffe097          	auipc	ra,0xffffe
    80009c6c:	09e080e7          	jalr	158(ra) # 80007d06 <fileclose>
    return -1;
    80009c70:	57fd                	li	a5,-1
    80009c72:	a079                	j	80009d00 <sys_pipe+0x150>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80009c74:	fe843783          	ld	a5,-24(s0)
    80009c78:	6bbc                	ld	a5,80(a5)
    80009c7a:	fe043703          	ld	a4,-32(s0)
    80009c7e:	fcc40613          	addi	a2,s0,-52
    80009c82:	4691                	li	a3,4
    80009c84:	85ba                	mv	a1,a4
    80009c86:	853e                	mv	a0,a5
    80009c88:	ffff8097          	auipc	ra,0xffff8
    80009c8c:	65e080e7          	jalr	1630(ra) # 800022e6 <copyout>
    80009c90:	87aa                	mv	a5,a0
    80009c92:	0207c463          	bltz	a5,80009cba <sys_pipe+0x10a>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80009c96:	fe843783          	ld	a5,-24(s0)
    80009c9a:	6bb8                	ld	a4,80(a5)
    80009c9c:	fe043783          	ld	a5,-32(s0)
    80009ca0:	0791                	addi	a5,a5,4
    80009ca2:	fc840613          	addi	a2,s0,-56
    80009ca6:	4691                	li	a3,4
    80009ca8:	85be                	mv	a1,a5
    80009caa:	853a                	mv	a0,a4
    80009cac:	ffff8097          	auipc	ra,0xffff8
    80009cb0:	63a080e7          	jalr	1594(ra) # 800022e6 <copyout>
    80009cb4:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80009cb6:	0407d463          	bgez	a5,80009cfe <sys_pipe+0x14e>
    p->ofile[fd0] = 0;
    80009cba:	fcc42783          	lw	a5,-52(s0)
    80009cbe:	fe843703          	ld	a4,-24(s0)
    80009cc2:	07e9                	addi	a5,a5,26
    80009cc4:	078e                	slli	a5,a5,0x3
    80009cc6:	97ba                	add	a5,a5,a4
    80009cc8:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    80009ccc:	fc842783          	lw	a5,-56(s0)
    80009cd0:	fe843703          	ld	a4,-24(s0)
    80009cd4:	07e9                	addi	a5,a5,26
    80009cd6:	078e                	slli	a5,a5,0x3
    80009cd8:	97ba                	add	a5,a5,a4
    80009cda:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80009cde:	fd843783          	ld	a5,-40(s0)
    80009ce2:	853e                	mv	a0,a5
    80009ce4:	ffffe097          	auipc	ra,0xffffe
    80009ce8:	022080e7          	jalr	34(ra) # 80007d06 <fileclose>
    fileclose(wf);
    80009cec:	fd043783          	ld	a5,-48(s0)
    80009cf0:	853e                	mv	a0,a5
    80009cf2:	ffffe097          	auipc	ra,0xffffe
    80009cf6:	014080e7          	jalr	20(ra) # 80007d06 <fileclose>
    return -1;
    80009cfa:	57fd                	li	a5,-1
    80009cfc:	a011                	j	80009d00 <sys_pipe+0x150>
  }
  return 0;
    80009cfe:	4781                	li	a5,0
}
    80009d00:	853e                	mv	a0,a5
    80009d02:	70e2                	ld	ra,56(sp)
    80009d04:	7442                	ld	s0,48(sp)
    80009d06:	6121                	addi	sp,sp,64
    80009d08:	8082                	ret
    80009d0a:	0000                	unimp
    80009d0c:	0000                	unimp
	...

0000000080009d10 <kernelvec>:
    80009d10:	7111                	addi	sp,sp,-256
    80009d12:	e006                	sd	ra,0(sp)
    80009d14:	e40a                	sd	sp,8(sp)
    80009d16:	e80e                	sd	gp,16(sp)
    80009d18:	ec12                	sd	tp,24(sp)
    80009d1a:	f016                	sd	t0,32(sp)
    80009d1c:	f41a                	sd	t1,40(sp)
    80009d1e:	f81e                	sd	t2,48(sp)
    80009d20:	fc22                	sd	s0,56(sp)
    80009d22:	e0a6                	sd	s1,64(sp)
    80009d24:	e4aa                	sd	a0,72(sp)
    80009d26:	e8ae                	sd	a1,80(sp)
    80009d28:	ecb2                	sd	a2,88(sp)
    80009d2a:	f0b6                	sd	a3,96(sp)
    80009d2c:	f4ba                	sd	a4,104(sp)
    80009d2e:	f8be                	sd	a5,112(sp)
    80009d30:	fcc2                	sd	a6,120(sp)
    80009d32:	e146                	sd	a7,128(sp)
    80009d34:	e54a                	sd	s2,136(sp)
    80009d36:	e94e                	sd	s3,144(sp)
    80009d38:	ed52                	sd	s4,152(sp)
    80009d3a:	f156                	sd	s5,160(sp)
    80009d3c:	f55a                	sd	s6,168(sp)
    80009d3e:	f95e                	sd	s7,176(sp)
    80009d40:	fd62                	sd	s8,184(sp)
    80009d42:	e1e6                	sd	s9,192(sp)
    80009d44:	e5ea                	sd	s10,200(sp)
    80009d46:	e9ee                	sd	s11,208(sp)
    80009d48:	edf2                	sd	t3,216(sp)
    80009d4a:	f1f6                	sd	t4,224(sp)
    80009d4c:	f5fa                	sd	t5,232(sp)
    80009d4e:	f9fe                	sd	t6,240(sp)
    80009d50:	be8fb0ef          	jal	ra,80005138 <kerneltrap>
    80009d54:	6082                	ld	ra,0(sp)
    80009d56:	6122                	ld	sp,8(sp)
    80009d58:	61c2                	ld	gp,16(sp)
    80009d5a:	7282                	ld	t0,32(sp)
    80009d5c:	7322                	ld	t1,40(sp)
    80009d5e:	73c2                	ld	t2,48(sp)
    80009d60:	7462                	ld	s0,56(sp)
    80009d62:	6486                	ld	s1,64(sp)
    80009d64:	6526                	ld	a0,72(sp)
    80009d66:	65c6                	ld	a1,80(sp)
    80009d68:	6666                	ld	a2,88(sp)
    80009d6a:	7686                	ld	a3,96(sp)
    80009d6c:	7726                	ld	a4,104(sp)
    80009d6e:	77c6                	ld	a5,112(sp)
    80009d70:	7866                	ld	a6,120(sp)
    80009d72:	688a                	ld	a7,128(sp)
    80009d74:	692a                	ld	s2,136(sp)
    80009d76:	69ca                	ld	s3,144(sp)
    80009d78:	6a6a                	ld	s4,152(sp)
    80009d7a:	7a8a                	ld	s5,160(sp)
    80009d7c:	7b2a                	ld	s6,168(sp)
    80009d7e:	7bca                	ld	s7,176(sp)
    80009d80:	7c6a                	ld	s8,184(sp)
    80009d82:	6c8e                	ld	s9,192(sp)
    80009d84:	6d2e                	ld	s10,200(sp)
    80009d86:	6dce                	ld	s11,208(sp)
    80009d88:	6e6e                	ld	t3,216(sp)
    80009d8a:	7e8e                	ld	t4,224(sp)
    80009d8c:	7f2e                	ld	t5,232(sp)
    80009d8e:	7fce                	ld	t6,240(sp)
    80009d90:	6111                	addi	sp,sp,256
    80009d92:	10200073          	sret
    80009d96:	00000013          	nop
    80009d9a:	00000013          	nop
    80009d9e:	0001                	nop

0000000080009da0 <timervec>:
    80009da0:	34051573          	csrrw	a0,mscratch,a0
    80009da4:	e10c                	sd	a1,0(a0)
    80009da6:	e510                	sd	a2,8(a0)
    80009da8:	e914                	sd	a3,16(a0)
    80009daa:	6d0c                	ld	a1,24(a0)
    80009dac:	7110                	ld	a2,32(a0)
    80009dae:	6194                	ld	a3,0(a1)
    80009db0:	96b2                	add	a3,a3,a2
    80009db2:	e194                	sd	a3,0(a1)
    80009db4:	4589                	li	a1,2
    80009db6:	14459073          	csrw	sip,a1
    80009dba:	6914                	ld	a3,16(a0)
    80009dbc:	6510                	ld	a2,8(a0)
    80009dbe:	610c                	ld	a1,0(a0)
    80009dc0:	34051573          	csrrw	a0,mscratch,a0
    80009dc4:	30200073          	mret
	...

0000000080009dca <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    80009dca:	1141                	addi	sp,sp,-16
    80009dcc:	e422                	sd	s0,8(sp)
    80009dce:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80009dd0:	0c0007b7          	lui	a5,0xc000
    80009dd4:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80009dd8:	4705                	li	a4,1
    80009dda:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80009ddc:	0c0007b7          	lui	a5,0xc000
    80009de0:	0791                	addi	a5,a5,4
    80009de2:	4705                	li	a4,1
    80009de4:	c398                	sw	a4,0(a5)
}
    80009de6:	0001                	nop
    80009de8:	6422                	ld	s0,8(sp)
    80009dea:	0141                	addi	sp,sp,16
    80009dec:	8082                	ret

0000000080009dee <plicinithart>:

void
plicinithart(void)
{
    80009dee:	1101                	addi	sp,sp,-32
    80009df0:	ec06                	sd	ra,24(sp)
    80009df2:	e822                	sd	s0,16(sp)
    80009df4:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80009df6:	ffff9097          	auipc	ra,0xffff9
    80009dfa:	9d8080e7          	jalr	-1576(ra) # 800027ce <cpuid>
    80009dfe:	87aa                	mv	a5,a0
    80009e00:	fef42623          	sw	a5,-20(s0)
  
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ);
    80009e04:	fec42783          	lw	a5,-20(s0)
    80009e08:	0087979b          	slliw	a5,a5,0x8
    80009e0c:	2781                	sext.w	a5,a5
    80009e0e:	873e                	mv	a4,a5
    80009e10:	0c0027b7          	lui	a5,0xc002
    80009e14:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80009e18:	97ba                	add	a5,a5,a4
    80009e1a:	873e                	mv	a4,a5
    80009e1c:	40200793          	li	a5,1026
    80009e20:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80009e22:	fec42783          	lw	a5,-20(s0)
    80009e26:	00d7979b          	slliw	a5,a5,0xd
    80009e2a:	2781                	sext.w	a5,a5
    80009e2c:	873e                	mv	a4,a5
    80009e2e:	0c2017b7          	lui	a5,0xc201
    80009e32:	97ba                	add	a5,a5,a4
    80009e34:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80009e38:	0001                	nop
    80009e3a:	60e2                	ld	ra,24(sp)
    80009e3c:	6442                	ld	s0,16(sp)
    80009e3e:	6105                	addi	sp,sp,32
    80009e40:	8082                	ret

0000000080009e42 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80009e42:	1101                	addi	sp,sp,-32
    80009e44:	ec06                	sd	ra,24(sp)
    80009e46:	e822                	sd	s0,16(sp)
    80009e48:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80009e4a:	ffff9097          	auipc	ra,0xffff9
    80009e4e:	984080e7          	jalr	-1660(ra) # 800027ce <cpuid>
    80009e52:	87aa                	mv	a5,a0
    80009e54:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80009e58:	fec42783          	lw	a5,-20(s0)
    80009e5c:	00d7979b          	slliw	a5,a5,0xd
    80009e60:	2781                	sext.w	a5,a5
    80009e62:	873e                	mv	a4,a5
    80009e64:	0c2017b7          	lui	a5,0xc201
    80009e68:	0791                	addi	a5,a5,4
    80009e6a:	97ba                	add	a5,a5,a4
    80009e6c:	439c                	lw	a5,0(a5)
    80009e6e:	fef42423          	sw	a5,-24(s0)
  return irq;
    80009e72:	fe842783          	lw	a5,-24(s0)
}
    80009e76:	853e                	mv	a0,a5
    80009e78:	60e2                	ld	ra,24(sp)
    80009e7a:	6442                	ld	s0,16(sp)
    80009e7c:	6105                	addi	sp,sp,32
    80009e7e:	8082                	ret

0000000080009e80 <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80009e80:	7179                	addi	sp,sp,-48
    80009e82:	f406                	sd	ra,40(sp)
    80009e84:	f022                	sd	s0,32(sp)
    80009e86:	1800                	addi	s0,sp,48
    80009e88:	87aa                	mv	a5,a0
    80009e8a:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80009e8e:	ffff9097          	auipc	ra,0xffff9
    80009e92:	940080e7          	jalr	-1728(ra) # 800027ce <cpuid>
    80009e96:	87aa                	mv	a5,a0
    80009e98:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80009e9c:	fec42783          	lw	a5,-20(s0)
    80009ea0:	00d7979b          	slliw	a5,a5,0xd
    80009ea4:	2781                	sext.w	a5,a5
    80009ea6:	873e                	mv	a4,a5
    80009ea8:	0c2017b7          	lui	a5,0xc201
    80009eac:	0791                	addi	a5,a5,4
    80009eae:	97ba                	add	a5,a5,a4
    80009eb0:	873e                	mv	a4,a5
    80009eb2:	fdc42783          	lw	a5,-36(s0)
    80009eb6:	c31c                	sw	a5,0(a4)
}
    80009eb8:	0001                	nop
    80009eba:	70a2                	ld	ra,40(sp)
    80009ebc:	7402                	ld	s0,32(sp)
    80009ebe:	6145                	addi	sp,sp,48
    80009ec0:	8082                	ret

0000000080009ec2 <virtio_disk_init>:
  
} __attribute__ ((aligned (PGSIZE))) disk;

void
virtio_disk_init(void)
{
    80009ec2:	7179                	addi	sp,sp,-48
    80009ec4:	f406                	sd	ra,40(sp)
    80009ec6:	f022                	sd	s0,32(sp)
    80009ec8:	1800                	addi	s0,sp,48
  uint32 status = 0;
    80009eca:	fe042423          	sw	zero,-24(s0)

  initlock(&disk.vdisk_lock, "virtio_disk");
    80009ece:	00002597          	auipc	a1,0x2
    80009ed2:	7c258593          	addi	a1,a1,1986 # 8000c690 <etext+0x690>
    80009ed6:	0001f517          	auipc	a0,0x1f
    80009eda:	25250513          	addi	a0,a0,594 # 80029128 <disk+0x2128>
    80009ede:	ffff7097          	auipc	ra,0xffff7
    80009ee2:	360080e7          	jalr	864(ra) # 8000123e <initlock>

  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80009ee6:	100017b7          	lui	a5,0x10001
    80009eea:	439c                	lw	a5,0(a5)
    80009eec:	2781                	sext.w	a5,a5
    80009eee:	873e                	mv	a4,a5
    80009ef0:	747277b7          	lui	a5,0x74727
    80009ef4:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80009ef8:	04f71063          	bne	a4,a5,80009f38 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80009efc:	100017b7          	lui	a5,0x10001
    80009f00:	0791                	addi	a5,a5,4
    80009f02:	439c                	lw	a5,0(a5)
    80009f04:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80009f06:	873e                	mv	a4,a5
    80009f08:	4785                	li	a5,1
    80009f0a:	02f71763          	bne	a4,a5,80009f38 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80009f0e:	100017b7          	lui	a5,0x10001
    80009f12:	07a1                	addi	a5,a5,8
    80009f14:	439c                	lw	a5,0(a5)
    80009f16:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80009f18:	873e                	mv	a4,a5
    80009f1a:	4789                	li	a5,2
    80009f1c:	00f71e63          	bne	a4,a5,80009f38 <virtio_disk_init+0x76>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80009f20:	100017b7          	lui	a5,0x10001
    80009f24:	07b1                	addi	a5,a5,12
    80009f26:	439c                	lw	a5,0(a5)
    80009f28:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80009f2a:	873e                	mv	a4,a5
    80009f2c:	554d47b7          	lui	a5,0x554d4
    80009f30:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80009f34:	00f70a63          	beq	a4,a5,80009f48 <virtio_disk_init+0x86>
    panic("could not find virtio disk");
    80009f38:	00002517          	auipc	a0,0x2
    80009f3c:	76850513          	addi	a0,a0,1896 # 8000c6a0 <etext+0x6a0>
    80009f40:	ffff7097          	auipc	ra,0xffff7
    80009f44:	d3e080e7          	jalr	-706(ra) # 80000c7e <panic>
  }
  
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80009f48:	fe842783          	lw	a5,-24(s0)
    80009f4c:	0017e793          	ori	a5,a5,1
    80009f50:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80009f54:	100017b7          	lui	a5,0x10001
    80009f58:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80009f5c:	fe842703          	lw	a4,-24(s0)
    80009f60:	c398                	sw	a4,0(a5)

  status |= VIRTIO_CONFIG_S_DRIVER;
    80009f62:	fe842783          	lw	a5,-24(s0)
    80009f66:	0027e793          	ori	a5,a5,2
    80009f6a:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    80009f6e:	100017b7          	lui	a5,0x10001
    80009f72:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    80009f76:	fe842703          	lw	a4,-24(s0)
    80009f7a:	c398                	sw	a4,0(a5)

  // negotiate features
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80009f7c:	100017b7          	lui	a5,0x10001
    80009f80:	07c1                	addi	a5,a5,16
    80009f82:	439c                	lw	a5,0(a5)
    80009f84:	2781                	sext.w	a5,a5
    80009f86:	1782                	slli	a5,a5,0x20
    80009f88:	9381                	srli	a5,a5,0x20
    80009f8a:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80009f8e:	fe043783          	ld	a5,-32(s0)
    80009f92:	fdf7f793          	andi	a5,a5,-33
    80009f96:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80009f9a:	fe043783          	ld	a5,-32(s0)
    80009f9e:	f7f7f793          	andi	a5,a5,-129
    80009fa2:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80009fa6:	fe043703          	ld	a4,-32(s0)
    80009faa:	77fd                	lui	a5,0xfffff
    80009fac:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffd57ff>
    80009fb0:	8ff9                	and	a5,a5,a4
    80009fb2:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80009fb6:	fe043703          	ld	a4,-32(s0)
    80009fba:	77fd                	lui	a5,0xfffff
    80009fbc:	17fd                	addi	a5,a5,-1
    80009fbe:	8ff9                	and	a5,a5,a4
    80009fc0:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80009fc4:	fe043703          	ld	a4,-32(s0)
    80009fc8:	f80007b7          	lui	a5,0xf8000
    80009fcc:	17fd                	addi	a5,a5,-1
    80009fce:	8ff9                	and	a5,a5,a4
    80009fd0:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80009fd4:	fe043703          	ld	a4,-32(s0)
    80009fd8:	e00007b7          	lui	a5,0xe0000
    80009fdc:	17fd                	addi	a5,a5,-1
    80009fde:	8ff9                	and	a5,a5,a4
    80009fe0:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80009fe4:	fe043703          	ld	a4,-32(s0)
    80009fe8:	f00007b7          	lui	a5,0xf0000
    80009fec:	17fd                	addi	a5,a5,-1
    80009fee:	8ff9                	and	a5,a5,a4
    80009ff0:	fef43023          	sd	a5,-32(s0)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80009ff4:	100017b7          	lui	a5,0x10001
    80009ff8:	02078793          	addi	a5,a5,32 # 10001020 <_entry-0x6fffefe0>
    80009ffc:	fe043703          	ld	a4,-32(s0)
    8000a000:	2701                	sext.w	a4,a4
    8000a002:	c398                	sw	a4,0(a5)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    8000a004:	fe842783          	lw	a5,-24(s0)
    8000a008:	0087e793          	ori	a5,a5,8
    8000a00c:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    8000a010:	100017b7          	lui	a5,0x10001
    8000a014:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    8000a018:	fe842703          	lw	a4,-24(s0)
    8000a01c:	c398                	sw	a4,0(a5)

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    8000a01e:	fe842783          	lw	a5,-24(s0)
    8000a022:	0047e793          	ori	a5,a5,4
    8000a026:	fef42423          	sw	a5,-24(s0)
  *R(VIRTIO_MMIO_STATUS) = status;
    8000a02a:	100017b7          	lui	a5,0x10001
    8000a02e:	07078793          	addi	a5,a5,112 # 10001070 <_entry-0x6fffef90>
    8000a032:	fe842703          	lw	a4,-24(s0)
    8000a036:	c398                	sw	a4,0(a5)

  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    8000a038:	100017b7          	lui	a5,0x10001
    8000a03c:	02878793          	addi	a5,a5,40 # 10001028 <_entry-0x6fffefd8>
    8000a040:	6705                	lui	a4,0x1
    8000a042:	c398                	sw	a4,0(a5)

  // initialize queue 0.
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    8000a044:	100017b7          	lui	a5,0x10001
    8000a048:	03078793          	addi	a5,a5,48 # 10001030 <_entry-0x6fffefd0>
    8000a04c:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    8000a050:	100017b7          	lui	a5,0x10001
    8000a054:	03478793          	addi	a5,a5,52 # 10001034 <_entry-0x6fffefcc>
    8000a058:	439c                	lw	a5,0(a5)
    8000a05a:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    8000a05e:	fdc42783          	lw	a5,-36(s0)
    8000a062:	2781                	sext.w	a5,a5
    8000a064:	eb89                	bnez	a5,8000a076 <virtio_disk_init+0x1b4>
    panic("virtio disk has no queue 0");
    8000a066:	00002517          	auipc	a0,0x2
    8000a06a:	65a50513          	addi	a0,a0,1626 # 8000c6c0 <etext+0x6c0>
    8000a06e:	ffff7097          	auipc	ra,0xffff7
    8000a072:	c10080e7          	jalr	-1008(ra) # 80000c7e <panic>
  if(max < NUM)
    8000a076:	fdc42783          	lw	a5,-36(s0)
    8000a07a:	0007871b          	sext.w	a4,a5
    8000a07e:	479d                	li	a5,7
    8000a080:	00e7ea63          	bltu	a5,a4,8000a094 <virtio_disk_init+0x1d2>
    panic("virtio disk max queue too short");
    8000a084:	00002517          	auipc	a0,0x2
    8000a088:	65c50513          	addi	a0,a0,1628 # 8000c6e0 <etext+0x6e0>
    8000a08c:	ffff7097          	auipc	ra,0xffff7
    8000a090:	bf2080e7          	jalr	-1038(ra) # 80000c7e <panic>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    8000a094:	100017b7          	lui	a5,0x10001
    8000a098:	03878793          	addi	a5,a5,56 # 10001038 <_entry-0x6fffefc8>
    8000a09c:	4721                	li	a4,8
    8000a09e:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    8000a0a0:	6609                	lui	a2,0x2
    8000a0a2:	4581                	li	a1,0
    8000a0a4:	0001d517          	auipc	a0,0x1d
    8000a0a8:	f5c50513          	addi	a0,a0,-164 # 80027000 <disk>
    8000a0ac:	ffff7097          	auipc	ra,0xffff7
    8000a0b0:	396080e7          	jalr	918(ra) # 80001442 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    8000a0b4:	0001d797          	auipc	a5,0x1d
    8000a0b8:	f4c78793          	addi	a5,a5,-180 # 80027000 <disk>
    8000a0bc:	00c7d713          	srli	a4,a5,0xc
    8000a0c0:	100017b7          	lui	a5,0x10001
    8000a0c4:	04078793          	addi	a5,a5,64 # 10001040 <_entry-0x6fffefc0>
    8000a0c8:	2701                	sext.w	a4,a4
    8000a0ca:	c398                	sw	a4,0(a5)

  // desc = pages -- num * virtq_desc
  // avail = pages + 0x40 -- 2 * uint16, then num * uint16
  // used = pages + 4096 -- 2 * uint16, then num * vRingUsedElem

  disk.desc = (struct virtq_desc *) disk.pages;
    8000a0cc:	0001d717          	auipc	a4,0x1d
    8000a0d0:	f3470713          	addi	a4,a4,-204 # 80027000 <disk>
    8000a0d4:	6789                	lui	a5,0x2
    8000a0d6:	97ba                	add	a5,a5,a4
    8000a0d8:	0001d717          	auipc	a4,0x1d
    8000a0dc:	f2870713          	addi	a4,a4,-216 # 80027000 <disk>
    8000a0e0:	e398                	sd	a4,0(a5)
  disk.avail = (struct virtq_avail *)(disk.pages + NUM*sizeof(struct virtq_desc));
    8000a0e2:	0001d717          	auipc	a4,0x1d
    8000a0e6:	f9e70713          	addi	a4,a4,-98 # 80027080 <disk+0x80>
    8000a0ea:	0001d697          	auipc	a3,0x1d
    8000a0ee:	f1668693          	addi	a3,a3,-234 # 80027000 <disk>
    8000a0f2:	6789                	lui	a5,0x2
    8000a0f4:	97b6                	add	a5,a5,a3
    8000a0f6:	e798                	sd	a4,8(a5)
  disk.used = (struct virtq_used *) (disk.pages + PGSIZE);
    8000a0f8:	0001e717          	auipc	a4,0x1e
    8000a0fc:	f0870713          	addi	a4,a4,-248 # 80028000 <disk+0x1000>
    8000a100:	0001d697          	auipc	a3,0x1d
    8000a104:	f0068693          	addi	a3,a3,-256 # 80027000 <disk>
    8000a108:	6789                	lui	a5,0x2
    8000a10a:	97b6                	add	a5,a5,a3
    8000a10c:	eb98                	sd	a4,16(a5)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    8000a10e:	fe042623          	sw	zero,-20(s0)
    8000a112:	a015                	j	8000a136 <virtio_disk_init+0x274>
    disk.free[i] = 1;
    8000a114:	0001d717          	auipc	a4,0x1d
    8000a118:	eec70713          	addi	a4,a4,-276 # 80027000 <disk>
    8000a11c:	fec42783          	lw	a5,-20(s0)
    8000a120:	97ba                	add	a5,a5,a4
    8000a122:	6709                	lui	a4,0x2
    8000a124:	97ba                	add	a5,a5,a4
    8000a126:	4705                	li	a4,1
    8000a128:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x7fffdfe8>
  for(int i = 0; i < NUM; i++)
    8000a12c:	fec42783          	lw	a5,-20(s0)
    8000a130:	2785                	addiw	a5,a5,1
    8000a132:	fef42623          	sw	a5,-20(s0)
    8000a136:	fec42783          	lw	a5,-20(s0)
    8000a13a:	0007871b          	sext.w	a4,a5
    8000a13e:	479d                	li	a5,7
    8000a140:	fce7dae3          	bge	a5,a4,8000a114 <virtio_disk_init+0x252>

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ.
}
    8000a144:	0001                	nop
    8000a146:	0001                	nop
    8000a148:	70a2                	ld	ra,40(sp)
    8000a14a:	7402                	ld	s0,32(sp)
    8000a14c:	6145                	addi	sp,sp,48
    8000a14e:	8082                	ret

000000008000a150 <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc()
{
    8000a150:	1101                	addi	sp,sp,-32
    8000a152:	ec22                	sd	s0,24(sp)
    8000a154:	1000                	addi	s0,sp,32
  for(int i = 0; i < NUM; i++){
    8000a156:	fe042623          	sw	zero,-20(s0)
    8000a15a:	a081                	j	8000a19a <alloc_desc+0x4a>
    if(disk.free[i]){
    8000a15c:	0001d717          	auipc	a4,0x1d
    8000a160:	ea470713          	addi	a4,a4,-348 # 80027000 <disk>
    8000a164:	fec42783          	lw	a5,-20(s0)
    8000a168:	97ba                	add	a5,a5,a4
    8000a16a:	6709                	lui	a4,0x2
    8000a16c:	97ba                	add	a5,a5,a4
    8000a16e:	0187c783          	lbu	a5,24(a5)
    8000a172:	cf99                	beqz	a5,8000a190 <alloc_desc+0x40>
      disk.free[i] = 0;
    8000a174:	0001d717          	auipc	a4,0x1d
    8000a178:	e8c70713          	addi	a4,a4,-372 # 80027000 <disk>
    8000a17c:	fec42783          	lw	a5,-20(s0)
    8000a180:	97ba                	add	a5,a5,a4
    8000a182:	6709                	lui	a4,0x2
    8000a184:	97ba                	add	a5,a5,a4
    8000a186:	00078c23          	sb	zero,24(a5)
      return i;
    8000a18a:	fec42783          	lw	a5,-20(s0)
    8000a18e:	a831                	j	8000a1aa <alloc_desc+0x5a>
  for(int i = 0; i < NUM; i++){
    8000a190:	fec42783          	lw	a5,-20(s0)
    8000a194:	2785                	addiw	a5,a5,1
    8000a196:	fef42623          	sw	a5,-20(s0)
    8000a19a:	fec42783          	lw	a5,-20(s0)
    8000a19e:	0007871b          	sext.w	a4,a5
    8000a1a2:	479d                	li	a5,7
    8000a1a4:	fae7dce3          	bge	a5,a4,8000a15c <alloc_desc+0xc>
    }
  }
  return -1;
    8000a1a8:	57fd                	li	a5,-1
}
    8000a1aa:	853e                	mv	a0,a5
    8000a1ac:	6462                	ld	s0,24(sp)
    8000a1ae:	6105                	addi	sp,sp,32
    8000a1b0:	8082                	ret

000000008000a1b2 <free_desc>:

// mark a descriptor as free.
static void
free_desc(int i)
{
    8000a1b2:	1101                	addi	sp,sp,-32
    8000a1b4:	ec06                	sd	ra,24(sp)
    8000a1b6:	e822                	sd	s0,16(sp)
    8000a1b8:	1000                	addi	s0,sp,32
    8000a1ba:	87aa                	mv	a5,a0
    8000a1bc:	fef42623          	sw	a5,-20(s0)
  if(i >= NUM)
    8000a1c0:	fec42783          	lw	a5,-20(s0)
    8000a1c4:	0007871b          	sext.w	a4,a5
    8000a1c8:	479d                	li	a5,7
    8000a1ca:	00e7da63          	bge	a5,a4,8000a1de <free_desc+0x2c>
    panic("free_desc 1");
    8000a1ce:	00002517          	auipc	a0,0x2
    8000a1d2:	53250513          	addi	a0,a0,1330 # 8000c700 <etext+0x700>
    8000a1d6:	ffff7097          	auipc	ra,0xffff7
    8000a1da:	aa8080e7          	jalr	-1368(ra) # 80000c7e <panic>
  if(disk.free[i])
    8000a1de:	0001d717          	auipc	a4,0x1d
    8000a1e2:	e2270713          	addi	a4,a4,-478 # 80027000 <disk>
    8000a1e6:	fec42783          	lw	a5,-20(s0)
    8000a1ea:	97ba                	add	a5,a5,a4
    8000a1ec:	6709                	lui	a4,0x2
    8000a1ee:	97ba                	add	a5,a5,a4
    8000a1f0:	0187c783          	lbu	a5,24(a5)
    8000a1f4:	cb89                	beqz	a5,8000a206 <free_desc+0x54>
    panic("free_desc 2");
    8000a1f6:	00002517          	auipc	a0,0x2
    8000a1fa:	51a50513          	addi	a0,a0,1306 # 8000c710 <etext+0x710>
    8000a1fe:	ffff7097          	auipc	ra,0xffff7
    8000a202:	a80080e7          	jalr	-1408(ra) # 80000c7e <panic>
  disk.desc[i].addr = 0;
    8000a206:	0001d717          	auipc	a4,0x1d
    8000a20a:	dfa70713          	addi	a4,a4,-518 # 80027000 <disk>
    8000a20e:	6789                	lui	a5,0x2
    8000a210:	97ba                	add	a5,a5,a4
    8000a212:	6398                	ld	a4,0(a5)
    8000a214:	fec42783          	lw	a5,-20(s0)
    8000a218:	0792                	slli	a5,a5,0x4
    8000a21a:	97ba                	add	a5,a5,a4
    8000a21c:	0007b023          	sd	zero,0(a5) # 2000 <_entry-0x7fffe000>
  disk.desc[i].len = 0;
    8000a220:	0001d717          	auipc	a4,0x1d
    8000a224:	de070713          	addi	a4,a4,-544 # 80027000 <disk>
    8000a228:	6789                	lui	a5,0x2
    8000a22a:	97ba                	add	a5,a5,a4
    8000a22c:	6398                	ld	a4,0(a5)
    8000a22e:	fec42783          	lw	a5,-20(s0)
    8000a232:	0792                	slli	a5,a5,0x4
    8000a234:	97ba                	add	a5,a5,a4
    8000a236:	0007a423          	sw	zero,8(a5) # 2008 <_entry-0x7fffdff8>
  disk.desc[i].flags = 0;
    8000a23a:	0001d717          	auipc	a4,0x1d
    8000a23e:	dc670713          	addi	a4,a4,-570 # 80027000 <disk>
    8000a242:	6789                	lui	a5,0x2
    8000a244:	97ba                	add	a5,a5,a4
    8000a246:	6398                	ld	a4,0(a5)
    8000a248:	fec42783          	lw	a5,-20(s0)
    8000a24c:	0792                	slli	a5,a5,0x4
    8000a24e:	97ba                	add	a5,a5,a4
    8000a250:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[i].next = 0;
    8000a254:	0001d717          	auipc	a4,0x1d
    8000a258:	dac70713          	addi	a4,a4,-596 # 80027000 <disk>
    8000a25c:	6789                	lui	a5,0x2
    8000a25e:	97ba                	add	a5,a5,a4
    8000a260:	6398                	ld	a4,0(a5)
    8000a262:	fec42783          	lw	a5,-20(s0)
    8000a266:	0792                	slli	a5,a5,0x4
    8000a268:	97ba                	add	a5,a5,a4
    8000a26a:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>
  disk.free[i] = 1;
    8000a26e:	0001d717          	auipc	a4,0x1d
    8000a272:	d9270713          	addi	a4,a4,-622 # 80027000 <disk>
    8000a276:	fec42783          	lw	a5,-20(s0)
    8000a27a:	97ba                	add	a5,a5,a4
    8000a27c:	6709                	lui	a4,0x2
    8000a27e:	97ba                	add	a5,a5,a4
    8000a280:	4705                	li	a4,1
    8000a282:	00e78c23          	sb	a4,24(a5)
  wakeup(&disk.free[0]);
    8000a286:	0001f517          	auipc	a0,0x1f
    8000a28a:	d9250513          	addi	a0,a0,-622 # 80029018 <disk+0x2018>
    8000a28e:	ffffa097          	auipc	ra,0xffffa
    8000a292:	68a080e7          	jalr	1674(ra) # 80004918 <wakeup>
}
    8000a296:	0001                	nop
    8000a298:	60e2                	ld	ra,24(sp)
    8000a29a:	6442                	ld	s0,16(sp)
    8000a29c:	6105                	addi	sp,sp,32
    8000a29e:	8082                	ret

000000008000a2a0 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int i)
{
    8000a2a0:	7179                	addi	sp,sp,-48
    8000a2a2:	f406                	sd	ra,40(sp)
    8000a2a4:	f022                	sd	s0,32(sp)
    8000a2a6:	1800                	addi	s0,sp,48
    8000a2a8:	87aa                	mv	a5,a0
    8000a2aa:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    int flag = disk.desc[i].flags;
    8000a2ae:	0001d717          	auipc	a4,0x1d
    8000a2b2:	d5270713          	addi	a4,a4,-686 # 80027000 <disk>
    8000a2b6:	6789                	lui	a5,0x2
    8000a2b8:	97ba                	add	a5,a5,a4
    8000a2ba:	6398                	ld	a4,0(a5)
    8000a2bc:	fdc42783          	lw	a5,-36(s0)
    8000a2c0:	0792                	slli	a5,a5,0x4
    8000a2c2:	97ba                	add	a5,a5,a4
    8000a2c4:	00c7d783          	lhu	a5,12(a5) # 200c <_entry-0x7fffdff4>
    8000a2c8:	fef42623          	sw	a5,-20(s0)
    int nxt = disk.desc[i].next;
    8000a2cc:	0001d717          	auipc	a4,0x1d
    8000a2d0:	d3470713          	addi	a4,a4,-716 # 80027000 <disk>
    8000a2d4:	6789                	lui	a5,0x2
    8000a2d6:	97ba                	add	a5,a5,a4
    8000a2d8:	6398                	ld	a4,0(a5)
    8000a2da:	fdc42783          	lw	a5,-36(s0)
    8000a2de:	0792                	slli	a5,a5,0x4
    8000a2e0:	97ba                	add	a5,a5,a4
    8000a2e2:	00e7d783          	lhu	a5,14(a5) # 200e <_entry-0x7fffdff2>
    8000a2e6:	fef42423          	sw	a5,-24(s0)
    free_desc(i);
    8000a2ea:	fdc42783          	lw	a5,-36(s0)
    8000a2ee:	853e                	mv	a0,a5
    8000a2f0:	00000097          	auipc	ra,0x0
    8000a2f4:	ec2080e7          	jalr	-318(ra) # 8000a1b2 <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    8000a2f8:	fec42783          	lw	a5,-20(s0)
    8000a2fc:	8b85                	andi	a5,a5,1
    8000a2fe:	2781                	sext.w	a5,a5
    8000a300:	c791                	beqz	a5,8000a30c <free_chain+0x6c>
      i = nxt;
    8000a302:	fe842783          	lw	a5,-24(s0)
    8000a306:	fcf42e23          	sw	a5,-36(s0)
  while(1){
    8000a30a:	b755                	j	8000a2ae <free_chain+0xe>
    else
      break;
    8000a30c:	0001                	nop
  }
}
    8000a30e:	0001                	nop
    8000a310:	70a2                	ld	ra,40(sp)
    8000a312:	7402                	ld	s0,32(sp)
    8000a314:	6145                	addi	sp,sp,48
    8000a316:	8082                	ret

000000008000a318 <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int *idx)
{
    8000a318:	7139                	addi	sp,sp,-64
    8000a31a:	fc06                	sd	ra,56(sp)
    8000a31c:	f822                	sd	s0,48(sp)
    8000a31e:	f426                	sd	s1,40(sp)
    8000a320:	0080                	addi	s0,sp,64
    8000a322:	fca43423          	sd	a0,-56(s0)
  for(int i = 0; i < 3; i++){
    8000a326:	fc042e23          	sw	zero,-36(s0)
    8000a32a:	a895                	j	8000a39e <alloc3_desc+0x86>
    idx[i] = alloc_desc();
    8000a32c:	fdc42783          	lw	a5,-36(s0)
    8000a330:	078a                	slli	a5,a5,0x2
    8000a332:	fc843703          	ld	a4,-56(s0)
    8000a336:	00f704b3          	add	s1,a4,a5
    8000a33a:	00000097          	auipc	ra,0x0
    8000a33e:	e16080e7          	jalr	-490(ra) # 8000a150 <alloc_desc>
    8000a342:	87aa                	mv	a5,a0
    8000a344:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    8000a346:	fdc42783          	lw	a5,-36(s0)
    8000a34a:	078a                	slli	a5,a5,0x2
    8000a34c:	fc843703          	ld	a4,-56(s0)
    8000a350:	97ba                	add	a5,a5,a4
    8000a352:	439c                	lw	a5,0(a5)
    8000a354:	0407d063          	bgez	a5,8000a394 <alloc3_desc+0x7c>
      for(int j = 0; j < i; j++)
    8000a358:	fc042c23          	sw	zero,-40(s0)
    8000a35c:	a015                	j	8000a380 <alloc3_desc+0x68>
        free_desc(idx[j]);
    8000a35e:	fd842783          	lw	a5,-40(s0)
    8000a362:	078a                	slli	a5,a5,0x2
    8000a364:	fc843703          	ld	a4,-56(s0)
    8000a368:	97ba                	add	a5,a5,a4
    8000a36a:	439c                	lw	a5,0(a5)
    8000a36c:	853e                	mv	a0,a5
    8000a36e:	00000097          	auipc	ra,0x0
    8000a372:	e44080e7          	jalr	-444(ra) # 8000a1b2 <free_desc>
      for(int j = 0; j < i; j++)
    8000a376:	fd842783          	lw	a5,-40(s0)
    8000a37a:	2785                	addiw	a5,a5,1
    8000a37c:	fcf42c23          	sw	a5,-40(s0)
    8000a380:	fd842703          	lw	a4,-40(s0)
    8000a384:	fdc42783          	lw	a5,-36(s0)
    8000a388:	2701                	sext.w	a4,a4
    8000a38a:	2781                	sext.w	a5,a5
    8000a38c:	fcf749e3          	blt	a4,a5,8000a35e <alloc3_desc+0x46>
      return -1;
    8000a390:	57fd                	li	a5,-1
    8000a392:	a831                	j	8000a3ae <alloc3_desc+0x96>
  for(int i = 0; i < 3; i++){
    8000a394:	fdc42783          	lw	a5,-36(s0)
    8000a398:	2785                	addiw	a5,a5,1
    8000a39a:	fcf42e23          	sw	a5,-36(s0)
    8000a39e:	fdc42783          	lw	a5,-36(s0)
    8000a3a2:	0007871b          	sext.w	a4,a5
    8000a3a6:	4789                	li	a5,2
    8000a3a8:	f8e7d2e3          	bge	a5,a4,8000a32c <alloc3_desc+0x14>
    }
  }
  return 0;
    8000a3ac:	4781                	li	a5,0
}
    8000a3ae:	853e                	mv	a0,a5
    8000a3b0:	70e2                	ld	ra,56(sp)
    8000a3b2:	7442                	ld	s0,48(sp)
    8000a3b4:	74a2                	ld	s1,40(sp)
    8000a3b6:	6121                	addi	sp,sp,64
    8000a3b8:	8082                	ret

000000008000a3ba <virtio_disk_rw>:

void
virtio_disk_rw(struct buf *b, int write)
{
    8000a3ba:	7139                	addi	sp,sp,-64
    8000a3bc:	fc06                	sd	ra,56(sp)
    8000a3be:	f822                	sd	s0,48(sp)
    8000a3c0:	0080                	addi	s0,sp,64
    8000a3c2:	fca43423          	sd	a0,-56(s0)
    8000a3c6:	87ae                	mv	a5,a1
    8000a3c8:	fcf42223          	sw	a5,-60(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    8000a3cc:	fc843783          	ld	a5,-56(s0)
    8000a3d0:	47dc                	lw	a5,12(a5)
    8000a3d2:	0017979b          	slliw	a5,a5,0x1
    8000a3d6:	2781                	sext.w	a5,a5
    8000a3d8:	1782                	slli	a5,a5,0x20
    8000a3da:	9381                	srli	a5,a5,0x20
    8000a3dc:	fef43423          	sd	a5,-24(s0)

  acquire(&disk.vdisk_lock);
    8000a3e0:	0001f517          	auipc	a0,0x1f
    8000a3e4:	d4850513          	addi	a0,a0,-696 # 80029128 <disk+0x2128>
    8000a3e8:	ffff7097          	auipc	ra,0xffff7
    8000a3ec:	e86080e7          	jalr	-378(ra) # 8000126e <acquire>
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
    8000a3f0:	fd040793          	addi	a5,s0,-48
    8000a3f4:	853e                	mv	a0,a5
    8000a3f6:	00000097          	auipc	ra,0x0
    8000a3fa:	f22080e7          	jalr	-222(ra) # 8000a318 <alloc3_desc>
    8000a3fe:	87aa                	mv	a5,a0
    8000a400:	cf91                	beqz	a5,8000a41c <virtio_disk_rw+0x62>
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    8000a402:	0001f597          	auipc	a1,0x1f
    8000a406:	d2658593          	addi	a1,a1,-730 # 80029128 <disk+0x2128>
    8000a40a:	0001f517          	auipc	a0,0x1f
    8000a40e:	c0e50513          	addi	a0,a0,-1010 # 80029018 <disk+0x2018>
    8000a412:	ffffa097          	auipc	ra,0xffffa
    8000a416:	464080e7          	jalr	1124(ra) # 80004876 <sleep>
    if(alloc3_desc(idx) == 0) {
    8000a41a:	bfd9                	j	8000a3f0 <virtio_disk_rw+0x36>
      break;
    8000a41c:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk.ops[idx[0]];
    8000a41e:	fd042783          	lw	a5,-48(s0)
    8000a422:	20078793          	addi	a5,a5,512
    8000a426:	00479713          	slli	a4,a5,0x4
    8000a42a:	0001d797          	auipc	a5,0x1d
    8000a42e:	bd678793          	addi	a5,a5,-1066 # 80027000 <disk>
    8000a432:	97ba                	add	a5,a5,a4
    8000a434:	0a878793          	addi	a5,a5,168
    8000a438:	fef43023          	sd	a5,-32(s0)

  if(write)
    8000a43c:	fc442783          	lw	a5,-60(s0)
    8000a440:	2781                	sext.w	a5,a5
    8000a442:	c791                	beqz	a5,8000a44e <virtio_disk_rw+0x94>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    8000a444:	fe043783          	ld	a5,-32(s0)
    8000a448:	4705                	li	a4,1
    8000a44a:	c398                	sw	a4,0(a5)
    8000a44c:	a029                	j	8000a456 <virtio_disk_rw+0x9c>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    8000a44e:	fe043783          	ld	a5,-32(s0)
    8000a452:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    8000a456:	fe043783          	ld	a5,-32(s0)
    8000a45a:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    8000a45e:	fe043783          	ld	a5,-32(s0)
    8000a462:	fe843703          	ld	a4,-24(s0)
    8000a466:	e798                	sd	a4,8(a5)

  disk.desc[idx[0]].addr = (uint64) buf0;
    8000a468:	0001d717          	auipc	a4,0x1d
    8000a46c:	b9870713          	addi	a4,a4,-1128 # 80027000 <disk>
    8000a470:	6789                	lui	a5,0x2
    8000a472:	97ba                	add	a5,a5,a4
    8000a474:	6398                	ld	a4,0(a5)
    8000a476:	fd042783          	lw	a5,-48(s0)
    8000a47a:	0792                	slli	a5,a5,0x4
    8000a47c:	97ba                	add	a5,a5,a4
    8000a47e:	fe043703          	ld	a4,-32(s0)
    8000a482:	e398                	sd	a4,0(a5)
  disk.desc[idx[0]].len = sizeof(struct virtio_blk_req);
    8000a484:	0001d717          	auipc	a4,0x1d
    8000a488:	b7c70713          	addi	a4,a4,-1156 # 80027000 <disk>
    8000a48c:	6789                	lui	a5,0x2
    8000a48e:	97ba                	add	a5,a5,a4
    8000a490:	6398                	ld	a4,0(a5)
    8000a492:	fd042783          	lw	a5,-48(s0)
    8000a496:	0792                	slli	a5,a5,0x4
    8000a498:	97ba                	add	a5,a5,a4
    8000a49a:	4741                	li	a4,16
    8000a49c:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    8000a49e:	0001d717          	auipc	a4,0x1d
    8000a4a2:	b6270713          	addi	a4,a4,-1182 # 80027000 <disk>
    8000a4a6:	6789                	lui	a5,0x2
    8000a4a8:	97ba                	add	a5,a5,a4
    8000a4aa:	6398                	ld	a4,0(a5)
    8000a4ac:	fd042783          	lw	a5,-48(s0)
    8000a4b0:	0792                	slli	a5,a5,0x4
    8000a4b2:	97ba                	add	a5,a5,a4
    8000a4b4:	4705                	li	a4,1
    8000a4b6:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[0]].next = idx[1];
    8000a4ba:	fd442683          	lw	a3,-44(s0)
    8000a4be:	0001d717          	auipc	a4,0x1d
    8000a4c2:	b4270713          	addi	a4,a4,-1214 # 80027000 <disk>
    8000a4c6:	6789                	lui	a5,0x2
    8000a4c8:	97ba                	add	a5,a5,a4
    8000a4ca:	6398                	ld	a4,0(a5)
    8000a4cc:	fd042783          	lw	a5,-48(s0)
    8000a4d0:	0792                	slli	a5,a5,0x4
    8000a4d2:	97ba                	add	a5,a5,a4
    8000a4d4:	03069713          	slli	a4,a3,0x30
    8000a4d8:	9341                	srli	a4,a4,0x30
    8000a4da:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.desc[idx[1]].addr = (uint64) b->data;
    8000a4de:	fc843783          	ld	a5,-56(s0)
    8000a4e2:	05878693          	addi	a3,a5,88
    8000a4e6:	0001d717          	auipc	a4,0x1d
    8000a4ea:	b1a70713          	addi	a4,a4,-1254 # 80027000 <disk>
    8000a4ee:	6789                	lui	a5,0x2
    8000a4f0:	97ba                	add	a5,a5,a4
    8000a4f2:	6398                	ld	a4,0(a5)
    8000a4f4:	fd442783          	lw	a5,-44(s0)
    8000a4f8:	0792                	slli	a5,a5,0x4
    8000a4fa:	97ba                	add	a5,a5,a4
    8000a4fc:	8736                	mv	a4,a3
    8000a4fe:	e398                	sd	a4,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    8000a500:	0001d717          	auipc	a4,0x1d
    8000a504:	b0070713          	addi	a4,a4,-1280 # 80027000 <disk>
    8000a508:	6789                	lui	a5,0x2
    8000a50a:	97ba                	add	a5,a5,a4
    8000a50c:	6398                	ld	a4,0(a5)
    8000a50e:	fd442783          	lw	a5,-44(s0)
    8000a512:	0792                	slli	a5,a5,0x4
    8000a514:	97ba                	add	a5,a5,a4
    8000a516:	40000713          	li	a4,1024
    8000a51a:	c798                	sw	a4,8(a5)
  if(write)
    8000a51c:	fc442783          	lw	a5,-60(s0)
    8000a520:	2781                	sext.w	a5,a5
    8000a522:	cf99                	beqz	a5,8000a540 <virtio_disk_rw+0x186>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    8000a524:	0001d717          	auipc	a4,0x1d
    8000a528:	adc70713          	addi	a4,a4,-1316 # 80027000 <disk>
    8000a52c:	6789                	lui	a5,0x2
    8000a52e:	97ba                	add	a5,a5,a4
    8000a530:	6398                	ld	a4,0(a5)
    8000a532:	fd442783          	lw	a5,-44(s0)
    8000a536:	0792                	slli	a5,a5,0x4
    8000a538:	97ba                	add	a5,a5,a4
    8000a53a:	00079623          	sh	zero,12(a5) # 200c <_entry-0x7fffdff4>
    8000a53e:	a839                	j	8000a55c <virtio_disk_rw+0x1a2>
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    8000a540:	0001d717          	auipc	a4,0x1d
    8000a544:	ac070713          	addi	a4,a4,-1344 # 80027000 <disk>
    8000a548:	6789                	lui	a5,0x2
    8000a54a:	97ba                	add	a5,a5,a4
    8000a54c:	6398                	ld	a4,0(a5)
    8000a54e:	fd442783          	lw	a5,-44(s0)
    8000a552:	0792                	slli	a5,a5,0x4
    8000a554:	97ba                	add	a5,a5,a4
    8000a556:	4709                	li	a4,2
    8000a558:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    8000a55c:	0001d717          	auipc	a4,0x1d
    8000a560:	aa470713          	addi	a4,a4,-1372 # 80027000 <disk>
    8000a564:	6789                	lui	a5,0x2
    8000a566:	97ba                	add	a5,a5,a4
    8000a568:	6398                	ld	a4,0(a5)
    8000a56a:	fd442783          	lw	a5,-44(s0)
    8000a56e:	0792                	slli	a5,a5,0x4
    8000a570:	97ba                	add	a5,a5,a4
    8000a572:	00c7d703          	lhu	a4,12(a5) # 200c <_entry-0x7fffdff4>
    8000a576:	0001d697          	auipc	a3,0x1d
    8000a57a:	a8a68693          	addi	a3,a3,-1398 # 80027000 <disk>
    8000a57e:	6789                	lui	a5,0x2
    8000a580:	97b6                	add	a5,a5,a3
    8000a582:	6394                	ld	a3,0(a5)
    8000a584:	fd442783          	lw	a5,-44(s0)
    8000a588:	0792                	slli	a5,a5,0x4
    8000a58a:	97b6                	add	a5,a5,a3
    8000a58c:	00176713          	ori	a4,a4,1
    8000a590:	1742                	slli	a4,a4,0x30
    8000a592:	9341                	srli	a4,a4,0x30
    8000a594:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[1]].next = idx[2];
    8000a598:	fd842683          	lw	a3,-40(s0)
    8000a59c:	0001d717          	auipc	a4,0x1d
    8000a5a0:	a6470713          	addi	a4,a4,-1436 # 80027000 <disk>
    8000a5a4:	6789                	lui	a5,0x2
    8000a5a6:	97ba                	add	a5,a5,a4
    8000a5a8:	6398                	ld	a4,0(a5)
    8000a5aa:	fd442783          	lw	a5,-44(s0)
    8000a5ae:	0792                	slli	a5,a5,0x4
    8000a5b0:	97ba                	add	a5,a5,a4
    8000a5b2:	03069713          	slli	a4,a3,0x30
    8000a5b6:	9341                	srli	a4,a4,0x30
    8000a5b8:	00e79723          	sh	a4,14(a5) # 200e <_entry-0x7fffdff2>

  disk.info[idx[0]].status = 0xff; // device writes 0 on success
    8000a5bc:	fd042783          	lw	a5,-48(s0)
    8000a5c0:	0001d717          	auipc	a4,0x1d
    8000a5c4:	a4070713          	addi	a4,a4,-1472 # 80027000 <disk>
    8000a5c8:	20078793          	addi	a5,a5,512
    8000a5cc:	0792                	slli	a5,a5,0x4
    8000a5ce:	97ba                	add	a5,a5,a4
    8000a5d0:	577d                	li	a4,-1
    8000a5d2:	02e78823          	sb	a4,48(a5)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    8000a5d6:	fd042783          	lw	a5,-48(s0)
    8000a5da:	20078793          	addi	a5,a5,512
    8000a5de:	00479713          	slli	a4,a5,0x4
    8000a5e2:	0001d797          	auipc	a5,0x1d
    8000a5e6:	a1e78793          	addi	a5,a5,-1506 # 80027000 <disk>
    8000a5ea:	97ba                	add	a5,a5,a4
    8000a5ec:	03078693          	addi	a3,a5,48
    8000a5f0:	0001d717          	auipc	a4,0x1d
    8000a5f4:	a1070713          	addi	a4,a4,-1520 # 80027000 <disk>
    8000a5f8:	6789                	lui	a5,0x2
    8000a5fa:	97ba                	add	a5,a5,a4
    8000a5fc:	6398                	ld	a4,0(a5)
    8000a5fe:	fd842783          	lw	a5,-40(s0)
    8000a602:	0792                	slli	a5,a5,0x4
    8000a604:	97ba                	add	a5,a5,a4
    8000a606:	8736                	mv	a4,a3
    8000a608:	e398                	sd	a4,0(a5)
  disk.desc[idx[2]].len = 1;
    8000a60a:	0001d717          	auipc	a4,0x1d
    8000a60e:	9f670713          	addi	a4,a4,-1546 # 80027000 <disk>
    8000a612:	6789                	lui	a5,0x2
    8000a614:	97ba                	add	a5,a5,a4
    8000a616:	6398                	ld	a4,0(a5)
    8000a618:	fd842783          	lw	a5,-40(s0)
    8000a61c:	0792                	slli	a5,a5,0x4
    8000a61e:	97ba                	add	a5,a5,a4
    8000a620:	4705                	li	a4,1
    8000a622:	c798                	sw	a4,8(a5)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    8000a624:	0001d717          	auipc	a4,0x1d
    8000a628:	9dc70713          	addi	a4,a4,-1572 # 80027000 <disk>
    8000a62c:	6789                	lui	a5,0x2
    8000a62e:	97ba                	add	a5,a5,a4
    8000a630:	6398                	ld	a4,0(a5)
    8000a632:	fd842783          	lw	a5,-40(s0)
    8000a636:	0792                	slli	a5,a5,0x4
    8000a638:	97ba                	add	a5,a5,a4
    8000a63a:	4709                	li	a4,2
    8000a63c:	00e79623          	sh	a4,12(a5) # 200c <_entry-0x7fffdff4>
  disk.desc[idx[2]].next = 0;
    8000a640:	0001d717          	auipc	a4,0x1d
    8000a644:	9c070713          	addi	a4,a4,-1600 # 80027000 <disk>
    8000a648:	6789                	lui	a5,0x2
    8000a64a:	97ba                	add	a5,a5,a4
    8000a64c:	6398                	ld	a4,0(a5)
    8000a64e:	fd842783          	lw	a5,-40(s0)
    8000a652:	0792                	slli	a5,a5,0x4
    8000a654:	97ba                	add	a5,a5,a4
    8000a656:	00079723          	sh	zero,14(a5) # 200e <_entry-0x7fffdff2>

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    8000a65a:	fc843783          	ld	a5,-56(s0)
    8000a65e:	4705                	li	a4,1
    8000a660:	c3d8                	sw	a4,4(a5)
  disk.info[idx[0]].b = b;
    8000a662:	fd042783          	lw	a5,-48(s0)
    8000a666:	0001d717          	auipc	a4,0x1d
    8000a66a:	99a70713          	addi	a4,a4,-1638 # 80027000 <disk>
    8000a66e:	20078793          	addi	a5,a5,512
    8000a672:	0792                	slli	a5,a5,0x4
    8000a674:	97ba                	add	a5,a5,a4
    8000a676:	fc843703          	ld	a4,-56(s0)
    8000a67a:	f798                	sd	a4,40(a5)

  // tell the device the first index in our chain of descriptors.
  disk.avail->ring[disk.avail->idx % NUM] = idx[0];
    8000a67c:	fd042603          	lw	a2,-48(s0)
    8000a680:	0001d717          	auipc	a4,0x1d
    8000a684:	98070713          	addi	a4,a4,-1664 # 80027000 <disk>
    8000a688:	6789                	lui	a5,0x2
    8000a68a:	97ba                	add	a5,a5,a4
    8000a68c:	6794                	ld	a3,8(a5)
    8000a68e:	0001d717          	auipc	a4,0x1d
    8000a692:	97270713          	addi	a4,a4,-1678 # 80027000 <disk>
    8000a696:	6789                	lui	a5,0x2
    8000a698:	97ba                	add	a5,a5,a4
    8000a69a:	679c                	ld	a5,8(a5)
    8000a69c:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    8000a6a0:	2781                	sext.w	a5,a5
    8000a6a2:	8b9d                	andi	a5,a5,7
    8000a6a4:	2781                	sext.w	a5,a5
    8000a6a6:	03061713          	slli	a4,a2,0x30
    8000a6aa:	9341                	srli	a4,a4,0x30
    8000a6ac:	0786                	slli	a5,a5,0x1
    8000a6ae:	97b6                	add	a5,a5,a3
    8000a6b0:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    8000a6b4:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk.avail->idx += 1; // not % NUM ...
    8000a6b8:	0001d717          	auipc	a4,0x1d
    8000a6bc:	94870713          	addi	a4,a4,-1720 # 80027000 <disk>
    8000a6c0:	6789                	lui	a5,0x2
    8000a6c2:	97ba                	add	a5,a5,a4
    8000a6c4:	679c                	ld	a5,8(a5)
    8000a6c6:	0027d703          	lhu	a4,2(a5) # 2002 <_entry-0x7fffdffe>
    8000a6ca:	0001d697          	auipc	a3,0x1d
    8000a6ce:	93668693          	addi	a3,a3,-1738 # 80027000 <disk>
    8000a6d2:	6789                	lui	a5,0x2
    8000a6d4:	97b6                	add	a5,a5,a3
    8000a6d6:	679c                	ld	a5,8(a5)
    8000a6d8:	2705                	addiw	a4,a4,1
    8000a6da:	1742                	slli	a4,a4,0x30
    8000a6dc:	9341                	srli	a4,a4,0x30
    8000a6de:	00e79123          	sh	a4,2(a5) # 2002 <_entry-0x7fffdffe>

  __sync_synchronize();
    8000a6e2:	0ff0000f          	fence

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    8000a6e6:	100017b7          	lui	a5,0x10001
    8000a6ea:	05078793          	addi	a5,a5,80 # 10001050 <_entry-0x6fffefb0>
    8000a6ee:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    8000a6f2:	a819                	j	8000a708 <virtio_disk_rw+0x34e>
    sleep(b, &disk.vdisk_lock);
    8000a6f4:	0001f597          	auipc	a1,0x1f
    8000a6f8:	a3458593          	addi	a1,a1,-1484 # 80029128 <disk+0x2128>
    8000a6fc:	fc843503          	ld	a0,-56(s0)
    8000a700:	ffffa097          	auipc	ra,0xffffa
    8000a704:	176080e7          	jalr	374(ra) # 80004876 <sleep>
  while(b->disk == 1) {
    8000a708:	fc843783          	ld	a5,-56(s0)
    8000a70c:	43dc                	lw	a5,4(a5)
    8000a70e:	873e                	mv	a4,a5
    8000a710:	4785                	li	a5,1
    8000a712:	fef701e3          	beq	a4,a5,8000a6f4 <virtio_disk_rw+0x33a>
  }

  disk.info[idx[0]].b = 0;
    8000a716:	fd042783          	lw	a5,-48(s0)
    8000a71a:	0001d717          	auipc	a4,0x1d
    8000a71e:	8e670713          	addi	a4,a4,-1818 # 80027000 <disk>
    8000a722:	20078793          	addi	a5,a5,512
    8000a726:	0792                	slli	a5,a5,0x4
    8000a728:	97ba                	add	a5,a5,a4
    8000a72a:	0207b423          	sd	zero,40(a5)
  free_chain(idx[0]);
    8000a72e:	fd042783          	lw	a5,-48(s0)
    8000a732:	853e                	mv	a0,a5
    8000a734:	00000097          	auipc	ra,0x0
    8000a738:	b6c080e7          	jalr	-1172(ra) # 8000a2a0 <free_chain>

  release(&disk.vdisk_lock);
    8000a73c:	0001f517          	auipc	a0,0x1f
    8000a740:	9ec50513          	addi	a0,a0,-1556 # 80029128 <disk+0x2128>
    8000a744:	ffff7097          	auipc	ra,0xffff7
    8000a748:	b8e080e7          	jalr	-1138(ra) # 800012d2 <release>
}
    8000a74c:	0001                	nop
    8000a74e:	70e2                	ld	ra,56(sp)
    8000a750:	7442                	ld	s0,48(sp)
    8000a752:	6121                	addi	sp,sp,64
    8000a754:	8082                	ret

000000008000a756 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    8000a756:	1101                	addi	sp,sp,-32
    8000a758:	ec06                	sd	ra,24(sp)
    8000a75a:	e822                	sd	s0,16(sp)
    8000a75c:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    8000a75e:	0001f517          	auipc	a0,0x1f
    8000a762:	9ca50513          	addi	a0,a0,-1590 # 80029128 <disk+0x2128>
    8000a766:	ffff7097          	auipc	ra,0xffff7
    8000a76a:	b08080e7          	jalr	-1272(ra) # 8000126e <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    8000a76e:	100017b7          	lui	a5,0x10001
    8000a772:	06078793          	addi	a5,a5,96 # 10001060 <_entry-0x6fffefa0>
    8000a776:	439c                	lw	a5,0(a5)
    8000a778:	0007871b          	sext.w	a4,a5
    8000a77c:	100017b7          	lui	a5,0x10001
    8000a780:	06478793          	addi	a5,a5,100 # 10001064 <_entry-0x6fffef9c>
    8000a784:	8b0d                	andi	a4,a4,3
    8000a786:	2701                	sext.w	a4,a4
    8000a788:	c398                	sw	a4,0(a5)

  __sync_synchronize();
    8000a78a:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk.used_idx != disk.used->idx){
    8000a78e:	a855                	j	8000a842 <virtio_disk_intr+0xec>
    __sync_synchronize();
    8000a790:	0ff0000f          	fence
    int id = disk.used->ring[disk.used_idx % NUM].id;
    8000a794:	0001d717          	auipc	a4,0x1d
    8000a798:	86c70713          	addi	a4,a4,-1940 # 80027000 <disk>
    8000a79c:	6789                	lui	a5,0x2
    8000a79e:	97ba                	add	a5,a5,a4
    8000a7a0:	6b98                	ld	a4,16(a5)
    8000a7a2:	0001d697          	auipc	a3,0x1d
    8000a7a6:	85e68693          	addi	a3,a3,-1954 # 80027000 <disk>
    8000a7aa:	6789                	lui	a5,0x2
    8000a7ac:	97b6                	add	a5,a5,a3
    8000a7ae:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    8000a7b2:	2781                	sext.w	a5,a5
    8000a7b4:	8b9d                	andi	a5,a5,7
    8000a7b6:	2781                	sext.w	a5,a5
    8000a7b8:	078e                	slli	a5,a5,0x3
    8000a7ba:	97ba                	add	a5,a5,a4
    8000a7bc:	43dc                	lw	a5,4(a5)
    8000a7be:	fef42623          	sw	a5,-20(s0)

    if(disk.info[id].status != 0)
    8000a7c2:	0001d717          	auipc	a4,0x1d
    8000a7c6:	83e70713          	addi	a4,a4,-1986 # 80027000 <disk>
    8000a7ca:	fec42783          	lw	a5,-20(s0)
    8000a7ce:	20078793          	addi	a5,a5,512
    8000a7d2:	0792                	slli	a5,a5,0x4
    8000a7d4:	97ba                	add	a5,a5,a4
    8000a7d6:	0307c783          	lbu	a5,48(a5)
    8000a7da:	cb89                	beqz	a5,8000a7ec <virtio_disk_intr+0x96>
      panic("virtio_disk_intr status");
    8000a7dc:	00002517          	auipc	a0,0x2
    8000a7e0:	f4450513          	addi	a0,a0,-188 # 8000c720 <etext+0x720>
    8000a7e4:	ffff6097          	auipc	ra,0xffff6
    8000a7e8:	49a080e7          	jalr	1178(ra) # 80000c7e <panic>

    struct buf *b = disk.info[id].b;
    8000a7ec:	0001d717          	auipc	a4,0x1d
    8000a7f0:	81470713          	addi	a4,a4,-2028 # 80027000 <disk>
    8000a7f4:	fec42783          	lw	a5,-20(s0)
    8000a7f8:	20078793          	addi	a5,a5,512
    8000a7fc:	0792                	slli	a5,a5,0x4
    8000a7fe:	97ba                	add	a5,a5,a4
    8000a800:	779c                	ld	a5,40(a5)
    8000a802:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    8000a806:	fe043783          	ld	a5,-32(s0)
    8000a80a:	0007a223          	sw	zero,4(a5)
    wakeup(b);
    8000a80e:	fe043503          	ld	a0,-32(s0)
    8000a812:	ffffa097          	auipc	ra,0xffffa
    8000a816:	106080e7          	jalr	262(ra) # 80004918 <wakeup>

    disk.used_idx += 1;
    8000a81a:	0001c717          	auipc	a4,0x1c
    8000a81e:	7e670713          	addi	a4,a4,2022 # 80027000 <disk>
    8000a822:	6789                	lui	a5,0x2
    8000a824:	97ba                	add	a5,a5,a4
    8000a826:	0207d783          	lhu	a5,32(a5) # 2020 <_entry-0x7fffdfe0>
    8000a82a:	2785                	addiw	a5,a5,1
    8000a82c:	03079713          	slli	a4,a5,0x30
    8000a830:	9341                	srli	a4,a4,0x30
    8000a832:	0001c697          	auipc	a3,0x1c
    8000a836:	7ce68693          	addi	a3,a3,1998 # 80027000 <disk>
    8000a83a:	6789                	lui	a5,0x2
    8000a83c:	97b6                	add	a5,a5,a3
    8000a83e:	02e79023          	sh	a4,32(a5) # 2020 <_entry-0x7fffdfe0>
  while(disk.used_idx != disk.used->idx){
    8000a842:	0001c717          	auipc	a4,0x1c
    8000a846:	7be70713          	addi	a4,a4,1982 # 80027000 <disk>
    8000a84a:	6789                	lui	a5,0x2
    8000a84c:	97ba                	add	a5,a5,a4
    8000a84e:	0207d683          	lhu	a3,32(a5) # 2020 <_entry-0x7fffdfe0>
    8000a852:	0001c717          	auipc	a4,0x1c
    8000a856:	7ae70713          	addi	a4,a4,1966 # 80027000 <disk>
    8000a85a:	6789                	lui	a5,0x2
    8000a85c:	97ba                	add	a5,a5,a4
    8000a85e:	6b9c                	ld	a5,16(a5)
    8000a860:	0027d783          	lhu	a5,2(a5) # 2002 <_entry-0x7fffdffe>
    8000a864:	0006871b          	sext.w	a4,a3
    8000a868:	2781                	sext.w	a5,a5
    8000a86a:	f2f713e3          	bne	a4,a5,8000a790 <virtio_disk_intr+0x3a>
  }

  release(&disk.vdisk_lock);
    8000a86e:	0001f517          	auipc	a0,0x1f
    8000a872:	8ba50513          	addi	a0,a0,-1862 # 80029128 <disk+0x2128>
    8000a876:	ffff7097          	auipc	ra,0xffff7
    8000a87a:	a5c080e7          	jalr	-1444(ra) # 800012d2 <release>
}
    8000a87e:	0001                	nop
    8000a880:	60e2                	ld	ra,24(sp)
    8000a882:	6442                	ld	s0,16(sp)
    8000a884:	6105                	addi	sp,sp,32
    8000a886:	8082                	ret
	...

000000008000b000 <_trampoline>:
    8000b000:	14051573          	csrrw	a0,sscratch,a0
    8000b004:	02153423          	sd	ra,40(a0)
    8000b008:	02253823          	sd	sp,48(a0)
    8000b00c:	02353c23          	sd	gp,56(a0)
    8000b010:	04453023          	sd	tp,64(a0)
    8000b014:	04553423          	sd	t0,72(a0)
    8000b018:	04653823          	sd	t1,80(a0)
    8000b01c:	04753c23          	sd	t2,88(a0)
    8000b020:	f120                	sd	s0,96(a0)
    8000b022:	f524                	sd	s1,104(a0)
    8000b024:	fd2c                	sd	a1,120(a0)
    8000b026:	e150                	sd	a2,128(a0)
    8000b028:	e554                	sd	a3,136(a0)
    8000b02a:	e958                	sd	a4,144(a0)
    8000b02c:	ed5c                	sd	a5,152(a0)
    8000b02e:	0b053023          	sd	a6,160(a0)
    8000b032:	0b153423          	sd	a7,168(a0)
    8000b036:	0b253823          	sd	s2,176(a0)
    8000b03a:	0b353c23          	sd	s3,184(a0)
    8000b03e:	0d453023          	sd	s4,192(a0)
    8000b042:	0d553423          	sd	s5,200(a0)
    8000b046:	0d653823          	sd	s6,208(a0)
    8000b04a:	0d753c23          	sd	s7,216(a0)
    8000b04e:	0f853023          	sd	s8,224(a0)
    8000b052:	0f953423          	sd	s9,232(a0)
    8000b056:	0fa53823          	sd	s10,240(a0)
    8000b05a:	0fb53c23          	sd	s11,248(a0)
    8000b05e:	11c53023          	sd	t3,256(a0)
    8000b062:	11d53423          	sd	t4,264(a0)
    8000b066:	11e53823          	sd	t5,272(a0)
    8000b06a:	11f53c23          	sd	t6,280(a0)
    8000b06e:	140022f3          	csrr	t0,sscratch
    8000b072:	06553823          	sd	t0,112(a0)
    8000b076:	00853103          	ld	sp,8(a0)
    8000b07a:	02053203          	ld	tp,32(a0)
    8000b07e:	01053283          	ld	t0,16(a0)
    8000b082:	00053303          	ld	t1,0(a0)
    8000b086:	18031073          	csrw	satp,t1
    8000b08a:	12000073          	sfence.vma
    8000b08e:	8282                	jr	t0

000000008000b090 <userret>:
    8000b090:	18059073          	csrw	satp,a1
    8000b094:	12000073          	sfence.vma
    8000b098:	07053283          	ld	t0,112(a0)
    8000b09c:	14029073          	csrw	sscratch,t0
    8000b0a0:	02853083          	ld	ra,40(a0)
    8000b0a4:	03053103          	ld	sp,48(a0)
    8000b0a8:	03853183          	ld	gp,56(a0)
    8000b0ac:	04053203          	ld	tp,64(a0)
    8000b0b0:	04853283          	ld	t0,72(a0)
    8000b0b4:	05053303          	ld	t1,80(a0)
    8000b0b8:	05853383          	ld	t2,88(a0)
    8000b0bc:	7120                	ld	s0,96(a0)
    8000b0be:	7524                	ld	s1,104(a0)
    8000b0c0:	7d2c                	ld	a1,120(a0)
    8000b0c2:	6150                	ld	a2,128(a0)
    8000b0c4:	6554                	ld	a3,136(a0)
    8000b0c6:	6958                	ld	a4,144(a0)
    8000b0c8:	6d5c                	ld	a5,152(a0)
    8000b0ca:	0a053803          	ld	a6,160(a0)
    8000b0ce:	0a853883          	ld	a7,168(a0)
    8000b0d2:	0b053903          	ld	s2,176(a0)
    8000b0d6:	0b853983          	ld	s3,184(a0)
    8000b0da:	0c053a03          	ld	s4,192(a0)
    8000b0de:	0c853a83          	ld	s5,200(a0)
    8000b0e2:	0d053b03          	ld	s6,208(a0)
    8000b0e6:	0d853b83          	ld	s7,216(a0)
    8000b0ea:	0e053c03          	ld	s8,224(a0)
    8000b0ee:	0e853c83          	ld	s9,232(a0)
    8000b0f2:	0f053d03          	ld	s10,240(a0)
    8000b0f6:	0f853d83          	ld	s11,248(a0)
    8000b0fa:	10053e03          	ld	t3,256(a0)
    8000b0fe:	10853e83          	ld	t4,264(a0)
    8000b102:	11053f03          	ld	t5,272(a0)
    8000b106:	11853f83          	ld	t6,280(a0)
    8000b10a:	14051573          	csrrw	a0,sscratch,a0
    8000b10e:	10200073          	sret
	...
