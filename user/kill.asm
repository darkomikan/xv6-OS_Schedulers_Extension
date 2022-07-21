
user/_kill:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char **argv)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	1800                	addi	s0,sp,48
   8:	87aa                	mv	a5,a0
   a:	fcb43823          	sd	a1,-48(s0)
   e:	fcf42e23          	sw	a5,-36(s0)
  int i;

  if(argc < 2){
  12:	fdc42783          	lw	a5,-36(s0)
  16:	0007871b          	sext.w	a4,a5
  1a:	4785                	li	a5,1
  1c:	02e7c063          	blt	a5,a4,3c <main+0x3c>
    fprintf(2, "usage: kill pid...\n");
  20:	00001597          	auipc	a1,0x1
  24:	d6858593          	addi	a1,a1,-664 # d88 <malloc+0x144>
  28:	4509                	li	a0,2
  2a:	00001097          	auipc	ra,0x1
  2e:	9d0080e7          	jalr	-1584(ra) # 9fa <fprintf>
    exit(1);
  32:	4505                	li	a0,1
  34:	00000097          	auipc	ra,0x0
  38:	4e8080e7          	jalr	1256(ra) # 51c <exit>
  }
  for(i=1; i<argc; i++)
  3c:	4785                	li	a5,1
  3e:	fef42623          	sw	a5,-20(s0)
  42:	a805                	j	72 <main+0x72>
    kill(atoi(argv[i]));
  44:	fec42783          	lw	a5,-20(s0)
  48:	078e                	slli	a5,a5,0x3
  4a:	fd043703          	ld	a4,-48(s0)
  4e:	97ba                	add	a5,a5,a4
  50:	639c                	ld	a5,0(a5)
  52:	853e                	mv	a0,a5
  54:	00000097          	auipc	ra,0x0
  58:	2d0080e7          	jalr	720(ra) # 324 <atoi>
  5c:	87aa                	mv	a5,a0
  5e:	853e                	mv	a0,a5
  60:	00000097          	auipc	ra,0x0
  64:	4ec080e7          	jalr	1260(ra) # 54c <kill>
  for(i=1; i<argc; i++)
  68:	fec42783          	lw	a5,-20(s0)
  6c:	2785                	addiw	a5,a5,1
  6e:	fef42623          	sw	a5,-20(s0)
  72:	fec42703          	lw	a4,-20(s0)
  76:	fdc42783          	lw	a5,-36(s0)
  7a:	2701                	sext.w	a4,a4
  7c:	2781                	sext.w	a5,a5
  7e:	fcf743e3          	blt	a4,a5,44 <main+0x44>
  exit(0);
  82:	4501                	li	a0,0
  84:	00000097          	auipc	ra,0x0
  88:	498080e7          	jalr	1176(ra) # 51c <exit>

000000000000008c <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
  8c:	7179                	addi	sp,sp,-48
  8e:	f422                	sd	s0,40(sp)
  90:	1800                	addi	s0,sp,48
  92:	fca43c23          	sd	a0,-40(s0)
  96:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
  9a:	fd843783          	ld	a5,-40(s0)
  9e:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
  a2:	0001                	nop
  a4:	fd043703          	ld	a4,-48(s0)
  a8:	00170793          	addi	a5,a4,1
  ac:	fcf43823          	sd	a5,-48(s0)
  b0:	fd843783          	ld	a5,-40(s0)
  b4:	00178693          	addi	a3,a5,1
  b8:	fcd43c23          	sd	a3,-40(s0)
  bc:	00074703          	lbu	a4,0(a4)
  c0:	00e78023          	sb	a4,0(a5)
  c4:	0007c783          	lbu	a5,0(a5)
  c8:	fff1                	bnez	a5,a4 <strcpy+0x18>
    ;
  return os;
  ca:	fe843783          	ld	a5,-24(s0)
}
  ce:	853e                	mv	a0,a5
  d0:	7422                	ld	s0,40(sp)
  d2:	6145                	addi	sp,sp,48
  d4:	8082                	ret

00000000000000d6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d6:	1101                	addi	sp,sp,-32
  d8:	ec22                	sd	s0,24(sp)
  da:	1000                	addi	s0,sp,32
  dc:	fea43423          	sd	a0,-24(s0)
  e0:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
  e4:	a819                	j	fa <strcmp+0x24>
    p++, q++;
  e6:	fe843783          	ld	a5,-24(s0)
  ea:	0785                	addi	a5,a5,1
  ec:	fef43423          	sd	a5,-24(s0)
  f0:	fe043783          	ld	a5,-32(s0)
  f4:	0785                	addi	a5,a5,1
  f6:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
  fa:	fe843783          	ld	a5,-24(s0)
  fe:	0007c783          	lbu	a5,0(a5)
 102:	cb99                	beqz	a5,118 <strcmp+0x42>
 104:	fe843783          	ld	a5,-24(s0)
 108:	0007c703          	lbu	a4,0(a5)
 10c:	fe043783          	ld	a5,-32(s0)
 110:	0007c783          	lbu	a5,0(a5)
 114:	fcf709e3          	beq	a4,a5,e6 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
 118:	fe843783          	ld	a5,-24(s0)
 11c:	0007c783          	lbu	a5,0(a5)
 120:	0007871b          	sext.w	a4,a5
 124:	fe043783          	ld	a5,-32(s0)
 128:	0007c783          	lbu	a5,0(a5)
 12c:	2781                	sext.w	a5,a5
 12e:	40f707bb          	subw	a5,a4,a5
 132:	2781                	sext.w	a5,a5
}
 134:	853e                	mv	a0,a5
 136:	6462                	ld	s0,24(sp)
 138:	6105                	addi	sp,sp,32
 13a:	8082                	ret

000000000000013c <strlen>:

uint
strlen(const char *s)
{
 13c:	7179                	addi	sp,sp,-48
 13e:	f422                	sd	s0,40(sp)
 140:	1800                	addi	s0,sp,48
 142:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
 146:	fe042623          	sw	zero,-20(s0)
 14a:	a031                	j	156 <strlen+0x1a>
 14c:	fec42783          	lw	a5,-20(s0)
 150:	2785                	addiw	a5,a5,1
 152:	fef42623          	sw	a5,-20(s0)
 156:	fec42783          	lw	a5,-20(s0)
 15a:	fd843703          	ld	a4,-40(s0)
 15e:	97ba                	add	a5,a5,a4
 160:	0007c783          	lbu	a5,0(a5)
 164:	f7e5                	bnez	a5,14c <strlen+0x10>
    ;
  return n;
 166:	fec42783          	lw	a5,-20(s0)
}
 16a:	853e                	mv	a0,a5
 16c:	7422                	ld	s0,40(sp)
 16e:	6145                	addi	sp,sp,48
 170:	8082                	ret

0000000000000172 <memset>:

void*
memset(void *dst, int c, uint n)
{
 172:	7179                	addi	sp,sp,-48
 174:	f422                	sd	s0,40(sp)
 176:	1800                	addi	s0,sp,48
 178:	fca43c23          	sd	a0,-40(s0)
 17c:	87ae                	mv	a5,a1
 17e:	8732                	mv	a4,a2
 180:	fcf42a23          	sw	a5,-44(s0)
 184:	87ba                	mv	a5,a4
 186:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 18a:	fd843783          	ld	a5,-40(s0)
 18e:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 192:	fe042623          	sw	zero,-20(s0)
 196:	a00d                	j	1b8 <memset+0x46>
    cdst[i] = c;
 198:	fec42783          	lw	a5,-20(s0)
 19c:	fe043703          	ld	a4,-32(s0)
 1a0:	97ba                	add	a5,a5,a4
 1a2:	fd442703          	lw	a4,-44(s0)
 1a6:	0ff77713          	andi	a4,a4,255
 1aa:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 1ae:	fec42783          	lw	a5,-20(s0)
 1b2:	2785                	addiw	a5,a5,1
 1b4:	fef42623          	sw	a5,-20(s0)
 1b8:	fec42703          	lw	a4,-20(s0)
 1bc:	fd042783          	lw	a5,-48(s0)
 1c0:	2781                	sext.w	a5,a5
 1c2:	fcf76be3          	bltu	a4,a5,198 <memset+0x26>
  }
  return dst;
 1c6:	fd843783          	ld	a5,-40(s0)
}
 1ca:	853e                	mv	a0,a5
 1cc:	7422                	ld	s0,40(sp)
 1ce:	6145                	addi	sp,sp,48
 1d0:	8082                	ret

