
user/_rm:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
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
    fprintf(2, "Usage: rm files...\n");
  20:	00001597          	auipc	a1,0x1
  24:	d8058593          	addi	a1,a1,-640 # da0 <malloc+0x13e>
  28:	4509                	li	a0,2
  2a:	00001097          	auipc	ra,0x1
  2e:	9ee080e7          	jalr	-1554(ra) # a18 <fprintf>
    exit(1);
  32:	4505                	li	a0,1
  34:	00000097          	auipc	ra,0x0
  38:	506080e7          	jalr	1286(ra) # 53a <exit>
  }

  for(i = 1; i < argc; i++){
  3c:	4785                	li	a5,1
  3e:	fef42623          	sw	a5,-20(s0)
  42:	a0b9                	j	90 <main+0x90>
    if(unlink(argv[i]) < 0){
  44:	fec42783          	lw	a5,-20(s0)
  48:	078e                	slli	a5,a5,0x3
  4a:	fd043703          	ld	a4,-48(s0)
  4e:	97ba                	add	a5,a5,a4
  50:	639c                	ld	a5,0(a5)
  52:	853e                	mv	a0,a5
  54:	00000097          	auipc	ra,0x0
  58:	536080e7          	jalr	1334(ra) # 58a <unlink>
  5c:	87aa                	mv	a5,a0
  5e:	0207d463          	bgez	a5,86 <main+0x86>
      fprintf(2, "rm: %s failed to delete\n", argv[i]);
  62:	fec42783          	lw	a5,-20(s0)
  66:	078e                	slli	a5,a5,0x3
  68:	fd043703          	ld	a4,-48(s0)
  6c:	97ba                	add	a5,a5,a4
  6e:	639c                	ld	a5,0(a5)
  70:	863e                	mv	a2,a5
  72:	00001597          	auipc	a1,0x1
  76:	d4658593          	addi	a1,a1,-698 # db8 <malloc+0x156>
  7a:	4509                	li	a0,2
  7c:	00001097          	auipc	ra,0x1
  80:	99c080e7          	jalr	-1636(ra) # a18 <fprintf>
      break;
  84:	a831                	j	a0 <main+0xa0>
  for(i = 1; i < argc; i++){
  86:	fec42783          	lw	a5,-20(s0)
  8a:	2785                	addiw	a5,a5,1
  8c:	fef42623          	sw	a5,-20(s0)
  90:	fec42703          	lw	a4,-20(s0)
  94:	fdc42783          	lw	a5,-36(s0)
  98:	2701                	sext.w	a4,a4
  9a:	2781                	sext.w	a5,a5
  9c:	faf744e3          	blt	a4,a5,44 <main+0x44>
    }
  }

  exit(0);
  a0:	4501                	li	a0,0
  a2:	00000097          	auipc	ra,0x0
  a6:	498080e7          	jalr	1176(ra) # 53a <exit>

00000000000000aa <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
  aa:	7179                	addi	sp,sp,-48
  ac:	f422                	sd	s0,40(sp)
  ae:	1800                	addi	s0,sp,48
  b0:	fca43c23          	sd	a0,-40(s0)
  b4:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
  b8:	fd843783          	ld	a5,-40(s0)
  bc:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
  c0:	0001                	nop
  c2:	fd043703          	ld	a4,-48(s0)
  c6:	00170793          	addi	a5,a4,1
  ca:	fcf43823          	sd	a5,-48(s0)
  ce:	fd843783          	ld	a5,-40(s0)
  d2:	00178693          	addi	a3,a5,1
  d6:	fcd43c23          	sd	a3,-40(s0)
  da:	00074703          	lbu	a4,0(a4)
  de:	00e78023          	sb	a4,0(a5)
  e2:	0007c783          	lbu	a5,0(a5)
  e6:	fff1                	bnez	a5,c2 <strcpy+0x18>
    ;
  return os;
  e8:	fe843783          	ld	a5,-24(s0)
}
  ec:	853e                	mv	a0,a5
  ee:	7422                	ld	s0,40(sp)
  f0:	6145                	addi	sp,sp,48
  f2:	8082                	ret

00000000000000f4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f4:	1101                	addi	sp,sp,-32
  f6:	ec22                	sd	s0,24(sp)
  f8:	1000                	addi	s0,sp,32
  fa:	fea43423          	sd	a0,-24(s0)
  fe:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
 102:	a819                	j	118 <strcmp+0x24>
    p++, q++;
 104:	fe843783          	ld	a5,-24(s0)
 108:	0785                	addi	a5,a5,1
 10a:	fef43423          	sd	a5,-24(s0)
 10e:	fe043783          	ld	a5,-32(s0)
 112:	0785                	addi	a5,a5,1
 114:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
 118:	fe843783          	ld	a5,-24(s0)
 11c:	0007c783          	lbu	a5,0(a5)
 120:	cb99                	beqz	a5,136 <strcmp+0x42>
 122:	fe843783          	ld	a5,-24(s0)
 126:	0007c703          	lbu	a4,0(a5)
 12a:	fe043783          	ld	a5,-32(s0)
 12e:	0007c783          	lbu	a5,0(a5)
 132:	fcf709e3          	beq	a4,a5,104 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
 136:	fe843783          	ld	a5,-24(s0)
 13a:	0007c783          	lbu	a5,0(a5)
 13e:	0007871b          	sext.w	a4,a5
 142:	fe043783          	ld	a5,-32(s0)
 146:	0007c783          	lbu	a5,0(a5)
 14a:	2781                	sext.w	a5,a5
 14c:	40f707bb          	subw	a5,a4,a5
 150:	2781                	sext.w	a5,a5
}
 152:	853e                	mv	a0,a5
 154:	6462                	ld	s0,24(sp)
 156:	6105                	addi	sp,sp,32
 158:	8082                	ret

000000000000015a <strlen>:

uint
strlen(const char *s)
{
 15a:	7179                	addi	sp,sp,-48
 15c:	f422                	sd	s0,40(sp)
 15e:	1800                	addi	s0,sp,48
 160:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
 164:	fe042623          	sw	zero,-20(s0)
 168:	a031                	j	174 <strlen+0x1a>
 16a:	fec42783          	lw	a5,-20(s0)
 16e:	2785                	addiw	a5,a5,1
 170:	fef42623          	sw	a5,-20(s0)
 174:	fec42783          	lw	a5,-20(s0)
 178:	fd843703          	ld	a4,-40(s0)
 17c:	97ba                	add	a5,a5,a4
 17e:	0007c783          	lbu	a5,0(a5)
 182:	f7e5                	bnez	a5,16a <strlen+0x10>
    ;
  return n;
 184:	fec42783          	lw	a5,-20(s0)
}
 188:	853e                	mv	a0,a5
 18a:	7422                	ld	s0,40(sp)
 18c:	6145                	addi	sp,sp,48
 18e:	8082                	ret

0000000000000190 <memset>:

void*
memset(void *dst, int c, uint n)
{
 190:	7179                	addi	sp,sp,-48
 192:	f422                	sd	s0,40(sp)
 194:	1800                	addi	s0,sp,48
 196:	fca43c23          	sd	a0,-40(s0)
 19a:	87ae                	mv	a5,a1
 19c:	8732                	mv	a4,a2
 19e:	fcf42a23          	sw	a5,-44(s0)
 1a2:	87ba                	mv	a5,a4
 1a4:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 1a8:	fd843783          	ld	a5,-40(s0)
 1ac:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 1b0:	fe042623          	sw	zero,-20(s0)
 1b4:	a00d                	j	1d6 <memset+0x46>
    cdst[i] = c;
 1b6:	fec42783          	lw	a5,-20(s0)
 1ba:	fe043703          	ld	a4,-32(s0)
 1be:	97ba                	add	a5,a5,a4
 1c0:	fd442703          	lw	a4,-44(s0)
 1c4:	0ff77713          	andi	a4,a4,255
 1c8:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 1cc:	fec42783          	lw	a5,-20(s0)
 1d0:	2785                	addiw	a5,a5,1
 1d2:	fef42623          	sw	a5,-20(s0)
 1d6:	fec42703          	lw	a4,-20(s0)
 1da:	fd042783          	lw	a5,-48(s0)
 1de:	2781                	sext.w	a5,a5
 1e0:	fcf76be3          	bltu	a4,a5,1b6 <memset+0x26>
  }
  return dst;
 1e4:	fd843783          	ld	a5,-40(s0)
}
 1e8:	853e                	mv	a0,a5
 1ea:	7422                	ld	s0,40(sp)
 1ec:	6145                	addi	sp,sp,48
 1ee:	8082                	ret

