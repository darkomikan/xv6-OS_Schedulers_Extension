
user/_public_test:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <random>:

#define N  1000

uint64 seed = 0x5bd1e995;

int random() {
       0:	7179                	addi	sp,sp,-48
       2:	f422                	sd	s0,40(sp)
       4:	1800                	addi	s0,sp,48
    uint64 a = 16807;
       6:	6791                	lui	a5,0x4
       8:	1a778793          	addi	a5,a5,423 # 41a7 <__global_pointer$+0x283f>
       c:	fef43023          	sd	a5,-32(s0)
    uint64 m = 2147483647L;
      10:	800007b7          	lui	a5,0x80000
      14:	fff7c793          	not	a5,a5
      18:	fcf43c23          	sd	a5,-40(s0)
    seed = (a * seed) % m;
      1c:	00001797          	auipc	a5,0x1
      20:	16478793          	addi	a5,a5,356 # 1180 <seed>
      24:	6398                	ld	a4,0(a5)
      26:	fe043783          	ld	a5,-32(s0)
      2a:	02f70733          	mul	a4,a4,a5
      2e:	fd843783          	ld	a5,-40(s0)
      32:	02f77733          	remu	a4,a4,a5
      36:	00001797          	auipc	a5,0x1
      3a:	14a78793          	addi	a5,a5,330 # 1180 <seed>
      3e:	e398                	sd	a4,0(a5)
    uint64 t = seed * 10;
      40:	00001797          	auipc	a5,0x1
      44:	14078793          	addi	a5,a5,320 # 1180 <seed>
      48:	6398                	ld	a4,0(a5)
      4a:	87ba                	mv	a5,a4
      4c:	078a                	slli	a5,a5,0x2
      4e:	97ba                	add	a5,a5,a4
      50:	0786                	slli	a5,a5,0x1
      52:	fef43423          	sd	a5,-24(s0)
    while (t < m) {
      56:	a809                	j	68 <random+0x68>
        t *= 10;
      58:	fe843703          	ld	a4,-24(s0)
      5c:	87ba                	mv	a5,a4
      5e:	078a                	slli	a5,a5,0x2
      60:	97ba                	add	a5,a5,a4
      62:	0786                	slli	a5,a5,0x1
      64:	fef43423          	sd	a5,-24(s0)
    while (t < m) {
      68:	fe843703          	ld	a4,-24(s0)
      6c:	fd843783          	ld	a5,-40(s0)
      70:	fef764e3          	bltu	a4,a5,58 <random+0x58>
    }
    return t / m;
      74:	fe843703          	ld	a4,-24(s0)
      78:	fd843783          	ld	a5,-40(s0)
      7c:	02f757b3          	divu	a5,a4,a5
      80:	2781                	sext.w	a5,a5
}
      82:	853e                	mv	a0,a5
      84:	7422                	ld	s0,40(sp)
      86:	6145                	addi	sp,sp,48
      88:	8082                	ret

000000000000008a <do_work>:

int do_work(int length) {
      8a:	7179                	addi	sp,sp,-48
      8c:	f422                	sd	s0,40(sp)
      8e:	1800                	addi	s0,sp,48
      90:	87aa                	mv	a5,a0
      92:	fcf42e23          	sw	a5,-36(s0)
    int ret = 0;
      96:	fe042623          	sw	zero,-20(s0)
    for (int i = 0; i < length; i++) {
      9a:	fe042423          	sw	zero,-24(s0)
      9e:	a099                	j	e4 <do_work+0x5a>
        for (int j = 0; j < length; j++) {
      a0:	fe042223          	sw	zero,-28(s0)
      a4:	a01d                	j	ca <do_work+0x40>
            ret += (j % 2) ? +1 : -1;
      a6:	fe442783          	lw	a5,-28(s0)
      aa:	8b85                	andi	a5,a5,1
      ac:	2781                	sext.w	a5,a5
      ae:	c399                	beqz	a5,b4 <do_work+0x2a>
      b0:	4785                	li	a5,1
      b2:	a011                	j	b6 <do_work+0x2c>
      b4:	57fd                	li	a5,-1
      b6:	fec42703          	lw	a4,-20(s0)
      ba:	9fb9                	addw	a5,a5,a4
      bc:	fef42623          	sw	a5,-20(s0)
        for (int j = 0; j < length; j++) {
      c0:	fe442783          	lw	a5,-28(s0)
      c4:	2785                	addiw	a5,a5,1
      c6:	fef42223          	sw	a5,-28(s0)
      ca:	fe442703          	lw	a4,-28(s0)
      ce:	fdc42783          	lw	a5,-36(s0)
      d2:	2701                	sext.w	a4,a4
      d4:	2781                	sext.w	a5,a5
      d6:	fcf748e3          	blt	a4,a5,a6 <do_work+0x1c>
    for (int i = 0; i < length; i++) {
      da:	fe842783          	lw	a5,-24(s0)
      de:	2785                	addiw	a5,a5,1
      e0:	fef42423          	sw	a5,-24(s0)
      e4:	fe842703          	lw	a4,-24(s0)
      e8:	fdc42783          	lw	a5,-36(s0)
      ec:	2701                	sext.w	a4,a4
      ee:	2781                	sext.w	a5,a5
      f0:	faf748e3          	blt	a4,a5,a0 <do_work+0x16>
        }
    }
    return ret;
      f4:	fec42783          	lw	a5,-20(s0)
}
      f8:	853e                	mv	a0,a5
      fa:	7422                	ld	s0,40(sp)
      fc:	6145                	addi	sp,sp,48
      fe:	8082                	ret

0000000000000100 <p1>:

void p1(int id, int length) {
     100:	7179                	addi	sp,sp,-48
     102:	f406                	sd	ra,40(sp)
     104:	f022                	sd	s0,32(sp)
     106:	1800                	addi	s0,sp,48
     108:	87aa                	mv	a5,a0
     10a:	872e                	mv	a4,a1
     10c:	fcf42e23          	sw	a5,-36(s0)
     110:	87ba                	mv	a5,a4
     112:	fcf42c23          	sw	a5,-40(s0)
    for (int i = 0; i < length/10; i++) {
     116:	fe042623          	sw	zero,-20(s0)
     11a:	a0a9                	j	164 <p1+0x64>
        sleep(1);
     11c:	4505                	li	a0,1
     11e:	00001097          	auipc	ra,0x1
     122:	814080e7          	jalr	-2028(ra) # 932 <sleep>

        do_work(length*5);
     126:	fd842703          	lw	a4,-40(s0)
     12a:	87ba                	mv	a5,a4
     12c:	0027979b          	slliw	a5,a5,0x2
     130:	9fb9                	addw	a5,a5,a4
     132:	2781                	sext.w	a5,a5
     134:	853e                	mv	a0,a5
     136:	00000097          	auipc	ra,0x0
     13a:	f54080e7          	jalr	-172(ra) # 8a <do_work>
        printf("P%d iteration=%d\n", id, i);
     13e:	fec42703          	lw	a4,-20(s0)
     142:	fdc42783          	lw	a5,-36(s0)
     146:	863a                	mv	a2,a4
     148:	85be                	mv	a1,a5
     14a:	00001517          	auipc	a0,0x1
     14e:	fbe50513          	addi	a0,a0,-66 # 1108 <malloc+0x13e>
     152:	00001097          	auipc	ra,0x1
     156:	c86080e7          	jalr	-890(ra) # dd8 <printf>
    for (int i = 0; i < length/10; i++) {
     15a:	fec42783          	lw	a5,-20(s0)
     15e:	2785                	addiw	a5,a5,1
     160:	fef42623          	sw	a5,-20(s0)
     164:	fd842703          	lw	a4,-40(s0)
     168:	47a9                	li	a5,10
     16a:	02f747bb          	divw	a5,a4,a5
     16e:	0007871b          	sext.w	a4,a5
     172:	fec42783          	lw	a5,-20(s0)
     176:	2781                	sext.w	a5,a5
     178:	fae7c2e3          	blt	a5,a4,11c <p1+0x1c>
    }
    printf("P%d FINISHED!\n", id);
     17c:	fdc42783          	lw	a5,-36(s0)
     180:	85be                	mv	a1,a5
     182:	00001517          	auipc	a0,0x1
     186:	f9e50513          	addi	a0,a0,-98 # 1120 <malloc+0x156>
     18a:	00001097          	auipc	ra,0x1
     18e:	c4e080e7          	jalr	-946(ra) # dd8 <printf>
}
     192:	0001                	nop
     194:	70a2                	ld	ra,40(sp)
     196:	7402                	ld	s0,32(sp)
     198:	6145                	addi	sp,sp,48
     19a:	8082                	ret

000000000000019c <p2>:

void p2(int id, int length) {
     19c:	7179                	addi	sp,sp,-48
     19e:	f406                	sd	ra,40(sp)
     1a0:	f022                	sd	s0,32(sp)
     1a2:	1800                	addi	s0,sp,48
     1a4:	87aa                	mv	a5,a0
     1a6:	872e                	mv	a4,a1
     1a8:	fcf42e23          	sw	a5,-36(s0)
     1ac:	87ba                	mv	a5,a4
     1ae:	fcf42c23          	sw	a5,-40(s0)
    for (int i = 0; i < length; i++) {
     1b2:	fe042623          	sw	zero,-20(s0)
     1b6:	a889                	j	208 <p2+0x6c>
        sleep(random());
     1b8:	00000097          	auipc	ra,0x0
     1bc:	e48080e7          	jalr	-440(ra) # 0 <random>
     1c0:	87aa                	mv	a5,a0
     1c2:	853e                	mv	a0,a5
     1c4:	00000097          	auipc	ra,0x0
     1c8:	76e080e7          	jalr	1902(ra) # 932 <sleep>

        do_work(length / 10);
     1cc:	fd842703          	lw	a4,-40(s0)
     1d0:	47a9                	li	a5,10
     1d2:	02f747bb          	divw	a5,a4,a5
     1d6:	2781                	sext.w	a5,a5
     1d8:	853e                	mv	a0,a5
     1da:	00000097          	auipc	ra,0x0
     1de:	eb0080e7          	jalr	-336(ra) # 8a <do_work>
        printf("P%d iteration=%d\n", id, i);
     1e2:	fec42703          	lw	a4,-20(s0)
     1e6:	fdc42783          	lw	a5,-36(s0)
     1ea:	863a                	mv	a2,a4
     1ec:	85be                	mv	a1,a5
     1ee:	00001517          	auipc	a0,0x1
     1f2:	f1a50513          	addi	a0,a0,-230 # 1108 <malloc+0x13e>
     1f6:	00001097          	auipc	ra,0x1
     1fa:	be2080e7          	jalr	-1054(ra) # dd8 <printf>
    for (int i = 0; i < length; i++) {
     1fe:	fec42783          	lw	a5,-20(s0)
     202:	2785                	addiw	a5,a5,1
     204:	fef42623          	sw	a5,-20(s0)
     208:	fec42703          	lw	a4,-20(s0)
     20c:	fd842783          	lw	a5,-40(s0)
     210:	2701                	sext.w	a4,a4
     212:	2781                	sext.w	a5,a5
     214:	faf742e3          	blt	a4,a5,1b8 <p2+0x1c>
    }
    printf("P%d FINISHED!\n", id);
     218:	fdc42783          	lw	a5,-36(s0)
     21c:	85be                	mv	a1,a5
     21e:	00001517          	auipc	a0,0x1
     222:	f0250513          	addi	a0,a0,-254 # 1120 <malloc+0x156>
     226:	00001097          	auipc	ra,0x1
     22a:	bb2080e7          	jalr	-1102(ra) # dd8 <printf>
}
     22e:	0001                	nop
     230:	70a2                	ld	ra,40(sp)
     232:	7402                	ld	s0,32(sp)
     234:	6145                	addi	sp,sp,48
     236:	8082                	ret

0000000000000238 <main>:

int
main(int argc, char *argv[])
{
     238:	7139                	addi	sp,sp,-64
     23a:	fc06                	sd	ra,56(sp)
     23c:	f822                	sd	s0,48(sp)
     23e:	0080                	addi	s0,sp,64
     240:	87aa                	mv	a5,a0
     242:	fcb43023          	sd	a1,-64(s0)
     246:	fcf42623          	sw	a5,-52(s0)
    uint starttime = uptime();
     24a:	00000097          	auipc	ra,0x0
     24e:	6f0080e7          	jalr	1776(ra) # 93a <uptime>
     252:	87aa                	mv	a5,a0
     254:	fcf42c23          	sw	a5,-40(s0)
    setSchedAlg(1, 50, 0);
     258:	4601                	li	a2,0
     25a:	03200593          	li	a1,50
     25e:	4505                	li	a0,1
     260:	00000097          	auipc	ra,0x0
     264:	6e2080e7          	jalr	1762(ra) # 942 <setSchedAlg>
    int proc_num = 10;
     268:	47a9                	li	a5,10
     26a:	fef42623          	sw	a5,-20(s0)
    int length = 1000;
     26e:	3e800793          	li	a5,1000
     272:	fef42423          	sw	a5,-24(s0)

    for (int i = 1; i < argc; i++) {
     276:	4785                	li	a5,1
     278:	fef42223          	sw	a5,-28(s0)
     27c:	a0ad                	j	2e6 <main+0xae>
        switch (i) {
     27e:	fe442783          	lw	a5,-28(s0)
     282:	0007871b          	sext.w	a4,a5
     286:	4785                	li	a5,1
     288:	00f70a63          	beq	a4,a5,29c <main+0x64>
     28c:	fe442783          	lw	a5,-28(s0)
     290:	0007871b          	sext.w	a4,a5
     294:	4789                	li	a5,2
     296:	02f70363          	beq	a4,a5,2bc <main+0x84>
                break;
            case 2:
                length = atoi(argv[i]);
                break;
            default:
                break;
     29a:	a089                	j	2dc <main+0xa4>
                proc_num = atoi(argv[i]);
     29c:	fe442783          	lw	a5,-28(s0)
     2a0:	078e                	slli	a5,a5,0x3
     2a2:	fc043703          	ld	a4,-64(s0)
     2a6:	97ba                	add	a5,a5,a4
     2a8:	639c                	ld	a5,0(a5)
     2aa:	853e                	mv	a0,a5
     2ac:	00000097          	auipc	ra,0x0
     2b0:	3fe080e7          	jalr	1022(ra) # 6aa <atoi>
     2b4:	87aa                	mv	a5,a0
     2b6:	fef42623          	sw	a5,-20(s0)
                break;
     2ba:	a00d                	j	2dc <main+0xa4>
                length = atoi(argv[i]);
     2bc:	fe442783          	lw	a5,-28(s0)
     2c0:	078e                	slli	a5,a5,0x3
     2c2:	fc043703          	ld	a4,-64(s0)
     2c6:	97ba                	add	a5,a5,a4
     2c8:	639c                	ld	a5,0(a5)
     2ca:	853e                	mv	a0,a5
     2cc:	00000097          	auipc	ra,0x0
     2d0:	3de080e7          	jalr	990(ra) # 6aa <atoi>
     2d4:	87aa                	mv	a5,a0
     2d6:	fef42423          	sw	a5,-24(s0)
                break;
     2da:	0001                	nop
    for (int i = 1; i < argc; i++) {
     2dc:	fe442783          	lw	a5,-28(s0)
     2e0:	2785                	addiw	a5,a5,1
     2e2:	fef42223          	sw	a5,-28(s0)
     2e6:	fe442703          	lw	a4,-28(s0)
     2ea:	fcc42783          	lw	a5,-52(s0)
     2ee:	2701                	sext.w	a4,a4
     2f0:	2781                	sext.w	a5,a5
     2f2:	f8f746e3          	blt	a4,a5,27e <main+0x46>
        }
    }

    printf("proc_num=%d length=%d\n", proc_num, length);
     2f6:	fe842703          	lw	a4,-24(s0)
     2fa:	fec42783          	lw	a5,-20(s0)
     2fe:	863a                	mv	a2,a4
     300:	85be                	mv	a1,a5
     302:	00001517          	auipc	a0,0x1
     306:	e2e50513          	addi	a0,a0,-466 # 1130 <malloc+0x166>
     30a:	00001097          	auipc	ra,0x1
     30e:	ace080e7          	jalr	-1330(ra) # dd8 <printf>

    for (int i = 0; i < proc_num; i++) {
     312:	fe042023          	sw	zero,-32(s0)
     316:	a069                	j	3a0 <main+0x168>
        int pid = fork();
     318:	00000097          	auipc	ra,0x0
     31c:	582080e7          	jalr	1410(ra) # 89a <fork>
     320:	87aa                	mv	a5,a0
     322:	fcf42a23          	sw	a5,-44(s0)
        if(pid < 0)
     326:	fd442783          	lw	a5,-44(s0)
     32a:	2781                	sext.w	a5,a5
     32c:	0807c363          	bltz	a5,3b2 <main+0x17a>
            break;
        if(pid == 0) {
     330:	fd442783          	lw	a5,-44(s0)
     334:	2781                	sext.w	a5,a5
     336:	e3a5                	bnez	a5,396 <main+0x15e>
            if (i < proc_num / 3) {
     338:	fec42703          	lw	a4,-20(s0)
     33c:	478d                	li	a5,3
     33e:	02f747bb          	divw	a5,a4,a5
     342:	0007871b          	sext.w	a4,a5
     346:	fe042783          	lw	a5,-32(s0)
     34a:	2781                	sext.w	a5,a5
     34c:	00e7dd63          	bge	a5,a4,366 <main+0x12e>
                p1(i, length);
     350:	fe842703          	lw	a4,-24(s0)
     354:	fe042783          	lw	a5,-32(s0)
     358:	85ba                	mv	a1,a4
     35a:	853e                	mv	a0,a5
     35c:	00000097          	auipc	ra,0x0
     360:	da4080e7          	jalr	-604(ra) # 100 <p1>
     364:	a025                	j	38c <main+0x154>
            } else {
                p2(i, length / 4);
     366:	fe842783          	lw	a5,-24(s0)
     36a:	41f7d71b          	sraiw	a4,a5,0x1f
     36e:	01e7571b          	srliw	a4,a4,0x1e
     372:	9fb9                	addw	a5,a5,a4
     374:	4027d79b          	sraiw	a5,a5,0x2
     378:	0007871b          	sext.w	a4,a5
     37c:	fe042783          	lw	a5,-32(s0)
     380:	85ba                	mv	a1,a4
     382:	853e                	mv	a0,a5
     384:	00000097          	auipc	ra,0x0
     388:	e18080e7          	jalr	-488(ra) # 19c <p2>
            }
            exit(0);
     38c:	4501                	li	a0,0
     38e:	00000097          	auipc	ra,0x0
     392:	514080e7          	jalr	1300(ra) # 8a2 <exit>
    for (int i = 0; i < proc_num; i++) {
     396:	fe042783          	lw	a5,-32(s0)
     39a:	2785                	addiw	a5,a5,1
     39c:	fef42023          	sw	a5,-32(s0)
     3a0:	fe042703          	lw	a4,-32(s0)
     3a4:	fec42783          	lw	a5,-20(s0)
     3a8:	2701                	sext.w	a4,a4
     3aa:	2781                	sext.w	a5,a5
     3ac:	f6f746e3          	blt	a4,a5,318 <main+0xe0>
     3b0:	a011                	j	3b4 <main+0x17c>
            break;
     3b2:	0001                	nop
        }
    }

    for (int i = 0; i < proc_num; i++) {
     3b4:	fc042e23          	sw	zero,-36(s0)
     3b8:	a819                	j	3ce <main+0x196>
        wait(0);
     3ba:	4501                	li	a0,0
     3bc:	00000097          	auipc	ra,0x0
     3c0:	4ee080e7          	jalr	1262(ra) # 8aa <wait>
    for (int i = 0; i < proc_num; i++) {
     3c4:	fdc42783          	lw	a5,-36(s0)
     3c8:	2785                	addiw	a5,a5,1
     3ca:	fcf42e23          	sw	a5,-36(s0)
     3ce:	fdc42703          	lw	a4,-36(s0)
     3d2:	fec42783          	lw	a5,-20(s0)
     3d6:	2701                	sext.w	a4,a4
     3d8:	2781                	sext.w	a5,a5
     3da:	fef740e3          	blt	a4,a5,3ba <main+0x182>
    }
    printf("\nExecution time: %d\n", uptime()-starttime);
     3de:	00000097          	auipc	ra,0x0
     3e2:	55c080e7          	jalr	1372(ra) # 93a <uptime>
     3e6:	87aa                	mv	a5,a0
     3e8:	0007871b          	sext.w	a4,a5
     3ec:	fd842783          	lw	a5,-40(s0)
     3f0:	40f707bb          	subw	a5,a4,a5
     3f4:	2781                	sext.w	a5,a5
     3f6:	85be                	mv	a1,a5
     3f8:	00001517          	auipc	a0,0x1
     3fc:	d5050513          	addi	a0,a0,-688 # 1148 <malloc+0x17e>
     400:	00001097          	auipc	ra,0x1
     404:	9d8080e7          	jalr	-1576(ra) # dd8 <printf>
    exit(0);
     408:	4501                	li	a0,0
     40a:	00000097          	auipc	ra,0x0
     40e:	498080e7          	jalr	1176(ra) # 8a2 <exit>

0000000000000412 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     412:	7179                	addi	sp,sp,-48
     414:	f422                	sd	s0,40(sp)
     416:	1800                	addi	s0,sp,48
     418:	fca43c23          	sd	a0,-40(s0)
     41c:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     420:	fd843783          	ld	a5,-40(s0)
     424:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     428:	0001                	nop
     42a:	fd043703          	ld	a4,-48(s0)
     42e:	00170793          	addi	a5,a4,1
     432:	fcf43823          	sd	a5,-48(s0)
     436:	fd843783          	ld	a5,-40(s0)
     43a:	00178693          	addi	a3,a5,1
     43e:	fcd43c23          	sd	a3,-40(s0)
     442:	00074703          	lbu	a4,0(a4)
     446:	00e78023          	sb	a4,0(a5)
     44a:	0007c783          	lbu	a5,0(a5)
     44e:	fff1                	bnez	a5,42a <strcpy+0x18>
    ;
  return os;
     450:	fe843783          	ld	a5,-24(s0)
}
     454:	853e                	mv	a0,a5
     456:	7422                	ld	s0,40(sp)
     458:	6145                	addi	sp,sp,48
     45a:	8082                	ret

000000000000045c <strcmp>:

int
strcmp(const char *p, const char *q)
{
     45c:	1101                	addi	sp,sp,-32
     45e:	ec22                	sd	s0,24(sp)
     460:	1000                	addi	s0,sp,32
     462:	fea43423          	sd	a0,-24(s0)
     466:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     46a:	a819                	j	480 <strcmp+0x24>
    p++, q++;
     46c:	fe843783          	ld	a5,-24(s0)
     470:	0785                	addi	a5,a5,1
     472:	fef43423          	sd	a5,-24(s0)
     476:	fe043783          	ld	a5,-32(s0)
     47a:	0785                	addi	a5,a5,1
     47c:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     480:	fe843783          	ld	a5,-24(s0)
     484:	0007c783          	lbu	a5,0(a5)
     488:	cb99                	beqz	a5,49e <strcmp+0x42>
     48a:	fe843783          	ld	a5,-24(s0)
     48e:	0007c703          	lbu	a4,0(a5)
     492:	fe043783          	ld	a5,-32(s0)
     496:	0007c783          	lbu	a5,0(a5)
     49a:	fcf709e3          	beq	a4,a5,46c <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     49e:	fe843783          	ld	a5,-24(s0)
     4a2:	0007c783          	lbu	a5,0(a5)
     4a6:	0007871b          	sext.w	a4,a5
     4aa:	fe043783          	ld	a5,-32(s0)
     4ae:	0007c783          	lbu	a5,0(a5)
     4b2:	2781                	sext.w	a5,a5
     4b4:	40f707bb          	subw	a5,a4,a5
     4b8:	2781                	sext.w	a5,a5
}
     4ba:	853e                	mv	a0,a5
     4bc:	6462                	ld	s0,24(sp)
     4be:	6105                	addi	sp,sp,32
     4c0:	8082                	ret

00000000000004c2 <strlen>:

uint
strlen(const char *s)
{
     4c2:	7179                	addi	sp,sp,-48
     4c4:	f422                	sd	s0,40(sp)
     4c6:	1800                	addi	s0,sp,48
     4c8:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     4cc:	fe042623          	sw	zero,-20(s0)
     4d0:	a031                	j	4dc <strlen+0x1a>
     4d2:	fec42783          	lw	a5,-20(s0)
     4d6:	2785                	addiw	a5,a5,1
     4d8:	fef42623          	sw	a5,-20(s0)
     4dc:	fec42783          	lw	a5,-20(s0)
     4e0:	fd843703          	ld	a4,-40(s0)
     4e4:	97ba                	add	a5,a5,a4
     4e6:	0007c783          	lbu	a5,0(a5)
     4ea:	f7e5                	bnez	a5,4d2 <strlen+0x10>
    ;
  return n;
     4ec:	fec42783          	lw	a5,-20(s0)
}
     4f0:	853e                	mv	a0,a5
     4f2:	7422                	ld	s0,40(sp)
     4f4:	6145                	addi	sp,sp,48
     4f6:	8082                	ret

00000000000004f8 <memset>:

void*
memset(void *dst, int c, uint n)
{
     4f8:	7179                	addi	sp,sp,-48
     4fa:	f422                	sd	s0,40(sp)
     4fc:	1800                	addi	s0,sp,48
     4fe:	fca43c23          	sd	a0,-40(s0)
     502:	87ae                	mv	a5,a1
     504:	8732                	mv	a4,a2
     506:	fcf42a23          	sw	a5,-44(s0)
     50a:	87ba                	mv	a5,a4
     50c:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     510:	fd843783          	ld	a5,-40(s0)
     514:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     518:	fe042623          	sw	zero,-20(s0)
     51c:	a00d                	j	53e <memset+0x46>
    cdst[i] = c;
     51e:	fec42783          	lw	a5,-20(s0)
     522:	fe043703          	ld	a4,-32(s0)
     526:	97ba                	add	a5,a5,a4
     528:	fd442703          	lw	a4,-44(s0)
     52c:	0ff77713          	andi	a4,a4,255
     530:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     534:	fec42783          	lw	a5,-20(s0)
     538:	2785                	addiw	a5,a5,1
     53a:	fef42623          	sw	a5,-20(s0)
     53e:	fec42703          	lw	a4,-20(s0)
     542:	fd042783          	lw	a5,-48(s0)
     546:	2781                	sext.w	a5,a5
     548:	fcf76be3          	bltu	a4,a5,51e <memset+0x26>
  }
  return dst;
     54c:	fd843783          	ld	a5,-40(s0)
}
     550:	853e                	mv	a0,a5
     552:	7422                	ld	s0,40(sp)
     554:	6145                	addi	sp,sp,48
     556:	8082                	ret

0000000000000558 <strchr>:

char*
strchr(const char *s, char c)
{
     558:	1101                	addi	sp,sp,-32
     55a:	ec22                	sd	s0,24(sp)
     55c:	1000                	addi	s0,sp,32
     55e:	fea43423          	sd	a0,-24(s0)
     562:	87ae                	mv	a5,a1
     564:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     568:	a01d                	j	58e <strchr+0x36>
    if(*s == c)
     56a:	fe843783          	ld	a5,-24(s0)
     56e:	0007c703          	lbu	a4,0(a5)
     572:	fe744783          	lbu	a5,-25(s0)
     576:	0ff7f793          	andi	a5,a5,255
     57a:	00e79563          	bne	a5,a4,584 <strchr+0x2c>
      return (char*)s;
     57e:	fe843783          	ld	a5,-24(s0)
     582:	a821                	j	59a <strchr+0x42>
  for(; *s; s++)
     584:	fe843783          	ld	a5,-24(s0)
     588:	0785                	addi	a5,a5,1
     58a:	fef43423          	sd	a5,-24(s0)
     58e:	fe843783          	ld	a5,-24(s0)
     592:	0007c783          	lbu	a5,0(a5)
     596:	fbf1                	bnez	a5,56a <strchr+0x12>
  return 0;
     598:	4781                	li	a5,0
}
     59a:	853e                	mv	a0,a5
     59c:	6462                	ld	s0,24(sp)
     59e:	6105                	addi	sp,sp,32
     5a0:	8082                	ret

00000000000005a2 <gets>:

char*
gets(char *buf, int max)
{
     5a2:	7179                	addi	sp,sp,-48
     5a4:	f406                	sd	ra,40(sp)
     5a6:	f022                	sd	s0,32(sp)
     5a8:	1800                	addi	s0,sp,48
     5aa:	fca43c23          	sd	a0,-40(s0)
     5ae:	87ae                	mv	a5,a1
     5b0:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     5b4:	fe042623          	sw	zero,-20(s0)
     5b8:	a8a1                	j	610 <gets+0x6e>
    cc = read(0, &c, 1);
     5ba:	fe740793          	addi	a5,s0,-25
     5be:	4605                	li	a2,1
     5c0:	85be                	mv	a1,a5
     5c2:	4501                	li	a0,0
     5c4:	00000097          	auipc	ra,0x0
     5c8:	2f6080e7          	jalr	758(ra) # 8ba <read>
     5cc:	87aa                	mv	a5,a0
     5ce:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     5d2:	fe842783          	lw	a5,-24(s0)
     5d6:	2781                	sext.w	a5,a5
     5d8:	04f05763          	blez	a5,626 <gets+0x84>
      break;
    buf[i++] = c;
     5dc:	fec42783          	lw	a5,-20(s0)
     5e0:	0017871b          	addiw	a4,a5,1
     5e4:	fee42623          	sw	a4,-20(s0)
     5e8:	873e                	mv	a4,a5
     5ea:	fd843783          	ld	a5,-40(s0)
     5ee:	97ba                	add	a5,a5,a4
     5f0:	fe744703          	lbu	a4,-25(s0)
     5f4:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     5f8:	fe744783          	lbu	a5,-25(s0)
     5fc:	873e                	mv	a4,a5
     5fe:	47a9                	li	a5,10
     600:	02f70463          	beq	a4,a5,628 <gets+0x86>
     604:	fe744783          	lbu	a5,-25(s0)
     608:	873e                	mv	a4,a5
     60a:	47b5                	li	a5,13
     60c:	00f70e63          	beq	a4,a5,628 <gets+0x86>
  for(i=0; i+1 < max; ){
     610:	fec42783          	lw	a5,-20(s0)
     614:	2785                	addiw	a5,a5,1
     616:	0007871b          	sext.w	a4,a5
     61a:	fd442783          	lw	a5,-44(s0)
     61e:	2781                	sext.w	a5,a5
     620:	f8f74de3          	blt	a4,a5,5ba <gets+0x18>
     624:	a011                	j	628 <gets+0x86>
      break;
     626:	0001                	nop
      break;
  }
  buf[i] = '\0';
     628:	fec42783          	lw	a5,-20(s0)
     62c:	fd843703          	ld	a4,-40(s0)
     630:	97ba                	add	a5,a5,a4
     632:	00078023          	sb	zero,0(a5)
  return buf;
     636:	fd843783          	ld	a5,-40(s0)
}
     63a:	853e                	mv	a0,a5
     63c:	70a2                	ld	ra,40(sp)
     63e:	7402                	ld	s0,32(sp)
     640:	6145                	addi	sp,sp,48
     642:	8082                	ret

0000000000000644 <stat>:

int
stat(const char *n, struct stat *st)
{
     644:	7179                	addi	sp,sp,-48
     646:	f406                	sd	ra,40(sp)
     648:	f022                	sd	s0,32(sp)
     64a:	1800                	addi	s0,sp,48
     64c:	fca43c23          	sd	a0,-40(s0)
     650:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     654:	4581                	li	a1,0
     656:	fd843503          	ld	a0,-40(s0)
     65a:	00000097          	auipc	ra,0x0
     65e:	288080e7          	jalr	648(ra) # 8e2 <open>
     662:	87aa                	mv	a5,a0
     664:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     668:	fec42783          	lw	a5,-20(s0)
     66c:	2781                	sext.w	a5,a5
     66e:	0007d463          	bgez	a5,676 <stat+0x32>
    return -1;
     672:	57fd                	li	a5,-1
     674:	a035                	j	6a0 <stat+0x5c>
  r = fstat(fd, st);
     676:	fec42783          	lw	a5,-20(s0)
     67a:	fd043583          	ld	a1,-48(s0)
     67e:	853e                	mv	a0,a5
     680:	00000097          	auipc	ra,0x0
     684:	27a080e7          	jalr	634(ra) # 8fa <fstat>
     688:	87aa                	mv	a5,a0
     68a:	fef42423          	sw	a5,-24(s0)
  close(fd);
     68e:	fec42783          	lw	a5,-20(s0)
     692:	853e                	mv	a0,a5
     694:	00000097          	auipc	ra,0x0
     698:	236080e7          	jalr	566(ra) # 8ca <close>
  return r;
     69c:	fe842783          	lw	a5,-24(s0)
}
     6a0:	853e                	mv	a0,a5
     6a2:	70a2                	ld	ra,40(sp)
     6a4:	7402                	ld	s0,32(sp)
     6a6:	6145                	addi	sp,sp,48
     6a8:	8082                	ret

00000000000006aa <atoi>:

int
atoi(const char *s)
{
     6aa:	7179                	addi	sp,sp,-48
     6ac:	f422                	sd	s0,40(sp)
     6ae:	1800                	addi	s0,sp,48
     6b0:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     6b4:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     6b8:	a815                	j	6ec <atoi+0x42>
    n = n*10 + *s++ - '0';
     6ba:	fec42703          	lw	a4,-20(s0)
     6be:	87ba                	mv	a5,a4
     6c0:	0027979b          	slliw	a5,a5,0x2
     6c4:	9fb9                	addw	a5,a5,a4
     6c6:	0017979b          	slliw	a5,a5,0x1
     6ca:	0007871b          	sext.w	a4,a5
     6ce:	fd843783          	ld	a5,-40(s0)
     6d2:	00178693          	addi	a3,a5,1
     6d6:	fcd43c23          	sd	a3,-40(s0)
     6da:	0007c783          	lbu	a5,0(a5)
     6de:	2781                	sext.w	a5,a5
     6e0:	9fb9                	addw	a5,a5,a4
     6e2:	2781                	sext.w	a5,a5
     6e4:	fd07879b          	addiw	a5,a5,-48
     6e8:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     6ec:	fd843783          	ld	a5,-40(s0)
     6f0:	0007c783          	lbu	a5,0(a5)
     6f4:	873e                	mv	a4,a5
     6f6:	02f00793          	li	a5,47
     6fa:	00e7fb63          	bgeu	a5,a4,710 <atoi+0x66>
     6fe:	fd843783          	ld	a5,-40(s0)
     702:	0007c783          	lbu	a5,0(a5)
     706:	873e                	mv	a4,a5
     708:	03900793          	li	a5,57
     70c:	fae7f7e3          	bgeu	a5,a4,6ba <atoi+0x10>
  return n;
     710:	fec42783          	lw	a5,-20(s0)
}
     714:	853e                	mv	a0,a5
     716:	7422                	ld	s0,40(sp)
     718:	6145                	addi	sp,sp,48
     71a:	8082                	ret

000000000000071c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     71c:	7139                	addi	sp,sp,-64
     71e:	fc22                	sd	s0,56(sp)
     720:	0080                	addi	s0,sp,64
     722:	fca43c23          	sd	a0,-40(s0)
     726:	fcb43823          	sd	a1,-48(s0)
     72a:	87b2                	mv	a5,a2
     72c:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     730:	fd843783          	ld	a5,-40(s0)
     734:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     738:	fd043783          	ld	a5,-48(s0)
     73c:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     740:	fe043703          	ld	a4,-32(s0)
     744:	fe843783          	ld	a5,-24(s0)
     748:	02e7fc63          	bgeu	a5,a4,780 <memmove+0x64>
    while(n-- > 0)
     74c:	a00d                	j	76e <memmove+0x52>
      *dst++ = *src++;
     74e:	fe043703          	ld	a4,-32(s0)
     752:	00170793          	addi	a5,a4,1
     756:	fef43023          	sd	a5,-32(s0)
     75a:	fe843783          	ld	a5,-24(s0)
     75e:	00178693          	addi	a3,a5,1
     762:	fed43423          	sd	a3,-24(s0)
     766:	00074703          	lbu	a4,0(a4)
     76a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     76e:	fcc42783          	lw	a5,-52(s0)
     772:	fff7871b          	addiw	a4,a5,-1
     776:	fce42623          	sw	a4,-52(s0)
     77a:	fcf04ae3          	bgtz	a5,74e <memmove+0x32>
     77e:	a891                	j	7d2 <memmove+0xb6>
  } else {
    dst += n;
     780:	fcc42783          	lw	a5,-52(s0)
     784:	fe843703          	ld	a4,-24(s0)
     788:	97ba                	add	a5,a5,a4
     78a:	fef43423          	sd	a5,-24(s0)
    src += n;
     78e:	fcc42783          	lw	a5,-52(s0)
     792:	fe043703          	ld	a4,-32(s0)
     796:	97ba                	add	a5,a5,a4
     798:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     79c:	a01d                	j	7c2 <memmove+0xa6>
      *--dst = *--src;
     79e:	fe043783          	ld	a5,-32(s0)
     7a2:	17fd                	addi	a5,a5,-1
     7a4:	fef43023          	sd	a5,-32(s0)
     7a8:	fe843783          	ld	a5,-24(s0)
     7ac:	17fd                	addi	a5,a5,-1
     7ae:	fef43423          	sd	a5,-24(s0)
     7b2:	fe043783          	ld	a5,-32(s0)
     7b6:	0007c703          	lbu	a4,0(a5)
     7ba:	fe843783          	ld	a5,-24(s0)
     7be:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     7c2:	fcc42783          	lw	a5,-52(s0)
     7c6:	fff7871b          	addiw	a4,a5,-1
     7ca:	fce42623          	sw	a4,-52(s0)
     7ce:	fcf048e3          	bgtz	a5,79e <memmove+0x82>
  }
  return vdst;
     7d2:	fd843783          	ld	a5,-40(s0)
}
     7d6:	853e                	mv	a0,a5
     7d8:	7462                	ld	s0,56(sp)
     7da:	6121                	addi	sp,sp,64
     7dc:	8082                	ret

00000000000007de <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     7de:	7139                	addi	sp,sp,-64
     7e0:	fc22                	sd	s0,56(sp)
     7e2:	0080                	addi	s0,sp,64
     7e4:	fca43c23          	sd	a0,-40(s0)
     7e8:	fcb43823          	sd	a1,-48(s0)
     7ec:	87b2                	mv	a5,a2
     7ee:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     7f2:	fd843783          	ld	a5,-40(s0)
     7f6:	fef43423          	sd	a5,-24(s0)
     7fa:	fd043783          	ld	a5,-48(s0)
     7fe:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     802:	a0a1                	j	84a <memcmp+0x6c>
    if (*p1 != *p2) {
     804:	fe843783          	ld	a5,-24(s0)
     808:	0007c703          	lbu	a4,0(a5)
     80c:	fe043783          	ld	a5,-32(s0)
     810:	0007c783          	lbu	a5,0(a5)
     814:	02f70163          	beq	a4,a5,836 <memcmp+0x58>
      return *p1 - *p2;
     818:	fe843783          	ld	a5,-24(s0)
     81c:	0007c783          	lbu	a5,0(a5)
     820:	0007871b          	sext.w	a4,a5
     824:	fe043783          	ld	a5,-32(s0)
     828:	0007c783          	lbu	a5,0(a5)
     82c:	2781                	sext.w	a5,a5
     82e:	40f707bb          	subw	a5,a4,a5
     832:	2781                	sext.w	a5,a5
     834:	a01d                	j	85a <memcmp+0x7c>
    }
    p1++;
     836:	fe843783          	ld	a5,-24(s0)
     83a:	0785                	addi	a5,a5,1
     83c:	fef43423          	sd	a5,-24(s0)
    p2++;
     840:	fe043783          	ld	a5,-32(s0)
     844:	0785                	addi	a5,a5,1
     846:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     84a:	fcc42783          	lw	a5,-52(s0)
     84e:	fff7871b          	addiw	a4,a5,-1
     852:	fce42623          	sw	a4,-52(s0)
     856:	f7dd                	bnez	a5,804 <memcmp+0x26>
  }
  return 0;
     858:	4781                	li	a5,0
}
     85a:	853e                	mv	a0,a5
     85c:	7462                	ld	s0,56(sp)
     85e:	6121                	addi	sp,sp,64
     860:	8082                	ret

0000000000000862 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     862:	7179                	addi	sp,sp,-48
     864:	f406                	sd	ra,40(sp)
     866:	f022                	sd	s0,32(sp)
     868:	1800                	addi	s0,sp,48
     86a:	fea43423          	sd	a0,-24(s0)
     86e:	feb43023          	sd	a1,-32(s0)
     872:	87b2                	mv	a5,a2
     874:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     878:	fdc42783          	lw	a5,-36(s0)
     87c:	863e                	mv	a2,a5
     87e:	fe043583          	ld	a1,-32(s0)
     882:	fe843503          	ld	a0,-24(s0)
     886:	00000097          	auipc	ra,0x0
     88a:	e96080e7          	jalr	-362(ra) # 71c <memmove>
     88e:	87aa                	mv	a5,a0
}
     890:	853e                	mv	a0,a5
     892:	70a2                	ld	ra,40(sp)
     894:	7402                	ld	s0,32(sp)
     896:	6145                	addi	sp,sp,48
     898:	8082                	ret

000000000000089a <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     89a:	4885                	li	a7,1
 ecall
     89c:	00000073          	ecall
 ret
     8a0:	8082                	ret

00000000000008a2 <exit>:
.global exit
exit:
 li a7, SYS_exit
     8a2:	4889                	li	a7,2
 ecall
     8a4:	00000073          	ecall
 ret
     8a8:	8082                	ret

00000000000008aa <wait>:
.global wait
wait:
 li a7, SYS_wait
     8aa:	488d                	li	a7,3
 ecall
     8ac:	00000073          	ecall
 ret
     8b0:	8082                	ret

00000000000008b2 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     8b2:	4891                	li	a7,4
 ecall
     8b4:	00000073          	ecall
 ret
     8b8:	8082                	ret

00000000000008ba <read>:
.global read
read:
 li a7, SYS_read
     8ba:	4895                	li	a7,5
 ecall
     8bc:	00000073          	ecall
 ret
     8c0:	8082                	ret

00000000000008c2 <write>:
.global write
write:
 li a7, SYS_write
     8c2:	48c1                	li	a7,16
 ecall
     8c4:	00000073          	ecall
 ret
     8c8:	8082                	ret

00000000000008ca <close>:
.global close
close:
 li a7, SYS_close
     8ca:	48d5                	li	a7,21
 ecall
     8cc:	00000073          	ecall
 ret
     8d0:	8082                	ret

00000000000008d2 <kill>:
.global kill
kill:
 li a7, SYS_kill
     8d2:	4899                	li	a7,6
 ecall
     8d4:	00000073          	ecall
 ret
     8d8:	8082                	ret

00000000000008da <exec>:
.global exec
exec:
 li a7, SYS_exec
     8da:	489d                	li	a7,7
 ecall
     8dc:	00000073          	ecall
 ret
     8e0:	8082                	ret

00000000000008e2 <open>:
.global open
open:
 li a7, SYS_open
     8e2:	48bd                	li	a7,15
 ecall
     8e4:	00000073          	ecall
 ret
     8e8:	8082                	ret

00000000000008ea <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     8ea:	48c5                	li	a7,17
 ecall
     8ec:	00000073          	ecall
 ret
     8f0:	8082                	ret

00000000000008f2 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     8f2:	48c9                	li	a7,18
 ecall
     8f4:	00000073          	ecall
 ret
     8f8:	8082                	ret

00000000000008fa <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     8fa:	48a1                	li	a7,8
 ecall
     8fc:	00000073          	ecall
 ret
     900:	8082                	ret

0000000000000902 <link>:
.global link
link:
 li a7, SYS_link
     902:	48cd                	li	a7,19
 ecall
     904:	00000073          	ecall
 ret
     908:	8082                	ret

000000000000090a <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     90a:	48d1                	li	a7,20
 ecall
     90c:	00000073          	ecall
 ret
     910:	8082                	ret

0000000000000912 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     912:	48a5                	li	a7,9
 ecall
     914:	00000073          	ecall
 ret
     918:	8082                	ret

000000000000091a <dup>:
.global dup
dup:
 li a7, SYS_dup
     91a:	48a9                	li	a7,10
 ecall
     91c:	00000073          	ecall
 ret
     920:	8082                	ret

0000000000000922 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     922:	48ad                	li	a7,11
 ecall
     924:	00000073          	ecall
 ret
     928:	8082                	ret

000000000000092a <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     92a:	48b1                	li	a7,12
 ecall
     92c:	00000073          	ecall
 ret
     930:	8082                	ret

0000000000000932 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     932:	48b5                	li	a7,13
 ecall
     934:	00000073          	ecall
 ret
     938:	8082                	ret

000000000000093a <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     93a:	48b9                	li	a7,14
 ecall
     93c:	00000073          	ecall
 ret
     940:	8082                	ret

0000000000000942 <setSchedAlg>:
.global setSchedAlg
setSchedAlg:
 li a7, SYS_setSchedAlg
     942:	48d9                	li	a7,22
 ecall
     944:	00000073          	ecall
 ret
     948:	8082                	ret

000000000000094a <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     94a:	1101                	addi	sp,sp,-32
     94c:	ec06                	sd	ra,24(sp)
     94e:	e822                	sd	s0,16(sp)
     950:	1000                	addi	s0,sp,32
     952:	87aa                	mv	a5,a0
     954:	872e                	mv	a4,a1
     956:	fef42623          	sw	a5,-20(s0)
     95a:	87ba                	mv	a5,a4
     95c:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     960:	feb40713          	addi	a4,s0,-21
     964:	fec42783          	lw	a5,-20(s0)
     968:	4605                	li	a2,1
     96a:	85ba                	mv	a1,a4
     96c:	853e                	mv	a0,a5
     96e:	00000097          	auipc	ra,0x0
     972:	f54080e7          	jalr	-172(ra) # 8c2 <write>
}
     976:	0001                	nop
     978:	60e2                	ld	ra,24(sp)
     97a:	6442                	ld	s0,16(sp)
     97c:	6105                	addi	sp,sp,32
     97e:	8082                	ret

0000000000000980 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     980:	7139                	addi	sp,sp,-64
     982:	fc06                	sd	ra,56(sp)
     984:	f822                	sd	s0,48(sp)
     986:	0080                	addi	s0,sp,64
     988:	87aa                	mv	a5,a0
     98a:	8736                	mv	a4,a3
     98c:	fcf42623          	sw	a5,-52(s0)
     990:	87ae                	mv	a5,a1
     992:	fcf42423          	sw	a5,-56(s0)
     996:	87b2                	mv	a5,a2
     998:	fcf42223          	sw	a5,-60(s0)
     99c:	87ba                	mv	a5,a4
     99e:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     9a2:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     9a6:	fc042783          	lw	a5,-64(s0)
     9aa:	2781                	sext.w	a5,a5
     9ac:	c38d                	beqz	a5,9ce <printint+0x4e>
     9ae:	fc842783          	lw	a5,-56(s0)
     9b2:	2781                	sext.w	a5,a5
     9b4:	0007dd63          	bgez	a5,9ce <printint+0x4e>
    neg = 1;
     9b8:	4785                	li	a5,1
     9ba:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     9be:	fc842783          	lw	a5,-56(s0)
     9c2:	40f007bb          	negw	a5,a5
     9c6:	2781                	sext.w	a5,a5
     9c8:	fef42223          	sw	a5,-28(s0)
     9cc:	a029                	j	9d6 <printint+0x56>
  } else {
    x = xx;
     9ce:	fc842783          	lw	a5,-56(s0)
     9d2:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     9d6:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     9da:	fc442783          	lw	a5,-60(s0)
     9de:	fe442703          	lw	a4,-28(s0)
     9e2:	02f777bb          	remuw	a5,a4,a5
     9e6:	0007861b          	sext.w	a2,a5
     9ea:	fec42783          	lw	a5,-20(s0)
     9ee:	0017871b          	addiw	a4,a5,1
     9f2:	fee42623          	sw	a4,-20(s0)
     9f6:	00000697          	auipc	a3,0x0
     9fa:	77268693          	addi	a3,a3,1906 # 1168 <digits>
     9fe:	02061713          	slli	a4,a2,0x20
     a02:	9301                	srli	a4,a4,0x20
     a04:	9736                	add	a4,a4,a3
     a06:	00074703          	lbu	a4,0(a4)
     a0a:	ff040693          	addi	a3,s0,-16
     a0e:	97b6                	add	a5,a5,a3
     a10:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     a14:	fc442783          	lw	a5,-60(s0)
     a18:	fe442703          	lw	a4,-28(s0)
     a1c:	02f757bb          	divuw	a5,a4,a5
     a20:	fef42223          	sw	a5,-28(s0)
     a24:	fe442783          	lw	a5,-28(s0)
     a28:	2781                	sext.w	a5,a5
     a2a:	fbc5                	bnez	a5,9da <printint+0x5a>
  if(neg)
     a2c:	fe842783          	lw	a5,-24(s0)
     a30:	2781                	sext.w	a5,a5
     a32:	cf95                	beqz	a5,a6e <printint+0xee>
    buf[i++] = '-';
     a34:	fec42783          	lw	a5,-20(s0)
     a38:	0017871b          	addiw	a4,a5,1
     a3c:	fee42623          	sw	a4,-20(s0)
     a40:	ff040713          	addi	a4,s0,-16
     a44:	97ba                	add	a5,a5,a4
     a46:	02d00713          	li	a4,45
     a4a:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     a4e:	a005                	j	a6e <printint+0xee>
    putc(fd, buf[i]);
     a50:	fec42783          	lw	a5,-20(s0)
     a54:	ff040713          	addi	a4,s0,-16
     a58:	97ba                	add	a5,a5,a4
     a5a:	fe07c703          	lbu	a4,-32(a5)
     a5e:	fcc42783          	lw	a5,-52(s0)
     a62:	85ba                	mv	a1,a4
     a64:	853e                	mv	a0,a5
     a66:	00000097          	auipc	ra,0x0
     a6a:	ee4080e7          	jalr	-284(ra) # 94a <putc>
  while(--i >= 0)
     a6e:	fec42783          	lw	a5,-20(s0)
     a72:	37fd                	addiw	a5,a5,-1
     a74:	fef42623          	sw	a5,-20(s0)
     a78:	fec42783          	lw	a5,-20(s0)
     a7c:	2781                	sext.w	a5,a5
     a7e:	fc07d9e3          	bgez	a5,a50 <printint+0xd0>
}
     a82:	0001                	nop
     a84:	0001                	nop
     a86:	70e2                	ld	ra,56(sp)
     a88:	7442                	ld	s0,48(sp)
     a8a:	6121                	addi	sp,sp,64
     a8c:	8082                	ret

