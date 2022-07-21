
user/_cat:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	1800                	addi	s0,sp,48
   8:	87aa                	mv	a5,a0
   a:	fcf42e23          	sw	a5,-36(s0)
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   e:	a091                	j	52 <cat+0x52>
    if (write(1, buf, n) != n) {
  10:	fec42783          	lw	a5,-20(s0)
  14:	863e                	mv	a2,a5
  16:	00001597          	auipc	a1,0x1
  1a:	eca58593          	addi	a1,a1,-310 # ee0 <buf>
  1e:	4505                	li	a0,1
  20:	00000097          	auipc	ra,0x0
  24:	60e080e7          	jalr	1550(ra) # 62e <write>
  28:	87aa                	mv	a5,a0
  2a:	873e                	mv	a4,a5
  2c:	fec42783          	lw	a5,-20(s0)
  30:	2781                	sext.w	a5,a5
  32:	02e78063          	beq	a5,a4,52 <cat+0x52>
      fprintf(2, "cat: write error\n");
  36:	00001597          	auipc	a1,0x1
  3a:	e4258593          	addi	a1,a1,-446 # e78 <malloc+0x142>
  3e:	4509                	li	a0,2
  40:	00001097          	auipc	ra,0x1
  44:	aac080e7          	jalr	-1364(ra) # aec <fprintf>
      exit(1);
  48:	4505                	li	a0,1
  4a:	00000097          	auipc	ra,0x0
  4e:	5c4080e7          	jalr	1476(ra) # 60e <exit>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  52:	fdc42783          	lw	a5,-36(s0)
  56:	20000613          	li	a2,512
  5a:	00001597          	auipc	a1,0x1
  5e:	e8658593          	addi	a1,a1,-378 # ee0 <buf>
  62:	853e                	mv	a0,a5
  64:	00000097          	auipc	ra,0x0
  68:	5c2080e7          	jalr	1474(ra) # 626 <read>
  6c:	87aa                	mv	a5,a0
  6e:	fef42623          	sw	a5,-20(s0)
  72:	fec42783          	lw	a5,-20(s0)
  76:	2781                	sext.w	a5,a5
  78:	f8f04ce3          	bgtz	a5,10 <cat+0x10>
    }
  }
  if(n < 0){
  7c:	fec42783          	lw	a5,-20(s0)
  80:	2781                	sext.w	a5,a5
  82:	0207d063          	bgez	a5,a2 <cat+0xa2>
    fprintf(2, "cat: read error\n");
  86:	00001597          	auipc	a1,0x1
  8a:	e0a58593          	addi	a1,a1,-502 # e90 <malloc+0x15a>
  8e:	4509                	li	a0,2
  90:	00001097          	auipc	ra,0x1
  94:	a5c080e7          	jalr	-1444(ra) # aec <fprintf>
    exit(1);
  98:	4505                	li	a0,1
  9a:	00000097          	auipc	ra,0x0
  9e:	574080e7          	jalr	1396(ra) # 60e <exit>
  }
}
  a2:	0001                	nop
  a4:	70a2                	ld	ra,40(sp)
  a6:	7402                	ld	s0,32(sp)
  a8:	6145                	addi	sp,sp,48
  aa:	8082                	ret

00000000000000ac <main>:

int
main(int argc, char *argv[])
{
  ac:	7179                	addi	sp,sp,-48
  ae:	f406                	sd	ra,40(sp)
  b0:	f022                	sd	s0,32(sp)
  b2:	1800                	addi	s0,sp,48
  b4:	87aa                	mv	a5,a0
  b6:	fcb43823          	sd	a1,-48(s0)
  ba:	fcf42e23          	sw	a5,-36(s0)
  int fd, i;

  if(argc <= 1){
  be:	fdc42783          	lw	a5,-36(s0)
  c2:	0007871b          	sext.w	a4,a5
  c6:	4785                	li	a5,1
  c8:	00e7cc63          	blt	a5,a4,e0 <main+0x34>
    cat(0);
  cc:	4501                	li	a0,0
  ce:	00000097          	auipc	ra,0x0
  d2:	f32080e7          	jalr	-206(ra) # 0 <cat>
    exit(0);
  d6:	4501                	li	a0,0
  d8:	00000097          	auipc	ra,0x0
  dc:	536080e7          	jalr	1334(ra) # 60e <exit>
  }

  for(i = 1; i < argc; i++){
  e0:	4785                	li	a5,1
  e2:	fef42623          	sw	a5,-20(s0)
  e6:	a8bd                	j	164 <main+0xb8>
    if((fd = open(argv[i], 0)) < 0){
  e8:	fec42783          	lw	a5,-20(s0)
  ec:	078e                	slli	a5,a5,0x3
  ee:	fd043703          	ld	a4,-48(s0)
  f2:	97ba                	add	a5,a5,a4
  f4:	639c                	ld	a5,0(a5)
  f6:	4581                	li	a1,0
  f8:	853e                	mv	a0,a5
  fa:	00000097          	auipc	ra,0x0
  fe:	554080e7          	jalr	1364(ra) # 64e <open>
 102:	87aa                	mv	a5,a0
 104:	fef42423          	sw	a5,-24(s0)
 108:	fe842783          	lw	a5,-24(s0)
 10c:	2781                	sext.w	a5,a5
 10e:	0207d863          	bgez	a5,13e <main+0x92>
      fprintf(2, "cat: cannot open %s\n", argv[i]);
 112:	fec42783          	lw	a5,-20(s0)
 116:	078e                	slli	a5,a5,0x3
 118:	fd043703          	ld	a4,-48(s0)
 11c:	97ba                	add	a5,a5,a4
 11e:	639c                	ld	a5,0(a5)
 120:	863e                	mv	a2,a5
 122:	00001597          	auipc	a1,0x1
 126:	d8658593          	addi	a1,a1,-634 # ea8 <malloc+0x172>
 12a:	4509                	li	a0,2
 12c:	00001097          	auipc	ra,0x1
 130:	9c0080e7          	jalr	-1600(ra) # aec <fprintf>
      exit(1);
 134:	4505                	li	a0,1
 136:	00000097          	auipc	ra,0x0
 13a:	4d8080e7          	jalr	1240(ra) # 60e <exit>
    }
    cat(fd);
 13e:	fe842783          	lw	a5,-24(s0)
 142:	853e                	mv	a0,a5
 144:	00000097          	auipc	ra,0x0
 148:	ebc080e7          	jalr	-324(ra) # 0 <cat>
    close(fd);
 14c:	fe842783          	lw	a5,-24(s0)
 150:	853e                	mv	a0,a5
 152:	00000097          	auipc	ra,0x0
 156:	4e4080e7          	jalr	1252(ra) # 636 <close>
  for(i = 1; i < argc; i++){
 15a:	fec42783          	lw	a5,-20(s0)
 15e:	2785                	addiw	a5,a5,1
 160:	fef42623          	sw	a5,-20(s0)
 164:	fec42703          	lw	a4,-20(s0)
 168:	fdc42783          	lw	a5,-36(s0)
 16c:	2701                	sext.w	a4,a4
 16e:	2781                	sext.w	a5,a5
 170:	f6f74ce3          	blt	a4,a5,e8 <main+0x3c>
  }
  exit(0);
 174:	4501                	li	a0,0
 176:	00000097          	auipc	ra,0x0
 17a:	498080e7          	jalr	1176(ra) # 60e <exit>

000000000000017e <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 17e:	7179                	addi	sp,sp,-48
 180:	f422                	sd	s0,40(sp)
 182:	1800                	addi	s0,sp,48
 184:	fca43c23          	sd	a0,-40(s0)
 188:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
 18c:	fd843783          	ld	a5,-40(s0)
 190:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
 194:	0001                	nop
 196:	fd043703          	ld	a4,-48(s0)
 19a:	00170793          	addi	a5,a4,1
 19e:	fcf43823          	sd	a5,-48(s0)
 1a2:	fd843783          	ld	a5,-40(s0)
 1a6:	00178693          	addi	a3,a5,1
 1aa:	fcd43c23          	sd	a3,-40(s0)
 1ae:	00074703          	lbu	a4,0(a4)
 1b2:	00e78023          	sb	a4,0(a5)
 1b6:	0007c783          	lbu	a5,0(a5)
 1ba:	fff1                	bnez	a5,196 <strcpy+0x18>
    ;
  return os;
 1bc:	fe843783          	ld	a5,-24(s0)
}
 1c0:	853e                	mv	a0,a5
 1c2:	7422                	ld	s0,40(sp)
 1c4:	6145                	addi	sp,sp,48
 1c6:	8082                	ret

00000000000001c8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c8:	1101                	addi	sp,sp,-32
 1ca:	ec22                	sd	s0,24(sp)
 1cc:	1000                	addi	s0,sp,32
 1ce:	fea43423          	sd	a0,-24(s0)
 1d2:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
 1d6:	a819                	j	1ec <strcmp+0x24>
    p++, q++;
 1d8:	fe843783          	ld	a5,-24(s0)
 1dc:	0785                	addi	a5,a5,1
 1de:	fef43423          	sd	a5,-24(s0)
 1e2:	fe043783          	ld	a5,-32(s0)
 1e6:	0785                	addi	a5,a5,1
 1e8:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
 1ec:	fe843783          	ld	a5,-24(s0)
 1f0:	0007c783          	lbu	a5,0(a5)
 1f4:	cb99                	beqz	a5,20a <strcmp+0x42>
 1f6:	fe843783          	ld	a5,-24(s0)
 1fa:	0007c703          	lbu	a4,0(a5)
 1fe:	fe043783          	ld	a5,-32(s0)
 202:	0007c783          	lbu	a5,0(a5)
 206:	fcf709e3          	beq	a4,a5,1d8 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
 20a:	fe843783          	ld	a5,-24(s0)
 20e:	0007c783          	lbu	a5,0(a5)
 212:	0007871b          	sext.w	a4,a5
 216:	fe043783          	ld	a5,-32(s0)
 21a:	0007c783          	lbu	a5,0(a5)
 21e:	2781                	sext.w	a5,a5
 220:	40f707bb          	subw	a5,a4,a5
 224:	2781                	sext.w	a5,a5
}
 226:	853e                	mv	a0,a5
 228:	6462                	ld	s0,24(sp)
 22a:	6105                	addi	sp,sp,32
 22c:	8082                	ret