00000000000001d2 <strchr>:

char*
strchr(const char *s, char c)
{
 1d2:	1101                	addi	sp,sp,-32
 1d4:	ec22                	sd	s0,24(sp)
 1d6:	1000                	addi	s0,sp,32
 1d8:	fea43423          	sd	a0,-24(s0)
 1dc:	87ae                	mv	a5,a1
 1de:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 1e2:	a01d                	j	208 <strchr+0x36>
    if(*s == c)
 1e4:	fe843783          	ld	a5,-24(s0)
 1e8:	0007c703          	lbu	a4,0(a5)
 1ec:	fe744783          	lbu	a5,-25(s0)
 1f0:	0ff7f793          	andi	a5,a5,255
 1f4:	00e79563          	bne	a5,a4,1fe <strchr+0x2c>
      return (char*)s;
 1f8:	fe843783          	ld	a5,-24(s0)
 1fc:	a821                	j	214 <strchr+0x42>
  for(; *s; s++)
 1fe:	fe843783          	ld	a5,-24(s0)
 202:	0785                	addi	a5,a5,1
 204:	fef43423          	sd	a5,-24(s0)
 208:	fe843783          	ld	a5,-24(s0)
 20c:	0007c783          	lbu	a5,0(a5)
 210:	fbf1                	bnez	a5,1e4 <strchr+0x12>
  return 0;
 212:	4781                	li	a5,0
}
 214:	853e                	mv	a0,a5
 216:	6462                	ld	s0,24(sp)
 218:	6105                	addi	sp,sp,32
 21a:	8082                	ret

000000000000021c <gets>:

char*
gets(char *buf, int max)
{
 21c:	7179                	addi	sp,sp,-48
 21e:	f406                	sd	ra,40(sp)
 220:	f022                	sd	s0,32(sp)
 222:	1800                	addi	s0,sp,48
 224:	fca43c23          	sd	a0,-40(s0)
 228:	87ae                	mv	a5,a1
 22a:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 22e:	fe042623          	sw	zero,-20(s0)
 232:	a8a1                	j	28a <gets+0x6e>
    cc = read(0, &c, 1);
 234:	fe740793          	addi	a5,s0,-25
 238:	4605                	li	a2,1
 23a:	85be                	mv	a1,a5
 23c:	4501                	li	a0,0
 23e:	00000097          	auipc	ra,0x0
 242:	2f6080e7          	jalr	758(ra) # 534 <read>
 246:	87aa                	mv	a5,a0
 248:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 24c:	fe842783          	lw	a5,-24(s0)
 250:	2781                	sext.w	a5,a5
 252:	04f05763          	blez	a5,2a0 <gets+0x84>
      break;
    buf[i++] = c;
 256:	fec42783          	lw	a5,-20(s0)
 25a:	0017871b          	addiw	a4,a5,1
 25e:	fee42623          	sw	a4,-20(s0)
 262:	873e                	mv	a4,a5
 264:	fd843783          	ld	a5,-40(s0)
 268:	97ba                	add	a5,a5,a4
 26a:	fe744703          	lbu	a4,-25(s0)
 26e:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 272:	fe744783          	lbu	a5,-25(s0)
 276:	873e                	mv	a4,a5
 278:	47a9                	li	a5,10
 27a:	02f70463          	beq	a4,a5,2a2 <gets+0x86>
 27e:	fe744783          	lbu	a5,-25(s0)
 282:	873e                	mv	a4,a5
 284:	47b5                	li	a5,13
 286:	00f70e63          	beq	a4,a5,2a2 <gets+0x86>
  for(i=0; i+1 < max; ){
 28a:	fec42783          	lw	a5,-20(s0)
 28e:	2785                	addiw	a5,a5,1
 290:	0007871b          	sext.w	a4,a5
 294:	fd442783          	lw	a5,-44(s0)
 298:	2781                	sext.w	a5,a5
 29a:	f8f74de3          	blt	a4,a5,234 <gets+0x18>
 29e:	a011                	j	2a2 <gets+0x86>
      break;
 2a0:	0001                	nop
      break;
  }
  buf[i] = '\0';
 2a2:	fec42783          	lw	a5,-20(s0)
 2a6:	fd843703          	ld	a4,-40(s0)
 2aa:	97ba                	add	a5,a5,a4
 2ac:	00078023          	sb	zero,0(a5)
  return buf;
 2b0:	fd843783          	ld	a5,-40(s0)
}
 2b4:	853e                	mv	a0,a5
 2b6:	70a2                	ld	ra,40(sp)
 2b8:	7402                	ld	s0,32(sp)
 2ba:	6145                	addi	sp,sp,48
 2bc:	8082                	ret

00000000000002be <stat>:

int
stat(const char *n, struct stat *st)
{
 2be:	7179                	addi	sp,sp,-48
 2c0:	f406                	sd	ra,40(sp)
 2c2:	f022                	sd	s0,32(sp)
 2c4:	1800                	addi	s0,sp,48
 2c6:	fca43c23          	sd	a0,-40(s0)
 2ca:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2ce:	4581                	li	a1,0
 2d0:	fd843503          	ld	a0,-40(s0)
 2d4:	00000097          	auipc	ra,0x0
 2d8:	288080e7          	jalr	648(ra) # 55c <open>
 2dc:	87aa                	mv	a5,a0
 2de:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 2e2:	fec42783          	lw	a5,-20(s0)
 2e6:	2781                	sext.w	a5,a5
 2e8:	0007d463          	bgez	a5,2f0 <stat+0x32>
    return -1;
 2ec:	57fd                	li	a5,-1
 2ee:	a035                	j	31a <stat+0x5c>
  r = fstat(fd, st);
 2f0:	fec42783          	lw	a5,-20(s0)
 2f4:	fd043583          	ld	a1,-48(s0)
 2f8:	853e                	mv	a0,a5
 2fa:	00000097          	auipc	ra,0x0
 2fe:	27a080e7          	jalr	634(ra) # 574 <fstat>
 302:	87aa                	mv	a5,a0
 304:	fef42423          	sw	a5,-24(s0)
  close(fd);
 308:	fec42783          	lw	a5,-20(s0)
 30c:	853e                	mv	a0,a5
 30e:	00000097          	auipc	ra,0x0
 312:	236080e7          	jalr	566(ra) # 544 <close>
  return r;
 316:	fe842783          	lw	a5,-24(s0)
}
 31a:	853e                	mv	a0,a5
 31c:	70a2                	ld	ra,40(sp)
 31e:	7402                	ld	s0,32(sp)
 320:	6145                	addi	sp,sp,48
 322:	8082                	ret

0000000000000324 <atoi>:

int
atoi(const char *s)
{
 324:	7179                	addi	sp,sp,-48
 326:	f422                	sd	s0,40(sp)
 328:	1800                	addi	s0,sp,48
 32a:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 32e:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 332:	a815                	j	366 <atoi+0x42>
    n = n*10 + *s++ - '0';
 334:	fec42703          	lw	a4,-20(s0)
 338:	87ba                	mv	a5,a4
 33a:	0027979b          	slliw	a5,a5,0x2
 33e:	9fb9                	addw	a5,a5,a4
 340:	0017979b          	slliw	a5,a5,0x1
 344:	0007871b          	sext.w	a4,a5
 348:	fd843783          	ld	a5,-40(s0)
 34c:	00178693          	addi	a3,a5,1
 350:	fcd43c23          	sd	a3,-40(s0)
 354:	0007c783          	lbu	a5,0(a5)
 358:	2781                	sext.w	a5,a5
 35a:	9fb9                	addw	a5,a5,a4
 35c:	2781                	sext.w	a5,a5
 35e:	fd07879b          	addiw	a5,a5,-48
 362:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 366:	fd843783          	ld	a5,-40(s0)
 36a:	0007c783          	lbu	a5,0(a5)
 36e:	873e                	mv	a4,a5
 370:	02f00793          	li	a5,47
 374:	00e7fb63          	bgeu	a5,a4,38a <atoi+0x66>
 378:	fd843783          	ld	a5,-40(s0)
 37c:	0007c783          	lbu	a5,0(a5)
 380:	873e                	mv	a4,a5
 382:	03900793          	li	a5,57
 386:	fae7f7e3          	bgeu	a5,a4,334 <atoi+0x10>
  return n;
 38a:	fec42783          	lw	a5,-20(s0)
}
 38e:	853e                	mv	a0,a5
 390:	7422                	ld	s0,40(sp)
 392:	6145                	addi	sp,sp,48
 394:	8082                	ret

0000000000000396 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 396:	7139                	addi	sp,sp,-64
 398:	fc22                	sd	s0,56(sp)
 39a:	0080                	addi	s0,sp,64
 39c:	fca43c23          	sd	a0,-40(s0)
 3a0:	fcb43823          	sd	a1,-48(s0)
 3a4:	87b2                	mv	a5,a2
 3a6:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 3aa:	fd843783          	ld	a5,-40(s0)
 3ae:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 3b2:	fd043783          	ld	a5,-48(s0)
 3b6:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 3ba:	fe043703          	ld	a4,-32(s0)
 3be:	fe843783          	ld	a5,-24(s0)
 3c2:	02e7fc63          	bgeu	a5,a4,3fa <memmove+0x64>
    while(n-- > 0)
 3c6:	a00d                	j	3e8 <memmove+0x52>
      *dst++ = *src++;
 3c8:	fe043703          	ld	a4,-32(s0)
 3cc:	00170793          	addi	a5,a4,1
 3d0:	fef43023          	sd	a5,-32(s0)
 3d4:	fe843783          	ld	a5,-24(s0)
 3d8:	00178693          	addi	a3,a5,1
 3dc:	fed43423          	sd	a3,-24(s0)
 3e0:	00074703          	lbu	a4,0(a4)
 3e4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 3e8:	fcc42783          	lw	a5,-52(s0)
 3ec:	fff7871b          	addiw	a4,a5,-1
 3f0:	fce42623          	sw	a4,-52(s0)
 3f4:	fcf04ae3          	bgtz	a5,3c8 <memmove+0x32>
 3f8:	a891                	j	44c <memmove+0xb6>
  } else {
    dst += n;
 3fa:	fcc42783          	lw	a5,-52(s0)
 3fe:	fe843703          	ld	a4,-24(s0)
 402:	97ba                	add	a5,a5,a4
 404:	fef43423          	sd	a5,-24(s0)
    src += n;
 408:	fcc42783          	lw	a5,-52(s0)
 40c:	fe043703          	ld	a4,-32(s0)
 410:	97ba                	add	a5,a5,a4
 412:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 416:	a01d                	j	43c <memmove+0xa6>
      *--dst = *--src;
 418:	fe043783          	ld	a5,-32(s0)
 41c:	17fd                	addi	a5,a5,-1
 41e:	fef43023          	sd	a5,-32(s0)
 422:	fe843783          	ld	a5,-24(s0)
 426:	17fd                	addi	a5,a5,-1
 428:	fef43423          	sd	a5,-24(s0)
 42c:	fe043783          	ld	a5,-32(s0)
 430:	0007c703          	lbu	a4,0(a5)
 434:	fe843783          	ld	a5,-24(s0)
 438:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 43c:	fcc42783          	lw	a5,-52(s0)
 440:	fff7871b          	addiw	a4,a5,-1
 444:	fce42623          	sw	a4,-52(s0)
 448:	fcf048e3          	bgtz	a5,418 <memmove+0x82>
  }
  return vdst;
 44c:	fd843783          	ld	a5,-40(s0)
}
 450:	853e                	mv	a0,a5
 452:	7462                	ld	s0,56(sp)
 454:	6121                	addi	sp,sp,64
 456:	8082                	ret

0000000000000458 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 458:	7139                	addi	sp,sp,-64
 45a:	fc22                	sd	s0,56(sp)
 45c:	0080                	addi	s0,sp,64
 45e:	fca43c23          	sd	a0,-40(s0)
 462:	fcb43823          	sd	a1,-48(s0)
 466:	87b2                	mv	a5,a2
 468:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 46c:	fd843783          	ld	a5,-40(s0)
 470:	fef43423          	sd	a5,-24(s0)
 474:	fd043783          	ld	a5,-48(s0)
 478:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 47c:	a0a1                	j	4c4 <memcmp+0x6c>
    if (*p1 != *p2) {
 47e:	fe843783          	ld	a5,-24(s0)
 482:	0007c703          	lbu	a4,0(a5)
 486:	fe043783          	ld	a5,-32(s0)
 48a:	0007c783          	lbu	a5,0(a5)
 48e:	02f70163          	beq	a4,a5,4b0 <memcmp+0x58>
      return *p1 - *p2;
 492:	fe843783          	ld	a5,-24(s0)
 496:	0007c783          	lbu	a5,0(a5)
 49a:	0007871b          	sext.w	a4,a5
 49e:	fe043783          	ld	a5,-32(s0)
 4a2:	0007c783          	lbu	a5,0(a5)
 4a6:	2781                	sext.w	a5,a5
 4a8:	40f707bb          	subw	a5,a4,a5
 4ac:	2781                	sext.w	a5,a5
 4ae:	a01d                	j	4d4 <memcmp+0x7c>
    }
    p1++;
 4b0:	fe843783          	ld	a5,-24(s0)
 4b4:	0785                	addi	a5,a5,1
 4b6:	fef43423          	sd	a5,-24(s0)
    p2++;
 4ba:	fe043783          	ld	a5,-32(s0)
 4be:	0785                	addi	a5,a5,1
 4c0:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 4c4:	fcc42783          	lw	a5,-52(s0)
 4c8:	fff7871b          	addiw	a4,a5,-1
 4cc:	fce42623          	sw	a4,-52(s0)
 4d0:	f7dd                	bnez	a5,47e <memcmp+0x26>
  }
  return 0;
 4d2:	4781                	li	a5,0
}
 4d4:	853e                	mv	a0,a5
 4d6:	7462                	ld	s0,56(sp)
 4d8:	6121                	addi	sp,sp,64
 4da:	8082                	ret

00000000000004dc <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4dc:	7179                	addi	sp,sp,-48
 4de:	f406                	sd	ra,40(sp)
 4e0:	f022                	sd	s0,32(sp)
 4e2:	1800                	addi	s0,sp,48
 4e4:	fea43423          	sd	a0,-24(s0)
 4e8:	feb43023          	sd	a1,-32(s0)
 4ec:	87b2                	mv	a5,a2
 4ee:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 4f2:	fdc42783          	lw	a5,-36(s0)
 4f6:	863e                	mv	a2,a5
 4f8:	fe043583          	ld	a1,-32(s0)
 4fc:	fe843503          	ld	a0,-24(s0)
 500:	00000097          	auipc	ra,0x0
 504:	e96080e7          	jalr	-362(ra) # 396 <memmove>
 508:	87aa                	mv	a5,a0
}
 50a:	853e                	mv	a0,a5
 50c:	70a2                	ld	ra,40(sp)
 50e:	7402                	ld	s0,32(sp)
 510:	6145                	addi	sp,sp,48
 512:	8082                	ret

0000000000000514 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 514:	4885                	li	a7,1
 ecall
 516:	00000073          	ecall
 ret
 51a:	8082                	ret

