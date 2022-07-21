
user/_init:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	1000                	addi	s0,sp,32
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   8:	4589                	li	a1,2
   a:	00001517          	auipc	a0,0x1
   e:	e1650513          	addi	a0,a0,-490 # e20 <malloc+0x14a>
  12:	00000097          	auipc	ra,0x0
  16:	5dc080e7          	jalr	1500(ra) # 5ee <open>
  1a:	87aa                	mv	a5,a0
  1c:	0207d563          	bgez	a5,46 <main+0x46>
    mknod("console", CONSOLE, 0);
  20:	4601                	li	a2,0
  22:	4585                	li	a1,1
  24:	00001517          	auipc	a0,0x1
  28:	dfc50513          	addi	a0,a0,-516 # e20 <malloc+0x14a>
  2c:	00000097          	auipc	ra,0x0
  30:	5ca080e7          	jalr	1482(ra) # 5f6 <mknod>
    open("console", O_RDWR);
  34:	4589                	li	a1,2
  36:	00001517          	auipc	a0,0x1
  3a:	dea50513          	addi	a0,a0,-534 # e20 <malloc+0x14a>
  3e:	00000097          	auipc	ra,0x0
  42:	5b0080e7          	jalr	1456(ra) # 5ee <open>
  }
  dup(0);  // stdout
  46:	4501                	li	a0,0
  48:	00000097          	auipc	ra,0x0
  4c:	5de080e7          	jalr	1502(ra) # 626 <dup>
  dup(0);  // stderr
  50:	4501                	li	a0,0
  52:	00000097          	auipc	ra,0x0
  56:	5d4080e7          	jalr	1492(ra) # 626 <dup>

  for(;;){
    printf("init: starting sh\n");
  5a:	00001517          	auipc	a0,0x1
  5e:	dce50513          	addi	a0,a0,-562 # e28 <malloc+0x152>
  62:	00001097          	auipc	ra,0x1
  66:	a82080e7          	jalr	-1406(ra) # ae4 <printf>
    pid = fork();
  6a:	00000097          	auipc	ra,0x0
  6e:	53c080e7          	jalr	1340(ra) # 5a6 <fork>
  72:	87aa                	mv	a5,a0
  74:	fef42623          	sw	a5,-20(s0)
    if(pid < 0){
  78:	fec42783          	lw	a5,-20(s0)
  7c:	2781                	sext.w	a5,a5
  7e:	0007df63          	bgez	a5,9c <main+0x9c>
      printf("init: fork failed\n");
  82:	00001517          	auipc	a0,0x1
  86:	dbe50513          	addi	a0,a0,-578 # e40 <malloc+0x16a>
  8a:	00001097          	auipc	ra,0x1
  8e:	a5a080e7          	jalr	-1446(ra) # ae4 <printf>
      exit(1);
  92:	4505                	li	a0,1
  94:	00000097          	auipc	ra,0x0
  98:	51a080e7          	jalr	1306(ra) # 5ae <exit>
    }
    if(pid == 0){
  9c:	fec42783          	lw	a5,-20(s0)
  a0:	2781                	sext.w	a5,a5
  a2:	eb95                	bnez	a5,d6 <main+0xd6>
      exec("sh", argv);
  a4:	00001597          	auipc	a1,0x1
  a8:	df458593          	addi	a1,a1,-524 # e98 <argv>
  ac:	00001517          	auipc	a0,0x1
  b0:	d6c50513          	addi	a0,a0,-660 # e18 <malloc+0x142>
  b4:	00000097          	auipc	ra,0x0
  b8:	532080e7          	jalr	1330(ra) # 5e6 <exec>
      printf("init: exec sh failed\n");
  bc:	00001517          	auipc	a0,0x1
  c0:	d9c50513          	addi	a0,a0,-612 # e58 <malloc+0x182>
  c4:	00001097          	auipc	ra,0x1
  c8:	a20080e7          	jalr	-1504(ra) # ae4 <printf>
      exit(1);
  cc:	4505                	li	a0,1
  ce:	00000097          	auipc	ra,0x0
  d2:	4e0080e7          	jalr	1248(ra) # 5ae <exit>
    }

    for(;;){
      // this call to wait() returns if the shell exits,
      // or if a parentless process exits.
      wpid = wait((int *) 0);
  d6:	4501                	li	a0,0
  d8:	00000097          	auipc	ra,0x0
  dc:	4de080e7          	jalr	1246(ra) # 5b6 <wait>
  e0:	87aa                	mv	a5,a0
  e2:	fef42423          	sw	a5,-24(s0)
      if(wpid == pid){
  e6:	fe842703          	lw	a4,-24(s0)
  ea:	fec42783          	lw	a5,-20(s0)
  ee:	2701                	sext.w	a4,a4
  f0:	2781                	sext.w	a5,a5
  f2:	02f70463          	beq	a4,a5,11a <main+0x11a>
        // the shell exited; restart it.
        break;
      } else if(wpid < 0){
  f6:	fe842783          	lw	a5,-24(s0)
  fa:	2781                	sext.w	a5,a5
  fc:	fc07dde3          	bgez	a5,d6 <main+0xd6>
        printf("init: wait returned an error\n");
 100:	00001517          	auipc	a0,0x1
 104:	d7050513          	addi	a0,a0,-656 # e70 <malloc+0x19a>
 108:	00001097          	auipc	ra,0x1
 10c:	9dc080e7          	jalr	-1572(ra) # ae4 <printf>
        exit(1);
 110:	4505                	li	a0,1
 112:	00000097          	auipc	ra,0x0
 116:	49c080e7          	jalr	1180(ra) # 5ae <exit>
        break;
 11a:	0001                	nop
    printf("init: starting sh\n");
 11c:	bf3d                	j	5a <main+0x5a>

000000000000011e <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 11e:	7179                	addi	sp,sp,-48
 120:	f422                	sd	s0,40(sp)
 122:	1800                	addi	s0,sp,48
 124:	fca43c23          	sd	a0,-40(s0)
 128:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
 12c:	fd843783          	ld	a5,-40(s0)
 130:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
 134:	0001                	nop
 136:	fd043703          	ld	a4,-48(s0)
 13a:	00170793          	addi	a5,a4,1
 13e:	fcf43823          	sd	a5,-48(s0)
 142:	fd843783          	ld	a5,-40(s0)
 146:	00178693          	addi	a3,a5,1
 14a:	fcd43c23          	sd	a3,-40(s0)
 14e:	00074703          	lbu	a4,0(a4)
 152:	00e78023          	sb	a4,0(a5)
 156:	0007c783          	lbu	a5,0(a5)
 15a:	fff1                	bnez	a5,136 <strcpy+0x18>
    ;
  return os;
 15c:	fe843783          	ld	a5,-24(s0)
}
 160:	853e                	mv	a0,a5
 162:	7422                	ld	s0,40(sp)
 164:	6145                	addi	sp,sp,48
 166:	8082                	ret

0000000000000168 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 168:	1101                	addi	sp,sp,-32
 16a:	ec22                	sd	s0,24(sp)
 16c:	1000                	addi	s0,sp,32
 16e:	fea43423          	sd	a0,-24(s0)
 172:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
 176:	a819                	j	18c <strcmp+0x24>
    p++, q++;
 178:	fe843783          	ld	a5,-24(s0)
 17c:	0785                	addi	a5,a5,1
 17e:	fef43423          	sd	a5,-24(s0)
 182:	fe043783          	ld	a5,-32(s0)
 186:	0785                	addi	a5,a5,1
 188:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
 18c:	fe843783          	ld	a5,-24(s0)
 190:	0007c783          	lbu	a5,0(a5)
 194:	cb99                	beqz	a5,1aa <strcmp+0x42>
 196:	fe843783          	ld	a5,-24(s0)
 19a:	0007c703          	lbu	a4,0(a5)
 19e:	fe043783          	ld	a5,-32(s0)
 1a2:	0007c783          	lbu	a5,0(a5)
 1a6:	fcf709e3          	beq	a4,a5,178 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
 1aa:	fe843783          	ld	a5,-24(s0)
 1ae:	0007c783          	lbu	a5,0(a5)
 1b2:	0007871b          	sext.w	a4,a5
 1b6:	fe043783          	ld	a5,-32(s0)
 1ba:	0007c783          	lbu	a5,0(a5)
 1be:	2781                	sext.w	a5,a5
 1c0:	40f707bb          	subw	a5,a4,a5
 1c4:	2781                	sext.w	a5,a5
}
 1c6:	853e                	mv	a0,a5
 1c8:	6462                	ld	s0,24(sp)
 1ca:	6105                	addi	sp,sp,32
 1cc:	8082                	ret

00000000000001ce <strlen>:

uint
strlen(const char *s)
{
 1ce:	7179                	addi	sp,sp,-48
 1d0:	f422                	sd	s0,40(sp)
 1d2:	1800                	addi	s0,sp,48
 1d4:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
 1d8:	fe042623          	sw	zero,-20(s0)
 1dc:	a031                	j	1e8 <strlen+0x1a>
 1de:	fec42783          	lw	a5,-20(s0)
 1e2:	2785                	addiw	a5,a5,1
 1e4:	fef42623          	sw	a5,-20(s0)
 1e8:	fec42783          	lw	a5,-20(s0)
 1ec:	fd843703          	ld	a4,-40(s0)
 1f0:	97ba                	add	a5,a5,a4
 1f2:	0007c783          	lbu	a5,0(a5)
 1f6:	f7e5                	bnez	a5,1de <strlen+0x10>
    ;
  return n;
 1f8:	fec42783          	lw	a5,-20(s0)
}
 1fc:	853e                	mv	a0,a5
 1fe:	7422                	ld	s0,40(sp)
 200:	6145                	addi	sp,sp,48
 202:	8082                	ret

0000000000000204 <memset>:

void*
memset(void *dst, int c, uint n)
{
 204:	7179                	addi	sp,sp,-48
 206:	f422                	sd	s0,40(sp)
 208:	1800                	addi	s0,sp,48
 20a:	fca43c23          	sd	a0,-40(s0)
 20e:	87ae                	mv	a5,a1
 210:	8732                	mv	a4,a2
 212:	fcf42a23          	sw	a5,-44(s0)
 216:	87ba                	mv	a5,a4
 218:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
 21c:	fd843783          	ld	a5,-40(s0)
 220:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
 224:	fe042623          	sw	zero,-20(s0)
 228:	a00d                	j	24a <memset+0x46>
    cdst[i] = c;
 22a:	fec42783          	lw	a5,-20(s0)
 22e:	fe043703          	ld	a4,-32(s0)
 232:	97ba                	add	a5,a5,a4
 234:	fd442703          	lw	a4,-44(s0)
 238:	0ff77713          	andi	a4,a4,255
 23c:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
 240:	fec42783          	lw	a5,-20(s0)
 244:	2785                	addiw	a5,a5,1
 246:	fef42623          	sw	a5,-20(s0)
 24a:	fec42703          	lw	a4,-20(s0)
 24e:	fd042783          	lw	a5,-48(s0)
 252:	2781                	sext.w	a5,a5
 254:	fcf76be3          	bltu	a4,a5,22a <memset+0x26>
  }
  return dst;
 258:	fd843783          	ld	a5,-40(s0)
}
 25c:	853e                	mv	a0,a5
 25e:	7422                	ld	s0,40(sp)
 260:	6145                	addi	sp,sp,48
 262:	8082                	ret