0000000000000a8e <printptr>:

static void
printptr(int fd, uint64 x) {
     a8e:	7179                	addi	sp,sp,-48
     a90:	f406                	sd	ra,40(sp)
     a92:	f022                	sd	s0,32(sp)
     a94:	1800                	addi	s0,sp,48
     a96:	87aa                	mv	a5,a0
     a98:	fcb43823          	sd	a1,-48(s0)
     a9c:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     aa0:	fdc42783          	lw	a5,-36(s0)
     aa4:	03000593          	li	a1,48
     aa8:	853e                	mv	a0,a5
     aaa:	00000097          	auipc	ra,0x0
     aae:	ea0080e7          	jalr	-352(ra) # 94a <putc>
  putc(fd, 'x');
     ab2:	fdc42783          	lw	a5,-36(s0)
     ab6:	07800593          	li	a1,120
     aba:	853e                	mv	a0,a5
     abc:	00000097          	auipc	ra,0x0
     ac0:	e8e080e7          	jalr	-370(ra) # 94a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     ac4:	fe042623          	sw	zero,-20(s0)
     ac8:	a82d                	j	b02 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     aca:	fd043783          	ld	a5,-48(s0)
     ace:	93f1                	srli	a5,a5,0x3c
     ad0:	00000717          	auipc	a4,0x0
     ad4:	69870713          	addi	a4,a4,1688 # 1168 <digits>
     ad8:	97ba                	add	a5,a5,a4
     ada:	0007c703          	lbu	a4,0(a5)
     ade:	fdc42783          	lw	a5,-36(s0)
     ae2:	85ba                	mv	a1,a4
     ae4:	853e                	mv	a0,a5
     ae6:	00000097          	auipc	ra,0x0
     aea:	e64080e7          	jalr	-412(ra) # 94a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     aee:	fec42783          	lw	a5,-20(s0)
     af2:	2785                	addiw	a5,a5,1
     af4:	fef42623          	sw	a5,-20(s0)
     af8:	fd043783          	ld	a5,-48(s0)
     afc:	0792                	slli	a5,a5,0x4
     afe:	fcf43823          	sd	a5,-48(s0)
     b02:	fec42783          	lw	a5,-20(s0)
     b06:	873e                	mv	a4,a5
     b08:	47bd                	li	a5,15
     b0a:	fce7f0e3          	bgeu	a5,a4,aca <printptr+0x3c>
}
     b0e:	0001                	nop
     b10:	0001                	nop
     b12:	70a2                	ld	ra,40(sp)
     b14:	7402                	ld	s0,32(sp)
     b16:	6145                	addi	sp,sp,48
     b18:	8082                	ret

