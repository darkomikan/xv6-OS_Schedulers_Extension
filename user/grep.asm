
user/_grep:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
       0:	7139                	addi	sp,sp,-64
       2:	fc06                	sd	ra,56(sp)
       4:	f822                	sd	s0,48(sp)
       6:	0080                	addi	s0,sp,64
       8:	fca43423          	sd	a0,-56(s0)
       c:	87ae                	mv	a5,a1
       e:	fcf42223          	sw	a5,-60(s0)
  int n, m;
  char *p, *q;

  m = 0;
      12:	fe042623          	sw	zero,-20(s0)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
      16:	a8f9                	j	f4 <grep+0xf4>
    m += n;
      18:	fec42703          	lw	a4,-20(s0)
      1c:	fdc42783          	lw	a5,-36(s0)
      20:	9fb9                	addw	a5,a5,a4
      22:	fef42623          	sw	a5,-20(s0)
    buf[m] = '\0';
      26:	00001717          	auipc	a4,0x1
      2a:	14270713          	addi	a4,a4,322 # 1168 <buf>
      2e:	fec42783          	lw	a5,-20(s0)
      32:	97ba                	add	a5,a5,a4
      34:	00078023          	sb	zero,0(a5)
    p = buf;
      38:	00001797          	auipc	a5,0x1
      3c:	13078793          	addi	a5,a5,304 # 1168 <buf>
      40:	fef43023          	sd	a5,-32(s0)
    while((q = strchr(p, '\n')) != 0){
      44:	a891                	j	98 <grep+0x98>
      *q = 0;
      46:	fd043783          	ld	a5,-48(s0)
      4a:	00078023          	sb	zero,0(a5)
      if(match(pattern, p)){
      4e:	fe043583          	ld	a1,-32(s0)
      52:	fc843503          	ld	a0,-56(s0)
      56:	00000097          	auipc	ra,0x0
      5a:	1fa080e7          	jalr	506(ra) # 250 <match>
      5e:	87aa                	mv	a5,a0
      60:	c79d                	beqz	a5,8e <grep+0x8e>
        *q = '\n';
      62:	fd043783          	ld	a5,-48(s0)
      66:	4729                	li	a4,10
      68:	00e78023          	sb	a4,0(a5)
        write(1, p, q+1 - p);
      6c:	fd043783          	ld	a5,-48(s0)
      70:	00178713          	addi	a4,a5,1
      74:	fe043783          	ld	a5,-32(s0)
      78:	40f707b3          	sub	a5,a4,a5
      7c:	2781                	sext.w	a5,a5
      7e:	863e                	mv	a2,a5
      80:	fe043583          	ld	a1,-32(s0)
      84:	4505                	li	a0,1
      86:	00001097          	auipc	ra,0x1
      8a:	842080e7          	jalr	-1982(ra) # 8c8 <write>
      }
      p = q+1;
      8e:	fd043783          	ld	a5,-48(s0)
      92:	0785                	addi	a5,a5,1
      94:	fef43023          	sd	a5,-32(s0)
    while((q = strchr(p, '\n')) != 0){
      98:	45a9                	li	a1,10
      9a:	fe043503          	ld	a0,-32(s0)
      9e:	00000097          	auipc	ra,0x0
      a2:	4c0080e7          	jalr	1216(ra) # 55e <strchr>
      a6:	fca43823          	sd	a0,-48(s0)
      aa:	fd043783          	ld	a5,-48(s0)
      ae:	ffc1                	bnez	a5,46 <grep+0x46>
    }
    if(m > 0){
      b0:	fec42783          	lw	a5,-20(s0)
      b4:	2781                	sext.w	a5,a5
      b6:	02f05f63          	blez	a5,f4 <grep+0xf4>
      m -= p - buf;
      ba:	fec42703          	lw	a4,-20(s0)
      be:	fe043683          	ld	a3,-32(s0)
      c2:	00001797          	auipc	a5,0x1
      c6:	0a678793          	addi	a5,a5,166 # 1168 <buf>
      ca:	40f687b3          	sub	a5,a3,a5
      ce:	2781                	sext.w	a5,a5
      d0:	40f707bb          	subw	a5,a4,a5
      d4:	2781                	sext.w	a5,a5
      d6:	fef42623          	sw	a5,-20(s0)
      memmove(buf, p, m);
      da:	fec42783          	lw	a5,-20(s0)
      de:	863e                	mv	a2,a5
      e0:	fe043583          	ld	a1,-32(s0)
      e4:	00001517          	auipc	a0,0x1
      e8:	08450513          	addi	a0,a0,132 # 1168 <buf>
      ec:	00000097          	auipc	ra,0x0
      f0:	636080e7          	jalr	1590(ra) # 722 <memmove>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
      f4:	fec42703          	lw	a4,-20(s0)
      f8:	00001797          	auipc	a5,0x1
      fc:	07078793          	addi	a5,a5,112 # 1168 <buf>
     100:	00f706b3          	add	a3,a4,a5
     104:	fec42783          	lw	a5,-20(s0)
     108:	3ff00713          	li	a4,1023
     10c:	40f707bb          	subw	a5,a4,a5
     110:	2781                	sext.w	a5,a5
     112:	0007871b          	sext.w	a4,a5
     116:	fc442783          	lw	a5,-60(s0)
     11a:	863a                	mv	a2,a4
     11c:	85b6                	mv	a1,a3
     11e:	853e                	mv	a0,a5
     120:	00000097          	auipc	ra,0x0
     124:	7a0080e7          	jalr	1952(ra) # 8c0 <read>
     128:	87aa                	mv	a5,a0
     12a:	fcf42e23          	sw	a5,-36(s0)
     12e:	fdc42783          	lw	a5,-36(s0)
     132:	2781                	sext.w	a5,a5
     134:	eef042e3          	bgtz	a5,18 <grep+0x18>
    }
  }
}
     138:	0001                	nop
     13a:	0001                	nop
     13c:	70e2                	ld	ra,56(sp)
     13e:	7442                	ld	s0,48(sp)
     140:	6121                	addi	sp,sp,64
     142:	8082                	ret

0000000000000144 <main>:

int
main(int argc, char *argv[])
{
     144:	7139                	addi	sp,sp,-64
     146:	fc06                	sd	ra,56(sp)
     148:	f822                	sd	s0,48(sp)
     14a:	0080                	addi	s0,sp,64
     14c:	87aa                	mv	a5,a0
     14e:	fcb43023          	sd	a1,-64(s0)
     152:	fcf42623          	sw	a5,-52(s0)
  int fd, i;
  char *pattern;

  if(argc <= 1){
     156:	fcc42783          	lw	a5,-52(s0)
     15a:	0007871b          	sext.w	a4,a5
     15e:	4785                	li	a5,1
     160:	02e7c063          	blt	a5,a4,180 <main+0x3c>
    fprintf(2, "usage: grep pattern [file ...]\n");
     164:	00001597          	auipc	a1,0x1
     168:	fac58593          	addi	a1,a1,-84 # 1110 <malloc+0x140>
     16c:	4509                	li	a0,2
     16e:	00001097          	auipc	ra,0x1
     172:	c18080e7          	jalr	-1000(ra) # d86 <fprintf>
    exit(1);
     176:	4505                	li	a0,1
     178:	00000097          	auipc	ra,0x0
     17c:	730080e7          	jalr	1840(ra) # 8a8 <exit>
  }
  pattern = argv[1];
     180:	fc043783          	ld	a5,-64(s0)
     184:	679c                	ld	a5,8(a5)
     186:	fef43023          	sd	a5,-32(s0)

  if(argc <= 2){
     18a:	fcc42783          	lw	a5,-52(s0)
     18e:	0007871b          	sext.w	a4,a5
     192:	4789                	li	a5,2
     194:	00e7ce63          	blt	a5,a4,1b0 <main+0x6c>
    grep(pattern, 0);
     198:	4581                	li	a1,0
     19a:	fe043503          	ld	a0,-32(s0)
     19e:	00000097          	auipc	ra,0x0
     1a2:	e62080e7          	jalr	-414(ra) # 0 <grep>
    exit(0);
     1a6:	4501                	li	a0,0
     1a8:	00000097          	auipc	ra,0x0
     1ac:	700080e7          	jalr	1792(ra) # 8a8 <exit>
  }

  for(i = 2; i < argc; i++){
     1b0:	4789                	li	a5,2
     1b2:	fef42623          	sw	a5,-20(s0)
     1b6:	a041                	j	236 <main+0xf2>
    if((fd = open(argv[i], 0)) < 0){
     1b8:	fec42783          	lw	a5,-20(s0)
     1bc:	078e                	slli	a5,a5,0x3
     1be:	fc043703          	ld	a4,-64(s0)
     1c2:	97ba                	add	a5,a5,a4
     1c4:	639c                	ld	a5,0(a5)
     1c6:	4581                	li	a1,0
     1c8:	853e                	mv	a0,a5
     1ca:	00000097          	auipc	ra,0x0
     1ce:	71e080e7          	jalr	1822(ra) # 8e8 <open>
     1d2:	87aa                	mv	a5,a0
     1d4:	fcf42e23          	sw	a5,-36(s0)
     1d8:	fdc42783          	lw	a5,-36(s0)
     1dc:	2781                	sext.w	a5,a5
     1de:	0207d763          	bgez	a5,20c <main+0xc8>
      printf("grep: cannot open %s\n", argv[i]);
     1e2:	fec42783          	lw	a5,-20(s0)
     1e6:	078e                	slli	a5,a5,0x3
     1e8:	fc043703          	ld	a4,-64(s0)
     1ec:	97ba                	add	a5,a5,a4
     1ee:	639c                	ld	a5,0(a5)
     1f0:	85be                	mv	a1,a5
     1f2:	00001517          	auipc	a0,0x1
     1f6:	f3e50513          	addi	a0,a0,-194 # 1130 <malloc+0x160>
     1fa:	00001097          	auipc	ra,0x1
     1fe:	be4080e7          	jalr	-1052(ra) # dde <printf>
      exit(1);
     202:	4505                	li	a0,1
     204:	00000097          	auipc	ra,0x0
     208:	6a4080e7          	jalr	1700(ra) # 8a8 <exit>
    }
    grep(pattern, fd);
     20c:	fdc42783          	lw	a5,-36(s0)
     210:	85be                	mv	a1,a5
     212:	fe043503          	ld	a0,-32(s0)
     216:	00000097          	auipc	ra,0x0
     21a:	dea080e7          	jalr	-534(ra) # 0 <grep>
    close(fd);
     21e:	fdc42783          	lw	a5,-36(s0)
     222:	853e                	mv	a0,a5
     224:	00000097          	auipc	ra,0x0
     228:	6ac080e7          	jalr	1708(ra) # 8d0 <close>
  for(i = 2; i < argc; i++){
     22c:	fec42783          	lw	a5,-20(s0)
     230:	2785                	addiw	a5,a5,1
     232:	fef42623          	sw	a5,-20(s0)
     236:	fec42703          	lw	a4,-20(s0)
     23a:	fcc42783          	lw	a5,-52(s0)
     23e:	2701                	sext.w	a4,a4
     240:	2781                	sext.w	a5,a5
     242:	f6f74be3          	blt	a4,a5,1b8 <main+0x74>
  }
  exit(0);
     246:	4501                	li	a0,0
     248:	00000097          	auipc	ra,0x0
     24c:	660080e7          	jalr	1632(ra) # 8a8 <exit>

0000000000000250 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
     250:	1101                	addi	sp,sp,-32
     252:	ec06                	sd	ra,24(sp)
     254:	e822                	sd	s0,16(sp)
     256:	1000                	addi	s0,sp,32
     258:	fea43423          	sd	a0,-24(s0)
     25c:	feb43023          	sd	a1,-32(s0)
  if(re[0] == '^')
     260:	fe843783          	ld	a5,-24(s0)
     264:	0007c783          	lbu	a5,0(a5)
     268:	873e                	mv	a4,a5
     26a:	05e00793          	li	a5,94
     26e:	00f71e63          	bne	a4,a5,28a <match+0x3a>
    return matchhere(re+1, text);
     272:	fe843783          	ld	a5,-24(s0)
     276:	0785                	addi	a5,a5,1
     278:	fe043583          	ld	a1,-32(s0)
     27c:	853e                	mv	a0,a5
     27e:	00000097          	auipc	ra,0x0
     282:	042080e7          	jalr	66(ra) # 2c0 <matchhere>
     286:	87aa                	mv	a5,a0
     288:	a03d                	j	2b6 <match+0x66>
  do{  // must look at empty string
    if(matchhere(re, text))
     28a:	fe043583          	ld	a1,-32(s0)
     28e:	fe843503          	ld	a0,-24(s0)
     292:	00000097          	auipc	ra,0x0
     296:	02e080e7          	jalr	46(ra) # 2c0 <matchhere>
     29a:	87aa                	mv	a5,a0
     29c:	c399                	beqz	a5,2a2 <match+0x52>
      return 1;
     29e:	4785                	li	a5,1
     2a0:	a819                	j	2b6 <match+0x66>
  }while(*text++ != '\0');
     2a2:	fe043783          	ld	a5,-32(s0)
     2a6:	00178713          	addi	a4,a5,1
     2aa:	fee43023          	sd	a4,-32(s0)
     2ae:	0007c783          	lbu	a5,0(a5)
     2b2:	ffe1                	bnez	a5,28a <match+0x3a>
  return 0;
     2b4:	4781                	li	a5,0
}
     2b6:	853e                	mv	a0,a5
     2b8:	60e2                	ld	ra,24(sp)
     2ba:	6442                	ld	s0,16(sp)
     2bc:	6105                	addi	sp,sp,32
     2be:	8082                	ret

00000000000002c0 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
     2c0:	1101                	addi	sp,sp,-32
     2c2:	ec06                	sd	ra,24(sp)
     2c4:	e822                	sd	s0,16(sp)
     2c6:	1000                	addi	s0,sp,32
     2c8:	fea43423          	sd	a0,-24(s0)
     2cc:	feb43023          	sd	a1,-32(s0)
  if(re[0] == '\0')
     2d0:	fe843783          	ld	a5,-24(s0)
     2d4:	0007c783          	lbu	a5,0(a5)
     2d8:	e399                	bnez	a5,2de <matchhere+0x1e>
    return 1;
     2da:	4785                	li	a5,1
     2dc:	a0c1                	j	39c <matchhere+0xdc>
  if(re[1] == '*')
     2de:	fe843783          	ld	a5,-24(s0)
     2e2:	0785                	addi	a5,a5,1
     2e4:	0007c783          	lbu	a5,0(a5)
     2e8:	873e                	mv	a4,a5
     2ea:	02a00793          	li	a5,42
     2ee:	02f71563          	bne	a4,a5,318 <matchhere+0x58>
    return matchstar(re[0], re+2, text);
     2f2:	fe843783          	ld	a5,-24(s0)
     2f6:	0007c783          	lbu	a5,0(a5)
     2fa:	0007871b          	sext.w	a4,a5
     2fe:	fe843783          	ld	a5,-24(s0)
     302:	0789                	addi	a5,a5,2
     304:	fe043603          	ld	a2,-32(s0)
     308:	85be                	mv	a1,a5
     30a:	853a                	mv	a0,a4
     30c:	00000097          	auipc	ra,0x0
     310:	09a080e7          	jalr	154(ra) # 3a6 <matchstar>
     314:	87aa                	mv	a5,a0
     316:	a059                	j	39c <matchhere+0xdc>
  if(re[0] == '$' && re[1] == '\0')
     318:	fe843783          	ld	a5,-24(s0)
     31c:	0007c783          	lbu	a5,0(a5)
     320:	873e                	mv	a4,a5
     322:	02400793          	li	a5,36
     326:	02f71363          	bne	a4,a5,34c <matchhere+0x8c>
     32a:	fe843783          	ld	a5,-24(s0)
     32e:	0785                	addi	a5,a5,1
     330:	0007c783          	lbu	a5,0(a5)
     334:	ef81                	bnez	a5,34c <matchhere+0x8c>
    return *text == '\0';
     336:	fe043783          	ld	a5,-32(s0)
     33a:	0007c783          	lbu	a5,0(a5)
     33e:	2781                	sext.w	a5,a5
     340:	0017b793          	seqz	a5,a5
     344:	0ff7f793          	andi	a5,a5,255
     348:	2781                	sext.w	a5,a5
     34a:	a889                	j	39c <matchhere+0xdc>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
     34c:	fe043783          	ld	a5,-32(s0)
     350:	0007c783          	lbu	a5,0(a5)
     354:	c3b9                	beqz	a5,39a <matchhere+0xda>
     356:	fe843783          	ld	a5,-24(s0)
     35a:	0007c783          	lbu	a5,0(a5)
     35e:	873e                	mv	a4,a5
     360:	02e00793          	li	a5,46
     364:	00f70c63          	beq	a4,a5,37c <matchhere+0xbc>
     368:	fe843783          	ld	a5,-24(s0)
     36c:	0007c703          	lbu	a4,0(a5)
     370:	fe043783          	ld	a5,-32(s0)
     374:	0007c783          	lbu	a5,0(a5)
     378:	02f71163          	bne	a4,a5,39a <matchhere+0xda>
    return matchhere(re+1, text+1);
     37c:	fe843783          	ld	a5,-24(s0)
     380:	00178713          	addi	a4,a5,1
     384:	fe043783          	ld	a5,-32(s0)
     388:	0785                	addi	a5,a5,1
     38a:	85be                	mv	a1,a5
     38c:	853a                	mv	a0,a4
     38e:	00000097          	auipc	ra,0x0
     392:	f32080e7          	jalr	-206(ra) # 2c0 <matchhere>
     396:	87aa                	mv	a5,a0
     398:	a011                	j	39c <matchhere+0xdc>
  return 0;
     39a:	4781                	li	a5,0
}
     39c:	853e                	mv	a0,a5
     39e:	60e2                	ld	ra,24(sp)
     3a0:	6442                	ld	s0,16(sp)
     3a2:	6105                	addi	sp,sp,32
     3a4:	8082                	ret

00000000000003a6 <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
     3a6:	7179                	addi	sp,sp,-48
     3a8:	f406                	sd	ra,40(sp)
     3aa:	f022                	sd	s0,32(sp)
     3ac:	1800                	addi	s0,sp,48
     3ae:	87aa                	mv	a5,a0
     3b0:	feb43023          	sd	a1,-32(s0)
     3b4:	fcc43c23          	sd	a2,-40(s0)
     3b8:	fef42623          	sw	a5,-20(s0)
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
     3bc:	fd843583          	ld	a1,-40(s0)
     3c0:	fe043503          	ld	a0,-32(s0)
     3c4:	00000097          	auipc	ra,0x0
     3c8:	efc080e7          	jalr	-260(ra) # 2c0 <matchhere>
     3cc:	87aa                	mv	a5,a0
     3ce:	c399                	beqz	a5,3d4 <matchstar+0x2e>
      return 1;
     3d0:	4785                	li	a5,1
     3d2:	a835                	j	40e <matchstar+0x68>
  }while(*text!='\0' && (*text++==c || c=='.'));
     3d4:	fd843783          	ld	a5,-40(s0)
     3d8:	0007c783          	lbu	a5,0(a5)
     3dc:	cb85                	beqz	a5,40c <matchstar+0x66>
     3de:	fd843783          	ld	a5,-40(s0)
     3e2:	00178713          	addi	a4,a5,1
     3e6:	fce43c23          	sd	a4,-40(s0)
     3ea:	0007c783          	lbu	a5,0(a5)
     3ee:	0007871b          	sext.w	a4,a5
     3f2:	fec42783          	lw	a5,-20(s0)
     3f6:	2781                	sext.w	a5,a5
     3f8:	fce782e3          	beq	a5,a4,3bc <matchstar+0x16>
     3fc:	fec42783          	lw	a5,-20(s0)
     400:	0007871b          	sext.w	a4,a5
     404:	02e00793          	li	a5,46
     408:	faf70ae3          	beq	a4,a5,3bc <matchstar+0x16>
  return 0;
     40c:	4781                	li	a5,0
}
     40e:	853e                	mv	a0,a5
     410:	70a2                	ld	ra,40(sp)
     412:	7402                	ld	s0,32(sp)
     414:	6145                	addi	sp,sp,48
     416:	8082                	ret