00000000000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	1101                	addi	sp,sp,-32
 1f2:	ec22                	sd	s0,24(sp)
 1f4:	1000                	addi	s0,sp,32
 1f6:	fea43423          	sd	a0,-24(s0)
 1fa:	87ae                	mv	a5,a1
 1fc:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 200:	a01d                	j	226 <strchr+0x36>
    if(*s == c)
 202:	fe843783          	ld	a5,-24(s0)
 206:	0007c703          	lbu	a4,0(a5)
 20a:	fe744783          	lbu	a5,-25(s0)
 20e:	0ff7f793          	andi	a5,a5,255
 212:	00e79563          	bne	a5,a4,21c <strchr+0x2c>
      return (char*)s;
 216:	fe843783          	ld	a5,-24(s0)
 21a:	a821                	j	232 <strchr+0x42>
  for(; *s; s++)
 21c:	fe843783          	ld	a5,-24(s0)
 220:	0785                	addi	a5,a5,1
 222:	fef43423          	sd	a5,-24(s0)
 226:	fe843783          	ld	a5,-24(s0)
 22a:	0007c783          	lbu	a5,0(a5)
 22e:	fbf1                	bnez	a5,202 <strchr+0x12>
  return 0;
 230:	4781                	li	a5,0
}
 232:	853e                	mv	a0,a5
 234:	6462                	ld	s0,24(sp)
 236:	6105                	addi	sp,sp,32
 238:	8082                	ret

000000000000023a <gets>:

char*
gets(char *buf, int max)
{
 23a:	7179                	addi	sp,sp,-48
 23c:	f406                	sd	ra,40(sp)
 23e:	f022                	sd	s0,32(sp)
 240:	1800                	addi	s0,sp,48
 242:	fca43c23          	sd	a0,-40(s0)
 246:	87ae                	mv	a5,a1
 248:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 24c:	fe042623          	sw	zero,-20(s0)
 250:	a8a1                	j	2a8 <gets+0x6e>
    cc = read(0, &c, 1);
 252:	fe740793          	addi	a5,s0,-25
 256:	4605                	li	a2,1
 258:	85be                	mv	a1,a5
 25a:	4501                	li	a0,0
 25c:	00000097          	auipc	ra,0x0
 260:	2f6080e7          	jalr	758(ra) # 552 <read>
 264:	87aa                	mv	a5,a0
 266:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 26a:	fe842783          	lw	a5,-24(s0)
 26e:	2781                	sext.w	a5,a5
 270:	04f05763          	blez	a5,2be <gets+0x84>
      break;
    buf[i++] = c;
 274:	fec42783          	lw	a5,-20(s0)
 278:	0017871b          	addiw	a4,a5,1
 27c:	fee42623          	sw	a4,-20(s0)
 280:	873e                	mv	a4,a5
 282:	fd843783          	ld	a5,-40(s0)
 286:	97ba                	add	a5,a5,a4
 288:	fe744703          	lbu	a4,-25(s0)
 28c:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 290:	fe744783          	lbu	a5,-25(s0)
 294:	873e                	mv	a4,a5
 296:	47a9                	li	a5,10
 298:	02f70463          	beq	a4,a5,2c0 <gets+0x86>
 29c:	fe744783          	lbu	a5,-25(s0)
 2a0:	873e                	mv	a4,a5
 2a2:	47b5                	li	a5,13
 2a4:	00f70e63          	beq	a4,a5,2c0 <gets+0x86>
  for(i=0; i+1 < max; ){
 2a8:	fec42783          	lw	a5,-20(s0)
 2ac:	2785                	addiw	a5,a5,1
 2ae:	0007871b          	sext.w	a4,a5
 2b2:	fd442783          	lw	a5,-44(s0)
 2b6:	2781                	sext.w	a5,a5
 2b8:	f8f74de3          	blt	a4,a5,252 <gets+0x18>
 2bc:	a011                	j	2c0 <gets+0x86>
      break;
 2be:	0001                	nop
      break;
  }
  buf[i] = '\0';
 2c0:	fec42783          	lw	a5,-20(s0)
 2c4:	fd843703          	ld	a4,-40(s0)
 2c8:	97ba                	add	a5,a5,a4
 2ca:	00078023          	sb	zero,0(a5)
  return buf;
 2ce:	fd843783          	ld	a5,-40(s0)
}
 2d2:	853e                	mv	a0,a5
 2d4:	70a2                	ld	ra,40(sp)
 2d6:	7402                	ld	s0,32(sp)
 2d8:	6145                	addi	sp,sp,48
 2da:	8082                	ret

00000000000002dc <stat>:

int
stat(const char *n, struct stat *st)
{
 2dc:	7179                	addi	sp,sp,-48
 2de:	f406                	sd	ra,40(sp)
 2e0:	f022                	sd	s0,32(sp)
 2e2:	1800                	addi	s0,sp,48
 2e4:	fca43c23          	sd	a0,-40(s0)
 2e8:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2ec:	4581                	li	a1,0
 2ee:	fd843503          	ld	a0,-40(s0)
 2f2:	00000097          	auipc	ra,0x0
 2f6:	288080e7          	jalr	648(ra) # 57a <open>
 2fa:	87aa                	mv	a5,a0
 2fc:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 300:	fec42783          	lw	a5,-20(s0)
 304:	2781                	sext.w	a5,a5
 306:	0007d463          	bgez	a5,30e <stat+0x32>
    return -1;
 30a:	57fd                	li	a5,-1
 30c:	a035                	j	338 <stat+0x5c>
  r = fstat(fd, st);
 30e:	fec42783          	lw	a5,-20(s0)
 312:	fd043583          	ld	a1,-48(s0)
 316:	853e                	mv	a0,a5
 318:	00000097          	auipc	ra,0x0
 31c:	27a080e7          	jalr	634(ra) # 592 <fstat>
 320:	87aa                	mv	a5,a0
 322:	fef42423          	sw	a5,-24(s0)
  close(fd);
 326:	fec42783          	lw	a5,-20(s0)
 32a:	853e                	mv	a0,a5
 32c:	00000097          	auipc	ra,0x0
 330:	236080e7          	jalr	566(ra) # 562 <close>
  return r;
 334:	fe842783          	lw	a5,-24(s0)
}
 338:	853e                	mv	a0,a5
 33a:	70a2                	ld	ra,40(sp)
 33c:	7402                	ld	s0,32(sp)
 33e:	6145                	addi	sp,sp,48
 340:	8082                	ret

0000000000000342 <atoi>:

int
atoi(const char *s)
{
 342:	7179                	addi	sp,sp,-48
 344:	f422                	sd	s0,40(sp)
 346:	1800                	addi	s0,sp,48
 348:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 34c:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 350:	a815                	j	384 <atoi+0x42>
    n = n*10 + *s++ - '0';
 352:	fec42703          	lw	a4,-20(s0)
 356:	87ba                	mv	a5,a4
 358:	0027979b          	slliw	a5,a5,0x2
 35c:	9fb9                	addw	a5,a5,a4
 35e:	0017979b          	slliw	a5,a5,0x1
 362:	0007871b          	sext.w	a4,a5
 366:	fd843783          	ld	a5,-40(s0)
 36a:	00178693          	addi	a3,a5,1
 36e:	fcd43c23          	sd	a3,-40(s0)
 372:	0007c783          	lbu	a5,0(a5)
 376:	2781                	sext.w	a5,a5
 378:	9fb9                	addw	a5,a5,a4
 37a:	2781                	sext.w	a5,a5
 37c:	fd07879b          	addiw	a5,a5,-48
 380:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 384:	fd843783          	ld	a5,-40(s0)
 388:	0007c783          	lbu	a5,0(a5)
 38c:	873e                	mv	a4,a5
 38e:	02f00793          	li	a5,47
 392:	00e7fb63          	bgeu	a5,a4,3a8 <atoi+0x66>
 396:	fd843783          	ld	a5,-40(s0)
 39a:	0007c783          	lbu	a5,0(a5)
 39e:	873e                	mv	a4,a5
 3a0:	03900793          	li	a5,57
 3a4:	fae7f7e3          	bgeu	a5,a4,352 <atoi+0x10>
  return n;
 3a8:	fec42783          	lw	a5,-20(s0)
}
 3ac:	853e                	mv	a0,a5
 3ae:	7422                	ld	s0,40(sp)
 3b0:	6145                	addi	sp,sp,48
 3b2:	8082                	ret

00000000000003b4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3b4:	7139                	addi	sp,sp,-64
 3b6:	fc22                	sd	s0,56(sp)
 3b8:	0080                	addi	s0,sp,64
 3ba:	fca43c23          	sd	a0,-40(s0)
 3be:	fcb43823          	sd	a1,-48(s0)
 3c2:	87b2                	mv	a5,a2
 3c4:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 3c8:	fd843783          	ld	a5,-40(s0)
 3cc:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 3d0:	fd043783          	ld	a5,-48(s0)
 3d4:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 3d8:	fe043703          	ld	a4,-32(s0)
 3dc:	fe843783          	ld	a5,-24(s0)
 3e0:	02e7fc63          	bgeu	a5,a4,418 <memmove+0x64>
    while(n-- > 0)
 3e4:	a00d                	j	406 <memmove+0x52>
      *dst++ = *src++;
 3e6:	fe043703          	ld	a4,-32(s0)
 3ea:	00170793          	addi	a5,a4,1
 3ee:	fef43023          	sd	a5,-32(s0)
 3f2:	fe843783          	ld	a5,-24(s0)
 3f6:	00178693          	addi	a3,a5,1
 3fa:	fed43423          	sd	a3,-24(s0)
 3fe:	00074703          	lbu	a4,0(a4)
 402:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 406:	fcc42783          	lw	a5,-52(s0)
 40a:	fff7871b          	addiw	a4,a5,-1
 40e:	fce42623          	sw	a4,-52(s0)
 412:	fcf04ae3          	bgtz	a5,3e6 <memmove+0x32>
 416:	a891                	j	46a <memmove+0xb6>
  } else {
    dst += n;
 418:	fcc42783          	lw	a5,-52(s0)
 41c:	fe843703          	ld	a4,-24(s0)
 420:	97ba                	add	a5,a5,a4
 422:	fef43423          	sd	a5,-24(s0)
    src += n;
 426:	fcc42783          	lw	a5,-52(s0)
 42a:	fe043703          	ld	a4,-32(s0)
 42e:	97ba                	add	a5,a5,a4
 430:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 434:	a01d                	j	45a <memmove+0xa6>
      *--dst = *--src;
 436:	fe043783          	ld	a5,-32(s0)
 43a:	17fd                	addi	a5,a5,-1
 43c:	fef43023          	sd	a5,-32(s0)
 440:	fe843783          	ld	a5,-24(s0)
 444:	17fd                	addi	a5,a5,-1
 446:	fef43423          	sd	a5,-24(s0)
 44a:	fe043783          	ld	a5,-32(s0)
 44e:	0007c703          	lbu	a4,0(a5)
 452:	fe843783          	ld	a5,-24(s0)
 456:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 45a:	fcc42783          	lw	a5,-52(s0)
 45e:	fff7871b          	addiw	a4,a5,-1
 462:	fce42623          	sw	a4,-52(s0)
 466:	fcf048e3          	bgtz	a5,436 <memmove+0x82>
  }
  return vdst;
 46a:	fd843783          	ld	a5,-40(s0)
}
 46e:	853e                	mv	a0,a5
 470:	7462                	ld	s0,56(sp)
 472:	6121                	addi	sp,sp,64
 474:	8082                	ret

0000000000000476 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 476:	7139                	addi	sp,sp,-64
 478:	fc22                	sd	s0,56(sp)
 47a:	0080                	addi	s0,sp,64
 47c:	fca43c23          	sd	a0,-40(s0)
 480:	fcb43823          	sd	a1,-48(s0)
 484:	87b2                	mv	a5,a2
 486:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 48a:	fd843783          	ld	a5,-40(s0)
 48e:	fef43423          	sd	a5,-24(s0)
 492:	fd043783          	ld	a5,-48(s0)
 496:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 49a:	a0a1                	j	4e2 <memcmp+0x6c>
    if (*p1 != *p2) {
 49c:	fe843783          	ld	a5,-24(s0)
 4a0:	0007c703          	lbu	a4,0(a5)
 4a4:	fe043783          	ld	a5,-32(s0)
 4a8:	0007c783          	lbu	a5,0(a5)
 4ac:	02f70163          	beq	a4,a5,4ce <memcmp+0x58>
      return *p1 - *p2;
 4b0:	fe843783          	ld	a5,-24(s0)
 4b4:	0007c783          	lbu	a5,0(a5)
 4b8:	0007871b          	sext.w	a4,a5
 4bc:	fe043783          	ld	a5,-32(s0)
 4c0:	0007c783          	lbu	a5,0(a5)
 4c4:	2781                	sext.w	a5,a5
 4c6:	40f707bb          	subw	a5,a4,a5
 4ca:	2781                	sext.w	a5,a5
 4cc:	a01d                	j	4f2 <memcmp+0x7c>
    }
    p1++;
 4ce:	fe843783          	ld	a5,-24(s0)
 4d2:	0785                	addi	a5,a5,1
 4d4:	fef43423          	sd	a5,-24(s0)
    p2++;
 4d8:	fe043783          	ld	a5,-32(s0)
 4dc:	0785                	addi	a5,a5,1
 4de:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 4e2:	fcc42783          	lw	a5,-52(s0)
 4e6:	fff7871b          	addiw	a4,a5,-1
 4ea:	fce42623          	sw	a4,-52(s0)
 4ee:	f7dd                	bnez	a5,49c <memcmp+0x26>
  }
  return 0;
 4f0:	4781                	li	a5,0
}
 4f2:	853e                	mv	a0,a5
 4f4:	7462                	ld	s0,56(sp)
 4f6:	6121                	addi	sp,sp,64
 4f8:	8082                	ret

00000000000004fa <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4fa:	7179                	addi	sp,sp,-48
 4fc:	f406                	sd	ra,40(sp)
 4fe:	f022                	sd	s0,32(sp)
 500:	1800                	addi	s0,sp,48
 502:	fea43423          	sd	a0,-24(s0)
 506:	feb43023          	sd	a1,-32(s0)
 50a:	87b2                	mv	a5,a2
 50c:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 510:	fdc42783          	lw	a5,-36(s0)
 514:	863e                	mv	a2,a5
 516:	fe043583          	ld	a1,-32(s0)
 51a:	fe843503          	ld	a0,-24(s0)
 51e:	00000097          	auipc	ra,0x0
 522:	e96080e7          	jalr	-362(ra) # 3b4 <memmove>
 526:	87aa                	mv	a5,a0
}
 528:	853e                	mv	a0,a5
 52a:	70a2                	ld	ra,40(sp)
 52c:	7402                	ld	s0,32(sp)
 52e:	6145                	addi	sp,sp,48
 530:	8082                	ret

0000000000000532 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 532:	4885                	li	a7,1
 ecall
 534:	00000073          	ecall
 ret
 538:	8082                	ret

