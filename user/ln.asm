
user/_ln:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	1000                	addi	s0,sp,32
   8:	87aa                	mv	a5,a0
   a:	feb43023          	sd	a1,-32(s0)
   e:	fef42623          	sw	a5,-20(s0)
  if(argc != 3){
  12:	fec42783          	lw	a5,-20(s0)
  16:	0007871b          	sext.w	a4,a5
  1a:	478d                	li	a5,3
  1c:	02f70063          	beq	a4,a5,3c <main+0x3c>
    fprintf(2, "Usage: ln old new\n");
  20:	00001597          	auipc	a1,0x1
  24:	d6858593          	addi	a1,a1,-664 # d88 <malloc+0x142>
  28:	4509                	li	a0,2
  2a:	00001097          	auipc	ra,0x1
  2e:	9d2080e7          	jalr	-1582(ra) # 9fc <fprintf>
    exit(1);
  32:	4505                	li	a0,1
  34:	00000097          	auipc	ra,0x0
  38:	4ea080e7          	jalr	1258(ra) # 51e <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  3c:	fe043783          	ld	a5,-32(s0)
  40:	07a1                	addi	a5,a5,8
  42:	6398                	ld	a4,0(a5)
  44:	fe043783          	ld	a5,-32(s0)
  48:	07c1                	addi	a5,a5,16
  4a:	639c                	ld	a5,0(a5)
  4c:	85be                	mv	a1,a5
  4e:	853a                	mv	a0,a4
  50:	00000097          	auipc	ra,0x0
  54:	52e080e7          	jalr	1326(ra) # 57e <link>
  58:	87aa                	mv	a5,a0
  5a:	0207d563          	bgez	a5,84 <main+0x84>
    fprintf(2, "link %s %s: failed\n", argv[1], argv[2]);
  5e:	fe043783          	ld	a5,-32(s0)
  62:	07a1                	addi	a5,a5,8
  64:	6398                	ld	a4,0(a5)
  66:	fe043783          	ld	a5,-32(s0)
  6a:	07c1                	addi	a5,a5,16
  6c:	639c                	ld	a5,0(a5)
  6e:	86be                	mv	a3,a5
  70:	863a                	mv	a2,a4
  72:	00001597          	auipc	a1,0x1
  76:	d2e58593          	addi	a1,a1,-722 # da0 <malloc+0x15a>
  7a:	4509                	li	a0,2
  7c:	00001097          	auipc	ra,0x1
  80:	980080e7          	jalr	-1664(ra) # 9fc <fprintf>
  exit(0);
  84:	4501                	li	a0,0
  86:	00000097          	auipc	ra,0x0
  8a:	498080e7          	jalr	1176(ra) # 51e <exit>

000000000000008e <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
  8e:	7179                	addi	sp,sp,-48
  90:	f422                	sd	s0,40(sp)
  92:	1800                	addi	s0,sp,48
  94:	fca43c23          	sd	a0,-40(s0)
  98:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
  9c:	fd843783          	ld	a5,-40(s0)
  a0:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
  a4:	0001                	nop
  a6:	fd043703          	ld	a4,-48(s0)
  aa:	00170793          	addi	a5,a4,1
  ae:	fcf43823          	sd	a5,-48(s0)
  b2:	fd843783          	ld	a5,-40(s0)
  b6:	00178693          	addi	a3,a5,1
  ba:	fcd43c23          	sd	a3,-40(s0)
  be:	00074703          	lbu	a4,0(a4)
  c2:	00e78023          	sb	a4,0(a5)
  c6:	0007c783          	lbu	a5,0(a5)
  ca:	fff1                	bnez	a5,a6 <strcpy+0x18>
    ;
  return os;
  cc:	fe843783          	ld	a5,-24(s0)
}
  d0:	853e                	mv	a0,a5
  d2:	7422                	ld	s0,40(sp)
  d4:	6145                	addi	sp,sp,48
  d6:	8082                	ret

00000000000000d8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d8:	1101                	addi	sp,sp,-32
  da:	ec22                	sd	s0,24(sp)
  dc:	1000                	addi	s0,sp,32
  de:	fea43423          	sd	a0,-24(s0)
  e2:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
  e6:	a819                	j	fc <strcmp+0x24>
    p++, q++;
  e8:	fe843783          	ld	a5,-24(s0)
  ec:	0785                	addi	a5,a5,1
  ee:	fef43423          	sd	a5,-24(s0)
  f2:	fe043783          	ld	a5,-32(s0)
  f6:	0785                	addi	a5,a5,1
  f8:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
  fc:	fe843783          	ld	a5,-24(s0)
 100:	0007c783          	lbu	a5,0(a5)
 104:	cb99                	beqz	a5,11a <strcmp+0x42>
 106:	fe843783          	ld	a5,-24(s0)
 10a:	0007c703          	lbu	a4,0(a5)
 10e:	fe043783          	ld	a5,-32(s0)
 112:	0007c783          	lbu	a5,0(a5)
 116:	fcf709e3          	beq	a4,a5,e8 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
 11a:	fe843783          	ld	a5,-24(s0)
 11e:	0007c783          	lbu	a5,0(a5)
 122:	0007871b          	sext.w	a4,a5
 126:	fe043783          	ld	a5,-32(s0)
 12a:	0007c783          	lbu	a5,0(a5)
 12e:	2781                	sext.w	a5,a5
 130:	40f707bb          	subw	a5,a4,a5
 134:	2781                	sext.w	a5,a5
}
 136:	853e                	mv	a0,a5
 138:	6462                	ld	s0,24(sp)
 13a:	6105                	addi	sp,sp,32
 13c:	8082                	ret

000000000000013e <strlen>:

uint
strlen(const char *s)
{
 13e:	7179                	addi	sp,sp,-48
 140:	f422                	sd	s0,40(sp)
 142:	1800                	addi	s0,sp,48
 144:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
 148:	fe042623          	sw	zero,-20(s0)
 14c:	a031                	j	158 <strlen+0x1a>
 14e:	fec42783          	lw	a5,-20(s0)
 152:	2785                	addiw	a5,a5,1
 154:	fef42623          	sw	a5,-20(s0)
 158:	fec42783          	lw	a5,-20(s0)
 15c:	fd843703          	ld	a4,-40(s0)
 160:	97ba                	add	a5,a5,a4
 162:	0007c783          	lbu	a5,0(a5)
 166:	f7e5                	bnez	a5,14e <strlen+0x10>
    ;
  return n;
 168:	fec42783          	lw	a5,-20(s0)
}
 16c:	853e                	mv	a0,a5
 16e:	7422                	ld	s0,40(sp)
 170:	6145                	addi	sp,sp,48
 172:	8082                	ret

0000000000000174 <memset>:

void*
memset(void *dst, int c, uint n)
{
 174:	7179                	addi	sp,sp,-48
 176:	f422                	sd	s0,40(sp)
 178:	1800                	addi	s0,sp,48
 17a:	fca43c23          	sd	a0,-40(s0)
 17e:	87ae                	mv	a5,a1
 180:	8732                	mv	a4,a2
 182:	fcf42a23          	sw	a5,-44(s0)
 186:	87ba                	mv	a5,a4
 188:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 18c:	fd843783          	ld	a5,-40(s0)
 190:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 194:	fe042623          	sw	zero,-20(s0)
 198:	a00d                	j	1ba <memset+0x46>
    cdst[i] = c;
 19a:	fec42783          	lw	a5,-20(s0)
 19e:	fe043703          	ld	a4,-32(s0)
 1a2:	97ba                	add	a5,a5,a4
 1a4:	fd442703          	lw	a4,-44(s0)
 1a8:	0ff77713          	andi	a4,a4,255
 1ac:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 1b0:	fec42783          	lw	a5,-20(s0)
 1b4:	2785                	addiw	a5,a5,1
 1b6:	fef42623          	sw	a5,-20(s0)
 1ba:	fec42703          	lw	a4,-20(s0)
 1be:	fd042783          	lw	a5,-48(s0)
 1c2:	2781                	sext.w	a5,a5
 1c4:	fcf76be3          	bltu	a4,a5,19a <memset+0x26>
  }
  return dst;
 1c8:	fd843783          	ld	a5,-40(s0)
}
 1cc:	853e                	mv	a0,a5
 1ce:	7422                	ld	s0,40(sp)
 1d0:	6145                	addi	sp,sp,48
 1d2:	8082                	ret