000000000000022e <strlen>:

uint
strlen(const char *s)
{
 22e:	7179                	addi	sp,sp,-48
 230:	f422                	sd	s0,40(sp)
 232:	1800                	addi	s0,sp,48
 234:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
 238:	fe042623          	sw	zero,-20(s0)
 23c:	a031                	j	248 <strlen+0x1a>
 23e:	fec42783          	lw	a5,-20(s0)
 242:	2785                	addiw	a5,a5,1
 244:	fef42623          	sw	a5,-20(s0)
 248:	fec42783          	lw	a5,-20(s0)
 24c:	fd843703          	ld	a4,-40(s0)
 250:	97ba                	add	a5,a5,a4
 252:	0007c783          	lbu	a5,0(a5)
 256:	f7e5                	bnez	a5,23e <strlen+0x10>
    ;
  return n;
 258:	fec42783          	lw	a5,-20(s0)
}
 25c:	853e                	mv	a0,a5
 25e:	7422                	ld	s0,40(sp)
 260:	6145                	addi	sp,sp,48
 262:	8082                	ret

0000000000000264 <memset>:

void*
memset(void *dst, int c, uint n)
{
 264:	7179                	addi	sp,sp,-48
 266:	f422                	sd	s0,40(sp)
 268:	1800                	addi	s0,sp,48
 26a:	fca43c23          	sd	a0,-40(s0)
 26e:	87ae                	mv	a5,a1
 270:	8732                	mv	a4,a2
 272:	fcf42a23          	sw	a5,-44(s0)
 276:	87ba                	mv	a5,a4
 278:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 27c:	fd843783          	ld	a5,-40(s0)
 280:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 284:	fe042623          	sw	zero,-20(s0)
 288:	a00d                	j	2aa <memset+0x46>
    cdst[i] = c;
 28a:	fec42783          	lw	a5,-20(s0)
 28e:	fe043703          	ld	a4,-32(s0)
 292:	97ba                	add	a5,a5,a4
 294:	fd442703          	lw	a4,-44(s0)
 298:	0ff77713          	andi	a4,a4,255
 29c:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 2a0:	fec42783          	lw	a5,-20(s0)
 2a4:	2785                	addiw	a5,a5,1
 2a6:	fef42623          	sw	a5,-20(s0)
 2aa:	fec42703          	lw	a4,-20(s0)
 2ae:	fd042783          	lw	a5,-48(s0)
 2b2:	2781                	sext.w	a5,a5
 2b4:	fcf76be3          	bltu	a4,a5,28a <memset+0x26>
  }
  return dst;
 2b8:	fd843783          	ld	a5,-40(s0)
}
 2bc:	853e                	mv	a0,a5
 2be:	7422                	ld	s0,40(sp)
 2c0:	6145                	addi	sp,sp,48
 2c2:	8082                	ret

00000000000002c4 <strchr>:

char*
strchr(const char *s, char c)
{
 2c4:	1101                	addi	sp,sp,-32
 2c6:	ec22                	sd	s0,24(sp)
 2c8:	1000                	addi	s0,sp,32
 2ca:	fea43423          	sd	a0,-24(s0)
 2ce:	87ae                	mv	a5,a1
 2d0:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 2d4:	a01d                	j	2fa <strchr+0x36>
    if(*s == c)
 2d6:	fe843783          	ld	a5,-24(s0)
 2da:	0007c703          	lbu	a4,0(a5)
 2de:	fe744783          	lbu	a5,-25(s0)
 2e2:	0ff7f793          	andi	a5,a5,255
 2e6:	00e79563          	bne	a5,a4,2f0 <strchr+0x2c>
      return (char*)s;
 2ea:	fe843783          	ld	a5,-24(s0)
 2ee:	a821                	j	306 <strchr+0x42>
  for(; *s; s++)
 2f0:	fe843783          	ld	a5,-24(s0)
 2f4:	0785                	addi	a5,a5,1
 2f6:	fef43423          	sd	a5,-24(s0)
 2fa:	fe843783          	ld	a5,-24(s0)
 2fe:	0007c783          	lbu	a5,0(a5)
 302:	fbf1                	bnez	a5,2d6 <strchr+0x12>
  return 0;
 304:	4781                	li	a5,0
}
 306:	853e                	mv	a0,a5
 308:	6462                	ld	s0,24(sp)
 30a:	6105                	addi	sp,sp,32
 30c:	8082                	ret

000000000000030e <gets>:

char*
gets(char *buf, int max)
{
 30e:	7179                	addi	sp,sp,-48
 310:	f406                	sd	ra,40(sp)
 312:	f022                	sd	s0,32(sp)
 314:	1800                	addi	s0,sp,48
 316:	fca43c23          	sd	a0,-40(s0)
 31a:	87ae                	mv	a5,a1
 31c:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 320:	fe042623          	sw	zero,-20(s0)
 324:	a8a1                	j	37c <gets+0x6e>
    cc = read(0, &c, 1);
 326:	fe740793          	addi	a5,s0,-25
 32a:	4605                	li	a2,1
 32c:	85be                	mv	a1,a5
 32e:	4501                	li	a0,0
 330:	00000097          	auipc	ra,0x0
 334:	2f6080e7          	jalr	758(ra) # 626 <read>
 338:	87aa                	mv	a5,a0
 33a:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 33e:	fe842783          	lw	a5,-24(s0)
 342:	2781                	sext.w	a5,a5
 344:	04f05763          	blez	a5,392 <gets+0x84>
      break;
    buf[i++] = c;
 348:	fec42783          	lw	a5,-20(s0)
 34c:	0017871b          	addiw	a4,a5,1
 350:	fee42623          	sw	a4,-20(s0)
 354:	873e                	mv	a4,a5
 356:	fd843783          	ld	a5,-40(s0)
 35a:	97ba                	add	a5,a5,a4
 35c:	fe744703          	lbu	a4,-25(s0)
 360:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 364:	fe744783          	lbu	a5,-25(s0)
 368:	873e                	mv	a4,a5
 36a:	47a9                	li	a5,10
 36c:	02f70463          	beq	a4,a5,394 <gets+0x86>
 370:	fe744783          	lbu	a5,-25(s0)
 374:	873e                	mv	a4,a5
 376:	47b5                	li	a5,13
 378:	00f70e63          	beq	a4,a5,394 <gets+0x86>
  for(i=0; i+1 < max; ){
 37c:	fec42783          	lw	a5,-20(s0)
 380:	2785                	addiw	a5,a5,1
 382:	0007871b          	sext.w	a4,a5
 386:	fd442783          	lw	a5,-44(s0)
 38a:	2781                	sext.w	a5,a5
 38c:	f8f74de3          	blt	a4,a5,326 <gets+0x18>
 390:	a011                	j	394 <gets+0x86>
      break;
 392:	0001                	nop
      break;
  }
  buf[i] = '\0';
 394:	fec42783          	lw	a5,-20(s0)
 398:	fd843703          	ld	a4,-40(s0)
 39c:	97ba                	add	a5,a5,a4
 39e:	00078023          	sb	zero,0(a5)
  return buf;
 3a2:	fd843783          	ld	a5,-40(s0)
}
 3a6:	853e                	mv	a0,a5
 3a8:	70a2                	ld	ra,40(sp)
 3aa:	7402                	ld	s0,32(sp)
 3ac:	6145                	addi	sp,sp,48
 3ae:	8082                	ret