0000000000000264 <strchr>:

char*
strchr(const char *s, char c)
{
 264:	1101                	addi	sp,sp,-32
 266:	ec22                	sd	s0,24(sp)
 268:	1000                	addi	s0,sp,32
 26a:	fea43423          	sd	a0,-24(s0)
 26e:	87ae                	mv	a5,a1
 270:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
 274:	a01d                	j	29a <strchr+0x36>
    if(*s == c)
 276:	fe843783          	ld	a5,-24(s0)
 27a:	0007c703          	lbu	a4,0(a5)
 27e:	fe744783          	lbu	a5,-25(s0)
 282:	0ff7f793          	andi	a5,a5,255
 286:	00e79563          	bne	a5,a4,290 <strchr+0x2c>
      return (char*)s;
 28a:	fe843783          	ld	a5,-24(s0)
 28e:	a821                	j	2a6 <strchr+0x42>
  for(; *s; s++)
 290:	fe843783          	ld	a5,-24(s0)
 294:	0785                	addi	a5,a5,1
 296:	fef43423          	sd	a5,-24(s0)
 29a:	fe843783          	ld	a5,-24(s0)
 29e:	0007c783          	lbu	a5,0(a5)
 2a2:	fbf1                	bnez	a5,276 <strchr+0x12>
  return 0;
 2a4:	4781                	li	a5,0
}
 2a6:	853e                	mv	a0,a5
 2a8:	6462                	ld	s0,24(sp)
 2aa:	6105                	addi	sp,sp,32
 2ac:	8082                	ret

00000000000002ae <gets>:

char*
gets(char *buf, int max)
{
 2ae:	7179                	addi	sp,sp,-48
 2b0:	f406                	sd	ra,40(sp)
 2b2:	f022                	sd	s0,32(sp)
 2b4:	1800                	addi	s0,sp,48
 2b6:	fca43c23          	sd	a0,-40(s0)
 2ba:	87ae                	mv	a5,a1
 2bc:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2c0:	fe042623          	sw	zero,-20(s0)
 2c4:	a8a1                	j	31c <gets+0x6e>
    cc = read(0, &c, 1);
 2c6:	fe740793          	addi	a5,s0,-25
 2ca:	4605                	li	a2,1
 2cc:	85be                	mv	a1,a5
 2ce:	4501                	li	a0,0
 2d0:	00000097          	auipc	ra,0x0
 2d4:	2f6080e7          	jalr	758(ra) # 5c6 <read>
 2d8:	87aa                	mv	a5,a0
 2da:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
 2de:	fe842783          	lw	a5,-24(s0)
 2e2:	2781                	sext.w	a5,a5
 2e4:	04f05763          	blez	a5,332 <gets+0x84>
      break;
    buf[i++] = c;
 2e8:	fec42783          	lw	a5,-20(s0)
 2ec:	0017871b          	addiw	a4,a5,1
 2f0:	fee42623          	sw	a4,-20(s0)
 2f4:	873e                	mv	a4,a5
 2f6:	fd843783          	ld	a5,-40(s0)
 2fa:	97ba                	add	a5,a5,a4
 2fc:	fe744703          	lbu	a4,-25(s0)
 300:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
 304:	fe744783          	lbu	a5,-25(s0)
 308:	873e                	mv	a4,a5
 30a:	47a9                	li	a5,10
 30c:	02f70463          	beq	a4,a5,334 <gets+0x86>
 310:	fe744783          	lbu	a5,-25(s0)
 314:	873e                	mv	a4,a5
 316:	47b5                	li	a5,13
 318:	00f70e63          	beq	a4,a5,334 <gets+0x86>
  for(i=0; i+1 < max; ){
 31c:	fec42783          	lw	a5,-20(s0)
 320:	2785                	addiw	a5,a5,1
 322:	0007871b          	sext.w	a4,a5
 326:	fd442783          	lw	a5,-44(s0)
 32a:	2781                	sext.w	a5,a5
 32c:	f8f74de3          	blt	a4,a5,2c6 <gets+0x18>
 330:	a011                	j	334 <gets+0x86>
      break;
 332:	0001                	nop
      break;
  }
  buf[i] = '\0';
 334:	fec42783          	lw	a5,-20(s0)
 338:	fd843703          	ld	a4,-40(s0)
 33c:	97ba                	add	a5,a5,a4
 33e:	00078023          	sb	zero,0(a5)
  return buf;
 342:	fd843783          	ld	a5,-40(s0)
}
 346:	853e                	mv	a0,a5
 348:	70a2                	ld	ra,40(sp)
 34a:	7402                	ld	s0,32(sp)
 34c:	6145                	addi	sp,sp,48
 34e:	8082                	ret

0000000000000350 <stat>:

int
stat(const char *n, struct stat *st)
{
 350:	7179                	addi	sp,sp,-48
 352:	f406                	sd	ra,40(sp)
 354:	f022                	sd	s0,32(sp)
 356:	1800                	addi	s0,sp,48
 358:	fca43c23          	sd	a0,-40(s0)
 35c:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 360:	4581                	li	a1,0
 362:	fd843503          	ld	a0,-40(s0)
 366:	00000097          	auipc	ra,0x0
 36a:	288080e7          	jalr	648(ra) # 5ee <open>
 36e:	87aa                	mv	a5,a0
 370:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
 374:	fec42783          	lw	a5,-20(s0)
 378:	2781                	sext.w	a5,a5
 37a:	0007d463          	bgez	a5,382 <stat+0x32>
    return -1;
 37e:	57fd                	li	a5,-1
 380:	a035                	j	3ac <stat+0x5c>
  r = fstat(fd, st);
 382:	fec42783          	lw	a5,-20(s0)
 386:	fd043583          	ld	a1,-48(s0)
 38a:	853e                	mv	a0,a5
 38c:	00000097          	auipc	ra,0x0
 390:	27a080e7          	jalr	634(ra) # 606 <fstat>
 394:	87aa                	mv	a5,a0
 396:	fef42423          	sw	a5,-24(s0)
  close(fd);
 39a:	fec42783          	lw	a5,-20(s0)
 39e:	853e                	mv	a0,a5
 3a0:	00000097          	auipc	ra,0x0
 3a4:	236080e7          	jalr	566(ra) # 5d6 <close>
  return r;
 3a8:	fe842783          	lw	a5,-24(s0)
}
 3ac:	853e                	mv	a0,a5
 3ae:	70a2                	ld	ra,40(sp)
 3b0:	7402                	ld	s0,32(sp)
 3b2:	6145                	addi	sp,sp,48
 3b4:	8082                	ret

00000000000003b6 <atoi>:

int
atoi(const char *s)
{
 3b6:	7179                	addi	sp,sp,-48
 3b8:	f422                	sd	s0,40(sp)
 3ba:	1800                	addi	s0,sp,48
 3bc:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
 3c0:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
 3c4:	a815                	j	3f8 <atoi+0x42>
    n = n*10 + *s++ - '0';
 3c6:	fec42703          	lw	a4,-20(s0)
 3ca:	87ba                	mv	a5,a4
 3cc:	0027979b          	slliw	a5,a5,0x2
 3d0:	9fb9                	addw	a5,a5,a4
 3d2:	0017979b          	slliw	a5,a5,0x1
 3d6:	0007871b          	sext.w	a4,a5
 3da:	fd843783          	ld	a5,-40(s0)
 3de:	00178693          	addi	a3,a5,1
 3e2:	fcd43c23          	sd	a3,-40(s0)
 3e6:	0007c783          	lbu	a5,0(a5)
 3ea:	2781                	sext.w	a5,a5
 3ec:	9fb9                	addw	a5,a5,a4
 3ee:	2781                	sext.w	a5,a5
 3f0:	fd07879b          	addiw	a5,a5,-48
 3f4:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
 3f8:	fd843783          	ld	a5,-40(s0)
 3fc:	0007c783          	lbu	a5,0(a5)
 400:	873e                	mv	a4,a5
 402:	02f00793          	li	a5,47
 406:	00e7fb63          	bgeu	a5,a4,41c <atoi+0x66>
 40a:	fd843783          	ld	a5,-40(s0)
 40e:	0007c783          	lbu	a5,0(a5)
 412:	873e                	mv	a4,a5
 414:	03900793          	li	a5,57
 418:	fae7f7e3          	bgeu	a5,a4,3c6 <atoi+0x10>
  return n;
 41c:	fec42783          	lw	a5,-20(s0)
}
 420:	853e                	mv	a0,a5
 422:	7422                	ld	s0,40(sp)
 424:	6145                	addi	sp,sp,48
 426:	8082                	ret

0000000000000428 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 428:	7139                	addi	sp,sp,-64
 42a:	fc22                	sd	s0,56(sp)
 42c:	0080                	addi	s0,sp,64
 42e:	fca43c23          	sd	a0,-40(s0)
 432:	fcb43823          	sd	a1,-48(s0)
 436:	87b2                	mv	a5,a2
 438:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
 43c:	fd843783          	ld	a5,-40(s0)
 440:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
 444:	fd043783          	ld	a5,-48(s0)
 448:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
 44c:	fe043703          	ld	a4,-32(s0)
 450:	fe843783          	ld	a5,-24(s0)
 454:	02e7fc63          	bgeu	a5,a4,48c <memmove+0x64>
    while(n-- > 0)
 458:	a00d                	j	47a <memmove+0x52>
      *dst++ = *src++;
 45a:	fe043703          	ld	a4,-32(s0)
 45e:	00170793          	addi	a5,a4,1
 462:	fef43023          	sd	a5,-32(s0)
 466:	fe843783          	ld	a5,-24(s0)
 46a:	00178693          	addi	a3,a5,1
 46e:	fed43423          	sd	a3,-24(s0)
 472:	00074703          	lbu	a4,0(a4)
 476:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 47a:	fcc42783          	lw	a5,-52(s0)
 47e:	fff7871b          	addiw	a4,a5,-1
 482:	fce42623          	sw	a4,-52(s0)
 486:	fcf04ae3          	bgtz	a5,45a <memmove+0x32>
 48a:	a891                	j	4de <memmove+0xb6>
  } else {
    dst += n;
 48c:	fcc42783          	lw	a5,-52(s0)
 490:	fe843703          	ld	a4,-24(s0)
 494:	97ba                	add	a5,a5,a4
 496:	fef43423          	sd	a5,-24(s0)
    src += n;
 49a:	fcc42783          	lw	a5,-52(s0)
 49e:	fe043703          	ld	a4,-32(s0)
 4a2:	97ba                	add	a5,a5,a4
 4a4:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
 4a8:	a01d                	j	4ce <memmove+0xa6>
      *--dst = *--src;
 4aa:	fe043783          	ld	a5,-32(s0)
 4ae:	17fd                	addi	a5,a5,-1
 4b0:	fef43023          	sd	a5,-32(s0)
 4b4:	fe843783          	ld	a5,-24(s0)
 4b8:	17fd                	addi	a5,a5,-1
 4ba:	fef43423          	sd	a5,-24(s0)
 4be:	fe043783          	ld	a5,-32(s0)
 4c2:	0007c703          	lbu	a4,0(a5)
 4c6:	fe843783          	ld	a5,-24(s0)
 4ca:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
 4ce:	fcc42783          	lw	a5,-52(s0)
 4d2:	fff7871b          	addiw	a4,a5,-1
 4d6:	fce42623          	sw	a4,-52(s0)
 4da:	fcf048e3          	bgtz	a5,4aa <memmove+0x82>
  }
  return vdst;
 4de:	fd843783          	ld	a5,-40(s0)
}
 4e2:	853e                	mv	a0,a5
 4e4:	7462                	ld	s0,56(sp)
 4e6:	6121                	addi	sp,sp,64
 4e8:	8082                	ret

00000000000004ea <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 4ea:	7139                	addi	sp,sp,-64
 4ec:	fc22                	sd	s0,56(sp)
 4ee:	0080                	addi	s0,sp,64
 4f0:	fca43c23          	sd	a0,-40(s0)
 4f4:	fcb43823          	sd	a1,-48(s0)
 4f8:	87b2                	mv	a5,a2
 4fa:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
 4fe:	fd843783          	ld	a5,-40(s0)
 502:	fef43423          	sd	a5,-24(s0)
 506:	fd043783          	ld	a5,-48(s0)
 50a:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 50e:	a0a1                	j	556 <memcmp+0x6c>
    if (*p1 != *p2) {
 510:	fe843783          	ld	a5,-24(s0)
 514:	0007c703          	lbu	a4,0(a5)
 518:	fe043783          	ld	a5,-32(s0)
 51c:	0007c783          	lbu	a5,0(a5)
 520:	02f70163          	beq	a4,a5,542 <memcmp+0x58>
      return *p1 - *p2;
 524:	fe843783          	ld	a5,-24(s0)
 528:	0007c783          	lbu	a5,0(a5)
 52c:	0007871b          	sext.w	a4,a5
 530:	fe043783          	ld	a5,-32(s0)
 534:	0007c783          	lbu	a5,0(a5)
 538:	2781                	sext.w	a5,a5
 53a:	40f707bb          	subw	a5,a4,a5
 53e:	2781                	sext.w	a5,a5
 540:	a01d                	j	566 <memcmp+0x7c>
    }
    p1++;
 542:	fe843783          	ld	a5,-24(s0)
 546:	0785                	addi	a5,a5,1
 548:	fef43423          	sd	a5,-24(s0)
    p2++;
 54c:	fe043783          	ld	a5,-32(s0)
 550:	0785                	addi	a5,a5,1
 552:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
 556:	fcc42783          	lw	a5,-52(s0)
 55a:	fff7871b          	addiw	a4,a5,-1
 55e:	fce42623          	sw	a4,-52(s0)
 562:	f7dd                	bnez	a5,510 <memcmp+0x26>
  }
  return 0;
 564:	4781                	li	a5,0
}
 566:	853e                	mv	a0,a5
 568:	7462                	ld	s0,56(sp)
 56a:	6121                	addi	sp,sp,64
 56c:	8082                	ret