000000000000053a <exit>:
.global exit
exit:
 li a7, SYS_exit
 53a:	4889                	li	a7,2
 ecall
 53c:	00000073          	ecall
 ret
 540:	8082                	ret

0000000000000542 <wait>:
.global wait
wait:
 li a7, SYS_wait
 542:	488d                	li	a7,3
 ecall
 544:	00000073          	ecall
 ret
 548:	8082                	ret

000000000000054a <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 54a:	4891                	li	a7,4
 ecall
 54c:	00000073          	ecall
 ret
 550:	8082                	ret

0000000000000552 <read>:
.global read
read:
 li a7, SYS_read
 552:	4895                	li	a7,5
 ecall
 554:	00000073          	ecall
 ret
 558:	8082                	ret

000000000000055a <write>:
.global write
write:
 li a7, SYS_write
 55a:	48c1                	li	a7,16
 ecall
 55c:	00000073          	ecall
 ret
 560:	8082                	ret

0000000000000562 <close>:
.global close
close:
 li a7, SYS_close
 562:	48d5                	li	a7,21
 ecall
 564:	00000073          	ecall
 ret
 568:	8082                	ret

000000000000056a <kill>:
.global kill
kill:
 li a7, SYS_kill
 56a:	4899                	li	a7,6
 ecall
 56c:	00000073          	ecall
 ret
 570:	8082                	ret

0000000000000572 <exec>:
.global exec
exec:
 li a7, SYS_exec
 572:	489d                	li	a7,7
 ecall
 574:	00000073          	ecall
 ret
 578:	8082                	ret

000000000000057a <open>:
.global open
open:
 li a7, SYS_open
 57a:	48bd                	li	a7,15
 ecall
 57c:	00000073          	ecall
 ret
 580:	8082                	ret

0000000000000582 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 582:	48c5                	li	a7,17
 ecall
 584:	00000073          	ecall
 ret
 588:	8082                	ret

000000000000058a <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 58a:	48c9                	li	a7,18
 ecall
 58c:	00000073          	ecall
 ret
 590:	8082                	ret

0000000000000592 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 592:	48a1                	li	a7,8
 ecall
 594:	00000073          	ecall
 ret
 598:	8082                	ret

000000000000059a <link>:
.global link
link:
 li a7, SYS_link
 59a:	48cd                	li	a7,19
 ecall
 59c:	00000073          	ecall
 ret
 5a0:	8082                	ret

00000000000005a2 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 5a2:	48d1                	li	a7,20
 ecall
 5a4:	00000073          	ecall
 ret
 5a8:	8082                	ret

00000000000005aa <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 5aa:	48a5                	li	a7,9
 ecall
 5ac:	00000073          	ecall
 ret
 5b0:	8082                	ret

00000000000005b2 <dup>:
.global dup
dup:
 li a7, SYS_dup
 5b2:	48a9                	li	a7,10
 ecall
 5b4:	00000073          	ecall
 ret
 5b8:	8082                	ret

00000000000005ba <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 5ba:	48ad                	li	a7,11
 ecall
 5bc:	00000073          	ecall
 ret
 5c0:	8082                	ret

00000000000005c2 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 5c2:	48b1                	li	a7,12
 ecall
 5c4:	00000073          	ecall
 ret
 5c8:	8082                	ret

00000000000005ca <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 5ca:	48b5                	li	a7,13
 ecall
 5cc:	00000073          	ecall
 ret
 5d0:	8082                	ret

00000000000005d2 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 5d2:	48b9                	li	a7,14
 ecall
 5d4:	00000073          	ecall
 ret
 5d8:	8082                	ret

00000000000005da <setSchedAlg>:
.global setSchedAlg
setSchedAlg:
 li a7, SYS_setSchedAlg
 5da:	48d9                	li	a7,22
 ecall
 5dc:	00000073          	ecall
 ret
 5e0:	8082                	ret

00000000000005e2 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 5e2:	1101                	addi	sp,sp,-32
 5e4:	ec06                	sd	ra,24(sp)
 5e6:	e822                	sd	s0,16(sp)
 5e8:	1000                	addi	s0,sp,32
 5ea:	87aa                	mv	a5,a0
 5ec:	872e                	mv	a4,a1
 5ee:	fef42623          	sw	a5,-20(s0)
 5f2:	87ba                	mv	a5,a4
 5f4:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 5f8:	feb40713          	addi	a4,s0,-21
 5fc:	fec42783          	lw	a5,-20(s0)
 600:	4605                	li	a2,1
 602:	85ba                	mv	a1,a4
 604:	853e                	mv	a0,a5
 606:	00000097          	auipc	ra,0x0
 60a:	f54080e7          	jalr	-172(ra) # 55a <write>
}
 60e:	0001                	nop
 610:	60e2                	ld	ra,24(sp)
 612:	6442                	ld	s0,16(sp)
 614:	6105                	addi	sp,sp,32
 616:	8082                	ret

0000000000000618 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 618:	7139                	addi	sp,sp,-64
 61a:	fc06                	sd	ra,56(sp)
 61c:	f822                	sd	s0,48(sp)
 61e:	0080                	addi	s0,sp,64
 620:	87aa                	mv	a5,a0
 622:	8736                	mv	a4,a3
 624:	fcf42623          	sw	a5,-52(s0)
 628:	87ae                	mv	a5,a1
 62a:	fcf42423          	sw	a5,-56(s0)
 62e:	87b2                	mv	a5,a2
 630:	fcf42223          	sw	a5,-60(s0)
 634:	87ba                	mv	a5,a4
 636:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 63a:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 63e:	fc042783          	lw	a5,-64(s0)
 642:	2781                	sext.w	a5,a5
 644:	c38d                	beqz	a5,666 <printint+0x4e>
 646:	fc842783          	lw	a5,-56(s0)
 64a:	2781                	sext.w	a5,a5
 64c:	0007dd63          	bgez	a5,666 <printint+0x4e>
    neg = 1;
 650:	4785                	li	a5,1
 652:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 656:	fc842783          	lw	a5,-56(s0)
 65a:	40f007bb          	negw	a5,a5
 65e:	2781                	sext.w	a5,a5
 660:	fef42223          	sw	a5,-28(s0)
 664:	a029                	j	66e <printint+0x56>
  } else {
    x = xx;
 666:	fc842783          	lw	a5,-56(s0)
 66a:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 66e:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 672:	fc442783          	lw	a5,-60(s0)
 676:	fe442703          	lw	a4,-28(s0)
 67a:	02f777bb          	remuw	a5,a4,a5
 67e:	0007861b          	sext.w	a2,a5
 682:	fec42783          	lw	a5,-20(s0)
 686:	0017871b          	addiw	a4,a5,1
 68a:	fee42623          	sw	a4,-20(s0)
 68e:	00000697          	auipc	a3,0x0
 692:	75268693          	addi	a3,a3,1874 # de0 <digits>
 696:	02061713          	slli	a4,a2,0x20
 69a:	9301                	srli	a4,a4,0x20
 69c:	9736                	add	a4,a4,a3
 69e:	00074703          	lbu	a4,0(a4)
 6a2:	ff040693          	addi	a3,s0,-16
 6a6:	97b6                	add	a5,a5,a3
 6a8:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 6ac:	fc442783          	lw	a5,-60(s0)
 6b0:	fe442703          	lw	a4,-28(s0)
 6b4:	02f757bb          	divuw	a5,a4,a5
 6b8:	fef42223          	sw	a5,-28(s0)
 6bc:	fe442783          	lw	a5,-28(s0)
 6c0:	2781                	sext.w	a5,a5
 6c2:	fbc5                	bnez	a5,672 <printint+0x5a>
  if(neg)
 6c4:	fe842783          	lw	a5,-24(s0)
 6c8:	2781                	sext.w	a5,a5
 6ca:	cf95                	beqz	a5,706 <printint+0xee>
    buf[i++] = '-';
 6cc:	fec42783          	lw	a5,-20(s0)
 6d0:	0017871b          	addiw	a4,a5,1
 6d4:	fee42623          	sw	a4,-20(s0)
 6d8:	ff040713          	addi	a4,s0,-16
 6dc:	97ba                	add	a5,a5,a4
 6de:	02d00713          	li	a4,45
 6e2:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 6e6:	a005                	j	706 <printint+0xee>
    putc(fd, buf[i]);
 6e8:	fec42783          	lw	a5,-20(s0)
 6ec:	ff040713          	addi	a4,s0,-16
 6f0:	97ba                	add	a5,a5,a4
 6f2:	fe07c703          	lbu	a4,-32(a5)
 6f6:	fcc42783          	lw	a5,-52(s0)
 6fa:	85ba                	mv	a1,a4
 6fc:	853e                	mv	a0,a5
 6fe:	00000097          	auipc	ra,0x0
 702:	ee4080e7          	jalr	-284(ra) # 5e2 <putc>
  while(--i >= 0)
 706:	fec42783          	lw	a5,-20(s0)
 70a:	37fd                	addiw	a5,a5,-1
 70c:	fef42623          	sw	a5,-20(s0)
 710:	fec42783          	lw	a5,-20(s0)
 714:	2781                	sext.w	a5,a5
 716:	fc07d9e3          	bgez	a5,6e8 <printint+0xd0>
}
 71a:	0001                	nop
 71c:	0001                	nop
 71e:	70e2                	ld	ra,56(sp)
 720:	7442                	ld	s0,48(sp)
 722:	6121                	addi	sp,sp,64
 724:	8082                	ret