0000000000000418 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     418:	7179                	addi	sp,sp,-48
     41a:	f422                	sd	s0,40(sp)
     41c:	1800                	addi	s0,sp,48
     41e:	fca43c23          	sd	a0,-40(s0)
     422:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     426:	fd843783          	ld	a5,-40(s0)
     42a:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     42e:	0001                	nop
     430:	fd043703          	ld	a4,-48(s0)
     434:	00170793          	addi	a5,a4,1
     438:	fcf43823          	sd	a5,-48(s0)
     43c:	fd843783          	ld	a5,-40(s0)
     440:	00178693          	addi	a3,a5,1
     444:	fcd43c23          	sd	a3,-40(s0)
     448:	00074703          	lbu	a4,0(a4)
     44c:	00e78023          	sb	a4,0(a5)
     450:	0007c783          	lbu	a5,0(a5)
     454:	fff1                	bnez	a5,430 <strcpy+0x18>
    ;
  return os;
     456:	fe843783          	ld	a5,-24(s0)
}
     45a:	853e                	mv	a0,a5
     45c:	7422                	ld	s0,40(sp)
     45e:	6145                	addi	sp,sp,48
     460:	8082                	ret

0000000000000462 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     462:	1101                	addi	sp,sp,-32
     464:	ec22                	sd	s0,24(sp)
     466:	1000                	addi	s0,sp,32
     468:	fea43423          	sd	a0,-24(s0)
     46c:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     470:	a819                	j	486 <strcmp+0x24>
    p++, q++;
     472:	fe843783          	ld	a5,-24(s0)
     476:	0785                	addi	a5,a5,1
     478:	fef43423          	sd	a5,-24(s0)
     47c:	fe043783          	ld	a5,-32(s0)
     480:	0785                	addi	a5,a5,1
     482:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     486:	fe843783          	ld	a5,-24(s0)
     48a:	0007c783          	lbu	a5,0(a5)
     48e:	cb99                	beqz	a5,4a4 <strcmp+0x42>
     490:	fe843783          	ld	a5,-24(s0)
     494:	0007c703          	lbu	a4,0(a5)
     498:	fe043783          	ld	a5,-32(s0)
     49c:	0007c783          	lbu	a5,0(a5)
     4a0:	fcf709e3          	beq	a4,a5,472 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     4a4:	fe843783          	ld	a5,-24(s0)
     4a8:	0007c783          	lbu	a5,0(a5)
     4ac:	0007871b          	sext.w	a4,a5
     4b0:	fe043783          	ld	a5,-32(s0)
     4b4:	0007c783          	lbu	a5,0(a5)
     4b8:	2781                	sext.w	a5,a5
     4ba:	40f707bb          	subw	a5,a4,a5
     4be:	2781                	sext.w	a5,a5
}
     4c0:	853e                	mv	a0,a5
     4c2:	6462                	ld	s0,24(sp)
     4c4:	6105                	addi	sp,sp,32
     4c6:	8082                	ret

00000000000004c8 <strlen>:

uint
strlen(const char *s)
{
     4c8:	7179                	addi	sp,sp,-48
     4ca:	f422                	sd	s0,40(sp)
     4cc:	1800                	addi	s0,sp,48
     4ce:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     4d2:	fe042623          	sw	zero,-20(s0)
     4d6:	a031                	j	4e2 <strlen+0x1a>
     4d8:	fec42783          	lw	a5,-20(s0)
     4dc:	2785                	addiw	a5,a5,1
     4de:	fef42623          	sw	a5,-20(s0)
     4e2:	fec42783          	lw	a5,-20(s0)
     4e6:	fd843703          	ld	a4,-40(s0)
     4ea:	97ba                	add	a5,a5,a4
     4ec:	0007c783          	lbu	a5,0(a5)
     4f0:	f7e5                	bnez	a5,4d8 <strlen+0x10>
    ;
  return n;
     4f2:	fec42783          	lw	a5,-20(s0)
}
     4f6:	853e                	mv	a0,a5
     4f8:	7422                	ld	s0,40(sp)
     4fa:	6145                	addi	sp,sp,48
     4fc:	8082                	ret

00000000000004fe <memset>:

void*
memset(void *dst, int c, uint n)
{
     4fe:	7179                	addi	sp,sp,-48
     500:	f422                	sd	s0,40(sp)
     502:	1800                	addi	s0,sp,48
     504:	fca43c23          	sd	a0,-40(s0)
     508:	87ae                	mv	a5,a1
     50a:	8732                	mv	a4,a2
     50c:	fcf42a23          	sw	a5,-44(s0)
     510:	87ba                	mv	a5,a4
     512:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     516:	fd843783          	ld	a5,-40(s0)
     51a:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     51e:	fe042623          	sw	zero,-20(s0)
     522:	a00d                	j	544 <memset+0x46>
    cdst[i] = c;
     524:	fec42783          	lw	a5,-20(s0)
     528:	fe043703          	ld	a4,-32(s0)
     52c:	97ba                	add	a5,a5,a4
     52e:	fd442703          	lw	a4,-44(s0)
     532:	0ff77713          	andi	a4,a4,255
     536:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     53a:	fec42783          	lw	a5,-20(s0)
     53e:	2785                	addiw	a5,a5,1
     540:	fef42623          	sw	a5,-20(s0)
     544:	fec42703          	lw	a4,-20(s0)
     548:	fd042783          	lw	a5,-48(s0)
     54c:	2781                	sext.w	a5,a5
     54e:	fcf76be3          	bltu	a4,a5,524 <memset+0x26>
  }
  return dst;
     552:	fd843783          	ld	a5,-40(s0)
}
     556:	853e                	mv	a0,a5
     558:	7422                	ld	s0,40(sp)
     55a:	6145                	addi	sp,sp,48
     55c:	8082                	ret

000000000000055e <strchr>:

char*
strchr(const char *s, char c)
{
     55e:	1101                	addi	sp,sp,-32
     560:	ec22                	sd	s0,24(sp)
     562:	1000                	addi	s0,sp,32
     564:	fea43423          	sd	a0,-24(s0)
     568:	87ae                	mv	a5,a1
     56a:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     56e:	a01d                	j	594 <strchr+0x36>
    if(*s == c)
     570:	fe843783          	ld	a5,-24(s0)
     574:	0007c703          	lbu	a4,0(a5)
     578:	fe744783          	lbu	a5,-25(s0)
     57c:	0ff7f793          	andi	a5,a5,255
     580:	00e79563          	bne	a5,a4,58a <strchr+0x2c>
      return (char*)s;
     584:	fe843783          	ld	a5,-24(s0)
     588:	a821                	j	5a0 <strchr+0x42>
  for(; *s; s++)
     58a:	fe843783          	ld	a5,-24(s0)
     58e:	0785                	addi	a5,a5,1
     590:	fef43423          	sd	a5,-24(s0)
     594:	fe843783          	ld	a5,-24(s0)
     598:	0007c783          	lbu	a5,0(a5)
     59c:	fbf1                	bnez	a5,570 <strchr+0x12>
  return 0;
     59e:	4781                	li	a5,0
}
     5a0:	853e                	mv	a0,a5
     5a2:	6462                	ld	s0,24(sp)
     5a4:	6105                	addi	sp,sp,32
     5a6:	8082                	ret

00000000000005a8 <gets>:

char*
gets(char *buf, int max)
{
     5a8:	7179                	addi	sp,sp,-48
     5aa:	f406                	sd	ra,40(sp)
     5ac:	f022                	sd	s0,32(sp)
     5ae:	1800                	addi	s0,sp,48
     5b0:	fca43c23          	sd	a0,-40(s0)
     5b4:	87ae                	mv	a5,a1
     5b6:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     5ba:	fe042623          	sw	zero,-20(s0)
     5be:	a8a1                	j	616 <gets+0x6e>
    cc = read(0, &c, 1);
     5c0:	fe740793          	addi	a5,s0,-25
     5c4:	4605                	li	a2,1
     5c6:	85be                	mv	a1,a5
     5c8:	4501                	li	a0,0
     5ca:	00000097          	auipc	ra,0x0
     5ce:	2f6080e7          	jalr	758(ra) # 8c0 <read>
     5d2:	87aa                	mv	a5,a0
     5d4:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     5d8:	fe842783          	lw	a5,-24(s0)
     5dc:	2781                	sext.w	a5,a5
     5de:	04f05763          	blez	a5,62c <gets+0x84>
      break;
    buf[i++] = c;
     5e2:	fec42783          	lw	a5,-20(s0)
     5e6:	0017871b          	addiw	a4,a5,1
     5ea:	fee42623          	sw	a4,-20(s0)
     5ee:	873e                	mv	a4,a5
     5f0:	fd843783          	ld	a5,-40(s0)
     5f4:	97ba                	add	a5,a5,a4
     5f6:	fe744703          	lbu	a4,-25(s0)
     5fa:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     5fe:	fe744783          	lbu	a5,-25(s0)
     602:	873e                	mv	a4,a5
     604:	47a9                	li	a5,10
     606:	02f70463          	beq	a4,a5,62e <gets+0x86>
     60a:	fe744783          	lbu	a5,-25(s0)
     60e:	873e                	mv	a4,a5
     610:	47b5                	li	a5,13
     612:	00f70e63          	beq	a4,a5,62e <gets+0x86>
  for(i=0; i+1 < max; ){
     616:	fec42783          	lw	a5,-20(s0)
     61a:	2785                	addiw	a5,a5,1
     61c:	0007871b          	sext.w	a4,a5
     620:	fd442783          	lw	a5,-44(s0)
     624:	2781                	sext.w	a5,a5
     626:	f8f74de3          	blt	a4,a5,5c0 <gets+0x18>
     62a:	a011                	j	62e <gets+0x86>
      break;
     62c:	0001                	nop
      break;
  }
  buf[i] = '\0';
     62e:	fec42783          	lw	a5,-20(s0)
     632:	fd843703          	ld	a4,-40(s0)
     636:	97ba                	add	a5,a5,a4
     638:	00078023          	sb	zero,0(a5)
  return buf;
     63c:	fd843783          	ld	a5,-40(s0)
}
     640:	853e                	mv	a0,a5
     642:	70a2                	ld	ra,40(sp)
     644:	7402                	ld	s0,32(sp)
     646:	6145                	addi	sp,sp,48
     648:	8082                	ret

