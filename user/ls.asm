
user/_ls:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <fmtname>:
#include "user/user.h"
#include "kernel/fs.h"

char*
fmtname(char *path)
{
       0:	7139                	addi	sp,sp,-64
       2:	fc06                	sd	ra,56(sp)
       4:	f822                	sd	s0,48(sp)
       6:	f426                	sd	s1,40(sp)
       8:	0080                	addi	s0,sp,64
       a:	fca43423          	sd	a0,-56(s0)
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
       e:	fc843503          	ld	a0,-56(s0)
      12:	00000097          	auipc	ra,0x0
      16:	42e080e7          	jalr	1070(ra) # 440 <strlen>
      1a:	87aa                	mv	a5,a0
      1c:	2781                	sext.w	a5,a5
      1e:	1782                	slli	a5,a5,0x20
      20:	9381                	srli	a5,a5,0x20
      22:	fc843703          	ld	a4,-56(s0)
      26:	97ba                	add	a5,a5,a4
      28:	fcf43c23          	sd	a5,-40(s0)
      2c:	a031                	j	38 <fmtname+0x38>
      2e:	fd843783          	ld	a5,-40(s0)
      32:	17fd                	addi	a5,a5,-1
      34:	fcf43c23          	sd	a5,-40(s0)
      38:	fd843703          	ld	a4,-40(s0)
      3c:	fc843783          	ld	a5,-56(s0)
      40:	00f76b63          	bltu	a4,a5,56 <fmtname+0x56>
      44:	fd843783          	ld	a5,-40(s0)
      48:	0007c783          	lbu	a5,0(a5)
      4c:	873e                	mv	a4,a5
      4e:	02f00793          	li	a5,47
      52:	fcf71ee3          	bne	a4,a5,2e <fmtname+0x2e>
    ;
  p++;
      56:	fd843783          	ld	a5,-40(s0)
      5a:	0785                	addi	a5,a5,1
      5c:	fcf43c23          	sd	a5,-40(s0)

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
      60:	fd843503          	ld	a0,-40(s0)
      64:	00000097          	auipc	ra,0x0
      68:	3dc080e7          	jalr	988(ra) # 440 <strlen>
      6c:	87aa                	mv	a5,a0
      6e:	2781                	sext.w	a5,a5
      70:	873e                	mv	a4,a5
      72:	47b5                	li	a5,13
      74:	00e7f563          	bgeu	a5,a4,7e <fmtname+0x7e>
    return p;
      78:	fd843783          	ld	a5,-40(s0)
      7c:	a8b5                	j	f8 <fmtname+0xf8>
  memmove(buf, p, strlen(p));
      7e:	fd843503          	ld	a0,-40(s0)
      82:	00000097          	auipc	ra,0x0
      86:	3be080e7          	jalr	958(ra) # 440 <strlen>
      8a:	87aa                	mv	a5,a0
      8c:	2781                	sext.w	a5,a5
      8e:	2781                	sext.w	a5,a5
      90:	863e                	mv	a2,a5
      92:	fd843583          	ld	a1,-40(s0)
      96:	00001517          	auipc	a0,0x1
      9a:	08250513          	addi	a0,a0,130 # 1118 <buf.1111>
      9e:	00000097          	auipc	ra,0x0
      a2:	5fc080e7          	jalr	1532(ra) # 69a <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
      a6:	fd843503          	ld	a0,-40(s0)
      aa:	00000097          	auipc	ra,0x0
      ae:	396080e7          	jalr	918(ra) # 440 <strlen>
      b2:	87aa                	mv	a5,a0
      b4:	2781                	sext.w	a5,a5
      b6:	02079713          	slli	a4,a5,0x20
      ba:	9301                	srli	a4,a4,0x20
      bc:	00001797          	auipc	a5,0x1
      c0:	05c78793          	addi	a5,a5,92 # 1118 <buf.1111>
      c4:	00f704b3          	add	s1,a4,a5
      c8:	fd843503          	ld	a0,-40(s0)
      cc:	00000097          	auipc	ra,0x0
      d0:	374080e7          	jalr	884(ra) # 440 <strlen>
      d4:	87aa                	mv	a5,a0
      d6:	2781                	sext.w	a5,a5
      d8:	4739                	li	a4,14
      da:	40f707bb          	subw	a5,a4,a5
      de:	2781                	sext.w	a5,a5
      e0:	863e                	mv	a2,a5
      e2:	02000593          	li	a1,32
      e6:	8526                	mv	a0,s1
      e8:	00000097          	auipc	ra,0x0
      ec:	38e080e7          	jalr	910(ra) # 476 <memset>
  return buf;
      f0:	00001797          	auipc	a5,0x1
      f4:	02878793          	addi	a5,a5,40 # 1118 <buf.1111>
}
      f8:	853e                	mv	a0,a5
      fa:	70e2                	ld	ra,56(sp)
      fc:	7442                	ld	s0,48(sp)
      fe:	74a2                	ld	s1,40(sp)
     100:	6121                	addi	sp,sp,64
     102:	8082                	ret

0000000000000104 <ls>:

void
ls(char *path)
{
     104:	da010113          	addi	sp,sp,-608
     108:	24113c23          	sd	ra,600(sp)
     10c:	24813823          	sd	s0,592(sp)
     110:	1480                	addi	s0,sp,608
     112:	daa43423          	sd	a0,-600(s0)
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
     116:	4581                	li	a1,0
     118:	da843503          	ld	a0,-600(s0)
     11c:	00000097          	auipc	ra,0x0
     120:	744080e7          	jalr	1860(ra) # 860 <open>
     124:	87aa                	mv	a5,a0
     126:	fef42623          	sw	a5,-20(s0)
     12a:	fec42783          	lw	a5,-20(s0)
     12e:	2781                	sext.w	a5,a5
     130:	0007de63          	bgez	a5,14c <ls+0x48>
    fprintf(2, "ls: cannot open %s\n", path);
     134:	da843603          	ld	a2,-600(s0)
     138:	00001597          	auipc	a1,0x1
     13c:	f5058593          	addi	a1,a1,-176 # 1088 <malloc+0x140>
     140:	4509                	li	a0,2
     142:	00001097          	auipc	ra,0x1
     146:	bbc080e7          	jalr	-1092(ra) # cfe <fprintf>
    return;
     14a:	aa6d                	j	304 <ls+0x200>
  }

  if(fstat(fd, &st) < 0){
     14c:	db840713          	addi	a4,s0,-584
     150:	fec42783          	lw	a5,-20(s0)
     154:	85ba                	mv	a1,a4
     156:	853e                	mv	a0,a5
     158:	00000097          	auipc	ra,0x0
     15c:	720080e7          	jalr	1824(ra) # 878 <fstat>
     160:	87aa                	mv	a5,a0
     162:	0207d563          	bgez	a5,18c <ls+0x88>
    fprintf(2, "ls: cannot stat %s\n", path);
     166:	da843603          	ld	a2,-600(s0)
     16a:	00001597          	auipc	a1,0x1
     16e:	f3658593          	addi	a1,a1,-202 # 10a0 <malloc+0x158>
     172:	4509                	li	a0,2
     174:	00001097          	auipc	ra,0x1
     178:	b8a080e7          	jalr	-1142(ra) # cfe <fprintf>
    close(fd);
     17c:	fec42783          	lw	a5,-20(s0)
     180:	853e                	mv	a0,a5
     182:	00000097          	auipc	ra,0x0
     186:	6c6080e7          	jalr	1734(ra) # 848 <close>
    return;
     18a:	aaad                	j	304 <ls+0x200>
  }

  switch(st.type){
     18c:	dc041783          	lh	a5,-576(s0)
     190:	0007871b          	sext.w	a4,a5
     194:	86ba                	mv	a3,a4
     196:	4785                	li	a5,1
     198:	02f68d63          	beq	a3,a5,1d2 <ls+0xce>
     19c:	4789                	li	a5,2
     19e:	14f71c63          	bne	a4,a5,2f6 <ls+0x1f2>
  case T_FILE:
    printf("%s %d %d %l\n", fmtname(path), st.type, st.ino, st.size);
     1a2:	da843503          	ld	a0,-600(s0)
     1a6:	00000097          	auipc	ra,0x0
     1aa:	e5a080e7          	jalr	-422(ra) # 0 <fmtname>
     1ae:	85aa                	mv	a1,a0
     1b0:	dc041783          	lh	a5,-576(s0)
     1b4:	2781                	sext.w	a5,a5
     1b6:	dbc42683          	lw	a3,-580(s0)
     1ba:	dc843703          	ld	a4,-568(s0)
     1be:	863e                	mv	a2,a5
     1c0:	00001517          	auipc	a0,0x1
     1c4:	ef850513          	addi	a0,a0,-264 # 10b8 <malloc+0x170>
     1c8:	00001097          	auipc	ra,0x1
     1cc:	b8e080e7          	jalr	-1138(ra) # d56 <printf>
    break;
     1d0:	a21d                	j	2f6 <ls+0x1f2>

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
     1d2:	da843503          	ld	a0,-600(s0)
     1d6:	00000097          	auipc	ra,0x0
     1da:	26a080e7          	jalr	618(ra) # 440 <strlen>
     1de:	87aa                	mv	a5,a0
     1e0:	2781                	sext.w	a5,a5
     1e2:	27c1                	addiw	a5,a5,16
     1e4:	2781                	sext.w	a5,a5
     1e6:	873e                	mv	a4,a5
     1e8:	20000793          	li	a5,512
     1ec:	00e7fb63          	bgeu	a5,a4,202 <ls+0xfe>
      printf("ls: path too long\n");
     1f0:	00001517          	auipc	a0,0x1
     1f4:	ed850513          	addi	a0,a0,-296 # 10c8 <malloc+0x180>
     1f8:	00001097          	auipc	ra,0x1
     1fc:	b5e080e7          	jalr	-1186(ra) # d56 <printf>
      break;
     200:	a8dd                	j	2f6 <ls+0x1f2>
    }
    strcpy(buf, path);
     202:	de040793          	addi	a5,s0,-544
     206:	da843583          	ld	a1,-600(s0)
     20a:	853e                	mv	a0,a5
     20c:	00000097          	auipc	ra,0x0
     210:	184080e7          	jalr	388(ra) # 390 <strcpy>
    p = buf+strlen(buf);
     214:	de040793          	addi	a5,s0,-544
     218:	853e                	mv	a0,a5
     21a:	00000097          	auipc	ra,0x0
     21e:	226080e7          	jalr	550(ra) # 440 <strlen>
     222:	87aa                	mv	a5,a0
     224:	2781                	sext.w	a5,a5
     226:	1782                	slli	a5,a5,0x20
     228:	9381                	srli	a5,a5,0x20
     22a:	de040713          	addi	a4,s0,-544
     22e:	97ba                	add	a5,a5,a4
     230:	fef43023          	sd	a5,-32(s0)
    *p++ = '/';
     234:	fe043783          	ld	a5,-32(s0)
     238:	00178713          	addi	a4,a5,1
     23c:	fee43023          	sd	a4,-32(s0)
     240:	02f00713          	li	a4,47
     244:	00e78023          	sb	a4,0(a5)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     248:	a071                	j	2d4 <ls+0x1d0>
      if(de.inum == 0)
     24a:	dd045783          	lhu	a5,-560(s0)
     24e:	e391                	bnez	a5,252 <ls+0x14e>
        continue;
     250:	a051                	j	2d4 <ls+0x1d0>
      memmove(p, de.name, DIRSIZ);
     252:	dd040793          	addi	a5,s0,-560
     256:	0789                	addi	a5,a5,2
     258:	4639                	li	a2,14
     25a:	85be                	mv	a1,a5
     25c:	fe043503          	ld	a0,-32(s0)
     260:	00000097          	auipc	ra,0x0
     264:	43a080e7          	jalr	1082(ra) # 69a <memmove>
      p[DIRSIZ] = 0;
     268:	fe043783          	ld	a5,-32(s0)
     26c:	07b9                	addi	a5,a5,14
     26e:	00078023          	sb	zero,0(a5)
      if(stat(buf, &st) < 0){
     272:	db840713          	addi	a4,s0,-584
     276:	de040793          	addi	a5,s0,-544
     27a:	85ba                	mv	a1,a4
     27c:	853e                	mv	a0,a5
     27e:	00000097          	auipc	ra,0x0
     282:	344080e7          	jalr	836(ra) # 5c2 <stat>
     286:	87aa                	mv	a5,a0
     288:	0007de63          	bgez	a5,2a4 <ls+0x1a0>
        printf("ls: cannot stat %s\n", buf);
     28c:	de040793          	addi	a5,s0,-544
     290:	85be                	mv	a1,a5
     292:	00001517          	auipc	a0,0x1
     296:	e0e50513          	addi	a0,a0,-498 # 10a0 <malloc+0x158>
     29a:	00001097          	auipc	ra,0x1
     29e:	abc080e7          	jalr	-1348(ra) # d56 <printf>
        continue;
     2a2:	a80d                	j	2d4 <ls+0x1d0>
      }
      printf("%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
     2a4:	de040793          	addi	a5,s0,-544
     2a8:	853e                	mv	a0,a5
     2aa:	00000097          	auipc	ra,0x0
     2ae:	d56080e7          	jalr	-682(ra) # 0 <fmtname>
     2b2:	85aa                	mv	a1,a0
     2b4:	dc041783          	lh	a5,-576(s0)
     2b8:	2781                	sext.w	a5,a5
     2ba:	dbc42683          	lw	a3,-580(s0)
     2be:	dc843703          	ld	a4,-568(s0)
     2c2:	863e                	mv	a2,a5
     2c4:	00001517          	auipc	a0,0x1
     2c8:	e1c50513          	addi	a0,a0,-484 # 10e0 <malloc+0x198>
     2cc:	00001097          	auipc	ra,0x1
     2d0:	a8a080e7          	jalr	-1398(ra) # d56 <printf>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     2d4:	dd040713          	addi	a4,s0,-560
     2d8:	fec42783          	lw	a5,-20(s0)
     2dc:	4641                	li	a2,16
     2de:	85ba                	mv	a1,a4
     2e0:	853e                	mv	a0,a5
     2e2:	00000097          	auipc	ra,0x0
     2e6:	556080e7          	jalr	1366(ra) # 838 <read>
     2ea:	87aa                	mv	a5,a0
     2ec:	873e                	mv	a4,a5
     2ee:	47c1                	li	a5,16
     2f0:	f4f70de3          	beq	a4,a5,24a <ls+0x146>
    }
    break;
     2f4:	0001                	nop
  }
  close(fd);
     2f6:	fec42783          	lw	a5,-20(s0)
     2fa:	853e                	mv	a0,a5
     2fc:	00000097          	auipc	ra,0x0
     300:	54c080e7          	jalr	1356(ra) # 848 <close>
}
     304:	25813083          	ld	ra,600(sp)
     308:	25013403          	ld	s0,592(sp)
     30c:	26010113          	addi	sp,sp,608
     310:	8082                	ret

0000000000000312 <main>:

int
main(int argc, char *argv[])
{
     312:	7179                	addi	sp,sp,-48
     314:	f406                	sd	ra,40(sp)
     316:	f022                	sd	s0,32(sp)
     318:	1800                	addi	s0,sp,48
     31a:	87aa                	mv	a5,a0
     31c:	fcb43823          	sd	a1,-48(s0)
     320:	fcf42e23          	sw	a5,-36(s0)
  int i;

  if(argc < 2){
     324:	fdc42783          	lw	a5,-36(s0)
     328:	0007871b          	sext.w	a4,a5
     32c:	4785                	li	a5,1
     32e:	00e7cf63          	blt	a5,a4,34c <main+0x3a>
    ls(".");
     332:	00001517          	auipc	a0,0x1
     336:	dbe50513          	addi	a0,a0,-578 # 10f0 <malloc+0x1a8>
     33a:	00000097          	auipc	ra,0x0
     33e:	dca080e7          	jalr	-566(ra) # 104 <ls>
    exit(0);
     342:	4501                	li	a0,0
     344:	00000097          	auipc	ra,0x0
     348:	4dc080e7          	jalr	1244(ra) # 820 <exit>
  }
  for(i=1; i<argc; i++)
     34c:	4785                	li	a5,1
     34e:	fef42623          	sw	a5,-20(s0)
     352:	a015                	j	376 <main+0x64>
    ls(argv[i]);
     354:	fec42783          	lw	a5,-20(s0)
     358:	078e                	slli	a5,a5,0x3
     35a:	fd043703          	ld	a4,-48(s0)
     35e:	97ba                	add	a5,a5,a4
     360:	639c                	ld	a5,0(a5)
     362:	853e                	mv	a0,a5
     364:	00000097          	auipc	ra,0x0
     368:	da0080e7          	jalr	-608(ra) # 104 <ls>
  for(i=1; i<argc; i++)
     36c:	fec42783          	lw	a5,-20(s0)
     370:	2785                	addiw	a5,a5,1
     372:	fef42623          	sw	a5,-20(s0)
     376:	fec42703          	lw	a4,-20(s0)
     37a:	fdc42783          	lw	a5,-36(s0)
     37e:	2701                	sext.w	a4,a4
     380:	2781                	sext.w	a5,a5
     382:	fcf749e3          	blt	a4,a5,354 <main+0x42>
  exit(0);
     386:	4501                	li	a0,0
     388:	00000097          	auipc	ra,0x0
     38c:	498080e7          	jalr	1176(ra) # 820 <exit>

0000000000000390 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     390:	7179                	addi	sp,sp,-48
     392:	f422                	sd	s0,40(sp)
     394:	1800                	addi	s0,sp,48
     396:	fca43c23          	sd	a0,-40(s0)
     39a:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     39e:	fd843783          	ld	a5,-40(s0)
     3a2:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     3a6:	0001                	nop
     3a8:	fd043703          	ld	a4,-48(s0)
     3ac:	00170793          	addi	a5,a4,1
     3b0:	fcf43823          	sd	a5,-48(s0)
     3b4:	fd843783          	ld	a5,-40(s0)
     3b8:	00178693          	addi	a3,a5,1
     3bc:	fcd43c23          	sd	a3,-40(s0)
     3c0:	00074703          	lbu	a4,0(a4)
     3c4:	00e78023          	sb	a4,0(a5)
     3c8:	0007c783          	lbu	a5,0(a5)
     3cc:	fff1                	bnez	a5,3a8 <strcpy+0x18>
    ;
  return os;
     3ce:	fe843783          	ld	a5,-24(s0)
}
     3d2:	853e                	mv	a0,a5
     3d4:	7422                	ld	s0,40(sp)
     3d6:	6145                	addi	sp,sp,48
     3d8:	8082                	ret

00000000000003da <strcmp>:

int
strcmp(const char *p, const char *q)
{
     3da:	1101                	addi	sp,sp,-32
     3dc:	ec22                	sd	s0,24(sp)
     3de:	1000                	addi	s0,sp,32
     3e0:	fea43423          	sd	a0,-24(s0)
     3e4:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     3e8:	a819                	j	3fe <strcmp+0x24>
    p++, q++;
     3ea:	fe843783          	ld	a5,-24(s0)
     3ee:	0785                	addi	a5,a5,1
     3f0:	fef43423          	sd	a5,-24(s0)
     3f4:	fe043783          	ld	a5,-32(s0)
     3f8:	0785                	addi	a5,a5,1
     3fa:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     3fe:	fe843783          	ld	a5,-24(s0)
     402:	0007c783          	lbu	a5,0(a5)
     406:	cb99                	beqz	a5,41c <strcmp+0x42>
     408:	fe843783          	ld	a5,-24(s0)
     40c:	0007c703          	lbu	a4,0(a5)
     410:	fe043783          	ld	a5,-32(s0)
     414:	0007c783          	lbu	a5,0(a5)
     418:	fcf709e3          	beq	a4,a5,3ea <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     41c:	fe843783          	ld	a5,-24(s0)
     420:	0007c783          	lbu	a5,0(a5)
     424:	0007871b          	sext.w	a4,a5
     428:	fe043783          	ld	a5,-32(s0)
     42c:	0007c783          	lbu	a5,0(a5)
     430:	2781                	sext.w	a5,a5
     432:	40f707bb          	subw	a5,a4,a5
     436:	2781                	sext.w	a5,a5
}
     438:	853e                	mv	a0,a5
     43a:	6462                	ld	s0,24(sp)
     43c:	6105                	addi	sp,sp,32
     43e:	8082                	ret

0000000000000440 <strlen>:

uint
strlen(const char *s)
{
     440:	7179                	addi	sp,sp,-48
     442:	f422                	sd	s0,40(sp)
     444:	1800                	addi	s0,sp,48
     446:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     44a:	fe042623          	sw	zero,-20(s0)
     44e:	a031                	j	45a <strlen+0x1a>
     450:	fec42783          	lw	a5,-20(s0)
     454:	2785                	addiw	a5,a5,1
     456:	fef42623          	sw	a5,-20(s0)
     45a:	fec42783          	lw	a5,-20(s0)
     45e:	fd843703          	ld	a4,-40(s0)
     462:	97ba                	add	a5,a5,a4
     464:	0007c783          	lbu	a5,0(a5)
     468:	f7e5                	bnez	a5,450 <strlen+0x10>
    ;
  return n;
     46a:	fec42783          	lw	a5,-20(s0)
}
     46e:	853e                	mv	a0,a5
     470:	7422                	ld	s0,40(sp)
     472:	6145                	addi	sp,sp,48
     474:	8082                	ret

0000000000000476 <memset>:

void*
memset(void *dst, int c, uint n)
{
     476:	7179                	addi	sp,sp,-48
     478:	f422                	sd	s0,40(sp)
     47a:	1800                	addi	s0,sp,48
     47c:	fca43c23          	sd	a0,-40(s0)
     480:	87ae                	mv	a5,a1
     482:	8732                	mv	a4,a2
     484:	fcf42a23          	sw	a5,-44(s0)
     488:	87ba                	mv	a5,a4
     48a:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     48e:	fd843783          	ld	a5,-40(s0)
     492:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     496:	fe042623          	sw	zero,-20(s0)
     49a:	a00d                	j	4bc <memset+0x46>
    cdst[i] = c;
     49c:	fec42783          	lw	a5,-20(s0)
     4a0:	fe043703          	ld	a4,-32(s0)
     4a4:	97ba                	add	a5,a5,a4
     4a6:	fd442703          	lw	a4,-44(s0)
     4aa:	0ff77713          	andi	a4,a4,255
     4ae:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     4b2:	fec42783          	lw	a5,-20(s0)
     4b6:	2785                	addiw	a5,a5,1
     4b8:	fef42623          	sw	a5,-20(s0)
     4bc:	fec42703          	lw	a4,-20(s0)
     4c0:	fd042783          	lw	a5,-48(s0)
     4c4:	2781                	sext.w	a5,a5
     4c6:	fcf76be3          	bltu	a4,a5,49c <memset+0x26>
  }
  return dst;
     4ca:	fd843783          	ld	a5,-40(s0)
}
     4ce:	853e                	mv	a0,a5
     4d0:	7422                	ld	s0,40(sp)
     4d2:	6145                	addi	sp,sp,48
     4d4:	8082                	ret

00000000000004d6 <strchr>:

char*
strchr(const char *s, char c)
{
     4d6:	1101                	addi	sp,sp,-32
     4d8:	ec22                	sd	s0,24(sp)
     4da:	1000                	addi	s0,sp,32
     4dc:	fea43423          	sd	a0,-24(s0)
     4e0:	87ae                	mv	a5,a1
     4e2:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     4e6:	a01d                	j	50c <strchr+0x36>
    if(*s == c)
     4e8:	fe843783          	ld	a5,-24(s0)
     4ec:	0007c703          	lbu	a4,0(a5)
     4f0:	fe744783          	lbu	a5,-25(s0)
     4f4:	0ff7f793          	andi	a5,a5,255
     4f8:	00e79563          	bne	a5,a4,502 <strchr+0x2c>
      return (char*)s;
     4fc:	fe843783          	ld	a5,-24(s0)
     500:	a821                	j	518 <strchr+0x42>
  for(; *s; s++)
     502:	fe843783          	ld	a5,-24(s0)
     506:	0785                	addi	a5,a5,1
     508:	fef43423          	sd	a5,-24(s0)
     50c:	fe843783          	ld	a5,-24(s0)
     510:	0007c783          	lbu	a5,0(a5)
     514:	fbf1                	bnez	a5,4e8 <strchr+0x12>
  return 0;
     516:	4781                	li	a5,0
}
     518:	853e                	mv	a0,a5
     51a:	6462                	ld	s0,24(sp)
     51c:	6105                	addi	sp,sp,32
     51e:	8082                	ret

0000000000000520 <gets>:

char*
gets(char *buf, int max)
{
     520:	7179                	addi	sp,sp,-48
     522:	f406                	sd	ra,40(sp)
     524:	f022                	sd	s0,32(sp)
     526:	1800                	addi	s0,sp,48
     528:	fca43c23          	sd	a0,-40(s0)
     52c:	87ae                	mv	a5,a1
     52e:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     532:	fe042623          	sw	zero,-20(s0)
     536:	a8a1                	j	58e <gets+0x6e>
    cc = read(0, &c, 1);
     538:	fe740793          	addi	a5,s0,-25
     53c:	4605                	li	a2,1
     53e:	85be                	mv	a1,a5
     540:	4501                	li	a0,0
     542:	00000097          	auipc	ra,0x0
     546:	2f6080e7          	jalr	758(ra) # 838 <read>
     54a:	87aa                	mv	a5,a0
     54c:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     550:	fe842783          	lw	a5,-24(s0)
     554:	2781                	sext.w	a5,a5
     556:	04f05763          	blez	a5,5a4 <gets+0x84>
      break;
    buf[i++] = c;
     55a:	fec42783          	lw	a5,-20(s0)
     55e:	0017871b          	addiw	a4,a5,1
     562:	fee42623          	sw	a4,-20(s0)
     566:	873e                	mv	a4,a5
     568:	fd843783          	ld	a5,-40(s0)
     56c:	97ba                	add	a5,a5,a4
     56e:	fe744703          	lbu	a4,-25(s0)
     572:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     576:	fe744783          	lbu	a5,-25(s0)
     57a:	873e                	mv	a4,a5
     57c:	47a9                	li	a5,10
     57e:	02f70463          	beq	a4,a5,5a6 <gets+0x86>
     582:	fe744783          	lbu	a5,-25(s0)
     586:	873e                	mv	a4,a5
     588:	47b5                	li	a5,13
     58a:	00f70e63          	beq	a4,a5,5a6 <gets+0x86>
  for(i=0; i+1 < max; ){
     58e:	fec42783          	lw	a5,-20(s0)
     592:	2785                	addiw	a5,a5,1
     594:	0007871b          	sext.w	a4,a5
     598:	fd442783          	lw	a5,-44(s0)
     59c:	2781                	sext.w	a5,a5
     59e:	f8f74de3          	blt	a4,a5,538 <gets+0x18>
     5a2:	a011                	j	5a6 <gets+0x86>
      break;
     5a4:	0001                	nop
      break;
  }
  buf[i] = '\0';
     5a6:	fec42783          	lw	a5,-20(s0)
     5aa:	fd843703          	ld	a4,-40(s0)
     5ae:	97ba                	add	a5,a5,a4
     5b0:	00078023          	sb	zero,0(a5)
  return buf;
     5b4:	fd843783          	ld	a5,-40(s0)
}
     5b8:	853e                	mv	a0,a5
     5ba:	70a2                	ld	ra,40(sp)
     5bc:	7402                	ld	s0,32(sp)
     5be:	6145                	addi	sp,sp,48
     5c0:	8082                	ret

00000000000005c2 <stat>:

int
stat(const char *n, struct stat *st)
{
     5c2:	7179                	addi	sp,sp,-48
     5c4:	f406                	sd	ra,40(sp)
     5c6:	f022                	sd	s0,32(sp)
     5c8:	1800                	addi	s0,sp,48
     5ca:	fca43c23          	sd	a0,-40(s0)
     5ce:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     5d2:	4581                	li	a1,0
     5d4:	fd843503          	ld	a0,-40(s0)
     5d8:	00000097          	auipc	ra,0x0
     5dc:	288080e7          	jalr	648(ra) # 860 <open>
     5e0:	87aa                	mv	a5,a0
     5e2:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     5e6:	fec42783          	lw	a5,-20(s0)
     5ea:	2781                	sext.w	a5,a5
     5ec:	0007d463          	bgez	a5,5f4 <stat+0x32>
    return -1;
     5f0:	57fd                	li	a5,-1
     5f2:	a035                	j	61e <stat+0x5c>
  r = fstat(fd, st);
     5f4:	fec42783          	lw	a5,-20(s0)
     5f8:	fd043583          	ld	a1,-48(s0)
     5fc:	853e                	mv	a0,a5
     5fe:	00000097          	auipc	ra,0x0
     602:	27a080e7          	jalr	634(ra) # 878 <fstat>
     606:	87aa                	mv	a5,a0
     608:	fef42423          	sw	a5,-24(s0)
  close(fd);
     60c:	fec42783          	lw	a5,-20(s0)
     610:	853e                	mv	a0,a5
     612:	00000097          	auipc	ra,0x0
     616:	236080e7          	jalr	566(ra) # 848 <close>
  return r;
     61a:	fe842783          	lw	a5,-24(s0)
}
     61e:	853e                	mv	a0,a5
     620:	70a2                	ld	ra,40(sp)
     622:	7402                	ld	s0,32(sp)
     624:	6145                	addi	sp,sp,48
     626:	8082                	ret

