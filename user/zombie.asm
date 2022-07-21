
user/_zombie:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(void)
{
   0:	1141                	addi	sp,sp,-16
   2:	e406                	sd	ra,8(sp)
   4:	e022                	sd	s0,0(sp)
   6:	0800                	addi	s0,sp,16
  if(fork() > 0)
   8:	00000097          	auipc	ra,0x0
   c:	4aa080e7          	jalr	1194(ra) # 4b2 <fork>
  10:	87aa                	mv	a5,a0
  12:	00f05763          	blez	a5,20 <main+0x20>
    sleep(5);  // Let child exit before parent.
  16:	4515                	li	a0,5
  18:	00000097          	auipc	ra,0x0
  1c:	532080e7          	jalr	1330(ra) # 54a <sleep>
  exit(0);
  20:	4501                	li	a0,0
  22:	00000097          	auipc	ra,0x0
  26:	498080e7          	jalr	1176(ra) # 4ba <exit>

000000000000002a <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
  2a:	7179                	addi	sp,sp,-48
  2c:	f422                	sd	s0,40(sp)
  2e:	1800                	addi	s0,sp,48
  30:	fca43c23          	sd	a0,-40(s0)
  34:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
  38:	fd843783          	ld	a5,-40(s0)
  3c:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
  40:	0001                	nop
  42:	fd043703          	ld	a4,-48(s0)
  46:	00170793          	addi	a5,a4,1
  4a:	fcf43823          	sd	a5,-48(s0)
  4e:	fd843783          	ld	a5,-40(s0)
  52:	00178693          	addi	a3,a5,1
  56:	fcd43c23          	sd	a3,-40(s0)
  5a:	00074703          	lbu	a4,0(a4)
  5e:	00e78023          	sb	a4,0(a5)
  62:	0007c783          	lbu	a5,0(a5)
  66:	fff1                	bnez	a5,42 <strcpy+0x18>
    ;
  return os;
  68:	fe843783          	ld	a5,-24(s0)
}
  6c:	853e                	mv	a0,a5
  6e:	7422                	ld	s0,40(sp)
  70:	6145                	addi	sp,sp,48
  72:	8082                	ret

0000000000000074 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  74:	1101                	addi	sp,sp,-32
  76:	ec22                	sd	s0,24(sp)
  78:	1000                	addi	s0,sp,32
  7a:	fea43423          	sd	a0,-24(s0)
  7e:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
  82:	a819                	j	98 <strcmp+0x24>
    p++, q++;
  84:	fe843783          	ld	a5,-24(s0)
  88:	0785                	addi	a5,a5,1
  8a:	fef43423          	sd	a5,-24(s0)
  8e:	fe043783          	ld	a5,-32(s0)
  92:	0785                	addi	a5,a5,1
  94:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
  98:	fe843783          	ld	a5,-24(s0)
  9c:	0007c783          	lbu	a5,0(a5)
  a0:	cb99                	beqz	a5,b6 <strcmp+0x42>
  a2:	fe843783          	ld	a5,-24(s0)
  a6:	0007c703          	lbu	a4,0(a5)
  aa:	fe043783          	ld	a5,-32(s0)
  ae:	0007c783          	lbu	a5,0(a5)
  b2:	fcf709e3          	beq	a4,a5,84 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
  b6:	fe843783          	ld	a5,-24(s0)
  ba:	0007c783          	lbu	a5,0(a5)
  be:	0007871b          	sext.w	a4,a5
  c2:	fe043783          	ld	a5,-32(s0)
  c6:	0007c783          	lbu	a5,0(a5)
  ca:	2781                	sext.w	a5,a5
  cc:	40f707bb          	subw	a5,a4,a5
  d0:	2781                	sext.w	a5,a5
}
  d2:	853e                	mv	a0,a5
  d4:	6462                	ld	s0,24(sp)
  d6:	6105                	addi	sp,sp,32
  d8:	8082                	ret

00000000000000da <strlen>:

uint
strlen(const char *s)
{
  da:	7179                	addi	sp,sp,-48
  dc:	f422                	sd	s0,40(sp)
  de:	1800                	addi	s0,sp,48
  e0:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
  e4:	fe042623          	sw	zero,-20(s0)
  e8:	a031                	j	f4 <strlen+0x1a>
  ea:	fec42783          	lw	a5,-20(s0)
  ee:	2785                	addiw	a5,a5,1
  f0:	fef42623          	sw	a5,-20(s0)
  f4:	fec42783          	lw	a5,-20(s0)
  f8:	fd843703          	ld	a4,-40(s0)
  fc:	97ba                	add	a5,a5,a4
  fe:	0007c783          	lbu	a5,0(a5)
 102:	f7e5                	bnez	a5,ea <strlen+0x10>
    ;
  return n;
 104:	fec42783          	lw	a5,-20(s0)
}
 108:	853e                	mv	a0,a5
 10a:	7422                	ld	s0,40(sp)
 10c:	6145                	addi	sp,sp,48
 10e:	8082                	ret

0000000000000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	7179                	addi	sp,sp,-48
 112:	f422                	sd	s0,40(sp)
 114:	1800                	addi	s0,sp,48
 116:	fca43c23          	sd	a0,-40(s0)
 11a:	87ae                	mv	a5,a1
 11c:	8732                	mv	a4,a2
 11e:	fcf42a23          	sw	a5,-44(s0)
 122:	87ba                	mv	a5,a4
 124:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 128:	fd843783          	ld	a5,-40(s0)
 12c:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 130:	fe042623          	sw	zero,-20(s0)
 134:	a00d                	j	156 <memset+0x46>
    cdst[i] = c;
 136:	fec42783          	lw	a5,-20(s0)
 13a:	fe043703          	ld	a4,-32(s0)
 13e:	97ba                	add	a5,a5,a4
 140:	fd442703          	lw	a4,-44(s0)
 144:	0ff77713          	andi	a4,a4,255
 148:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 14c:	fec42783          	lw	a5,-20(s0)
 150:	2785                	addiw	a5,a5,1
 152:	fef42623          	sw	a5,-20(s0)
 156:	fec42703          	lw	a4,-20(s0)
 15a:	fd042783          	lw	a5,-48(s0)
 15e:	2781                	sext.w	a5,a5
 160:	fcf76be3          	bltu	a4,a5,136 <memset+0x26>
  }
  return dst;
 164:	fd843783          	ld	a5,-40(s0)
}
 168:	853e                	mv	a0,a5
 16a:	7422                	ld	s0,40(sp)
 16c:	6145                	addi	sp,sp,48
 16e:	8082                	ret

0000000000000170 <strchr>:

char*
strchr(const char *s, char c)
{
 170:	1101                	addi	sp,sp,-32
 172:	ec22                	sd	s0,24(sp)
 174:	1000                	addi	s0,sp,32
 176:	fea43423          	sd	a0,-24(s0)
 17a:	87ae                	mv	a5,a1
 17c:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 180:	a01d                	j	1a6 <strchr+0x36>
    if(*s == c)
 182:	fe843783          	ld	a5,-24(s0)
 186:	0007c703          	lbu	a4,0(a5)
 18a:	fe744783          	lbu	a5,-25(s0)
 18e:	0ff7f793          	andi	a5,a5,255
 192:	00e79563          	bne	a5,a4,19c <strchr+0x2c>
      return (char*)s;
 196:	fe843783          	ld	a5,-24(s0)
 19a:	a821                	j	1b2 <strchr+0x42>
  for(; *s; s++)
 19c:	fe843783          	ld	a5,-24(s0)
 1a0:	0785                	addi	a5,a5,1
 1a2:	fef43423          	sd	a5,-24(s0)
 1a6:	fe843783          	ld	a5,-24(s0)
 1aa:	0007c783          	lbu	a5,0(a5)
 1ae:	fbf1                	bnez	a5,182 <strchr+0x12>
  return 0;
 1b0:	4781                	li	a5,0
}
 1b2:	853e                	mv	a0,a5
 1b4:	6462                	ld	s0,24(sp)
 1b6:	6105                	addi	sp,sp,32
 1b8:	8082                	ret