000000000000064a <stat>:

int
stat(const char *n, struct stat *st)
{
     64a:	7179                	addi	sp,sp,-48
     64c:	f406                	sd	ra,40(sp)
     64e:	f022                	sd	s0,32(sp)
     650:	1800                	addi	s0,sp,48
     652:	fca43c23          	sd	a0,-40(s0)
     656:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     65a:	4581                	li	a1,0
     65c:	fd843503          	ld	a0,-40(s0)
     660:	00000097          	auipc	ra,0x0
     664:	288080e7          	jalr	648(ra) # 8e8 <open>
     668:	87aa                	mv	a5,a0
     66a:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     66e:	fec42783          	lw	a5,-20(s0)
     672:	2781                	sext.w	a5,a5
     674:	0007d463          	bgez	a5,67c <stat+0x32>
    return -1;
     678:	57fd                	li	a5,-1
     67a:	a035                	j	6a6 <stat+0x5c>
  r = fstat(fd, st);
     67c:	fec42783          	lw	a5,-20(s0)
     680:	fd043583          	ld	a1,-48(s0)
     684:	853e                	mv	a0,a5
     686:	00000097          	auipc	ra,0x0
     68a:	27a080e7          	jalr	634(ra) # 900 <fstat>
     68e:	87aa                	mv	a5,a0
     690:	fef42423          	sw	a5,-24(s0)
  close(fd);
     694:	fec42783          	lw	a5,-20(s0)
     698:	853e                	mv	a0,a5
     69a:	00000097          	auipc	ra,0x0
     69e:	236080e7          	jalr	566(ra) # 8d0 <close>
  return r;
     6a2:	fe842783          	lw	a5,-24(s0)
}
     6a6:	853e                	mv	a0,a5
     6a8:	70a2                	ld	ra,40(sp)
     6aa:	7402                	ld	s0,32(sp)
     6ac:	6145                	addi	sp,sp,48
     6ae:	8082                	ret

00000000000006b0 <atoi>:

int
atoi(const char *s)
{
     6b0:	7179                	addi	sp,sp,-48
     6b2:	f422                	sd	s0,40(sp)
     6b4:	1800                	addi	s0,sp,48
     6b6:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     6ba:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     6be:	a815                	j	6f2 <atoi+0x42>
    n = n*10 + *s++ - '0';
     6c0:	fec42703          	lw	a4,-20(s0)
     6c4:	87ba                	mv	a5,a4
     6c6:	0027979b          	slliw	a5,a5,0x2
     6ca:	9fb9                	addw	a5,a5,a4
     6cc:	0017979b          	slliw	a5,a5,0x1
     6d0:	0007871b          	sext.w	a4,a5
     6d4:	fd843783          	ld	a5,-40(s0)
     6d8:	00178693          	addi	a3,a5,1
     6dc:	fcd43c23          	sd	a3,-40(s0)
     6e0:	0007c783          	lbu	a5,0(a5)
     6e4:	2781                	sext.w	a5,a5
     6e6:	9fb9                	addw	a5,a5,a4
     6e8:	2781                	sext.w	a5,a5
     6ea:	fd07879b          	addiw	a5,a5,-48
     6ee:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     6f2:	fd843783          	ld	a5,-40(s0)
     6f6:	0007c783          	lbu	a5,0(a5)
     6fa:	873e                	mv	a4,a5
     6fc:	02f00793          	li	a5,47
     700:	00e7fb63          	bgeu	a5,a4,716 <atoi+0x66>
     704:	fd843783          	ld	a5,-40(s0)
     708:	0007c783          	lbu	a5,0(a5)
     70c:	873e                	mv	a4,a5
     70e:	03900793          	li	a5,57
     712:	fae7f7e3          	bgeu	a5,a4,6c0 <atoi+0x10>
  return n;
     716:	fec42783          	lw	a5,-20(s0)
}
     71a:	853e                	mv	a0,a5
     71c:	7422                	ld	s0,40(sp)
     71e:	6145                	addi	sp,sp,48
     720:	8082                	ret

0000000000000722 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     722:	7139                	addi	sp,sp,-64
     724:	fc22                	sd	s0,56(sp)
     726:	0080                	addi	s0,sp,64
     728:	fca43c23          	sd	a0,-40(s0)
     72c:	fcb43823          	sd	a1,-48(s0)
     730:	87b2                	mv	a5,a2
     732:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     736:	fd843783          	ld	a5,-40(s0)
     73a:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     73e:	fd043783          	ld	a5,-48(s0)
     742:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     746:	fe043703          	ld	a4,-32(s0)
     74a:	fe843783          	ld	a5,-24(s0)
     74e:	02e7fc63          	bgeu	a5,a4,786 <memmove+0x64>
    while(n-- > 0)
     752:	a00d                	j	774 <memmove+0x52>
      *dst++ = *src++;
     754:	fe043703          	ld	a4,-32(s0)
     758:	00170793          	addi	a5,a4,1
     75c:	fef43023          	sd	a5,-32(s0)
     760:	fe843783          	ld	a5,-24(s0)
     764:	00178693          	addi	a3,a5,1
     768:	fed43423          	sd	a3,-24(s0)
     76c:	00074703          	lbu	a4,0(a4)
     770:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     774:	fcc42783          	lw	a5,-52(s0)
     778:	fff7871b          	addiw	a4,a5,-1
     77c:	fce42623          	sw	a4,-52(s0)
     780:	fcf04ae3          	bgtz	a5,754 <memmove+0x32>
     784:	a891                	j	7d8 <memmove+0xb6>
  } else {
    dst += n;
     786:	fcc42783          	lw	a5,-52(s0)
     78a:	fe843703          	ld	a4,-24(s0)
     78e:	97ba                	add	a5,a5,a4
     790:	fef43423          	sd	a5,-24(s0)
    src += n;
     794:	fcc42783          	lw	a5,-52(s0)
     798:	fe043703          	ld	a4,-32(s0)
     79c:	97ba                	add	a5,a5,a4
     79e:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     7a2:	a01d                	j	7c8 <memmove+0xa6>
      *--dst = *--src;
     7a4:	fe043783          	ld	a5,-32(s0)
     7a8:	17fd                	addi	a5,a5,-1
     7aa:	fef43023          	sd	a5,-32(s0)
     7ae:	fe843783          	ld	a5,-24(s0)
     7b2:	17fd                	addi	a5,a5,-1
     7b4:	fef43423          	sd	a5,-24(s0)
     7b8:	fe043783          	ld	a5,-32(s0)
     7bc:	0007c703          	lbu	a4,0(a5)
     7c0:	fe843783          	ld	a5,-24(s0)
     7c4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     7c8:	fcc42783          	lw	a5,-52(s0)
     7cc:	fff7871b          	addiw	a4,a5,-1
     7d0:	fce42623          	sw	a4,-52(s0)
     7d4:	fcf048e3          	bgtz	a5,7a4 <memmove+0x82>
  }
  return vdst;
     7d8:	fd843783          	ld	a5,-40(s0)
}
     7dc:	853e                	mv	a0,a5
     7de:	7462                	ld	s0,56(sp)
     7e0:	6121                	addi	sp,sp,64
     7e2:	8082                	ret

00000000000007e4 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     7e4:	7139                	addi	sp,sp,-64
     7e6:	fc22                	sd	s0,56(sp)
     7e8:	0080                	addi	s0,sp,64
     7ea:	fca43c23          	sd	a0,-40(s0)
     7ee:	fcb43823          	sd	a1,-48(s0)
     7f2:	87b2                	mv	a5,a2
     7f4:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     7f8:	fd843783          	ld	a5,-40(s0)
     7fc:	fef43423          	sd	a5,-24(s0)
     800:	fd043783          	ld	a5,-48(s0)
     804:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     808:	a0a1                	j	850 <memcmp+0x6c>
    if (*p1 != *p2) {
     80a:	fe843783          	ld	a5,-24(s0)
     80e:	0007c703          	lbu	a4,0(a5)
     812:	fe043783          	ld	a5,-32(s0)
     816:	0007c783          	lbu	a5,0(a5)
     81a:	02f70163          	beq	a4,a5,83c <memcmp+0x58>
      return *p1 - *p2;
     81e:	fe843783          	ld	a5,-24(s0)
     822:	0007c783          	lbu	a5,0(a5)
     826:	0007871b          	sext.w	a4,a5
     82a:	fe043783          	ld	a5,-32(s0)
     82e:	0007c783          	lbu	a5,0(a5)
     832:	2781                	sext.w	a5,a5
     834:	40f707bb          	subw	a5,a4,a5
     838:	2781                	sext.w	a5,a5
     83a:	a01d                	j	860 <memcmp+0x7c>
    }
    p1++;
     83c:	fe843783          	ld	a5,-24(s0)
     840:	0785                	addi	a5,a5,1
     842:	fef43423          	sd	a5,-24(s0)
    p2++;
     846:	fe043783          	ld	a5,-32(s0)
     84a:	0785                	addi	a5,a5,1
     84c:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     850:	fcc42783          	lw	a5,-52(s0)
     854:	fff7871b          	addiw	a4,a5,-1
     858:	fce42623          	sw	a4,-52(s0)
     85c:	f7dd                	bnez	a5,80a <memcmp+0x26>
  }
  return 0;
     85e:	4781                	li	a5,0
}
     860:	853e                	mv	a0,a5
     862:	7462                	ld	s0,56(sp)
     864:	6121                	addi	sp,sp,64
     866:	8082                	ret