0000000000000b1a <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     b1a:	715d                	addi	sp,sp,-80
     b1c:	e486                	sd	ra,72(sp)
     b1e:	e0a2                	sd	s0,64(sp)
     b20:	0880                	addi	s0,sp,80
     b22:	87aa                	mv	a5,a0
     b24:	fcb43023          	sd	a1,-64(s0)
     b28:	fac43c23          	sd	a2,-72(s0)
     b2c:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     b30:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     b34:	fe042223          	sw	zero,-28(s0)
     b38:	a42d                	j	d62 <vprintf+0x248>
    c = fmt[i] & 0xff;
     b3a:	fe442783          	lw	a5,-28(s0)
     b3e:	fc043703          	ld	a4,-64(s0)
     b42:	97ba                	add	a5,a5,a4
     b44:	0007c783          	lbu	a5,0(a5)
     b48:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     b4c:	fe042783          	lw	a5,-32(s0)
     b50:	2781                	sext.w	a5,a5
     b52:	eb9d                	bnez	a5,b88 <vprintf+0x6e>
      if(c == '%'){
     b54:	fdc42783          	lw	a5,-36(s0)
     b58:	0007871b          	sext.w	a4,a5
     b5c:	02500793          	li	a5,37
     b60:	00f71763          	bne	a4,a5,b6e <vprintf+0x54>
        state = '%';
     b64:	02500793          	li	a5,37
     b68:	fef42023          	sw	a5,-32(s0)
     b6c:	a2f5                	j	d58 <vprintf+0x23e>
      } else {
        putc(fd, c);
     b6e:	fdc42783          	lw	a5,-36(s0)
     b72:	0ff7f713          	andi	a4,a5,255
     b76:	fcc42783          	lw	a5,-52(s0)
     b7a:	85ba                	mv	a1,a4
     b7c:	853e                	mv	a0,a5
     b7e:	00000097          	auipc	ra,0x0
     b82:	dcc080e7          	jalr	-564(ra) # 94a <putc>
     b86:	aac9                	j	d58 <vprintf+0x23e>
      }
    } else if(state == '%'){
     b88:	fe042783          	lw	a5,-32(s0)
     b8c:	0007871b          	sext.w	a4,a5
     b90:	02500793          	li	a5,37
     b94:	1cf71263          	bne	a4,a5,d58 <vprintf+0x23e>
      if(c == 'd'){
     b98:	fdc42783          	lw	a5,-36(s0)
     b9c:	0007871b          	sext.w	a4,a5
     ba0:	06400793          	li	a5,100
     ba4:	02f71463          	bne	a4,a5,bcc <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     ba8:	fb843783          	ld	a5,-72(s0)
     bac:	00878713          	addi	a4,a5,8
     bb0:	fae43c23          	sd	a4,-72(s0)
     bb4:	4398                	lw	a4,0(a5)
     bb6:	fcc42783          	lw	a5,-52(s0)
     bba:	4685                	li	a3,1
     bbc:	4629                	li	a2,10
     bbe:	85ba                	mv	a1,a4
     bc0:	853e                	mv	a0,a5
     bc2:	00000097          	auipc	ra,0x0
     bc6:	dbe080e7          	jalr	-578(ra) # 980 <printint>
     bca:	a269                	j	d54 <vprintf+0x23a>
      } else if(c == 'l') {
     bcc:	fdc42783          	lw	a5,-36(s0)
     bd0:	0007871b          	sext.w	a4,a5
     bd4:	06c00793          	li	a5,108
     bd8:	02f71663          	bne	a4,a5,c04 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     bdc:	fb843783          	ld	a5,-72(s0)
     be0:	00878713          	addi	a4,a5,8
     be4:	fae43c23          	sd	a4,-72(s0)
     be8:	639c                	ld	a5,0(a5)
     bea:	0007871b          	sext.w	a4,a5
     bee:	fcc42783          	lw	a5,-52(s0)
     bf2:	4681                	li	a3,0
     bf4:	4629                	li	a2,10
     bf6:	85ba                	mv	a1,a4
     bf8:	853e                	mv	a0,a5
     bfa:	00000097          	auipc	ra,0x0
     bfe:	d86080e7          	jalr	-634(ra) # 980 <printint>
     c02:	aa89                	j	d54 <vprintf+0x23a>
      } else if(c == 'x') {
     c04:	fdc42783          	lw	a5,-36(s0)
     c08:	0007871b          	sext.w	a4,a5
     c0c:	07800793          	li	a5,120
     c10:	02f71463          	bne	a4,a5,c38 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     c14:	fb843783          	ld	a5,-72(s0)
     c18:	00878713          	addi	a4,a5,8
     c1c:	fae43c23          	sd	a4,-72(s0)
     c20:	4398                	lw	a4,0(a5)
     c22:	fcc42783          	lw	a5,-52(s0)
     c26:	4681                	li	a3,0
     c28:	4641                	li	a2,16
     c2a:	85ba                	mv	a1,a4
     c2c:	853e                	mv	a0,a5
     c2e:	00000097          	auipc	ra,0x0
     c32:	d52080e7          	jalr	-686(ra) # 980 <printint>
     c36:	aa39                	j	d54 <vprintf+0x23a>
      } else if(c == 'p') {
     c38:	fdc42783          	lw	a5,-36(s0)
     c3c:	0007871b          	sext.w	a4,a5
     c40:	07000793          	li	a5,112
     c44:	02f71263          	bne	a4,a5,c68 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     c48:	fb843783          	ld	a5,-72(s0)
     c4c:	00878713          	addi	a4,a5,8
     c50:	fae43c23          	sd	a4,-72(s0)
     c54:	6398                	ld	a4,0(a5)
     c56:	fcc42783          	lw	a5,-52(s0)
     c5a:	85ba                	mv	a1,a4
     c5c:	853e                	mv	a0,a5
     c5e:	00000097          	auipc	ra,0x0
     c62:	e30080e7          	jalr	-464(ra) # a8e <printptr>
     c66:	a0fd                	j	d54 <vprintf+0x23a>
      } else if(c == 's'){
     c68:	fdc42783          	lw	a5,-36(s0)
     c6c:	0007871b          	sext.w	a4,a5
     c70:	07300793          	li	a5,115
     c74:	04f71c63          	bne	a4,a5,ccc <vprintf+0x1b2>
        s = va_arg(ap, char*);
     c78:	fb843783          	ld	a5,-72(s0)
     c7c:	00878713          	addi	a4,a5,8
     c80:	fae43c23          	sd	a4,-72(s0)
     c84:	639c                	ld	a5,0(a5)
     c86:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     c8a:	fe843783          	ld	a5,-24(s0)
     c8e:	eb8d                	bnez	a5,cc0 <vprintf+0x1a6>
          s = "(null)";
     c90:	00000797          	auipc	a5,0x0
     c94:	4d078793          	addi	a5,a5,1232 # 1160 <malloc+0x196>
     c98:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     c9c:	a015                	j	cc0 <vprintf+0x1a6>
          putc(fd, *s);
     c9e:	fe843783          	ld	a5,-24(s0)
     ca2:	0007c703          	lbu	a4,0(a5)
     ca6:	fcc42783          	lw	a5,-52(s0)
     caa:	85ba                	mv	a1,a4
     cac:	853e                	mv	a0,a5
     cae:	00000097          	auipc	ra,0x0
     cb2:	c9c080e7          	jalr	-868(ra) # 94a <putc>
          s++;
     cb6:	fe843783          	ld	a5,-24(s0)
     cba:	0785                	addi	a5,a5,1
     cbc:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     cc0:	fe843783          	ld	a5,-24(s0)
     cc4:	0007c783          	lbu	a5,0(a5)
     cc8:	fbf9                	bnez	a5,c9e <vprintf+0x184>
     cca:	a069                	j	d54 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     ccc:	fdc42783          	lw	a5,-36(s0)
     cd0:	0007871b          	sext.w	a4,a5
     cd4:	06300793          	li	a5,99
     cd8:	02f71463          	bne	a4,a5,d00 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     cdc:	fb843783          	ld	a5,-72(s0)
     ce0:	00878713          	addi	a4,a5,8
     ce4:	fae43c23          	sd	a4,-72(s0)
     ce8:	439c                	lw	a5,0(a5)
     cea:	0ff7f713          	andi	a4,a5,255
     cee:	fcc42783          	lw	a5,-52(s0)
     cf2:	85ba                	mv	a1,a4
     cf4:	853e                	mv	a0,a5
     cf6:	00000097          	auipc	ra,0x0
     cfa:	c54080e7          	jalr	-940(ra) # 94a <putc>
     cfe:	a899                	j	d54 <vprintf+0x23a>
      } else if(c == '%'){
     d00:	fdc42783          	lw	a5,-36(s0)
     d04:	0007871b          	sext.w	a4,a5
     d08:	02500793          	li	a5,37
     d0c:	00f71f63          	bne	a4,a5,d2a <vprintf+0x210>
        putc(fd, c);
     d10:	fdc42783          	lw	a5,-36(s0)
     d14:	0ff7f713          	andi	a4,a5,255
     d18:	fcc42783          	lw	a5,-52(s0)
     d1c:	85ba                	mv	a1,a4
     d1e:	853e                	mv	a0,a5
     d20:	00000097          	auipc	ra,0x0
     d24:	c2a080e7          	jalr	-982(ra) # 94a <putc>
     d28:	a035                	j	d54 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     d2a:	fcc42783          	lw	a5,-52(s0)
     d2e:	02500593          	li	a1,37
     d32:	853e                	mv	a0,a5
     d34:	00000097          	auipc	ra,0x0
     d38:	c16080e7          	jalr	-1002(ra) # 94a <putc>
        putc(fd, c);
     d3c:	fdc42783          	lw	a5,-36(s0)
     d40:	0ff7f713          	andi	a4,a5,255
     d44:	fcc42783          	lw	a5,-52(s0)
     d48:	85ba                	mv	a1,a4
     d4a:	853e                	mv	a0,a5
     d4c:	00000097          	auipc	ra,0x0
     d50:	bfe080e7          	jalr	-1026(ra) # 94a <putc>
      }
      state = 0;
     d54:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     d58:	fe442783          	lw	a5,-28(s0)
     d5c:	2785                	addiw	a5,a5,1
     d5e:	fef42223          	sw	a5,-28(s0)
     d62:	fe442783          	lw	a5,-28(s0)
     d66:	fc043703          	ld	a4,-64(s0)
     d6a:	97ba                	add	a5,a5,a4
     d6c:	0007c783          	lbu	a5,0(a5)
     d70:	dc0795e3          	bnez	a5,b3a <vprintf+0x20>
    }
  }
}
     d74:	0001                	nop
     d76:	0001                	nop
     d78:	60a6                	ld	ra,72(sp)
     d7a:	6406                	ld	s0,64(sp)
     d7c:	6161                	addi	sp,sp,80
     d7e:	8082                	ret