00000000000001ba <gets>:

char*
gets(char *buf, int max)
{
 1ba:	7179                	addi	sp,sp,-48
 1bc:	f406                	sd	ra,40(sp)
 1be:	f022                	sd	s0,32(sp)
 1c0:	1800                	addi	s0,sp,48
 1c2:	fca43c23          	sd	a0,-40(s0)
 1c6:	87ae                	mv	a5,a1
 1c8:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1cc:	fe042623          	sw	zero,-20(s0)
 1d0:	a8a1                	j	228 <gets+0x6e>
    cc = read(0, &c, 1);
 1d2:	fe740793          	addi	a5,s0,-25
 1d6:	4605                	li	a2,1
 1d8:	85be                	mv	a1,a5
 1da:	4501                	li	a0,0
 1dc:	00000097          	auipc	ra,0x0
 1e0:	2f6080e7          	jalr	758(ra) # 4d2 <read>
 1e4:	87aa                	mv	a5,a0
 1e6:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 1ea:	fe842783          	lw	a5,-24(s0)
 1ee:	2781                	sext.w	a5,a5
 1f0:	04f05763          	blez	a5,23e <gets+0x84>
      break;
    buf[i++] = c;
 1f4:	fec42783          	lw	a5,-20(s0)
 1f8:	0017871b          	addiw	a4,a5,1
 1fc:	fee42623          	sw	a4,-20(s0)
 200:	873e                	mv	a4,a5
 202:	fd843783          	ld	a5,-40(s0)
 206:	97ba                	add	a5,a5,a4
 208:	fe744703          	lbu	a4,-25(s0)
 20c:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 210:	fe744783          	lbu	a5,-25(s0)
 214:	873e                	mv	a4,a5
 216:	47a9                	li	a5,10
 218:	02f70463          	beq	a4,a5,240 <gets+0x86>
 21c:	fe744783          	lbu	a5,-25(s0)
 220:	873e                	mv	a4,a5
 222:	47b5                	li	a5,13
 224:	00f70e63          	beq	a4,a5,240 <gets+0x86>
  for(i=0; i+1 < max; ){
 228:	fec42783          	lw	a5,-20(s0)
 22c:	2785                	addiw	a5,a5,1
 22e:	0007871b          	sext.w	a4,a5
 232:	fd442783          	lw	a5,-44(s0)
 236:	2781                	sext.w	a5,a5
 238:	f8f74de3          	blt	a4,a5,1d2 <gets+0x18>
 23c:	a011                	j	240 <gets+0x86>
      break;
 23e:	0001                	nop
      break;
  }
  buf[i] = '\0';
 240:	fec42783          	lw	a5,-20(s0)
 244:	fd843703          	ld	a4,-40(s0)
 248:	97ba                	add	a5,a5,a4
 24a:	00078023          	sb	zero,0(a5)
  return buf;
 24e:	fd843783          	ld	a5,-40(s0)
}
 252:	853e                	mv	a0,a5
 254:	70a2                	ld	ra,40(sp)
 256:	7402                	ld	s0,32(sp)
 258:	6145                	addi	sp,sp,48
 25a:	8082                	ret

000000000000025c <stat>:

int
stat(const char *n, struct stat *st)
{
 25c:	7179                	addi	sp,sp,-48
 25e:	f406                	sd	ra,40(sp)
 260:	f022                	sd	s0,32(sp)
 262:	1800                	addi	s0,sp,48
 264:	fca43c23          	sd	a0,-40(s0)
 268:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 26c:	4581                	li	a1,0
 26e:	fd843503          	ld	a0,-40(s0)
 272:	00000097          	auipc	ra,0x0
 276:	288080e7          	jalr	648(ra) # 4fa <open>
 27a:	87aa                	mv	a5,a0
 27c:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 280:	fec42783          	lw	a5,-20(s0)
 284:	2781                	sext.w	a5,a5
 286:	0007d463          	bgez	a5,28e <stat+0x32>
    return -1;
 28a:	57fd                	li	a5,-1
 28c:	a035                	j	2b8 <stat+0x5c>
  r = fstat(fd, st);
 28e:	fec42783          	lw	a5,-20(s0)
 292:	fd043583          	ld	a1,-48(s0)
 296:	853e                	mv	a0,a5
 298:	00000097          	auipc	ra,0x0
 29c:	27a080e7          	jalr	634(ra) # 512 <fstat>
 2a0:	87aa                	mv	a5,a0
 2a2:	fef42423          	sw	a5,-24(s0)
  close(fd);
 2a6:	fec42783          	lw	a5,-20(s0)
 2aa:	853e                	mv	a0,a5
 2ac:	00000097          	auipc	ra,0x0
 2b0:	236080e7          	jalr	566(ra) # 4e2 <close>
  return r;
 2b4:	fe842783          	lw	a5,-24(s0)
}
 2b8:	853e                	mv	a0,a5
 2ba:	70a2                	ld	ra,40(sp)
 2bc:	7402                	ld	s0,32(sp)
 2be:	6145                	addi	sp,sp,48
 2c0:	8082                	ret

00000000000002c2 <atoi>:

int
atoi(const char *s)
{
 2c2:	7179                	addi	sp,sp,-48
 2c4:	f422                	sd	s0,40(sp)
 2c6:	1800                	addi	s0,sp,48
 2c8:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 2cc:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 2d0:	a815                	j	304 <atoi+0x42>
    n = n*10 + *s++ - '0';
 2d2:	fec42703          	lw	a4,-20(s0)
 2d6:	87ba                	mv	a5,a4
 2d8:	0027979b          	slliw	a5,a5,0x2
 2dc:	9fb9                	addw	a5,a5,a4
 2de:	0017979b          	slliw	a5,a5,0x1
 2e2:	0007871b          	sext.w	a4,a5
 2e6:	fd843783          	ld	a5,-40(s0)
 2ea:	00178693          	addi	a3,a5,1
 2ee:	fcd43c23          	sd	a3,-40(s0)
 2f2:	0007c783          	lbu	a5,0(a5)
 2f6:	2781                	sext.w	a5,a5
 2f8:	9fb9                	addw	a5,a5,a4
 2fa:	2781                	sext.w	a5,a5
 2fc:	fd07879b          	addiw	a5,a5,-48
 300:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 304:	fd843783          	ld	a5,-40(s0)
 308:	0007c783          	lbu	a5,0(a5)
 30c:	873e                	mv	a4,a5
 30e:	02f00793          	li	a5,47
 312:	00e7fb63          	bgeu	a5,a4,328 <atoi+0x66>
 316:	fd843783          	ld	a5,-40(s0)
 31a:	0007c783          	lbu	a5,0(a5)
 31e:	873e                	mv	a4,a5
 320:	03900793          	li	a5,57
 324:	fae7f7e3          	bgeu	a5,a4,2d2 <atoi+0x10>
  return n;
 328:	fec42783          	lw	a5,-20(s0)
}
 32c:	853e                	mv	a0,a5
 32e:	7422                	ld	s0,40(sp)
 330:	6145                	addi	sp,sp,48
 332:	8082                	ret