0000000000000868 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     868:	7179                	addi	sp,sp,-48
     86a:	f406                	sd	ra,40(sp)
     86c:	f022                	sd	s0,32(sp)
     86e:	1800                	addi	s0,sp,48
     870:	fea43423          	sd	a0,-24(s0)
     874:	feb43023          	sd	a1,-32(s0)
     878:	87b2                	mv	a5,a2
     87a:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     87e:	fdc42783          	lw	a5,-36(s0)
     882:	863e                	mv	a2,a5
     884:	fe043583          	ld	a1,-32(s0)
     888:	fe843503          	ld	a0,-24(s0)
     88c:	00000097          	auipc	ra,0x0
     890:	e96080e7          	jalr	-362(ra) # 722 <memmove>
     894:	87aa                	mv	a5,a0
}
     896:	853e                	mv	a0,a5
     898:	70a2                	ld	ra,40(sp)
     89a:	7402                	ld	s0,32(sp)
     89c:	6145                	addi	sp,sp,48
     89e:	8082                	ret

00000000000008a0 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     8a0:	4885                	li	a7,1
 ecall
     8a2:	00000073          	ecall
 ret
     8a6:	8082                	ret

00000000000008a8 <exit>:
.global exit
exit:
 li a7, SYS_exit
     8a8:	4889                	li	a7,2
 ecall
     8aa:	00000073          	ecall
 ret
     8ae:	8082                	ret

00000000000008b0 <wait>:
.global wait
wait:
 li a7, SYS_wait
     8b0:	488d                	li	a7,3
 ecall
     8b2:	00000073          	ecall
 ret
     8b6:	8082                	ret

00000000000008b8 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     8b8:	4891                	li	a7,4
 ecall
     8ba:	00000073          	ecall
 ret
     8be:	8082                	ret

00000000000008c0 <read>:
.global read
read:
 li a7, SYS_read
     8c0:	4895                	li	a7,5
 ecall
     8c2:	00000073          	ecall
 ret
     8c6:	8082                	ret

00000000000008c8 <write>:
.global write
write:
 li a7, SYS_write
     8c8:	48c1                	li	a7,16
 ecall
     8ca:	00000073          	ecall
 ret
     8ce:	8082                	ret

00000000000008d0 <close>:
.global close
close:
 li a7, SYS_close
     8d0:	48d5                	li	a7,21
 ecall
     8d2:	00000073          	ecall
 ret
     8d6:	8082                	ret

00000000000008d8 <kill>:
.global kill
kill:
 li a7, SYS_kill
     8d8:	4899                	li	a7,6
 ecall
     8da:	00000073          	ecall
 ret
     8de:	8082                	ret

00000000000008e0 <exec>:
.global exec
exec:
 li a7, SYS_exec
     8e0:	489d                	li	a7,7
 ecall
     8e2:	00000073          	ecall
 ret
     8e6:	8082                	ret

00000000000008e8 <open>:
.global open
open:
 li a7, SYS_open
     8e8:	48bd                	li	a7,15
 ecall
     8ea:	00000073          	ecall
 ret
     8ee:	8082                	ret

00000000000008f0 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     8f0:	48c5                	li	a7,17
 ecall
     8f2:	00000073          	ecall
 ret
     8f6:	8082                	ret

00000000000008f8 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     8f8:	48c9                	li	a7,18
 ecall
     8fa:	00000073          	ecall
 ret
     8fe:	8082                	ret

0000000000000900 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     900:	48a1                	li	a7,8
 ecall
     902:	00000073          	ecall
 ret
     906:	8082                	ret

0000000000000908 <link>:
.global link
link:
 li a7, SYS_link
     908:	48cd                	li	a7,19
 ecall
     90a:	00000073          	ecall
 ret
     90e:	8082                	ret

0000000000000910 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     910:	48d1                	li	a7,20
 ecall
     912:	00000073          	ecall
 ret
     916:	8082                	ret

0000000000000918 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     918:	48a5                	li	a7,9
 ecall
     91a:	00000073          	ecall
 ret
     91e:	8082                	ret

0000000000000920 <dup>:
.global dup
dup:
 li a7, SYS_dup
     920:	48a9                	li	a7,10
 ecall
     922:	00000073          	ecall
 ret
     926:	8082                	ret

0000000000000928 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     928:	48ad                	li	a7,11
 ecall
     92a:	00000073          	ecall
 ret
     92e:	8082                	ret

0000000000000930 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     930:	48b1                	li	a7,12
 ecall
     932:	00000073          	ecall
 ret
     936:	8082                	ret

0000000000000938 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     938:	48b5                	li	a7,13
 ecall
     93a:	00000073          	ecall
 ret
     93e:	8082                	ret

0000000000000940 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     940:	48b9                	li	a7,14
 ecall
     942:	00000073          	ecall
 ret
     946:	8082                	ret

0000000000000948 <setSchedAlg>:
.global setSchedAlg
setSchedAlg:
 li a7, SYS_setSchedAlg
     948:	48d9                	li	a7,22
 ecall
     94a:	00000073          	ecall
 ret
     94e:	8082                	ret

0000000000000950 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     950:	1101                	addi	sp,sp,-32
     952:	ec06                	sd	ra,24(sp)
     954:	e822                	sd	s0,16(sp)
     956:	1000                	addi	s0,sp,32
     958:	87aa                	mv	a5,a0
     95a:	872e                	mv	a4,a1
     95c:	fef42623          	sw	a5,-20(s0)
     960:	87ba                	mv	a5,a4
     962:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     966:	feb40713          	addi	a4,s0,-21
     96a:	fec42783          	lw	a5,-20(s0)
     96e:	4605                	li	a2,1
     970:	85ba                	mv	a1,a4
     972:	853e                	mv	a0,a5
     974:	00000097          	auipc	ra,0x0
     978:	f54080e7          	jalr	-172(ra) # 8c8 <write>
}
     97c:	0001                	nop
     97e:	60e2                	ld	ra,24(sp)
     980:	6442                	ld	s0,16(sp)
     982:	6105                	addi	sp,sp,32
     984:	8082                	ret

0000000000000986 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     986:	7139                	addi	sp,sp,-64
     988:	fc06                	sd	ra,56(sp)
     98a:	f822                	sd	s0,48(sp)
     98c:	0080                	addi	s0,sp,64
     98e:	87aa                	mv	a5,a0
     990:	8736                	mv	a4,a3
     992:	fcf42623          	sw	a5,-52(s0)
     996:	87ae                	mv	a5,a1
     998:	fcf42423          	sw	a5,-56(s0)
     99c:	87b2                	mv	a5,a2
     99e:	fcf42223          	sw	a5,-60(s0)
     9a2:	87ba                	mv	a5,a4
     9a4:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     9a8:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     9ac:	fc042783          	lw	a5,-64(s0)
     9b0:	2781                	sext.w	a5,a5
     9b2:	c38d                	beqz	a5,9d4 <printint+0x4e>
     9b4:	fc842783          	lw	a5,-56(s0)
     9b8:	2781                	sext.w	a5,a5
     9ba:	0007dd63          	bgez	a5,9d4 <printint+0x4e>
    neg = 1;
     9be:	4785                	li	a5,1
     9c0:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     9c4:	fc842783          	lw	a5,-56(s0)
     9c8:	40f007bb          	negw	a5,a5
     9cc:	2781                	sext.w	a5,a5
     9ce:	fef42223          	sw	a5,-28(s0)
     9d2:	a029                	j	9dc <printint+0x56>
  } else {
    x = xx;
     9d4:	fc842783          	lw	a5,-56(s0)
     9d8:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     9dc:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     9e0:	fc442783          	lw	a5,-60(s0)
     9e4:	fe442703          	lw	a4,-28(s0)
     9e8:	02f777bb          	remuw	a5,a4,a5
     9ec:	0007861b          	sext.w	a2,a5
     9f0:	fec42783          	lw	a5,-20(s0)
     9f4:	0017871b          	addiw	a4,a5,1
     9f8:	fee42623          	sw	a4,-20(s0)
     9fc:	00000697          	auipc	a3,0x0
     a00:	75468693          	addi	a3,a3,1876 # 1150 <digits>
     a04:	02061713          	slli	a4,a2,0x20
     a08:	9301                	srli	a4,a4,0x20
     a0a:	9736                	add	a4,a4,a3
     a0c:	00074703          	lbu	a4,0(a4)
     a10:	ff040693          	addi	a3,s0,-16
     a14:	97b6                	add	a5,a5,a3
     a16:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     a1a:	fc442783          	lw	a5,-60(s0)
     a1e:	fe442703          	lw	a4,-28(s0)
     a22:	02f757bb          	divuw	a5,a4,a5
     a26:	fef42223          	sw	a5,-28(s0)
     a2a:	fe442783          	lw	a5,-28(s0)
     a2e:	2781                	sext.w	a5,a5
     a30:	fbc5                	bnez	a5,9e0 <printint+0x5a>
  if(neg)
     a32:	fe842783          	lw	a5,-24(s0)
     a36:	2781                	sext.w	a5,a5
     a38:	cf95                	beqz	a5,a74 <printint+0xee>
    buf[i++] = '-';
     a3a:	fec42783          	lw	a5,-20(s0)
     a3e:	0017871b          	addiw	a4,a5,1
     a42:	fee42623          	sw	a4,-20(s0)
     a46:	ff040713          	addi	a4,s0,-16
     a4a:	97ba                	add	a5,a5,a4
     a4c:	02d00713          	li	a4,45
     a50:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     a54:	a005                	j	a74 <printint+0xee>
    putc(fd, buf[i]);
     a56:	fec42783          	lw	a5,-20(s0)
     a5a:	ff040713          	addi	a4,s0,-16
     a5e:	97ba                	add	a5,a5,a4
     a60:	fe07c703          	lbu	a4,-32(a5)
     a64:	fcc42783          	lw	a5,-52(s0)
     a68:	85ba                	mv	a1,a4
     a6a:	853e                	mv	a0,a5
     a6c:	00000097          	auipc	ra,0x0
     a70:	ee4080e7          	jalr	-284(ra) # 950 <putc>
  while(--i >= 0)
     a74:	fec42783          	lw	a5,-20(s0)
     a78:	37fd                	addiw	a5,a5,-1
     a7a:	fef42623          	sw	a5,-20(s0)
     a7e:	fec42783          	lw	a5,-20(s0)
     a82:	2781                	sext.w	a5,a5
     a84:	fc07d9e3          	bgez	a5,a56 <printint+0xd0>
}
     a88:	0001                	nop
     a8a:	0001                	nop
     a8c:	70e2                	ld	ra,56(sp)
     a8e:	7442                	ld	s0,48(sp)
     a90:	6121                	addi	sp,sp,64
     a92:	8082                	ret