0000000000000d80 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     d80:	7159                	addi	sp,sp,-112
     d82:	fc06                	sd	ra,56(sp)
     d84:	f822                	sd	s0,48(sp)
     d86:	0080                	addi	s0,sp,64
     d88:	fcb43823          	sd	a1,-48(s0)
     d8c:	e010                	sd	a2,0(s0)
     d8e:	e414                	sd	a3,8(s0)
     d90:	e818                	sd	a4,16(s0)
     d92:	ec1c                	sd	a5,24(s0)
     d94:	03043023          	sd	a6,32(s0)
     d98:	03143423          	sd	a7,40(s0)
     d9c:	87aa                	mv	a5,a0
     d9e:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     da2:	03040793          	addi	a5,s0,48
     da6:	fcf43423          	sd	a5,-56(s0)
     daa:	fc843783          	ld	a5,-56(s0)
     dae:	fd078793          	addi	a5,a5,-48
     db2:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     db6:	fe843703          	ld	a4,-24(s0)
     dba:	fdc42783          	lw	a5,-36(s0)
     dbe:	863a                	mv	a2,a4
     dc0:	fd043583          	ld	a1,-48(s0)
     dc4:	853e                	mv	a0,a5
     dc6:	00000097          	auipc	ra,0x0
     dca:	d54080e7          	jalr	-684(ra) # b1a <vprintf>
}
     dce:	0001                	nop
     dd0:	70e2                	ld	ra,56(sp)
     dd2:	7442                	ld	s0,48(sp)
     dd4:	6165                	addi	sp,sp,112
     dd6:	8082                	ret