0000000000000334 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 334:	7139                	addi	sp,sp,-64
 336:	fc22                	sd	s0,56(sp)
 338:	0080                	addi	s0,sp,64
 33a:	fca43c23          	sd	a0,-40(s0)
 33e:	fcb43823          	sd	a1,-48(s0)
 342:	87b2                	mv	a5,a2
 344:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 348:	fd843783          	ld	a5,-40(s0)
 34c:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 350:	fd043783          	ld	a5,-48(s0)
 354:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 358:	fe043703          	ld	a4,-32(s0)
 35c:	fe843783          	ld	a5,-24(s0)
 360:	02e7fc63          	bgeu	a5,a4,398 <memmove+0x64>
    while(n-- > 0)
 364:	a00d                	j	386 <memmove+0x52>
      *dst++ = *src++;
 366:	fe043703          	ld	a4,-32(s0)
 36a:	00170793          	addi	a5,a4,1
 36e:	fef43023          	sd	a5,-32(s0)
 372:	fe843783          	ld	a5,-24(s0)
 376:	00178693          	addi	a3,a5,1
 37a:	fed43423          	sd	a3,-24(s0)
 37e:	00074703          	lbu	a4,0(a4)
 382:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 386:	fcc42783          	lw	a5,-52(s0)
 38a:	fff7871b          	addiw	a4,a5,-1
 38e:	fce42623          	sw	a4,-52(s0)
 392:	fcf04ae3          	bgtz	a5,366 <memmove+0x32>
 396:	a891                	j	3ea <memmove+0xb6>
  } else {
    dst += n;
 398:	fcc42783          	lw	a5,-52(s0)
 39c:	fe843703          	ld	a4,-24(s0)
 3a0:	97ba                	add	a5,a5,a4
 3a2:	fef43423          	sd	a5,-24(s0)
    src += n;
 3a6:	fcc42783          	lw	a5,-52(s0)
 3aa:	fe043703          	ld	a4,-32(s0)
 3ae:	97ba                	add	a5,a5,a4
 3b0:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 3b4:	a01d                	j	3da <memmove+0xa6>
      *--dst = *--src;
 3b6:	fe043783          	ld	a5,-32(s0)
 3ba:	17fd                	addi	a5,a5,-1
 3bc:	fef43023          	sd	a5,-32(s0)
 3c0:	fe843783          	ld	a5,-24(s0)
 3c4:	17fd                	addi	a5,a5,-1
 3c6:	fef43423          	sd	a5,-24(s0)
 3ca:	fe043783          	ld	a5,-32(s0)
 3ce:	0007c703          	lbu	a4,0(a5)
 3d2:	fe843783          	ld	a5,-24(s0)
 3d6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 3da:	fcc42783          	lw	a5,-52(s0)
 3de:	fff7871b          	addiw	a4,a5,-1
 3e2:	fce42623          	sw	a4,-52(s0)
 3e6:	fcf048e3          	bgtz	a5,3b6 <memmove+0x82>
  }
  return vdst;
 3ea:	fd843783          	ld	a5,-40(s0)
}
 3ee:	853e                	mv	a0,a5
 3f0:	7462                	ld	s0,56(sp)
 3f2:	6121                	addi	sp,sp,64
 3f4:	8082                	ret

00000000000003f6 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 3f6:	7139                	addi	sp,sp,-64
 3f8:	fc22                	sd	s0,56(sp)
 3fa:	0080                	addi	s0,sp,64
 3fc:	fca43c23          	sd	a0,-40(s0)
 400:	fcb43823          	sd	a1,-48(s0)
 404:	87b2                	mv	a5,a2
 406:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 40a:	fd843783          	ld	a5,-40(s0)
 40e:	fef43423          	sd	a5,-24(s0)
 412:	fd043783          	ld	a5,-48(s0)
 416:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 41a:	a0a1                	j	462 <memcmp+0x6c>
    if (*p1 != *p2) {
 41c:	fe843783          	ld	a5,-24(s0)
 420:	0007c703          	lbu	a4,0(a5)
 424:	fe043783          	ld	a5,-32(s0)
 428:	0007c783          	lbu	a5,0(a5)
 42c:	02f70163          	beq	a4,a5,44e <memcmp+0x58>
      return *p1 - *p2;
 430:	fe843783          	ld	a5,-24(s0)
 434:	0007c783          	lbu	a5,0(a5)
 438:	0007871b          	sext.w	a4,a5
 43c:	fe043783          	ld	a5,-32(s0)
 440:	0007c783          	lbu	a5,0(a5)
 444:	2781                	sext.w	a5,a5
 446:	40f707bb          	subw	a5,a4,a5
 44a:	2781                	sext.w	a5,a5
 44c:	a01d                	j	472 <memcmp+0x7c>
    }
    p1++;
 44e:	fe843783          	ld	a5,-24(s0)
 452:	0785                	addi	a5,a5,1
 454:	fef43423          	sd	a5,-24(s0)
    p2++;
 458:	fe043783          	ld	a5,-32(s0)
 45c:	0785                	addi	a5,a5,1
 45e:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 462:	fcc42783          	lw	a5,-52(s0)
 466:	fff7871b          	addiw	a4,a5,-1
 46a:	fce42623          	sw	a4,-52(s0)
 46e:	f7dd                	bnez	a5,41c <memcmp+0x26>
  }
  return 0;
 470:	4781                	li	a5,0
}
 472:	853e                	mv	a0,a5
 474:	7462                	ld	s0,56(sp)
 476:	6121                	addi	sp,sp,64
 478:	8082                	ret

000000000000047a <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 47a:	7179                	addi	sp,sp,-48
 47c:	f406                	sd	ra,40(sp)
 47e:	f022                	sd	s0,32(sp)
 480:	1800                	addi	s0,sp,48
 482:	fea43423          	sd	a0,-24(s0)
 486:	feb43023          	sd	a1,-32(s0)
 48a:	87b2                	mv	a5,a2
 48c:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 490:	fdc42783          	lw	a5,-36(s0)
 494:	863e                	mv	a2,a5
 496:	fe043583          	ld	a1,-32(s0)
 49a:	fe843503          	ld	a0,-24(s0)
 49e:	00000097          	auipc	ra,0x0
 4a2:	e96080e7          	jalr	-362(ra) # 334 <memmove>
 4a6:	87aa                	mv	a5,a0
}
 4a8:	853e                	mv	a0,a5
 4aa:	70a2                	ld	ra,40(sp)
 4ac:	7402                	ld	s0,32(sp)
 4ae:	6145                	addi	sp,sp,48
 4b0:	8082                	ret

00000000000004b2 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 4b2:	4885                	li	a7,1
 ecall
 4b4:	00000073          	ecall
 ret
 4b8:	8082                	ret

00000000000004ba <exit>:
.global exit
exit:
 li a7, SYS_exit
 4ba:	4889                	li	a7,2
 ecall
 4bc:	00000073          	ecall
 ret
 4c0:	8082                	ret

00000000000004c2 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4c2:	488d                	li	a7,3
 ecall
 4c4:	00000073          	ecall
 ret
 4c8:	8082                	ret

00000000000004ca <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4ca:	4891                	li	a7,4
 ecall
 4cc:	00000073          	ecall
 ret
 4d0:	8082                	ret

00000000000004d2 <read>:
.global read
read:
 li a7, SYS_read
 4d2:	4895                	li	a7,5
 ecall
 4d4:	00000073          	ecall
 ret
 4d8:	8082                	ret

00000000000004da <write>:
.global write
write:
 li a7, SYS_write
 4da:	48c1                	li	a7,16
 ecall
 4dc:	00000073          	ecall
 ret
 4e0:	8082                	ret

00000000000004e2 <close>:
.global close
close:
 li a7, SYS_close
 4e2:	48d5                	li	a7,21
 ecall
 4e4:	00000073          	ecall
 ret
 4e8:	8082                	ret