00000000000003b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3b0:	7179                	addi	sp,sp,-48
 3b2:	f406                	sd	ra,40(sp)
 3b4:	f022                	sd	s0,32(sp)
 3b6:	1800                	addi	s0,sp,48
 3b8:	fca43c23          	sd	a0,-40(s0)
 3bc:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c0:	4581                	li	a1,0
 3c2:	fd843503          	ld	a0,-40(s0)
 3c6:	00000097          	auipc	ra,0x0
 3ca:	288080e7          	jalr	648(ra) # 64e <open>
 3ce:	87aa                	mv	a5,a0
 3d0:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 3d4:	fec42783          	lw	a5,-20(s0)
 3d8:	2781                	sext.w	a5,a5
 3da:	0007d463          	bgez	a5,3e2 <stat+0x32>
    return -1;
 3de:	57fd                	li	a5,-1
 3e0:	a035                	j	40c <stat+0x5c>
  r = fstat(fd, st);
 3e2:	fec42783          	lw	a5,-20(s0)
 3e6:	fd043583          	ld	a1,-48(s0)
 3ea:	853e                	mv	a0,a5
 3ec:	00000097          	auipc	ra,0x0
 3f0:	27a080e7          	jalr	634(ra) # 666 <fstat>
 3f4:	87aa                	mv	a5,a0
 3f6:	fef42423          	sw	a5,-24(s0)
  close(fd);
 3fa:	fec42783          	lw	a5,-20(s0)
 3fe:	853e                	mv	a0,a5
 400:	00000097          	auipc	ra,0x0
 404:	236080e7          	jalr	566(ra) # 636 <close>
  return r;
 408:	fe842783          	lw	a5,-24(s0)
}
 40c:	853e                	mv	a0,a5
 40e:	70a2                	ld	ra,40(sp)
 410:	7402                	ld	s0,32(sp)
 412:	6145                	addi	sp,sp,48
 414:	8082                	ret

0000000000000416 <atoi>:

int
atoi(const char *s)
{
 416:	7179                	addi	sp,sp,-48
 418:	f422                	sd	s0,40(sp)
 41a:	1800                	addi	s0,sp,48
 41c:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 420:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 424:	a815                	j	458 <atoi+0x42>
    n = n*10 + *s++ - '0';
 426:	fec42703          	lw	a4,-20(s0)
 42a:	87ba                	mv	a5,a4
 42c:	0027979b          	slliw	a5,a5,0x2
 430:	9fb9                	addw	a5,a5,a4
 432:	0017979b          	slliw	a5,a5,0x1
 436:	0007871b          	sext.w	a4,a5
 43a:	fd843783          	ld	a5,-40(s0)
 43e:	00178693          	addi	a3,a5,1
 442:	fcd43c23          	sd	a3,-40(s0)
 446:	0007c783          	lbu	a5,0(a5)
 44a:	2781                	sext.w	a5,a5
 44c:	9fb9                	addw	a5,a5,a4
 44e:	2781                	sext.w	a5,a5
 450:	fd07879b          	addiw	a5,a5,-48
 454:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 458:	fd843783          	ld	a5,-40(s0)
 45c:	0007c783          	lbu	a5,0(a5)
 460:	873e                	mv	a4,a5
 462:	02f00793          	li	a5,47
 466:	00e7fb63          	bgeu	a5,a4,47c <atoi+0x66>
 46a:	fd843783          	ld	a5,-40(s0)
 46e:	0007c783          	lbu	a5,0(a5)
 472:	873e                	mv	a4,a5
 474:	03900793          	li	a5,57
 478:	fae7f7e3          	bgeu	a5,a4,426 <atoi+0x10>
  return n;
 47c:	fec42783          	lw	a5,-20(s0)
}
 480:	853e                	mv	a0,a5
 482:	7422                	ld	s0,40(sp)
 484:	6145                	addi	sp,sp,48
 486:	8082                	ret

0000000000000488 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 488:	7139                	addi	sp,sp,-64
 48a:	fc22                	sd	s0,56(sp)
 48c:	0080                	addi	s0,sp,64
 48e:	fca43c23          	sd	a0,-40(s0)
 492:	fcb43823          	sd	a1,-48(s0)
 496:	87b2                	mv	a5,a2
 498:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 49c:	fd843783          	ld	a5,-40(s0)
 4a0:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 4a4:	fd043783          	ld	a5,-48(s0)
 4a8:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 4ac:	fe043703          	ld	a4,-32(s0)
 4b0:	fe843783          	ld	a5,-24(s0)
 4b4:	02e7fc63          	bgeu	a5,a4,4ec <memmove+0x64>
    while(n-- > 0)
 4b8:	a00d                	j	4da <memmove+0x52>
      *dst++ = *src++;
 4ba:	fe043703          	ld	a4,-32(s0)
 4be:	00170793          	addi	a5,a4,1
 4c2:	fef43023          	sd	a5,-32(s0)
 4c6:	fe843783          	ld	a5,-24(s0)
 4ca:	00178693          	addi	a3,a5,1
 4ce:	fed43423          	sd	a3,-24(s0)
 4d2:	00074703          	lbu	a4,0(a4)
 4d6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 4da:	fcc42783          	lw	a5,-52(s0)
 4de:	fff7871b          	addiw	a4,a5,-1
 4e2:	fce42623          	sw	a4,-52(s0)
 4e6:	fcf04ae3          	bgtz	a5,4ba <memmove+0x32>
 4ea:	a891                	j	53e <memmove+0xb6>
  } else {
    dst += n;
 4ec:	fcc42783          	lw	a5,-52(s0)
 4f0:	fe843703          	ld	a4,-24(s0)
 4f4:	97ba                	add	a5,a5,a4
 4f6:	fef43423          	sd	a5,-24(s0)
    src += n;
 4fa:	fcc42783          	lw	a5,-52(s0)
 4fe:	fe043703          	ld	a4,-32(s0)
 502:	97ba                	add	a5,a5,a4
 504:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 508:	a01d                	j	52e <memmove+0xa6>
      *--dst = *--src;
 50a:	fe043783          	ld	a5,-32(s0)
 50e:	17fd                	addi	a5,a5,-1
 510:	fef43023          	sd	a5,-32(s0)
 514:	fe843783          	ld	a5,-24(s0)
 518:	17fd                	addi	a5,a5,-1
 51a:	fef43423          	sd	a5,-24(s0)
 51e:	fe043783          	ld	a5,-32(s0)
 522:	0007c703          	lbu	a4,0(a5)
 526:	fe843783          	ld	a5,-24(s0)
 52a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 52e:	fcc42783          	lw	a5,-52(s0)
 532:	fff7871b          	addiw	a4,a5,-1
 536:	fce42623          	sw	a4,-52(s0)
 53a:	fcf048e3          	bgtz	a5,50a <memmove+0x82>
  }
  return vdst;
 53e:	fd843783          	ld	a5,-40(s0)
}
 542:	853e                	mv	a0,a5
 544:	7462                	ld	s0,56(sp)
 546:	6121                	addi	sp,sp,64
 548:	8082                	ret