000000000000051c <exit>:
.global exit
exit:
 li a7, SYS_exit
 51c:	4889                	li	a7,2
 ecall
 51e:	00000073          	ecall
 ret
 522:	8082                	ret

0000000000000524 <wait>:
.global wait
wait:
 li a7, SYS_wait
 524:	488d                	li	a7,3
 ecall
 526:	00000073          	ecall
 ret
 52a:	8082                	ret

000000000000052c <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 52c:	4891                	li	a7,4
 ecall
 52e:	00000073          	ecall
 ret
 532:	8082                	ret

0000000000000534 <read>:
.global read
read:
 li a7, SYS_read
 534:	4895                	li	a7,5
 ecall
 536:	00000073          	ecall
 ret
 53a:	8082                	ret

000000000000053c <write>:
.global write
write:
 li a7, SYS_write
 53c:	48c1                	li	a7,16
 ecall
 53e:	00000073          	ecall
 ret
 542:	8082                	ret

0000000000000544 <close>:
.global close
close:
 li a7, SYS_close
 544:	48d5                	li	a7,21
 ecall
 546:	00000073          	ecall
 ret
 54a:	8082                	ret

000000000000054c <kill>:
.global kill
kill:
 li a7, SYS_kill
 54c:	4899                	li	a7,6
 ecall
 54e:	00000073          	ecall
 ret
 552:	8082                	ret

0000000000000554 <exec>:
.global exec
exec:
 li a7, SYS_exec
 554:	489d                	li	a7,7
 ecall
 556:	00000073          	ecall
 ret
 55a:	8082                	ret

000000000000055c <open>:
.global open
open:
 li a7, SYS_open
 55c:	48bd                	li	a7,15
 ecall
 55e:	00000073          	ecall
 ret
 562:	8082                	ret

0000000000000564 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 564:	48c5                	li	a7,17
 ecall
 566:	00000073          	ecall
 ret
 56a:	8082                	ret

000000000000056c <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 56c:	48c9                	li	a7,18
 ecall
 56e:	00000073          	ecall
 ret
 572:	8082                	ret

0000000000000574 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 574:	48a1                	li	a7,8
 ecall
 576:	00000073          	ecall
 ret
 57a:	8082                	ret

000000000000057c <link>:
.global link
link:
 li a7, SYS_link
 57c:	48cd                	li	a7,19
 ecall
 57e:	00000073          	ecall
 ret
 582:	8082                	ret

0000000000000584 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 584:	48d1                	li	a7,20
 ecall
 586:	00000073          	ecall
 ret
 58a:	8082                	ret

000000000000058c <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 58c:	48a5                	li	a7,9
 ecall
 58e:	00000073          	ecall
 ret
 592:	8082                	ret

0000000000000594 <dup>:
.global dup
dup:
 li a7, SYS_dup
 594:	48a9                	li	a7,10
 ecall
 596:	00000073          	ecall
 ret
 59a:	8082                	ret

000000000000059c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 59c:	48ad                	li	a7,11
 ecall
 59e:	00000073          	ecall
 ret
 5a2:	8082                	ret

00000000000005a4 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 5a4:	48b1                	li	a7,12
 ecall
 5a6:	00000073          	ecall
 ret
 5aa:	8082                	ret

00000000000005ac <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 5ac:	48b5                	li	a7,13
 ecall
 5ae:	00000073          	ecall
 ret
 5b2:	8082                	ret

00000000000005b4 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 5b4:	48b9                	li	a7,14
 ecall
 5b6:	00000073          	ecall
 ret
 5ba:	8082                	ret

00000000000005bc <setSchedAlg>:
.global setSchedAlg
setSchedAlg:
 li a7, SYS_setSchedAlg
 5bc:	48d9                	li	a7,22
 ecall
 5be:	00000073          	ecall
 ret
 5c2:	8082                	ret

00000000000005c4 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 5c4:	1101                	addi	sp,sp,-32
 5c6:	ec06                	sd	ra,24(sp)
 5c8:	e822                	sd	s0,16(sp)
 5ca:	1000                	addi	s0,sp,32
 5cc:	87aa                	mv	a5,a0
 5ce:	872e                	mv	a4,a1
 5d0:	fef42623          	sw	a5,-20(s0)
 5d4:	87ba                	mv	a5,a4
 5d6:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 5da:	feb40713          	addi	a4,s0,-21
 5de:	fec42783          	lw	a5,-20(s0)
 5e2:	4605                	li	a2,1
 5e4:	85ba                	mv	a1,a4
 5e6:	853e                	mv	a0,a5
 5e8:	00000097          	auipc	ra,0x0
 5ec:	f54080e7          	jalr	-172(ra) # 53c <write>
}
 5f0:	0001                	nop
 5f2:	60e2                	ld	ra,24(sp)
 5f4:	6442                	ld	s0,16(sp)
 5f6:	6105                	addi	sp,sp,32
 5f8:	8082                	ret

00000000000005fa <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5fa:	7139                	addi	sp,sp,-64
 5fc:	fc06                	sd	ra,56(sp)
 5fe:	f822                	sd	s0,48(sp)
 600:	0080                	addi	s0,sp,64
 602:	87aa                	mv	a5,a0
 604:	8736                	mv	a4,a3
 606:	fcf42623          	sw	a5,-52(s0)
 60a:	87ae                	mv	a5,a1
 60c:	fcf42423          	sw	a5,-56(s0)
 610:	87b2                	mv	a5,a2
 612:	fcf42223          	sw	a5,-60(s0)
 616:	87ba                	mv	a5,a4
 618:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 61c:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 620:	fc042783          	lw	a5,-64(s0)
 624:	2781                	sext.w	a5,a5
 626:	c38d                	beqz	a5,648 <printint+0x4e>
 628:	fc842783          	lw	a5,-56(s0)
 62c:	2781                	sext.w	a5,a5
 62e:	0007dd63          	bgez	a5,648 <printint+0x4e>
    neg = 1;
 632:	4785                	li	a5,1
 634:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 638:	fc842783          	lw	a5,-56(s0)
 63c:	40f007bb          	negw	a5,a5
 640:	2781                	sext.w	a5,a5
 642:	fef42223          	sw	a5,-28(s0)
 646:	a029                	j	650 <printint+0x56>
  } else {
    x = xx;
 648:	fc842783          	lw	a5,-56(s0)
 64c:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 650:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 654:	fc442783          	lw	a5,-60(s0)
 658:	fe442703          	lw	a4,-28(s0)
 65c:	02f777bb          	remuw	a5,a4,a5
 660:	0007861b          	sext.w	a2,a5
 664:	fec42783          	lw	a5,-20(s0)
 668:	0017871b          	addiw	a4,a5,1
 66c:	fee42623          	sw	a4,-20(s0)
 670:	00000697          	auipc	a3,0x0
 674:	73868693          	addi	a3,a3,1848 # da8 <digits>
 678:	02061713          	slli	a4,a2,0x20
 67c:	9301                	srli	a4,a4,0x20
 67e:	9736                	add	a4,a4,a3
 680:	00074703          	lbu	a4,0(a4)
 684:	ff040693          	addi	a3,s0,-16
 688:	97b6                	add	a5,a5,a3
 68a:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 68e:	fc442783          	lw	a5,-60(s0)
 692:	fe442703          	lw	a4,-28(s0)
 696:	02f757bb          	divuw	a5,a4,a5
 69a:	fef42223          	sw	a5,-28(s0)
 69e:	fe442783          	lw	a5,-28(s0)
 6a2:	2781                	sext.w	a5,a5
 6a4:	fbc5                	bnez	a5,654 <printint+0x5a>
  if(neg)
 6a6:	fe842783          	lw	a5,-24(s0)
 6aa:	2781                	sext.w	a5,a5
 6ac:	cf95                	beqz	a5,6e8 <printint+0xee>
    buf[i++] = '-';
 6ae:	fec42783          	lw	a5,-20(s0)
 6b2:	0017871b          	addiw	a4,a5,1
 6b6:	fee42623          	sw	a4,-20(s0)
 6ba:	ff040713          	addi	a4,s0,-16
 6be:	97ba                	add	a5,a5,a4
 6c0:	02d00713          	li	a4,45
 6c4:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 6c8:	a005                	j	6e8 <printint+0xee>
    putc(fd, buf[i]);
 6ca:	fec42783          	lw	a5,-20(s0)
 6ce:	ff040713          	addi	a4,s0,-16
 6d2:	97ba                	add	a5,a5,a4
 6d4:	fe07c703          	lbu	a4,-32(a5)
 6d8:	fcc42783          	lw	a5,-52(s0)
 6dc:	85ba                	mv	a1,a4
 6de:	853e                	mv	a0,a5
 6e0:	00000097          	auipc	ra,0x0
 6e4:	ee4080e7          	jalr	-284(ra) # 5c4 <putc>
  while(--i >= 0)
 6e8:	fec42783          	lw	a5,-20(s0)
 6ec:	37fd                	addiw	a5,a5,-1
 6ee:	fef42623          	sw	a5,-20(s0)
 6f2:	fec42783          	lw	a5,-20(s0)
 6f6:	2781                	sext.w	a5,a5
 6f8:	fc07d9e3          	bgez	a5,6ca <printint+0xd0>
}
 6fc:	0001                	nop
 6fe:	0001                	nop
 700:	70e2                	ld	ra,56(sp)
 702:	7442                	ld	s0,48(sp)
 704:	6121                	addi	sp,sp,64
 706:	8082                	ret