00000000000001d4 <strchr>:

char*
strchr(const char *s, char c)
{
 1d4:	1101                	addi	sp,sp,-32
 1d6:	ec22                	sd	s0,24(sp)
 1d8:	1000                	addi	s0,sp,32
 1da:	fea43423          	sd	a0,-24(s0)
 1de:	87ae                	mv	a5,a1
 1e0:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 1e4:	a01d                	j	20a <strchr+0x36>
    if(*s == c)
 1e6:	fe843783          	ld	a5,-24(s0)
 1ea:	0007c703          	lbu	a4,0(a5)
 1ee:	fe744783          	lbu	a5,-25(s0)
 1f2:	0ff7f793          	andi	a5,a5,255
 1f6:	00e79563          	bne	a5,a4,200 <strchr+0x2c>
      return (char*)s;
 1fa:	fe843783          	ld	a5,-24(s0)
 1fe:	a821                	j	216 <strchr+0x42>
  for(; *s; s++)
 200:	fe843783          	ld	a5,-24(s0)
 204:	0785                	addi	a5,a5,1
 206:	fef43423          	sd	a5,-24(s0)
 20a:	fe843783          	ld	a5,-24(s0)
 20e:	0007c783          	lbu	a5,0(a5)
 212:	fbf1                	bnez	a5,1e6 <strchr+0x12>
  return 0;
 214:	4781                	li	a5,0
}
 216:	853e                	mv	a0,a5
 218:	6462                	ld	s0,24(sp)
 21a:	6105                	addi	sp,sp,32
 21c:	8082                	ret

000000000000021e <gets>:

char*
gets(char *buf, int max)
{
 21e:	7179                	addi	sp,sp,-48
 220:	f406                	sd	ra,40(sp)
 222:	f022                	sd	s0,32(sp)
 224:	1800                	addi	s0,sp,48
 226:	fca43c23          	sd	a0,-40(s0)
 22a:	87ae                	mv	a5,a1
 22c:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 230:	fe042623          	sw	zero,-20(s0)
 234:	a8a1                	j	28c <gets+0x6e>
    cc = read(0, &c, 1);
 236:	fe740793          	addi	a5,s0,-25
 23a:	4605                	li	a2,1
 23c:	85be                	mv	a1,a5
 23e:	4501                	li	a0,0
 240:	00000097          	auipc	ra,0x0
 244:	2f6080e7          	jalr	758(ra) # 536 <read>
 248:	87aa                	mv	a5,a0
 24a:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 24e:	fe842783          	lw	a5,-24(s0)
 252:	2781                	sext.w	a5,a5
 254:	04f05763          	blez	a5,2a2 <gets+0x84>
      break;
    buf[i++] = c;
 258:	fec42783          	lw	a5,-20(s0)
 25c:	0017871b          	addiw	a4,a5,1
 260:	fee42623          	sw	a4,-20(s0)
 264:	873e                	mv	a4,a5
 266:	fd843783          	ld	a5,-40(s0)
 26a:	97ba                	add	a5,a5,a4
 26c:	fe744703          	lbu	a4,-25(s0)
 270:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 274:	fe744783          	lbu	a5,-25(s0)
 278:	873e                	mv	a4,a5
 27a:	47a9                	li	a5,10
 27c:	02f70463          	beq	a4,a5,2a4 <gets+0x86>
 280:	fe744783          	lbu	a5,-25(s0)
 284:	873e                	mv	a4,a5
 286:	47b5                	li	a5,13
 288:	00f70e63          	beq	a4,a5,2a4 <gets+0x86>
  for(i=0; i+1 < max; ){
 28c:	fec42783          	lw	a5,-20(s0)
 290:	2785                	addiw	a5,a5,1
 292:	0007871b          	sext.w	a4,a5
 296:	fd442783          	lw	a5,-44(s0)
 29a:	2781                	sext.w	a5,a5
 29c:	f8f74de3          	blt	a4,a5,236 <gets+0x18>
 2a0:	a011                	j	2a4 <gets+0x86>
      break;
 2a2:	0001                	nop
      break;
  }
  buf[i] = '\0';
 2a4:	fec42783          	lw	a5,-20(s0)
 2a8:	fd843703          	ld	a4,-40(s0)
 2ac:	97ba                	add	a5,a5,a4
 2ae:	00078023          	sb	zero,0(a5)
  return buf;
 2b2:	fd843783          	ld	a5,-40(s0)
}
 2b6:	853e                	mv	a0,a5
 2b8:	70a2                	ld	ra,40(sp)
 2ba:	7402                	ld	s0,32(sp)
 2bc:	6145                	addi	sp,sp,48
 2be:	8082                	ret

00000000000002c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c0:	7179                	addi	sp,sp,-48
 2c2:	f406                	sd	ra,40(sp)
 2c4:	f022                	sd	s0,32(sp)
 2c6:	1800                	addi	s0,sp,48
 2c8:	fca43c23          	sd	a0,-40(s0)
 2cc:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d0:	4581                	li	a1,0
 2d2:	fd843503          	ld	a0,-40(s0)
 2d6:	00000097          	auipc	ra,0x0
 2da:	288080e7          	jalr	648(ra) # 55e <open>
 2de:	87aa                	mv	a5,a0
 2e0:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 2e4:	fec42783          	lw	a5,-20(s0)
 2e8:	2781                	sext.w	a5,a5
 2ea:	0007d463          	bgez	a5,2f2 <stat+0x32>
    return -1;
 2ee:	57fd                	li	a5,-1
 2f0:	a035                	j	31c <stat+0x5c>
  r = fstat(fd, st);
 2f2:	fec42783          	lw	a5,-20(s0)
 2f6:	fd043583          	ld	a1,-48(s0)
 2fa:	853e                	mv	a0,a5
 2fc:	00000097          	auipc	ra,0x0
 300:	27a080e7          	jalr	634(ra) # 576 <fstat>
 304:	87aa                	mv	a5,a0
 306:	fef42423          	sw	a5,-24(s0)
  close(fd);
 30a:	fec42783          	lw	a5,-20(s0)
 30e:	853e                	mv	a0,a5
 310:	00000097          	auipc	ra,0x0
 314:	236080e7          	jalr	566(ra) # 546 <close>
  return r;
 318:	fe842783          	lw	a5,-24(s0)
}
 31c:	853e                	mv	a0,a5
 31e:	70a2                	ld	ra,40(sp)
 320:	7402                	ld	s0,32(sp)
 322:	6145                	addi	sp,sp,48
 324:	8082                	ret

0000000000000326 <atoi>:

int
atoi(const char *s)
{
 326:	7179                	addi	sp,sp,-48
 328:	f422                	sd	s0,40(sp)
 32a:	1800                	addi	s0,sp,48
 32c:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 330:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 334:	a815                	j	368 <atoi+0x42>
    n = n*10 + *s++ - '0';
 336:	fec42703          	lw	a4,-20(s0)
 33a:	87ba                	mv	a5,a4
 33c:	0027979b          	slliw	a5,a5,0x2
 340:	9fb9                	addw	a5,a5,a4
 342:	0017979b          	slliw	a5,a5,0x1
 346:	0007871b          	sext.w	a4,a5
 34a:	fd843783          	ld	a5,-40(s0)
 34e:	00178693          	addi	a3,a5,1
 352:	fcd43c23          	sd	a3,-40(s0)
 356:	0007c783          	lbu	a5,0(a5)
 35a:	2781                	sext.w	a5,a5
 35c:	9fb9                	addw	a5,a5,a4
 35e:	2781                	sext.w	a5,a5
 360:	fd07879b          	addiw	a5,a5,-48
 364:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 368:	fd843783          	ld	a5,-40(s0)
 36c:	0007c783          	lbu	a5,0(a5)
 370:	873e                	mv	a4,a5
 372:	02f00793          	li	a5,47
 376:	00e7fb63          	bgeu	a5,a4,38c <atoi+0x66>
 37a:	fd843783          	ld	a5,-40(s0)
 37e:	0007c783          	lbu	a5,0(a5)
 382:	873e                	mv	a4,a5
 384:	03900793          	li	a5,57
 388:	fae7f7e3          	bgeu	a5,a4,336 <atoi+0x10>
  return n;
 38c:	fec42783          	lw	a5,-20(s0)
}
 390:	853e                	mv	a0,a5
 392:	7422                	ld	s0,40(sp)
 394:	6145                	addi	sp,sp,48
 396:	8082                	ret

0000000000000398 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 398:	7139                	addi	sp,sp,-64
 39a:	fc22                	sd	s0,56(sp)
 39c:	0080                	addi	s0,sp,64
 39e:	fca43c23          	sd	a0,-40(s0)
 3a2:	fcb43823          	sd	a1,-48(s0)
 3a6:	87b2                	mv	a5,a2
 3a8:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 3ac:	fd843783          	ld	a5,-40(s0)
 3b0:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 3b4:	fd043783          	ld	a5,-48(s0)
 3b8:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 3bc:	fe043703          	ld	a4,-32(s0)
 3c0:	fe843783          	ld	a5,-24(s0)
 3c4:	02e7fc63          	bgeu	a5,a4,3fc <memmove+0x64>
    while(n-- > 0)
 3c8:	a00d                	j	3ea <memmove+0x52>
      *dst++ = *src++;
 3ca:	fe043703          	ld	a4,-32(s0)
 3ce:	00170793          	addi	a5,a4,1
 3d2:	fef43023          	sd	a5,-32(s0)
 3d6:	fe843783          	ld	a5,-24(s0)
 3da:	00178693          	addi	a3,a5,1
 3de:	fed43423          	sd	a3,-24(s0)
 3e2:	00074703          	lbu	a4,0(a4)
 3e6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 3ea:	fcc42783          	lw	a5,-52(s0)
 3ee:	fff7871b          	addiw	a4,a5,-1
 3f2:	fce42623          	sw	a4,-52(s0)
 3f6:	fcf04ae3          	bgtz	a5,3ca <memmove+0x32>
 3fa:	a891                	j	44e <memmove+0xb6>
  } else {
    dst += n;
 3fc:	fcc42783          	lw	a5,-52(s0)
 400:	fe843703          	ld	a4,-24(s0)
 404:	97ba                	add	a5,a5,a4
 406:	fef43423          	sd	a5,-24(s0)
    src += n;
 40a:	fcc42783          	lw	a5,-52(s0)
 40e:	fe043703          	ld	a4,-32(s0)
 412:	97ba                	add	a5,a5,a4
 414:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 418:	a01d                	j	43e <memmove+0xa6>
      *--dst = *--src;
 41a:	fe043783          	ld	a5,-32(s0)
 41e:	17fd                	addi	a5,a5,-1
 420:	fef43023          	sd	a5,-32(s0)
 424:	fe843783          	ld	a5,-24(s0)
 428:	17fd                	addi	a5,a5,-1
 42a:	fef43423          	sd	a5,-24(s0)
 42e:	fe043783          	ld	a5,-32(s0)
 432:	0007c703          	lbu	a4,0(a5)
 436:	fe843783          	ld	a5,-24(s0)
 43a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 43e:	fcc42783          	lw	a5,-52(s0)
 442:	fff7871b          	addiw	a4,a5,-1
 446:	fce42623          	sw	a4,-52(s0)
 44a:	fcf048e3          	bgtz	a5,41a <memmove+0x82>
  }
  return vdst;
 44e:	fd843783          	ld	a5,-40(s0)
}
 452:	853e                	mv	a0,a5
 454:	7462                	ld	s0,56(sp)
 456:	6121                	addi	sp,sp,64
 458:	8082                	ret

000000000000045a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 45a:	7139                	addi	sp,sp,-64
 45c:	fc22                	sd	s0,56(sp)
 45e:	0080                	addi	s0,sp,64
 460:	fca43c23          	sd	a0,-40(s0)
 464:	fcb43823          	sd	a1,-48(s0)
 468:	87b2                	mv	a5,a2
 46a:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 46e:	fd843783          	ld	a5,-40(s0)
 472:	fef43423          	sd	a5,-24(s0)
 476:	fd043783          	ld	a5,-48(s0)
 47a:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 47e:	a0a1                	j	4c6 <memcmp+0x6c>
    if (*p1 != *p2) {
 480:	fe843783          	ld	a5,-24(s0)
 484:	0007c703          	lbu	a4,0(a5)
 488:	fe043783          	ld	a5,-32(s0)
 48c:	0007c783          	lbu	a5,0(a5)
 490:	02f70163          	beq	a4,a5,4b2 <memcmp+0x58>
      return *p1 - *p2;
 494:	fe843783          	ld	a5,-24(s0)
 498:	0007c783          	lbu	a5,0(a5)
 49c:	0007871b          	sext.w	a4,a5
 4a0:	fe043783          	ld	a5,-32(s0)
 4a4:	0007c783          	lbu	a5,0(a5)
 4a8:	2781                	sext.w	a5,a5
 4aa:	40f707bb          	subw	a5,a4,a5
 4ae:	2781                	sext.w	a5,a5
 4b0:	a01d                	j	4d6 <memcmp+0x7c>
    }
    p1++;
 4b2:	fe843783          	ld	a5,-24(s0)
 4b6:	0785                	addi	a5,a5,1
 4b8:	fef43423          	sd	a5,-24(s0)
    p2++;
 4bc:	fe043783          	ld	a5,-32(s0)
 4c0:	0785                	addi	a5,a5,1
 4c2:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 4c6:	fcc42783          	lw	a5,-52(s0)
 4ca:	fff7871b          	addiw	a4,a5,-1
 4ce:	fce42623          	sw	a4,-52(s0)
 4d2:	f7dd                	bnez	a5,480 <memcmp+0x26>
  }
  return 0;
 4d4:	4781                	li	a5,0
}
 4d6:	853e                	mv	a0,a5
 4d8:	7462                	ld	s0,56(sp)
 4da:	6121                	addi	sp,sp,64
 4dc:	8082                	ret

00000000000004de <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4de:	7179                	addi	sp,sp,-48
 4e0:	f406                	sd	ra,40(sp)
 4e2:	f022                	sd	s0,32(sp)
 4e4:	1800                	addi	s0,sp,48
 4e6:	fea43423          	sd	a0,-24(s0)
 4ea:	feb43023          	sd	a1,-32(s0)
 4ee:	87b2                	mv	a5,a2
 4f0:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 4f4:	fdc42783          	lw	a5,-36(s0)
 4f8:	863e                	mv	a2,a5
 4fa:	fe043583          	ld	a1,-32(s0)
 4fe:	fe843503          	ld	a0,-24(s0)
 502:	00000097          	auipc	ra,0x0
 506:	e96080e7          	jalr	-362(ra) # 398 <memmove>
 50a:	87aa                	mv	a5,a0
}
 50c:	853e                	mv	a0,a5
 50e:	70a2                	ld	ra,40(sp)
 510:	7402                	ld	s0,32(sp)
 512:	6145                	addi	sp,sp,48
 514:	8082                	ret

0000000000000516 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 516:	4885                	li	a7,1
 ecall
 518:	00000073          	ecall
 ret
 51c:	8082                	ret