000000000000056e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 56e:	7179                	addi	sp,sp,-48
 570:	f406                	sd	ra,40(sp)
 572:	f022                	sd	s0,32(sp)
 574:	1800                	addi	s0,sp,48
 576:	fea43423          	sd	a0,-24(s0)
 57a:	feb43023          	sd	a1,-32(s0)
 57e:	87b2                	mv	a5,a2
 580:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
 584:	fdc42783          	lw	a5,-36(s0)
 588:	863e                	mv	a2,a5
 58a:	fe043583          	ld	a1,-32(s0)
 58e:	fe843503          	ld	a0,-24(s0)
 592:	00000097          	auipc	ra,0x0
 596:	e96080e7          	jalr	-362(ra) # 428 <memmove>
 59a:	87aa                	mv	a5,a0
}
 59c:	853e                	mv	a0,a5
 59e:	70a2                	ld	ra,40(sp)
 5a0:	7402                	ld	s0,32(sp)
 5a2:	6145                	addi	sp,sp,48
 5a4:	8082                	ret

00000000000005a6 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 5a6:	4885                	li	a7,1
 ecall
 5a8:	00000073          	ecall
 ret
 5ac:	8082                	ret

00000000000005ae <exit>:
.global exit
exit:
 li a7, SYS_exit
 5ae:	4889                	li	a7,2
 ecall
 5b0:	00000073          	ecall
 ret
 5b4:	8082                	ret

00000000000005b6 <wait>:
.global wait
wait:
 li a7, SYS_wait
 5b6:	488d                	li	a7,3
 ecall
 5b8:	00000073          	ecall
 ret
 5bc:	8082                	ret

00000000000005be <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 5be:	4891                	li	a7,4
 ecall
 5c0:	00000073          	ecall
 ret
 5c4:	8082                	ret

00000000000005c6 <read>:
.global read
read:
 li a7, SYS_read
 5c6:	4895                	li	a7,5
 ecall
 5c8:	00000073          	ecall
 ret
 5cc:	8082                	ret

00000000000005ce <write>:
.global write
write:
 li a7, SYS_write
 5ce:	48c1                	li	a7,16
 ecall
 5d0:	00000073          	ecall
 ret
 5d4:	8082                	ret

00000000000005d6 <close>:
.global close
close:
 li a7, SYS_close
 5d6:	48d5                	li	a7,21
 ecall
 5d8:	00000073          	ecall
 ret
 5dc:	8082                	ret

00000000000005de <kill>:
.global kill
kill:
 li a7, SYS_kill
 5de:	4899                	li	a7,6
 ecall
 5e0:	00000073          	ecall
 ret
 5e4:	8082                	ret

00000000000005e6 <exec>:
.global exec
exec:
 li a7, SYS_exec
 5e6:	489d                	li	a7,7
 ecall
 5e8:	00000073          	ecall
 ret
 5ec:	8082                	ret

00000000000005ee <open>:
.global open
open:
 li a7, SYS_open
 5ee:	48bd                	li	a7,15
 ecall
 5f0:	00000073          	ecall
 ret
 5f4:	8082                	ret

00000000000005f6 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 5f6:	48c5                	li	a7,17
 ecall
 5f8:	00000073          	ecall
 ret
 5fc:	8082                	ret

00000000000005fe <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 5fe:	48c9                	li	a7,18
 ecall
 600:	00000073          	ecall
 ret
 604:	8082                	ret

0000000000000606 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 606:	48a1                	li	a7,8
 ecall
 608:	00000073          	ecall
 ret
 60c:	8082                	ret

000000000000060e <link>:
.global link
link:
 li a7, SYS_link
 60e:	48cd                	li	a7,19
 ecall
 610:	00000073          	ecall
 ret
 614:	8082                	ret

0000000000000616 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 616:	48d1                	li	a7,20
 ecall
 618:	00000073          	ecall
 ret
 61c:	8082                	ret

000000000000061e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 61e:	48a5                	li	a7,9
 ecall
 620:	00000073          	ecall
 ret
 624:	8082                	ret

0000000000000626 <dup>:
.global dup
dup:
 li a7, SYS_dup
 626:	48a9                	li	a7,10
 ecall
 628:	00000073          	ecall
 ret
 62c:	8082                	ret

000000000000062e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 62e:	48ad                	li	a7,11
 ecall
 630:	00000073          	ecall
 ret
 634:	8082                	ret

0000000000000636 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 636:	48b1                	li	a7,12
 ecall
 638:	00000073          	ecall
 ret
 63c:	8082                	ret

000000000000063e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 63e:	48b5                	li	a7,13
 ecall
 640:	00000073          	ecall
 ret
 644:	8082                	ret

0000000000000646 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 646:	48b9                	li	a7,14
 ecall
 648:	00000073          	ecall
 ret
 64c:	8082                	ret

000000000000064e <setSchedAlg>:
.global setSchedAlg
setSchedAlg:
 li a7, SYS_setSchedAlg
 64e:	48d9                	li	a7,22
 ecall
 650:	00000073          	ecall
 ret
 654:	8082                	ret

0000000000000656 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 656:	1101                	addi	sp,sp,-32
 658:	ec06                	sd	ra,24(sp)
 65a:	e822                	sd	s0,16(sp)
 65c:	1000                	addi	s0,sp,32
 65e:	87aa                	mv	a5,a0
 660:	872e                	mv	a4,a1
 662:	fef42623          	sw	a5,-20(s0)
 666:	87ba                	mv	a5,a4
 668:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
 66c:	feb40713          	addi	a4,s0,-21
 670:	fec42783          	lw	a5,-20(s0)
 674:	4605                	li	a2,1
 676:	85ba                	mv	a1,a4
 678:	853e                	mv	a0,a5
 67a:	00000097          	auipc	ra,0x0
 67e:	f54080e7          	jalr	-172(ra) # 5ce <write>
}
 682:	0001                	nop
 684:	60e2                	ld	ra,24(sp)
 686:	6442                	ld	s0,16(sp)
 688:	6105                	addi	sp,sp,32
 68a:	8082                	ret