0000000000000628 <atoi>:

int
atoi(const char *s)
{
     628:	7179                	addi	sp,sp,-48
     62a:	f422                	sd	s0,40(sp)
     62c:	1800                	addi	s0,sp,48
     62e:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     632:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     636:	a815                	j	66a <atoi+0x42>
    n = n*10 + *s++ - '0';
     638:	fec42703          	lw	a4,-20(s0)
     63c:	87ba                	mv	a5,a4
     63e:	0027979b          	slliw	a5,a5,0x2
     642:	9fb9                	addw	a5,a5,a4
     644:	0017979b          	slliw	a5,a5,0x1
     648:	0007871b          	sext.w	a4,a5
     64c:	fd843783          	ld	a5,-40(s0)
     650:	00178693          	addi	a3,a5,1
     654:	fcd43c23          	sd	a3,-40(s0)
     658:	0007c783          	lbu	a5,0(a5)
     65c:	2781                	sext.w	a5,a5
     65e:	9fb9                	addw	a5,a5,a4
     660:	2781                	sext.w	a5,a5
     662:	fd07879b          	addiw	a5,a5,-48
     666:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     66a:	fd843783          	ld	a5,-40(s0)
     66e:	0007c783          	lbu	a5,0(a5)
     672:	873e                	mv	a4,a5
     674:	02f00793          	li	a5,47
     678:	00e7fb63          	bgeu	a5,a4,68e <atoi+0x66>
     67c:	fd843783          	ld	a5,-40(s0)
     680:	0007c783          	lbu	a5,0(a5)
     684:	873e                	mv	a4,a5
     686:	03900793          	li	a5,57
     68a:	fae7f7e3          	bgeu	a5,a4,638 <atoi+0x10>
  return n;
     68e:	fec42783          	lw	a5,-20(s0)
}
     692:	853e                	mv	a0,a5
     694:	7422                	ld	s0,40(sp)
     696:	6145                	addi	sp,sp,48
     698:	8082                	ret

000000000000069a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     69a:	7139                	addi	sp,sp,-64
     69c:	fc22                	sd	s0,56(sp)
     69e:	0080                	addi	s0,sp,64
     6a0:	fca43c23          	sd	a0,-40(s0)
     6a4:	fcb43823          	sd	a1,-48(s0)
     6a8:	87b2                	mv	a5,a2
     6aa:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     6ae:	fd843783          	ld	a5,-40(s0)
     6b2:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     6b6:	fd043783          	ld	a5,-48(s0)
     6ba:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     6be:	fe043703          	ld	a4,-32(s0)
     6c2:	fe843783          	ld	a5,-24(s0)
     6c6:	02e7fc63          	bgeu	a5,a4,6fe <memmove+0x64>
    while(n-- > 0)
     6ca:	a00d                	j	6ec <memmove+0x52>
      *dst++ = *src++;
     6cc:	fe043703          	ld	a4,-32(s0)
     6d0:	00170793          	addi	a5,a4,1
     6d4:	fef43023          	sd	a5,-32(s0)
     6d8:	fe843783          	ld	a5,-24(s0)
     6dc:	00178693          	addi	a3,a5,1
     6e0:	fed43423          	sd	a3,-24(s0)
     6e4:	00074703          	lbu	a4,0(a4)
     6e8:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     6ec:	fcc42783          	lw	a5,-52(s0)
     6f0:	fff7871b          	addiw	a4,a5,-1
     6f4:	fce42623          	sw	a4,-52(s0)
     6f8:	fcf04ae3          	bgtz	a5,6cc <memmove+0x32>
     6fc:	a891                	j	750 <memmove+0xb6>
  } else {
    dst += n;
     6fe:	fcc42783          	lw	a5,-52(s0)
     702:	fe843703          	ld	a4,-24(s0)
     706:	97ba                	add	a5,a5,a4
     708:	fef43423          	sd	a5,-24(s0)
    src += n;
     70c:	fcc42783          	lw	a5,-52(s0)
     710:	fe043703          	ld	a4,-32(s0)
     714:	97ba                	add	a5,a5,a4
     716:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     71a:	a01d                	j	740 <memmove+0xa6>
      *--dst = *--src;
     71c:	fe043783          	ld	a5,-32(s0)
     720:	17fd                	addi	a5,a5,-1
     722:	fef43023          	sd	a5,-32(s0)
     726:	fe843783          	ld	a5,-24(s0)
     72a:	17fd                	addi	a5,a5,-1
     72c:	fef43423          	sd	a5,-24(s0)
     730:	fe043783          	ld	a5,-32(s0)
     734:	0007c703          	lbu	a4,0(a5)
     738:	fe843783          	ld	a5,-24(s0)
     73c:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     740:	fcc42783          	lw	a5,-52(s0)
     744:	fff7871b          	addiw	a4,a5,-1
     748:	fce42623          	sw	a4,-52(s0)
     74c:	fcf048e3          	bgtz	a5,71c <memmove+0x82>
  }
  return vdst;
     750:	fd843783          	ld	a5,-40(s0)
}
     754:	853e                	mv	a0,a5
     756:	7462                	ld	s0,56(sp)
     758:	6121                	addi	sp,sp,64
     75a:	8082                	ret

000000000000075c <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     75c:	7139                	addi	sp,sp,-64
     75e:	fc22                	sd	s0,56(sp)
     760:	0080                	addi	s0,sp,64
     762:	fca43c23          	sd	a0,-40(s0)
     766:	fcb43823          	sd	a1,-48(s0)
     76a:	87b2                	mv	a5,a2
     76c:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     770:	fd843783          	ld	a5,-40(s0)
     774:	fef43423          	sd	a5,-24(s0)
     778:	fd043783          	ld	a5,-48(s0)
     77c:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     780:	a0a1                	j	7c8 <memcmp+0x6c>
    if (*p1 != *p2) {
     782:	fe843783          	ld	a5,-24(s0)
     786:	0007c703          	lbu	a4,0(a5)
     78a:	fe043783          	ld	a5,-32(s0)
     78e:	0007c783          	lbu	a5,0(a5)
     792:	02f70163          	beq	a4,a5,7b4 <memcmp+0x58>
      return *p1 - *p2;
     796:	fe843783          	ld	a5,-24(s0)
     79a:	0007c783          	lbu	a5,0(a5)
     79e:	0007871b          	sext.w	a4,a5
     7a2:	fe043783          	ld	a5,-32(s0)
     7a6:	0007c783          	lbu	a5,0(a5)
     7aa:	2781                	sext.w	a5,a5
     7ac:	40f707bb          	subw	a5,a4,a5
     7b0:	2781                	sext.w	a5,a5
     7b2:	a01d                	j	7d8 <memcmp+0x7c>
    }
    p1++;
     7b4:	fe843783          	ld	a5,-24(s0)
     7b8:	0785                	addi	a5,a5,1
     7ba:	fef43423          	sd	a5,-24(s0)
    p2++;
     7be:	fe043783          	ld	a5,-32(s0)
     7c2:	0785                	addi	a5,a5,1
     7c4:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     7c8:	fcc42783          	lw	a5,-52(s0)
     7cc:	fff7871b          	addiw	a4,a5,-1
     7d0:	fce42623          	sw	a4,-52(s0)
     7d4:	f7dd                	bnez	a5,782 <memcmp+0x26>
  }
  return 0;
     7d6:	4781                	li	a5,0
}
     7d8:	853e                	mv	a0,a5
     7da:	7462                	ld	s0,56(sp)
     7dc:	6121                	addi	sp,sp,64
     7de:	8082                	ret

00000000000007e0 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     7e0:	7179                	addi	sp,sp,-48
     7e2:	f406                	sd	ra,40(sp)
     7e4:	f022                	sd	s0,32(sp)
     7e6:	1800                	addi	s0,sp,48
     7e8:	fea43423          	sd	a0,-24(s0)
     7ec:	feb43023          	sd	a1,-32(s0)
     7f0:	87b2                	mv	a5,a2
     7f2:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     7f6:	fdc42783          	lw	a5,-36(s0)
     7fa:	863e                	mv	a2,a5
     7fc:	fe043583          	ld	a1,-32(s0)
     800:	fe843503          	ld	a0,-24(s0)
     804:	00000097          	auipc	ra,0x0
     808:	e96080e7          	jalr	-362(ra) # 69a <memmove>
     80c:	87aa                	mv	a5,a0
}
     80e:	853e                	mv	a0,a5
     810:	70a2                	ld	ra,40(sp)
     812:	7402                	ld	s0,32(sp)
     814:	6145                	addi	sp,sp,48
     816:	8082                	ret

0000000000000818 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     818:	4885                	li	a7,1
 ecall
     81a:	00000073          	ecall
 ret
     81e:	8082                	ret

0000000000000820 <exit>:
.global exit
exit:
 li a7, SYS_exit
     820:	4889                	li	a7,2
 ecall
     822:	00000073          	ecall
 ret
     826:	8082                	ret

0000000000000828 <wait>:
.global wait
wait:
 li a7, SYS_wait
     828:	488d                	li	a7,3
 ecall
     82a:	00000073          	ecall
 ret
     82e:	8082                	ret