00000000000004ea <kill>:
.global kill
kill:
 li a7, SYS_kill
 4ea:	4899                	li	a7,6
 ecall
 4ec:	00000073          	ecall
 ret
 4f0:	8082                	ret

00000000000004f2 <exec>:
.global exec
exec:
 li a7, SYS_exec
 4f2:	489d                	li	a7,7
 ecall
 4f4:	00000073          	ecall
 ret
 4f8:	8082                	ret

00000000000004fa <open>:
.global open
open:
 li a7, SYS_open
 4fa:	48bd                	li	a7,15
 ecall
 4fc:	00000073          	ecall
 ret
 500:	8082                	ret

0000000000000502 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 502:	48c5                	li	a7,17
 ecall
 504:	00000073          	ecall
 ret
 508:	8082                	ret

000000000000050a <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 50a:	48c9                	li	a7,18
 ecall
 50c:	00000073          	ecall
 ret
 510:	8082                	ret

0000000000000512 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 512:	48a1                	li	a7,8
 ecall
 514:	00000073          	ecall
 ret
 518:	8082                	ret

000000000000051a <link>:
.global link
link:
 li a7, SYS_link
 51a:	48cd                	li	a7,19
 ecall
 51c:	00000073          	ecall
 ret
 520:	8082                	ret

0000000000000522 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 522:	48d1                	li	a7,20
 ecall
 524:	00000073          	ecall
 ret
 528:	8082                	ret

000000000000052a <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 52a:	48a5                	li	a7,9
 ecall
 52c:	00000073          	ecall
 ret
 530:	8082                	ret

0000000000000532 <dup>:
.global dup
dup:
 li a7, SYS_dup
 532:	48a9                	li	a7,10
 ecall
 534:	00000073          	ecall
 ret
 538:	8082                	ret

000000000000053a <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 53a:	48ad                	li	a7,11
 ecall
 53c:	00000073          	ecall
 ret
 540:	8082                	ret

0000000000000542 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 542:	48b1                	li	a7,12
 ecall
 544:	00000073          	ecall
 ret
 548:	8082                	ret

000000000000054a <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 54a:	48b5                	li	a7,13
 ecall
 54c:	00000073          	ecall
 ret
 550:	8082                	ret

0000000000000552 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 552:	48b9                	li	a7,14
 ecall
 554:	00000073          	ecall
 ret
 558:	8082                	ret

000000000000055a <setSchedAlg>:
.global setSchedAlg
setSchedAlg:
 li a7, SYS_setSchedAlg
 55a:	48d9                	li	a7,22
 ecall
 55c:	00000073          	ecall
 ret
 560:	8082                	ret

0000000000000562 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 562:	1101                	addi	sp,sp,-32
 564:	ec06                	sd	ra,24(sp)
 566:	e822                	sd	s0,16(sp)
 568:	1000                	addi	s0,sp,32
 56a:	87aa                	mv	a5,a0
 56c:	872e                	mv	a4,a1
 56e:	fef42623          	sw	a5,-20(s0)
 572:	87ba                	mv	a5,a4
 574:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 578:	feb40713          	addi	a4,s0,-21
 57c:	fec42783          	lw	a5,-20(s0)
 580:	4605                	li	a2,1
 582:	85ba                	mv	a1,a4
 584:	853e                	mv	a0,a5
 586:	00000097          	auipc	ra,0x0
 58a:	f54080e7          	jalr	-172(ra) # 4da <write>
}
 58e:	0001                	nop
 590:	60e2                	ld	ra,24(sp)
 592:	6442                	ld	s0,16(sp)
 594:	6105                	addi	sp,sp,32
 596:	8082                	ret

0000000000000598 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 598:	7139                	addi	sp,sp,-64
 59a:	fc06                	sd	ra,56(sp)
 59c:	f822                	sd	s0,48(sp)
 59e:	0080                	addi	s0,sp,64
 5a0:	87aa                	mv	a5,a0
 5a2:	8736                	mv	a4,a3
 5a4:	fcf42623          	sw	a5,-52(s0)
 5a8:	87ae                	mv	a5,a1
 5aa:	fcf42423          	sw	a5,-56(s0)
 5ae:	87b2                	mv	a5,a2
 5b0:	fcf42223          	sw	a5,-60(s0)
 5b4:	87ba                	mv	a5,a4
 5b6:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5ba:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 5be:	fc042783          	lw	a5,-64(s0)
 5c2:	2781                	sext.w	a5,a5
 5c4:	c38d                	beqz	a5,5e6 <printint+0x4e>
 5c6:	fc842783          	lw	a5,-56(s0)
 5ca:	2781                	sext.w	a5,a5
 5cc:	0007dd63          	bgez	a5,5e6 <printint+0x4e>
    neg = 1;
 5d0:	4785                	li	a5,1
 5d2:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 5d6:	fc842783          	lw	a5,-56(s0)
 5da:	40f007bb          	negw	a5,a5
 5de:	2781                	sext.w	a5,a5
 5e0:	fef42223          	sw	a5,-28(s0)
 5e4:	a029                	j	5ee <printint+0x56>
  } else {
    x = xx;
 5e6:	fc842783          	lw	a5,-56(s0)
 5ea:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 5ee:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 5f2:	fc442783          	lw	a5,-60(s0)
 5f6:	fe442703          	lw	a4,-28(s0)
 5fa:	02f777bb          	remuw	a5,a4,a5
 5fe:	0007861b          	sext.w	a2,a5
 602:	fec42783          	lw	a5,-20(s0)
 606:	0017871b          	addiw	a4,a5,1
 60a:	fee42623          	sw	a4,-20(s0)
 60e:	00000697          	auipc	a3,0x0
 612:	71a68693          	addi	a3,a3,1818 # d28 <digits>
 616:	02061713          	slli	a4,a2,0x20
 61a:	9301                	srli	a4,a4,0x20
 61c:	9736                	add	a4,a4,a3
 61e:	00074703          	lbu	a4,0(a4)
 622:	ff040693          	addi	a3,s0,-16
 626:	97b6                	add	a5,a5,a3
 628:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 62c:	fc442783          	lw	a5,-60(s0)
 630:	fe442703          	lw	a4,-28(s0)
 634:	02f757bb          	divuw	a5,a4,a5
 638:	fef42223          	sw	a5,-28(s0)
 63c:	fe442783          	lw	a5,-28(s0)
 640:	2781                	sext.w	a5,a5
 642:	fbc5                	bnez	a5,5f2 <printint+0x5a>
  if(neg)
 644:	fe842783          	lw	a5,-24(s0)
 648:	2781                	sext.w	a5,a5
 64a:	cf95                	beqz	a5,686 <printint+0xee>
    buf[i++] = '-';
 64c:	fec42783          	lw	a5,-20(s0)
 650:	0017871b          	addiw	a4,a5,1
 654:	fee42623          	sw	a4,-20(s0)
 658:	ff040713          	addi	a4,s0,-16
 65c:	97ba                	add	a5,a5,a4
 65e:	02d00713          	li	a4,45
 662:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 666:	a005                	j	686 <printint+0xee>
    putc(fd, buf[i]);
 668:	fec42783          	lw	a5,-20(s0)
 66c:	ff040713          	addi	a4,s0,-16
 670:	97ba                	add	a5,a5,a4
 672:	fe07c703          	lbu	a4,-32(a5)
 676:	fcc42783          	lw	a5,-52(s0)
 67a:	85ba                	mv	a1,a4
 67c:	853e                	mv	a0,a5
 67e:	00000097          	auipc	ra,0x0
 682:	ee4080e7          	jalr	-284(ra) # 562 <putc>
  while(--i >= 0)
 686:	fec42783          	lw	a5,-20(s0)
 68a:	37fd                	addiw	a5,a5,-1
 68c:	fef42623          	sw	a5,-20(s0)
 690:	fec42783          	lw	a5,-20(s0)
 694:	2781                	sext.w	a5,a5
 696:	fc07d9e3          	bgez	a5,668 <printint+0xd0>
}
 69a:	0001                	nop
 69c:	0001                	nop
 69e:	70e2                	ld	ra,56(sp)
 6a0:	7442                	ld	s0,48(sp)
 6a2:	6121                	addi	sp,sp,64
 6a4:	8082                	ret