000000000000068c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 68c:	7139                	addi	sp,sp,-64
 68e:	fc06                	sd	ra,56(sp)
 690:	f822                	sd	s0,48(sp)
 692:	0080                	addi	s0,sp,64
 694:	87aa                	mv	a5,a0
 696:	8736                	mv	a4,a3
 698:	fcf42623          	sw	a5,-52(s0)
 69c:	87ae                	mv	a5,a1
 69e:	fcf42423          	sw	a5,-56(s0)
 6a2:	87b2                	mv	a5,a2
 6a4:	fcf42223          	sw	a5,-60(s0)
 6a8:	87ba                	mv	a5,a4
 6aa:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6ae:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
 6b2:	fc042783          	lw	a5,-64(s0)
 6b6:	2781                	sext.w	a5,a5
 6b8:	c38d                	beqz	a5,6da <printint+0x4e>
 6ba:	fc842783          	lw	a5,-56(s0)
 6be:	2781                	sext.w	a5,a5
 6c0:	0007dd63          	bgez	a5,6da <printint+0x4e>
    neg = 1;
 6c4:	4785                	li	a5,1
 6c6:	fef42423          	sw	a5,-24(s0)
    x = -xx;
 6ca:	fc842783          	lw	a5,-56(s0)
 6ce:	40f007bb          	negw	a5,a5
 6d2:	2781                	sext.w	a5,a5
 6d4:	fef42223          	sw	a5,-28(s0)
 6d8:	a029                	j	6e2 <printint+0x56>
  } else {
    x = xx;
 6da:	fc842783          	lw	a5,-56(s0)
 6de:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
 6e2:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
 6e6:	fc442783          	lw	a5,-60(s0)
 6ea:	fe442703          	lw	a4,-28(s0)
 6ee:	02f777bb          	remuw	a5,a4,a5
 6f2:	0007861b          	sext.w	a2,a5
 6f6:	fec42783          	lw	a5,-20(s0)
 6fa:	0017871b          	addiw	a4,a5,1
 6fe:	fee42623          	sw	a4,-20(s0)
 702:	00000697          	auipc	a3,0x0
 706:	7a668693          	addi	a3,a3,1958 # ea8 <digits>
 70a:	02061713          	slli	a4,a2,0x20
 70e:	9301                	srli	a4,a4,0x20
 710:	9736                	add	a4,a4,a3
 712:	00074703          	lbu	a4,0(a4)
 716:	ff040693          	addi	a3,s0,-16
 71a:	97b6                	add	a5,a5,a3
 71c:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
 720:	fc442783          	lw	a5,-60(s0)
 724:	fe442703          	lw	a4,-28(s0)
 728:	02f757bb          	divuw	a5,a4,a5
 72c:	fef42223          	sw	a5,-28(s0)
 730:	fe442783          	lw	a5,-28(s0)
 734:	2781                	sext.w	a5,a5
 736:	fbc5                	bnez	a5,6e6 <printint+0x5a>
  if(neg)
 738:	fe842783          	lw	a5,-24(s0)
 73c:	2781                	sext.w	a5,a5
 73e:	cf95                	beqz	a5,77a <printint+0xee>
    buf[i++] = '-';
 740:	fec42783          	lw	a5,-20(s0)
 744:	0017871b          	addiw	a4,a5,1
 748:	fee42623          	sw	a4,-20(s0)
 74c:	ff040713          	addi	a4,s0,-16
 750:	97ba                	add	a5,a5,a4
 752:	02d00713          	li	a4,45
 756:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
 75a:	a005                	j	77a <printint+0xee>
    putc(fd, buf[i]);
 75c:	fec42783          	lw	a5,-20(s0)
 760:	ff040713          	addi	a4,s0,-16
 764:	97ba                	add	a5,a5,a4
 766:	fe07c703          	lbu	a4,-32(a5)
 76a:	fcc42783          	lw	a5,-52(s0)
 76e:	85ba                	mv	a1,a4
 770:	853e                	mv	a0,a5
 772:	00000097          	auipc	ra,0x0
 776:	ee4080e7          	jalr	-284(ra) # 656 <putc>
  while(--i >= 0)
 77a:	fec42783          	lw	a5,-20(s0)
 77e:	37fd                	addiw	a5,a5,-1
 780:	fef42623          	sw	a5,-20(s0)
 784:	fec42783          	lw	a5,-20(s0)
 788:	2781                	sext.w	a5,a5
 78a:	fc07d9e3          	bgez	a5,75c <printint+0xd0>
}
 78e:	0001                	nop
 790:	0001                	nop
 792:	70e2                	ld	ra,56(sp)
 794:	7442                	ld	s0,48(sp)
 796:	6121                	addi	sp,sp,64
 798:	8082                	ret

000000000000079a <printptr>:

static void
printptr(int fd, uint64 x) {
 79a:	7179                	addi	sp,sp,-48
 79c:	f406                	sd	ra,40(sp)
 79e:	f022                	sd	s0,32(sp)
 7a0:	1800                	addi	s0,sp,48
 7a2:	87aa                	mv	a5,a0
 7a4:	fcb43823          	sd	a1,-48(s0)
 7a8:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
 7ac:	fdc42783          	lw	a5,-36(s0)
 7b0:	03000593          	li	a1,48
 7b4:	853e                	mv	a0,a5
 7b6:	00000097          	auipc	ra,0x0
 7ba:	ea0080e7          	jalr	-352(ra) # 656 <putc>
  putc(fd, 'x');
 7be:	fdc42783          	lw	a5,-36(s0)
 7c2:	07800593          	li	a1,120
 7c6:	853e                	mv	a0,a5
 7c8:	00000097          	auipc	ra,0x0
 7cc:	e8e080e7          	jalr	-370(ra) # 656 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 7d0:	fe042623          	sw	zero,-20(s0)
 7d4:	a82d                	j	80e <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 7d6:	fd043783          	ld	a5,-48(s0)
 7da:	93f1                	srli	a5,a5,0x3c
 7dc:	00000717          	auipc	a4,0x0
 7e0:	6cc70713          	addi	a4,a4,1740 # ea8 <digits>
 7e4:	97ba                	add	a5,a5,a4
 7e6:	0007c703          	lbu	a4,0(a5)
 7ea:	fdc42783          	lw	a5,-36(s0)
 7ee:	85ba                	mv	a1,a4
 7f0:	853e                	mv	a0,a5
 7f2:	00000097          	auipc	ra,0x0
 7f6:	e64080e7          	jalr	-412(ra) # 656 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 7fa:	fec42783          	lw	a5,-20(s0)
 7fe:	2785                	addiw	a5,a5,1
 800:	fef42623          	sw	a5,-20(s0)
 804:	fd043783          	ld	a5,-48(s0)
 808:	0792                	slli	a5,a5,0x4
 80a:	fcf43823          	sd	a5,-48(s0)
 80e:	fec42783          	lw	a5,-20(s0)
 812:	873e                	mv	a4,a5
 814:	47bd                	li	a5,15
 816:	fce7f0e3          	bgeu	a5,a4,7d6 <printptr+0x3c>
}
 81a:	0001                	nop
 81c:	0001                	nop
 81e:	70a2                	ld	ra,40(sp)
 820:	7402                	ld	s0,32(sp)
 822:	6145                	addi	sp,sp,48
 824:	8082                	ret