0000000000000830 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     830:	4891                	li	a7,4
 ecall
     832:	00000073          	ecall
 ret
     836:	8082                	ret

0000000000000838 <read>:
.global read
read:
 li a7, SYS_read
     838:	4895                	li	a7,5
 ecall
     83a:	00000073          	ecall
 ret
     83e:	8082                	ret

0000000000000840 <write>:
.global write
write:
 li a7, SYS_write
     840:	48c1                	li	a7,16
 ecall
     842:	00000073          	ecall
 ret
     846:	8082                	ret

0000000000000848 <close>:
.global close
close:
 li a7, SYS_close
     848:	48d5                	li	a7,21
 ecall
     84a:	00000073          	ecall
 ret
     84e:	8082                	ret

0000000000000850 <kill>:
.global kill
kill:
 li a7, SYS_kill
     850:	4899                	li	a7,6
 ecall
     852:	00000073          	ecall
 ret
     856:	8082                	ret

0000000000000858 <exec>:
.global exec
exec:
 li a7, SYS_exec
     858:	489d                	li	a7,7
 ecall
     85a:	00000073          	ecall
 ret
     85e:	8082                	ret

0000000000000860 <open>:
.global open
open:
 li a7, SYS_open
     860:	48bd                	li	a7,15
 ecall
     862:	00000073          	ecall
 ret
     866:	8082                	ret

0000000000000868 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     868:	48c5                	li	a7,17
 ecall
     86a:	00000073          	ecall
 ret
     86e:	8082                	ret

0000000000000870 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     870:	48c9                	li	a7,18
 ecall
     872:	00000073          	ecall
 ret
     876:	8082                	ret

0000000000000878 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     878:	48a1                	li	a7,8
 ecall
     87a:	00000073          	ecall
 ret
     87e:	8082                	ret

0000000000000880 <link>:
.global link
link:
 li a7, SYS_link
     880:	48cd                	li	a7,19
 ecall
     882:	00000073          	ecall
 ret
     886:	8082                	ret

0000000000000888 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     888:	48d1                	li	a7,20
 ecall
     88a:	00000073          	ecall
 ret
     88e:	8082                	ret

0000000000000890 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     890:	48a5                	li	a7,9
 ecall
     892:	00000073          	ecall
 ret
     896:	8082                	ret

0000000000000898 <dup>:
.global dup
dup:
 li a7, SYS_dup
     898:	48a9                	li	a7,10
 ecall
     89a:	00000073          	ecall
 ret
     89e:	8082                	ret

00000000000008a0 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     8a0:	48ad                	li	a7,11
 ecall
     8a2:	00000073          	ecall
 ret
     8a6:	8082                	ret

00000000000008a8 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     8a8:	48b1                	li	a7,12
 ecall
     8aa:	00000073          	ecall
 ret
     8ae:	8082                	ret

00000000000008b0 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     8b0:	48b5                	li	a7,13
 ecall
     8b2:	00000073          	ecall
 ret
     8b6:	8082                	ret

00000000000008b8 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     8b8:	48b9                	li	a7,14
 ecall
     8ba:	00000073          	ecall
 ret
     8be:	8082                	ret

00000000000008c0 <setSchedAlg>:
.global setSchedAlg
setSchedAlg:
 li a7, SYS_setSchedAlg
     8c0:	48d9                	li	a7,22
 ecall
     8c2:	00000073          	ecall
 ret
     8c6:	8082                	ret

00000000000008c8 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     8c8:	1101                	addi	sp,sp,-32
     8ca:	ec06                	sd	ra,24(sp)
     8cc:	e822                	sd	s0,16(sp)
     8ce:	1000                	addi	s0,sp,32
     8d0:	87aa                	mv	a5,a0
     8d2:	872e                	mv	a4,a1
     8d4:	fef42623          	sw	a5,-20(s0)
     8d8:	87ba                	mv	a5,a4
     8da:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     8de:	feb40713          	addi	a4,s0,-21
     8e2:	fec42783          	lw	a5,-20(s0)
     8e6:	4605                	li	a2,1
     8e8:	85ba                	mv	a1,a4
     8ea:	853e                	mv	a0,a5
     8ec:	00000097          	auipc	ra,0x0
     8f0:	f54080e7          	jalr	-172(ra) # 840 <write>
}
     8f4:	0001                	nop
     8f6:	60e2                	ld	ra,24(sp)
     8f8:	6442                	ld	s0,16(sp)
     8fa:	6105                	addi	sp,sp,32
     8fc:	8082                	ret

00000000000008fe <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     8fe:	7139                	addi	sp,sp,-64
     900:	fc06                	sd	ra,56(sp)
     902:	f822                	sd	s0,48(sp)
     904:	0080                	addi	s0,sp,64
     906:	87aa                	mv	a5,a0
     908:	8736                	mv	a4,a3
     90a:	fcf42623          	sw	a5,-52(s0)
     90e:	87ae                	mv	a5,a1
     910:	fcf42423          	sw	a5,-56(s0)
     914:	87b2                	mv	a5,a2
     916:	fcf42223          	sw	a5,-60(s0)
     91a:	87ba                	mv	a5,a4
     91c:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     920:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     924:	fc042783          	lw	a5,-64(s0)
     928:	2781                	sext.w	a5,a5
     92a:	c38d                	beqz	a5,94c <printint+0x4e>
     92c:	fc842783          	lw	a5,-56(s0)
     930:	2781                	sext.w	a5,a5
     932:	0007dd63          	bgez	a5,94c <printint+0x4e>
    neg = 1;
     936:	4785                	li	a5,1
     938:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     93c:	fc842783          	lw	a5,-56(s0)
     940:	40f007bb          	negw	a5,a5
     944:	2781                	sext.w	a5,a5
     946:	fef42223          	sw	a5,-28(s0)
     94a:	a029                	j	954 <printint+0x56>
  } else {
    x = xx;
     94c:	fc842783          	lw	a5,-56(s0)
     950:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     954:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     958:	fc442783          	lw	a5,-60(s0)
     95c:	fe442703          	lw	a4,-28(s0)
     960:	02f777bb          	remuw	a5,a4,a5
     964:	0007861b          	sext.w	a2,a5
     968:	fec42783          	lw	a5,-20(s0)
     96c:	0017871b          	addiw	a4,a5,1
     970:	fee42623          	sw	a4,-20(s0)
     974:	00000697          	auipc	a3,0x0
     978:	78c68693          	addi	a3,a3,1932 # 1100 <digits>
     97c:	02061713          	slli	a4,a2,0x20
     980:	9301                	srli	a4,a4,0x20
     982:	9736                	add	a4,a4,a3
     984:	00074703          	lbu	a4,0(a4)
     988:	ff040693          	addi	a3,s0,-16
     98c:	97b6                	add	a5,a5,a3
     98e:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     992:	fc442783          	lw	a5,-60(s0)
     996:	fe442703          	lw	a4,-28(s0)
     99a:	02f757bb          	divuw	a5,a4,a5
     99e:	fef42223          	sw	a5,-28(s0)
     9a2:	fe442783          	lw	a5,-28(s0)
     9a6:	2781                	sext.w	a5,a5
     9a8:	fbc5                	bnez	a5,958 <printint+0x5a>
  if(neg)
     9aa:	fe842783          	lw	a5,-24(s0)
     9ae:	2781                	sext.w	a5,a5
     9b0:	cf95                	beqz	a5,9ec <printint+0xee>
    buf[i++] = '-';
     9b2:	fec42783          	lw	a5,-20(s0)
     9b6:	0017871b          	addiw	a4,a5,1
     9ba:	fee42623          	sw	a4,-20(s0)
     9be:	ff040713          	addi	a4,s0,-16
     9c2:	97ba                	add	a5,a5,a4
     9c4:	02d00713          	li	a4,45
     9c8:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     9cc:	a005                	j	9ec <printint+0xee>
    putc(fd, buf[i]);
     9ce:	fec42783          	lw	a5,-20(s0)
     9d2:	ff040713          	addi	a4,s0,-16
     9d6:	97ba                	add	a5,a5,a4
     9d8:	fe07c703          	lbu	a4,-32(a5)
     9dc:	fcc42783          	lw	a5,-52(s0)
     9e0:	85ba                	mv	a1,a4
     9e2:	853e                	mv	a0,a5
     9e4:	00000097          	auipc	ra,0x0
     9e8:	ee4080e7          	jalr	-284(ra) # 8c8 <putc>
  while(--i >= 0)
     9ec:	fec42783          	lw	a5,-20(s0)
     9f0:	37fd                	addiw	a5,a5,-1
     9f2:	fef42623          	sw	a5,-20(s0)
     9f6:	fec42783          	lw	a5,-20(s0)
     9fa:	2781                	sext.w	a5,a5
     9fc:	fc07d9e3          	bgez	a5,9ce <printint+0xd0>
}
     a00:	0001                	nop
     a02:	0001                	nop
     a04:	70e2                	ld	ra,56(sp)
     a06:	7442                	ld	s0,48(sp)
     a08:	6121                	addi	sp,sp,64
     a0a:	8082                	ret

0000000000000a0c <printptr>:

static void
printptr(int fd, uint64 x) {
     a0c:	7179                	addi	sp,sp,-48
     a0e:	f406                	sd	ra,40(sp)
     a10:	f022                	sd	s0,32(sp)
     a12:	1800                	addi	s0,sp,48
     a14:	87aa                	mv	a5,a0
     a16:	fcb43823          	sd	a1,-48(s0)
     a1a:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     a1e:	fdc42783          	lw	a5,-36(s0)
     a22:	03000593          	li	a1,48
     a26:	853e                	mv	a0,a5
     a28:	00000097          	auipc	ra,0x0
     a2c:	ea0080e7          	jalr	-352(ra) # 8c8 <putc>
  putc(fd, 'x');
     a30:	fdc42783          	lw	a5,-36(s0)
     a34:	07800593          	li	a1,120
     a38:	853e                	mv	a0,a5
     a3a:	00000097          	auipc	ra,0x0
     a3e:	e8e080e7          	jalr	-370(ra) # 8c8 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     a42:	fe042623          	sw	zero,-20(s0)
     a46:	a82d                	j	a80 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     a48:	fd043783          	ld	a5,-48(s0)
     a4c:	93f1                	srli	a5,a5,0x3c
     a4e:	00000717          	auipc	a4,0x0
     a52:	6b270713          	addi	a4,a4,1714 # 1100 <digits>
     a56:	97ba                	add	a5,a5,a4
     a58:	0007c703          	lbu	a4,0(a5)
     a5c:	fdc42783          	lw	a5,-36(s0)
     a60:	85ba                	mv	a1,a4
     a62:	853e                	mv	a0,a5
     a64:	00000097          	auipc	ra,0x0
     a68:	e64080e7          	jalr	-412(ra) # 8c8 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     a6c:	fec42783          	lw	a5,-20(s0)
     a70:	2785                	addiw	a5,a5,1
     a72:	fef42623          	sw	a5,-20(s0)
     a76:	fd043783          	ld	a5,-48(s0)
     a7a:	0792                	slli	a5,a5,0x4
     a7c:	fcf43823          	sd	a5,-48(s0)
     a80:	fec42783          	lw	a5,-20(s0)
     a84:	873e                	mv	a4,a5
     a86:	47bd                	li	a5,15
     a88:	fce7f0e3          	bgeu	a5,a4,a48 <printptr+0x3c>
}
     a8c:	0001                	nop
     a8e:	0001                	nop
     a90:	70a2                	ld	ra,40(sp)
     a92:	7402                	ld	s0,32(sp)
     a94:	6145                	addi	sp,sp,48
     a96:	8082                	ret

0000000000000a98 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     a98:	715d                	addi	sp,sp,-80
     a9a:	e486                	sd	ra,72(sp)
     a9c:	e0a2                	sd	s0,64(sp)
     a9e:	0880                	addi	s0,sp,80
     aa0:	87aa                	mv	a5,a0
     aa2:	fcb43023          	sd	a1,-64(s0)
     aa6:	fac43c23          	sd	a2,-72(s0)
     aaa:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     aae:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     ab2:	fe042223          	sw	zero,-28(s0)
     ab6:	a42d                	j	ce0 <vprintf+0x248>
    c = fmt[i] & 0xff;
     ab8:	fe442783          	lw	a5,-28(s0)
     abc:	fc043703          	ld	a4,-64(s0)
     ac0:	97ba                	add	a5,a5,a4
     ac2:	0007c783          	lbu	a5,0(a5)
     ac6:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     aca:	fe042783          	lw	a5,-32(s0)
     ace:	2781                	sext.w	a5,a5
     ad0:	eb9d                	bnez	a5,b06 <vprintf+0x6e>
      if(c == '%'){
     ad2:	fdc42783          	lw	a5,-36(s0)
     ad6:	0007871b          	sext.w	a4,a5
     ada:	02500793          	li	a5,37
     ade:	00f71763          	bne	a4,a5,aec <vprintf+0x54>
        state = '%';
     ae2:	02500793          	li	a5,37
     ae6:	fef42023          	sw	a5,-32(s0)
     aea:	a2f5                	j	cd6 <vprintf+0x23e>
      } else {
        putc(fd, c);
     aec:	fdc42783          	lw	a5,-36(s0)
     af0:	0ff7f713          	andi	a4,a5,255
     af4:	fcc42783          	lw	a5,-52(s0)
     af8:	85ba                	mv	a1,a4
     afa:	853e                	mv	a0,a5
     afc:	00000097          	auipc	ra,0x0
     b00:	dcc080e7          	jalr	-564(ra) # 8c8 <putc>
     b04:	aac9                	j	cd6 <vprintf+0x23e>
      }
    } else if(state == '%'){
     b06:	fe042783          	lw	a5,-32(s0)
     b0a:	0007871b          	sext.w	a4,a5
     b0e:	02500793          	li	a5,37
     b12:	1cf71263          	bne	a4,a5,cd6 <vprintf+0x23e>
      if(c == 'd'){
     b16:	fdc42783          	lw	a5,-36(s0)
     b1a:	0007871b          	sext.w	a4,a5
     b1e:	06400793          	li	a5,100
     b22:	02f71463          	bne	a4,a5,b4a <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     b26:	fb843783          	ld	a5,-72(s0)
     b2a:	00878713          	addi	a4,a5,8
     b2e:	fae43c23          	sd	a4,-72(s0)
     b32:	4398                	lw	a4,0(a5)
     b34:	fcc42783          	lw	a5,-52(s0)
     b38:	4685                	li	a3,1
     b3a:	4629                	li	a2,10
     b3c:	85ba                	mv	a1,a4
     b3e:	853e                	mv	a0,a5
     b40:	00000097          	auipc	ra,0x0
     b44:	dbe080e7          	jalr	-578(ra) # 8fe <printint>
     b48:	a269                	j	cd2 <vprintf+0x23a>
      } else if(c == 'l') {
     b4a:	fdc42783          	lw	a5,-36(s0)
     b4e:	0007871b          	sext.w	a4,a5
     b52:	06c00793          	li	a5,108
     b56:	02f71663          	bne	a4,a5,b82 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     b5a:	fb843783          	ld	a5,-72(s0)
     b5e:	00878713          	addi	a4,a5,8
     b62:	fae43c23          	sd	a4,-72(s0)
     b66:	639c                	ld	a5,0(a5)
     b68:	0007871b          	sext.w	a4,a5
     b6c:	fcc42783          	lw	a5,-52(s0)
     b70:	4681                	li	a3,0
     b72:	4629                	li	a2,10
     b74:	85ba                	mv	a1,a4
     b76:	853e                	mv	a0,a5
     b78:	00000097          	auipc	ra,0x0
     b7c:	d86080e7          	jalr	-634(ra) # 8fe <printint>
     b80:	aa89                	j	cd2 <vprintf+0x23a>
      } else if(c == 'x') {
     b82:	fdc42783          	lw	a5,-36(s0)
     b86:	0007871b          	sext.w	a4,a5
     b8a:	07800793          	li	a5,120
     b8e:	02f71463          	bne	a4,a5,bb6 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     b92:	fb843783          	ld	a5,-72(s0)
     b96:	00878713          	addi	a4,a5,8
     b9a:	fae43c23          	sd	a4,-72(s0)
     b9e:	4398                	lw	a4,0(a5)
     ba0:	fcc42783          	lw	a5,-52(s0)
     ba4:	4681                	li	a3,0
     ba6:	4641                	li	a2,16
     ba8:	85ba                	mv	a1,a4
     baa:	853e                	mv	a0,a5
     bac:	00000097          	auipc	ra,0x0
     bb0:	d52080e7          	jalr	-686(ra) # 8fe <printint>
     bb4:	aa39                	j	cd2 <vprintf+0x23a>
      } else if(c == 'p') {
     bb6:	fdc42783          	lw	a5,-36(s0)
     bba:	0007871b          	sext.w	a4,a5
     bbe:	07000793          	li	a5,112
     bc2:	02f71263          	bne	a4,a5,be6 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     bc6:	fb843783          	ld	a5,-72(s0)
     bca:	00878713          	addi	a4,a5,8
     bce:	fae43c23          	sd	a4,-72(s0)
     bd2:	6398                	ld	a4,0(a5)
     bd4:	fcc42783          	lw	a5,-52(s0)
     bd8:	85ba                	mv	a1,a4
     bda:	853e                	mv	a0,a5
     bdc:	00000097          	auipc	ra,0x0
     be0:	e30080e7          	jalr	-464(ra) # a0c <printptr>
     be4:	a0fd                	j	cd2 <vprintf+0x23a>
      } else if(c == 's'){
     be6:	fdc42783          	lw	a5,-36(s0)
     bea:	0007871b          	sext.w	a4,a5
     bee:	07300793          	li	a5,115
     bf2:	04f71c63          	bne	a4,a5,c4a <vprintf+0x1b2>
        s = va_arg(ap, char*);
     bf6:	fb843783          	ld	a5,-72(s0)
     bfa:	00878713          	addi	a4,a5,8
     bfe:	fae43c23          	sd	a4,-72(s0)
     c02:	639c                	ld	a5,0(a5)
     c04:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     c08:	fe843783          	ld	a5,-24(s0)
     c0c:	eb8d                	bnez	a5,c3e <vprintf+0x1a6>
          s = "(null)";
     c0e:	00000797          	auipc	a5,0x0
     c12:	4ea78793          	addi	a5,a5,1258 # 10f8 <malloc+0x1b0>
     c16:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     c1a:	a015                	j	c3e <vprintf+0x1a6>
          putc(fd, *s);
     c1c:	fe843783          	ld	a5,-24(s0)
     c20:	0007c703          	lbu	a4,0(a5)
     c24:	fcc42783          	lw	a5,-52(s0)
     c28:	85ba                	mv	a1,a4
     c2a:	853e                	mv	a0,a5
     c2c:	00000097          	auipc	ra,0x0
     c30:	c9c080e7          	jalr	-868(ra) # 8c8 <putc>
          s++;
     c34:	fe843783          	ld	a5,-24(s0)
     c38:	0785                	addi	a5,a5,1
     c3a:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     c3e:	fe843783          	ld	a5,-24(s0)
     c42:	0007c783          	lbu	a5,0(a5)
     c46:	fbf9                	bnez	a5,c1c <vprintf+0x184>
     c48:	a069                	j	cd2 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     c4a:	fdc42783          	lw	a5,-36(s0)
     c4e:	0007871b          	sext.w	a4,a5
     c52:	06300793          	li	a5,99
     c56:	02f71463          	bne	a4,a5,c7e <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     c5a:	fb843783          	ld	a5,-72(s0)
     c5e:	00878713          	addi	a4,a5,8
     c62:	fae43c23          	sd	a4,-72(s0)
     c66:	439c                	lw	a5,0(a5)
     c68:	0ff7f713          	andi	a4,a5,255
     c6c:	fcc42783          	lw	a5,-52(s0)
     c70:	85ba                	mv	a1,a4
     c72:	853e                	mv	a0,a5
     c74:	00000097          	auipc	ra,0x0
     c78:	c54080e7          	jalr	-940(ra) # 8c8 <putc>
     c7c:	a899                	j	cd2 <vprintf+0x23a>
      } else if(c == '%'){
     c7e:	fdc42783          	lw	a5,-36(s0)
     c82:	0007871b          	sext.w	a4,a5
     c86:	02500793          	li	a5,37
     c8a:	00f71f63          	bne	a4,a5,ca8 <vprintf+0x210>
        putc(fd, c);
     c8e:	fdc42783          	lw	a5,-36(s0)
     c92:	0ff7f713          	andi	a4,a5,255
     c96:	fcc42783          	lw	a5,-52(s0)
     c9a:	85ba                	mv	a1,a4
     c9c:	853e                	mv	a0,a5
     c9e:	00000097          	auipc	ra,0x0
     ca2:	c2a080e7          	jalr	-982(ra) # 8c8 <putc>
     ca6:	a035                	j	cd2 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     ca8:	fcc42783          	lw	a5,-52(s0)
     cac:	02500593          	li	a1,37
     cb0:	853e                	mv	a0,a5
     cb2:	00000097          	auipc	ra,0x0
     cb6:	c16080e7          	jalr	-1002(ra) # 8c8 <putc>
        putc(fd, c);
     cba:	fdc42783          	lw	a5,-36(s0)
     cbe:	0ff7f713          	andi	a4,a5,255
     cc2:	fcc42783          	lw	a5,-52(s0)
     cc6:	85ba                	mv	a1,a4
     cc8:	853e                	mv	a0,a5
     cca:	00000097          	auipc	ra,0x0
     cce:	bfe080e7          	jalr	-1026(ra) # 8c8 <putc>
      }
      state = 0;
     cd2:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     cd6:	fe442783          	lw	a5,-28(s0)
     cda:	2785                	addiw	a5,a5,1
     cdc:	fef42223          	sw	a5,-28(s0)
     ce0:	fe442783          	lw	a5,-28(s0)
     ce4:	fc043703          	ld	a4,-64(s0)
     ce8:	97ba                	add	a5,a5,a4
     cea:	0007c783          	lbu	a5,0(a5)
     cee:	dc0795e3          	bnez	a5,ab8 <vprintf+0x20>
    }
  }
}
     cf2:	0001                	nop
     cf4:	0001                	nop
     cf6:	60a6                	ld	ra,72(sp)
     cf8:	6406                	ld	s0,64(sp)
     cfa:	6161                	addi	sp,sp,80
     cfc:	8082                	ret