000000000000051e <exit>:
.global exit
exit:
 li a7, SYS_exit
 51e:	4889                	li	a7,2
 ecall
 520:	00000073          	ecall
 ret
 524:	8082                	ret

0000000000000526 <wait>:
.global wait
wait:
 li a7, SYS_wait
 526:	488d                	li	a7,3
 ecall
 528:	00000073          	ecall
 ret
 52c:	8082                	ret

000000000000052e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 52e:	4891                	li	a7,4
 ecall
 530:	00000073          	ecall
 ret
 534:	8082                	ret

0000000000000536 <read>:
.global read
read:
 li a7, SYS_read
 536:	4895                	li	a7,5
 ecall
 538:	00000073          	ecall
 ret
 53c:	8082                	ret

000000000000053e <write>:
.global write
write:
 li a7, SYS_write
 53e:	48c1                	li	a7,16
 ecall
 540:	00000073          	ecall
 ret
 544:	8082                	ret

0000000000000546 <close>:
.global close
close:
 li a7, SYS_close
 546:	48d5                	li	a7,21
 ecall
 548:	00000073          	ecall
 ret
 54c:	8082                	ret

000000000000054e <kill>:
.global kill
kill:
 li a7, SYS_kill
 54e:	4899                	li	a7,6
 ecall
 550:	00000073          	ecall
 ret
 554:	8082                	ret

0000000000000556 <exec>:
.global exec
exec:
 li a7, SYS_exec
 556:	489d                	li	a7,7
 ecall
 558:	00000073          	ecall
 ret
 55c:	8082                	ret

000000000000055e <open>:
.global open
open:
 li a7, SYS_open
 55e:	48bd                	li	a7,15
 ecall
 560:	00000073          	ecall
 ret
 564:	8082                	ret

0000000000000566 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 566:	48c5                	li	a7,17
 ecall
 568:	00000073          	ecall
 ret
 56c:	8082                	ret

000000000000056e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 56e:	48c9                	li	a7,18
 ecall
 570:	00000073          	ecall
 ret
 574:	8082                	ret

0000000000000576 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 576:	48a1                	li	a7,8
 ecall
 578:	00000073          	ecall
 ret
 57c:	8082                	ret

000000000000057e <link>:
.global link
link:
 li a7, SYS_link
 57e:	48cd                	li	a7,19
 ecall
 580:	00000073          	ecall
 ret
 584:	8082                	ret

0000000000000586 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 586:	48d1                	li	a7,20
 ecall
 588:	00000073          	ecall
 ret
 58c:	8082                	ret

000000000000058e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 58e:	48a5                	li	a7,9
 ecall
 590:	00000073          	ecall
 ret
 594:	8082                	ret

0000000000000596 <dup>:
.global dup
dup:
 li a7, SYS_dup
 596:	48a9                	li	a7,10
 ecall
 598:	00000073          	ecall
 ret
 59c:	8082                	ret

000000000000059e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 59e:	48ad                	li	a7,11
 ecall
 5a0:	00000073          	ecall
 ret
 5a4:	8082                	ret

00000000000005a6 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 5a6:	48b1                	li	a7,12
 ecall
 5a8:	00000073          	ecall
 ret
 5ac:	8082                	ret

00000000000005ae <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 5ae:	48b5                	li	a7,13
 ecall
 5b0:	00000073          	ecall
 ret
 5b4:	8082                	ret

00000000000005b6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 5b6:	48b9                	li	a7,14
 ecall
 5b8:	00000073          	ecall
 ret
 5bc:	8082                	ret

00000000000005be <setSchedAlg>:
.global setSchedAlg
setSchedAlg:
 li a7, SYS_setSchedAlg
 5be:	48d9                	li	a7,22
 ecall
 5c0:	00000073          	ecall
 ret
 5c4:	8082                	ret

00000000000005c6 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 5c6:	1101                	addi	sp,sp,-32
 5c8:	ec06                	sd	ra,24(sp)
 5ca:	e822                	sd	s0,16(sp)
 5cc:	1000                	addi	s0,sp,32
 5ce:	87aa                	mv	a5,a0
 5d0:	872e                	mv	a4,a1
 5d2:	fef42623          	sw	a5,-20(s0)
 5d6:	87ba                	mv	a5,a4
 5d8:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 5dc:	feb40713          	addi	a4,s0,-21
 5e0:	fec42783          	lw	a5,-20(s0)
 5e4:	4605                	li	a2,1
 5e6:	85ba                	mv	a1,a4
 5e8:	853e                	mv	a0,a5
 5ea:	00000097          	auipc	ra,0x0
 5ee:	f54080e7          	jalr	-172(ra) # 53e <write>
}
 5f2:	0001                	nop
 5f4:	60e2                	ld	ra,24(sp)
 5f6:	6442                	ld	s0,16(sp)
 5f8:	6105                	addi	sp,sp,32
 5fa:	8082                	ret

00000000000005fc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5fc:	7139                	addi	sp,sp,-64
 5fe:	fc06                	sd	ra,56(sp)
 600:	f822                	sd	s0,48(sp)
 602:	0080                	addi	s0,sp,64
 604:	87aa                	mv	a5,a0
 606:	8736                	mv	a4,a3
 608:	fcf42623          	sw	a5,-52(s0)
 60c:	87ae                	mv	a5,a1
 60e:	fcf42423          	sw	a5,-56(s0)
 612:	87b2                	mv	a5,a2
 614:	fcf42223          	sw	a5,-60(s0)
 618:	87ba                	mv	a5,a4
 61a:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 61e:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 622:	fc042783          	lw	a5,-64(s0)
 626:	2781                	sext.w	a5,a5
 628:	c38d                	beqz	a5,64a <printint+0x4e>
 62a:	fc842783          	lw	a5,-56(s0)
 62e:	2781                	sext.w	a5,a5
 630:	0007dd63          	bgez	a5,64a <printint+0x4e>
    neg = 1;
 634:	4785                	li	a5,1
 636:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 63a:	fc842783          	lw	a5,-56(s0)
 63e:	40f007bb          	negw	a5,a5
 642:	2781                	sext.w	a5,a5
 644:	fef42223          	sw	a5,-28(s0)
 648:	a029                	j	652 <printint+0x56>
  } else {
    x = xx;
 64a:	fc842783          	lw	a5,-56(s0)
 64e:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 652:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 656:	fc442783          	lw	a5,-60(s0)
 65a:	fe442703          	lw	a4,-28(s0)
 65e:	02f777bb          	remuw	a5,a4,a5
 662:	0007861b          	sext.w	a2,a5
 666:	fec42783          	lw	a5,-20(s0)
 66a:	0017871b          	addiw	a4,a5,1
 66e:	fee42623          	sw	a4,-20(s0)
 672:	00000697          	auipc	a3,0x0
 676:	74e68693          	addi	a3,a3,1870 # dc0 <digits>
 67a:	02061713          	slli	a4,a2,0x20
 67e:	9301                	srli	a4,a4,0x20
 680:	9736                	add	a4,a4,a3
 682:	00074703          	lbu	a4,0(a4)
 686:	ff040693          	addi	a3,s0,-16
 68a:	97b6                	add	a5,a5,a3
 68c:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 690:	fc442783          	lw	a5,-60(s0)
 694:	fe442703          	lw	a4,-28(s0)
 698:	02f757bb          	divuw	a5,a4,a5
 69c:	fef42223          	sw	a5,-28(s0)
 6a0:	fe442783          	lw	a5,-28(s0)
 6a4:	2781                	sext.w	a5,a5
 6a6:	fbc5                	bnez	a5,656 <printint+0x5a>
  if(neg)
 6a8:	fe842783          	lw	a5,-24(s0)
 6ac:	2781                	sext.w	a5,a5
 6ae:	cf95                	beqz	a5,6ea <printint+0xee>
    buf[i++] = '-';
 6b0:	fec42783          	lw	a5,-20(s0)
 6b4:	0017871b          	addiw	a4,a5,1
 6b8:	fee42623          	sw	a4,-20(s0)
 6bc:	ff040713          	addi	a4,s0,-16
 6c0:	97ba                	add	a5,a5,a4
 6c2:	02d00713          	li	a4,45
 6c6:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 6ca:	a005                	j	6ea <printint+0xee>
    putc(fd, buf[i]);
 6cc:	fec42783          	lw	a5,-20(s0)
 6d0:	ff040713          	addi	a4,s0,-16
 6d4:	97ba                	add	a5,a5,a4
 6d6:	fe07c703          	lbu	a4,-32(a5)
 6da:	fcc42783          	lw	a5,-52(s0)
 6de:	85ba                	mv	a1,a4
 6e0:	853e                	mv	a0,a5
 6e2:	00000097          	auipc	ra,0x0
 6e6:	ee4080e7          	jalr	-284(ra) # 5c6 <putc>
  while(--i >= 0)
 6ea:	fec42783          	lw	a5,-20(s0)
 6ee:	37fd                	addiw	a5,a5,-1
 6f0:	fef42623          	sw	a5,-20(s0)
 6f4:	fec42783          	lw	a5,-20(s0)
 6f8:	2781                	sext.w	a5,a5
 6fa:	fc07d9e3          	bgez	a5,6cc <printint+0xd0>
}
 6fe:	0001                	nop
 700:	0001                	nop
 702:	70e2                	ld	ra,56(sp)
 704:	7442                	ld	s0,48(sp)
 706:	6121                	addi	sp,sp,64
 708:	8082                	ret

