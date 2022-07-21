
user/_stressfs:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/fs.h"
#include "kernel/fcntl.h"

int
main(int argc, char *argv[])
{
   0:	dc010113          	addi	sp,sp,-576
   4:	22113c23          	sd	ra,568(sp)
   8:	22813823          	sd	s0,560(sp)
   c:	0480                	addi	s0,sp,576
   e:	87aa                	mv	a5,a0
  10:	dcb43023          	sd	a1,-576(s0)
  14:	dcf42623          	sw	a5,-564(s0)
  int fd, i;
  char path[] = "stressfs0";
  18:	00001797          	auipc	a5,0x1
  1c:	e9878793          	addi	a5,a5,-360 # eb0 <malloc+0x16e>
  20:	6398                	ld	a4,0(a5)
  22:	fce43c23          	sd	a4,-40(s0)
  26:	0087d783          	lhu	a5,8(a5)
  2a:	fef41023          	sh	a5,-32(s0)
  char data[512];

  printf("stressfs starting\n");
  2e:	00001517          	auipc	a0,0x1
  32:	e5250513          	addi	a0,a0,-430 # e80 <malloc+0x13e>
  36:	00001097          	auipc	ra,0x1
  3a:	b1a080e7          	jalr	-1254(ra) # b50 <printf>
  memset(data, 'a', sizeof(data));
  3e:	dd840793          	addi	a5,s0,-552
  42:	20000613          	li	a2,512
  46:	06100593          	li	a1,97
  4a:	853e                	mv	a0,a5
  4c:	00000097          	auipc	ra,0x0
  50:	224080e7          	jalr	548(ra) # 270 <memset>

  for(i = 0; i < 4; i++)
  54:	fe042623          	sw	zero,-20(s0)
  58:	a829                	j	72 <main+0x72>
    if(fork() > 0)
  5a:	00000097          	auipc	ra,0x0
  5e:	5b8080e7          	jalr	1464(ra) # 612 <fork>
  62:	87aa                	mv	a5,a0
  64:	00f04f63          	bgtz	a5,82 <main+0x82>
  for(i = 0; i < 4; i++)
  68:	fec42783          	lw	a5,-20(s0)
  6c:	2785                	addiw	a5,a5,1
  6e:	fef42623          	sw	a5,-20(s0)
  72:	fec42783          	lw	a5,-20(s0)
  76:	0007871b          	sext.w	a4,a5
  7a:	478d                	li	a5,3
  7c:	fce7dfe3          	bge	a5,a4,5a <main+0x5a>
  80:	a011                	j	84 <main+0x84>
      break;
  82:	0001                	nop

  printf("write %d\n", i);
  84:	fec42783          	lw	a5,-20(s0)
  88:	85be                	mv	a1,a5
  8a:	00001517          	auipc	a0,0x1
  8e:	e0e50513          	addi	a0,a0,-498 # e98 <malloc+0x156>
  92:	00001097          	auipc	ra,0x1
  96:	abe080e7          	jalr	-1346(ra) # b50 <printf>

  path[8] += i;
  9a:	fe044703          	lbu	a4,-32(s0)
  9e:	fec42783          	lw	a5,-20(s0)
  a2:	0ff7f793          	andi	a5,a5,255
  a6:	9fb9                	addw	a5,a5,a4
  a8:	0ff7f793          	andi	a5,a5,255
  ac:	fef40023          	sb	a5,-32(s0)
  fd = open(path, O_CREATE | O_RDWR);
  b0:	fd840793          	addi	a5,s0,-40
  b4:	20200593          	li	a1,514
  b8:	853e                	mv	a0,a5
  ba:	00000097          	auipc	ra,0x0
  be:	5a0080e7          	jalr	1440(ra) # 65a <open>
  c2:	87aa                	mv	a5,a0
  c4:	fef42423          	sw	a5,-24(s0)
  for(i = 0; i < 20; i++)
  c8:	fe042623          	sw	zero,-20(s0)
  cc:	a015                	j	f0 <main+0xf0>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  ce:	dd840713          	addi	a4,s0,-552
  d2:	fe842783          	lw	a5,-24(s0)
  d6:	20000613          	li	a2,512
  da:	85ba                	mv	a1,a4
  dc:	853e                	mv	a0,a5
  de:	00000097          	auipc	ra,0x0
  e2:	55c080e7          	jalr	1372(ra) # 63a <write>
  for(i = 0; i < 20; i++)
  e6:	fec42783          	lw	a5,-20(s0)
  ea:	2785                	addiw	a5,a5,1
  ec:	fef42623          	sw	a5,-20(s0)
  f0:	fec42783          	lw	a5,-20(s0)
  f4:	0007871b          	sext.w	a4,a5
  f8:	47cd                	li	a5,19
  fa:	fce7dae3          	bge	a5,a4,ce <main+0xce>
  close(fd);
  fe:	fe842783          	lw	a5,-24(s0)
 102:	853e                	mv	a0,a5
 104:	00000097          	auipc	ra,0x0
 108:	53e080e7          	jalr	1342(ra) # 642 <close>

  printf("read\n");
 10c:	00001517          	auipc	a0,0x1
 110:	d9c50513          	addi	a0,a0,-612 # ea8 <malloc+0x166>
 114:	00001097          	auipc	ra,0x1
 118:	a3c080e7          	jalr	-1476(ra) # b50 <printf>

  fd = open(path, O_RDONLY);
 11c:	fd840793          	addi	a5,s0,-40
 120:	4581                	li	a1,0
 122:	853e                	mv	a0,a5
 124:	00000097          	auipc	ra,0x0
 128:	536080e7          	jalr	1334(ra) # 65a <open>
 12c:	87aa                	mv	a5,a0
 12e:	fef42423          	sw	a5,-24(s0)
  for (i = 0; i < 20; i++)
 132:	fe042623          	sw	zero,-20(s0)
 136:	a015                	j	15a <main+0x15a>
    read(fd, data, sizeof(data));
 138:	dd840713          	addi	a4,s0,-552
 13c:	fe842783          	lw	a5,-24(s0)
 140:	20000613          	li	a2,512
 144:	85ba                	mv	a1,a4
 146:	853e                	mv	a0,a5
 148:	00000097          	auipc	ra,0x0
 14c:	4ea080e7          	jalr	1258(ra) # 632 <read>
  for (i = 0; i < 20; i++)
 150:	fec42783          	lw	a5,-20(s0)
 154:	2785                	addiw	a5,a5,1
 156:	fef42623          	sw	a5,-20(s0)
 15a:	fec42783          	lw	a5,-20(s0)
 15e:	0007871b          	sext.w	a4,a5
 162:	47cd                	li	a5,19
 164:	fce7dae3          	bge	a5,a4,138 <main+0x138>
  close(fd);
 168:	fe842783          	lw	a5,-24(s0)
 16c:	853e                	mv	a0,a5
 16e:	00000097          	auipc	ra,0x0
 172:	4d4080e7          	jalr	1236(ra) # 642 <close>

  wait(0);
 176:	4501                	li	a0,0
 178:	00000097          	auipc	ra,0x0
 17c:	4aa080e7          	jalr	1194(ra) # 622 <wait>

  exit(0);
 180:	4501                	li	a0,0
 182:	00000097          	auipc	ra,0x0
 186:	498080e7          	jalr	1176(ra) # 61a <exit>

000000000000018a <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 18a:	7179                	addi	sp,sp,-48
 18c:	f422                	sd	s0,40(sp)
 18e:	1800                	addi	s0,sp,48
 190:	fca43c23          	sd	a0,-40(s0)
 194:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
 198:	fd843783          	ld	a5,-40(s0)
 19c:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
 1a0:	0001                	nop
 1a2:	fd043703          	ld	a4,-48(s0)
 1a6:	00170793          	addi	a5,a4,1
 1aa:	fcf43823          	sd	a5,-48(s0)
 1ae:	fd843783          	ld	a5,-40(s0)
 1b2:	00178693          	addi	a3,a5,1
 1b6:	fcd43c23          	sd	a3,-40(s0)
 1ba:	00074703          	lbu	a4,0(a4)
 1be:	00e78023          	sb	a4,0(a5)
 1c2:	0007c783          	lbu	a5,0(a5)
 1c6:	fff1                	bnez	a5,1a2 <strcpy+0x18>
    ;
  return os;
 1c8:	fe843783          	ld	a5,-24(s0)
}
 1cc:	853e                	mv	a0,a5
 1ce:	7422                	ld	s0,40(sp)
 1d0:	6145                	addi	sp,sp,48
 1d2:	8082                	ret