0000000000000a94 <printptr>:

static void
printptr(int fd, uint64 x) {
     a94:	7179                	addi	sp,sp,-48
     a96:	f406                	sd	ra,40(sp)
     a98:	f022                	sd	s0,32(sp)
     a9a:	1800                	addi	s0,sp,48
     a9c:	87aa                	mv	a5,a0
     a9e:	fcb43823          	sd	a1,-48(s0)
     aa2:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     aa6:	fdc42783          	lw	a5,-36(s0)
     aaa:	03000593          	li	a1,48
     aae:	853e                	mv	a0,a5
     ab0:	00000097          	auipc	ra,0x0
     ab4:	ea0080e7          	jalr	-352(ra) # 950 <putc>
  putc(fd, 'x');
     ab8:	fdc42783          	lw	a5,-36(s0)
     abc:	07800593          	li	a1,120
     ac0:	853e                	mv	a0,a5
     ac2:	00000097          	auipc	ra,0x0
     ac6:	e8e080e7          	jalr	-370(ra) # 950 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     aca:	fe042623          	sw	zero,-20(s0)
     ace:	a82d                	j	b08 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     ad0:	fd043783          	ld	a5,-48(s0)
     ad4:	93f1                	srli	a5,a5,0x3c
     ad6:	00000717          	auipc	a4,0x0
     ada:	67a70713          	addi	a4,a4,1658 # 1150 <digits>
     ade:	97ba                	add	a5,a5,a4
     ae0:	0007c703          	lbu	a4,0(a5)
     ae4:	fdc42783          	lw	a5,-36(s0)
     ae8:	85ba                	mv	a1,a4
     aea:	853e                	mv	a0,a5
     aec:	00000097          	auipc	ra,0x0
     af0:	e64080e7          	jalr	-412(ra) # 950 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     af4:	fec42783          	lw	a5,-20(s0)
     af8:	2785                	addiw	a5,a5,1
     afa:	fef42623          	sw	a5,-20(s0)
     afe:	fd043783          	ld	a5,-48(s0)
     b02:	0792                	slli	a5,a5,0x4
     b04:	fcf43823          	sd	a5,-48(s0)
     b08:	fec42783          	lw	a5,-20(s0)
     b0c:	873e                	mv	a4,a5
     b0e:	47bd                	li	a5,15
     b10:	fce7f0e3          	bgeu	a5,a4,ad0 <printptr+0x3c>
}
     b14:	0001                	nop
     b16:	0001                	nop
     b18:	70a2                	ld	ra,40(sp)
     b1a:	7402                	ld	s0,32(sp)
     b1c:	6145                	addi	sp,sp,48
     b1e:	8082                	ret

0000000000000b20 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     b20:	715d                	addi	sp,sp,-80
     b22:	e486                	sd	ra,72(sp)
     b24:	e0a2                	sd	s0,64(sp)
     b26:	0880                	addi	s0,sp,80
     b28:	87aa                	mv	a5,a0
     b2a:	fcb43023          	sd	a1,-64(s0)
     b2e:	fac43c23          	sd	a2,-72(s0)
     b32:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     b36:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     b3a:	fe042223          	sw	zero,-28(s0)
     b3e:	a42d                	j	d68 <vprintf+0x248>
    c = fmt[i] & 0xff;
     b40:	fe442783          	lw	a5,-28(s0)
     b44:	fc043703          	ld	a4,-64(s0)
     b48:	97ba                	add	a5,a5,a4
     b4a:	0007c783          	lbu	a5,0(a5)
     b4e:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     b52:	fe042783          	lw	a5,-32(s0)
     b56:	2781                	sext.w	a5,a5
     b58:	eb9d                	bnez	a5,b8e <vprintf+0x6e>
      if(c == '%'){
     b5a:	fdc42783          	lw	a5,-36(s0)
     b5e:	0007871b          	sext.w	a4,a5
     b62:	02500793          	li	a5,37
     b66:	00f71763          	bne	a4,a5,b74 <vprintf+0x54>
        state = '%';
     b6a:	02500793          	li	a5,37
     b6e:	fef42023          	sw	a5,-32(s0)
     b72:	a2f5                	j	d5e <vprintf+0x23e>
      } else {
        putc(fd, c);
     b74:	fdc42783          	lw	a5,-36(s0)
     b78:	0ff7f713          	andi	a4,a5,255
     b7c:	fcc42783          	lw	a5,-52(s0)
     b80:	85ba                	mv	a1,a4
     b82:	853e                	mv	a0,a5
     b84:	00000097          	auipc	ra,0x0
     b88:	dcc080e7          	jalr	-564(ra) # 950 <putc>
     b8c:	aac9                	j	d5e <vprintf+0x23e>
      }
    } else if(state == '%'){
     b8e:	fe042783          	lw	a5,-32(s0)
     b92:	0007871b          	sext.w	a4,a5
     b96:	02500793          	li	a5,37
     b9a:	1cf71263          	bne	a4,a5,d5e <vprintf+0x23e>
      if(c == 'd'){
     b9e:	fdc42783          	lw	a5,-36(s0)
     ba2:	0007871b          	sext.w	a4,a5
     ba6:	06400793          	li	a5,100
     baa:	02f71463          	bne	a4,a5,bd2 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     bae:	fb843783          	ld	a5,-72(s0)
     bb2:	00878713          	addi	a4,a5,8
     bb6:	fae43c23          	sd	a4,-72(s0)
     bba:	4398                	lw	a4,0(a5)
     bbc:	fcc42783          	lw	a5,-52(s0)
     bc0:	4685                	li	a3,1
     bc2:	4629                	li	a2,10
     bc4:	85ba                	mv	a1,a4
     bc6:	853e                	mv	a0,a5
     bc8:	00000097          	auipc	ra,0x0
     bcc:	dbe080e7          	jalr	-578(ra) # 986 <printint>
     bd0:	a269                	j	d5a <vprintf+0x23a>
      } else if(c == 'l') {
     bd2:	fdc42783          	lw	a5,-36(s0)
     bd6:	0007871b          	sext.w	a4,a5
     bda:	06c00793          	li	a5,108
     bde:	02f71663          	bne	a4,a5,c0a <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     be2:	fb843783          	ld	a5,-72(s0)
     be6:	00878713          	addi	a4,a5,8
     bea:	fae43c23          	sd	a4,-72(s0)
     bee:	639c                	ld	a5,0(a5)
     bf0:	0007871b          	sext.w	a4,a5
     bf4:	fcc42783          	lw	a5,-52(s0)
     bf8:	4681                	li	a3,0
     bfa:	4629                	li	a2,10
     bfc:	85ba                	mv	a1,a4
     bfe:	853e                	mv	a0,a5
     c00:	00000097          	auipc	ra,0x0
     c04:	d86080e7          	jalr	-634(ra) # 986 <printint>
     c08:	aa89                	j	d5a <vprintf+0x23a>
      } else if(c == 'x') {
     c0a:	fdc42783          	lw	a5,-36(s0)
     c0e:	0007871b          	sext.w	a4,a5
     c12:	07800793          	li	a5,120
     c16:	02f71463          	bne	a4,a5,c3e <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     c1a:	fb843783          	ld	a5,-72(s0)
     c1e:	00878713          	addi	a4,a5,8
     c22:	fae43c23          	sd	a4,-72(s0)
     c26:	4398                	lw	a4,0(a5)
     c28:	fcc42783          	lw	a5,-52(s0)
     c2c:	4681                	li	a3,0
     c2e:	4641                	li	a2,16
     c30:	85ba                	mv	a1,a4
     c32:	853e                	mv	a0,a5
     c34:	00000097          	auipc	ra,0x0
     c38:	d52080e7          	jalr	-686(ra) # 986 <printint>
     c3c:	aa39                	j	d5a <vprintf+0x23a>
      } else if(c == 'p') {
     c3e:	fdc42783          	lw	a5,-36(s0)
     c42:	0007871b          	sext.w	a4,a5
     c46:	07000793          	li	a5,112
     c4a:	02f71263          	bne	a4,a5,c6e <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     c4e:	fb843783          	ld	a5,-72(s0)
     c52:	00878713          	addi	a4,a5,8
     c56:	fae43c23          	sd	a4,-72(s0)
     c5a:	6398                	ld	a4,0(a5)
     c5c:	fcc42783          	lw	a5,-52(s0)
     c60:	85ba                	mv	a1,a4
     c62:	853e                	mv	a0,a5
     c64:	00000097          	auipc	ra,0x0
     c68:	e30080e7          	jalr	-464(ra) # a94 <printptr>
     c6c:	a0fd                	j	d5a <vprintf+0x23a>
      } else if(c == 's'){
     c6e:	fdc42783          	lw	a5,-36(s0)
     c72:	0007871b          	sext.w	a4,a5
     c76:	07300793          	li	a5,115
     c7a:	04f71c63          	bne	a4,a5,cd2 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     c7e:	fb843783          	ld	a5,-72(s0)
     c82:	00878713          	addi	a4,a5,8
     c86:	fae43c23          	sd	a4,-72(s0)
     c8a:	639c                	ld	a5,0(a5)
     c8c:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     c90:	fe843783          	ld	a5,-24(s0)
     c94:	eb8d                	bnez	a5,cc6 <vprintf+0x1a6>
          s = "(null)";
     c96:	00000797          	auipc	a5,0x0
     c9a:	4b278793          	addi	a5,a5,1202 # 1148 <malloc+0x178>
     c9e:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     ca2:	a015                	j	cc6 <vprintf+0x1a6>
          putc(fd, *s);
     ca4:	fe843783          	ld	a5,-24(s0)
     ca8:	0007c703          	lbu	a4,0(a5)
     cac:	fcc42783          	lw	a5,-52(s0)
     cb0:	85ba                	mv	a1,a4
     cb2:	853e                	mv	a0,a5
     cb4:	00000097          	auipc	ra,0x0
     cb8:	c9c080e7          	jalr	-868(ra) # 950 <putc>
          s++;
     cbc:	fe843783          	ld	a5,-24(s0)
     cc0:	0785                	addi	a5,a5,1
     cc2:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     cc6:	fe843783          	ld	a5,-24(s0)
     cca:	0007c783          	lbu	a5,0(a5)
     cce:	fbf9                	bnez	a5,ca4 <vprintf+0x184>
     cd0:	a069                	j	d5a <vprintf+0x23a>
        }
      } else if(c == 'c'){
     cd2:	fdc42783          	lw	a5,-36(s0)
     cd6:	0007871b          	sext.w	a4,a5
     cda:	06300793          	li	a5,99
     cde:	02f71463          	bne	a4,a5,d06 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     ce2:	fb843783          	ld	a5,-72(s0)
     ce6:	00878713          	addi	a4,a5,8
     cea:	fae43c23          	sd	a4,-72(s0)
     cee:	439c                	lw	a5,0(a5)
     cf0:	0ff7f713          	andi	a4,a5,255
     cf4:	fcc42783          	lw	a5,-52(s0)
     cf8:	85ba                	mv	a1,a4
     cfa:	853e                	mv	a0,a5
     cfc:	00000097          	auipc	ra,0x0
     d00:	c54080e7          	jalr	-940(ra) # 950 <putc>
     d04:	a899                	j	d5a <vprintf+0x23a>
      } else if(c == '%'){
     d06:	fdc42783          	lw	a5,-36(s0)
     d0a:	0007871b          	sext.w	a4,a5
     d0e:	02500793          	li	a5,37
     d12:	00f71f63          	bne	a4,a5,d30 <vprintf+0x210>
        putc(fd, c);
     d16:	fdc42783          	lw	a5,-36(s0)
     d1a:	0ff7f713          	andi	a4,a5,255
     d1e:	fcc42783          	lw	a5,-52(s0)
     d22:	85ba                	mv	a1,a4
     d24:	853e                	mv	a0,a5
     d26:	00000097          	auipc	ra,0x0
     d2a:	c2a080e7          	jalr	-982(ra) # 950 <putc>
     d2e:	a035                	j	d5a <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     d30:	fcc42783          	lw	a5,-52(s0)
     d34:	02500593          	li	a1,37
     d38:	853e                	mv	a0,a5
     d3a:	00000097          	auipc	ra,0x0
     d3e:	c16080e7          	jalr	-1002(ra) # 950 <putc>
        putc(fd, c);
     d42:	fdc42783          	lw	a5,-36(s0)
     d46:	0ff7f713          	andi	a4,a5,255
     d4a:	fcc42783          	lw	a5,-52(s0)
     d4e:	85ba                	mv	a1,a4
     d50:	853e                	mv	a0,a5
     d52:	00000097          	auipc	ra,0x0
     d56:	bfe080e7          	jalr	-1026(ra) # 950 <putc>
      }
      state = 0;
     d5a:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     d5e:	fe442783          	lw	a5,-28(s0)
     d62:	2785                	addiw	a5,a5,1
     d64:	fef42223          	sw	a5,-28(s0)
     d68:	fe442783          	lw	a5,-28(s0)
     d6c:	fc043703          	ld	a4,-64(s0)
     d70:	97ba                	add	a5,a5,a4
     d72:	0007c783          	lbu	a5,0(a5)
     d76:	dc0795e3          	bnez	a5,b40 <vprintf+0x20>
    }
  }
}
     d7a:	0001                	nop
     d7c:	0001                	nop
     d7e:	60a6                	ld	ra,72(sp)
     d80:	6406                	ld	s0,64(sp)
     d82:	6161                	addi	sp,sp,80
     d84:	8082                	ret