000000000000070a <printptr>:

static void
printptr(int fd, uint64 x) {
 70a:	7179                	addi	sp,sp,-48
 70c:	f406                	sd	ra,40(sp)
 70e:	f022                	sd	s0,32(sp)
 710:	1800                	addi	s0,sp,48
 712:	87aa                	mv	a5,a0
 714:	fcb43823          	sd	a1,-48(s0)
 718:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 71c:	fdc42783          	lw	a5,-36(s0)
 720:	03000593          	li	a1,48
 724:	853e                	mv	a0,a5
 726:	00000097          	auipc	ra,0x0
 72a:	ea0080e7          	jalr	-352(ra) # 5c6 <putc>
  putc(fd, 'x');
 72e:	fdc42783          	lw	a5,-36(s0)
 732:	07800593          	li	a1,120
 736:	853e                	mv	a0,a5
 738:	00000097          	auipc	ra,0x0
 73c:	e8e080e7          	jalr	-370(ra) # 5c6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 740:	fe042623          	sw	zero,-20(s0)
 744:	a82d                	j	77e <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 746:	fd043783          	ld	a5,-48(s0)
 74a:	93f1                	srli	a5,a5,0x3c
 74c:	00000717          	auipc	a4,0x0
 750:	67470713          	addi	a4,a4,1652 # dc0 <digits>
 754:	97ba                	add	a5,a5,a4
 756:	0007c703          	lbu	a4,0(a5)
 75a:	fdc42783          	lw	a5,-36(s0)
 75e:	85ba                	mv	a1,a4
 760:	853e                	mv	a0,a5
 762:	00000097          	auipc	ra,0x0
 766:	e64080e7          	jalr	-412(ra) # 5c6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 76a:	fec42783          	lw	a5,-20(s0)
 76e:	2785                	addiw	a5,a5,1
 770:	fef42623          	sw	a5,-20(s0)
 774:	fd043783          	ld	a5,-48(s0)
 778:	0792                	slli	a5,a5,0x4
 77a:	fcf43823          	sd	a5,-48(s0)
 77e:	fec42783          	lw	a5,-20(s0)
 782:	873e                	mv	a4,a5
 784:	47bd                	li	a5,15
 786:	fce7f0e3          	bgeu	a5,a4,746 <printptr+0x3c>
}
 78a:	0001                	nop
 78c:	0001                	nop
 78e:	70a2                	ld	ra,40(sp)
 790:	7402                	ld	s0,32(sp)
 792:	6145                	addi	sp,sp,48
 794:	8082                	ret