000000000000054a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 54a:	7139                	addi	sp,sp,-64
 54c:	fc22                	sd	s0,56(sp)
 54e:	0080                	addi	s0,sp,64
 550:	fca43c23          	sd	a0,-40(s0)
 554:	fcb43823          	sd	a1,-48(s0)
 558:	87b2                	mv	a5,a2
 55a:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 55e:	fd843783          	ld	a5,-40(s0)
 562:	fef43423          	sd	a5,-24(s0)
 566:	fd043783          	ld	a5,-48(s0)
 56a:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 56e:	a0a1                	j	5b6 <memcmp+0x6c>
    if (*p1 != *p2) {
 570:	fe843783          	ld	a5,-24(s0)
 574:	0007c703          	lbu	a4,0(a5)
 578:	fe043783          	ld	a5,-32(s0)
 57c:	0007c783          	lbu	a5,0(a5)
 580:	02f70163          	beq	a4,a5,5a2 <memcmp+0x58>
      return *p1 - *p2;
 584:	fe843783          	ld	a5,-24(s0)
 588:	0007c783          	lbu	a5,0(a5)
 58c:	0007871b          	sext.w	a4,a5
 590:	fe043783          	ld	a5,-32(s0)
 594:	0007c783          	lbu	a5,0(a5)
 598:	2781                	sext.w	a5,a5
 59a:	40f707bb          	subw	a5,a4,a5
 59e:	2781                	sext.w	a5,a5
 5a0:	a01d                	j	5c6 <memcmp+0x7c>
    }
    p1++;
 5a2:	fe843783          	ld	a5,-24(s0)
 5a6:	0785                	addi	a5,a5,1
 5a8:	fef43423          	sd	a5,-24(s0)
    p2++;
 5ac:	fe043783          	ld	a5,-32(s0)
 5b0:	0785                	addi	a5,a5,1
 5b2:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 5b6:	fcc42783          	lw	a5,-52(s0)
 5ba:	fff7871b          	addiw	a4,a5,-1
 5be:	fce42623          	sw	a4,-52(s0)
 5c2:	f7dd                	bnez	a5,570 <memcmp+0x26>
  }
  return 0;
 5c4:	4781                	li	a5,0
}
 5c6:	853e                	mv	a0,a5
 5c8:	7462                	ld	s0,56(sp)
 5ca:	6121                	addi	sp,sp,64
 5cc:	8082                	ret

00000000000005ce <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 5ce:	7179                	addi	sp,sp,-48
 5d0:	f406                	sd	ra,40(sp)
 5d2:	f022                	sd	s0,32(sp)
 5d4:	1800                	addi	s0,sp,48
 5d6:	fea43423          	sd	a0,-24(s0)
 5da:	feb43023          	sd	a1,-32(s0)
 5de:	87b2                	mv	a5,a2
 5e0:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 5e4:	fdc42783          	lw	a5,-36(s0)
 5e8:	863e                	mv	a2,a5
 5ea:	fe043583          	ld	a1,-32(s0)
 5ee:	fe843503          	ld	a0,-24(s0)
 5f2:	00000097          	auipc	ra,0x0
 5f6:	e96080e7          	jalr	-362(ra) # 488 <memmove>
 5fa:	87aa                	mv	a5,a0
}
 5fc:	853e                	mv	a0,a5
 5fe:	70a2                	ld	ra,40(sp)
 600:	7402                	ld	s0,32(sp)
 602:	6145                	addi	sp,sp,48
 604:	8082                	ret

0000000000000606 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 606:	4885                	li	a7,1
 ecall
 608:	00000073          	ecall
 ret
 60c:	8082                	ret

000000000000060e <exit>:
.global exit
exit:
 li a7, SYS_exit
 60e:	4889                	li	a7,2
 ecall
 610:	00000073          	ecall
 ret
 614:	8082                	ret

0000000000000616 <wait>:
.global wait
wait:
 li a7, SYS_wait
 616:	488d                	li	a7,3
 ecall
 618:	00000073          	ecall
 ret
 61c:	8082                	ret

000000000000061e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 61e:	4891                	li	a7,4
 ecall
 620:	00000073          	ecall
 ret
 624:	8082                	ret

0000000000000626 <read>:
.global read
read:
 li a7, SYS_read
 626:	4895                	li	a7,5
 ecall
 628:	00000073          	ecall
 ret
 62c:	8082                	ret

000000000000062e <write>:
.global write
write:
 li a7, SYS_write
 62e:	48c1                	li	a7,16
 ecall
 630:	00000073          	ecall
 ret
 634:	8082                	ret

0000000000000636 <close>:
.global close
close:
 li a7, SYS_close
 636:	48d5                	li	a7,21
 ecall
 638:	00000073          	ecall
 ret
 63c:	8082                	ret

000000000000063e <kill>:
.global kill
kill:
 li a7, SYS_kill
 63e:	4899                	li	a7,6
 ecall
 640:	00000073          	ecall
 ret
 644:	8082                	ret

0000000000000646 <exec>:
.global exec
exec:
 li a7, SYS_exec
 646:	489d                	li	a7,7
 ecall
 648:	00000073          	ecall
 ret
 64c:	8082                	ret

000000000000064e <open>:
.global open
open:
 li a7, SYS_open
 64e:	48bd                	li	a7,15
 ecall
 650:	00000073          	ecall
 ret
 654:	8082                	ret

0000000000000656 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 656:	48c5                	li	a7,17
 ecall
 658:	00000073          	ecall
 ret
 65c:	8082                	ret

000000000000065e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 65e:	48c9                	li	a7,18
 ecall
 660:	00000073          	ecall
 ret
 664:	8082                	ret

0000000000000666 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 666:	48a1                	li	a7,8
 ecall
 668:	00000073          	ecall
 ret
 66c:	8082                	ret

000000000000066e <link>:
.global link
link:
 li a7, SYS_link
 66e:	48cd                	li	a7,19
 ecall
 670:	00000073          	ecall
 ret
 674:	8082                	ret

0000000000000676 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 676:	48d1                	li	a7,20
 ecall
 678:	00000073          	ecall
 ret
 67c:	8082                	ret

000000000000067e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 67e:	48a5                	li	a7,9
 ecall
 680:	00000073          	ecall
 ret
 684:	8082                	ret

0000000000000686 <dup>:
.global dup
dup:
 li a7, SYS_dup
 686:	48a9                	li	a7,10
 ecall
 688:	00000073          	ecall
 ret
 68c:	8082                	ret

000000000000068e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 68e:	48ad                	li	a7,11
 ecall
 690:	00000073          	ecall
 ret
 694:	8082                	ret

0000000000000696 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 696:	48b1                	li	a7,12
 ecall
 698:	00000073          	ecall
 ret
 69c:	8082                	ret

000000000000069e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 69e:	48b5                	li	a7,13
 ecall
 6a0:	00000073          	ecall
 ret
 6a4:	8082                	ret

00000000000006a6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 6a6:	48b9                	li	a7,14
 ecall
 6a8:	00000073          	ecall
 ret
 6ac:	8082                	ret

00000000000006ae <setSchedAlg>:
.global setSchedAlg
setSchedAlg:
 li a7, SYS_setSchedAlg
 6ae:	48d9                	li	a7,22
 ecall
 6b0:	00000073          	ecall
 ret
 6b4:	8082                	ret

00000000000006b6 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 6b6:	1101                	addi	sp,sp,-32
 6b8:	ec06                	sd	ra,24(sp)
 6ba:	e822                	sd	s0,16(sp)
 6bc:	1000                	addi	s0,sp,32
 6be:	87aa                	mv	a5,a0
 6c0:	872e                	mv	a4,a1
 6c2:	fef42623          	sw	a5,-20(s0)
 6c6:	87ba                	mv	a5,a4
 6c8:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 6cc:	feb40713          	addi	a4,s0,-21
 6d0:	fec42783          	lw	a5,-20(s0)
 6d4:	4605                	li	a2,1
 6d6:	85ba                	mv	a1,a4
 6d8:	853e                	mv	a0,a5
 6da:	00000097          	auipc	ra,0x0
 6de:	f54080e7          	jalr	-172(ra) # 62e <write>
}
 6e2:	0001                	nop
 6e4:	60e2                	ld	ra,24(sp)
 6e6:	6442                	ld	s0,16(sp)
 6e8:	6105                	addi	sp,sp,32
 6ea:	8082                	ret