00000000000001d4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1d4:	1101                	addi	sp,sp,-32
 1d6:	ec22                	sd	s0,24(sp)
 1d8:	1000                	addi	s0,sp,32
 1da:	fea43423          	sd	a0,-24(s0)
 1de:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
 1e2:	a819                	j	1f8 <strcmp+0x24>
    p++, q++;
 1e4:	fe843783          	ld	a5,-24(s0)
 1e8:	0785                	addi	a5,a5,1
 1ea:	fef43423          	sd	a5,-24(s0)
 1ee:	fe043783          	ld	a5,-32(s0)
 1f2:	0785                	addi	a5,a5,1
 1f4:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
 1f8:	fe843783          	ld	a5,-24(s0)
 1fc:	0007c783          	lbu	a5,0(a5)
 200:	cb99                	beqz	a5,216 <strcmp+0x42>
 202:	fe843783          	ld	a5,-24(s0)
 206:	0007c703          	lbu	a4,0(a5)
 20a:	fe043783          	ld	a5,-32(s0)
 20e:	0007c783          	lbu	a5,0(a5)
 212:	fcf709e3          	beq	a4,a5,1e4 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
 216:	fe843783          	ld	a5,-24(s0)
 21a:	0007c783          	lbu	a5,0(a5)
 21e:	0007871b          	sext.w	a4,a5
 222:	fe043783          	ld	a5,-32(s0)
 226:	0007c783          	lbu	a5,0(a5)
 22a:	2781                	sext.w	a5,a5
 22c:	40f707bb          	subw	a5,a4,a5
 230:	2781                	sext.w	a5,a5
}
 232:	853e                	mv	a0,a5
 234:	6462                	ld	s0,24(sp)
 236:	6105                	addi	sp,sp,32
 238:	8082                	ret

000000000000023a <strlen>:

uint
strlen(const char *s)
{
 23a:	7179                	addi	sp,sp,-48
 23c:	f422                	sd	s0,40(sp)
 23e:	1800                	addi	s0,sp,48
 240:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
 244:	fe042623          	sw	zero,-20(s0)
 248:	a031                	j	254 <strlen+0x1a>
 24a:	fec42783          	lw	a5,-20(s0)
 24e:	2785                	addiw	a5,a5,1
 250:	fef42623          	sw	a5,-20(s0)
 254:	fec42783          	lw	a5,-20(s0)
 258:	fd843703          	ld	a4,-40(s0)
 25c:	97ba                	add	a5,a5,a4
 25e:	0007c783          	lbu	a5,0(a5)
 262:	f7e5                	bnez	a5,24a <strlen+0x10>
    ;
  return n;
 264:	fec42783          	lw	a5,-20(s0)
}
 268:	853e                	mv	a0,a5
 26a:	7422                	ld	s0,40(sp)
 26c:	6145                	addi	sp,sp,48
 26e:	8082                	ret

0000000000000270 <memset>:

void*
memset(void *dst, int c, uint n)
{
 270:	7179                	addi	sp,sp,-48
 272:	f422                	sd	s0,40(sp)
 274:	1800                	addi	s0,sp,48
 276:	fca43c23          	sd	a0,-40(s0)
 27a:	87ae                	mv	a5,a1
 27c:	8732                	mv	a4,a2
 27e:	fcf42a23          	sw	a5,-44(s0)
 282:	87ba                	mv	a5,a4
 284:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 288:	fd843783          	ld	a5,-40(s0)
 28c:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 290:	fe042623          	sw	zero,-20(s0)
 294:	a00d                	j	2b6 <memset+0x46>
    cdst[i] = c;
 296:	fec42783          	lw	a5,-20(s0)
 29a:	fe043703          	ld	a4,-32(s0)
 29e:	97ba                	add	a5,a5,a4
 2a0:	fd442703          	lw	a4,-44(s0)
 2a4:	0ff77713          	andi	a4,a4,255
 2a8:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 2ac:	fec42783          	lw	a5,-20(s0)
 2b0:	2785                	addiw	a5,a5,1
 2b2:	fef42623          	sw	a5,-20(s0)
 2b6:	fec42703          	lw	a4,-20(s0)
 2ba:	fd042783          	lw	a5,-48(s0)
 2be:	2781                	sext.w	a5,a5
 2c0:	fcf76be3          	bltu	a4,a5,296 <memset+0x26>
  }
  return dst;
 2c4:	fd843783          	ld	a5,-40(s0)
}
 2c8:	853e                	mv	a0,a5
 2ca:	7422                	ld	s0,40(sp)
 2cc:	6145                	addi	sp,sp,48
 2ce:	8082                	ret

00000000000002d0 <strchr>:

char*
strchr(const char *s, char c)
{
 2d0:	1101                	addi	sp,sp,-32
 2d2:	ec22                	sd	s0,24(sp)
 2d4:	1000                	addi	s0,sp,32
 2d6:	fea43423          	sd	a0,-24(s0)
 2da:	87ae                	mv	a5,a1
 2dc:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 2e0:	a01d                	j	306 <strchr+0x36>
    if(*s == c)
 2e2:	fe843783          	ld	a5,-24(s0)
 2e6:	0007c703          	lbu	a4,0(a5)
 2ea:	fe744783          	lbu	a5,-25(s0)
 2ee:	0ff7f793          	andi	a5,a5,255
 2f2:	00e79563          	bne	a5,a4,2fc <strchr+0x2c>
      return (char*)s;
 2f6:	fe843783          	ld	a5,-24(s0)
 2fa:	a821                	j	312 <strchr+0x42>
  for(; *s; s++)
 2fc:	fe843783          	ld	a5,-24(s0)
 300:	0785                	addi	a5,a5,1
 302:	fef43423          	sd	a5,-24(s0)
 306:	fe843783          	ld	a5,-24(s0)
 30a:	0007c783          	lbu	a5,0(a5)
 30e:	fbf1                	bnez	a5,2e2 <strchr+0x12>
  return 0;
 310:	4781                	li	a5,0
}
 312:	853e                	mv	a0,a5
 314:	6462                	ld	s0,24(sp)
 316:	6105                	addi	sp,sp,32
 318:	8082                	ret

000000000000031a <gets>:

char*
gets(char *buf, int max)
{
 31a:	7179                	addi	sp,sp,-48
 31c:	f406                	sd	ra,40(sp)
 31e:	f022                	sd	s0,32(sp)
 320:	1800                	addi	s0,sp,48
 322:	fca43c23          	sd	a0,-40(s0)
 326:	87ae                	mv	a5,a1
 328:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 32c:	fe042623          	sw	zero,-20(s0)
 330:	a8a1                	j	388 <gets+0x6e>
    cc = read(0, &c, 1);
 332:	fe740793          	addi	a5,s0,-25
 336:	4605                	li	a2,1
 338:	85be                	mv	a1,a5
 33a:	4501                	li	a0,0
 33c:	00000097          	auipc	ra,0x0
 340:	2f6080e7          	jalr	758(ra) # 632 <read>
 344:	87aa                	mv	a5,a0
 346:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 34a:	fe842783          	lw	a5,-24(s0)
 34e:	2781                	sext.w	a5,a5
 350:	04f05763          	blez	a5,39e <gets+0x84>
      break;
    buf[i++] = c;
 354:	fec42783          	lw	a5,-20(s0)
 358:	0017871b          	addiw	a4,a5,1
 35c:	fee42623          	sw	a4,-20(s0)
 360:	873e                	mv	a4,a5
 362:	fd843783          	ld	a5,-40(s0)
 366:	97ba                	add	a5,a5,a4
 368:	fe744703          	lbu	a4,-25(s0)
 36c:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 370:	fe744783          	lbu	a5,-25(s0)
 374:	873e                	mv	a4,a5
 376:	47a9                	li	a5,10
 378:	02f70463          	beq	a4,a5,3a0 <gets+0x86>
 37c:	fe744783          	lbu	a5,-25(s0)
 380:	873e                	mv	a4,a5
 382:	47b5                	li	a5,13
 384:	00f70e63          	beq	a4,a5,3a0 <gets+0x86>
  for(i=0; i+1 < max; ){
 388:	fec42783          	lw	a5,-20(s0)
 38c:	2785                	addiw	a5,a5,1
 38e:	0007871b          	sext.w	a4,a5
 392:	fd442783          	lw	a5,-44(s0)
 396:	2781                	sext.w	a5,a5
 398:	f8f74de3          	blt	a4,a5,332 <gets+0x18>
 39c:	a011                	j	3a0 <gets+0x86>
      break;
 39e:	0001                	nop
      break;
  }
  buf[i] = '\0';
 3a0:	fec42783          	lw	a5,-20(s0)
 3a4:	fd843703          	ld	a4,-40(s0)
 3a8:	97ba                	add	a5,a5,a4
 3aa:	00078023          	sb	zero,0(a5)
  return buf;
 3ae:	fd843783          	ld	a5,-40(s0)
}
 3b2:	853e                	mv	a0,a5
 3b4:	70a2                	ld	ra,40(sp)
 3b6:	7402                	ld	s0,32(sp)
 3b8:	6145                	addi	sp,sp,48
 3ba:	8082                	ret