0000000000000726 <printptr>:

static void
printptr(int fd, uint64 x) {
 726:	7179                	addi	sp,sp,-48
 728:	f406                	sd	ra,40(sp)
 72a:	f022                	sd	s0,32(sp)
 72c:	1800                	addi	s0,sp,48
 72e:	87aa                	mv	a5,a0
 730:	fcb43823          	sd	a1,-48(s0)
 734:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 738:	fdc42783          	lw	a5,-36(s0)
 73c:	03000593          	li	a1,48
 740:	853e                	mv	a0,a5
 742:	00000097          	auipc	ra,0x0
 746:	ea0080e7          	jalr	-352(ra) # 5e2 <putc>
  putc(fd, 'x');
 74a:	fdc42783          	lw	a5,-36(s0)
 74e:	07800593          	li	a1,120
 752:	853e                	mv	a0,a5
 754:	00000097          	auipc	ra,0x0
 758:	e8e080e7          	jalr	-370(ra) # 5e2 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 75c:	fe042623          	sw	zero,-20(s0)
 760:	a82d                	j	79a <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 762:	fd043783          	ld	a5,-48(s0)
 766:	93f1                	srli	a5,a5,0x3c
 768:	00000717          	auipc	a4,0x0
 76c:	67870713          	addi	a4,a4,1656 # de0 <digits>
 770:	97ba                	add	a5,a5,a4
 772:	0007c703          	lbu	a4,0(a5)
 776:	fdc42783          	lw	a5,-36(s0)
 77a:	85ba                	mv	a1,a4
 77c:	853e                	mv	a0,a5
 77e:	00000097          	auipc	ra,0x0
 782:	e64080e7          	jalr	-412(ra) # 5e2 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 786:	fec42783          	lw	a5,-20(s0)
 78a:	2785                	addiw	a5,a5,1
 78c:	fef42623          	sw	a5,-20(s0)
 790:	fd043783          	ld	a5,-48(s0)
 794:	0792                	slli	a5,a5,0x4
 796:	fcf43823          	sd	a5,-48(s0)
 79a:	fec42783          	lw	a5,-20(s0)
 79e:	873e                	mv	a4,a5
 7a0:	47bd                	li	a5,15
 7a2:	fce7f0e3          	bgeu	a5,a4,762 <printptr+0x3c>
}
 7a6:	0001                	nop
 7a8:	0001                	nop
 7aa:	70a2                	ld	ra,40(sp)
 7ac:	7402                	ld	s0,32(sp)
 7ae:	6145                	addi	sp,sp,48
 7b0:	8082                	ret