0000000000000708 <printptr>:

static void
printptr(int fd, uint64 x) {
 708:	7179                	addi	sp,sp,-48
 70a:	f406                	sd	ra,40(sp)
 70c:	f022                	sd	s0,32(sp)
 70e:	1800                	addi	s0,sp,48
 710:	87aa                	mv	a5,a0
 712:	fcb43823          	sd	a1,-48(s0)
 716:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 71a:	fdc42783          	lw	a5,-36(s0)
 71e:	03000593          	li	a1,48
 722:	853e                	mv	a0,a5
 724:	00000097          	auipc	ra,0x0
 728:	ea0080e7          	jalr	-352(ra) # 5c4 <putc>
  putc(fd, 'x');
 72c:	fdc42783          	lw	a5,-36(s0)
 730:	07800593          	li	a1,120
 734:	853e                	mv	a0,a5
 736:	00000097          	auipc	ra,0x0
 73a:	e8e080e7          	jalr	-370(ra) # 5c4 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 73e:	fe042623          	sw	zero,-20(s0)
 742:	a82d                	j	77c <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 744:	fd043783          	ld	a5,-48(s0)
 748:	93f1                	srli	a5,a5,0x3c
 74a:	00000717          	auipc	a4,0x0
 74e:	65e70713          	addi	a4,a4,1630 # da8 <digits>
 752:	97ba                	add	a5,a5,a4
 754:	0007c703          	lbu	a4,0(a5)
 758:	fdc42783          	lw	a5,-36(s0)
 75c:	85ba                	mv	a1,a4
 75e:	853e                	mv	a0,a5
 760:	00000097          	auipc	ra,0x0
 764:	e64080e7          	jalr	-412(ra) # 5c4 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 768:	fec42783          	lw	a5,-20(s0)
 76c:	2785                	addiw	a5,a5,1
 76e:	fef42623          	sw	a5,-20(s0)
 772:	fd043783          	ld	a5,-48(s0)
 776:	0792                	slli	a5,a5,0x4
 778:	fcf43823          	sd	a5,-48(s0)
 77c:	fec42783          	lw	a5,-20(s0)
 780:	873e                	mv	a4,a5
 782:	47bd                	li	a5,15
 784:	fce7f0e3          	bgeu	a5,a4,744 <printptr+0x3c>
}
 788:	0001                	nop
 78a:	0001                	nop
 78c:	70a2                	ld	ra,40(sp)
 78e:	7402                	ld	s0,32(sp)
 790:	6145                	addi	sp,sp,48
 792:	8082                	ret