00000000000006ec <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6ec:	7139                	addi	sp,sp,-64
 6ee:	fc06                	sd	ra,56(sp)
 6f0:	f822                	sd	s0,48(sp)
 6f2:	0080                	addi	s0,sp,64
 6f4:	87aa                	mv	a5,a0
 6f6:	8736                	mv	a4,a3
 6f8:	fcf42623          	sw	a5,-52(s0)
 6fc:	87ae                	mv	a5,a1
 6fe:	fcf42423          	sw	a5,-56(s0)
 702:	87b2                	mv	a5,a2
 704:	fcf42223          	sw	a5,-60(s0)
 708:	87ba                	mv	a5,a4
 70a:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 70e:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 712:	fc042783          	lw	a5,-64(s0)
 716:	2781                	sext.w	a5,a5
 718:	c38d                	beqz	a5,73a <printint+0x4e>
 71a:	fc842783          	lw	a5,-56(s0)
 71e:	2781                	sext.w	a5,a5
 720:	0007dd63          	bgez	a5,73a <printint+0x4e>
    neg = 1;
 724:	4785                	li	a5,1
 726:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 72a:	fc842783          	lw	a5,-56(s0)
 72e:	40f007bb          	negw	a5,a5
 732:	2781                	sext.w	a5,a5
 734:	fef42223          	sw	a5,-28(s0)
 738:	a029                	j	742 <printint+0x56>
  } else {
    x = xx;
 73a:	fc842783          	lw	a5,-56(s0)
 73e:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 742:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 746:	fc442783          	lw	a5,-60(s0)
 74a:	fe442703          	lw	a4,-28(s0)
 74e:	02f777bb          	remuw	a5,a4,a5
 752:	0007861b          	sext.w	a2,a5
 756:	fec42783          	lw	a5,-20(s0)
 75a:	0017871b          	addiw	a4,a5,1
 75e:	fee42623          	sw	a4,-20(s0)
 762:	00000697          	auipc	a3,0x0
 766:	76668693          	addi	a3,a3,1894 # ec8 <digits>
 76a:	02061713          	slli	a4,a2,0x20
 76e:	9301                	srli	a4,a4,0x20
 770:	9736                	add	a4,a4,a3
 772:	00074703          	lbu	a4,0(a4)
 776:	ff040693          	addi	a3,s0,-16
 77a:	97b6                	add	a5,a5,a3
 77c:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 780:	fc442783          	lw	a5,-60(s0)
 784:	fe442703          	lw	a4,-28(s0)
 788:	02f757bb          	divuw	a5,a4,a5
 78c:	fef42223          	sw	a5,-28(s0)
 790:	fe442783          	lw	a5,-28(s0)
 794:	2781                	sext.w	a5,a5
 796:	fbc5                	bnez	a5,746 <printint+0x5a>
  if(neg)
 798:	fe842783          	lw	a5,-24(s0)
 79c:	2781                	sext.w	a5,a5
 79e:	cf95                	beqz	a5,7da <printint+0xee>
    buf[i++] = '-';
 7a0:	fec42783          	lw	a5,-20(s0)
 7a4:	0017871b          	addiw	a4,a5,1
 7a8:	fee42623          	sw	a4,-20(s0)
 7ac:	ff040713          	addi	a4,s0,-16
 7b0:	97ba                	add	a5,a5,a4
 7b2:	02d00713          	li	a4,45
 7b6:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 7ba:	a005                	j	7da <printint+0xee>
    putc(fd, buf[i]);
 7bc:	fec42783          	lw	a5,-20(s0)
 7c0:	ff040713          	addi	a4,s0,-16
 7c4:	97ba                	add	a5,a5,a4
 7c6:	fe07c703          	lbu	a4,-32(a5)
 7ca:	fcc42783          	lw	a5,-52(s0)
 7ce:	85ba                	mv	a1,a4
 7d0:	853e                	mv	a0,a5
 7d2:	00000097          	auipc	ra,0x0
 7d6:	ee4080e7          	jalr	-284(ra) # 6b6 <putc>
  while(--i >= 0)
 7da:	fec42783          	lw	a5,-20(s0)
 7de:	37fd                	addiw	a5,a5,-1
 7e0:	fef42623          	sw	a5,-20(s0)
 7e4:	fec42783          	lw	a5,-20(s0)
 7e8:	2781                	sext.w	a5,a5
 7ea:	fc07d9e3          	bgez	a5,7bc <printint+0xd0>
}
 7ee:	0001                	nop
 7f0:	0001                	nop
 7f2:	70e2                	ld	ra,56(sp)
 7f4:	7442                	ld	s0,48(sp)
 7f6:	6121                	addi	sp,sp,64
 7f8:	8082                	ret

00000000000007fa <printptr>:

static void
printptr(int fd, uint64 x) {
 7fa:	7179                	addi	sp,sp,-48
 7fc:	f406                	sd	ra,40(sp)
 7fe:	f022                	sd	s0,32(sp)
 800:	1800                	addi	s0,sp,48
 802:	87aa                	mv	a5,a0
 804:	fcb43823          	sd	a1,-48(s0)
 808:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 80c:	fdc42783          	lw	a5,-36(s0)
 810:	03000593          	li	a1,48
 814:	853e                	mv	a0,a5
 816:	00000097          	auipc	ra,0x0
 81a:	ea0080e7          	jalr	-352(ra) # 6b6 <putc>
  putc(fd, 'x');
 81e:	fdc42783          	lw	a5,-36(s0)
 822:	07800593          	li	a1,120
 826:	853e                	mv	a0,a5
 828:	00000097          	auipc	ra,0x0
 82c:	e8e080e7          	jalr	-370(ra) # 6b6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 830:	fe042623          	sw	zero,-20(s0)
 834:	a82d                	j	86e <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 836:	fd043783          	ld	a5,-48(s0)
 83a:	93f1                	srli	a5,a5,0x3c
 83c:	00000717          	auipc	a4,0x0
 840:	68c70713          	addi	a4,a4,1676 # ec8 <digits>
 844:	97ba                	add	a5,a5,a4
 846:	0007c703          	lbu	a4,0(a5)
 84a:	fdc42783          	lw	a5,-36(s0)
 84e:	85ba                	mv	a1,a4
 850:	853e                	mv	a0,a5
 852:	00000097          	auipc	ra,0x0
 856:	e64080e7          	jalr	-412(ra) # 6b6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 85a:	fec42783          	lw	a5,-20(s0)
 85e:	2785                	addiw	a5,a5,1
 860:	fef42623          	sw	a5,-20(s0)
 864:	fd043783          	ld	a5,-48(s0)
 868:	0792                	slli	a5,a5,0x4
 86a:	fcf43823          	sd	a5,-48(s0)
 86e:	fec42783          	lw	a5,-20(s0)
 872:	873e                	mv	a4,a5
 874:	47bd                	li	a5,15
 876:	fce7f0e3          	bgeu	a5,a4,836 <printptr+0x3c>
}
 87a:	0001                	nop
 87c:	0001                	nop
 87e:	70a2                	ld	ra,40(sp)
 880:	7402                	ld	s0,32(sp)
 882:	6145                	addi	sp,sp,48
 884:	8082                	ret