0000000000000cfe <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     cfe:	7159                	addi	sp,sp,-112
     d00:	fc06                	sd	ra,56(sp)
     d02:	f822                	sd	s0,48(sp)
     d04:	0080                	addi	s0,sp,64
     d06:	fcb43823          	sd	a1,-48(s0)
     d0a:	e010                	sd	a2,0(s0)
     d0c:	e414                	sd	a3,8(s0)
     d0e:	e818                	sd	a4,16(s0)
     d10:	ec1c                	sd	a5,24(s0)
     d12:	03043023          	sd	a6,32(s0)
     d16:	03143423          	sd	a7,40(s0)
     d1a:	87aa                	mv	a5,a0
     d1c:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     d20:	03040793          	addi	a5,s0,48
     d24:	fcf43423          	sd	a5,-56(s0)
     d28:	fc843783          	ld	a5,-56(s0)
     d2c:	fd078793          	addi	a5,a5,-48
     d30:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     d34:	fe843703          	ld	a4,-24(s0)
     d38:	fdc42783          	lw	a5,-36(s0)
     d3c:	863a                	mv	a2,a4
     d3e:	fd043583          	ld	a1,-48(s0)
     d42:	853e                	mv	a0,a5
     d44:	00000097          	auipc	ra,0x0
     d48:	d54080e7          	jalr	-684(ra) # a98 <vprintf>
}
     d4c:	0001                	nop
     d4e:	70e2                	ld	ra,56(sp)
     d50:	7442                	ld	s0,48(sp)
     d52:	6165                	addi	sp,sp,112
     d54:	8082                	ret

0000000000000d56 <printf>:

void
printf(const char *fmt, ...)
{
     d56:	7159                	addi	sp,sp,-112
     d58:	f406                	sd	ra,40(sp)
     d5a:	f022                	sd	s0,32(sp)
     d5c:	1800                	addi	s0,sp,48
     d5e:	fca43c23          	sd	a0,-40(s0)
     d62:	e40c                	sd	a1,8(s0)
     d64:	e810                	sd	a2,16(s0)
     d66:	ec14                	sd	a3,24(s0)
     d68:	f018                	sd	a4,32(s0)
     d6a:	f41c                	sd	a5,40(s0)
     d6c:	03043823          	sd	a6,48(s0)
     d70:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     d74:	04040793          	addi	a5,s0,64
     d78:	fcf43823          	sd	a5,-48(s0)
     d7c:	fd043783          	ld	a5,-48(s0)
     d80:	fc878793          	addi	a5,a5,-56
     d84:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     d88:	fe843783          	ld	a5,-24(s0)
     d8c:	863e                	mv	a2,a5
     d8e:	fd843583          	ld	a1,-40(s0)
     d92:	4505                	li	a0,1
     d94:	00000097          	auipc	ra,0x0
     d98:	d04080e7          	jalr	-764(ra) # a98 <vprintf>
}
     d9c:	0001                	nop
     d9e:	70a2                	ld	ra,40(sp)
     da0:	7402                	ld	s0,32(sp)
     da2:	6165                	addi	sp,sp,112
     da4:	8082                	ret

0000000000000da6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     da6:	7179                	addi	sp,sp,-48
     da8:	f422                	sd	s0,40(sp)
     daa:	1800                	addi	s0,sp,48
     dac:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     db0:	fd843783          	ld	a5,-40(s0)
     db4:	17c1                	addi	a5,a5,-16
     db6:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     dba:	00000797          	auipc	a5,0x0
     dbe:	37e78793          	addi	a5,a5,894 # 1138 <freep>
     dc2:	639c                	ld	a5,0(a5)
     dc4:	fef43423          	sd	a5,-24(s0)
     dc8:	a815                	j	dfc <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     dca:	fe843783          	ld	a5,-24(s0)
     dce:	639c                	ld	a5,0(a5)
     dd0:	fe843703          	ld	a4,-24(s0)
     dd4:	00f76f63          	bltu	a4,a5,df2 <free+0x4c>
     dd8:	fe043703          	ld	a4,-32(s0)
     ddc:	fe843783          	ld	a5,-24(s0)
     de0:	02e7eb63          	bltu	a5,a4,e16 <free+0x70>
     de4:	fe843783          	ld	a5,-24(s0)
     de8:	639c                	ld	a5,0(a5)
     dea:	fe043703          	ld	a4,-32(s0)
     dee:	02f76463          	bltu	a4,a5,e16 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     df2:	fe843783          	ld	a5,-24(s0)
     df6:	639c                	ld	a5,0(a5)
     df8:	fef43423          	sd	a5,-24(s0)
     dfc:	fe043703          	ld	a4,-32(s0)
     e00:	fe843783          	ld	a5,-24(s0)
     e04:	fce7f3e3          	bgeu	a5,a4,dca <free+0x24>
     e08:	fe843783          	ld	a5,-24(s0)
     e0c:	639c                	ld	a5,0(a5)
     e0e:	fe043703          	ld	a4,-32(s0)
     e12:	faf77ce3          	bgeu	a4,a5,dca <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     e16:	fe043783          	ld	a5,-32(s0)
     e1a:	479c                	lw	a5,8(a5)
     e1c:	1782                	slli	a5,a5,0x20
     e1e:	9381                	srli	a5,a5,0x20
     e20:	0792                	slli	a5,a5,0x4
     e22:	fe043703          	ld	a4,-32(s0)
     e26:	973e                	add	a4,a4,a5
     e28:	fe843783          	ld	a5,-24(s0)
     e2c:	639c                	ld	a5,0(a5)
     e2e:	02f71763          	bne	a4,a5,e5c <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     e32:	fe043783          	ld	a5,-32(s0)
     e36:	4798                	lw	a4,8(a5)
     e38:	fe843783          	ld	a5,-24(s0)
     e3c:	639c                	ld	a5,0(a5)
     e3e:	479c                	lw	a5,8(a5)
     e40:	9fb9                	addw	a5,a5,a4
     e42:	0007871b          	sext.w	a4,a5
     e46:	fe043783          	ld	a5,-32(s0)
     e4a:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     e4c:	fe843783          	ld	a5,-24(s0)
     e50:	639c                	ld	a5,0(a5)
     e52:	6398                	ld	a4,0(a5)
     e54:	fe043783          	ld	a5,-32(s0)
     e58:	e398                	sd	a4,0(a5)
     e5a:	a039                	j	e68 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     e5c:	fe843783          	ld	a5,-24(s0)
     e60:	6398                	ld	a4,0(a5)
     e62:	fe043783          	ld	a5,-32(s0)
     e66:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     e68:	fe843783          	ld	a5,-24(s0)
     e6c:	479c                	lw	a5,8(a5)
     e6e:	1782                	slli	a5,a5,0x20
     e70:	9381                	srli	a5,a5,0x20
     e72:	0792                	slli	a5,a5,0x4
     e74:	fe843703          	ld	a4,-24(s0)
     e78:	97ba                	add	a5,a5,a4
     e7a:	fe043703          	ld	a4,-32(s0)
     e7e:	02f71563          	bne	a4,a5,ea8 <free+0x102>
    p->s.size += bp->s.size;
     e82:	fe843783          	ld	a5,-24(s0)
     e86:	4798                	lw	a4,8(a5)
     e88:	fe043783          	ld	a5,-32(s0)
     e8c:	479c                	lw	a5,8(a5)
     e8e:	9fb9                	addw	a5,a5,a4
     e90:	0007871b          	sext.w	a4,a5
     e94:	fe843783          	ld	a5,-24(s0)
     e98:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     e9a:	fe043783          	ld	a5,-32(s0)
     e9e:	6398                	ld	a4,0(a5)
     ea0:	fe843783          	ld	a5,-24(s0)
     ea4:	e398                	sd	a4,0(a5)
     ea6:	a031                	j	eb2 <free+0x10c>
  } else
    p->s.ptr = bp;
     ea8:	fe843783          	ld	a5,-24(s0)
     eac:	fe043703          	ld	a4,-32(s0)
     eb0:	e398                	sd	a4,0(a5)
  freep = p;
     eb2:	00000797          	auipc	a5,0x0
     eb6:	28678793          	addi	a5,a5,646 # 1138 <freep>
     eba:	fe843703          	ld	a4,-24(s0)
     ebe:	e398                	sd	a4,0(a5)
}
     ec0:	0001                	nop
     ec2:	7422                	ld	s0,40(sp)
     ec4:	6145                	addi	sp,sp,48
     ec6:	8082                	ret