0000000000000d86 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     d86:	7159                	addi	sp,sp,-112
     d88:	fc06                	sd	ra,56(sp)
     d8a:	f822                	sd	s0,48(sp)
     d8c:	0080                	addi	s0,sp,64
     d8e:	fcb43823          	sd	a1,-48(s0)
     d92:	e010                	sd	a2,0(s0)
     d94:	e414                	sd	a3,8(s0)
     d96:	e818                	sd	a4,16(s0)
     d98:	ec1c                	sd	a5,24(s0)
     d9a:	03043023          	sd	a6,32(s0)
     d9e:	03143423          	sd	a7,40(s0)
     da2:	87aa                	mv	a5,a0
     da4:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     da8:	03040793          	addi	a5,s0,48
     dac:	fcf43423          	sd	a5,-56(s0)
     db0:	fc843783          	ld	a5,-56(s0)
     db4:	fd078793          	addi	a5,a5,-48
     db8:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     dbc:	fe843703          	ld	a4,-24(s0)
     dc0:	fdc42783          	lw	a5,-36(s0)
     dc4:	863a                	mv	a2,a4
     dc6:	fd043583          	ld	a1,-48(s0)
     dca:	853e                	mv	a0,a5
     dcc:	00000097          	auipc	ra,0x0
     dd0:	d54080e7          	jalr	-684(ra) # b20 <vprintf>
}
     dd4:	0001                	nop
     dd6:	70e2                	ld	ra,56(sp)
     dd8:	7442                	ld	s0,48(sp)
     dda:	6165                	addi	sp,sp,112
     ddc:	8082                	ret

0000000000000dde <printf>:

void
printf(const char *fmt, ...)
{
     dde:	7159                	addi	sp,sp,-112
     de0:	f406                	sd	ra,40(sp)
     de2:	f022                	sd	s0,32(sp)
     de4:	1800                	addi	s0,sp,48
     de6:	fca43c23          	sd	a0,-40(s0)
     dea:	e40c                	sd	a1,8(s0)
     dec:	e810                	sd	a2,16(s0)
     dee:	ec14                	sd	a3,24(s0)
     df0:	f018                	sd	a4,32(s0)
     df2:	f41c                	sd	a5,40(s0)
     df4:	03043823          	sd	a6,48(s0)
     df8:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     dfc:	04040793          	addi	a5,s0,64
     e00:	fcf43823          	sd	a5,-48(s0)
     e04:	fd043783          	ld	a5,-48(s0)
     e08:	fc878793          	addi	a5,a5,-56
     e0c:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     e10:	fe843783          	ld	a5,-24(s0)
     e14:	863e                	mv	a2,a5
     e16:	fd843583          	ld	a1,-40(s0)
     e1a:	4505                	li	a0,1
     e1c:	00000097          	auipc	ra,0x0
     e20:	d04080e7          	jalr	-764(ra) # b20 <vprintf>
}
     e24:	0001                	nop
     e26:	70a2                	ld	ra,40(sp)
     e28:	7402                	ld	s0,32(sp)
     e2a:	6165                	addi	sp,sp,112
     e2c:	8082                	ret

0000000000000e2e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     e2e:	7179                	addi	sp,sp,-48
     e30:	f422                	sd	s0,40(sp)
     e32:	1800                	addi	s0,sp,48
     e34:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     e38:	fd843783          	ld	a5,-40(s0)
     e3c:	17c1                	addi	a5,a5,-16
     e3e:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e42:	00000797          	auipc	a5,0x0
     e46:	73678793          	addi	a5,a5,1846 # 1578 <freep>
     e4a:	639c                	ld	a5,0(a5)
     e4c:	fef43423          	sd	a5,-24(s0)
     e50:	a815                	j	e84 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     e52:	fe843783          	ld	a5,-24(s0)
     e56:	639c                	ld	a5,0(a5)
     e58:	fe843703          	ld	a4,-24(s0)
     e5c:	00f76f63          	bltu	a4,a5,e7a <free+0x4c>
     e60:	fe043703          	ld	a4,-32(s0)
     e64:	fe843783          	ld	a5,-24(s0)
     e68:	02e7eb63          	bltu	a5,a4,e9e <free+0x70>
     e6c:	fe843783          	ld	a5,-24(s0)
     e70:	639c                	ld	a5,0(a5)
     e72:	fe043703          	ld	a4,-32(s0)
     e76:	02f76463          	bltu	a4,a5,e9e <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e7a:	fe843783          	ld	a5,-24(s0)
     e7e:	639c                	ld	a5,0(a5)
     e80:	fef43423          	sd	a5,-24(s0)
     e84:	fe043703          	ld	a4,-32(s0)
     e88:	fe843783          	ld	a5,-24(s0)
     e8c:	fce7f3e3          	bgeu	a5,a4,e52 <free+0x24>
     e90:	fe843783          	ld	a5,-24(s0)
     e94:	639c                	ld	a5,0(a5)
     e96:	fe043703          	ld	a4,-32(s0)
     e9a:	faf77ce3          	bgeu	a4,a5,e52 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     e9e:	fe043783          	ld	a5,-32(s0)
     ea2:	479c                	lw	a5,8(a5)
     ea4:	1782                	slli	a5,a5,0x20
     ea6:	9381                	srli	a5,a5,0x20
     ea8:	0792                	slli	a5,a5,0x4
     eaa:	fe043703          	ld	a4,-32(s0)
     eae:	973e                	add	a4,a4,a5
     eb0:	fe843783          	ld	a5,-24(s0)
     eb4:	639c                	ld	a5,0(a5)
     eb6:	02f71763          	bne	a4,a5,ee4 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     eba:	fe043783          	ld	a5,-32(s0)
     ebe:	4798                	lw	a4,8(a5)
     ec0:	fe843783          	ld	a5,-24(s0)
     ec4:	639c                	ld	a5,0(a5)
     ec6:	479c                	lw	a5,8(a5)
     ec8:	9fb9                	addw	a5,a5,a4
     eca:	0007871b          	sext.w	a4,a5
     ece:	fe043783          	ld	a5,-32(s0)
     ed2:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     ed4:	fe843783          	ld	a5,-24(s0)
     ed8:	639c                	ld	a5,0(a5)
     eda:	6398                	ld	a4,0(a5)
     edc:	fe043783          	ld	a5,-32(s0)
     ee0:	e398                	sd	a4,0(a5)
     ee2:	a039                	j	ef0 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     ee4:	fe843783          	ld	a5,-24(s0)
     ee8:	6398                	ld	a4,0(a5)
     eea:	fe043783          	ld	a5,-32(s0)
     eee:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     ef0:	fe843783          	ld	a5,-24(s0)
     ef4:	479c                	lw	a5,8(a5)
     ef6:	1782                	slli	a5,a5,0x20
     ef8:	9381                	srli	a5,a5,0x20
     efa:	0792                	slli	a5,a5,0x4
     efc:	fe843703          	ld	a4,-24(s0)
     f00:	97ba                	add	a5,a5,a4
     f02:	fe043703          	ld	a4,-32(s0)
     f06:	02f71563          	bne	a4,a5,f30 <free+0x102>
    p->s.size += bp->s.size;
     f0a:	fe843783          	ld	a5,-24(s0)
     f0e:	4798                	lw	a4,8(a5)
     f10:	fe043783          	ld	a5,-32(s0)
     f14:	479c                	lw	a5,8(a5)
     f16:	9fb9                	addw	a5,a5,a4
     f18:	0007871b          	sext.w	a4,a5
     f1c:	fe843783          	ld	a5,-24(s0)
     f20:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     f22:	fe043783          	ld	a5,-32(s0)
     f26:	6398                	ld	a4,0(a5)
     f28:	fe843783          	ld	a5,-24(s0)
     f2c:	e398                	sd	a4,0(a5)
     f2e:	a031                	j	f3a <free+0x10c>
  } else
    p->s.ptr = bp;
     f30:	fe843783          	ld	a5,-24(s0)
     f34:	fe043703          	ld	a4,-32(s0)
     f38:	e398                	sd	a4,0(a5)
  freep = p;
     f3a:	00000797          	auipc	a5,0x0
     f3e:	63e78793          	addi	a5,a5,1598 # 1578 <freep>
     f42:	fe843703          	ld	a4,-24(s0)
     f46:	e398                	sd	a4,0(a5)
}
     f48:	0001                	nop
     f4a:	7422                	ld	s0,40(sp)
     f4c:	6145                	addi	sp,sp,48
     f4e:	8082                	ret