0000000000000826 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 826:	715d                	addi	sp,sp,-80
 828:	e486                	sd	ra,72(sp)
 82a:	e0a2                	sd	s0,64(sp)
 82c:	0880                	addi	s0,sp,80
 82e:	87aa                	mv	a5,a0
 830:	fcb43023          	sd	a1,-64(s0)
 834:	fac43c23          	sd	a2,-72(s0)
 838:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
 83c:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 840:	fe042223          	sw	zero,-28(s0)
 844:	a42d                	j	a6e <vprintf+0x248>
    c = fmt[i] & 0xff;
 846:	fe442783          	lw	a5,-28(s0)
 84a:	fc043703          	ld	a4,-64(s0)
 84e:	97ba                	add	a5,a5,a4
 850:	0007c783          	lbu	a5,0(a5)
 854:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
 858:	fe042783          	lw	a5,-32(s0)
 85c:	2781                	sext.w	a5,a5
 85e:	eb9d                	bnez	a5,894 <vprintf+0x6e>
      if(c == '%'){
 860:	fdc42783          	lw	a5,-36(s0)
 864:	0007871b          	sext.w	a4,a5
 868:	02500793          	li	a5,37
 86c:	00f71763          	bne	a4,a5,87a <vprintf+0x54>
        state = '%';
 870:	02500793          	li	a5,37
 874:	fef42023          	sw	a5,-32(s0)
 878:	a2f5                	j	a64 <vprintf+0x23e>
      } else {
        putc(fd, c);
 87a:	fdc42783          	lw	a5,-36(s0)
 87e:	0ff7f713          	andi	a4,a5,255
 882:	fcc42783          	lw	a5,-52(s0)
 886:	85ba                	mv	a1,a4
 888:	853e                	mv	a0,a5
 88a:	00000097          	auipc	ra,0x0
 88e:	dcc080e7          	jalr	-564(ra) # 656 <putc>
 892:	aac9                	j	a64 <vprintf+0x23e>
      }
    } else if(state == '%'){
 894:	fe042783          	lw	a5,-32(s0)
 898:	0007871b          	sext.w	a4,a5
 89c:	02500793          	li	a5,37
 8a0:	1cf71263          	bne	a4,a5,a64 <vprintf+0x23e>
      if(c == 'd'){
 8a4:	fdc42783          	lw	a5,-36(s0)
 8a8:	0007871b          	sext.w	a4,a5
 8ac:	06400793          	li	a5,100
 8b0:	02f71463          	bne	a4,a5,8d8 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
 8b4:	fb843783          	ld	a5,-72(s0)
 8b8:	00878713          	addi	a4,a5,8
 8bc:	fae43c23          	sd	a4,-72(s0)
 8c0:	4398                	lw	a4,0(a5)
 8c2:	fcc42783          	lw	a5,-52(s0)
 8c6:	4685                	li	a3,1
 8c8:	4629                	li	a2,10
 8ca:	85ba                	mv	a1,a4
 8cc:	853e                	mv	a0,a5
 8ce:	00000097          	auipc	ra,0x0
 8d2:	dbe080e7          	jalr	-578(ra) # 68c <printint>
 8d6:	a269                	j	a60 <vprintf+0x23a>
      } else if(c == 'l') {
 8d8:	fdc42783          	lw	a5,-36(s0)
 8dc:	0007871b          	sext.w	a4,a5
 8e0:	06c00793          	li	a5,108
 8e4:	02f71663          	bne	a4,a5,910 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
 8e8:	fb843783          	ld	a5,-72(s0)
 8ec:	00878713          	addi	a4,a5,8
 8f0:	fae43c23          	sd	a4,-72(s0)
 8f4:	639c                	ld	a5,0(a5)
 8f6:	0007871b          	sext.w	a4,a5
 8fa:	fcc42783          	lw	a5,-52(s0)
 8fe:	4681                	li	a3,0
 900:	4629                	li	a2,10
 902:	85ba                	mv	a1,a4
 904:	853e                	mv	a0,a5
 906:	00000097          	auipc	ra,0x0
 90a:	d86080e7          	jalr	-634(ra) # 68c <printint>
 90e:	aa89                	j	a60 <vprintf+0x23a>
      } else if(c == 'x') {
 910:	fdc42783          	lw	a5,-36(s0)
 914:	0007871b          	sext.w	a4,a5
 918:	07800793          	li	a5,120
 91c:	02f71463          	bne	a4,a5,944 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
 920:	fb843783          	ld	a5,-72(s0)
 924:	00878713          	addi	a4,a5,8
 928:	fae43c23          	sd	a4,-72(s0)
 92c:	4398                	lw	a4,0(a5)
 92e:	fcc42783          	lw	a5,-52(s0)
 932:	4681                	li	a3,0
 934:	4641                	li	a2,16
 936:	85ba                	mv	a1,a4
 938:	853e                	mv	a0,a5
 93a:	00000097          	auipc	ra,0x0
 93e:	d52080e7          	jalr	-686(ra) # 68c <printint>
 942:	aa39                	j	a60 <vprintf+0x23a>
      } else if(c == 'p') {
 944:	fdc42783          	lw	a5,-36(s0)
 948:	0007871b          	sext.w	a4,a5
 94c:	07000793          	li	a5,112
 950:	02f71263          	bne	a4,a5,974 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
 954:	fb843783          	ld	a5,-72(s0)
 958:	00878713          	addi	a4,a5,8
 95c:	fae43c23          	sd	a4,-72(s0)
 960:	6398                	ld	a4,0(a5)
 962:	fcc42783          	lw	a5,-52(s0)
 966:	85ba                	mv	a1,a4
 968:	853e                	mv	a0,a5
 96a:	00000097          	auipc	ra,0x0
 96e:	e30080e7          	jalr	-464(ra) # 79a <printptr>
 972:	a0fd                	j	a60 <vprintf+0x23a>
      } else if(c == 's'){
 974:	fdc42783          	lw	a5,-36(s0)
 978:	0007871b          	sext.w	a4,a5
 97c:	07300793          	li	a5,115
 980:	04f71c63          	bne	a4,a5,9d8 <vprintf+0x1b2>
        s = va_arg(ap, char*);
 984:	fb843783          	ld	a5,-72(s0)
 988:	00878713          	addi	a4,a5,8
 98c:	fae43c23          	sd	a4,-72(s0)
 990:	639c                	ld	a5,0(a5)
 992:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
 996:	fe843783          	ld	a5,-24(s0)
 99a:	eb8d                	bnez	a5,9cc <vprintf+0x1a6>
          s = "(null)";
 99c:	00000797          	auipc	a5,0x0
 9a0:	4f478793          	addi	a5,a5,1268 # e90 <malloc+0x1ba>
 9a4:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 9a8:	a015                	j	9cc <vprintf+0x1a6>
          putc(fd, *s);
 9aa:	fe843783          	ld	a5,-24(s0)
 9ae:	0007c703          	lbu	a4,0(a5)
 9b2:	fcc42783          	lw	a5,-52(s0)
 9b6:	85ba                	mv	a1,a4
 9b8:	853e                	mv	a0,a5
 9ba:	00000097          	auipc	ra,0x0
 9be:	c9c080e7          	jalr	-868(ra) # 656 <putc>
          s++;
 9c2:	fe843783          	ld	a5,-24(s0)
 9c6:	0785                	addi	a5,a5,1
 9c8:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
 9cc:	fe843783          	ld	a5,-24(s0)
 9d0:	0007c783          	lbu	a5,0(a5)
 9d4:	fbf9                	bnez	a5,9aa <vprintf+0x184>
 9d6:	a069                	j	a60 <vprintf+0x23a>
        }
      } else if(c == 'c'){
 9d8:	fdc42783          	lw	a5,-36(s0)
 9dc:	0007871b          	sext.w	a4,a5
 9e0:	06300793          	li	a5,99
 9e4:	02f71463          	bne	a4,a5,a0c <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
 9e8:	fb843783          	ld	a5,-72(s0)
 9ec:	00878713          	addi	a4,a5,8
 9f0:	fae43c23          	sd	a4,-72(s0)
 9f4:	439c                	lw	a5,0(a5)
 9f6:	0ff7f713          	andi	a4,a5,255
 9fa:	fcc42783          	lw	a5,-52(s0)
 9fe:	85ba                	mv	a1,a4
 a00:	853e                	mv	a0,a5
 a02:	00000097          	auipc	ra,0x0
 a06:	c54080e7          	jalr	-940(ra) # 656 <putc>
 a0a:	a899                	j	a60 <vprintf+0x23a>
      } else if(c == '%'){
 a0c:	fdc42783          	lw	a5,-36(s0)
 a10:	0007871b          	sext.w	a4,a5
 a14:	02500793          	li	a5,37
 a18:	00f71f63          	bne	a4,a5,a36 <vprintf+0x210>
        putc(fd, c);
 a1c:	fdc42783          	lw	a5,-36(s0)
 a20:	0ff7f713          	andi	a4,a5,255
 a24:	fcc42783          	lw	a5,-52(s0)
 a28:	85ba                	mv	a1,a4
 a2a:	853e                	mv	a0,a5
 a2c:	00000097          	auipc	ra,0x0
 a30:	c2a080e7          	jalr	-982(ra) # 656 <putc>
 a34:	a035                	j	a60 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 a36:	fcc42783          	lw	a5,-52(s0)
 a3a:	02500593          	li	a1,37
 a3e:	853e                	mv	a0,a5
 a40:	00000097          	auipc	ra,0x0
 a44:	c16080e7          	jalr	-1002(ra) # 656 <putc>
        putc(fd, c);
 a48:	fdc42783          	lw	a5,-36(s0)
 a4c:	0ff7f713          	andi	a4,a5,255
 a50:	fcc42783          	lw	a5,-52(s0)
 a54:	85ba                	mv	a1,a4
 a56:	853e                	mv	a0,a5
 a58:	00000097          	auipc	ra,0x0
 a5c:	bfe080e7          	jalr	-1026(ra) # 656 <putc>
      }
      state = 0;
 a60:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
 a64:	fe442783          	lw	a5,-28(s0)
 a68:	2785                	addiw	a5,a5,1
 a6a:	fef42223          	sw	a5,-28(s0)
 a6e:	fe442783          	lw	a5,-28(s0)
 a72:	fc043703          	ld	a4,-64(s0)
 a76:	97ba                	add	a5,a5,a4
 a78:	0007c783          	lbu	a5,0(a5)
 a7c:	dc0795e3          	bnez	a5,846 <vprintf+0x20>
    }
  }
}
 a80:	0001                	nop
 a82:	0001                	nop
 a84:	60a6                	ld	ra,72(sp)
 a86:	6406                	ld	s0,64(sp)
 a88:	6161                	addi	sp,sp,80
 a8a:	8082                	ret