0000000000000dd8 <printf>:

void
printf(const char *fmt, ...)
{
     dd8:	7159                	addi	sp,sp,-112
     dda:	f406                	sd	ra,40(sp)
     ddc:	f022                	sd	s0,32(sp)
     dde:	1800                	addi	s0,sp,48
     de0:	fca43c23          	sd	a0,-40(s0)
     de4:	e40c                	sd	a1,8(s0)
     de6:	e810                	sd	a2,16(s0)
     de8:	ec14                	sd	a3,24(s0)
     dea:	f018                	sd	a4,32(s0)
     dec:	f41c                	sd	a5,40(s0)
     dee:	03043823          	sd	a6,48(s0)
     df2:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     df6:	04040793          	addi	a5,s0,64
     dfa:	fcf43823          	sd	a5,-48(s0)
     dfe:	fd043783          	ld	a5,-48(s0)
     e02:	fc878793          	addi	a5,a5,-56
     e06:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     e0a:	fe843783          	ld	a5,-24(s0)
     e0e:	863e                	mv	a2,a5
     e10:	fd843583          	ld	a1,-40(s0)
     e14:	4505                	li	a0,1
     e16:	00000097          	auipc	ra,0x0
     e1a:	d04080e7          	jalr	-764(ra) # b1a <vprintf>
}
     e1e:	0001                	nop
     e20:	70a2                	ld	ra,40(sp)
     e22:	7402                	ld	s0,32(sp)
     e24:	6165                	addi	sp,sp,112
     e26:	8082                	ret