00000000000007b2 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 7b2:	715d                	addi	sp,sp,-80
 7b4:	e486                	sd	ra,72(sp)
 7b6:	e0a2                	sd	s0,64(sp)
 7b8:	0880                	addi	s0,sp,80
 7ba:	87aa                	mv	a5,a0
 7bc:	fcb43023          	sd	a1,-64(s0)
 7c0:	fac43c23          	sd	a2,-72(s0)
 7c4:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 7c8:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 7cc:	fe042223          	sw	zero,-28(s0)
 7d0:	a42d                	j	9fa <vprintf+0x248>
    c = fmt[i] & 0xff;
 7d2:	fe442783          	lw	a5,-28(s0)
 7d6:	fc043703          	ld	a4,-64(s0)
 7da:	97ba                	add	a5,a5,a4
 7dc:	0007c783          	lbu	a5,0(a5)
 7e0:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 7e4:	fe042783          	lw	a5,-32(s0)
 7e8:	2781                	sext.w	a5,a5
 7ea:	eb9d                	bnez	a5,820 <vprintf+0x6e>
      if(c == '%'){
 7ec:	fdc42783          	lw	a5,-36(s0)
 7f0:	0007871b          	sext.w	a4,a5
 7f4:	02500793          	li	a5,37
 7f8:	00f71763          	bne	a4,a5,806 <vprintf+0x54>
        state = '%';
 7fc:	02500793          	li	a5,37
 800:	fef42023          	sw	a5,-32(s0)
 804:	a2f5                	j	9f0 <vprintf+0x23e>
      } else {
        putc(fd, c);
 806:	fdc42783          	lw	a5,-36(s0)
 80a:	0ff7f713          	andi	a4,a5,255
 80e:	fcc42783          	lw	a5,-52(s0)
 812:	85ba                	mv	a1,a4
 814:	853e                	mv	a0,a5
 816:	00000097          	auipc	ra,0x0
 81a:	dcc080e7          	jalr	-564(ra) # 5e2 <putc>
 81e:	aac9                	j	9f0 <vprintf+0x23e>
      }
    } else if(state == '%'){
 820:	fe042783          	lw	a5,-32(s0)
 824:	0007871b          	sext.w	a4,a5
 828:	02500793          	li	a5,37
 82c:	1cf71263          	bne	a4,a5,9f0 <vprintf+0x23e>
      if(c == 'd'){
 830:	fdc42783          	lw	a5,-36(s0)
 834:	0007871b          	sext.w	a4,a5
 838:	06400793          	li	a5,100
 83c:	02f71463          	bne	a4,a5,864 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 840:	fb843783          	ld	a5,-72(s0)
 844:	00878713          	addi	a4,a5,8
 848:	fae43c23          	sd	a4,-72(s0)
 84c:	4398                	lw	a4,0(a5)
 84e:	fcc42783          	lw	a5,-52(s0)
 852:	4685                	li	a3,1
 854:	4629                	li	a2,10
 856:	85ba                	mv	a1,a4
 858:	853e                	mv	a0,a5
 85a:	00000097          	auipc	ra,0x0
 85e:	dbe080e7          	jalr	-578(ra) # 618 <printint>
 862:	a269                	j	9ec <vprintf+0x23a>
      } else if(c == 'l') {
 864:	fdc42783          	lw	a5,-36(s0)
 868:	0007871b          	sext.w	a4,a5
 86c:	06c00793          	li	a5,108
 870:	02f71663          	bne	a4,a5,89c <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 874:	fb843783          	ld	a5,-72(s0)
 878:	00878713          	addi	a4,a5,8
 87c:	fae43c23          	sd	a4,-72(s0)
 880:	639c                	ld	a5,0(a5)
 882:	0007871b          	sext.w	a4,a5
 886:	fcc42783          	lw	a5,-52(s0)
 88a:	4681                	li	a3,0
 88c:	4629                	li	a2,10
 88e:	85ba                	mv	a1,a4
 890:	853e                	mv	a0,a5
 892:	00000097          	auipc	ra,0x0
 896:	d86080e7          	jalr	-634(ra) # 618 <printint>
 89a:	aa89                	j	9ec <vprintf+0x23a>
      } else if(c == 'x') {
 89c:	fdc42783          	lw	a5,-36(s0)
 8a0:	0007871b          	sext.w	a4,a5
 8a4:	07800793          	li	a5,120
 8a8:	02f71463          	bne	a4,a5,8d0 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 8ac:	fb843783          	ld	a5,-72(s0)
 8b0:	00878713          	addi	a4,a5,8
 8b4:	fae43c23          	sd	a4,-72(s0)
 8b8:	4398                	lw	a4,0(a5)
 8ba:	fcc42783          	lw	a5,-52(s0)
 8be:	4681                	li	a3,0
 8c0:	4641                	li	a2,16
 8c2:	85ba                	mv	a1,a4
 8c4:	853e                	mv	a0,a5
 8c6:	00000097          	auipc	ra,0x0
 8ca:	d52080e7          	jalr	-686(ra) # 618 <printint>
 8ce:	aa39                	j	9ec <vprintf+0x23a>
      } else if(c == 'p') {
 8d0:	fdc42783          	lw	a5,-36(s0)
 8d4:	0007871b          	sext.w	a4,a5
 8d8:	07000793          	li	a5,112
 8dc:	02f71263          	bne	a4,a5,900 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 8e0:	fb843783          	ld	a5,-72(s0)
 8e4:	00878713          	addi	a4,a5,8
 8e8:	fae43c23          	sd	a4,-72(s0)
 8ec:	6398                	ld	a4,0(a5)
 8ee:	fcc42783          	lw	a5,-52(s0)
 8f2:	85ba                	mv	a1,a4
 8f4:	853e                	mv	a0,a5
 8f6:	00000097          	auipc	ra,0x0
 8fa:	e30080e7          	jalr	-464(ra) # 726 <printptr>
 8fe:	a0fd                	j	9ec <vprintf+0x23a>
      } else if(c == 's'){
 900:	fdc42783          	lw	a5,-36(s0)
 904:	0007871b          	sext.w	a4,a5
 908:	07300793          	li	a5,115
 90c:	04f71c63          	bne	a4,a5,964 <vprintf+0x1b2>
        s = va_arg(ap, char*);
 910:	fb843783          	ld	a5,-72(s0)
 914:	00878713          	addi	a4,a5,8
 918:	fae43c23          	sd	a4,-72(s0)
 91c:	639c                	ld	a5,0(a5)
 91e:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 922:	fe843783          	ld	a5,-24(s0)
 926:	eb8d                	bnez	a5,958 <vprintf+0x1a6>
          s = "(null)";
 928:	00000797          	auipc	a5,0x0
 92c:	4b078793          	addi	a5,a5,1200 # dd8 <malloc+0x176>
 930:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 934:	a015                	j	958 <vprintf+0x1a6>
          putc(fd, *s);
 936:	fe843783          	ld	a5,-24(s0)
 93a:	0007c703          	lbu	a4,0(a5)
 93e:	fcc42783          	lw	a5,-52(s0)
 942:	85ba                	mv	a1,a4
 944:	853e                	mv	a0,a5
 946:	00000097          	auipc	ra,0x0
 94a:	c9c080e7          	jalr	-868(ra) # 5e2 <putc>
          s++;
 94e:	fe843783          	ld	a5,-24(s0)
 952:	0785                	addi	a5,a5,1
 954:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 958:	fe843783          	ld	a5,-24(s0)
 95c:	0007c783          	lbu	a5,0(a5)
 960:	fbf9                	bnez	a5,936 <vprintf+0x184>
 962:	a069                	j	9ec <vprintf+0x23a>
        }
      } else if(c == 'c'){
 964:	fdc42783          	lw	a5,-36(s0)
 968:	0007871b          	sext.w	a4,a5
 96c:	06300793          	li	a5,99
 970:	02f71463          	bne	a4,a5,998 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 974:	fb843783          	ld	a5,-72(s0)
 978:	00878713          	addi	a4,a5,8
 97c:	fae43c23          	sd	a4,-72(s0)
 980:	439c                	lw	a5,0(a5)
 982:	0ff7f713          	andi	a4,a5,255
 986:	fcc42783          	lw	a5,-52(s0)
 98a:	85ba                	mv	a1,a4
 98c:	853e                	mv	a0,a5
 98e:	00000097          	auipc	ra,0x0
 992:	c54080e7          	jalr	-940(ra) # 5e2 <putc>
 996:	a899                	j	9ec <vprintf+0x23a>
      } else if(c == '%'){
 998:	fdc42783          	lw	a5,-36(s0)
 99c:	0007871b          	sext.w	a4,a5
 9a0:	02500793          	li	a5,37
 9a4:	00f71f63          	bne	a4,a5,9c2 <vprintf+0x210>
        putc(fd, c);
 9a8:	fdc42783          	lw	a5,-36(s0)
 9ac:	0ff7f713          	andi	a4,a5,255
 9b0:	fcc42783          	lw	a5,-52(s0)
 9b4:	85ba                	mv	a1,a4
 9b6:	853e                	mv	a0,a5
 9b8:	00000097          	auipc	ra,0x0
 9bc:	c2a080e7          	jalr	-982(ra) # 5e2 <putc>
 9c0:	a035                	j	9ec <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9c2:	fcc42783          	lw	a5,-52(s0)
 9c6:	02500593          	li	a1,37
 9ca:	853e                	mv	a0,a5
 9cc:	00000097          	auipc	ra,0x0
 9d0:	c16080e7          	jalr	-1002(ra) # 5e2 <putc>
        putc(fd, c);
 9d4:	fdc42783          	lw	a5,-36(s0)
 9d8:	0ff7f713          	andi	a4,a5,255
 9dc:	fcc42783          	lw	a5,-52(s0)
 9e0:	85ba                	mv	a1,a4
 9e2:	853e                	mv	a0,a5
 9e4:	00000097          	auipc	ra,0x0
 9e8:	bfe080e7          	jalr	-1026(ra) # 5e2 <putc>
      }
      state = 0;
 9ec:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 9f0:	fe442783          	lw	a5,-28(s0)
 9f4:	2785                	addiw	a5,a5,1
 9f6:	fef42223          	sw	a5,-28(s0)
 9fa:	fe442783          	lw	a5,-28(s0)
 9fe:	fc043703          	ld	a4,-64(s0)
 a02:	97ba                	add	a5,a5,a4
 a04:	0007c783          	lbu	a5,0(a5)
 a08:	dc0795e3          	bnez	a5,7d2 <vprintf+0x20>
    }
  }
}
 a0c:	0001                	nop
 a0e:	0001                	nop
 a10:	60a6                	ld	ra,72(sp)
 a12:	6406                	ld	s0,64(sp)
 a14:	6161                	addi	sp,sp,80
 a16:	8082                	ret

0000000000000a18 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 a18:	7159                	addi	sp,sp,-112
 a1a:	fc06                	sd	ra,56(sp)
 a1c:	f822                	sd	s0,48(sp)
 a1e:	0080                	addi	s0,sp,64
 a20:	fcb43823          	sd	a1,-48(s0)
 a24:	e010                	sd	a2,0(s0)
 a26:	e414                	sd	a3,8(s0)
 a28:	e818                	sd	a4,16(s0)
 a2a:	ec1c                	sd	a5,24(s0)
 a2c:	03043023          	sd	a6,32(s0)
 a30:	03143423          	sd	a7,40(s0)
 a34:	87aa                	mv	a5,a0
 a36:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 a3a:	03040793          	addi	a5,s0,48
 a3e:	fcf43423          	sd	a5,-56(s0)
 a42:	fc843783          	ld	a5,-56(s0)
 a46:	fd078793          	addi	a5,a5,-48
 a4a:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 a4e:	fe843703          	ld	a4,-24(s0)
 a52:	fdc42783          	lw	a5,-36(s0)
 a56:	863a                	mv	a2,a4
 a58:	fd043583          	ld	a1,-48(s0)
 a5c:	853e                	mv	a0,a5
 a5e:	00000097          	auipc	ra,0x0
 a62:	d54080e7          	jalr	-684(ra) # 7b2 <vprintf>
}
 a66:	0001                	nop
 a68:	70e2                	ld	ra,56(sp)
 a6a:	7442                	ld	s0,48(sp)
 a6c:	6165                	addi	sp,sp,112
 a6e:	8082                	ret