0000000000000796 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 796:	715d                	addi	sp,sp,-80
 798:	e486                	sd	ra,72(sp)
 79a:	e0a2                	sd	s0,64(sp)
 79c:	0880                	addi	s0,sp,80
 79e:	87aa                	mv	a5,a0
 7a0:	fcb43023          	sd	a1,-64(s0)
 7a4:	fac43c23          	sd	a2,-72(s0)
 7a8:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 7ac:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 7b0:	fe042223          	sw	zero,-28(s0)
 7b4:	a42d                	j	9de <vprintf+0x248>
    c = fmt[i] & 0xff;
 7b6:	fe442783          	lw	a5,-28(s0)
 7ba:	fc043703          	ld	a4,-64(s0)
 7be:	97ba                	add	a5,a5,a4
 7c0:	0007c783          	lbu	a5,0(a5)
 7c4:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 7c8:	fe042783          	lw	a5,-32(s0)
 7cc:	2781                	sext.w	a5,a5
 7ce:	eb9d                	bnez	a5,804 <vprintf+0x6e>
      if(c == '%'){
 7d0:	fdc42783          	lw	a5,-36(s0)
 7d4:	0007871b          	sext.w	a4,a5
 7d8:	02500793          	li	a5,37
 7dc:	00f71763          	bne	a4,a5,7ea <vprintf+0x54>
        state = '%';
 7e0:	02500793          	li	a5,37
 7e4:	fef42023          	sw	a5,-32(s0)
 7e8:	a2f5                	j	9d4 <vprintf+0x23e>
      } else {
        putc(fd, c);
 7ea:	fdc42783          	lw	a5,-36(s0)
 7ee:	0ff7f713          	andi	a4,a5,255
 7f2:	fcc42783          	lw	a5,-52(s0)
 7f6:	85ba                	mv	a1,a4
 7f8:	853e                	mv	a0,a5
 7fa:	00000097          	auipc	ra,0x0
 7fe:	dcc080e7          	jalr	-564(ra) # 5c6 <putc>
 802:	aac9                	j	9d4 <vprintf+0x23e>
      }
    } else if(state == '%'){
 804:	fe042783          	lw	a5,-32(s0)
 808:	0007871b          	sext.w	a4,a5
 80c:	02500793          	li	a5,37
 810:	1cf71263          	bne	a4,a5,9d4 <vprintf+0x23e>
      if(c == 'd'){
 814:	fdc42783          	lw	a5,-36(s0)
 818:	0007871b          	sext.w	a4,a5
 81c:	06400793          	li	a5,100
 820:	02f71463          	bne	a4,a5,848 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 824:	fb843783          	ld	a5,-72(s0)
 828:	00878713          	addi	a4,a5,8
 82c:	fae43c23          	sd	a4,-72(s0)
 830:	4398                	lw	a4,0(a5)
 832:	fcc42783          	lw	a5,-52(s0)
 836:	4685                	li	a3,1
 838:	4629                	li	a2,10
 83a:	85ba                	mv	a1,a4
 83c:	853e                	mv	a0,a5
 83e:	00000097          	auipc	ra,0x0
 842:	dbe080e7          	jalr	-578(ra) # 5fc <printint>
 846:	a269                	j	9d0 <vprintf+0x23a>
      } else if(c == 'l') {
 848:	fdc42783          	lw	a5,-36(s0)
 84c:	0007871b          	sext.w	a4,a5
 850:	06c00793          	li	a5,108
 854:	02f71663          	bne	a4,a5,880 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 858:	fb843783          	ld	a5,-72(s0)
 85c:	00878713          	addi	a4,a5,8
 860:	fae43c23          	sd	a4,-72(s0)
 864:	639c                	ld	a5,0(a5)
 866:	0007871b          	sext.w	a4,a5
 86a:	fcc42783          	lw	a5,-52(s0)
 86e:	4681                	li	a3,0
 870:	4629                	li	a2,10
 872:	85ba                	mv	a1,a4
 874:	853e                	mv	a0,a5
 876:	00000097          	auipc	ra,0x0
 87a:	d86080e7          	jalr	-634(ra) # 5fc <printint>
 87e:	aa89                	j	9d0 <vprintf+0x23a>
      } else if(c == 'x') {
 880:	fdc42783          	lw	a5,-36(s0)
 884:	0007871b          	sext.w	a4,a5
 888:	07800793          	li	a5,120
 88c:	02f71463          	bne	a4,a5,8b4 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 890:	fb843783          	ld	a5,-72(s0)
 894:	00878713          	addi	a4,a5,8
 898:	fae43c23          	sd	a4,-72(s0)
 89c:	4398                	lw	a4,0(a5)
 89e:	fcc42783          	lw	a5,-52(s0)
 8a2:	4681                	li	a3,0
 8a4:	4641                	li	a2,16
 8a6:	85ba                	mv	a1,a4
 8a8:	853e                	mv	a0,a5
 8aa:	00000097          	auipc	ra,0x0
 8ae:	d52080e7          	jalr	-686(ra) # 5fc <printint>
 8b2:	aa39                	j	9d0 <vprintf+0x23a>
      } else if(c == 'p') {
 8b4:	fdc42783          	lw	a5,-36(s0)
 8b8:	0007871b          	sext.w	a4,a5
 8bc:	07000793          	li	a5,112
 8c0:	02f71263          	bne	a4,a5,8e4 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 8c4:	fb843783          	ld	a5,-72(s0)
 8c8:	00878713          	addi	a4,a5,8
 8cc:	fae43c23          	sd	a4,-72(s0)
 8d0:	6398                	ld	a4,0(a5)
 8d2:	fcc42783          	lw	a5,-52(s0)
 8d6:	85ba                	mv	a1,a4
 8d8:	853e                	mv	a0,a5
 8da:	00000097          	auipc	ra,0x0
 8de:	e30080e7          	jalr	-464(ra) # 70a <printptr>
 8e2:	a0fd                	j	9d0 <vprintf+0x23a>
      } else if(c == 's'){
 8e4:	fdc42783          	lw	a5,-36(s0)
 8e8:	0007871b          	sext.w	a4,a5
 8ec:	07300793          	li	a5,115
 8f0:	04f71c63          	bne	a4,a5,948 <vprintf+0x1b2>
        s = va_arg(ap, char*);
 8f4:	fb843783          	ld	a5,-72(s0)
 8f8:	00878713          	addi	a4,a5,8
 8fc:	fae43c23          	sd	a4,-72(s0)
 900:	639c                	ld	a5,0(a5)
 902:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 906:	fe843783          	ld	a5,-24(s0)
 90a:	eb8d                	bnez	a5,93c <vprintf+0x1a6>
          s = "(null)";
 90c:	00000797          	auipc	a5,0x0
 910:	4ac78793          	addi	a5,a5,1196 # db8 <malloc+0x172>
 914:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 918:	a015                	j	93c <vprintf+0x1a6>
          putc(fd, *s);
 91a:	fe843783          	ld	a5,-24(s0)
 91e:	0007c703          	lbu	a4,0(a5)
 922:	fcc42783          	lw	a5,-52(s0)
 926:	85ba                	mv	a1,a4
 928:	853e                	mv	a0,a5
 92a:	00000097          	auipc	ra,0x0
 92e:	c9c080e7          	jalr	-868(ra) # 5c6 <putc>
          s++;
 932:	fe843783          	ld	a5,-24(s0)
 936:	0785                	addi	a5,a5,1
 938:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 93c:	fe843783          	ld	a5,-24(s0)
 940:	0007c783          	lbu	a5,0(a5)
 944:	fbf9                	bnez	a5,91a <vprintf+0x184>
 946:	a069                	j	9d0 <vprintf+0x23a>
        }
      } else if(c == 'c'){
 948:	fdc42783          	lw	a5,-36(s0)
 94c:	0007871b          	sext.w	a4,a5
 950:	06300793          	li	a5,99
 954:	02f71463          	bne	a4,a5,97c <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 958:	fb843783          	ld	a5,-72(s0)
 95c:	00878713          	addi	a4,a5,8
 960:	fae43c23          	sd	a4,-72(s0)
 964:	439c                	lw	a5,0(a5)
 966:	0ff7f713          	andi	a4,a5,255
 96a:	fcc42783          	lw	a5,-52(s0)
 96e:	85ba                	mv	a1,a4
 970:	853e                	mv	a0,a5
 972:	00000097          	auipc	ra,0x0
 976:	c54080e7          	jalr	-940(ra) # 5c6 <putc>
 97a:	a899                	j	9d0 <vprintf+0x23a>
      } else if(c == '%'){
 97c:	fdc42783          	lw	a5,-36(s0)
 980:	0007871b          	sext.w	a4,a5
 984:	02500793          	li	a5,37
 988:	00f71f63          	bne	a4,a5,9a6 <vprintf+0x210>
        putc(fd, c);
 98c:	fdc42783          	lw	a5,-36(s0)
 990:	0ff7f713          	andi	a4,a5,255
 994:	fcc42783          	lw	a5,-52(s0)
 998:	85ba                	mv	a1,a4
 99a:	853e                	mv	a0,a5
 99c:	00000097          	auipc	ra,0x0
 9a0:	c2a080e7          	jalr	-982(ra) # 5c6 <putc>
 9a4:	a035                	j	9d0 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9a6:	fcc42783          	lw	a5,-52(s0)
 9aa:	02500593          	li	a1,37
 9ae:	853e                	mv	a0,a5
 9b0:	00000097          	auipc	ra,0x0
 9b4:	c16080e7          	jalr	-1002(ra) # 5c6 <putc>
        putc(fd, c);
 9b8:	fdc42783          	lw	a5,-36(s0)
 9bc:	0ff7f713          	andi	a4,a5,255
 9c0:	fcc42783          	lw	a5,-52(s0)
 9c4:	85ba                	mv	a1,a4
 9c6:	853e                	mv	a0,a5
 9c8:	00000097          	auipc	ra,0x0
 9cc:	bfe080e7          	jalr	-1026(ra) # 5c6 <putc>
      }
      state = 0;
 9d0:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 9d4:	fe442783          	lw	a5,-28(s0)
 9d8:	2785                	addiw	a5,a5,1
 9da:	fef42223          	sw	a5,-28(s0)
 9de:	fe442783          	lw	a5,-28(s0)
 9e2:	fc043703          	ld	a4,-64(s0)
 9e6:	97ba                	add	a5,a5,a4
 9e8:	0007c783          	lbu	a5,0(a5)
 9ec:	dc0795e3          	bnez	a5,7b6 <vprintf+0x20>
    }
  }
}
 9f0:	0001                	nop
 9f2:	0001                	nop
 9f4:	60a6                	ld	ra,72(sp)
 9f6:	6406                	ld	s0,64(sp)
 9f8:	6161                	addi	sp,sp,80
 9fa:	8082                	ret

00000000000009fc <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 9fc:	7159                	addi	sp,sp,-112
 9fe:	fc06                	sd	ra,56(sp)
 a00:	f822                	sd	s0,48(sp)
 a02:	0080                	addi	s0,sp,64
 a04:	fcb43823          	sd	a1,-48(s0)
 a08:	e010                	sd	a2,0(s0)
 a0a:	e414                	sd	a3,8(s0)
 a0c:	e818                	sd	a4,16(s0)
 a0e:	ec1c                	sd	a5,24(s0)
 a10:	03043023          	sd	a6,32(s0)
 a14:	03143423          	sd	a7,40(s0)
 a18:	87aa                	mv	a5,a0
 a1a:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 a1e:	03040793          	addi	a5,s0,48
 a22:	fcf43423          	sd	a5,-56(s0)
 a26:	fc843783          	ld	a5,-56(s0)
 a2a:	fd078793          	addi	a5,a5,-48
 a2e:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 a32:	fe843703          	ld	a4,-24(s0)
 a36:	fdc42783          	lw	a5,-36(s0)
 a3a:	863a                	mv	a2,a4
 a3c:	fd043583          	ld	a1,-48(s0)
 a40:	853e                	mv	a0,a5
 a42:	00000097          	auipc	ra,0x0
 a46:	d54080e7          	jalr	-684(ra) # 796 <vprintf>
}
 a4a:	0001                	nop
 a4c:	70e2                	ld	ra,56(sp)
 a4e:	7442                	ld	s0,48(sp)
 a50:	6165                	addi	sp,sp,112
 a52:	8082                	ret