00000000000003bc <stat>:

int
stat(const char *n, struct stat *st)
{
 3bc:	7179                	addi	sp,sp,-48
 3be:	f406                	sd	ra,40(sp)
 3c0:	f022                	sd	s0,32(sp)
 3c2:	1800                	addi	s0,sp,48
 3c4:	fca43c23          	sd	a0,-40(s0)
 3c8:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3cc:	4581                	li	a1,0
 3ce:	fd843503          	ld	a0,-40(s0)
 3d2:	00000097          	auipc	ra,0x0
 3d6:	288080e7          	jalr	648(ra) # 65a <open>
 3da:	87aa                	mv	a5,a0
 3dc:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 3e0:	fec42783          	lw	a5,-20(s0)
 3e4:	2781                	sext.w	a5,a5
 3e6:	0007d463          	bgez	a5,3ee <stat+0x32>
    return -1;
 3ea:	57fd                	li	a5,-1
 3ec:	a035                	j	418 <stat+0x5c>
  r = fstat(fd, st);
 3ee:	fec42783          	lw	a5,-20(s0)
 3f2:	fd043583          	ld	a1,-48(s0)
 3f6:	853e                	mv	a0,a5
 3f8:	00000097          	auipc	ra,0x0
 3fc:	27a080e7          	jalr	634(ra) # 672 <fstat>
 400:	87aa                	mv	a5,a0
 402:	fef42423          	sw	a5,-24(s0)
  close(fd);
 406:	fec42783          	lw	a5,-20(s0)
 40a:	853e                	mv	a0,a5
 40c:	00000097          	auipc	ra,0x0
 410:	236080e7          	jalr	566(ra) # 642 <close>
  return r;
 414:	fe842783          	lw	a5,-24(s0)
}
 418:	853e                	mv	a0,a5
 41a:	70a2                	ld	ra,40(sp)
 41c:	7402                	ld	s0,32(sp)
 41e:	6145                	addi	sp,sp,48
 420:	8082                	ret

0000000000000422 <atoi>:

int
atoi(const char *s)
{
 422:	7179                	addi	sp,sp,-48
 424:	f422                	sd	s0,40(sp)
 426:	1800                	addi	s0,sp,48
 428:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 42c:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 430:	a815                	j	464 <atoi+0x42>
    n = n*10 + *s++ - '0';
 432:	fec42703          	lw	a4,-20(s0)
 436:	87ba                	mv	a5,a4
 438:	0027979b          	slliw	a5,a5,0x2
 43c:	9fb9                	addw	a5,a5,a4
 43e:	0017979b          	slliw	a5,a5,0x1
 442:	0007871b          	sext.w	a4,a5
 446:	fd843783          	ld	a5,-40(s0)
 44a:	00178693          	addi	a3,a5,1
 44e:	fcd43c23          	sd	a3,-40(s0)
 452:	0007c783          	lbu	a5,0(a5)
 456:	2781                	sext.w	a5,a5
 458:	9fb9                	addw	a5,a5,a4
 45a:	2781                	sext.w	a5,a5
 45c:	fd07879b          	addiw	a5,a5,-48
 460:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 464:	fd843783          	ld	a5,-40(s0)
 468:	0007c783          	lbu	a5,0(a5)
 46c:	873e                	mv	a4,a5
 46e:	02f00793          	li	a5,47
 472:	00e7fb63          	bgeu	a5,a4,488 <atoi+0x66>
 476:	fd843783          	ld	a5,-40(s0)
 47a:	0007c783          	lbu	a5,0(a5)
 47e:	873e                	mv	a4,a5
 480:	03900793          	li	a5,57
 484:	fae7f7e3          	bgeu	a5,a4,432 <atoi+0x10>
  return n;
 488:	fec42783          	lw	a5,-20(s0)
}
 48c:	853e                	mv	a0,a5
 48e:	7422                	ld	s0,40(sp)
 490:	6145                	addi	sp,sp,48
 492:	8082                	ret

0000000000000494 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 494:	7139                	addi	sp,sp,-64
 496:	fc22                	sd	s0,56(sp)
 498:	0080                	addi	s0,sp,64
 49a:	fca43c23          	sd	a0,-40(s0)
 49e:	fcb43823          	sd	a1,-48(s0)
 4a2:	87b2                	mv	a5,a2
 4a4:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 4a8:	fd843783          	ld	a5,-40(s0)
 4ac:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 4b0:	fd043783          	ld	a5,-48(s0)
 4b4:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 4b8:	fe043703          	ld	a4,-32(s0)
 4bc:	fe843783          	ld	a5,-24(s0)
 4c0:	02e7fc63          	bgeu	a5,a4,4f8 <memmove+0x64>
    while(n-- > 0)
 4c4:	a00d                	j	4e6 <memmove+0x52>
      *dst++ = *src++;
 4c6:	fe043703          	ld	a4,-32(s0)
 4ca:	00170793          	addi	a5,a4,1
 4ce:	fef43023          	sd	a5,-32(s0)
 4d2:	fe843783          	ld	a5,-24(s0)
 4d6:	00178693          	addi	a3,a5,1
 4da:	fed43423          	sd	a3,-24(s0)
 4de:	00074703          	lbu	a4,0(a4)
 4e2:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 4e6:	fcc42783          	lw	a5,-52(s0)
 4ea:	fff7871b          	addiw	a4,a5,-1
 4ee:	fce42623          	sw	a4,-52(s0)
 4f2:	fcf04ae3          	bgtz	a5,4c6 <memmove+0x32>
 4f6:	a891                	j	54a <memmove+0xb6>
  } else {
    dst += n;
 4f8:	fcc42783          	lw	a5,-52(s0)
 4fc:	fe843703          	ld	a4,-24(s0)
 500:	97ba                	add	a5,a5,a4
 502:	fef43423          	sd	a5,-24(s0)
    src += n;
 506:	fcc42783          	lw	a5,-52(s0)
 50a:	fe043703          	ld	a4,-32(s0)
 50e:	97ba                	add	a5,a5,a4
 510:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 514:	a01d                	j	53a <memmove+0xa6>
      *--dst = *--src;
 516:	fe043783          	ld	a5,-32(s0)
 51a:	17fd                	addi	a5,a5,-1
 51c:	fef43023          	sd	a5,-32(s0)
 520:	fe843783          	ld	a5,-24(s0)
 524:	17fd                	addi	a5,a5,-1
 526:	fef43423          	sd	a5,-24(s0)
 52a:	fe043783          	ld	a5,-32(s0)
 52e:	0007c703          	lbu	a4,0(a5)
 532:	fe843783          	ld	a5,-24(s0)
 536:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 53a:	fcc42783          	lw	a5,-52(s0)
 53e:	fff7871b          	addiw	a4,a5,-1
 542:	fce42623          	sw	a4,-52(s0)
 546:	fcf048e3          	bgtz	a5,516 <memmove+0x82>
  }
  return vdst;
 54a:	fd843783          	ld	a5,-40(s0)
}
 54e:	853e                	mv	a0,a5
 550:	7462                	ld	s0,56(sp)
 552:	6121                	addi	sp,sp,64
 554:	8082                	ret