0000000000000f50 <morecore>:

static Header*
morecore(uint nu)
{
     f50:	7179                	addi	sp,sp,-48
     f52:	f406                	sd	ra,40(sp)
     f54:	f022                	sd	s0,32(sp)
     f56:	1800                	addi	s0,sp,48
     f58:	87aa                	mv	a5,a0
     f5a:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     f5e:	fdc42783          	lw	a5,-36(s0)
     f62:	0007871b          	sext.w	a4,a5
     f66:	6785                	lui	a5,0x1
     f68:	00f77563          	bgeu	a4,a5,f72 <morecore+0x22>
    nu = 4096;
     f6c:	6785                	lui	a5,0x1
     f6e:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     f72:	fdc42783          	lw	a5,-36(s0)
     f76:	0047979b          	slliw	a5,a5,0x4
     f7a:	2781                	sext.w	a5,a5
     f7c:	2781                	sext.w	a5,a5
     f7e:	853e                	mv	a0,a5
     f80:	00000097          	auipc	ra,0x0
     f84:	9b0080e7          	jalr	-1616(ra) # 930 <sbrk>
     f88:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     f8c:	fe843703          	ld	a4,-24(s0)
     f90:	57fd                	li	a5,-1
     f92:	00f71463          	bne	a4,a5,f9a <morecore+0x4a>
    return 0;
     f96:	4781                	li	a5,0
     f98:	a03d                	j	fc6 <morecore+0x76>
  hp = (Header*)p;
     f9a:	fe843783          	ld	a5,-24(s0)
     f9e:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     fa2:	fe043783          	ld	a5,-32(s0)
     fa6:	fdc42703          	lw	a4,-36(s0)
     faa:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     fac:	fe043783          	ld	a5,-32(s0)
     fb0:	07c1                	addi	a5,a5,16
     fb2:	853e                	mv	a0,a5
     fb4:	00000097          	auipc	ra,0x0
     fb8:	e7a080e7          	jalr	-390(ra) # e2e <free>
  return freep;
     fbc:	00000797          	auipc	a5,0x0
     fc0:	5bc78793          	addi	a5,a5,1468 # 1578 <freep>
     fc4:	639c                	ld	a5,0(a5)
}
     fc6:	853e                	mv	a0,a5
     fc8:	70a2                	ld	ra,40(sp)
     fca:	7402                	ld	s0,32(sp)
     fcc:	6145                	addi	sp,sp,48
     fce:	8082                	ret

0000000000000fd0 <malloc>:

void*
malloc(uint nbytes)
{
     fd0:	7139                	addi	sp,sp,-64
     fd2:	fc06                	sd	ra,56(sp)
     fd4:	f822                	sd	s0,48(sp)
     fd6:	0080                	addi	s0,sp,64
     fd8:	87aa                	mv	a5,a0
     fda:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     fde:	fcc46783          	lwu	a5,-52(s0)
     fe2:	07bd                	addi	a5,a5,15
     fe4:	8391                	srli	a5,a5,0x4
     fe6:	2781                	sext.w	a5,a5
     fe8:	2785                	addiw	a5,a5,1
     fea:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     fee:	00000797          	auipc	a5,0x0
     ff2:	58a78793          	addi	a5,a5,1418 # 1578 <freep>
     ff6:	639c                	ld	a5,0(a5)
     ff8:	fef43023          	sd	a5,-32(s0)
     ffc:	fe043783          	ld	a5,-32(s0)
    1000:	ef95                	bnez	a5,103c <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
    1002:	00000797          	auipc	a5,0x0
    1006:	56678793          	addi	a5,a5,1382 # 1568 <base>
    100a:	fef43023          	sd	a5,-32(s0)
    100e:	00000797          	auipc	a5,0x0
    1012:	56a78793          	addi	a5,a5,1386 # 1578 <freep>
    1016:	fe043703          	ld	a4,-32(s0)
    101a:	e398                	sd	a4,0(a5)
    101c:	00000797          	auipc	a5,0x0
    1020:	55c78793          	addi	a5,a5,1372 # 1578 <freep>
    1024:	6398                	ld	a4,0(a5)
    1026:	00000797          	auipc	a5,0x0
    102a:	54278793          	addi	a5,a5,1346 # 1568 <base>
    102e:	e398                	sd	a4,0(a5)
    base.s.size = 0;
    1030:	00000797          	auipc	a5,0x0
    1034:	53878793          	addi	a5,a5,1336 # 1568 <base>
    1038:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    103c:	fe043783          	ld	a5,-32(s0)
    1040:	639c                	ld	a5,0(a5)
    1042:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    1046:	fe843783          	ld	a5,-24(s0)
    104a:	4798                	lw	a4,8(a5)
    104c:	fdc42783          	lw	a5,-36(s0)
    1050:	2781                	sext.w	a5,a5
    1052:	06f76863          	bltu	a4,a5,10c2 <malloc+0xf2>
      if(p->s.size == nunits)
    1056:	fe843783          	ld	a5,-24(s0)
    105a:	4798                	lw	a4,8(a5)
    105c:	fdc42783          	lw	a5,-36(s0)
    1060:	2781                	sext.w	a5,a5
    1062:	00e79963          	bne	a5,a4,1074 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
    1066:	fe843783          	ld	a5,-24(s0)
    106a:	6398                	ld	a4,0(a5)
    106c:	fe043783          	ld	a5,-32(s0)
    1070:	e398                	sd	a4,0(a5)
    1072:	a82d                	j	10ac <malloc+0xdc>
      else {
        p->s.size -= nunits;
    1074:	fe843783          	ld	a5,-24(s0)
    1078:	4798                	lw	a4,8(a5)
    107a:	fdc42783          	lw	a5,-36(s0)
    107e:	40f707bb          	subw	a5,a4,a5
    1082:	0007871b          	sext.w	a4,a5
    1086:	fe843783          	ld	a5,-24(s0)
    108a:	c798                	sw	a4,8(a5)
        p += p->s.size;
    108c:	fe843783          	ld	a5,-24(s0)
    1090:	479c                	lw	a5,8(a5)
    1092:	1782                	slli	a5,a5,0x20
    1094:	9381                	srli	a5,a5,0x20
    1096:	0792                	slli	a5,a5,0x4
    1098:	fe843703          	ld	a4,-24(s0)
    109c:	97ba                	add	a5,a5,a4
    109e:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    10a2:	fe843783          	ld	a5,-24(s0)
    10a6:	fdc42703          	lw	a4,-36(s0)
    10aa:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    10ac:	00000797          	auipc	a5,0x0
    10b0:	4cc78793          	addi	a5,a5,1228 # 1578 <freep>
    10b4:	fe043703          	ld	a4,-32(s0)
    10b8:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    10ba:	fe843783          	ld	a5,-24(s0)
    10be:	07c1                	addi	a5,a5,16
    10c0:	a091                	j	1104 <malloc+0x134>
    }
    if(p == freep)
    10c2:	00000797          	auipc	a5,0x0
    10c6:	4b678793          	addi	a5,a5,1206 # 1578 <freep>
    10ca:	639c                	ld	a5,0(a5)
    10cc:	fe843703          	ld	a4,-24(s0)
    10d0:	02f71063          	bne	a4,a5,10f0 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    10d4:	fdc42783          	lw	a5,-36(s0)
    10d8:	853e                	mv	a0,a5
    10da:	00000097          	auipc	ra,0x0
    10de:	e76080e7          	jalr	-394(ra) # f50 <morecore>
    10e2:	fea43423          	sd	a0,-24(s0)
    10e6:	fe843783          	ld	a5,-24(s0)
    10ea:	e399                	bnez	a5,10f0 <malloc+0x120>
        return 0;
    10ec:	4781                	li	a5,0
    10ee:	a819                	j	1104 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10f0:	fe843783          	ld	a5,-24(s0)
    10f4:	fef43023          	sd	a5,-32(s0)
    10f8:	fe843783          	ld	a5,-24(s0)
    10fc:	639c                	ld	a5,0(a5)
    10fe:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    1102:	b791                	j	1046 <malloc+0x76>
  }
}
    1104:	853e                	mv	a0,a5
    1106:	70e2                	ld	ra,56(sp)
    1108:	7442                	ld	s0,48(sp)
    110a:	6121                	addi	sp,sp,64
    110c:	8082                	ret