00000000000006a6 <printptr>:

static void
printptr(int fd, uint64 x) {
 6a6:	7179                	addi	sp,sp,-48
 6a8:	f406                	sd	ra,40(sp)
 6aa:	f022                	sd	s0,32(sp)
 6ac:	1800                	addi	s0,sp,48
 6ae:	87aa                	mv	a5,a0
 6b0:	fcb43823          	sd	a1,-48(s0)
 6b4:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 6b8:	fdc42783          	lw	a5,-36(s0)
 6bc:	03000593          	li	a1,48
 6c0:	853e                	mv	a0,a5
 6c2:	00000097          	auipc	ra,0x0
 6c6:	ea0080e7          	jalr	-352(ra) # 562 <putc>
  putc(fd, 'x');
 6ca:	fdc42783          	lw	a5,-36(s0)
 6ce:	07800593          	li	a1,120
 6d2:	853e                	mv	a0,a5
 6d4:	00000097          	auipc	ra,0x0
 6d8:	e8e080e7          	jalr	-370(ra) # 562 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6dc:	fe042623          	sw	zero,-20(s0)
 6e0:	a82d                	j	71a <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6e2:	fd043783          	ld	a5,-48(s0)
 6e6:	93f1                	srli	a5,a5,0x3c
 6e8:	00000717          	auipc	a4,0x0
 6ec:	64070713          	addi	a4,a4,1600 # d28 <digits>
 6f0:	97ba                	add	a5,a5,a4
 6f2:	0007c703          	lbu	a4,0(a5)
 6f6:	fdc42783          	lw	a5,-36(s0)
 6fa:	85ba                	mv	a1,a4
 6fc:	853e                	mv	a0,a5
 6fe:	00000097          	auipc	ra,0x0
 702:	e64080e7          	jalr	-412(ra) # 562 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 706:	fec42783          	lw	a5,-20(s0)
 70a:	2785                	addiw	a5,a5,1
 70c:	fef42623          	sw	a5,-20(s0)
 710:	fd043783          	ld	a5,-48(s0)
 714:	0792                	slli	a5,a5,0x4
 716:	fcf43823          	sd	a5,-48(s0)
 71a:	fec42783          	lw	a5,-20(s0)
 71e:	873e                	mv	a4,a5
 720:	47bd                	li	a5,15
 722:	fce7f0e3          	bgeu	a5,a4,6e2 <printptr+0x3c>
}
 726:	0001                	nop
 728:	0001                	nop
 72a:	70a2                	ld	ra,40(sp)
 72c:	7402                	ld	s0,32(sp)
 72e:	6145                	addi	sp,sp,48
 730:	8082                	ret