0000000000000886 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 886:	715d                	addi	sp,sp,-80
 888:	e486                	sd	ra,72(sp)
 88a:	e0a2                	sd	s0,64(sp)
 88c:	0880                	addi	s0,sp,80
 88e:	87aa                	mv	a5,a0
 890:	fcb43023          	sd	a1,-64(s0)
 894:	fac43c23          	sd	a2,-72(s0)
 898:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 89c:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 8a0:	fe042223          	sw	zero,-28(s0)
 8a4:	a42d                	j	ace <vprintf+0x248>
    c = fmt[i] & 0xff;
 8a6:	fe442783          	lw	a5,-28(s0)
 8aa:	fc043703          	ld	a4,-64(s0)
 8ae:	97ba                	add	a5,a5,a4
 8b0:	0007c783          	lbu	a5,0(a5)
 8b4:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 8b8:	fe042783          	lw	a5,-32(s0)
 8bc:	2781                	sext.w	a5,a5
 8be:	eb9d                	bnez	a5,8f4 <vprintf+0x6e>
      if(c == '%'){
 8c0:	fdc42783          	lw	a5,-36(s0)
 8c4:	0007871b          	sext.w	a4,a5
 8c8:	02500793          	li	a5,37
 8cc:	00f71763          	bne	a4,a5,8da <vprintf+0x54>
        state = '%';
 8d0:	02500793          	li	a5,37
 8d4:	fef42023          	sw	a5,-32(s0)
 8d8:	a2f5                	j	ac4 <vprintf+0x23e>
      } else {
        putc(fd, c);
 8da:	fdc42783          	lw	a5,-36(s0)
 8de:	0ff7f713          	andi	a4,a5,255
 8e2:	fcc42783          	lw	a5,-52(s0)
 8e6:	85ba                	mv	a1,a4
 8e8:	853e                	mv	a0,a5
 8ea:	00000097          	auipc	ra,0x0
 8ee:	dcc080e7          	jalr	-564(ra) # 6b6 <putc>
 8f2:	aac9                	j	ac4 <vprintf+0x23e>
      }
    } else if(state == '%'){
 8f4:	fe042783          	lw	a5,-32(s0)
 8f8:	0007871b          	sext.w	a4,a5
 8fc:	02500793          	li	a5,37
 900:	1cf71263          	bne	a4,a5,ac4 <vprintf+0x23e>
      if(c == 'd'){
 904:	fdc42783          	lw	a5,-36(s0)
 908:	0007871b          	sext.w	a4,a5
 90c:	06400793          	li	a5,100
 910:	02f71463          	bne	a4,a5,938 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 914:	fb843783          	ld	a5,-72(s0)
 918:	00878713          	addi	a4,a5,8
 91c:	fae43c23          	sd	a4,-72(s0)
 920:	4398                	lw	a4,0(a5)
 922:	fcc42783          	lw	a5,-52(s0)
 926:	4685                	li	a3,1
 928:	4629                	li	a2,10
 92a:	85ba                	mv	a1,a4
 92c:	853e                	mv	a0,a5
 92e:	00000097          	auipc	ra,0x0
 932:	dbe080e7          	jalr	-578(ra) # 6ec <printint>
 936:	a269                	j	ac0 <vprintf+0x23a>
      } else if(c == 'l') {
 938:	fdc42783          	lw	a5,-36(s0)
 93c:	0007871b          	sext.w	a4,a5
 940:	06c00793          	li	a5,108
 944:	02f71663          	bne	a4,a5,970 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 948:	fb843783          	ld	a5,-72(s0)
 94c:	00878713          	addi	a4,a5,8
 950:	fae43c23          	sd	a4,-72(s0)
 954:	639c                	ld	a5,0(a5)
 956:	0007871b          	sext.w	a4,a5
 95a:	fcc42783          	lw	a5,-52(s0)
 95e:	4681                	li	a3,0
 960:	4629                	li	a2,10
 962:	85ba                	mv	a1,a4
 964:	853e                	mv	a0,a5
 966:	00000097          	auipc	ra,0x0
 96a:	d86080e7          	jalr	-634(ra) # 6ec <printint>
 96e:	aa89                	j	ac0 <vprintf+0x23a>
      } else if(c == 'x') {
 970:	fdc42783          	lw	a5,-36(s0)
 974:	0007871b          	sext.w	a4,a5
 978:	07800793          	li	a5,120
 97c:	02f71463          	bne	a4,a5,9a4 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 980:	fb843783          	ld	a5,-72(s0)
 984:	00878713          	addi	a4,a5,8
 988:	fae43c23          	sd	a4,-72(s0)
 98c:	4398                	lw	a4,0(a5)
 98e:	fcc42783          	lw	a5,-52(s0)
 992:	4681                	li	a3,0
 994:	4641                	li	a2,16
 996:	85ba                	mv	a1,a4
 998:	853e                	mv	a0,a5
 99a:	00000097          	auipc	ra,0x0
 99e:	d52080e7          	jalr	-686(ra) # 6ec <printint>
 9a2:	aa39                	j	ac0 <vprintf+0x23a>
      } else if(c == 'p') {
 9a4:	fdc42783          	lw	a5,-36(s0)
 9a8:	0007871b          	sext.w	a4,a5
 9ac:	07000793          	li	a5,112
 9b0:	02f71263          	bne	a4,a5,9d4 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 9b4:	fb843783          	ld	a5,-72(s0)
 9b8:	00878713          	addi	a4,a5,8
 9bc:	fae43c23          	sd	a4,-72(s0)
 9c0:	6398                	ld	a4,0(a5)
 9c2:	fcc42783          	lw	a5,-52(s0)
 9c6:	85ba                	mv	a1,a4
 9c8:	853e                	mv	a0,a5
 9ca:	00000097          	auipc	ra,0x0
 9ce:	e30080e7          	jalr	-464(ra) # 7fa <printptr>
 9d2:	a0fd                	j	ac0 <vprintf+0x23a>
      } else if(c == 's'){
 9d4:	fdc42783          	lw	a5,-36(s0)
 9d8:	0007871b          	sext.w	a4,a5
 9dc:	07300793          	li	a5,115
 9e0:	04f71c63          	bne	a4,a5,a38 <vprintf+0x1b2>
        s = va_arg(ap, char*);
 9e4:	fb843783          	ld	a5,-72(s0)
 9e8:	00878713          	addi	a4,a5,8
 9ec:	fae43c23          	sd	a4,-72(s0)
 9f0:	639c                	ld	a5,0(a5)
 9f2:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 9f6:	fe843783          	ld	a5,-24(s0)
 9fa:	eb8d                	bnez	a5,a2c <vprintf+0x1a6>
          s = "(null)";
 9fc:	00000797          	auipc	a5,0x0
 a00:	4c478793          	addi	a5,a5,1220 # ec0 <malloc+0x18a>
 a04:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 a08:	a015                	j	a2c <vprintf+0x1a6>
          putc(fd, *s);
 a0a:	fe843783          	ld	a5,-24(s0)
 a0e:	0007c703          	lbu	a4,0(a5)
 a12:	fcc42783          	lw	a5,-52(s0)
 a16:	85ba                	mv	a1,a4
 a18:	853e                	mv	a0,a5
 a1a:	00000097          	auipc	ra,0x0
 a1e:	c9c080e7          	jalr	-868(ra) # 6b6 <putc>
          s++;
 a22:	fe843783          	ld	a5,-24(s0)
 a26:	0785                	addi	a5,a5,1
 a28:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 a2c:	fe843783          	ld	a5,-24(s0)
 a30:	0007c783          	lbu	a5,0(a5)
 a34:	fbf9                	bnez	a5,a0a <vprintf+0x184>
 a36:	a069                	j	ac0 <vprintf+0x23a>
        }
      } else if(c == 'c'){
 a38:	fdc42783          	lw	a5,-36(s0)
 a3c:	0007871b          	sext.w	a4,a5
 a40:	06300793          	li	a5,99
 a44:	02f71463          	bne	a4,a5,a6c <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 a48:	fb843783          	ld	a5,-72(s0)
 a4c:	00878713          	addi	a4,a5,8
 a50:	fae43c23          	sd	a4,-72(s0)
 a54:	439c                	lw	a5,0(a5)
 a56:	0ff7f713          	andi	a4,a5,255
 a5a:	fcc42783          	lw	a5,-52(s0)
 a5e:	85ba                	mv	a1,a4
 a60:	853e                	mv	a0,a5
 a62:	00000097          	auipc	ra,0x0
 a66:	c54080e7          	jalr	-940(ra) # 6b6 <putc>
 a6a:	a899                	j	ac0 <vprintf+0x23a>
      } else if(c == '%'){
 a6c:	fdc42783          	lw	a5,-36(s0)
 a70:	0007871b          	sext.w	a4,a5
 a74:	02500793          	li	a5,37
 a78:	00f71f63          	bne	a4,a5,a96 <vprintf+0x210>
        putc(fd, c);
 a7c:	fdc42783          	lw	a5,-36(s0)
 a80:	0ff7f713          	andi	a4,a5,255
 a84:	fcc42783          	lw	a5,-52(s0)
 a88:	85ba                	mv	a1,a4
 a8a:	853e                	mv	a0,a5
 a8c:	00000097          	auipc	ra,0x0
 a90:	c2a080e7          	jalr	-982(ra) # 6b6 <putc>
 a94:	a035                	j	ac0 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 a96:	fcc42783          	lw	a5,-52(s0)
 a9a:	02500593          	li	a1,37
 a9e:	853e                	mv	a0,a5
 aa0:	00000097          	auipc	ra,0x0
 aa4:	c16080e7          	jalr	-1002(ra) # 6b6 <putc>
        putc(fd, c);
 aa8:	fdc42783          	lw	a5,-36(s0)
 aac:	0ff7f713          	andi	a4,a5,255
 ab0:	fcc42783          	lw	a5,-52(s0)
 ab4:	85ba                	mv	a1,a4
 ab6:	853e                	mv	a0,a5
 ab8:	00000097          	auipc	ra,0x0
 abc:	bfe080e7          	jalr	-1026(ra) # 6b6 <putc>
      }
      state = 0;
 ac0:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 ac4:	fe442783          	lw	a5,-28(s0)
 ac8:	2785                	addiw	a5,a5,1
 aca:	fef42223          	sw	a5,-28(s0)
 ace:	fe442783          	lw	a5,-28(s0)
 ad2:	fc043703          	ld	a4,-64(s0)
 ad6:	97ba                	add	a5,a5,a4
 ad8:	0007c783          	lbu	a5,0(a5)
 adc:	dc0795e3          	bnez	a5,8a6 <vprintf+0x20>
    }
  }
}
 ae0:	0001                	nop
 ae2:	0001                	nop
 ae4:	60a6                	ld	ra,72(sp)
 ae6:	6406                	ld	s0,64(sp)
 ae8:	6161                	addi	sp,sp,80
 aea:	8082                	ret