0000000000000e28 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     e28:	7179                	addi	sp,sp,-48
     e2a:	f422                	sd	s0,40(sp)
     e2c:	1800                	addi	s0,sp,48
     e2e:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     e32:	fd843783          	ld	a5,-40(s0)
     e36:	17c1                	addi	a5,a5,-16
     e38:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e3c:	00000797          	auipc	a5,0x0
     e40:	35c78793          	addi	a5,a5,860 # 1198 <freep>
     e44:	639c                	ld	a5,0(a5)
     e46:	fef43423          	sd	a5,-24(s0)
     e4a:	a815                	j	e7e <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     e4c:	fe843783          	ld	a5,-24(s0)
     e50:	639c                	ld	a5,0(a5)
     e52:	fe843703          	ld	a4,-24(s0)
     e56:	00f76f63          	bltu	a4,a5,e74 <free+0x4c>
     e5a:	fe043703          	ld	a4,-32(s0)
     e5e:	fe843783          	ld	a5,-24(s0)
     e62:	02e7eb63          	bltu	a5,a4,e98 <free+0x70>
     e66:	fe843783          	ld	a5,-24(s0)
     e6a:	639c                	ld	a5,0(a5)
     e6c:	fe043703          	ld	a4,-32(s0)
     e70:	02f76463          	bltu	a4,a5,e98 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e74:	fe843783          	ld	a5,-24(s0)
     e78:	639c                	ld	a5,0(a5)
     e7a:	fef43423          	sd	a5,-24(s0)
     e7e:	fe043703          	ld	a4,-32(s0)
     e82:	fe843783          	ld	a5,-24(s0)
     e86:	fce7f3e3          	bgeu	a5,a4,e4c <free+0x24>
     e8a:	fe843783          	ld	a5,-24(s0)
     e8e:	639c                	ld	a5,0(a5)
     e90:	fe043703          	ld	a4,-32(s0)
     e94:	faf77ce3          	bgeu	a4,a5,e4c <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     e98:	fe043783          	ld	a5,-32(s0)
     e9c:	479c                	lw	a5,8(a5)
     e9e:	1782                	slli	a5,a5,0x20
     ea0:	9381                	srli	a5,a5,0x20
     ea2:	0792                	slli	a5,a5,0x4
     ea4:	fe043703          	ld	a4,-32(s0)
     ea8:	973e                	add	a4,a4,a5
     eaa:	fe843783          	ld	a5,-24(s0)
     eae:	639c                	ld	a5,0(a5)
     eb0:	02f71763          	bne	a4,a5,ede <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     eb4:	fe043783          	ld	a5,-32(s0)
     eb8:	4798                	lw	a4,8(a5)
     eba:	fe843783          	ld	a5,-24(s0)
     ebe:	639c                	ld	a5,0(a5)
     ec0:	479c                	lw	a5,8(a5)
     ec2:	9fb9                	addw	a5,a5,a4
     ec4:	0007871b          	sext.w	a4,a5
     ec8:	fe043783          	ld	a5,-32(s0)
     ecc:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     ece:	fe843783          	ld	a5,-24(s0)
     ed2:	639c                	ld	a5,0(a5)
     ed4:	6398                	ld	a4,0(a5)
     ed6:	fe043783          	ld	a5,-32(s0)
     eda:	e398                	sd	a4,0(a5)
     edc:	a039                	j	eea <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     ede:	fe843783          	ld	a5,-24(s0)
     ee2:	6398                	ld	a4,0(a5)
     ee4:	fe043783          	ld	a5,-32(s0)
     ee8:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     eea:	fe843783          	ld	a5,-24(s0)
     eee:	479c                	lw	a5,8(a5)
     ef0:	1782                	slli	a5,a5,0x20
     ef2:	9381                	srli	a5,a5,0x20
     ef4:	0792                	slli	a5,a5,0x4
     ef6:	fe843703          	ld	a4,-24(s0)
     efa:	97ba                	add	a5,a5,a4
     efc:	fe043703          	ld	a4,-32(s0)
     f00:	02f71563          	bne	a4,a5,f2a <free+0x102>
    p->s.size += bp->s.size;
     f04:	fe843783          	ld	a5,-24(s0)
     f08:	4798                	lw	a4,8(a5)
     f0a:	fe043783          	ld	a5,-32(s0)
     f0e:	479c                	lw	a5,8(a5)
     f10:	9fb9                	addw	a5,a5,a4
     f12:	0007871b          	sext.w	a4,a5
     f16:	fe843783          	ld	a5,-24(s0)
     f1a:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     f1c:	fe043783          	ld	a5,-32(s0)
     f20:	6398                	ld	a4,0(a5)
     f22:	fe843783          	ld	a5,-24(s0)
     f26:	e398                	sd	a4,0(a5)
     f28:	a031                	j	f34 <free+0x10c>
  } else
    p->s.ptr = bp;
     f2a:	fe843783          	ld	a5,-24(s0)
     f2e:	fe043703          	ld	a4,-32(s0)
     f32:	e398                	sd	a4,0(a5)
  freep = p;
     f34:	00000797          	auipc	a5,0x0
     f38:	26478793          	addi	a5,a5,612 # 1198 <freep>
     f3c:	fe843703          	ld	a4,-24(s0)
     f40:	e398                	sd	a4,0(a5)
}
     f42:	0001                	nop
     f44:	7422                	ld	s0,40(sp)
     f46:	6145                	addi	sp,sp,48
     f48:	8082                	ret