0000000000000556 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 556:	7139                	addi	sp,sp,-64
 558:	fc22                	sd	s0,56(sp)
 55a:	0080                	addi	s0,sp,64
 55c:	fca43c23          	sd	a0,-40(s0)
 560:	fcb43823          	sd	a1,-48(s0)
 564:	87b2                	mv	a5,a2
 566:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 56a:	fd843783          	ld	a5,-40(s0)
 56e:	fef43423          	sd	a5,-24(s0)
 572:	fd043783          	ld	a5,-48(s0)
 576:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 57a:	a0a1                	j	5c2 <memcmp+0x6c>
    if (*p1 != *p2) {
 57c:	fe843783          	ld	a5,-24(s0)
 580:	0007c703          	lbu	a4,0(a5)
 584:	fe043783          	ld	a5,-32(s0)
 588:	0007c783          	lbu	a5,0(a5)
 58c:	02f70163          	beq	a4,a5,5ae <memcmp+0x58>
      return *p1 - *p2;
 590:	fe843783          	ld	a5,-24(s0)
 594:	0007c783          	lbu	a5,0(a5)
 598:	0007871b          	sext.w	a4,a5
 59c:	fe043783          	ld	a5,-32(s0)
 5a0:	0007c783          	lbu	a5,0(a5)
 5a4:	2781                	sext.w	a5,a5
 5a6:	40f707bb          	subw	a5,a4,a5
 5aa:	2781                	sext.w	a5,a5
 5ac:	a01d                	j	5d2 <memcmp+0x7c>
    }
    p1++;
 5ae:	fe843783          	ld	a5,-24(s0)
 5b2:	0785                	addi	a5,a5,1
 5b4:	fef43423          	sd	a5,-24(s0)
    p2++;
 5b8:	fe043783          	ld	a5,-32(s0)
 5bc:	0785                	addi	a5,a5,1
 5be:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 5c2:	fcc42783          	lw	a5,-52(s0)
 5c6:	fff7871b          	addiw	a4,a5,-1
 5ca:	fce42623          	sw	a4,-52(s0)
 5ce:	f7dd                	bnez	a5,57c <memcmp+0x26>
  }
  return 0;
 5d0:	4781                	li	a5,0
}
 5d2:	853e                	mv	a0,a5
 5d4:	7462                	ld	s0,56(sp)
 5d6:	6121                	addi	sp,sp,64
 5d8:	8082                	ret

00000000000005da <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 5da:	7179                	addi	sp,sp,-48
 5dc:	f406                	sd	ra,40(sp)
 5de:	f022                	sd	s0,32(sp)
 5e0:	1800                	addi	s0,sp,48
 5e2:	fea43423          	sd	a0,-24(s0)
 5e6:	feb43023          	sd	a1,-32(s0)
 5ea:	87b2                	mv	a5,a2
 5ec:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 5f0:	fdc42783          	lw	a5,-36(s0)
 5f4:	863e                	mv	a2,a5
 5f6:	fe043583          	ld	a1,-32(s0)
 5fa:	fe843503          	ld	a0,-24(s0)
 5fe:	00000097          	auipc	ra,0x0
 602:	e96080e7          	jalr	-362(ra) # 494 <memmove>
 606:	87aa                	mv	a5,a0
}
 608:	853e                	mv	a0,a5
 60a:	70a2                	ld	ra,40(sp)
 60c:	7402                	ld	s0,32(sp)
 60e:	6145                	addi	sp,sp,48
 610:	8082                	ret

0000000000000612 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 612:	4885                	li	a7,1
 ecall
 614:	00000073          	ecall
 ret
 618:	8082                	ret

000000000000061a <exit>:
.global exit
exit:
 li a7, SYS_exit
 61a:	4889                	li	a7,2
 ecall
 61c:	00000073          	ecall
 ret
 620:	8082                	ret

0000000000000622 <wait>:
.global wait
wait:
 li a7, SYS_wait
 622:	488d                	li	a7,3
 ecall
 624:	00000073          	ecall
 ret
 628:	8082                	ret

000000000000062a <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 62a:	4891                	li	a7,4
 ecall
 62c:	00000073          	ecall
 ret
 630:	8082                	ret

0000000000000632 <read>:
.global read
read:
 li a7, SYS_read
 632:	4895                	li	a7,5
 ecall
 634:	00000073          	ecall
 ret
 638:	8082                	ret

000000000000063a <write>:
.global write
write:
 li a7, SYS_write
 63a:	48c1                	li	a7,16
 ecall
 63c:	00000073          	ecall
 ret
 640:	8082                	ret

0000000000000642 <close>:
.global close
close:
 li a7, SYS_close
 642:	48d5                	li	a7,21
 ecall
 644:	00000073          	ecall
 ret
 648:	8082                	ret

000000000000064a <kill>:
.global kill
kill:
 li a7, SYS_kill
 64a:	4899                	li	a7,6
 ecall
 64c:	00000073          	ecall
 ret
 650:	8082                	ret

0000000000000652 <exec>:
.global exec
exec:
 li a7, SYS_exec
 652:	489d                	li	a7,7
 ecall
 654:	00000073          	ecall
 ret
 658:	8082                	ret

000000000000065a <open>:
.global open
open:
 li a7, SYS_open
 65a:	48bd                	li	a7,15
 ecall
 65c:	00000073          	ecall
 ret
 660:	8082                	ret

0000000000000662 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 662:	48c5                	li	a7,17
 ecall
 664:	00000073          	ecall
 ret
 668:	8082                	ret

000000000000066a <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 66a:	48c9                	li	a7,18
 ecall
 66c:	00000073          	ecall
 ret
 670:	8082                	ret

0000000000000672 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 672:	48a1                	li	a7,8
 ecall
 674:	00000073          	ecall
 ret
 678:	8082                	ret

000000000000067a <link>:
.global link
link:
 li a7, SYS_link
 67a:	48cd                	li	a7,19
 ecall
 67c:	00000073          	ecall
 ret
 680:	8082                	ret

0000000000000682 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 682:	48d1                	li	a7,20
 ecall
 684:	00000073          	ecall
 ret
 688:	8082                	ret

000000000000068a <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 68a:	48a5                	li	a7,9
 ecall
 68c:	00000073          	ecall
 ret
 690:	8082                	ret

0000000000000692 <dup>:
.global dup
dup:
 li a7, SYS_dup
 692:	48a9                	li	a7,10
 ecall
 694:	00000073          	ecall
 ret
 698:	8082                	ret

000000000000069a <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 69a:	48ad                	li	a7,11
 ecall
 69c:	00000073          	ecall
 ret
 6a0:	8082                	ret

00000000000006a2 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 6a2:	48b1                	li	a7,12
 ecall
 6a4:	00000073          	ecall
 ret
 6a8:	8082                	ret

00000000000006aa <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 6aa:	48b5                	li	a7,13
 ecall
 6ac:	00000073          	ecall
 ret
 6b0:	8082                	ret

00000000000006b2 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 6b2:	48b9                	li	a7,14
 ecall
 6b4:	00000073          	ecall
 ret
 6b8:	8082                	ret

00000000000006ba <setSchedAlg>:
.global setSchedAlg
setSchedAlg:
 li a7, SYS_setSchedAlg
 6ba:	48d9                	li	a7,22
 ecall
 6bc:	00000073          	ecall
 ret
 6c0:	8082                	ret

00000000000006c2 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 6c2:	1101                	addi	sp,sp,-32
 6c4:	ec06                	sd	ra,24(sp)
 6c6:	e822                	sd	s0,16(sp)
 6c8:	1000                	addi	s0,sp,32
 6ca:	87aa                	mv	a5,a0
 6cc:	872e                	mv	a4,a1
 6ce:	fef42623          	sw	a5,-20(s0)
 6d2:	87ba                	mv	a5,a4
 6d4:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 6d8:	feb40713          	addi	a4,s0,-21
 6dc:	fec42783          	lw	a5,-20(s0)
 6e0:	4605                	li	a2,1
 6e2:	85ba                	mv	a1,a4
 6e4:	853e                	mv	a0,a5
 6e6:	00000097          	auipc	ra,0x0
 6ea:	f54080e7          	jalr	-172(ra) # 63a <write>
}
 6ee:	0001                	nop
 6f0:	60e2                	ld	ra,24(sp)
 6f2:	6442                	ld	s0,16(sp)
 6f4:	6105                	addi	sp,sp,32
 6f6:	8082                	ret