0000000000000aec <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 aec:	7159                	addi	sp,sp,-112
 aee:	fc06                	sd	ra,56(sp)
 af0:	f822                	sd	s0,48(sp)
 af2:	0080                	addi	s0,sp,64
 af4:	fcb43823          	sd	a1,-48(s0)
 af8:	e010                	sd	a2,0(s0)
 afa:	e414                	sd	a3,8(s0)
 afc:	e818                	sd	a4,16(s0)
 afe:	ec1c                	sd	a5,24(s0)
 b00:	03043023          	sd	a6,32(s0)
 b04:	03143423          	sd	a7,40(s0)
 b08:	87aa                	mv	a5,a0
 b0a:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 b0e:	03040793          	addi	a5,s0,48
 b12:	fcf43423          	sd	a5,-56(s0)
 b16:	fc843783          	ld	a5,-56(s0)
 b1a:	fd078793          	addi	a5,a5,-48
 b1e:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 b22:	fe843703          	ld	a4,-24(s0)
 b26:	fdc42783          	lw	a5,-36(s0)
 b2a:	863a                	mv	a2,a4
 b2c:	fd043583          	ld	a1,-48(s0)
 b30:	853e                	mv	a0,a5
 b32:	00000097          	auipc	ra,0x0
 b36:	d54080e7          	jalr	-684(ra) # 886 <vprintf>
}
 b3a:	0001                	nop
 b3c:	70e2                	ld	ra,56(sp)
 b3e:	7442                	ld	s0,48(sp)
 b40:	6165                	addi	sp,sp,112
 b42:	8082                	ret

0000000000000b44 <printf>:

void
printf(const char *fmt, ...)
{
 b44:	7159                	addi	sp,sp,-112
 b46:	f406                	sd	ra,40(sp)
 b48:	f022                	sd	s0,32(sp)
 b4a:	1800                	addi	s0,sp,48
 b4c:	fca43c23          	sd	a0,-40(s0)
 b50:	e40c                	sd	a1,8(s0)
 b52:	e810                	sd	a2,16(s0)
 b54:	ec14                	sd	a3,24(s0)
 b56:	f018                	sd	a4,32(s0)
 b58:	f41c                	sd	a5,40(s0)
 b5a:	03043823          	sd	a6,48(s0)
 b5e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 b62:	04040793          	addi	a5,s0,64
 b66:	fcf43823          	sd	a5,-48(s0)
 b6a:	fd043783          	ld	a5,-48(s0)
 b6e:	fc878793          	addi	a5,a5,-56
 b72:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 b76:	fe843783          	ld	a5,-24(s0)
 b7a:	863e                	mv	a2,a5
 b7c:	fd843583          	ld	a1,-40(s0)
 b80:	4505                	li	a0,1
 b82:	00000097          	auipc	ra,0x0
 b86:	d04080e7          	jalr	-764(ra) # 886 <vprintf>
}
 b8a:	0001                	nop
 b8c:	70a2                	ld	ra,40(sp)
 b8e:	7402                	ld	s0,32(sp)
 b90:	6165                	addi	sp,sp,112
 b92:	8082                	ret

0000000000000b94 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b94:	7179                	addi	sp,sp,-48
 b96:	f422                	sd	s0,40(sp)
 b98:	1800                	addi	s0,sp,48
 b9a:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 b9e:	fd843783          	ld	a5,-40(s0)
 ba2:	17c1                	addi	a5,a5,-16
 ba4:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ba8:	00000797          	auipc	a5,0x0
 bac:	54878793          	addi	a5,a5,1352 # 10f0 <freep>
 bb0:	639c                	ld	a5,0(a5)
 bb2:	fef43423          	sd	a5,-24(s0)
 bb6:	a815                	j	bea <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 bb8:	fe843783          	ld	a5,-24(s0)
 bbc:	639c                	ld	a5,0(a5)
 bbe:	fe843703          	ld	a4,-24(s0)
 bc2:	00f76f63          	bltu	a4,a5,be0 <free+0x4c>
 bc6:	fe043703          	ld	a4,-32(s0)
 bca:	fe843783          	ld	a5,-24(s0)
 bce:	02e7eb63          	bltu	a5,a4,c04 <free+0x70>
 bd2:	fe843783          	ld	a5,-24(s0)
 bd6:	639c                	ld	a5,0(a5)
 bd8:	fe043703          	ld	a4,-32(s0)
 bdc:	02f76463          	bltu	a4,a5,c04 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 be0:	fe843783          	ld	a5,-24(s0)
 be4:	639c                	ld	a5,0(a5)
 be6:	fef43423          	sd	a5,-24(s0)
 bea:	fe043703          	ld	a4,-32(s0)
 bee:	fe843783          	ld	a5,-24(s0)
 bf2:	fce7f3e3          	bgeu	a5,a4,bb8 <free+0x24>
 bf6:	fe843783          	ld	a5,-24(s0)
 bfa:	639c                	ld	a5,0(a5)
 bfc:	fe043703          	ld	a4,-32(s0)
 c00:	faf77ce3          	bgeu	a4,a5,bb8 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
 c04:	fe043783          	ld	a5,-32(s0)
 c08:	479c                	lw	a5,8(a5)
 c0a:	1782                	slli	a5,a5,0x20
 c0c:	9381                	srli	a5,a5,0x20
 c0e:	0792                	slli	a5,a5,0x4
 c10:	fe043703          	ld	a4,-32(s0)
 c14:	973e                	add	a4,a4,a5
 c16:	fe843783          	ld	a5,-24(s0)
 c1a:	639c                	ld	a5,0(a5)
 c1c:	02f71763          	bne	a4,a5,c4a <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
 c20:	fe043783          	ld	a5,-32(s0)
 c24:	4798                	lw	a4,8(a5)
 c26:	fe843783          	ld	a5,-24(s0)
 c2a:	639c                	ld	a5,0(a5)
 c2c:	479c                	lw	a5,8(a5)
 c2e:	9fb9                	addw	a5,a5,a4
 c30:	0007871b          	sext.w	a4,a5
 c34:	fe043783          	ld	a5,-32(s0)
 c38:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 c3a:	fe843783          	ld	a5,-24(s0)
 c3e:	639c                	ld	a5,0(a5)
 c40:	6398                	ld	a4,0(a5)
 c42:	fe043783          	ld	a5,-32(s0)
 c46:	e398                	sd	a4,0(a5)
 c48:	a039                	j	c56 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
 c4a:	fe843783          	ld	a5,-24(s0)
 c4e:	6398                	ld	a4,0(a5)
 c50:	fe043783          	ld	a5,-32(s0)
 c54:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 c56:	fe843783          	ld	a5,-24(s0)
 c5a:	479c                	lw	a5,8(a5)
 c5c:	1782                	slli	a5,a5,0x20
 c5e:	9381                	srli	a5,a5,0x20
 c60:	0792                	slli	a5,a5,0x4
 c62:	fe843703          	ld	a4,-24(s0)
 c66:	97ba                	add	a5,a5,a4
 c68:	fe043703          	ld	a4,-32(s0)
 c6c:	02f71563          	bne	a4,a5,c96 <free+0x102>
    p->s.size += bp->s.size;
 c70:	fe843783          	ld	a5,-24(s0)
 c74:	4798                	lw	a4,8(a5)
 c76:	fe043783          	ld	a5,-32(s0)
 c7a:	479c                	lw	a5,8(a5)
 c7c:	9fb9                	addw	a5,a5,a4
 c7e:	0007871b          	sext.w	a4,a5
 c82:	fe843783          	ld	a5,-24(s0)
 c86:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 c88:	fe043783          	ld	a5,-32(s0)
 c8c:	6398                	ld	a4,0(a5)
 c8e:	fe843783          	ld	a5,-24(s0)
 c92:	e398                	sd	a4,0(a5)
 c94:	a031                	j	ca0 <free+0x10c>
  } else
    p->s.ptr = bp;
 c96:	fe843783          	ld	a5,-24(s0)
 c9a:	fe043703          	ld	a4,-32(s0)
 c9e:	e398                	sd	a4,0(a5)
  freep = p;
 ca0:	00000797          	auipc	a5,0x0
 ca4:	45078793          	addi	a5,a5,1104 # 10f0 <freep>
 ca8:	fe843703          	ld	a4,-24(s0)
 cac:	e398                	sd	a4,0(a5)
}
 cae:	0001                	nop
 cb0:	7422                	ld	s0,40(sp)
 cb2:	6145                	addi	sp,sp,48
 cb4:	8082                	ret