0000000000000a54 <printf>:

void
printf(const char *fmt, ...)
{
 a54:	7159                	addi	sp,sp,-112
 a56:	f406                	sd	ra,40(sp)
 a58:	f022                	sd	s0,32(sp)
 a5a:	1800                	addi	s0,sp,48
 a5c:	fca43c23          	sd	a0,-40(s0)
 a60:	e40c                	sd	a1,8(s0)
 a62:	e810                	sd	a2,16(s0)
 a64:	ec14                	sd	a3,24(s0)
 a66:	f018                	sd	a4,32(s0)
 a68:	f41c                	sd	a5,40(s0)
 a6a:	03043823          	sd	a6,48(s0)
 a6e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 a72:	04040793          	addi	a5,s0,64
 a76:	fcf43823          	sd	a5,-48(s0)
 a7a:	fd043783          	ld	a5,-48(s0)
 a7e:	fc878793          	addi	a5,a5,-56
 a82:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 a86:	fe843783          	ld	a5,-24(s0)
 a8a:	863e                	mv	a2,a5
 a8c:	fd843583          	ld	a1,-40(s0)
 a90:	4505                	li	a0,1
 a92:	00000097          	auipc	ra,0x0
 a96:	d04080e7          	jalr	-764(ra) # 796 <vprintf>
}
 a9a:	0001                	nop
 a9c:	70a2                	ld	ra,40(sp)
 a9e:	7402                	ld	s0,32(sp)
 aa0:	6165                	addi	sp,sp,112
 aa2:	8082                	ret

0000000000000aa4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 aa4:	7179                	addi	sp,sp,-48
 aa6:	f422                	sd	s0,40(sp)
 aa8:	1800                	addi	s0,sp,48
 aaa:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 aae:	fd843783          	ld	a5,-40(s0)
 ab2:	17c1                	addi	a5,a5,-16
 ab4:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab8:	00000797          	auipc	a5,0x0
 abc:	33078793          	addi	a5,a5,816 # de8 <freep>
 ac0:	639c                	ld	a5,0(a5)
 ac2:	fef43423          	sd	a5,-24(s0)
 ac6:	a815                	j	afa <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ac8:	fe843783          	ld	a5,-24(s0)
 acc:	639c                	ld	a5,0(a5)
 ace:	fe843703          	ld	a4,-24(s0)
 ad2:	00f76f63          	bltu	a4,a5,af0 <free+0x4c>
 ad6:	fe043703          	ld	a4,-32(s0)
 ada:	fe843783          	ld	a5,-24(s0)
 ade:	02e7eb63          	bltu	a5,a4,b14 <free+0x70>
 ae2:	fe843783          	ld	a5,-24(s0)
 ae6:	639c                	ld	a5,0(a5)
 ae8:	fe043703          	ld	a4,-32(s0)
 aec:	02f76463          	bltu	a4,a5,b14 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 af0:	fe843783          	ld	a5,-24(s0)
 af4:	639c                	ld	a5,0(a5)
 af6:	fef43423          	sd	a5,-24(s0)
 afa:	fe043703          	ld	a4,-32(s0)
 afe:	fe843783          	ld	a5,-24(s0)
 b02:	fce7f3e3          	bgeu	a5,a4,ac8 <free+0x24>
 b06:	fe843783          	ld	a5,-24(s0)
 b0a:	639c                	ld	a5,0(a5)
 b0c:	fe043703          	ld	a4,-32(s0)
 b10:	faf77ce3          	bgeu	a4,a5,ac8 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b14:	fe043783          	ld	a5,-32(s0)
 b18:	479c                	lw	a5,8(a5)
 b1a:	1782                	slli	a5,a5,0x20
 b1c:	9381                	srli	a5,a5,0x20
 b1e:	0792                	slli	a5,a5,0x4
 b20:	fe043703          	ld	a4,-32(s0)
 b24:	973e                	add	a4,a4,a5
 b26:	fe843783          	ld	a5,-24(s0)
 b2a:	639c                	ld	a5,0(a5)
 b2c:	02f71763          	bne	a4,a5,b5a <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
 b30:	fe043783          	ld	a5,-32(s0)
 b34:	4798                	lw	a4,8(a5)
 b36:	fe843783          	ld	a5,-24(s0)
 b3a:	639c                	ld	a5,0(a5)
 b3c:	479c                	lw	a5,8(a5)
 b3e:	9fb9                	addw	a5,a5,a4
 b40:	0007871b          	sext.w	a4,a5
 b44:	fe043783          	ld	a5,-32(s0)
 b48:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 b4a:	fe843783          	ld	a5,-24(s0)
 b4e:	639c                	ld	a5,0(a5)
 b50:	6398                	ld	a4,0(a5)
 b52:	fe043783          	ld	a5,-32(s0)
 b56:	e398                	sd	a4,0(a5)
 b58:	a039                	j	b66 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
 b5a:	fe843783          	ld	a5,-24(s0)
 b5e:	6398                	ld	a4,0(a5)
 b60:	fe043783          	ld	a5,-32(s0)
 b64:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 b66:	fe843783          	ld	a5,-24(s0)
 b6a:	479c                	lw	a5,8(a5)
 b6c:	1782                	slli	a5,a5,0x20
 b6e:	9381                	srli	a5,a5,0x20
 b70:	0792                	slli	a5,a5,0x4
 b72:	fe843703          	ld	a4,-24(s0)
 b76:	97ba                	add	a5,a5,a4
 b78:	fe043703          	ld	a4,-32(s0)
 b7c:	02f71563          	bne	a4,a5,ba6 <free+0x102>
    p->s.size += bp->s.size;
 b80:	fe843783          	ld	a5,-24(s0)
 b84:	4798                	lw	a4,8(a5)
 b86:	fe043783          	ld	a5,-32(s0)
 b8a:	479c                	lw	a5,8(a5)
 b8c:	9fb9                	addw	a5,a5,a4
 b8e:	0007871b          	sext.w	a4,a5
 b92:	fe843783          	ld	a5,-24(s0)
 b96:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 b98:	fe043783          	ld	a5,-32(s0)
 b9c:	6398                	ld	a4,0(a5)
 b9e:	fe843783          	ld	a5,-24(s0)
 ba2:	e398                	sd	a4,0(a5)
 ba4:	a031                	j	bb0 <free+0x10c>
  } else
    p->s.ptr = bp;
 ba6:	fe843783          	ld	a5,-24(s0)
 baa:	fe043703          	ld	a4,-32(s0)
 bae:	e398                	sd	a4,0(a5)
  freep = p;
 bb0:	00000797          	auipc	a5,0x0
 bb4:	23878793          	addi	a5,a5,568 # de8 <freep>
 bb8:	fe843703          	ld	a4,-24(s0)
 bbc:	e398                	sd	a4,0(a5)
}
 bbe:	0001                	nop
 bc0:	7422                	ld	s0,40(sp)
 bc2:	6145                	addi	sp,sp,48
 bc4:	8082                	ret

0000000000000bc6 <morecore>:

static Header*
morecore(uint nu)
{
 bc6:	7179                	addi	sp,sp,-48
 bc8:	f406                	sd	ra,40(sp)
 bca:	f022                	sd	s0,32(sp)
 bcc:	1800                	addi	s0,sp,48
 bce:	87aa                	mv	a5,a0
 bd0:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 bd4:	fdc42783          	lw	a5,-36(s0)
 bd8:	0007871b          	sext.w	a4,a5
 bdc:	6785                	lui	a5,0x1
 bde:	00f77563          	bgeu	a4,a5,be8 <morecore+0x22>
    nu = 4096;
 be2:	6785                	lui	a5,0x1
 be4:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 be8:	fdc42783          	lw	a5,-36(s0)
 bec:	0047979b          	slliw	a5,a5,0x4
 bf0:	2781                	sext.w	a5,a5
 bf2:	2781                	sext.w	a5,a5
 bf4:	853e                	mv	a0,a5
 bf6:	00000097          	auipc	ra,0x0
 bfa:	9b0080e7          	jalr	-1616(ra) # 5a6 <sbrk>
 bfe:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 c02:	fe843703          	ld	a4,-24(s0)
 c06:	57fd                	li	a5,-1
 c08:	00f71463          	bne	a4,a5,c10 <morecore+0x4a>
    return 0;
 c0c:	4781                	li	a5,0
 c0e:	a03d                	j	c3c <morecore+0x76>
  hp = (Header*)p;
 c10:	fe843783          	ld	a5,-24(s0)
 c14:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 c18:	fe043783          	ld	a5,-32(s0)
 c1c:	fdc42703          	lw	a4,-36(s0)
 c20:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 c22:	fe043783          	ld	a5,-32(s0)
 c26:	07c1                	addi	a5,a5,16
 c28:	853e                	mv	a0,a5
 c2a:	00000097          	auipc	ra,0x0
 c2e:	e7a080e7          	jalr	-390(ra) # aa4 <free>
  return freep;
 c32:	00000797          	auipc	a5,0x0
 c36:	1b678793          	addi	a5,a5,438 # de8 <freep>
 c3a:	639c                	ld	a5,0(a5)
}
 c3c:	853e                	mv	a0,a5
 c3e:	70a2                	ld	ra,40(sp)
 c40:	7402                	ld	s0,32(sp)
 c42:	6145                	addi	sp,sp,48
 c44:	8082                	ret

0000000000000c46 <malloc>:

void*
malloc(uint nbytes)
{
 c46:	7139                	addi	sp,sp,-64
 c48:	fc06                	sd	ra,56(sp)
 c4a:	f822                	sd	s0,48(sp)
 c4c:	0080                	addi	s0,sp,64
 c4e:	87aa                	mv	a5,a0
 c50:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c54:	fcc46783          	lwu	a5,-52(s0)
 c58:	07bd                	addi	a5,a5,15
 c5a:	8391                	srli	a5,a5,0x4
 c5c:	2781                	sext.w	a5,a5
 c5e:	2785                	addiw	a5,a5,1
 c60:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 c64:	00000797          	auipc	a5,0x0
 c68:	18478793          	addi	a5,a5,388 # de8 <freep>
 c6c:	639c                	ld	a5,0(a5)
 c6e:	fef43023          	sd	a5,-32(s0)
 c72:	fe043783          	ld	a5,-32(s0)
 c76:	ef95                	bnez	a5,cb2 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 c78:	00000797          	auipc	a5,0x0
 c7c:	16078793          	addi	a5,a5,352 # dd8 <base>
 c80:	fef43023          	sd	a5,-32(s0)
 c84:	00000797          	auipc	a5,0x0
 c88:	16478793          	addi	a5,a5,356 # de8 <freep>
 c8c:	fe043703          	ld	a4,-32(s0)
 c90:	e398                	sd	a4,0(a5)
 c92:	00000797          	auipc	a5,0x0
 c96:	15678793          	addi	a5,a5,342 # de8 <freep>
 c9a:	6398                	ld	a4,0(a5)
 c9c:	00000797          	auipc	a5,0x0
 ca0:	13c78793          	addi	a5,a5,316 # dd8 <base>
 ca4:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 ca6:	00000797          	auipc	a5,0x0
 caa:	13278793          	addi	a5,a5,306 # dd8 <base>
 cae:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 cb2:	fe043783          	ld	a5,-32(s0)
 cb6:	639c                	ld	a5,0(a5)
 cb8:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 cbc:	fe843783          	ld	a5,-24(s0)
 cc0:	4798                	lw	a4,8(a5)
 cc2:	fdc42783          	lw	a5,-36(s0)
 cc6:	2781                	sext.w	a5,a5
 cc8:	06f76863          	bltu	a4,a5,d38 <malloc+0xf2>
      if(p->s.size == nunits)
 ccc:	fe843783          	ld	a5,-24(s0)
 cd0:	4798                	lw	a4,8(a5)
 cd2:	fdc42783          	lw	a5,-36(s0)
 cd6:	2781                	sext.w	a5,a5
 cd8:	00e79963          	bne	a5,a4,cea <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 cdc:	fe843783          	ld	a5,-24(s0)
 ce0:	6398                	ld	a4,0(a5)
 ce2:	fe043783          	ld	a5,-32(s0)
 ce6:	e398                	sd	a4,0(a5)
 ce8:	a82d                	j	d22 <malloc+0xdc>
      else {
        p->s.size -= nunits;
 cea:	fe843783          	ld	a5,-24(s0)
 cee:	4798                	lw	a4,8(a5)
 cf0:	fdc42783          	lw	a5,-36(s0)
 cf4:	40f707bb          	subw	a5,a4,a5
 cf8:	0007871b          	sext.w	a4,a5
 cfc:	fe843783          	ld	a5,-24(s0)
 d00:	c798                	sw	a4,8(a5)
        p += p->s.size;
 d02:	fe843783          	ld	a5,-24(s0)
 d06:	479c                	lw	a5,8(a5)
 d08:	1782                	slli	a5,a5,0x20
 d0a:	9381                	srli	a5,a5,0x20
 d0c:	0792                	slli	a5,a5,0x4
 d0e:	fe843703          	ld	a4,-24(s0)
 d12:	97ba                	add	a5,a5,a4
 d14:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 d18:	fe843783          	ld	a5,-24(s0)
 d1c:	fdc42703          	lw	a4,-36(s0)
 d20:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 d22:	00000797          	auipc	a5,0x0
 d26:	0c678793          	addi	a5,a5,198 # de8 <freep>
 d2a:	fe043703          	ld	a4,-32(s0)
 d2e:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 d30:	fe843783          	ld	a5,-24(s0)
 d34:	07c1                	addi	a5,a5,16
 d36:	a091                	j	d7a <malloc+0x134>
    }
    if(p == freep)
 d38:	00000797          	auipc	a5,0x0
 d3c:	0b078793          	addi	a5,a5,176 # de8 <freep>
 d40:	639c                	ld	a5,0(a5)
 d42:	fe843703          	ld	a4,-24(s0)
 d46:	02f71063          	bne	a4,a5,d66 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
 d4a:	fdc42783          	lw	a5,-36(s0)
 d4e:	853e                	mv	a0,a5
 d50:	00000097          	auipc	ra,0x0
 d54:	e76080e7          	jalr	-394(ra) # bc6 <morecore>
 d58:	fea43423          	sd	a0,-24(s0)
 d5c:	fe843783          	ld	a5,-24(s0)
 d60:	e399                	bnez	a5,d66 <malloc+0x120>
        return 0;
 d62:	4781                	li	a5,0
 d64:	a819                	j	d7a <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d66:	fe843783          	ld	a5,-24(s0)
 d6a:	fef43023          	sd	a5,-32(s0)
 d6e:	fe843783          	ld	a5,-24(s0)
 d72:	639c                	ld	a5,0(a5)
 d74:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 d78:	b791                	j	cbc <malloc+0x76>
  }
}
 d7a:	853e                	mv	a0,a5
 d7c:	70e2                	ld	ra,56(sp)
 d7e:	7442                	ld	s0,48(sp)
 d80:	6121                	addi	sp,sp,64
 d82:	8082                	ret