00000000000006f8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6f8:	7139                	addi	sp,sp,-64
 6fa:	fc06                	sd	ra,56(sp)
 6fc:	f822                	sd	s0,48(sp)
 6fe:	0080                	addi	s0,sp,64
 700:	87aa                	mv	a5,a0
 702:	8736                	mv	a4,a3
 704:	fcf42623          	sw	a5,-52(s0)
 708:	87ae                	mv	a5,a1
 70a:	fcf42423          	sw	a5,-56(s0)
 70e:	87b2                	mv	a5,a2
 710:	fcf42223          	sw	a5,-60(s0)
 714:	87ba                	mv	a5,a4
 716:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 71a:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 71e:	fc042783          	lw	a5,-64(s0)
 722:	2781                	sext.w	a5,a5
 724:	c38d                	beqz	a5,746 <printint+0x4e>
 726:	fc842783          	lw	a5,-56(s0)
 72a:	2781                	sext.w	a5,a5
 72c:	0007dd63          	bgez	a5,746 <printint+0x4e>
    neg = 1;
 730:	4785                	li	a5,1
 732:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 736:	fc842783          	lw	a5,-56(s0)
 73a:	40f007bb          	negw	a5,a5
 73e:	2781                	sext.w	a5,a5
 740:	fef42223          	sw	a5,-28(s0)
 744:	a029                	j	74e <printint+0x56>
  } else {
    x = xx;
 746:	fc842783          	lw	a5,-56(s0)
 74a:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 74e:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 752:	fc442783          	lw	a5,-60(s0)
 756:	fe442703          	lw	a4,-28(s0)
 75a:	02f777bb          	remuw	a5,a4,a5
 75e:	0007861b          	sext.w	a2,a5
 762:	fec42783          	lw	a5,-20(s0)
 766:	0017871b          	addiw	a4,a5,1
 76a:	fee42623          	sw	a4,-20(s0)
 76e:	00000697          	auipc	a3,0x0
 772:	75a68693          	addi	a3,a3,1882 # ec8 <digits>
 776:	02061713          	slli	a4,a2,0x20
 77a:	9301                	srli	a4,a4,0x20
 77c:	9736                	add	a4,a4,a3
 77e:	00074703          	lbu	a4,0(a4)
 782:	ff040693          	addi	a3,s0,-16
 786:	97b6                	add	a5,a5,a3
 788:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 78c:	fc442783          	lw	a5,-60(s0)
 790:	fe442703          	lw	a4,-28(s0)
 794:	02f757bb          	divuw	a5,a4,a5
 798:	fef42223          	sw	a5,-28(s0)
 79c:	fe442783          	lw	a5,-28(s0)
 7a0:	2781                	sext.w	a5,a5
 7a2:	fbc5                	bnez	a5,752 <printint+0x5a>
  if(neg)
 7a4:	fe842783          	lw	a5,-24(s0)
 7a8:	2781                	sext.w	a5,a5
 7aa:	cf95                	beqz	a5,7e6 <printint+0xee>
    buf[i++] = '-';
 7ac:	fec42783          	lw	a5,-20(s0)
 7b0:	0017871b          	addiw	a4,a5,1
 7b4:	fee42623          	sw	a4,-20(s0)
 7b8:	ff040713          	addi	a4,s0,-16
 7bc:	97ba                	add	a5,a5,a4
 7be:	02d00713          	li	a4,45
 7c2:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 7c6:	a005                	j	7e6 <printint+0xee>
    putc(fd, buf[i]);
 7c8:	fec42783          	lw	a5,-20(s0)
 7cc:	ff040713          	addi	a4,s0,-16
 7d0:	97ba                	add	a5,a5,a4
 7d2:	fe07c703          	lbu	a4,-32(a5)
 7d6:	fcc42783          	lw	a5,-52(s0)
 7da:	85ba                	mv	a1,a4
 7dc:	853e                	mv	a0,a5
 7de:	00000097          	auipc	ra,0x0
 7e2:	ee4080e7          	jalr	-284(ra) # 6c2 <putc>
  while(--i >= 0)
 7e6:	fec42783          	lw	a5,-20(s0)
 7ea:	37fd                	addiw	a5,a5,-1
 7ec:	fef42623          	sw	a5,-20(s0)
 7f0:	fec42783          	lw	a5,-20(s0)
 7f4:	2781                	sext.w	a5,a5
 7f6:	fc07d9e3          	bgez	a5,7c8 <printint+0xd0>
}
 7fa:	0001                	nop
 7fc:	0001                	nop
 7fe:	70e2                	ld	ra,56(sp)
 800:	7442                	ld	s0,48(sp)
 802:	6121                	addi	sp,sp,64
 804:	8082                	ret

0000000000000806 <printptr>:

static void
printptr(int fd, uint64 x) {
 806:	7179                	addi	sp,sp,-48
 808:	f406                	sd	ra,40(sp)
 80a:	f022                	sd	s0,32(sp)
 80c:	1800                	addi	s0,sp,48
 80e:	87aa                	mv	a5,a0
 810:	fcb43823          	sd	a1,-48(s0)
 814:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 818:	fdc42783          	lw	a5,-36(s0)
 81c:	03000593          	li	a1,48
 820:	853e                	mv	a0,a5
 822:	00000097          	auipc	ra,0x0
 826:	ea0080e7          	jalr	-352(ra) # 6c2 <putc>
  putc(fd, 'x');
 82a:	fdc42783          	lw	a5,-36(s0)
 82e:	07800593          	li	a1,120
 832:	853e                	mv	a0,a5
 834:	00000097          	auipc	ra,0x0
 838:	e8e080e7          	jalr	-370(ra) # 6c2 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 83c:	fe042623          	sw	zero,-20(s0)
 840:	a82d                	j	87a <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 842:	fd043783          	ld	a5,-48(s0)
 846:	93f1                	srli	a5,a5,0x3c
 848:	00000717          	auipc	a4,0x0
 84c:	68070713          	addi	a4,a4,1664 # ec8 <digits>
 850:	97ba                	add	a5,a5,a4
 852:	0007c703          	lbu	a4,0(a5)
 856:	fdc42783          	lw	a5,-36(s0)
 85a:	85ba                	mv	a1,a4
 85c:	853e                	mv	a0,a5
 85e:	00000097          	auipc	ra,0x0
 862:	e64080e7          	jalr	-412(ra) # 6c2 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 866:	fec42783          	lw	a5,-20(s0)
 86a:	2785                	addiw	a5,a5,1
 86c:	fef42623          	sw	a5,-20(s0)
 870:	fd043783          	ld	a5,-48(s0)
 874:	0792                	slli	a5,a5,0x4
 876:	fcf43823          	sd	a5,-48(s0)
 87a:	fec42783          	lw	a5,-20(s0)
 87e:	873e                	mv	a4,a5
 880:	47bd                	li	a5,15
 882:	fce7f0e3          	bgeu	a5,a4,842 <printptr+0x3c>
}
 886:	0001                	nop
 888:	0001                	nop
 88a:	70a2                	ld	ra,40(sp)
 88c:	7402                	ld	s0,32(sp)
 88e:	6145                	addi	sp,sp,48
 890:	8082                	ret