0000000000000a8c <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 a8c:	7159                	addi	sp,sp,-112
 a8e:	fc06                	sd	ra,56(sp)
 a90:	f822                	sd	s0,48(sp)
 a92:	0080                	addi	s0,sp,64
 a94:	fcb43823          	sd	a1,-48(s0)
 a98:	e010                	sd	a2,0(s0)
 a9a:	e414                	sd	a3,8(s0)
 a9c:	e818                	sd	a4,16(s0)
 a9e:	ec1c                	sd	a5,24(s0)
 aa0:	03043023          	sd	a6,32(s0)
 aa4:	03143423          	sd	a7,40(s0)
 aa8:	87aa                	mv	a5,a0
 aaa:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
 aae:	03040793          	addi	a5,s0,48
 ab2:	fcf43423          	sd	a5,-56(s0)
 ab6:	fc843783          	ld	a5,-56(s0)
 aba:	fd078793          	addi	a5,a5,-48
 abe:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
 ac2:	fe843703          	ld	a4,-24(s0)
 ac6:	fdc42783          	lw	a5,-36(s0)
 aca:	863a                	mv	a2,a4
 acc:	fd043583          	ld	a1,-48(s0)
 ad0:	853e                	mv	a0,a5
 ad2:	00000097          	auipc	ra,0x0
 ad6:	d54080e7          	jalr	-684(ra) # 826 <vprintf>
}
 ada:	0001                	nop
 adc:	70e2                	ld	ra,56(sp)
 ade:	7442                	ld	s0,48(sp)
 ae0:	6165                	addi	sp,sp,112
 ae2:	8082                	ret

0000000000000ae4 <printf>:

void
printf(const char *fmt, ...)
{
 ae4:	7159                	addi	sp,sp,-112
 ae6:	f406                	sd	ra,40(sp)
 ae8:	f022                	sd	s0,32(sp)
 aea:	1800                	addi	s0,sp,48
 aec:	fca43c23          	sd	a0,-40(s0)
 af0:	e40c                	sd	a1,8(s0)
 af2:	e810                	sd	a2,16(s0)
 af4:	ec14                	sd	a3,24(s0)
 af6:	f018                	sd	a4,32(s0)
 af8:	f41c                	sd	a5,40(s0)
 afa:	03043823          	sd	a6,48(s0)
 afe:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 b02:	04040793          	addi	a5,s0,64
 b06:	fcf43823          	sd	a5,-48(s0)
 b0a:	fd043783          	ld	a5,-48(s0)
 b0e:	fc878793          	addi	a5,a5,-56
 b12:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
 b16:	fe843783          	ld	a5,-24(s0)
 b1a:	863e                	mv	a2,a5
 b1c:	fd843583          	ld	a1,-40(s0)
 b20:	4505                	li	a0,1
 b22:	00000097          	auipc	ra,0x0
 b26:	d04080e7          	jalr	-764(ra) # 826 <vprintf>
}
 b2a:	0001                	nop
 b2c:	70a2                	ld	ra,40(sp)
 b2e:	7402                	ld	s0,32(sp)
 b30:	6165                	addi	sp,sp,112
 b32:	8082                	ret

0000000000000b34 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b34:	7179                	addi	sp,sp,-48
 b36:	f422                	sd	s0,40(sp)
 b38:	1800                	addi	s0,sp,48
 b3a:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
 b3e:	fd843783          	ld	a5,-40(s0)
 b42:	17c1                	addi	a5,a5,-16
 b44:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b48:	00000797          	auipc	a5,0x0
 b4c:	38878793          	addi	a5,a5,904 # ed0 <freep>
 b50:	639c                	ld	a5,0(a5)
 b52:	fef43423          	sd	a5,-24(s0)
 b56:	a815                	j	b8a <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b58:	fe843783          	ld	a5,-24(s0)
 b5c:	639c                	ld	a5,0(a5)
 b5e:	fe843703          	ld	a4,-24(s0)
 b62:	00f76f63          	bltu	a4,a5,b80 <free+0x4c>
 b66:	fe043703          	ld	a4,-32(s0)
 b6a:	fe843783          	ld	a5,-24(s0)
 b6e:	02e7eb63          	bltu	a5,a4,ba4 <free+0x70>
 b72:	fe843783          	ld	a5,-24(s0)
 b76:	639c                	ld	a5,0(a5)
 b78:	fe043703          	ld	a4,-32(s0)
 b7c:	02f76463          	bltu	a4,a5,ba4 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b80:	fe843783          	ld	a5,-24(s0)
 b84:	639c                	ld	a5,0(a5)
 b86:	fef43423          	sd	a5,-24(s0)
 b8a:	fe043703          	ld	a4,-32(s0)
 b8e:	fe843783          	ld	a5,-24(s0)
 b92:	fce7f3e3          	bgeu	a5,a4,b58 <free+0x24>
 b96:	fe843783          	ld	a5,-24(s0)
 b9a:	639c                	ld	a5,0(a5)
 b9c:	fe043703          	ld	a4,-32(s0)
 ba0:	faf77ce3          	bgeu	a4,a5,b58 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ba4:	fe043783          	ld	a5,-32(s0)
 ba8:	479c                	lw	a5,8(a5)
 baa:	1782                	slli	a5,a5,0x20
 bac:	9381                	srli	a5,a5,0x20
 bae:	0792                	slli	a5,a5,0x4
 bb0:	fe043703          	ld	a4,-32(s0)
 bb4:	973e                	add	a4,a4,a5
 bb6:	fe843783          	ld	a5,-24(s0)
 bba:	639c                	ld	a5,0(a5)
 bbc:	02f71763          	bne	a4,a5,bea <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
 bc0:	fe043783          	ld	a5,-32(s0)
 bc4:	4798                	lw	a4,8(a5)
 bc6:	fe843783          	ld	a5,-24(s0)
 bca:	639c                	ld	a5,0(a5)
 bcc:	479c                	lw	a5,8(a5)
 bce:	9fb9                	addw	a5,a5,a4
 bd0:	0007871b          	sext.w	a4,a5
 bd4:	fe043783          	ld	a5,-32(s0)
 bd8:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
 bda:	fe843783          	ld	a5,-24(s0)
 bde:	639c                	ld	a5,0(a5)
 be0:	6398                	ld	a4,0(a5)
 be2:	fe043783          	ld	a5,-32(s0)
 be6:	e398                	sd	a4,0(a5)
 be8:	a039                	j	bf6 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
 bea:	fe843783          	ld	a5,-24(s0)
 bee:	6398                	ld	a4,0(a5)
 bf0:	fe043783          	ld	a5,-32(s0)
 bf4:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
 bf6:	fe843783          	ld	a5,-24(s0)
 bfa:	479c                	lw	a5,8(a5)
 bfc:	1782                	slli	a5,a5,0x20
 bfe:	9381                	srli	a5,a5,0x20
 c00:	0792                	slli	a5,a5,0x4
 c02:	fe843703          	ld	a4,-24(s0)
 c06:	97ba                	add	a5,a5,a4
 c08:	fe043703          	ld	a4,-32(s0)
 c0c:	02f71563          	bne	a4,a5,c36 <free+0x102>
    p->s.size += bp->s.size;
 c10:	fe843783          	ld	a5,-24(s0)
 c14:	4798                	lw	a4,8(a5)
 c16:	fe043783          	ld	a5,-32(s0)
 c1a:	479c                	lw	a5,8(a5)
 c1c:	9fb9                	addw	a5,a5,a4
 c1e:	0007871b          	sext.w	a4,a5
 c22:	fe843783          	ld	a5,-24(s0)
 c26:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 c28:	fe043783          	ld	a5,-32(s0)
 c2c:	6398                	ld	a4,0(a5)
 c2e:	fe843783          	ld	a5,-24(s0)
 c32:	e398                	sd	a4,0(a5)
 c34:	a031                	j	c40 <free+0x10c>
  } else
    p->s.ptr = bp;
 c36:	fe843783          	ld	a5,-24(s0)
 c3a:	fe043703          	ld	a4,-32(s0)
 c3e:	e398                	sd	a4,0(a5)
  freep = p;
 c40:	00000797          	auipc	a5,0x0
 c44:	29078793          	addi	a5,a5,656 # ed0 <freep>
 c48:	fe843703          	ld	a4,-24(s0)
 c4c:	e398                	sd	a4,0(a5)
}
 c4e:	0001                	nop
 c50:	7422                	ld	s0,40(sp)
 c52:	6145                	addi	sp,sp,48
 c54:	8082                	ret