0000000000000794 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 794:	715d                	addi	sp,sp,-80
 796:	e486                	sd	ra,72(sp)
 798:	e0a2                	sd	s0,64(sp)
 79a:	0880                	addi	s0,sp,80
 79c:	87aa                	mv	a5,a0
 79e:	fcb43023          	sd	a1,-64(s0)
 7a2:	fac43c23          	sd	a2,-72(s0)
 7a6:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 7aa:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 7ae:	fe042223          	sw	zero,-28(s0)
 7b2:	a42d                	j	9dc <vprintf+0x248>
    c = fmt[i] & 0xff;
 7b4:	fe442783          	lw	a5,-28(s0)
 7b8:	fc043703          	ld	a4,-64(s0)
 7bc:	97ba                	add	a5,a5,a4
 7be:	0007c783          	lbu	a5,0(a5)
 7c2:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 7c6:	fe042783          	lw	a5,-32(s0)
 7ca:	2781                	sext.w	a5,a5
 7cc:	eb9d                	bnez	a5,802 <vprintf+0x6e>
      if(c == '%'){
 7ce:	fdc42783          	lw	a5,-36(s0)
 7d2:	0007871b          	sext.w	a4,a5
 7d6:	02500793          	li	a5,37
 7da:	00f71763          	bne	a4,a5,7e8 <vprintf+0x54>
        state = '%';
 7de:	02500793          	li	a5,37
 7e2:	fef42023          	sw	a5,-32(s0)
 7e6:	a2f5                	j	9d2 <vprintf+0x23e>
      } else {
        putc(fd, c);
 7e8:	fdc42783          	lw	a5,-36(s0)
 7ec:	0ff7f713          	andi	a4,a5,255
 7f0:	fcc42783          	lw	a5,-52(s0)
 7f4:	85ba                	mv	a1,a4
 7f6:	853e                	mv	a0,a5
 7f8:	00000097          	auipc	ra,0x0
 7fc:	dcc080e7          	jalr	-564(ra) # 5c4 <putc>
 800:	aac9                	j	9d2 <vprintf+0x23e>
      }
    } else if(state == '%'){
 802:	fe042783          	lw	a5,-32(s0)
 806:	0007871b          	sext.w	a4,a5
 80a:	02500793          	li	a5,37
 80e:	1cf71263          	bne	a4,a5,9d2 <vprintf+0x23e>
      if(c == 'd'){
 812:	fdc42783          	lw	a5,-36(s0)
 816:	0007871b          	sext.w	a4,a5
 81a:	06400793          	li	a5,100
 81e:	02f71463          	bne	a4,a5,846 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 822:	fb843783          	ld	a5,-72(s0)
 826:	00878713          	addi	a4,a5,8
 82a:	fae43c23          	sd	a4,-72(s0)
 82e:	4398                	lw	a4,0(a5)
 830:	fcc42783          	lw	a5,-52(s0)
 834:	4685                	li	a3,1
 836:	4629                	li	a2,10
 838:	85ba                	mv	a1,a4
 83a:	853e                	mv	a0,a5
 83c:	00000097          	auipc	ra,0x0
 840:	dbe080e7          	jalr	-578(ra) # 5fa <printint>
 844:	a269                	j	9ce <vprintf+0x23a>
      } else if(c == 'l') {
 846:	fdc42783          	lw	a5,-36(s0)
 84a:	0007871b          	sext.w	a4,a5
 84e:	06c00793          	li	a5,108
 852:	02f71663          	bne	a4,a5,87e <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 856:	fb843783          	ld	a5,-72(s0)
 85a:	00878713          	addi	a4,a5,8
 85e:	fae43c23          	sd	a4,-72(s0)
 862:	639c                	ld	a5,0(a5)
 864:	0007871b          	sext.w	a4,a5
 868:	fcc42783          	lw	a5,-52(s0)
 86c:	4681                	li	a3,0
 86e:	4629                	li	a2,10
 870:	85ba                	mv	a1,a4
 872:	853e                	mv	a0,a5
 874:	00000097          	auipc	ra,0x0
 878:	d86080e7          	jalr	-634(ra) # 5fa <printint>
 87c:	aa89                	j	9ce <vprintf+0x23a>
      } else if(c == 'x') {
 87e:	fdc42783          	lw	a5,-36(s0)
 882:	0007871b          	sext.w	a4,a5
 886:	07800793          	li	a5,120
 88a:	02f71463          	bne	a4,a5,8b2 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 88e:	fb843783          	ld	a5,-72(s0)
 892:	00878713          	addi	a4,a5,8
 896:	fae43c23          	sd	a4,-72(s0)
 89a:	4398                	lw	a4,0(a5)
 89c:	fcc42783          	lw	a5,-52(s0)
 8a0:	4681                	li	a3,0
 8a2:	4641                	li	a2,16
 8a4:	85ba                	mv	a1,a4
 8a6:	853e                	mv	a0,a5
 8a8:	00000097          	auipc	ra,0x0
 8ac:	d52080e7          	jalr	-686(ra) # 5fa <printint>
 8b0:	aa39                	j	9ce <vprintf+0x23a>
      } else if(c == 'p') {
 8b2:	fdc42783          	lw	a5,-36(s0)
 8b6:	0007871b          	sext.w	a4,a5
 8ba:	07000793          	li	a5,112
 8be:	02f71263          	bne	a4,a5,8e2 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 8c2:	fb843783          	ld	a5,-72(s0)
 8c6:	00878713          	addi	a4,a5,8
 8ca:	fae43c23          	sd	a4,-72(s0)
 8ce:	6398                	ld	a4,0(a5)
 8d0:	fcc42783          	lw	a5,-52(s0)
 8d4:	85ba                	mv	a1,a4
 8d6:	853e                	mv	a0,a5
 8d8:	00000097          	auipc	ra,0x0
 8dc:	e30080e7          	jalr	-464(ra) # 708 <printptr>
 8e0:	a0fd                	j	9ce <vprintf+0x23a>
      } else if(c == 's'){
 8e2:	fdc42783          	lw	a5,-36(s0)
 8e6:	0007871b          	sext.w	a4,a5
 8ea:	07300793          	li	a5,115
 8ee:	04f71c63          	bne	a4,a5,946 <vprintf+0x1b2>
        s = va_arg(ap, char*);
 8f2:	fb843783          	ld	a5,-72(s0)
 8f6:	00878713          	addi	a4,a5,8
 8fa:	fae43c23          	sd	a4,-72(s0)
 8fe:	639c                	ld	a5,0(a5)
 900:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 904:	fe843783          	ld	a5,-24(s0)
 908:	eb8d                	bnez	a5,93a <vprintf+0x1a6>
          s = "(null)";
 90a:	00000797          	auipc	a5,0x0
 90e:	49678793          	addi	a5,a5,1174 # da0 <malloc+0x15c>
 912:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 916:	a015                	j	93a <vprintf+0x1a6>
          putc(fd, *s);
 918:	fe843783          	ld	a5,-24(s0)
 91c:	0007c703          	lbu	a4,0(a5)
 920:	fcc42783          	lw	a5,-52(s0)
 924:	85ba                	mv	a1,a4
 926:	853e                	mv	a0,a5
 928:	00000097          	auipc	ra,0x0
 92c:	c9c080e7          	jalr	-868(ra) # 5c4 <putc>
          s++;
 930:	fe843783          	ld	a5,-24(s0)
 934:	0785                	addi	a5,a5,1
 936:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 93a:	fe843783          	ld	a5,-24(s0)
 93e:	0007c783          	lbu	a5,0(a5)
 942:	fbf9                	bnez	a5,918 <vprintf+0x184>
 944:	a069                	j	9ce <vprintf+0x23a>
        }
      } else if(c == 'c'){
 946:	fdc42783          	lw	a5,-36(s0)
 94a:	0007871b          	sext.w	a4,a5
 94e:	06300793          	li	a5,99
 952:	02f71463          	bne	a4,a5,97a <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 956:	fb843783          	ld	a5,-72(s0)
 95a:	00878713          	addi	a4,a5,8
 95e:	fae43c23          	sd	a4,-72(s0)
 962:	439c                	lw	a5,0(a5)
 964:	0ff7f713          	andi	a4,a5,255
 968:	fcc42783          	lw	a5,-52(s0)
 96c:	85ba                	mv	a1,a4
 96e:	853e                	mv	a0,a5
 970:	00000097          	auipc	ra,0x0
 974:	c54080e7          	jalr	-940(ra) # 5c4 <putc>
 978:	a899                	j	9ce <vprintf+0x23a>
      } else if(c == '%'){
 97a:	fdc42783          	lw	a5,-36(s0)
 97e:	0007871b          	sext.w	a4,a5
 982:	02500793          	li	a5,37
 986:	00f71f63          	bne	a4,a5,9a4 <vprintf+0x210>
        putc(fd, c);
 98a:	fdc42783          	lw	a5,-36(s0)
 98e:	0ff7f713          	andi	a4,a5,255
 992:	fcc42783          	lw	a5,-52(s0)
 996:	85ba                	mv	a1,a4
 998:	853e                	mv	a0,a5
 99a:	00000097          	auipc	ra,0x0
 99e:	c2a080e7          	jalr	-982(ra) # 5c4 <putc>
 9a2:	a035                	j	9ce <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9a4:	fcc42783          	lw	a5,-52(s0)
 9a8:	02500593          	li	a1,37
 9ac:	853e                	mv	a0,a5
 9ae:	00000097          	auipc	ra,0x0
 9b2:	c16080e7          	jalr	-1002(ra) # 5c4 <putc>
        putc(fd, c);
 9b6:	fdc42783          	lw	a5,-36(s0)
 9ba:	0ff7f713          	andi	a4,a5,255
 9be:	fcc42783          	lw	a5,-52(s0)
 9c2:	85ba                	mv	a1,a4
 9c4:	853e                	mv	a0,a5
 9c6:	00000097          	auipc	ra,0x0
 9ca:	bfe080e7          	jalr	-1026(ra) # 5c4 <putc>
      }
      state = 0;
 9ce:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 9d2:	fe442783          	lw	a5,-28(s0)
 9d6:	2785                	addiw	a5,a5,1
 9d8:	fef42223          	sw	a5,-28(s0)
 9dc:	fe442783          	lw	a5,-28(s0)
 9e0:	fc043703          	ld	a4,-64(s0)
 9e4:	97ba                	add	a5,a5,a4
 9e6:	0007c783          	lbu	a5,0(a5)
 9ea:	dc0795e3          	bnez	a5,7b4 <vprintf+0x20>
    }
  }
}
 9ee:	0001                	nop
 9f0:	0001                	nop
 9f2:	60a6                	ld	ra,72(sp)
 9f4:	6406                	ld	s0,64(sp)
 9f6:	6161                	addi	sp,sp,80
 9f8:	8082                	ret

00000000000009fa <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 9fa:	7159                	addi	sp,sp,-112
 9fc:	fc06                	sd	ra,56(sp)
 9fe:	f822                	sd	s0,48(sp)
 a00:	0080                	addi	s0,sp,64
 a02:	fcb43823          	sd	a1,-48(s0)
 a06:	e010                	sd	a2,0(s0)
 a08:	e414                	sd	a3,8(s0)
 a0a:	e818                	sd	a4,16(s0)
 a0c:	ec1c                	sd	a5,24(s0)
 a0e:	03043023          	sd	a6,32(s0)
 a12:	03143423          	sd	a7,40(s0)
 a16:	87aa                	mv	a5,a0
 a18:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 a1c:	03040793          	addi	a5,s0,48
 a20:	fcf43423          	sd	a5,-56(s0)
 a24:	fc843783          	ld	a5,-56(s0)
 a28:	fd078793          	addi	a5,a5,-48
 a2c:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 a30:	fe843703          	ld	a4,-24(s0)
 a34:	fdc42783          	lw	a5,-36(s0)
 a38:	863a                	mv	a2,a4
 a3a:	fd043583          	ld	a1,-48(s0)
 a3e:	853e                	mv	a0,a5
 a40:	00000097          	auipc	ra,0x0
 a44:	d54080e7          	jalr	-684(ra) # 794 <vprintf>
}
 a48:	0001                	nop
 a4a:	70e2                	ld	ra,56(sp)
 a4c:	7442                	ld	s0,48(sp)
 a4e:	6165                	addi	sp,sp,112
 a50:	8082                	ret