0000000000000892 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 892:	715d                	addi	sp,sp,-80
 894:	e486                	sd	ra,72(sp)
 896:	e0a2                	sd	s0,64(sp)
 898:	0880                	addi	s0,sp,80
 89a:	87aa                	mv	a5,a0
 89c:	fcb43023          	sd	a1,-64(s0)
 8a0:	fac43c23          	sd	a2,-72(s0)
 8a4:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 8a8:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 8ac:	fe042223          	sw	zero,-28(s0)
 8b0:	a42d                	j	ada <vprintf+0x248>
    c = fmt[i] & 0xff;
 8b2:	fe442783          	lw	a5,-28(s0)
 8b6:	fc043703          	ld	a4,-64(s0)
 8ba:	97ba                	add	a5,a5,a4
 8bc:	0007c783          	lbu	a5,0(a5)
 8c0:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 8c4:	fe042783          	lw	a5,-32(s0)
 8c8:	2781                	sext.w	a5,a5
 8ca:	eb9d                	bnez	a5,900 <vprintf+0x6e>
      if(c == '%'){
 8cc:	fdc42783          	lw	a5,-36(s0)
 8d0:	0007871b          	sext.w	a4,a5
 8d4:	02500793          	li	a5,37
 8d8:	00f71763          	bne	a4,a5,8e6 <vprintf+0x54>
        state = '%';
 8dc:	02500793          	li	a5,37
 8e0:	fef42023          	sw	a5,-32(s0)
 8e4:	a2f5                	j	ad0 <vprintf+0x23e>
      } else {
        putc(fd, c);
 8e6:	fdc42783          	lw	a5,-36(s0)
 8ea:	0ff7f713          	andi	a4,a5,255
 8ee:	fcc42783          	lw	a5,-52(s0)
 8f2:	85ba                	mv	a1,a4
 8f4:	853e                	mv	a0,a5
 8f6:	00000097          	auipc	ra,0x0
 8fa:	dcc080e7          	jalr	-564(ra) # 6c2 <putc>
 8fe:	aac9                	j	ad0 <vprintf+0x23e>
      }
    } else if(state == '%'){
 900:	fe042783          	lw	a5,-32(s0)
 904:	0007871b          	sext.w	a4,a5
 908:	02500793          	li	a5,37
 90c:	1cf71263          	bne	a4,a5,ad0 <vprintf+0x23e>
      if(c == 'd'){
 910:	fdc42783          	lw	a5,-36(s0)
 914:	0007871b          	sext.w	a4,a5
 918:	06400793          	li	a5,100
 91c:	02f71463          	bne	a4,a5,944 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 920:	fb843783          	ld	a5,-72(s0)
 924:	00878713          	addi	a4,a5,8
 928:	fae43c23          	sd	a4,-72(s0)
 92c:	4398                	lw	a4,0(a5)
 92e:	fcc42783          	lw	a5,-52(s0)
 932:	4685                	li	a3,1
 934:	4629                	li	a2,10
 936:	85ba                	mv	a1,a4
 938:	853e                	mv	a0,a5
 93a:	00000097          	auipc	ra,0x0
 93e:	dbe080e7          	jalr	-578(ra) # 6f8 <printint>
 942:	a269                	j	acc <vprintf+0x23a>
      } else if(c == 'l') {
 944:	fdc42783          	lw	a5,-36(s0)
 948:	0007871b          	sext.w	a4,a5
 94c:	06c00793          	li	a5,108
 950:	02f71663          	bne	a4,a5,97c <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 954:	fb843783          	ld	a5,-72(s0)
 958:	00878713          	addi	a4,a5,8
 95c:	fae43c23          	sd	a4,-72(s0)
 960:	639c                	ld	a5,0(a5)
 962:	0007871b          	sext.w	a4,a5
 966:	fcc42783          	lw	a5,-52(s0)
 96a:	4681                	li	a3,0
 96c:	4629                	li	a2,10
 96e:	85ba                	mv	a1,a4
 970:	853e                	mv	a0,a5
 972:	00000097          	auipc	ra,0x0
 976:	d86080e7          	jalr	-634(ra) # 6f8 <printint>
 97a:	aa89                	j	acc <vprintf+0x23a>
      } else if(c == 'x') {
 97c:	fdc42783          	lw	a5,-36(s0)
 980:	0007871b          	sext.w	a4,a5
 984:	07800793          	li	a5,120
 988:	02f71463          	bne	a4,a5,9b0 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 98c:	fb843783          	ld	a5,-72(s0)
 990:	00878713          	addi	a4,a5,8
 994:	fae43c23          	sd	a4,-72(s0)
 998:	4398                	lw	a4,0(a5)
 99a:	fcc42783          	lw	a5,-52(s0)
 99e:	4681                	li	a3,0
 9a0:	4641                	li	a2,16
 9a2:	85ba                	mv	a1,a4
 9a4:	853e                	mv	a0,a5
 9a6:	00000097          	auipc	ra,0x0
 9aa:	d52080e7          	jalr	-686(ra) # 6f8 <printint>
 9ae:	aa39                	j	acc <vprintf+0x23a>
      } else if(c == 'p') {
 9b0:	fdc42783          	lw	a5,-36(s0)
 9b4:	0007871b          	sext.w	a4,a5
 9b8:	07000793          	li	a5,112
 9bc:	02f71263          	bne	a4,a5,9e0 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 9c0:	fb843783          	ld	a5,-72(s0)
 9c4:	00878713          	addi	a4,a5,8
 9c8:	fae43c23          	sd	a4,-72(s0)
 9cc:	6398                	ld	a4,0(a5)
 9ce:	fcc42783          	lw	a5,-52(s0)
 9d2:	85ba                	mv	a1,a4
 9d4:	853e                	mv	a0,a5
 9d6:	00000097          	auipc	ra,0x0
 9da:	e30080e7          	jalr	-464(ra) # 806 <printptr>
 9de:	a0fd                	j	acc <vprintf+0x23a>
      } else if(c == 's'){
 9e0:	fdc42783          	lw	a5,-36(s0)
 9e4:	0007871b          	sext.w	a4,a5
 9e8:	07300793          	li	a5,115
 9ec:	04f71c63          	bne	a4,a5,a44 <vprintf+0x1b2>
        s = va_arg(ap, char*);
 9f0:	fb843783          	ld	a5,-72(s0)
 9f4:	00878713          	addi	a4,a5,8
 9f8:	fae43c23          	sd	a4,-72(s0)
 9fc:	639c                	ld	a5,0(a5)
 9fe:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 a02:	fe843783          	ld	a5,-24(s0)
 a06:	eb8d                	bnez	a5,a38 <vprintf+0x1a6>
          s = "(null)";
 a08:	00000797          	auipc	a5,0x0
 a0c:	4b878793          	addi	a5,a5,1208 # ec0 <malloc+0x17e>
 a10:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 a14:	a015                	j	a38 <vprintf+0x1a6>
          putc(fd, *s);
 a16:	fe843783          	ld	a5,-24(s0)
 a1a:	0007c703          	lbu	a4,0(a5)
 a1e:	fcc42783          	lw	a5,-52(s0)
 a22:	85ba                	mv	a1,a4
 a24:	853e                	mv	a0,a5
 a26:	00000097          	auipc	ra,0x0
 a2a:	c9c080e7          	jalr	-868(ra) # 6c2 <putc>
          s++;
 a2e:	fe843783          	ld	a5,-24(s0)
 a32:	0785                	addi	a5,a5,1
 a34:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 a38:	fe843783          	ld	a5,-24(s0)
 a3c:	0007c783          	lbu	a5,0(a5)
 a40:	fbf9                	bnez	a5,a16 <vprintf+0x184>
 a42:	a069                	j	acc <vprintf+0x23a>
        }
      } else if(c == 'c'){
 a44:	fdc42783          	lw	a5,-36(s0)
 a48:	0007871b          	sext.w	a4,a5
 a4c:	06300793          	li	a5,99
 a50:	02f71463          	bne	a4,a5,a78 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 a54:	fb843783          	ld	a5,-72(s0)
 a58:	00878713          	addi	a4,a5,8
 a5c:	fae43c23          	sd	a4,-72(s0)
 a60:	439c                	lw	a5,0(a5)
 a62:	0ff7f713          	andi	a4,a5,255
 a66:	fcc42783          	lw	a5,-52(s0)
 a6a:	85ba                	mv	a1,a4
 a6c:	853e                	mv	a0,a5
 a6e:	00000097          	auipc	ra,0x0
 a72:	c54080e7          	jalr	-940(ra) # 6c2 <putc>
 a76:	a899                	j	acc <vprintf+0x23a>
      } else if(c == '%'){
 a78:	fdc42783          	lw	a5,-36(s0)
 a7c:	0007871b          	sext.w	a4,a5
 a80:	02500793          	li	a5,37
 a84:	00f71f63          	bne	a4,a5,aa2 <vprintf+0x210>
        putc(fd, c);
 a88:	fdc42783          	lw	a5,-36(s0)
 a8c:	0ff7f713          	andi	a4,a5,255
 a90:	fcc42783          	lw	a5,-52(s0)
 a94:	85ba                	mv	a1,a4
 a96:	853e                	mv	a0,a5
 a98:	00000097          	auipc	ra,0x0
 a9c:	c2a080e7          	jalr	-982(ra) # 6c2 <putc>
 aa0:	a035                	j	acc <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 aa2:	fcc42783          	lw	a5,-52(s0)
 aa6:	02500593          	li	a1,37
 aaa:	853e                	mv	a0,a5
 aac:	00000097          	auipc	ra,0x0
 ab0:	c16080e7          	jalr	-1002(ra) # 6c2 <putc>
        putc(fd, c);
 ab4:	fdc42783          	lw	a5,-36(s0)
 ab8:	0ff7f713          	andi	a4,a5,255
 abc:	fcc42783          	lw	a5,-52(s0)
 ac0:	85ba                	mv	a1,a4
 ac2:	853e                	mv	a0,a5
 ac4:	00000097          	auipc	ra,0x0
 ac8:	bfe080e7          	jalr	-1026(ra) # 6c2 <putc>
      }
      state = 0;
 acc:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 ad0:	fe442783          	lw	a5,-28(s0)
 ad4:	2785                	addiw	a5,a5,1
 ad6:	fef42223          	sw	a5,-28(s0)
 ada:	fe442783          	lw	a5,-28(s0)
 ade:	fc043703          	ld	a4,-64(s0)
 ae2:	97ba                	add	a5,a5,a4
 ae4:	0007c783          	lbu	a5,0(a5)
 ae8:	dc0795e3          	bnez	a5,8b2 <vprintf+0x20>
    }
  }
}
 aec:	0001                	nop
 aee:	0001                	nop
 af0:	60a6                	ld	ra,72(sp)
 af2:	6406                	ld	s0,64(sp)
 af4:	6161                	addi	sp,sp,80
 af6:	8082                	ret