0000000000000ec8 <morecore>:

static Header*
morecore(uint nu)
{
     ec8:	7179                	addi	sp,sp,-48
     eca:	f406                	sd	ra,40(sp)
     ecc:	f022                	sd	s0,32(sp)
     ece:	1800                	addi	s0,sp,48
     ed0:	87aa                	mv	a5,a0
     ed2:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     ed6:	fdc42783          	lw	a5,-36(s0)
     eda:	0007871b          	sext.w	a4,a5
     ede:	6785                	lui	a5,0x1
     ee0:	00f77563          	bgeu	a4,a5,eea <morecore+0x22>
    nu = 4096;
     ee4:	6785                	lui	a5,0x1
     ee6:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     eea:	fdc42783          	lw	a5,-36(s0)
     eee:	0047979b          	slliw	a5,a5,0x4
     ef2:	2781                	sext.w	a5,a5
     ef4:	2781                	sext.w	a5,a5
     ef6:	853e                	mv	a0,a5
     ef8:	00000097          	auipc	ra,0x0
     efc:	9b0080e7          	jalr	-1616(ra) # 8a8 <sbrk>
     f00:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     f04:	fe843703          	ld	a4,-24(s0)
     f08:	57fd                	li	a5,-1
     f0a:	00f71463          	bne	a4,a5,f12 <morecore+0x4a>
    return 0;
     f0e:	4781                	li	a5,0
     f10:	a03d                	j	f3e <morecore+0x76>
  hp = (Header*)p;
     f12:	fe843783          	ld	a5,-24(s0)
     f16:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     f1a:	fe043783          	ld	a5,-32(s0)
     f1e:	fdc42703          	lw	a4,-36(s0)
     f22:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     f24:	fe043783          	ld	a5,-32(s0)
     f28:	07c1                	addi	a5,a5,16
     f2a:	853e                	mv	a0,a5
     f2c:	00000097          	auipc	ra,0x0
     f30:	e7a080e7          	jalr	-390(ra) # da6 <free>
  return freep;
     f34:	00000797          	auipc	a5,0x0
     f38:	20478793          	addi	a5,a5,516 # 1138 <freep>
     f3c:	639c                	ld	a5,0(a5)
}
     f3e:	853e                	mv	a0,a5
     f40:	70a2                	ld	ra,40(sp)
     f42:	7402                	ld	s0,32(sp)
     f44:	6145                	addi	sp,sp,48
     f46:	8082                	ret

0000000000000f48 <malloc>:

void*
malloc(uint nbytes)
{
     f48:	7139                	addi	sp,sp,-64
     f4a:	fc06                	sd	ra,56(sp)
     f4c:	f822                	sd	s0,48(sp)
     f4e:	0080                	addi	s0,sp,64
     f50:	87aa                	mv	a5,a0
     f52:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f56:	fcc46783          	lwu	a5,-52(s0)
     f5a:	07bd                	addi	a5,a5,15
     f5c:	8391                	srli	a5,a5,0x4
     f5e:	2781                	sext.w	a5,a5
     f60:	2785                	addiw	a5,a5,1
     f62:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     f66:	00000797          	auipc	a5,0x0
     f6a:	1d278793          	addi	a5,a5,466 # 1138 <freep>
     f6e:	639c                	ld	a5,0(a5)
     f70:	fef43023          	sd	a5,-32(s0)
     f74:	fe043783          	ld	a5,-32(s0)
     f78:	ef95                	bnez	a5,fb4 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     f7a:	00000797          	auipc	a5,0x0
     f7e:	1ae78793          	addi	a5,a5,430 # 1128 <base>
     f82:	fef43023          	sd	a5,-32(s0)
     f86:	00000797          	auipc	a5,0x0
     f8a:	1b278793          	addi	a5,a5,434 # 1138 <freep>
     f8e:	fe043703          	ld	a4,-32(s0)
     f92:	e398                	sd	a4,0(a5)
     f94:	00000797          	auipc	a5,0x0
     f98:	1a478793          	addi	a5,a5,420 # 1138 <freep>
     f9c:	6398                	ld	a4,0(a5)
     f9e:	00000797          	auipc	a5,0x0
     fa2:	18a78793          	addi	a5,a5,394 # 1128 <base>
     fa6:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     fa8:	00000797          	auipc	a5,0x0
     fac:	18078793          	addi	a5,a5,384 # 1128 <base>
     fb0:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fb4:	fe043783          	ld	a5,-32(s0)
     fb8:	639c                	ld	a5,0(a5)
     fba:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     fbe:	fe843783          	ld	a5,-24(s0)
     fc2:	4798                	lw	a4,8(a5)
     fc4:	fdc42783          	lw	a5,-36(s0)
     fc8:	2781                	sext.w	a5,a5
     fca:	06f76863          	bltu	a4,a5,103a <malloc+0xf2>
      if(p->s.size == nunits)
     fce:	fe843783          	ld	a5,-24(s0)
     fd2:	4798                	lw	a4,8(a5)
     fd4:	fdc42783          	lw	a5,-36(s0)
     fd8:	2781                	sext.w	a5,a5
     fda:	00e79963          	bne	a5,a4,fec <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     fde:	fe843783          	ld	a5,-24(s0)
     fe2:	6398                	ld	a4,0(a5)
     fe4:	fe043783          	ld	a5,-32(s0)
     fe8:	e398                	sd	a4,0(a5)
     fea:	a82d                	j	1024 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     fec:	fe843783          	ld	a5,-24(s0)
     ff0:	4798                	lw	a4,8(a5)
     ff2:	fdc42783          	lw	a5,-36(s0)
     ff6:	40f707bb          	subw	a5,a4,a5
     ffa:	0007871b          	sext.w	a4,a5
     ffe:	fe843783          	ld	a5,-24(s0)
    1002:	c798                	sw	a4,8(a5)
        p += p->s.size;
    1004:	fe843783          	ld	a5,-24(s0)
    1008:	479c                	lw	a5,8(a5)
    100a:	1782                	slli	a5,a5,0x20
    100c:	9381                	srli	a5,a5,0x20
    100e:	0792                	slli	a5,a5,0x4
    1010:	fe843703          	ld	a4,-24(s0)
    1014:	97ba                	add	a5,a5,a4
    1016:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    101a:	fe843783          	ld	a5,-24(s0)
    101e:	fdc42703          	lw	a4,-36(s0)
    1022:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    1024:	00000797          	auipc	a5,0x0
    1028:	11478793          	addi	a5,a5,276 # 1138 <freep>
    102c:	fe043703          	ld	a4,-32(s0)
    1030:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    1032:	fe843783          	ld	a5,-24(s0)
    1036:	07c1                	addi	a5,a5,16
    1038:	a091                	j	107c <malloc+0x134>
    }
    if(p == freep)
    103a:	00000797          	auipc	a5,0x0
    103e:	0fe78793          	addi	a5,a5,254 # 1138 <freep>
    1042:	639c                	ld	a5,0(a5)
    1044:	fe843703          	ld	a4,-24(s0)
    1048:	02f71063          	bne	a4,a5,1068 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    104c:	fdc42783          	lw	a5,-36(s0)
    1050:	853e                	mv	a0,a5
    1052:	00000097          	auipc	ra,0x0
    1056:	e76080e7          	jalr	-394(ra) # ec8 <morecore>
    105a:	fea43423          	sd	a0,-24(s0)
    105e:	fe843783          	ld	a5,-24(s0)
    1062:	e399                	bnez	a5,1068 <malloc+0x120>
        return 0;
    1064:	4781                	li	a5,0
    1066:	a819                	j	107c <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1068:	fe843783          	ld	a5,-24(s0)
    106c:	fef43023          	sd	a5,-32(s0)
    1070:	fe843783          	ld	a5,-24(s0)
    1074:	639c                	ld	a5,0(a5)
    1076:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    107a:	b791                	j	fbe <malloc+0x76>
  }
}
    107c:	853e                	mv	a0,a5
    107e:	70e2                	ld	ra,56(sp)
    1080:	7442                	ld	s0,48(sp)
    1082:	6121                	addi	sp,sp,64
    1084:	8082                	ret