0000000000000a52 <printf>:

void
printf(const char *fmt, ...)
{
 a52:	7159                	addi	sp,sp,-112
 a54:	f406                	sd	ra,40(sp)
 a56:	f022                	sd	s0,32(sp)
 a58:	1800                	addi	s0,sp,48
 a5a:	fca43c23          	sd	a0,-40(s0)
 a5e:	e40c                	sd	a1,8(s0)
 a60:	e810                	sd	a2,16(s0)
 a62:	ec14                	sd	a3,24(s0)
 a64:	f018                	sd	a4,32(s0)
 a66:	f41c                	sd	a5,40(s0)
 a68:	03043823          	sd	a6,48(s0)
 a6c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 a70:	04040793          	addi	a5,s0,64
 a74:	fcf43823          	sd	a5,-48(s0)
 a78:	fd043783          	ld	a5,-48(s0)
 a7c:	fc878793          	addi	a5,a5,-56
 a80:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 a84:	fe843783          	ld	a5,-24(s0)
 a88:	863e                	mv	a2,a5
 a8a:	fd843583          	ld	a1,-40(s0)
 a8e:	4505                	li	a0,1
 a90:	00000097          	auipc	ra,0x0
 a94:	d04080e7          	jalr	-764(ra) # 794 <vprintf>
}
 a98:	0001                	nop
 a9a:	70a2                	ld	ra,40(sp)
 a9c:	7402                	ld	s0,32(sp)
 a9e:	6165                	addi	sp,sp,112
 aa0:	8082                	ret

0000000000000aa2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 aa2:	7179                	addi	sp,sp,-48
 aa4:	f422                	sd	s0,40(sp)
 aa6:	1800                	addi	s0,sp,48
 aa8:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 aac:	fd843783          	ld	a5,-40(s0)
 ab0:	17c1                	addi	a5,a5,-16
 ab2:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab6:	00000797          	auipc	a5,0x0
 aba:	31a78793          	addi	a5,a5,794 # dd0 <freep>
 abe:	639c                	ld	a5,0(a5)
 ac0:	fef43423          	sd	a5,-24(s0)
 ac4:	a815                	j	af8 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ac6:	fe843783          	ld	a5,-24(s0)
 aca:	639c                	ld	a5,0(a5)
 acc:	fe843703          	ld	a4,-24(s0)
 ad0:	00f76f63          	bltu	a4,a5,aee <free+0x4c>
 ad4:	fe043703          	ld	a4,-32(s0)
 ad8:	fe843783          	ld	a5,-24(s0)
 adc:	02e7eb63          	bltu	a5,a4,b12 <free+0x70>
 ae0:	fe843783          	ld	a5,-24(s0)
 ae4:	639c                	ld	a5,0(a5)
 ae6:	fe043703          	ld	a4,-32(s0)
 aea:	02f76463          	bltu	a4,a5,b12 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 aee:	fe843783          	ld	a5,-24(s0)
 af2:	639c                	ld	a5,0(a5)
 af4:	fef43423          	sd	a5,-24(s0)
 af8:	fe043703          	ld	a4,-32(s0)
 afc:	fe843783          	ld	a5,-24(s0)
 b00:	fce7f3e3          	bgeu	a5,a4,ac6 <free+0x24>
 b04:	fe843783          	ld	a5,-24(s0)
 b08:	639c                	ld	a5,0(a5)
 b0a:	fe043703          	ld	a4,-32(s0)
 b0e:	faf77ce3          	bgeu	a4,a5,ac6 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b12:	fe043783          	ld	a5,-32(s0)
 b16:	479c                	lw	a5,8(a5)
 b18:	1782                	slli	a5,a5,0x20
 b1a:	9381                	srli	a5,a5,0x20
 b1c:	0792                	slli	a5,a5,0x4
 b1e:	fe043703          	ld	a4,-32(s0)
 b22:	973e                	add	a4,a4,a5
 b24:	fe843783          	ld	a5,-24(s0)
 b28:	639c                	ld	a5,0(a5)
 b2a:	02f71763          	bne	a4,a5,b58 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
 b2e:	fe043783          	ld	a5,-32(s0)
 b32:	4798                	lw	a4,8(a5)
 b34:	fe843783          	ld	a5,-24(s0)
 b38:	639c                	ld	a5,0(a5)
 b3a:	479c                	lw	a5,8(a5)
 b3c:	9fb9                	addw	a5,a5,a4
 b3e:	0007871b          	sext.w	a4,a5
 b42:	fe043783          	ld	a5,-32(s0)
 b46:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 b48:	fe843783          	ld	a5,-24(s0)
 b4c:	639c                	ld	a5,0(a5)
 b4e:	6398                	ld	a4,0(a5)
 b50:	fe043783          	ld	a5,-32(s0)
 b54:	e398                	sd	a4,0(a5)
 b56:	a039                	j	b64 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
 b58:	fe843783          	ld	a5,-24(s0)
 b5c:	6398                	ld	a4,0(a5)
 b5e:	fe043783          	ld	a5,-32(s0)
 b62:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 b64:	fe843783          	ld	a5,-24(s0)
 b68:	479c                	lw	a5,8(a5)
 b6a:	1782                	slli	a5,a5,0x20
 b6c:	9381                	srli	a5,a5,0x20
 b6e:	0792                	slli	a5,a5,0x4
 b70:	fe843703          	ld	a4,-24(s0)
 b74:	97ba                	add	a5,a5,a4
 b76:	fe043703          	ld	a4,-32(s0)
 b7a:	02f71563          	bne	a4,a5,ba4 <free+0x102>
    p->s.size += bp->s.size;
 b7e:	fe843783          	ld	a5,-24(s0)
 b82:	4798                	lw	a4,8(a5)
 b84:	fe043783          	ld	a5,-32(s0)
 b88:	479c                	lw	a5,8(a5)
 b8a:	9fb9                	addw	a5,a5,a4
 b8c:	0007871b          	sext.w	a4,a5
 b90:	fe843783          	ld	a5,-24(s0)
 b94:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 b96:	fe043783          	ld	a5,-32(s0)
 b9a:	6398                	ld	a4,0(a5)
 b9c:	fe843783          	ld	a5,-24(s0)
 ba0:	e398                	sd	a4,0(a5)
 ba2:	a031                	j	bae <free+0x10c>
  } else
    p->s.ptr = bp;
 ba4:	fe843783          	ld	a5,-24(s0)
 ba8:	fe043703          	ld	a4,-32(s0)
 bac:	e398                	sd	a4,0(a5)
  freep = p;
 bae:	00000797          	auipc	a5,0x0
 bb2:	22278793          	addi	a5,a5,546 # dd0 <freep>
 bb6:	fe843703          	ld	a4,-24(s0)
 bba:	e398                	sd	a4,0(a5)
}
 bbc:	0001                	nop
 bbe:	7422                	ld	s0,40(sp)
 bc0:	6145                	addi	sp,sp,48
 bc2:	8082                	ret

0000000000000bc4 <morecore>:

static Header*
morecore(uint nu)
{
 bc4:	7179                	addi	sp,sp,-48
 bc6:	f406                	sd	ra,40(sp)
 bc8:	f022                	sd	s0,32(sp)
 bca:	1800                	addi	s0,sp,48
 bcc:	87aa                	mv	a5,a0
 bce:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 bd2:	fdc42783          	lw	a5,-36(s0)
 bd6:	0007871b          	sext.w	a4,a5
 bda:	6785                	lui	a5,0x1
 bdc:	00f77563          	bgeu	a4,a5,be6 <morecore+0x22>
    nu = 4096;
 be0:	6785                	lui	a5,0x1
 be2:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 be6:	fdc42783          	lw	a5,-36(s0)
 bea:	0047979b          	slliw	a5,a5,0x4
 bee:	2781                	sext.w	a5,a5
 bf0:	2781                	sext.w	a5,a5
 bf2:	853e                	mv	a0,a5
 bf4:	00000097          	auipc	ra,0x0
 bf8:	9b0080e7          	jalr	-1616(ra) # 5a4 <sbrk>
 bfc:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 c00:	fe843703          	ld	a4,-24(s0)
 c04:	57fd                	li	a5,-1
 c06:	00f71463          	bne	a4,a5,c0e <morecore+0x4a>
    return 0;
 c0a:	4781                	li	a5,0
 c0c:	a03d                	j	c3a <morecore+0x76>
  hp = (Header*)p;
 c0e:	fe843783          	ld	a5,-24(s0)
 c12:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 c16:	fe043783          	ld	a5,-32(s0)
 c1a:	fdc42703          	lw	a4,-36(s0)
 c1e:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 c20:	fe043783          	ld	a5,-32(s0)
 c24:	07c1                	addi	a5,a5,16
 c26:	853e                	mv	a0,a5
 c28:	00000097          	auipc	ra,0x0
 c2c:	e7a080e7          	jalr	-390(ra) # aa2 <free>
  return freep;
 c30:	00000797          	auipc	a5,0x0
 c34:	1a078793          	addi	a5,a5,416 # dd0 <freep>
 c38:	639c                	ld	a5,0(a5)
}
 c3a:	853e                	mv	a0,a5
 c3c:	70a2                	ld	ra,40(sp)
 c3e:	7402                	ld	s0,32(sp)
 c40:	6145                	addi	sp,sp,48
 c42:	8082                	ret

0000000000000c44 <malloc>:

void*
malloc(uint nbytes)
{
 c44:	7139                	addi	sp,sp,-64
 c46:	fc06                	sd	ra,56(sp)
 c48:	f822                	sd	s0,48(sp)
 c4a:	0080                	addi	s0,sp,64
 c4c:	87aa                	mv	a5,a0
 c4e:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c52:	fcc46783          	lwu	a5,-52(s0)
 c56:	07bd                	addi	a5,a5,15
 c58:	8391                	srli	a5,a5,0x4
 c5a:	2781                	sext.w	a5,a5
 c5c:	2785                	addiw	a5,a5,1
 c5e:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 c62:	00000797          	auipc	a5,0x0
 c66:	16e78793          	addi	a5,a5,366 # dd0 <freep>
 c6a:	639c                	ld	a5,0(a5)
 c6c:	fef43023          	sd	a5,-32(s0)
 c70:	fe043783          	ld	a5,-32(s0)
 c74:	ef95                	bnez	a5,cb0 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 c76:	00000797          	auipc	a5,0x0
 c7a:	14a78793          	addi	a5,a5,330 # dc0 <base>
 c7e:	fef43023          	sd	a5,-32(s0)
 c82:	00000797          	auipc	a5,0x0
 c86:	14e78793          	addi	a5,a5,334 # dd0 <freep>
 c8a:	fe043703          	ld	a4,-32(s0)
 c8e:	e398                	sd	a4,0(a5)
 c90:	00000797          	auipc	a5,0x0
 c94:	14078793          	addi	a5,a5,320 # dd0 <freep>
 c98:	6398                	ld	a4,0(a5)
 c9a:	00000797          	auipc	a5,0x0
 c9e:	12678793          	addi	a5,a5,294 # dc0 <base>
 ca2:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 ca4:	00000797          	auipc	a5,0x0
 ca8:	11c78793          	addi	a5,a5,284 # dc0 <base>
 cac:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 cb0:	fe043783          	ld	a5,-32(s0)
 cb4:	639c                	ld	a5,0(a5)
 cb6:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 cba:	fe843783          	ld	a5,-24(s0)
 cbe:	4798                	lw	a4,8(a5)
 cc0:	fdc42783          	lw	a5,-36(s0)
 cc4:	2781                	sext.w	a5,a5
 cc6:	06f76863          	bltu	a4,a5,d36 <malloc+0xf2>
      if(p->s.size == nunits)
 cca:	fe843783          	ld	a5,-24(s0)
 cce:	4798                	lw	a4,8(a5)
 cd0:	fdc42783          	lw	a5,-36(s0)
 cd4:	2781                	sext.w	a5,a5
 cd6:	00e79963          	bne	a5,a4,ce8 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 cda:	fe843783          	ld	a5,-24(s0)
 cde:	6398                	ld	a4,0(a5)
 ce0:	fe043783          	ld	a5,-32(s0)
 ce4:	e398                	sd	a4,0(a5)
 ce6:	a82d                	j	d20 <malloc+0xdc>
      else {
        p->s.size -= nunits;
 ce8:	fe843783          	ld	a5,-24(s0)
 cec:	4798                	lw	a4,8(a5)
 cee:	fdc42783          	lw	a5,-36(s0)
 cf2:	40f707bb          	subw	a5,a4,a5
 cf6:	0007871b          	sext.w	a4,a5
 cfa:	fe843783          	ld	a5,-24(s0)
 cfe:	c798                	sw	a4,8(a5)
        p += p->s.size;
 d00:	fe843783          	ld	a5,-24(s0)
 d04:	479c                	lw	a5,8(a5)
 d06:	1782                	slli	a5,a5,0x20
 d08:	9381                	srli	a5,a5,0x20
 d0a:	0792                	slli	a5,a5,0x4
 d0c:	fe843703          	ld	a4,-24(s0)
 d10:	97ba                	add	a5,a5,a4
 d12:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 d16:	fe843783          	ld	a5,-24(s0)
 d1a:	fdc42703          	lw	a4,-36(s0)
 d1e:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 d20:	00000797          	auipc	a5,0x0
 d24:	0b078793          	addi	a5,a5,176 # dd0 <freep>
 d28:	fe043703          	ld	a4,-32(s0)
 d2c:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 d2e:	fe843783          	ld	a5,-24(s0)
 d32:	07c1                	addi	a5,a5,16
 d34:	a091                	j	d78 <malloc+0x134>
    }
    if(p == freep)
 d36:	00000797          	auipc	a5,0x0
 d3a:	09a78793          	addi	a5,a5,154 # dd0 <freep>
 d3e:	639c                	ld	a5,0(a5)
 d40:	fe843703          	ld	a4,-24(s0)
 d44:	02f71063          	bne	a4,a5,d64 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
 d48:	fdc42783          	lw	a5,-36(s0)
 d4c:	853e                	mv	a0,a5
 d4e:	00000097          	auipc	ra,0x0
 d52:	e76080e7          	jalr	-394(ra) # bc4 <morecore>
 d56:	fea43423          	sd	a0,-24(s0)
 d5a:	fe843783          	ld	a5,-24(s0)
 d5e:	e399                	bnez	a5,d64 <malloc+0x120>
        return 0;
 d60:	4781                	li	a5,0
 d62:	a819                	j	d78 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d64:	fe843783          	ld	a5,-24(s0)
 d68:	fef43023          	sd	a5,-32(s0)
 d6c:	fe843783          	ld	a5,-24(s0)
 d70:	639c                	ld	a5,0(a5)
 d72:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 d76:	b791                	j	cba <malloc+0x76>
  }
}
 d78:	853e                	mv	a0,a5
 d7a:	70e2                	ld	ra,56(sp)
 d7c:	7442                	ld	s0,48(sp)
 d7e:	6121                	addi	sp,sp,64
 d80:	8082                	ret