0000000000000af8 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 af8:	7159                	addi	sp,sp,-112
 afa:	fc06                	sd	ra,56(sp)
 afc:	f822                	sd	s0,48(sp)
 afe:	0080                	addi	s0,sp,64
 b00:	fcb43823          	sd	a1,-48(s0)
 b04:	e010                	sd	a2,0(s0)
 b06:	e414                	sd	a3,8(s0)
 b08:	e818                	sd	a4,16(s0)
 b0a:	ec1c                	sd	a5,24(s0)
 b0c:	03043023          	sd	a6,32(s0)
 b10:	03143423          	sd	a7,40(s0)
 b14:	87aa                	mv	a5,a0
 b16:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 b1a:	03040793          	addi	a5,s0,48
 b1e:	fcf43423          	sd	a5,-56(s0)
 b22:	fc843783          	ld	a5,-56(s0)
 b26:	fd078793          	addi	a5,a5,-48
 b2a:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 b2e:	fe843703          	ld	a4,-24(s0)
 b32:	fdc42783          	lw	a5,-36(s0)
 b36:	863a                	mv	a2,a4
 b38:	fd043583          	ld	a1,-48(s0)
 b3c:	853e                	mv	a0,a5
 b3e:	00000097          	auipc	ra,0x0
 b42:	d54080e7          	jalr	-684(ra) # 892 <vprintf>
}
 b46:	0001                	nop
 b48:	70e2                	ld	ra,56(sp)
 b4a:	7442                	ld	s0,48(sp)
 b4c:	6165                	addi	sp,sp,112
 b4e:	8082                	ret

0000000000000b50 <printf>:

void
printf(const char *fmt, ...)
{
 b50:	7159                	addi	sp,sp,-112
 b52:	f406                	sd	ra,40(sp)
 b54:	f022                	sd	s0,32(sp)
 b56:	1800                	addi	s0,sp,48
 b58:	fca43c23          	sd	a0,-40(s0)
 b5c:	e40c                	sd	a1,8(s0)
 b5e:	e810                	sd	a2,16(s0)
 b60:	ec14                	sd	a3,24(s0)
 b62:	f018                	sd	a4,32(s0)
 b64:	f41c                	sd	a5,40(s0)
 b66:	03043823          	sd	a6,48(s0)
 b6a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 b6e:	04040793          	addi	a5,s0,64
 b72:	fcf43823          	sd	a5,-48(s0)
 b76:	fd043783          	ld	a5,-48(s0)
 b7a:	fc878793          	addi	a5,a5,-56
 b7e:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 b82:	fe843783          	ld	a5,-24(s0)
 b86:	863e                	mv	a2,a5
 b88:	fd843583          	ld	a1,-40(s0)
 b8c:	4505                	li	a0,1
 b8e:	00000097          	auipc	ra,0x0
 b92:	d04080e7          	jalr	-764(ra) # 892 <vprintf>
}
 b96:	0001                	nop
 b98:	70a2                	ld	ra,40(sp)
 b9a:	7402                	ld	s0,32(sp)
 b9c:	6165                	addi	sp,sp,112
 b9e:	8082                	ret

0000000000000ba0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ba0:	7179                	addi	sp,sp,-48
 ba2:	f422                	sd	s0,40(sp)
 ba4:	1800                	addi	s0,sp,48
 ba6:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 baa:	fd843783          	ld	a5,-40(s0)
 bae:	17c1                	addi	a5,a5,-16
 bb0:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bb4:	00000797          	auipc	a5,0x0
 bb8:	33c78793          	addi	a5,a5,828 # ef0 <freep>
 bbc:	639c                	ld	a5,0(a5)
 bbe:	fef43423          	sd	a5,-24(s0)
 bc2:	a815                	j	bf6 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 bc4:	fe843783          	ld	a5,-24(s0)
 bc8:	639c                	ld	a5,0(a5)
 bca:	fe843703          	ld	a4,-24(s0)
 bce:	00f76f63          	bltu	a4,a5,bec <free+0x4c>
 bd2:	fe043703          	ld	a4,-32(s0)
 bd6:	fe843783          	ld	a5,-24(s0)
 bda:	02e7eb63          	bltu	a5,a4,c10 <free+0x70>
 bde:	fe843783          	ld	a5,-24(s0)
 be2:	639c                	ld	a5,0(a5)
 be4:	fe043703          	ld	a4,-32(s0)
 be8:	02f76463          	bltu	a4,a5,c10 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bec:	fe843783          	ld	a5,-24(s0)
 bf0:	639c                	ld	a5,0(a5)
 bf2:	fef43423          	sd	a5,-24(s0)
 bf6:	fe043703          	ld	a4,-32(s0)
 bfa:	fe843783          	ld	a5,-24(s0)
 bfe:	fce7f3e3          	bgeu	a5,a4,bc4 <free+0x24>
 c02:	fe843783          	ld	a5,-24(s0)
 c06:	639c                	ld	a5,0(a5)
 c08:	fe043703          	ld	a4,-32(s0)
 c0c:	faf77ce3          	bgeu	a4,a5,bc4 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
 c10:	fe043783          	ld	a5,-32(s0)
 c14:	479c                	lw	a5,8(a5)
 c16:	1782                	slli	a5,a5,0x20
 c18:	9381                	srli	a5,a5,0x20
 c1a:	0792                	slli	a5,a5,0x4
 c1c:	fe043703          	ld	a4,-32(s0)
 c20:	973e                	add	a4,a4,a5
 c22:	fe843783          	ld	a5,-24(s0)
 c26:	639c                	ld	a5,0(a5)
 c28:	02f71763          	bne	a4,a5,c56 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
 c2c:	fe043783          	ld	a5,-32(s0)
 c30:	4798                	lw	a4,8(a5)
 c32:	fe843783          	ld	a5,-24(s0)
 c36:	639c                	ld	a5,0(a5)
 c38:	479c                	lw	a5,8(a5)
 c3a:	9fb9                	addw	a5,a5,a4
 c3c:	0007871b          	sext.w	a4,a5
 c40:	fe043783          	ld	a5,-32(s0)
 c44:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 c46:	fe843783          	ld	a5,-24(s0)
 c4a:	639c                	ld	a5,0(a5)
 c4c:	6398                	ld	a4,0(a5)
 c4e:	fe043783          	ld	a5,-32(s0)
 c52:	e398                	sd	a4,0(a5)
 c54:	a039                	j	c62 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
 c56:	fe843783          	ld	a5,-24(s0)
 c5a:	6398                	ld	a4,0(a5)
 c5c:	fe043783          	ld	a5,-32(s0)
 c60:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 c62:	fe843783          	ld	a5,-24(s0)
 c66:	479c                	lw	a5,8(a5)
 c68:	1782                	slli	a5,a5,0x20
 c6a:	9381                	srli	a5,a5,0x20
 c6c:	0792                	slli	a5,a5,0x4
 c6e:	fe843703          	ld	a4,-24(s0)
 c72:	97ba                	add	a5,a5,a4
 c74:	fe043703          	ld	a4,-32(s0)
 c78:	02f71563          	bne	a4,a5,ca2 <free+0x102>
    p->s.size += bp->s.size;
 c7c:	fe843783          	ld	a5,-24(s0)
 c80:	4798                	lw	a4,8(a5)
 c82:	fe043783          	ld	a5,-32(s0)
 c86:	479c                	lw	a5,8(a5)
 c88:	9fb9                	addw	a5,a5,a4
 c8a:	0007871b          	sext.w	a4,a5
 c8e:	fe843783          	ld	a5,-24(s0)
 c92:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 c94:	fe043783          	ld	a5,-32(s0)
 c98:	6398                	ld	a4,0(a5)
 c9a:	fe843783          	ld	a5,-24(s0)
 c9e:	e398                	sd	a4,0(a5)
 ca0:	a031                	j	cac <free+0x10c>
  } else
    p->s.ptr = bp;
 ca2:	fe843783          	ld	a5,-24(s0)
 ca6:	fe043703          	ld	a4,-32(s0)
 caa:	e398                	sd	a4,0(a5)
  freep = p;
 cac:	00000797          	auipc	a5,0x0
 cb0:	24478793          	addi	a5,a5,580 # ef0 <freep>
 cb4:	fe843703          	ld	a4,-24(s0)
 cb8:	e398                	sd	a4,0(a5)
}
 cba:	0001                	nop
 cbc:	7422                	ld	s0,40(sp)
 cbe:	6145                	addi	sp,sp,48
 cc0:	8082                	ret