0000000000000c56 <morecore>:

static Header*
morecore(uint nu)
{
 c56:	7179                	addi	sp,sp,-48
 c58:	f406                	sd	ra,40(sp)
 c5a:	f022                	sd	s0,32(sp)
 c5c:	1800                	addi	s0,sp,48
 c5e:	87aa                	mv	a5,a0
 c60:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
 c64:	fdc42783          	lw	a5,-36(s0)
 c68:	0007871b          	sext.w	a4,a5
 c6c:	6785                	lui	a5,0x1
 c6e:	00f77563          	bgeu	a4,a5,c78 <morecore+0x22>
    nu = 4096;
 c72:	6785                	lui	a5,0x1
 c74:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
 c78:	fdc42783          	lw	a5,-36(s0)
 c7c:	0047979b          	slliw	a5,a5,0x4
 c80:	2781                	sext.w	a5,a5
 c82:	2781                	sext.w	a5,a5
 c84:	853e                	mv	a0,a5
 c86:	00000097          	auipc	ra,0x0
 c8a:	9b0080e7          	jalr	-1616(ra) # 636 <sbrk>
 c8e:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
 c92:	fe843703          	ld	a4,-24(s0)
 c96:	57fd                	li	a5,-1
 c98:	00f71463          	bne	a4,a5,ca0 <morecore+0x4a>
    return 0;
 c9c:	4781                	li	a5,0
 c9e:	a03d                	j	ccc <morecore+0x76>
  hp = (Header*)p;
 ca0:	fe843783          	ld	a5,-24(s0)
 ca4:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
 ca8:	fe043783          	ld	a5,-32(s0)
 cac:	fdc42703          	lw	a4,-36(s0)
 cb0:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
 cb2:	fe043783          	ld	a5,-32(s0)
 cb6:	07c1                	addi	a5,a5,16
 cb8:	853e                	mv	a0,a5
 cba:	00000097          	auipc	ra,0x0
 cbe:	e7a080e7          	jalr	-390(ra) # b34 <free>
  return freep;
 cc2:	00000797          	auipc	a5,0x0
 cc6:	20e78793          	addi	a5,a5,526 # ed0 <freep>
 cca:	639c                	ld	a5,0(a5)
}
 ccc:	853e                	mv	a0,a5
 cce:	70a2                	ld	ra,40(sp)
 cd0:	7402                	ld	s0,32(sp)
 cd2:	6145                	addi	sp,sp,48
 cd4:	8082                	ret

0000000000000cd6 <malloc>:

void*
malloc(uint nbytes)
{
 cd6:	7139                	addi	sp,sp,-64
 cd8:	fc06                	sd	ra,56(sp)
 cda:	f822                	sd	s0,48(sp)
 cdc:	0080                	addi	s0,sp,64
 cde:	87aa                	mv	a5,a0
 ce0:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ce4:	fcc46783          	lwu	a5,-52(s0)
 ce8:	07bd                	addi	a5,a5,15
 cea:	8391                	srli	a5,a5,0x4
 cec:	2781                	sext.w	a5,a5
 cee:	2785                	addiw	a5,a5,1
 cf0:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
 cf4:	00000797          	auipc	a5,0x0
 cf8:	1dc78793          	addi	a5,a5,476 # ed0 <freep>
 cfc:	639c                	ld	a5,0(a5)
 cfe:	fef43023          	sd	a5,-32(s0)
 d02:	fe043783          	ld	a5,-32(s0)
 d06:	ef95                	bnez	a5,d42 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
 d08:	00000797          	auipc	a5,0x0
 d0c:	1b878793          	addi	a5,a5,440 # ec0 <base>
 d10:	fef43023          	sd	a5,-32(s0)
 d14:	00000797          	auipc	a5,0x0
 d18:	1bc78793          	addi	a5,a5,444 # ed0 <freep>
 d1c:	fe043703          	ld	a4,-32(s0)
 d20:	e398                	sd	a4,0(a5)
 d22:	00000797          	auipc	a5,0x0
 d26:	1ae78793          	addi	a5,a5,430 # ed0 <freep>
 d2a:	6398                	ld	a4,0(a5)
 d2c:	00000797          	auipc	a5,0x0
 d30:	19478793          	addi	a5,a5,404 # ec0 <base>
 d34:	e398                	sd	a4,0(a5)
    base.s.size = 0;
 d36:	00000797          	auipc	a5,0x0
 d3a:	18a78793          	addi	a5,a5,394 # ec0 <base>
 d3e:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d42:	fe043783          	ld	a5,-32(s0)
 d46:	639c                	ld	a5,0(a5)
 d48:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 d4c:	fe843783          	ld	a5,-24(s0)
 d50:	4798                	lw	a4,8(a5)
 d52:	fdc42783          	lw	a5,-36(s0)
 d56:	2781                	sext.w	a5,a5
 d58:	06f76863          	bltu	a4,a5,dc8 <malloc+0xf2>
      if(p->s.size == nunits)
 d5c:	fe843783          	ld	a5,-24(s0)
 d60:	4798                	lw	a4,8(a5)
 d62:	fdc42783          	lw	a5,-36(s0)
 d66:	2781                	sext.w	a5,a5
 d68:	00e79963          	bne	a5,a4,d7a <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
 d6c:	fe843783          	ld	a5,-24(s0)
 d70:	6398                	ld	a4,0(a5)
 d72:	fe043783          	ld	a5,-32(s0)
 d76:	e398                	sd	a4,0(a5)
 d78:	a82d                	j	db2 <malloc+0xdc>
      else {
        p->s.size -= nunits;
 d7a:	fe843783          	ld	a5,-24(s0)
 d7e:	4798                	lw	a4,8(a5)
 d80:	fdc42783          	lw	a5,-36(s0)
 d84:	40f707bb          	subw	a5,a4,a5
 d88:	0007871b          	sext.w	a4,a5
 d8c:	fe843783          	ld	a5,-24(s0)
 d90:	c798                	sw	a4,8(a5)
        p += p->s.size;
 d92:	fe843783          	ld	a5,-24(s0)
 d96:	479c                	lw	a5,8(a5)
 d98:	1782                	slli	a5,a5,0x20
 d9a:	9381                	srli	a5,a5,0x20
 d9c:	0792                	slli	a5,a5,0x4
 d9e:	fe843703          	ld	a4,-24(s0)
 da2:	97ba                	add	a5,a5,a4
 da4:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
 da8:	fe843783          	ld	a5,-24(s0)
 dac:	fdc42703          	lw	a4,-36(s0)
 db0:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
 db2:	00000797          	auipc	a5,0x0
 db6:	11e78793          	addi	a5,a5,286 # ed0 <freep>
 dba:	fe043703          	ld	a4,-32(s0)
 dbe:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
 dc0:	fe843783          	ld	a5,-24(s0)
 dc4:	07c1                	addi	a5,a5,16
 dc6:	a091                	j	e0a <malloc+0x134>
    }
    if(p == freep)
 dc8:	00000797          	auipc	a5,0x0
 dcc:	10878793          	addi	a5,a5,264 # ed0 <freep>
 dd0:	639c                	ld	a5,0(a5)
 dd2:	fe843703          	ld	a4,-24(s0)
 dd6:	02f71063          	bne	a4,a5,df6 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
 dda:	fdc42783          	lw	a5,-36(s0)
 dde:	853e                	mv	a0,a5
 de0:	00000097          	auipc	ra,0x0
 de4:	e76080e7          	jalr	-394(ra) # c56 <morecore>
 de8:	fea43423          	sd	a0,-24(s0)
 dec:	fe843783          	ld	a5,-24(s0)
 df0:	e399                	bnez	a5,df6 <malloc+0x120>
        return 0;
 df2:	4781                	li	a5,0
 df4:	a819                	j	e0a <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 df6:	fe843783          	ld	a5,-24(s0)
 dfa:	fef43023          	sd	a5,-32(s0)
 dfe:	fe843783          	ld	a5,-24(s0)
 e02:	639c                	ld	a5,0(a5)
 e04:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
 e08:	b791                	j	d4c <malloc+0x76>
  }
}
 e0a:	853e                	mv	a0,a5
 e0c:	70e2                	ld	ra,56(sp)
 e0e:	7442                	ld	s0,48(sp)
 e10:	6121                	addi	sp,sp,64
 e12:	8082                	ret