0000000000000cb6 <morecore>:

static Header*
morecore(uint nu)
{
 cb6:	7179                	addi	sp,sp,-48
 cb8:	f406                	sd	ra,40(sp)
 cba:	f022                	sd	s0,32(sp)
 cbc:	1800                	addi	s0,sp,48
 cbe:	87aa                	mv	a5,a0
 cc0:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 cc4:	fdc42783          	lw	a5,-36(s0)
 cc8:	0007871b          	sext.w	a4,a5
 ccc:	6785                	lui	a5,0x1
 cce:	00f77563          	bgeu	a4,a5,cd8 <morecore+0x22>
    nu = 4096;
 cd2:	6785                	lui	a5,0x1
 cd4:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 cd8:	fdc42783          	lw	a5,-36(s0)
 cdc:	0047979b          	slliw	a5,a5,0x4
 ce0:	2781                	sext.w	a5,a5
 ce2:	2781                	sext.w	a5,a5
 ce4:	853e                	mv	a0,a5
 ce6:	00000097          	auipc	ra,0x0
 cea:	9b0080e7          	jalr	-1616(ra) # 696 <sbrk>
 cee:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 cf2:	fe843703          	ld	a4,-24(s0)
 cf6:	57fd                	li	a5,-1
 cf8:	00f71463          	bne	a4,a5,d00 <morecore+0x4a>
    return 0;
 cfc:	4781                	li	a5,0
 cfe:	a03d                	j	d2c <morecore+0x76>
  hp = (Header*)p;
 d00:	fe843783          	ld	a5,-24(s0)
 d04:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 d08:	fe043783          	ld	a5,-32(s0)
 d0c:	fdc42703          	lw	a4,-36(s0)
 d10:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 d12:	fe043783          	ld	a5,-32(s0)
 d16:	07c1                	addi	a5,a5,16
 d18:	853e                	mv	a0,a5
 d1a:	00000097          	auipc	ra,0x0
 d1e:	e7a080e7          	jalr	-390(ra) # b94 <free>
  return freep;
 d22:	00000797          	auipc	a5,0x0
 d26:	3ce78793          	addi	a5,a5,974 # 10f0 <freep>
 d2a:	639c                	ld	a5,0(a5)
}
 d2c:	853e                	mv	a0,a5
 d2e:	70a2                	ld	ra,40(sp)
 d30:	7402                	ld	s0,32(sp)
 d32:	6145                	addi	sp,sp,48
 d34:	8082                	ret

0000000000000d36 <malloc>:

void*
malloc(uint nbytes)
{
 d36:	7139                	addi	sp,sp,-64
 d38:	fc06                	sd	ra,56(sp)
 d3a:	f822                	sd	s0,48(sp)
 d3c:	0080                	addi	s0,sp,64
 d3e:	87aa                	mv	a5,a0
 d40:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d44:	fcc46783          	lwu	a5,-52(s0)
 d48:	07bd                	addi	a5,a5,15
 d4a:	8391                	srli	a5,a5,0x4
 d4c:	2781                	sext.w	a5,a5
 d4e:	2785                	addiw	a5,a5,1
 d50:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 d54:	00000797          	auipc	a5,0x0
 d58:	39c78793          	addi	a5,a5,924 # 10f0 <freep>
 d5c:	639c                	ld	a5,0(a5)
 d5e:	fef43023          	sd	a5,-32(s0)
 d62:	fe043783          	ld	a5,-32(s0)
 d66:	ef95                	bnez	a5,da2 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 d68:	00000797          	auipc	a5,0x0
 d6c:	37878793          	addi	a5,a5,888 # 10e0 <base>
 d70:	fef43023          	sd	a5,-32(s0)
 d74:	00000797          	auipc	a5,0x0
 d78:	37c78793          	addi	a5,a5,892 # 10f0 <freep>
 d7c:	fe043703          	ld	a4,-32(s0)
 d80:	e398                	sd	a4,0(a5)
 d82:	00000797          	auipc	a5,0x0
 d86:	36e78793          	addi	a5,a5,878 # 10f0 <freep>
 d8a:	6398                	ld	a4,0(a5)
 d8c:	00000797          	auipc	a5,0x0
 d90:	35478793          	addi	a5,a5,852 # 10e0 <base>
 d94:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 d96:	00000797          	auipc	a5,0x0
 d9a:	34a78793          	addi	a5,a5,842 # 10e0 <base>
 d9e:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 da2:	fe043783          	ld	a5,-32(s0)
 da6:	639c                	ld	a5,0(a5)
 da8:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 dac:	fe843783          	ld	a5,-24(s0)
 db0:	4798                	lw	a4,8(a5)
 db2:	fdc42783          	lw	a5,-36(s0)
 db6:	2781                	sext.w	a5,a5
 db8:	06f76863          	bltu	a4,a5,e28 <malloc+0xf2>
      if(p->s.size == nunits)
 dbc:	fe843783          	ld	a5,-24(s0)
 dc0:	4798                	lw	a4,8(a5)
 dc2:	fdc42783          	lw	a5,-36(s0)
 dc6:	2781                	sext.w	a5,a5
 dc8:	00e79963          	bne	a5,a4,dda <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 dcc:	fe843783          	ld	a5,-24(s0)
 dd0:	6398                	ld	a4,0(a5)
 dd2:	fe043783          	ld	a5,-32(s0)
 dd6:	e398                	sd	a4,0(a5)
 dd8:	a82d                	j	e12 <malloc+0xdc>
      else {
        p->s.size -= nunits;
 dda:	fe843783          	ld	a5,-24(s0)
 dde:	4798                	lw	a4,8(a5)
 de0:	fdc42783          	lw	a5,-36(s0)
 de4:	40f707bb          	subw	a5,a4,a5
 de8:	0007871b          	sext.w	a4,a5
 dec:	fe843783          	ld	a5,-24(s0)
 df0:	c798                	sw	a4,8(a5)
        p += p->s.size;
 df2:	fe843783          	ld	a5,-24(s0)
 df6:	479c                	lw	a5,8(a5)
 df8:	1782                	slli	a5,a5,0x20
 dfa:	9381                	srli	a5,a5,0x20
 dfc:	0792                	slli	a5,a5,0x4
 dfe:	fe843703          	ld	a4,-24(s0)
 e02:	97ba                	add	a5,a5,a4
 e04:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 e08:	fe843783          	ld	a5,-24(s0)
 e0c:	fdc42703          	lw	a4,-36(s0)
 e10:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 e12:	00000797          	auipc	a5,0x0
 e16:	2de78793          	addi	a5,a5,734 # 10f0 <freep>
 e1a:	fe043703          	ld	a4,-32(s0)
 e1e:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 e20:	fe843783          	ld	a5,-24(s0)
 e24:	07c1                	addi	a5,a5,16
 e26:	a091                	j	e6a <malloc+0x134>
    }
    if(p == freep)
 e28:	00000797          	auipc	a5,0x0
 e2c:	2c878793          	addi	a5,a5,712 # 10f0 <freep>
 e30:	639c                	ld	a5,0(a5)
 e32:	fe843703          	ld	a4,-24(s0)
 e36:	02f71063          	bne	a4,a5,e56 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
 e3a:	fdc42783          	lw	a5,-36(s0)
 e3e:	853e                	mv	a0,a5
 e40:	00000097          	auipc	ra,0x0
 e44:	e76080e7          	jalr	-394(ra) # cb6 <morecore>
 e48:	fea43423          	sd	a0,-24(s0)
 e4c:	fe843783          	ld	a5,-24(s0)
 e50:	e399                	bnez	a5,e56 <malloc+0x120>
        return 0;
 e52:	4781                	li	a5,0
 e54:	a819                	j	e6a <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e56:	fe843783          	ld	a5,-24(s0)
 e5a:	fef43023          	sd	a5,-32(s0)
 e5e:	fe843783          	ld	a5,-24(s0)
 e62:	639c                	ld	a5,0(a5)
 e64:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 e68:	b791                	j	dac <malloc+0x76>
  }
}
 e6a:	853e                	mv	a0,a5
 e6c:	70e2                	ld	ra,56(sp)
 e6e:	7442                	ld	s0,48(sp)
 e70:	6121                	addi	sp,sp,64
 e72:	8082                	ret