0000000000000cc2 <morecore>:

static Header*
morecore(uint nu)
{
 cc2:	7179                	addi	sp,sp,-48
 cc4:	f406                	sd	ra,40(sp)
 cc6:	f022                	sd	s0,32(sp)
 cc8:	1800                	addi	s0,sp,48
 cca:	87aa                	mv	a5,a0
 ccc:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 cd0:	fdc42783          	lw	a5,-36(s0)
 cd4:	0007871b          	sext.w	a4,a5
 cd8:	6785                	lui	a5,0x1
 cda:	00f77563          	bgeu	a4,a5,ce4 <morecore+0x22>
    nu = 4096;
 cde:	6785                	lui	a5,0x1
 ce0:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 ce4:	fdc42783          	lw	a5,-36(s0)
 ce8:	0047979b          	slliw	a5,a5,0x4
 cec:	2781                	sext.w	a5,a5
 cee:	2781                	sext.w	a5,a5
 cf0:	853e                	mv	a0,a5
 cf2:	00000097          	auipc	ra,0x0
 cf6:	9b0080e7          	jalr	-1616(ra) # 6a2 <sbrk>
 cfa:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 cfe:	fe843703          	ld	a4,-24(s0)
 d02:	57fd                	li	a5,-1
 d04:	00f71463          	bne	a4,a5,d0c <morecore+0x4a>
    return 0;
 d08:	4781                	li	a5,0
 d0a:	a03d                	j	d38 <morecore+0x76>
  hp = (Header*)p;
 d0c:	fe843783          	ld	a5,-24(s0)
 d10:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 d14:	fe043783          	ld	a5,-32(s0)
 d18:	fdc42703          	lw	a4,-36(s0)
 d1c:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 d1e:	fe043783          	ld	a5,-32(s0)
 d22:	07c1                	addi	a5,a5,16
 d24:	853e                	mv	a0,a5
 d26:	00000097          	auipc	ra,0x0
 d2a:	e7a080e7          	jalr	-390(ra) # ba0 <free>
  return freep;
 d2e:	00000797          	auipc	a5,0x0
 d32:	1c278793          	addi	a5,a5,450 # ef0 <freep>
 d36:	639c                	ld	a5,0(a5)
}
 d38:	853e                	mv	a0,a5
 d3a:	70a2                	ld	ra,40(sp)
 d3c:	7402                	ld	s0,32(sp)
 d3e:	6145                	addi	sp,sp,48
 d40:	8082                	ret

0000000000000d42 <malloc>:

void*
malloc(uint nbytes)
{
 d42:	7139                	addi	sp,sp,-64
 d44:	fc06                	sd	ra,56(sp)
 d46:	f822                	sd	s0,48(sp)
 d48:	0080                	addi	s0,sp,64
 d4a:	87aa                	mv	a5,a0
 d4c:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d50:	fcc46783          	lwu	a5,-52(s0)
 d54:	07bd                	addi	a5,a5,15
 d56:	8391                	srli	a5,a5,0x4
 d58:	2781                	sext.w	a5,a5
 d5a:	2785                	addiw	a5,a5,1
 d5c:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 d60:	00000797          	auipc	a5,0x0
 d64:	19078793          	addi	a5,a5,400 # ef0 <freep>
 d68:	639c                	ld	a5,0(a5)
 d6a:	fef43023          	sd	a5,-32(s0)
 d6e:	fe043783          	ld	a5,-32(s0)
 d72:	ef95                	bnez	a5,dae <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 d74:	00000797          	auipc	a5,0x0
 d78:	16c78793          	addi	a5,a5,364 # ee0 <base>
 d7c:	fef43023          	sd	a5,-32(s0)
 d80:	00000797          	auipc	a5,0x0
 d84:	17078793          	addi	a5,a5,368 # ef0 <freep>
 d88:	fe043703          	ld	a4,-32(s0)
 d8c:	e398                	sd	a4,0(a5)
 d8e:	00000797          	auipc	a5,0x0
 d92:	16278793          	addi	a5,a5,354 # ef0 <freep>
 d96:	6398                	ld	a4,0(a5)
 d98:	00000797          	auipc	a5,0x0
 d9c:	14878793          	addi	a5,a5,328 # ee0 <base>
 da0:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 da2:	00000797          	auipc	a5,0x0
 da6:	13e78793          	addi	a5,a5,318 # ee0 <base>
 daa:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 dae:	fe043783          	ld	a5,-32(s0)
 db2:	639c                	ld	a5,0(a5)
 db4:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 db8:	fe843783          	ld	a5,-24(s0)
 dbc:	4798                	lw	a4,8(a5)
 dbe:	fdc42783          	lw	a5,-36(s0)
 dc2:	2781                	sext.w	a5,a5
 dc4:	06f76863          	bltu	a4,a5,e34 <malloc+0xf2>
      if(p->s.size == nunits)
 dc8:	fe843783          	ld	a5,-24(s0)
 dcc:	4798                	lw	a4,8(a5)
 dce:	fdc42783          	lw	a5,-36(s0)
 dd2:	2781                	sext.w	a5,a5
 dd4:	00e79963          	bne	a5,a4,de6 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 dd8:	fe843783          	ld	a5,-24(s0)
 ddc:	6398                	ld	a4,0(a5)
 dde:	fe043783          	ld	a5,-32(s0)
 de2:	e398                	sd	a4,0(a5)
 de4:	a82d                	j	e1e <malloc+0xdc>
      else {
        p->s.size -= nunits;
 de6:	fe843783          	ld	a5,-24(s0)
 dea:	4798                	lw	a4,8(a5)
 dec:	fdc42783          	lw	a5,-36(s0)
 df0:	40f707bb          	subw	a5,a4,a5
 df4:	0007871b          	sext.w	a4,a5
 df8:	fe843783          	ld	a5,-24(s0)
 dfc:	c798                	sw	a4,8(a5)
        p += p->s.size;
 dfe:	fe843783          	ld	a5,-24(s0)
 e02:	479c                	lw	a5,8(a5)
 e04:	1782                	slli	a5,a5,0x20
 e06:	9381                	srli	a5,a5,0x20
 e08:	0792                	slli	a5,a5,0x4
 e0a:	fe843703          	ld	a4,-24(s0)
 e0e:	97ba                	add	a5,a5,a4
 e10:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 e14:	fe843783          	ld	a5,-24(s0)
 e18:	fdc42703          	lw	a4,-36(s0)
 e1c:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 e1e:	00000797          	auipc	a5,0x0
 e22:	0d278793          	addi	a5,a5,210 # ef0 <freep>
 e26:	fe043703          	ld	a4,-32(s0)
 e2a:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 e2c:	fe843783          	ld	a5,-24(s0)
 e30:	07c1                	addi	a5,a5,16
 e32:	a091                	j	e76 <malloc+0x134>
    }
    if(p == freep)
 e34:	00000797          	auipc	a5,0x0
 e38:	0bc78793          	addi	a5,a5,188 # ef0 <freep>
 e3c:	639c                	ld	a5,0(a5)
 e3e:	fe843703          	ld	a4,-24(s0)
 e42:	02f71063          	bne	a4,a5,e62 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
 e46:	fdc42783          	lw	a5,-36(s0)
 e4a:	853e                	mv	a0,a5
 e4c:	00000097          	auipc	ra,0x0
 e50:	e76080e7          	jalr	-394(ra) # cc2 <morecore>
 e54:	fea43423          	sd	a0,-24(s0)
 e58:	fe843783          	ld	a5,-24(s0)
 e5c:	e399                	bnez	a5,e62 <malloc+0x120>
        return 0;
 e5e:	4781                	li	a5,0
 e60:	a819                	j	e76 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e62:	fe843783          	ld	a5,-24(s0)
 e66:	fef43023          	sd	a5,-32(s0)
 e6a:	fe843783          	ld	a5,-24(s0)
 e6e:	639c                	ld	a5,0(a5)
 e70:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 e74:	b791                	j	db8 <malloc+0x76>
  }
}
 e76:	853e                	mv	a0,a5
 e78:	70e2                	ld	ra,56(sp)
 e7a:	7442                	ld	s0,48(sp)
 e7c:	6121                	addi	sp,sp,64
 e7e:	8082                	ret