0000000000000732 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 732:	715d                	addi	sp,sp,-80
 734:	e486                	sd	ra,72(sp)
 736:	e0a2                	sd	s0,64(sp)
 738:	0880                	addi	s0,sp,80
 73a:	87aa                	mv	a5,a0
 73c:	fcb43023          	sd	a1,-64(s0)
 740:	fac43c23          	sd	a2,-72(s0)
 744:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 748:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 74c:	fe042223          	sw	zero,-28(s0)
 750:	a42d                	j	97a <vprintf+0x248>
    c = fmt[i] & 0xff;
 752:	fe442783          	lw	a5,-28(s0)
 756:	fc043703          	ld	a4,-64(s0)
 75a:	97ba                	add	a5,a5,a4
 75c:	0007c783          	lbu	a5,0(a5)
 760:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 764:	fe042783          	lw	a5,-32(s0)
 768:	2781                	sext.w	a5,a5
 76a:	eb9d                	bnez	a5,7a0 <vprintf+0x6e>
      if(c == '%'){
 76c:	fdc42783          	lw	a5,-36(s0)
 770:	0007871b          	sext.w	a4,a5
 774:	02500793          	li	a5,37
 778:	00f71763          	bne	a4,a5,786 <vprintf+0x54>
        state = '%';
 77c:	02500793          	li	a5,37
 780:	fef42023          	sw	a5,-32(s0)
 784:	a2f5                	j	970 <vprintf+0x23e>
      } else {
        putc(fd, c);
 786:	fdc42783          	lw	a5,-36(s0)
 78a:	0ff7f713          	andi	a4,a5,255
 78e:	fcc42783          	lw	a5,-52(s0)
 792:	85ba                	mv	a1,a4
 794:	853e                	mv	a0,a5
 796:	00000097          	auipc	ra,0x0
 79a:	dcc080e7          	jalr	-564(ra) # 562 <putc>
 79e:	aac9                	j	970 <vprintf+0x23e>
      }
    } else if(state == '%'){
 7a0:	fe042783          	lw	a5,-32(s0)
 7a4:	0007871b          	sext.w	a4,a5
 7a8:	02500793          	li	a5,37
 7ac:	1cf71263          	bne	a4,a5,970 <vprintf+0x23e>
      if(c == 'd'){
 7b0:	fdc42783          	lw	a5,-36(s0)
 7b4:	0007871b          	sext.w	a4,a5
 7b8:	06400793          	li	a5,100
 7bc:	02f71463          	bne	a4,a5,7e4 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 7c0:	fb843783          	ld	a5,-72(s0)
 7c4:	00878713          	addi	a4,a5,8
 7c8:	fae43c23          	sd	a4,-72(s0)
 7cc:	4398                	lw	a4,0(a5)
 7ce:	fcc42783          	lw	a5,-52(s0)
 7d2:	4685                	li	a3,1
 7d4:	4629                	li	a2,10
 7d6:	85ba                	mv	a1,a4
 7d8:	853e                	mv	a0,a5
 7da:	00000097          	auipc	ra,0x0
 7de:	dbe080e7          	jalr	-578(ra) # 598 <printint>
 7e2:	a269                	j	96c <vprintf+0x23a>
      } else if(c == 'l') {
 7e4:	fdc42783          	lw	a5,-36(s0)
 7e8:	0007871b          	sext.w	a4,a5
 7ec:	06c00793          	li	a5,108
 7f0:	02f71663          	bne	a4,a5,81c <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 7f4:	fb843783          	ld	a5,-72(s0)
 7f8:	00878713          	addi	a4,a5,8
 7fc:	fae43c23          	sd	a4,-72(s0)
 800:	639c                	ld	a5,0(a5)
 802:	0007871b          	sext.w	a4,a5
 806:	fcc42783          	lw	a5,-52(s0)
 80a:	4681                	li	a3,0
 80c:	4629                	li	a2,10
 80e:	85ba                	mv	a1,a4
 810:	853e                	mv	a0,a5
 812:	00000097          	auipc	ra,0x0
 816:	d86080e7          	jalr	-634(ra) # 598 <printint>
 81a:	aa89                	j	96c <vprintf+0x23a>
      } else if(c == 'x') {
 81c:	fdc42783          	lw	a5,-36(s0)
 820:	0007871b          	sext.w	a4,a5
 824:	07800793          	li	a5,120
 828:	02f71463          	bne	a4,a5,850 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 82c:	fb843783          	ld	a5,-72(s0)
 830:	00878713          	addi	a4,a5,8
 834:	fae43c23          	sd	a4,-72(s0)
 838:	4398                	lw	a4,0(a5)
 83a:	fcc42783          	lw	a5,-52(s0)
 83e:	4681                	li	a3,0
 840:	4641                	li	a2,16
 842:	85ba                	mv	a1,a4
 844:	853e                	mv	a0,a5
 846:	00000097          	auipc	ra,0x0
 84a:	d52080e7          	jalr	-686(ra) # 598 <printint>
 84e:	aa39                	j	96c <vprintf+0x23a>
      } else if(c == 'p') {
 850:	fdc42783          	lw	a5,-36(s0)
 854:	0007871b          	sext.w	a4,a5
 858:	07000793          	li	a5,112
 85c:	02f71263          	bne	a4,a5,880 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 860:	fb843783          	ld	a5,-72(s0)
 864:	00878713          	addi	a4,a5,8
 868:	fae43c23          	sd	a4,-72(s0)
 86c:	6398                	ld	a4,0(a5)
 86e:	fcc42783          	lw	a5,-52(s0)
 872:	85ba                	mv	a1,a4
 874:	853e                	mv	a0,a5
 876:	00000097          	auipc	ra,0x0
 87a:	e30080e7          	jalr	-464(ra) # 6a6 <printptr>
 87e:	a0fd                	j	96c <vprintf+0x23a>
      } else if(c == 's'){
 880:	fdc42783          	lw	a5,-36(s0)
 884:	0007871b          	sext.w	a4,a5
 888:	07300793          	li	a5,115
 88c:	04f71c63          	bne	a4,a5,8e4 <vprintf+0x1b2>
        s = va_arg(ap, char*);
 890:	fb843783          	ld	a5,-72(s0)
 894:	00878713          	addi	a4,a5,8
 898:	fae43c23          	sd	a4,-72(s0)
 89c:	639c                	ld	a5,0(a5)
 89e:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 8a2:	fe843783          	ld	a5,-24(s0)
 8a6:	eb8d                	bnez	a5,8d8 <vprintf+0x1a6>
          s = "(null)";
 8a8:	00000797          	auipc	a5,0x0
 8ac:	47878793          	addi	a5,a5,1144 # d20 <malloc+0x13e>
 8b0:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 8b4:	a015                	j	8d8 <vprintf+0x1a6>
          putc(fd, *s);
 8b6:	fe843783          	ld	a5,-24(s0)
 8ba:	0007c703          	lbu	a4,0(a5)
 8be:	fcc42783          	lw	a5,-52(s0)
 8c2:	85ba                	mv	a1,a4
 8c4:	853e                	mv	a0,a5
 8c6:	00000097          	auipc	ra,0x0
 8ca:	c9c080e7          	jalr	-868(ra) # 562 <putc>
          s++;
 8ce:	fe843783          	ld	a5,-24(s0)
 8d2:	0785                	addi	a5,a5,1
 8d4:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 8d8:	fe843783          	ld	a5,-24(s0)
 8dc:	0007c783          	lbu	a5,0(a5)
 8e0:	fbf9                	bnez	a5,8b6 <vprintf+0x184>
 8e2:	a069                	j	96c <vprintf+0x23a>
        }
      } else if(c == 'c'){
 8e4:	fdc42783          	lw	a5,-36(s0)
 8e8:	0007871b          	sext.w	a4,a5
 8ec:	06300793          	li	a5,99
 8f0:	02f71463          	bne	a4,a5,918 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 8f4:	fb843783          	ld	a5,-72(s0)
 8f8:	00878713          	addi	a4,a5,8
 8fc:	fae43c23          	sd	a4,-72(s0)
 900:	439c                	lw	a5,0(a5)
 902:	0ff7f713          	andi	a4,a5,255
 906:	fcc42783          	lw	a5,-52(s0)
 90a:	85ba                	mv	a1,a4
 90c:	853e                	mv	a0,a5
 90e:	00000097          	auipc	ra,0x0
 912:	c54080e7          	jalr	-940(ra) # 562 <putc>
 916:	a899                	j	96c <vprintf+0x23a>
      } else if(c == '%'){
 918:	fdc42783          	lw	a5,-36(s0)
 91c:	0007871b          	sext.w	a4,a5
 920:	02500793          	li	a5,37
 924:	00f71f63          	bne	a4,a5,942 <vprintf+0x210>
        putc(fd, c);
 928:	fdc42783          	lw	a5,-36(s0)
 92c:	0ff7f713          	andi	a4,a5,255
 930:	fcc42783          	lw	a5,-52(s0)
 934:	85ba                	mv	a1,a4
 936:	853e                	mv	a0,a5
 938:	00000097          	auipc	ra,0x0
 93c:	c2a080e7          	jalr	-982(ra) # 562 <putc>
 940:	a035                	j	96c <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 942:	fcc42783          	lw	a5,-52(s0)
 946:	02500593          	li	a1,37
 94a:	853e                	mv	a0,a5
 94c:	00000097          	auipc	ra,0x0
 950:	c16080e7          	jalr	-1002(ra) # 562 <putc>
        putc(fd, c);
 954:	fdc42783          	lw	a5,-36(s0)
 958:	0ff7f713          	andi	a4,a5,255
 95c:	fcc42783          	lw	a5,-52(s0)
 960:	85ba                	mv	a1,a4
 962:	853e                	mv	a0,a5
 964:	00000097          	auipc	ra,0x0
 968:	bfe080e7          	jalr	-1026(ra) # 562 <putc>
      }
      state = 0;
 96c:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 970:	fe442783          	lw	a5,-28(s0)
 974:	2785                	addiw	a5,a5,1
 976:	fef42223          	sw	a5,-28(s0)
 97a:	fe442783          	lw	a5,-28(s0)
 97e:	fc043703          	ld	a4,-64(s0)
 982:	97ba                	add	a5,a5,a4
 984:	0007c783          	lbu	a5,0(a5)
 988:	dc0795e3          	bnez	a5,752 <vprintf+0x20>
    }
  }
}
 98c:	0001                	nop
 98e:	0001                	nop
 990:	60a6                	ld	ra,72(sp)
 992:	6406                	ld	s0,64(sp)
 994:	6161                	addi	sp,sp,80
 996:	8082                	ret

0000000000000998 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 998:	7159                	addi	sp,sp,-112
 99a:	fc06                	sd	ra,56(sp)
 99c:	f822                	sd	s0,48(sp)
 99e:	0080                	addi	s0,sp,64
 9a0:	fcb43823          	sd	a1,-48(s0)
 9a4:	e010                	sd	a2,0(s0)
 9a6:	e414                	sd	a3,8(s0)
 9a8:	e818                	sd	a4,16(s0)
 9aa:	ec1c                	sd	a5,24(s0)
 9ac:	03043023          	sd	a6,32(s0)
 9b0:	03143423          	sd	a7,40(s0)
 9b4:	87aa                	mv	a5,a0
 9b6:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 9ba:	03040793          	addi	a5,s0,48
 9be:	fcf43423          	sd	a5,-56(s0)
 9c2:	fc843783          	ld	a5,-56(s0)
 9c6:	fd078793          	addi	a5,a5,-48
 9ca:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 9ce:	fe843703          	ld	a4,-24(s0)
 9d2:	fdc42783          	lw	a5,-36(s0)
 9d6:	863a                	mv	a2,a4
 9d8:	fd043583          	ld	a1,-48(s0)
 9dc:	853e                	mv	a0,a5
 9de:	00000097          	auipc	ra,0x0
 9e2:	d54080e7          	jalr	-684(ra) # 732 <vprintf>
}
 9e6:	0001                	nop
 9e8:	70e2                	ld	ra,56(sp)
 9ea:	7442                	ld	s0,48(sp)
 9ec:	6165                	addi	sp,sp,112
 9ee:	8082                	ret