0000000000000f4a <morecore>:

static Header*
morecore(uint nu)
{
     f4a:	7179                	addi	sp,sp,-48
     f4c:	f406                	sd	ra,40(sp)
     f4e:	f022                	sd	s0,32(sp)
     f50:	1800                	addi	s0,sp,48
     f52:	87aa                	mv	a5,a0
     f54:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     f58:	fdc42783          	lw	a5,-36(s0)
     f5c:	0007871b          	sext.w	a4,a5
     f60:	6785                	lui	a5,0x1
     f62:	00f77563          	bgeu	a4,a5,f6c <morecore+0x22>
    nu = 4096;
     f66:	6785                	lui	a5,0x1
     f68:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     f6c:	fdc42783          	lw	a5,-36(s0)
     f70:	0047979b          	slliw	a5,a5,0x4
     f74:	2781                	sext.w	a5,a5
     f76:	2781                	sext.w	a5,a5
     f78:	853e                	mv	a0,a5
     f7a:	00000097          	auipc	ra,0x0
     f7e:	9b0080e7          	jalr	-1616(ra) # 92a <sbrk>
     f82:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     f86:	fe843703          	ld	a4,-24(s0)
     f8a:	57fd                	li	a5,-1
     f8c:	00f71463          	bne	a4,a5,f94 <morecore+0x4a>
    return 0;
     f90:	4781                	li	a5,0
     f92:	a03d                	j	fc0 <morecore+0x76>
  hp = (Header*)p;
     f94:	fe843783          	ld	a5,-24(s0)
     f98:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     f9c:	fe043783          	ld	a5,-32(s0)
     fa0:	fdc42703          	lw	a4,-36(s0)
     fa4:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     fa6:	fe043783          	ld	a5,-32(s0)
     faa:	07c1                	addi	a5,a5,16
     fac:	853e                	mv	a0,a5
     fae:	00000097          	auipc	ra,0x0
     fb2:	e7a080e7          	jalr	-390(ra) # e28 <free>
  return freep;
     fb6:	00000797          	auipc	a5,0x0
     fba:	1e278793          	addi	a5,a5,482 # 1198 <freep>
     fbe:	639c                	ld	a5,0(a5)
}
     fc0:	853e                	mv	a0,a5
     fc2:	70a2                	ld	ra,40(sp)
     fc4:	7402                	ld	s0,32(sp)
     fc6:	6145                	addi	sp,sp,48
     fc8:	8082                	ret