0000000000000a70 <printf>:

void
printf(const char *fmt, ...)
{
 a70:	7159                	addi	sp,sp,-112
 a72:	f406                	sd	ra,40(sp)
 a74:	f022                	sd	s0,32(sp)
 a76:	1800                	addi	s0,sp,48
 a78:	fca43c23          	sd	a0,-40(s0)
 a7c:	e40c                	sd	a1,8(s0)
 a7e:	e810                	sd	a2,16(s0)
 a80:	ec14                	sd	a3,24(s0)
 a82:	f018                	sd	a4,32(s0)
 a84:	f41c                	sd	a5,40(s0)
 a86:	03043823          	sd	a6,48(s0)
 a8a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 a8e:	04040793          	addi	a5,s0,64
 a92:	fcf43823          	sd	a5,-48(s0)
 a96:	fd043783          	ld	a5,-48(s0)
 a9a:	fc878793          	addi	a5,a5,-56
 a9e:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 aa2:	fe843783          	ld	a5,-24(s0)
 aa6:	863e                	mv	a2,a5
 aa8:	fd843583          	ld	a1,-40(s0)
 aac:	4505                	li	a0,1
 aae:	00000097          	auipc	ra,0x0
 ab2:	d04080e7          	jalr	-764(ra) # 7b2 <vprintf>
}
 ab6:	0001                	nop
 ab8:	70a2                	ld	ra,40(sp)
 aba:	7402                	ld	s0,32(sp)
 abc:	6165                	addi	sp,sp,112
 abe:	8082                	ret

0000000000000ac0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 ac0:	7179                	addi	sp,sp,-48
 ac2:	f422                	sd	s0,40(sp)
 ac4:	1800                	addi	s0,sp,48
 ac6:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 aca:	fd843783          	ld	a5,-40(s0)
 ace:	17c1                	addi	a5,a5,-16
 ad0:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ad4:	00000797          	auipc	a5,0x0
 ad8:	33478793          	addi	a5,a5,820 # e08 <freep>
 adc:	639c                	ld	a5,0(a5)
 ade:	fef43423          	sd	a5,-24(s0)
 ae2:	a815                	j	b16 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ae4:	fe843783          	ld	a5,-24(s0)
 ae8:	639c                	ld	a5,0(a5)
 aea:	fe843703          	ld	a4,-24(s0)
 aee:	00f76f63          	bltu	a4,a5,b0c <free+0x4c>
 af2:	fe043703          	ld	a4,-32(s0)
 af6:	fe843783          	ld	a5,-24(s0)
 afa:	02e7eb63          	bltu	a5,a4,b30 <free+0x70>
 afe:	fe843783          	ld	a5,-24(s0)
 b02:	639c                	ld	a5,0(a5)
 b04:	fe043703          	ld	a4,-32(s0)
 b08:	02f76463          	bltu	a4,a5,b30 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b0c:	fe843783          	ld	a5,-24(s0)
 b10:	639c                	ld	a5,0(a5)
 b12:	fef43423          	sd	a5,-24(s0)
 b16:	fe043703          	ld	a4,-32(s0)
 b1a:	fe843783          	ld	a5,-24(s0)
 b1e:	fce7f3e3          	bgeu	a5,a4,ae4 <free+0x24>
 b22:	fe843783          	ld	a5,-24(s0)
 b26:	639c                	ld	a5,0(a5)
 b28:	fe043703          	ld	a4,-32(s0)
 b2c:	faf77ce3          	bgeu	a4,a5,ae4 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b30:	fe043783          	ld	a5,-32(s0)
 b34:	479c                	lw	a5,8(a5)
 b36:	1782                	slli	a5,a5,0x20
 b38:	9381                	srli	a5,a5,0x20
 b3a:	0792                	slli	a5,a5,0x4
 b3c:	fe043703          	ld	a4,-32(s0)
 b40:	973e                	add	a4,a4,a5
 b42:	fe843783          	ld	a5,-24(s0)
 b46:	639c                	ld	a5,0(a5)
 b48:	02f71763          	bne	a4,a5,b76 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
 b4c:	fe043783          	ld	a5,-32(s0)
 b50:	4798                	lw	a4,8(a5)
 b52:	fe843783          	ld	a5,-24(s0)
 b56:	639c                	ld	a5,0(a5)
 b58:	479c                	lw	a5,8(a5)
 b5a:	9fb9                	addw	a5,a5,a4
 b5c:	0007871b          	sext.w	a4,a5
 b60:	fe043783          	ld	a5,-32(s0)
 b64:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 b66:	fe843783          	ld	a5,-24(s0)
 b6a:	639c                	ld	a5,0(a5)
 b6c:	6398                	ld	a4,0(a5)
 b6e:	fe043783          	ld	a5,-32(s0)
 b72:	e398                	sd	a4,0(a5)
 b74:	a039                	j	b82 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
 b76:	fe843783          	ld	a5,-24(s0)
 b7a:	6398                	ld	a4,0(a5)
 b7c:	fe043783          	ld	a5,-32(s0)
 b80:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 b82:	fe843783          	ld	a5,-24(s0)
 b86:	479c                	lw	a5,8(a5)
 b88:	1782                	slli	a5,a5,0x20
 b8a:	9381                	srli	a5,a5,0x20
 b8c:	0792                	slli	a5,a5,0x4
 b8e:	fe843703          	ld	a4,-24(s0)
 b92:	97ba                	add	a5,a5,a4
 b94:	fe043703          	ld	a4,-32(s0)
 b98:	02f71563          	bne	a4,a5,bc2 <free+0x102>
    p->s.size += bp->s.size;
 b9c:	fe843783          	ld	a5,-24(s0)
 ba0:	4798                	lw	a4,8(a5)
 ba2:	fe043783          	ld	a5,-32(s0)
 ba6:	479c                	lw	a5,8(a5)
 ba8:	9fb9                	addw	a5,a5,a4
 baa:	0007871b          	sext.w	a4,a5
 bae:	fe843783          	ld	a5,-24(s0)
 bb2:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 bb4:	fe043783          	ld	a5,-32(s0)
 bb8:	6398                	ld	a4,0(a5)
 bba:	fe843783          	ld	a5,-24(s0)
 bbe:	e398                	sd	a4,0(a5)
 bc0:	a031                	j	bcc <free+0x10c>
  } else
    p->s.ptr = bp;
 bc2:	fe843783          	ld	a5,-24(s0)
 bc6:	fe043703          	ld	a4,-32(s0)
 bca:	e398                	sd	a4,0(a5)
  freep = p;
 bcc:	00000797          	auipc	a5,0x0
 bd0:	23c78793          	addi	a5,a5,572 # e08 <freep>
 bd4:	fe843703          	ld	a4,-24(s0)
 bd8:	e398                	sd	a4,0(a5)
}
 bda:	0001                	nop
 bdc:	7422                	ld	s0,40(sp)
 bde:	6145                	addi	sp,sp,48
 be0:	8082                	ret

0000000000000be2 <morecore>:

static Header*
morecore(uint nu)
{
 be2:	7179                	addi	sp,sp,-48
 be4:	f406                	sd	ra,40(sp)
 be6:	f022                	sd	s0,32(sp)
 be8:	1800                	addi	s0,sp,48
 bea:	87aa                	mv	a5,a0
 bec:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 bf0:	fdc42783          	lw	a5,-36(s0)
 bf4:	0007871b          	sext.w	a4,a5
 bf8:	6785                	lui	a5,0x1
 bfa:	00f77563          	bgeu	a4,a5,c04 <morecore+0x22>
    nu = 4096;
 bfe:	6785                	lui	a5,0x1
 c00:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 c04:	fdc42783          	lw	a5,-36(s0)
 c08:	0047979b          	slliw	a5,a5,0x4
 c0c:	2781                	sext.w	a5,a5
 c0e:	2781                	sext.w	a5,a5
 c10:	853e                	mv	a0,a5
 c12:	00000097          	auipc	ra,0x0
 c16:	9b0080e7          	jalr	-1616(ra) # 5c2 <sbrk>
 c1a:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 c1e:	fe843703          	ld	a4,-24(s0)
 c22:	57fd                	li	a5,-1
 c24:	00f71463          	bne	a4,a5,c2c <morecore+0x4a>
    return 0;
 c28:	4781                	li	a5,0
 c2a:	a03d                	j	c58 <morecore+0x76>
  hp = (Header*)p;
 c2c:	fe843783          	ld	a5,-24(s0)
 c30:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 c34:	fe043783          	ld	a5,-32(s0)
 c38:	fdc42703          	lw	a4,-36(s0)
 c3c:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 c3e:	fe043783          	ld	a5,-32(s0)
 c42:	07c1                	addi	a5,a5,16
 c44:	853e                	mv	a0,a5
 c46:	00000097          	auipc	ra,0x0
 c4a:	e7a080e7          	jalr	-390(ra) # ac0 <free>
  return freep;
 c4e:	00000797          	auipc	a5,0x0
 c52:	1ba78793          	addi	a5,a5,442 # e08 <freep>
 c56:	639c                	ld	a5,0(a5)
}
 c58:	853e                	mv	a0,a5
 c5a:	70a2                	ld	ra,40(sp)
 c5c:	7402                	ld	s0,32(sp)
 c5e:	6145                	addi	sp,sp,48
 c60:	8082                	ret

0000000000000c62 <malloc>:

void*
malloc(uint nbytes)
{
 c62:	7139                	addi	sp,sp,-64
 c64:	fc06                	sd	ra,56(sp)
 c66:	f822                	sd	s0,48(sp)
 c68:	0080                	addi	s0,sp,64
 c6a:	87aa                	mv	a5,a0
 c6c:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c70:	fcc46783          	lwu	a5,-52(s0)
 c74:	07bd                	addi	a5,a5,15
 c76:	8391                	srli	a5,a5,0x4
 c78:	2781                	sext.w	a5,a5
 c7a:	2785                	addiw	a5,a5,1
 c7c:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 c80:	00000797          	auipc	a5,0x0
 c84:	18878793          	addi	a5,a5,392 # e08 <freep>
 c88:	639c                	ld	a5,0(a5)
 c8a:	fef43023          	sd	a5,-32(s0)
 c8e:	fe043783          	ld	a5,-32(s0)
 c92:	ef95                	bnez	a5,cce <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 c94:	00000797          	auipc	a5,0x0
 c98:	16478793          	addi	a5,a5,356 # df8 <base>
 c9c:	fef43023          	sd	a5,-32(s0)
 ca0:	00000797          	auipc	a5,0x0
 ca4:	16878793          	addi	a5,a5,360 # e08 <freep>
 ca8:	fe043703          	ld	a4,-32(s0)
 cac:	e398                	sd	a4,0(a5)
 cae:	00000797          	auipc	a5,0x0
 cb2:	15a78793          	addi	a5,a5,346 # e08 <freep>
 cb6:	6398                	ld	a4,0(a5)
 cb8:	00000797          	auipc	a5,0x0
 cbc:	14078793          	addi	a5,a5,320 # df8 <base>
 cc0:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 cc2:	00000797          	auipc	a5,0x0
 cc6:	13678793          	addi	a5,a5,310 # df8 <base>
 cca:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 cce:	fe043783          	ld	a5,-32(s0)
 cd2:	639c                	ld	a5,0(a5)
 cd4:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 cd8:	fe843783          	ld	a5,-24(s0)
 cdc:	4798                	lw	a4,8(a5)
 cde:	fdc42783          	lw	a5,-36(s0)
 ce2:	2781                	sext.w	a5,a5
 ce4:	06f76863          	bltu	a4,a5,d54 <malloc+0xf2>
      if(p->s.size == nunits)
 ce8:	fe843783          	ld	a5,-24(s0)
 cec:	4798                	lw	a4,8(a5)
 cee:	fdc42783          	lw	a5,-36(s0)
 cf2:	2781                	sext.w	a5,a5
 cf4:	00e79963          	bne	a5,a4,d06 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 cf8:	fe843783          	ld	a5,-24(s0)
 cfc:	6398                	ld	a4,0(a5)
 cfe:	fe043783          	ld	a5,-32(s0)
 d02:	e398                	sd	a4,0(a5)
 d04:	a82d                	j	d3e <malloc+0xdc>
      else {
        p->s.size -= nunits;
 d06:	fe843783          	ld	a5,-24(s0)
 d0a:	4798                	lw	a4,8(a5)
 d0c:	fdc42783          	lw	a5,-36(s0)
 d10:	40f707bb          	subw	a5,a4,a5
 d14:	0007871b          	sext.w	a4,a5
 d18:	fe843783          	ld	a5,-24(s0)
 d1c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 d1e:	fe843783          	ld	a5,-24(s0)
 d22:	479c                	lw	a5,8(a5)
 d24:	1782                	slli	a5,a5,0x20
 d26:	9381                	srli	a5,a5,0x20
 d28:	0792                	slli	a5,a5,0x4
 d2a:	fe843703          	ld	a4,-24(s0)
 d2e:	97ba                	add	a5,a5,a4
 d30:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 d34:	fe843783          	ld	a5,-24(s0)
 d38:	fdc42703          	lw	a4,-36(s0)
 d3c:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 d3e:	00000797          	auipc	a5,0x0
 d42:	0ca78793          	addi	a5,a5,202 # e08 <freep>
 d46:	fe043703          	ld	a4,-32(s0)
 d4a:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 d4c:	fe843783          	ld	a5,-24(s0)
 d50:	07c1                	addi	a5,a5,16
 d52:	a091                	j	d96 <malloc+0x134>
    }
    if(p == freep)
 d54:	00000797          	auipc	a5,0x0
 d58:	0b478793          	addi	a5,a5,180 # e08 <freep>
 d5c:	639c                	ld	a5,0(a5)
 d5e:	fe843703          	ld	a4,-24(s0)
 d62:	02f71063          	bne	a4,a5,d82 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
 d66:	fdc42783          	lw	a5,-36(s0)
 d6a:	853e                	mv	a0,a5
 d6c:	00000097          	auipc	ra,0x0
 d70:	e76080e7          	jalr	-394(ra) # be2 <morecore>
 d74:	fea43423          	sd	a0,-24(s0)
 d78:	fe843783          	ld	a5,-24(s0)
 d7c:	e399                	bnez	a5,d82 <malloc+0x120>
        return 0;
 d7e:	4781                	li	a5,0
 d80:	a819                	j	d96 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d82:	fe843783          	ld	a5,-24(s0)
 d86:	fef43023          	sd	a5,-32(s0)
 d8a:	fe843783          	ld	a5,-24(s0)
 d8e:	639c                	ld	a5,0(a5)
 d90:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 d94:	b791                	j	cd8 <malloc+0x76>
  }
}
 d96:	853e                	mv	a0,a5
 d98:	70e2                	ld	ra,56(sp)
 d9a:	7442                	ld	s0,48(sp)
 d9c:	6121                	addi	sp,sp,64
 d9e:	8082                	ret