00000000000009f0 <printf>:

void
printf(const char *fmt, ...)
{
 9f0:	7159                	addi	sp,sp,-112
 9f2:	f406                	sd	ra,40(sp)
 9f4:	f022                	sd	s0,32(sp)
 9f6:	1800                	addi	s0,sp,48
 9f8:	fca43c23          	sd	a0,-40(s0)
 9fc:	e40c                	sd	a1,8(s0)
 9fe:	e810                	sd	a2,16(s0)
 a00:	ec14                	sd	a3,24(s0)
 a02:	f018                	sd	a4,32(s0)
 a04:	f41c                	sd	a5,40(s0)
 a06:	03043823          	sd	a6,48(s0)
 a0a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 a0e:	04040793          	addi	a5,s0,64
 a12:	fcf43823          	sd	a5,-48(s0)
 a16:	fd043783          	ld	a5,-48(s0)
 a1a:	fc878793          	addi	a5,a5,-56
 a1e:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 a22:	fe843783          	ld	a5,-24(s0)
 a26:	863e                	mv	a2,a5
 a28:	fd843583          	ld	a1,-40(s0)
 a2c:	4505                	li	a0,1
 a2e:	00000097          	auipc	ra,0x0
 a32:	d04080e7          	jalr	-764(ra) # 732 <vprintf>
}
 a36:	0001                	nop
 a38:	70a2                	ld	ra,40(sp)
 a3a:	7402                	ld	s0,32(sp)
 a3c:	6165                	addi	sp,sp,112
 a3e:	8082                	ret

0000000000000a40 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a40:	7179                	addi	sp,sp,-48
 a42:	f422                	sd	s0,40(sp)
 a44:	1800                	addi	s0,sp,48
 a46:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a4a:	fd843783          	ld	a5,-40(s0)
 a4e:	17c1                	addi	a5,a5,-16
 a50:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a54:	00000797          	auipc	a5,0x0
 a58:	2fc78793          	addi	a5,a5,764 # d50 <freep>
 a5c:	639c                	ld	a5,0(a5)
 a5e:	fef43423          	sd	a5,-24(s0)
 a62:	a815                	j	a96 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a64:	fe843783          	ld	a5,-24(s0)
 a68:	639c                	ld	a5,0(a5)
 a6a:	fe843703          	ld	a4,-24(s0)
 a6e:	00f76f63          	bltu	a4,a5,a8c <free+0x4c>
 a72:	fe043703          	ld	a4,-32(s0)
 a76:	fe843783          	ld	a5,-24(s0)
 a7a:	02e7eb63          	bltu	a5,a4,ab0 <free+0x70>
 a7e:	fe843783          	ld	a5,-24(s0)
 a82:	639c                	ld	a5,0(a5)
 a84:	fe043703          	ld	a4,-32(s0)
 a88:	02f76463          	bltu	a4,a5,ab0 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a8c:	fe843783          	ld	a5,-24(s0)
 a90:	639c                	ld	a5,0(a5)
 a92:	fef43423          	sd	a5,-24(s0)
 a96:	fe043703          	ld	a4,-32(s0)
 a9a:	fe843783          	ld	a5,-24(s0)
 a9e:	fce7f3e3          	bgeu	a5,a4,a64 <free+0x24>
 aa2:	fe843783          	ld	a5,-24(s0)
 aa6:	639c                	ld	a5,0(a5)
 aa8:	fe043703          	ld	a4,-32(s0)
 aac:	faf77ce3          	bgeu	a4,a5,a64 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ab0:	fe043783          	ld	a5,-32(s0)
 ab4:	479c                	lw	a5,8(a5)
 ab6:	1782                	slli	a5,a5,0x20
 ab8:	9381                	srli	a5,a5,0x20
 aba:	0792                	slli	a5,a5,0x4
 abc:	fe043703          	ld	a4,-32(s0)
 ac0:	973e                	add	a4,a4,a5
 ac2:	fe843783          	ld	a5,-24(s0)
 ac6:	639c                	ld	a5,0(a5)
 ac8:	02f71763          	bne	a4,a5,af6 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
 acc:	fe043783          	ld	a5,-32(s0)
 ad0:	4798                	lw	a4,8(a5)
 ad2:	fe843783          	ld	a5,-24(s0)
 ad6:	639c                	ld	a5,0(a5)
 ad8:	479c                	lw	a5,8(a5)
 ada:	9fb9                	addw	a5,a5,a4
 adc:	0007871b          	sext.w	a4,a5
 ae0:	fe043783          	ld	a5,-32(s0)
 ae4:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 ae6:	fe843783          	ld	a5,-24(s0)
 aea:	639c                	ld	a5,0(a5)
 aec:	6398                	ld	a4,0(a5)
 aee:	fe043783          	ld	a5,-32(s0)
 af2:	e398                	sd	a4,0(a5)
 af4:	a039                	j	b02 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
 af6:	fe843783          	ld	a5,-24(s0)
 afa:	6398                	ld	a4,0(a5)
 afc:	fe043783          	ld	a5,-32(s0)
 b00:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 b02:	fe843783          	ld	a5,-24(s0)
 b06:	479c                	lw	a5,8(a5)
 b08:	1782                	slli	a5,a5,0x20
 b0a:	9381                	srli	a5,a5,0x20
 b0c:	0792                	slli	a5,a5,0x4
 b0e:	fe843703          	ld	a4,-24(s0)
 b12:	97ba                	add	a5,a5,a4
 b14:	fe043703          	ld	a4,-32(s0)
 b18:	02f71563          	bne	a4,a5,b42 <free+0x102>
    p->s.size += bp->s.size;
 b1c:	fe843783          	ld	a5,-24(s0)
 b20:	4798                	lw	a4,8(a5)
 b22:	fe043783          	ld	a5,-32(s0)
 b26:	479c                	lw	a5,8(a5)
 b28:	9fb9                	addw	a5,a5,a4
 b2a:	0007871b          	sext.w	a4,a5
 b2e:	fe843783          	ld	a5,-24(s0)
 b32:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 b34:	fe043783          	ld	a5,-32(s0)
 b38:	6398                	ld	a4,0(a5)
 b3a:	fe843783          	ld	a5,-24(s0)
 b3e:	e398                	sd	a4,0(a5)
 b40:	a031                	j	b4c <free+0x10c>
  } else
    p->s.ptr = bp;
 b42:	fe843783          	ld	a5,-24(s0)
 b46:	fe043703          	ld	a4,-32(s0)
 b4a:	e398                	sd	a4,0(a5)
  freep = p;
 b4c:	00000797          	auipc	a5,0x0
 b50:	20478793          	addi	a5,a5,516 # d50 <freep>
 b54:	fe843703          	ld	a4,-24(s0)
 b58:	e398                	sd	a4,0(a5)
}
 b5a:	0001                	nop
 b5c:	7422                	ld	s0,40(sp)
 b5e:	6145                	addi	sp,sp,48
 b60:	8082                	ret

0000000000000b62 <morecore>:

static Header*
morecore(uint nu)
{
 b62:	7179                	addi	sp,sp,-48
 b64:	f406                	sd	ra,40(sp)
 b66:	f022                	sd	s0,32(sp)
 b68:	1800                	addi	s0,sp,48
 b6a:	87aa                	mv	a5,a0
 b6c:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 b70:	fdc42783          	lw	a5,-36(s0)
 b74:	0007871b          	sext.w	a4,a5
 b78:	6785                	lui	a5,0x1
 b7a:	00f77563          	bgeu	a4,a5,b84 <morecore+0x22>
    nu = 4096;
 b7e:	6785                	lui	a5,0x1
 b80:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 b84:	fdc42783          	lw	a5,-36(s0)
 b88:	0047979b          	slliw	a5,a5,0x4
 b8c:	2781                	sext.w	a5,a5
 b8e:	2781                	sext.w	a5,a5
 b90:	853e                	mv	a0,a5
 b92:	00000097          	auipc	ra,0x0
 b96:	9b0080e7          	jalr	-1616(ra) # 542 <sbrk>
 b9a:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 b9e:	fe843703          	ld	a4,-24(s0)
 ba2:	57fd                	li	a5,-1
 ba4:	00f71463          	bne	a4,a5,bac <morecore+0x4a>
    return 0;
 ba8:	4781                	li	a5,0
 baa:	a03d                	j	bd8 <morecore+0x76>
  hp = (Header*)p;
 bac:	fe843783          	ld	a5,-24(s0)
 bb0:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 bb4:	fe043783          	ld	a5,-32(s0)
 bb8:	fdc42703          	lw	a4,-36(s0)
 bbc:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 bbe:	fe043783          	ld	a5,-32(s0)
 bc2:	07c1                	addi	a5,a5,16
 bc4:	853e                	mv	a0,a5
 bc6:	00000097          	auipc	ra,0x0
 bca:	e7a080e7          	jalr	-390(ra) # a40 <free>
  return freep;
 bce:	00000797          	auipc	a5,0x0
 bd2:	18278793          	addi	a5,a5,386 # d50 <freep>
 bd6:	639c                	ld	a5,0(a5)
}
 bd8:	853e                	mv	a0,a5
 bda:	70a2                	ld	ra,40(sp)
 bdc:	7402                	ld	s0,32(sp)
 bde:	6145                	addi	sp,sp,48
 be0:	8082                	ret

0000000000000be2 <malloc>:

void*
malloc(uint nbytes)
{
 be2:	7139                	addi	sp,sp,-64
 be4:	fc06                	sd	ra,56(sp)
 be6:	f822                	sd	s0,48(sp)
 be8:	0080                	addi	s0,sp,64
 bea:	87aa                	mv	a5,a0
 bec:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bf0:	fcc46783          	lwu	a5,-52(s0)
 bf4:	07bd                	addi	a5,a5,15
 bf6:	8391                	srli	a5,a5,0x4
 bf8:	2781                	sext.w	a5,a5
 bfa:	2785                	addiw	a5,a5,1
 bfc:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 c00:	00000797          	auipc	a5,0x0
 c04:	15078793          	addi	a5,a5,336 # d50 <freep>
 c08:	639c                	ld	a5,0(a5)
 c0a:	fef43023          	sd	a5,-32(s0)
 c0e:	fe043783          	ld	a5,-32(s0)
 c12:	ef95                	bnez	a5,c4e <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 c14:	00000797          	auipc	a5,0x0
 c18:	12c78793          	addi	a5,a5,300 # d40 <base>
 c1c:	fef43023          	sd	a5,-32(s0)
 c20:	00000797          	auipc	a5,0x0
 c24:	13078793          	addi	a5,a5,304 # d50 <freep>
 c28:	fe043703          	ld	a4,-32(s0)
 c2c:	e398                	sd	a4,0(a5)
 c2e:	00000797          	auipc	a5,0x0
 c32:	12278793          	addi	a5,a5,290 # d50 <freep>
 c36:	6398                	ld	a4,0(a5)
 c38:	00000797          	auipc	a5,0x0
 c3c:	10878793          	addi	a5,a5,264 # d40 <base>
 c40:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 c42:	00000797          	auipc	a5,0x0
 c46:	0fe78793          	addi	a5,a5,254 # d40 <base>
 c4a:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c4e:	fe043783          	ld	a5,-32(s0)
 c52:	639c                	ld	a5,0(a5)
 c54:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 c58:	fe843783          	ld	a5,-24(s0)
 c5c:	4798                	lw	a4,8(a5)
 c5e:	fdc42783          	lw	a5,-36(s0)
 c62:	2781                	sext.w	a5,a5
 c64:	06f76863          	bltu	a4,a5,cd4 <malloc+0xf2>
      if(p->s.size == nunits)
 c68:	fe843783          	ld	a5,-24(s0)
 c6c:	4798                	lw	a4,8(a5)
 c6e:	fdc42783          	lw	a5,-36(s0)
 c72:	2781                	sext.w	a5,a5
 c74:	00e79963          	bne	a5,a4,c86 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 c78:	fe843783          	ld	a5,-24(s0)
 c7c:	6398                	ld	a4,0(a5)
 c7e:	fe043783          	ld	a5,-32(s0)
 c82:	e398                	sd	a4,0(a5)
 c84:	a82d                	j	cbe <malloc+0xdc>
      else {
        p->s.size -= nunits;
 c86:	fe843783          	ld	a5,-24(s0)
 c8a:	4798                	lw	a4,8(a5)
 c8c:	fdc42783          	lw	a5,-36(s0)
 c90:	40f707bb          	subw	a5,a4,a5
 c94:	0007871b          	sext.w	a4,a5
 c98:	fe843783          	ld	a5,-24(s0)
 c9c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 c9e:	fe843783          	ld	a5,-24(s0)
 ca2:	479c                	lw	a5,8(a5)
 ca4:	1782                	slli	a5,a5,0x20
 ca6:	9381                	srli	a5,a5,0x20
 ca8:	0792                	slli	a5,a5,0x4
 caa:	fe843703          	ld	a4,-24(s0)
 cae:	97ba                	add	a5,a5,a4
 cb0:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 cb4:	fe843783          	ld	a5,-24(s0)
 cb8:	fdc42703          	lw	a4,-36(s0)
 cbc:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 cbe:	00000797          	auipc	a5,0x0
 cc2:	09278793          	addi	a5,a5,146 # d50 <freep>
 cc6:	fe043703          	ld	a4,-32(s0)
 cca:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 ccc:	fe843783          	ld	a5,-24(s0)
 cd0:	07c1                	addi	a5,a5,16
 cd2:	a091                	j	d16 <malloc+0x134>
    }
    if(p == freep)
 cd4:	00000797          	auipc	a5,0x0
 cd8:	07c78793          	addi	a5,a5,124 # d50 <freep>
 cdc:	639c                	ld	a5,0(a5)
 cde:	fe843703          	ld	a4,-24(s0)
 ce2:	02f71063          	bne	a4,a5,d02 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
 ce6:	fdc42783          	lw	a5,-36(s0)
 cea:	853e                	mv	a0,a5
 cec:	00000097          	auipc	ra,0x0
 cf0:	e76080e7          	jalr	-394(ra) # b62 <morecore>
 cf4:	fea43423          	sd	a0,-24(s0)
 cf8:	fe843783          	ld	a5,-24(s0)
 cfc:	e399                	bnez	a5,d02 <malloc+0x120>
        return 0;
 cfe:	4781                	li	a5,0
 d00:	a819                	j	d16 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d02:	fe843783          	ld	a5,-24(s0)
 d06:	fef43023          	sd	a5,-32(s0)
 d0a:	fe843783          	ld	a5,-24(s0)
 d0e:	639c                	ld	a5,0(a5)
 d10:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 d14:	b791                	j	c58 <malloc+0x76>
  }
}
 d16:	853e                	mv	a0,a5
 d18:	70e2                	ld	ra,56(sp)
 d1a:	7442                	ld	s0,48(sp)
 d1c:	6121                	addi	sp,sp,64
 d1e:	8082                	ret