0000000000000fca <malloc>:

void*
malloc(uint nbytes)
{
     fca:	7139                	addi	sp,sp,-64
     fcc:	fc06                	sd	ra,56(sp)
     fce:	f822                	sd	s0,48(sp)
     fd0:	0080                	addi	s0,sp,64
     fd2:	87aa                	mv	a5,a0
     fd4:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     fd8:	fcc46783          	lwu	a5,-52(s0)
     fdc:	07bd                	addi	a5,a5,15
     fde:	8391                	srli	a5,a5,0x4
     fe0:	2781                	sext.w	a5,a5
     fe2:	2785                	addiw	a5,a5,1
     fe4:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     fe8:	00000797          	auipc	a5,0x0
     fec:	1b078793          	addi	a5,a5,432 # 1198 <freep>
     ff0:	639c                	ld	a5,0(a5)
     ff2:	fef43023          	sd	a5,-32(s0)
     ff6:	fe043783          	ld	a5,-32(s0)
     ffa:	ef95                	bnez	a5,1036 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     ffc:	00000797          	auipc	a5,0x0
    1000:	18c78793          	addi	a5,a5,396 # 1188 <base>
    1004:	fef43023          	sd	a5,-32(s0)
    1008:	00000797          	auipc	a5,0x0
    100c:	19078793          	addi	a5,a5,400 # 1198 <freep>
    1010:	fe043703          	ld	a4,-32(s0)
    1014:	e398                	sd	a4,0(a5)
    1016:	00000797          	auipc	a5,0x0
    101a:	18278793          	addi	a5,a5,386 # 1198 <freep>
    101e:	6398                	ld	a4,0(a5)
    1020:	00000797          	auipc	a5,0x0
    1024:	16878793          	addi	a5,a5,360 # 1188 <base>
    1028:	e398                	sd	a4,0(a5)
    base.s.size = 0;
    102a:	00000797          	auipc	a5,0x0
    102e:	15e78793          	addi	a5,a5,350 # 1188 <base>
    1032:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1036:	fe043783          	ld	a5,-32(s0)
    103a:	639c                	ld	a5,0(a5)
    103c:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    1040:	fe843783          	ld	a5,-24(s0)
    1044:	4798                	lw	a4,8(a5)
    1046:	fdc42783          	lw	a5,-36(s0)
    104a:	2781                	sext.w	a5,a5
    104c:	06f76863          	bltu	a4,a5,10bc <malloc+0xf2>
      if(p->s.size == nunits)
    1050:	fe843783          	ld	a5,-24(s0)
    1054:	4798                	lw	a4,8(a5)
    1056:	fdc42783          	lw	a5,-36(s0)
    105a:	2781                	sext.w	a5,a5
    105c:	00e79963          	bne	a5,a4,106e <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
    1060:	fe843783          	ld	a5,-24(s0)
    1064:	6398                	ld	a4,0(a5)
    1066:	fe043783          	ld	a5,-32(s0)
    106a:	e398                	sd	a4,0(a5)
    106c:	a82d                	j	10a6 <malloc+0xdc>
      else {
        p->s.size -= nunits;
    106e:	fe843783          	ld	a5,-24(s0)
    1072:	4798                	lw	a4,8(a5)
    1074:	fdc42783          	lw	a5,-36(s0)
    1078:	40f707bb          	subw	a5,a4,a5
    107c:	0007871b          	sext.w	a4,a5
    1080:	fe843783          	ld	a5,-24(s0)
    1084:	c798                	sw	a4,8(a5)
        p += p->s.size;
    1086:	fe843783          	ld	a5,-24(s0)
    108a:	479c                	lw	a5,8(a5)
    108c:	1782                	slli	a5,a5,0x20
    108e:	9381                	srli	a5,a5,0x20
    1090:	0792                	slli	a5,a5,0x4
    1092:	fe843703          	ld	a4,-24(s0)
    1096:	97ba                	add	a5,a5,a4
    1098:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    109c:	fe843783          	ld	a5,-24(s0)
    10a0:	fdc42703          	lw	a4,-36(s0)
    10a4:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    10a6:	00000797          	auipc	a5,0x0
    10aa:	0f278793          	addi	a5,a5,242 # 1198 <freep>
    10ae:	fe043703          	ld	a4,-32(s0)
    10b2:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    10b4:	fe843783          	ld	a5,-24(s0)
    10b8:	07c1                	addi	a5,a5,16
    10ba:	a091                	j	10fe <malloc+0x134>
    }
    if(p == freep)
    10bc:	00000797          	auipc	a5,0x0
    10c0:	0dc78793          	addi	a5,a5,220 # 1198 <freep>
    10c4:	639c                	ld	a5,0(a5)
    10c6:	fe843703          	ld	a4,-24(s0)
    10ca:	02f71063          	bne	a4,a5,10ea <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    10ce:	fdc42783          	lw	a5,-36(s0)
    10d2:	853e                	mv	a0,a5
    10d4:	00000097          	auipc	ra,0x0
    10d8:	e76080e7          	jalr	-394(ra) # f4a <morecore>
    10dc:	fea43423          	sd	a0,-24(s0)
    10e0:	fe843783          	ld	a5,-24(s0)
    10e4:	e399                	bnez	a5,10ea <malloc+0x120>
        return 0;
    10e6:	4781                	li	a5,0
    10e8:	a819                	j	10fe <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10ea:	fe843783          	ld	a5,-24(s0)
    10ee:	fef43023          	sd	a5,-32(s0)
    10f2:	fe843783          	ld	a5,-24(s0)
    10f6:	639c                	ld	a5,0(a5)
    10f8:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    10fc:	b791                	j	1040 <malloc+0x76>
  }
}
    10fe:	853e                	mv	a0,a5
    1100:	70e2                	ld	ra,56(sp)
    1102:	7442                	ld	s0,48(sp)
    1104:	6121                	addi	sp,sp,64
    1106:	8082                	ret
