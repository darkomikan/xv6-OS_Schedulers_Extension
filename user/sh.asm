
user/_sh:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
       0:	715d                	addi	sp,sp,-80
       2:	e486                	sd	ra,72(sp)
       4:	e0a2                	sd	s0,64(sp)
       6:	0880                	addi	s0,sp,80
       8:	faa43c23          	sd	a0,-72(s0)
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
       c:	fb843783          	ld	a5,-72(s0)
      10:	e791                	bnez	a5,1c <runcmd+0x1c>
    exit(1);
      12:	4505                	li	a0,1
      14:	00001097          	auipc	ra,0x1
      18:	3d8080e7          	jalr	984(ra) # 13ec <exit>

  switch(cmd->type){
      1c:	fb843783          	ld	a5,-72(s0)
      20:	439c                	lw	a5,0(a5)
      22:	86be                	mv	a3,a5
      24:	4715                	li	a4,5
      26:	02d76263          	bltu	a4,a3,4a <runcmd+0x4a>
      2a:	00279713          	slli	a4,a5,0x2
      2e:	00002797          	auipc	a5,0x2
      32:	c5a78793          	addi	a5,a5,-934 # 1c88 <malloc+0x174>
      36:	97ba                	add	a5,a5,a4
      38:	439c                	lw	a5,0(a5)
      3a:	0007871b          	sext.w	a4,a5
      3e:	00002797          	auipc	a5,0x2
      42:	c4a78793          	addi	a5,a5,-950 # 1c88 <malloc+0x174>
      46:	97ba                	add	a5,a5,a4
      48:	8782                	jr	a5
  default:
    panic("runcmd");
      4a:	00002517          	auipc	a0,0x2
      4e:	c0e50513          	addi	a0,a0,-1010 # 1c58 <malloc+0x144>
      52:	00000097          	auipc	ra,0x0
      56:	3d8080e7          	jalr	984(ra) # 42a <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
      5a:	fb843783          	ld	a5,-72(s0)
      5e:	fcf43423          	sd	a5,-56(s0)
    if(ecmd->argv[0] == 0)
      62:	fc843783          	ld	a5,-56(s0)
      66:	679c                	ld	a5,8(a5)
      68:	e791                	bnez	a5,74 <runcmd+0x74>
      exit(1);
      6a:	4505                	li	a0,1
      6c:	00001097          	auipc	ra,0x1
      70:	380080e7          	jalr	896(ra) # 13ec <exit>
    exec(ecmd->argv[0], ecmd->argv);
      74:	fc843783          	ld	a5,-56(s0)
      78:	6798                	ld	a4,8(a5)
      7a:	fc843783          	ld	a5,-56(s0)
      7e:	07a1                	addi	a5,a5,8
      80:	85be                	mv	a1,a5
      82:	853a                	mv	a0,a4
      84:	00001097          	auipc	ra,0x1
      88:	3a0080e7          	jalr	928(ra) # 1424 <exec>
    fprintf(2, "exec %s failed\n", ecmd->argv[0]);
      8c:	fc843783          	ld	a5,-56(s0)
      90:	679c                	ld	a5,8(a5)
      92:	863e                	mv	a2,a5
      94:	00002597          	auipc	a1,0x2
      98:	bcc58593          	addi	a1,a1,-1076 # 1c60 <malloc+0x14c>
      9c:	4509                	li	a0,2
      9e:	00002097          	auipc	ra,0x2
      a2:	82c080e7          	jalr	-2004(ra) # 18ca <fprintf>
    break;
      a6:	aac9                	j	278 <runcmd+0x278>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
      a8:	fb843783          	ld	a5,-72(s0)
      ac:	fcf43823          	sd	a5,-48(s0)
    close(rcmd->fd);
      b0:	fd043783          	ld	a5,-48(s0)
      b4:	53dc                	lw	a5,36(a5)
      b6:	853e                	mv	a0,a5
      b8:	00001097          	auipc	ra,0x1
      bc:	35c080e7          	jalr	860(ra) # 1414 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
      c0:	fd043783          	ld	a5,-48(s0)
      c4:	6b98                	ld	a4,16(a5)
      c6:	fd043783          	ld	a5,-48(s0)
      ca:	539c                	lw	a5,32(a5)
      cc:	85be                	mv	a1,a5
      ce:	853a                	mv	a0,a4
      d0:	00001097          	auipc	ra,0x1
      d4:	35c080e7          	jalr	860(ra) # 142c <open>
      d8:	87aa                	mv	a5,a0
      da:	0207d463          	bgez	a5,102 <runcmd+0x102>
      fprintf(2, "open %s failed\n", rcmd->file);
      de:	fd043783          	ld	a5,-48(s0)
      e2:	6b9c                	ld	a5,16(a5)
      e4:	863e                	mv	a2,a5
      e6:	00002597          	auipc	a1,0x2
      ea:	b8a58593          	addi	a1,a1,-1142 # 1c70 <malloc+0x15c>
      ee:	4509                	li	a0,2
      f0:	00001097          	auipc	ra,0x1
      f4:	7da080e7          	jalr	2010(ra) # 18ca <fprintf>
      exit(1);
      f8:	4505                	li	a0,1
      fa:	00001097          	auipc	ra,0x1
      fe:	2f2080e7          	jalr	754(ra) # 13ec <exit>
    }
    runcmd(rcmd->cmd);
     102:	fd043783          	ld	a5,-48(s0)
     106:	679c                	ld	a5,8(a5)
     108:	853e                	mv	a0,a5
     10a:	00000097          	auipc	ra,0x0
     10e:	ef6080e7          	jalr	-266(ra) # 0 <runcmd>
    break;
     112:	a29d                	j	278 <runcmd+0x278>

  case LIST:
    lcmd = (struct listcmd*)cmd;
     114:	fb843783          	ld	a5,-72(s0)
     118:	fef43023          	sd	a5,-32(s0)
    if(fork1() == 0)
     11c:	00000097          	auipc	ra,0x0
     120:	33a080e7          	jalr	826(ra) # 456 <fork1>
     124:	87aa                	mv	a5,a0
     126:	eb89                	bnez	a5,138 <runcmd+0x138>
      runcmd(lcmd->left);
     128:	fe043783          	ld	a5,-32(s0)
     12c:	679c                	ld	a5,8(a5)
     12e:	853e                	mv	a0,a5
     130:	00000097          	auipc	ra,0x0
     134:	ed0080e7          	jalr	-304(ra) # 0 <runcmd>
    wait(0);
     138:	4501                	li	a0,0
     13a:	00001097          	auipc	ra,0x1
     13e:	2ba080e7          	jalr	698(ra) # 13f4 <wait>
    runcmd(lcmd->right);
     142:	fe043783          	ld	a5,-32(s0)
     146:	6b9c                	ld	a5,16(a5)
     148:	853e                	mv	a0,a5
     14a:	00000097          	auipc	ra,0x0
     14e:	eb6080e7          	jalr	-330(ra) # 0 <runcmd>
    break;
     152:	a21d                	j	278 <runcmd+0x278>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     154:	fb843783          	ld	a5,-72(s0)
     158:	fcf43c23          	sd	a5,-40(s0)
    if(pipe(p) < 0)
     15c:	fc040793          	addi	a5,s0,-64
     160:	853e                	mv	a0,a5
     162:	00001097          	auipc	ra,0x1
     166:	29a080e7          	jalr	666(ra) # 13fc <pipe>
     16a:	87aa                	mv	a5,a0
     16c:	0007da63          	bgez	a5,180 <runcmd+0x180>
      panic("pipe");
     170:	00002517          	auipc	a0,0x2
     174:	b1050513          	addi	a0,a0,-1264 # 1c80 <malloc+0x16c>
     178:	00000097          	auipc	ra,0x0
     17c:	2b2080e7          	jalr	690(ra) # 42a <panic>
    if(fork1() == 0){
     180:	00000097          	auipc	ra,0x0
     184:	2d6080e7          	jalr	726(ra) # 456 <fork1>
     188:	87aa                	mv	a5,a0
     18a:	e3b9                	bnez	a5,1d0 <runcmd+0x1d0>
      close(1);
     18c:	4505                	li	a0,1
     18e:	00001097          	auipc	ra,0x1
     192:	286080e7          	jalr	646(ra) # 1414 <close>
      dup(p[1]);
     196:	fc442783          	lw	a5,-60(s0)
     19a:	853e                	mv	a0,a5
     19c:	00001097          	auipc	ra,0x1
     1a0:	2c8080e7          	jalr	712(ra) # 1464 <dup>
      close(p[0]);
     1a4:	fc042783          	lw	a5,-64(s0)
     1a8:	853e                	mv	a0,a5
     1aa:	00001097          	auipc	ra,0x1
     1ae:	26a080e7          	jalr	618(ra) # 1414 <close>
      close(p[1]);
     1b2:	fc442783          	lw	a5,-60(s0)
     1b6:	853e                	mv	a0,a5
     1b8:	00001097          	auipc	ra,0x1
     1bc:	25c080e7          	jalr	604(ra) # 1414 <close>
      runcmd(pcmd->left);
     1c0:	fd843783          	ld	a5,-40(s0)
     1c4:	679c                	ld	a5,8(a5)
     1c6:	853e                	mv	a0,a5
     1c8:	00000097          	auipc	ra,0x0
     1cc:	e38080e7          	jalr	-456(ra) # 0 <runcmd>
    }
    if(fork1() == 0){
     1d0:	00000097          	auipc	ra,0x0
     1d4:	286080e7          	jalr	646(ra) # 456 <fork1>
     1d8:	87aa                	mv	a5,a0
     1da:	e3b9                	bnez	a5,220 <runcmd+0x220>
      close(0);
     1dc:	4501                	li	a0,0
     1de:	00001097          	auipc	ra,0x1
     1e2:	236080e7          	jalr	566(ra) # 1414 <close>
      dup(p[0]);
     1e6:	fc042783          	lw	a5,-64(s0)
     1ea:	853e                	mv	a0,a5
     1ec:	00001097          	auipc	ra,0x1
     1f0:	278080e7          	jalr	632(ra) # 1464 <dup>
      close(p[0]);
     1f4:	fc042783          	lw	a5,-64(s0)
     1f8:	853e                	mv	a0,a5
     1fa:	00001097          	auipc	ra,0x1
     1fe:	21a080e7          	jalr	538(ra) # 1414 <close>
      close(p[1]);
     202:	fc442783          	lw	a5,-60(s0)
     206:	853e                	mv	a0,a5
     208:	00001097          	auipc	ra,0x1
     20c:	20c080e7          	jalr	524(ra) # 1414 <close>
      runcmd(pcmd->right);
     210:	fd843783          	ld	a5,-40(s0)
     214:	6b9c                	ld	a5,16(a5)
     216:	853e                	mv	a0,a5
     218:	00000097          	auipc	ra,0x0
     21c:	de8080e7          	jalr	-536(ra) # 0 <runcmd>
    }
    close(p[0]);
     220:	fc042783          	lw	a5,-64(s0)
     224:	853e                	mv	a0,a5
     226:	00001097          	auipc	ra,0x1
     22a:	1ee080e7          	jalr	494(ra) # 1414 <close>
    close(p[1]);
     22e:	fc442783          	lw	a5,-60(s0)
     232:	853e                	mv	a0,a5
     234:	00001097          	auipc	ra,0x1
     238:	1e0080e7          	jalr	480(ra) # 1414 <close>
    wait(0);
     23c:	4501                	li	a0,0
     23e:	00001097          	auipc	ra,0x1
     242:	1b6080e7          	jalr	438(ra) # 13f4 <wait>
    wait(0);
     246:	4501                	li	a0,0
     248:	00001097          	auipc	ra,0x1
     24c:	1ac080e7          	jalr	428(ra) # 13f4 <wait>
    break;
     250:	a025                	j	278 <runcmd+0x278>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     252:	fb843783          	ld	a5,-72(s0)
     256:	fef43423          	sd	a5,-24(s0)
    if(fork1() == 0)
     25a:	00000097          	auipc	ra,0x0
     25e:	1fc080e7          	jalr	508(ra) # 456 <fork1>
     262:	87aa                	mv	a5,a0
     264:	eb89                	bnez	a5,276 <runcmd+0x276>
      runcmd(bcmd->cmd);
     266:	fe843783          	ld	a5,-24(s0)
     26a:	679c                	ld	a5,8(a5)
     26c:	853e                	mv	a0,a5
     26e:	00000097          	auipc	ra,0x0
     272:	d92080e7          	jalr	-622(ra) # 0 <runcmd>
    break;
     276:	0001                	nop
  }
  exit(0);
     278:	4501                	li	a0,0
     27a:	00001097          	auipc	ra,0x1
     27e:	172080e7          	jalr	370(ra) # 13ec <exit>

0000000000000282 <getcmd>:
}

int
getcmd(char *buf, int nbuf)
{
     282:	1101                	addi	sp,sp,-32
     284:	ec06                	sd	ra,24(sp)
     286:	e822                	sd	s0,16(sp)
     288:	1000                	addi	s0,sp,32
     28a:	fea43423          	sd	a0,-24(s0)
     28e:	87ae                	mv	a5,a1
     290:	fef42223          	sw	a5,-28(s0)
  fprintf(2, "$ ");
     294:	00002597          	auipc	a1,0x2
     298:	a0c58593          	addi	a1,a1,-1524 # 1ca0 <malloc+0x18c>
     29c:	4509                	li	a0,2
     29e:	00001097          	auipc	ra,0x1
     2a2:	62c080e7          	jalr	1580(ra) # 18ca <fprintf>
  memset(buf, 0, nbuf);
     2a6:	fe442783          	lw	a5,-28(s0)
     2aa:	863e                	mv	a2,a5
     2ac:	4581                	li	a1,0
     2ae:	fe843503          	ld	a0,-24(s0)
     2b2:	00001097          	auipc	ra,0x1
     2b6:	d90080e7          	jalr	-624(ra) # 1042 <memset>
  gets(buf, nbuf);
     2ba:	fe442783          	lw	a5,-28(s0)
     2be:	85be                	mv	a1,a5
     2c0:	fe843503          	ld	a0,-24(s0)
     2c4:	00001097          	auipc	ra,0x1
     2c8:	e28080e7          	jalr	-472(ra) # 10ec <gets>
  if(buf[0] == 0) // EOF
     2cc:	fe843783          	ld	a5,-24(s0)
     2d0:	0007c783          	lbu	a5,0(a5)
     2d4:	e399                	bnez	a5,2da <getcmd+0x58>
    return -1;
     2d6:	57fd                	li	a5,-1
     2d8:	a011                	j	2dc <getcmd+0x5a>
  return 0;
     2da:	4781                	li	a5,0
}
     2dc:	853e                	mv	a0,a5
     2de:	60e2                	ld	ra,24(sp)
     2e0:	6442                	ld	s0,16(sp)
     2e2:	6105                	addi	sp,sp,32
     2e4:	8082                	ret

00000000000002e6 <main>:

int
main(void)
{
     2e6:	1101                	addi	sp,sp,-32
     2e8:	ec06                	sd	ra,24(sp)
     2ea:	e822                	sd	s0,16(sp)
     2ec:	1000                	addi	s0,sp,32
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
     2ee:	a005                	j	30e <main+0x28>
    if(fd >= 3){
     2f0:	fec42783          	lw	a5,-20(s0)
     2f4:	0007871b          	sext.w	a4,a5
     2f8:	4789                	li	a5,2
     2fa:	00e7da63          	bge	a5,a4,30e <main+0x28>
      close(fd);
     2fe:	fec42783          	lw	a5,-20(s0)
     302:	853e                	mv	a0,a5
     304:	00001097          	auipc	ra,0x1
     308:	110080e7          	jalr	272(ra) # 1414 <close>
      break;
     30c:	a015                	j	330 <main+0x4a>
  while((fd = open("console", O_RDWR)) >= 0){
     30e:	4589                	li	a1,2
     310:	00002517          	auipc	a0,0x2
     314:	99850513          	addi	a0,a0,-1640 # 1ca8 <malloc+0x194>
     318:	00001097          	auipc	ra,0x1
     31c:	114080e7          	jalr	276(ra) # 142c <open>
     320:	87aa                	mv	a5,a0
     322:	fef42623          	sw	a5,-20(s0)
     326:	fec42783          	lw	a5,-20(s0)
     32a:	2781                	sext.w	a5,a5
     32c:	fc07d2e3          	bgez	a5,2f0 <main+0xa>
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     330:	a8d9                	j	406 <main+0x120>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     332:	00002797          	auipc	a5,0x2
     336:	a9678793          	addi	a5,a5,-1386 # 1dc8 <buf.1137>
     33a:	0007c783          	lbu	a5,0(a5)
     33e:	873e                	mv	a4,a5
     340:	06300793          	li	a5,99
     344:	08f71863          	bne	a4,a5,3d4 <main+0xee>
     348:	00002797          	auipc	a5,0x2
     34c:	a8078793          	addi	a5,a5,-1408 # 1dc8 <buf.1137>
     350:	0017c783          	lbu	a5,1(a5)
     354:	873e                	mv	a4,a5
     356:	06400793          	li	a5,100
     35a:	06f71d63          	bne	a4,a5,3d4 <main+0xee>
     35e:	00002797          	auipc	a5,0x2
     362:	a6a78793          	addi	a5,a5,-1430 # 1dc8 <buf.1137>
     366:	0027c783          	lbu	a5,2(a5)
     36a:	873e                	mv	a4,a5
     36c:	02000793          	li	a5,32
     370:	06f71263          	bne	a4,a5,3d4 <main+0xee>
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     374:	00002517          	auipc	a0,0x2
     378:	a5450513          	addi	a0,a0,-1452 # 1dc8 <buf.1137>
     37c:	00001097          	auipc	ra,0x1
     380:	c90080e7          	jalr	-880(ra) # 100c <strlen>
     384:	87aa                	mv	a5,a0
     386:	2781                	sext.w	a5,a5
     388:	37fd                	addiw	a5,a5,-1
     38a:	2781                	sext.w	a5,a5
     38c:	00002717          	auipc	a4,0x2
     390:	a3c70713          	addi	a4,a4,-1476 # 1dc8 <buf.1137>
     394:	1782                	slli	a5,a5,0x20
     396:	9381                	srli	a5,a5,0x20
     398:	97ba                	add	a5,a5,a4
     39a:	00078023          	sb	zero,0(a5)
      if(chdir(buf+3) < 0)
     39e:	00002797          	auipc	a5,0x2
     3a2:	a2d78793          	addi	a5,a5,-1491 # 1dcb <buf.1137+0x3>
     3a6:	853e                	mv	a0,a5
     3a8:	00001097          	auipc	ra,0x1
     3ac:	0b4080e7          	jalr	180(ra) # 145c <chdir>
     3b0:	87aa                	mv	a5,a0
     3b2:	0407da63          	bgez	a5,406 <main+0x120>
        fprintf(2, "cannot cd %s\n", buf+3);
     3b6:	00002797          	auipc	a5,0x2
     3ba:	a1578793          	addi	a5,a5,-1515 # 1dcb <buf.1137+0x3>
     3be:	863e                	mv	a2,a5
     3c0:	00002597          	auipc	a1,0x2
     3c4:	8f058593          	addi	a1,a1,-1808 # 1cb0 <malloc+0x19c>
     3c8:	4509                	li	a0,2
     3ca:	00001097          	auipc	ra,0x1
     3ce:	500080e7          	jalr	1280(ra) # 18ca <fprintf>
      continue;
     3d2:	a815                	j	406 <main+0x120>
    }
    if(fork1() == 0)
     3d4:	00000097          	auipc	ra,0x0
     3d8:	082080e7          	jalr	130(ra) # 456 <fork1>
     3dc:	87aa                	mv	a5,a0
     3de:	ef99                	bnez	a5,3fc <main+0x116>
      runcmd(parsecmd(buf));
     3e0:	00002517          	auipc	a0,0x2
     3e4:	9e850513          	addi	a0,a0,-1560 # 1dc8 <buf.1137>
     3e8:	00000097          	auipc	ra,0x0
     3ec:	4e2080e7          	jalr	1250(ra) # 8ca <parsecmd>
     3f0:	87aa                	mv	a5,a0
     3f2:	853e                	mv	a0,a5
     3f4:	00000097          	auipc	ra,0x0
     3f8:	c0c080e7          	jalr	-1012(ra) # 0 <runcmd>
    wait(0);
     3fc:	4501                	li	a0,0
     3fe:	00001097          	auipc	ra,0x1
     402:	ff6080e7          	jalr	-10(ra) # 13f4 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
     406:	06400593          	li	a1,100
     40a:	00002517          	auipc	a0,0x2
     40e:	9be50513          	addi	a0,a0,-1602 # 1dc8 <buf.1137>
     412:	00000097          	auipc	ra,0x0
     416:	e70080e7          	jalr	-400(ra) # 282 <getcmd>
     41a:	87aa                	mv	a5,a0
     41c:	f007dbe3          	bgez	a5,332 <main+0x4c>
  }
  exit(0);
     420:	4501                	li	a0,0
     422:	00001097          	auipc	ra,0x1
     426:	fca080e7          	jalr	-54(ra) # 13ec <exit>

000000000000042a <panic>:
}

void
panic(char *s)
{
     42a:	1101                	addi	sp,sp,-32
     42c:	ec06                	sd	ra,24(sp)
     42e:	e822                	sd	s0,16(sp)
     430:	1000                	addi	s0,sp,32
     432:	fea43423          	sd	a0,-24(s0)
  fprintf(2, "%s\n", s);
     436:	fe843603          	ld	a2,-24(s0)
     43a:	00002597          	auipc	a1,0x2
     43e:	88658593          	addi	a1,a1,-1914 # 1cc0 <malloc+0x1ac>
     442:	4509                	li	a0,2
     444:	00001097          	auipc	ra,0x1
     448:	486080e7          	jalr	1158(ra) # 18ca <fprintf>
  exit(1);
     44c:	4505                	li	a0,1
     44e:	00001097          	auipc	ra,0x1
     452:	f9e080e7          	jalr	-98(ra) # 13ec <exit>

0000000000000456 <fork1>:
}

int
fork1(void)
{
     456:	1101                	addi	sp,sp,-32
     458:	ec06                	sd	ra,24(sp)
     45a:	e822                	sd	s0,16(sp)
     45c:	1000                	addi	s0,sp,32
  int pid;

  pid = fork();
     45e:	00001097          	auipc	ra,0x1
     462:	f86080e7          	jalr	-122(ra) # 13e4 <fork>
     466:	87aa                	mv	a5,a0
     468:	fef42623          	sw	a5,-20(s0)
  if(pid == -1)
     46c:	fec42783          	lw	a5,-20(s0)
     470:	0007871b          	sext.w	a4,a5
     474:	57fd                	li	a5,-1
     476:	00f71a63          	bne	a4,a5,48a <fork1+0x34>
    panic("fork");
     47a:	00002517          	auipc	a0,0x2
     47e:	84e50513          	addi	a0,a0,-1970 # 1cc8 <malloc+0x1b4>
     482:	00000097          	auipc	ra,0x0
     486:	fa8080e7          	jalr	-88(ra) # 42a <panic>
  return pid;
     48a:	fec42783          	lw	a5,-20(s0)
}
     48e:	853e                	mv	a0,a5
     490:	60e2                	ld	ra,24(sp)
     492:	6442                	ld	s0,16(sp)
     494:	6105                	addi	sp,sp,32
     496:	8082                	ret

0000000000000498 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     498:	1101                	addi	sp,sp,-32
     49a:	ec06                	sd	ra,24(sp)
     49c:	e822                	sd	s0,16(sp)
     49e:	1000                	addi	s0,sp,32
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4a0:	0a800513          	li	a0,168
     4a4:	00001097          	auipc	ra,0x1
     4a8:	670080e7          	jalr	1648(ra) # 1b14 <malloc>
     4ac:	fea43423          	sd	a0,-24(s0)
  memset(cmd, 0, sizeof(*cmd));
     4b0:	0a800613          	li	a2,168
     4b4:	4581                	li	a1,0
     4b6:	fe843503          	ld	a0,-24(s0)
     4ba:	00001097          	auipc	ra,0x1
     4be:	b88080e7          	jalr	-1144(ra) # 1042 <memset>
  cmd->type = EXEC;
     4c2:	fe843783          	ld	a5,-24(s0)
     4c6:	4705                	li	a4,1
     4c8:	c398                	sw	a4,0(a5)
  return (struct cmd*)cmd;
     4ca:	fe843783          	ld	a5,-24(s0)
}
     4ce:	853e                	mv	a0,a5
     4d0:	60e2                	ld	ra,24(sp)
     4d2:	6442                	ld	s0,16(sp)
     4d4:	6105                	addi	sp,sp,32
     4d6:	8082                	ret

00000000000004d8 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     4d8:	7139                	addi	sp,sp,-64
     4da:	fc06                	sd	ra,56(sp)
     4dc:	f822                	sd	s0,48(sp)
     4de:	0080                	addi	s0,sp,64
     4e0:	fca43c23          	sd	a0,-40(s0)
     4e4:	fcb43823          	sd	a1,-48(s0)
     4e8:	fcc43423          	sd	a2,-56(s0)
     4ec:	87b6                	mv	a5,a3
     4ee:	fcf42223          	sw	a5,-60(s0)
     4f2:	87ba                	mv	a5,a4
     4f4:	fcf42023          	sw	a5,-64(s0)
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4f8:	02800513          	li	a0,40
     4fc:	00001097          	auipc	ra,0x1
     500:	618080e7          	jalr	1560(ra) # 1b14 <malloc>
     504:	fea43423          	sd	a0,-24(s0)
  memset(cmd, 0, sizeof(*cmd));
     508:	02800613          	li	a2,40
     50c:	4581                	li	a1,0
     50e:	fe843503          	ld	a0,-24(s0)
     512:	00001097          	auipc	ra,0x1
     516:	b30080e7          	jalr	-1232(ra) # 1042 <memset>
  cmd->type = REDIR;
     51a:	fe843783          	ld	a5,-24(s0)
     51e:	4709                	li	a4,2
     520:	c398                	sw	a4,0(a5)
  cmd->cmd = subcmd;
     522:	fe843783          	ld	a5,-24(s0)
     526:	fd843703          	ld	a4,-40(s0)
     52a:	e798                	sd	a4,8(a5)
  cmd->file = file;
     52c:	fe843783          	ld	a5,-24(s0)
     530:	fd043703          	ld	a4,-48(s0)
     534:	eb98                	sd	a4,16(a5)
  cmd->efile = efile;
     536:	fe843783          	ld	a5,-24(s0)
     53a:	fc843703          	ld	a4,-56(s0)
     53e:	ef98                	sd	a4,24(a5)
  cmd->mode = mode;
     540:	fe843783          	ld	a5,-24(s0)
     544:	fc442703          	lw	a4,-60(s0)
     548:	d398                	sw	a4,32(a5)
  cmd->fd = fd;
     54a:	fe843783          	ld	a5,-24(s0)
     54e:	fc042703          	lw	a4,-64(s0)
     552:	d3d8                	sw	a4,36(a5)
  return (struct cmd*)cmd;
     554:	fe843783          	ld	a5,-24(s0)
}
     558:	853e                	mv	a0,a5
     55a:	70e2                	ld	ra,56(sp)
     55c:	7442                	ld	s0,48(sp)
     55e:	6121                	addi	sp,sp,64
     560:	8082                	ret

0000000000000562 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     562:	7179                	addi	sp,sp,-48
     564:	f406                	sd	ra,40(sp)
     566:	f022                	sd	s0,32(sp)
     568:	1800                	addi	s0,sp,48
     56a:	fca43c23          	sd	a0,-40(s0)
     56e:	fcb43823          	sd	a1,-48(s0)
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     572:	4561                	li	a0,24
     574:	00001097          	auipc	ra,0x1
     578:	5a0080e7          	jalr	1440(ra) # 1b14 <malloc>
     57c:	fea43423          	sd	a0,-24(s0)
  memset(cmd, 0, sizeof(*cmd));
     580:	4661                	li	a2,24
     582:	4581                	li	a1,0
     584:	fe843503          	ld	a0,-24(s0)
     588:	00001097          	auipc	ra,0x1
     58c:	aba080e7          	jalr	-1350(ra) # 1042 <memset>
  cmd->type = PIPE;
     590:	fe843783          	ld	a5,-24(s0)
     594:	470d                	li	a4,3
     596:	c398                	sw	a4,0(a5)
  cmd->left = left;
     598:	fe843783          	ld	a5,-24(s0)
     59c:	fd843703          	ld	a4,-40(s0)
     5a0:	e798                	sd	a4,8(a5)
  cmd->right = right;
     5a2:	fe843783          	ld	a5,-24(s0)
     5a6:	fd043703          	ld	a4,-48(s0)
     5aa:	eb98                	sd	a4,16(a5)
  return (struct cmd*)cmd;
     5ac:	fe843783          	ld	a5,-24(s0)
}
     5b0:	853e                	mv	a0,a5
     5b2:	70a2                	ld	ra,40(sp)
     5b4:	7402                	ld	s0,32(sp)
     5b6:	6145                	addi	sp,sp,48
     5b8:	8082                	ret

00000000000005ba <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     5ba:	7179                	addi	sp,sp,-48
     5bc:	f406                	sd	ra,40(sp)
     5be:	f022                	sd	s0,32(sp)
     5c0:	1800                	addi	s0,sp,48
     5c2:	fca43c23          	sd	a0,-40(s0)
     5c6:	fcb43823          	sd	a1,-48(s0)
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5ca:	4561                	li	a0,24
     5cc:	00001097          	auipc	ra,0x1
     5d0:	548080e7          	jalr	1352(ra) # 1b14 <malloc>
     5d4:	fea43423          	sd	a0,-24(s0)
  memset(cmd, 0, sizeof(*cmd));
     5d8:	4661                	li	a2,24
     5da:	4581                	li	a1,0
     5dc:	fe843503          	ld	a0,-24(s0)
     5e0:	00001097          	auipc	ra,0x1
     5e4:	a62080e7          	jalr	-1438(ra) # 1042 <memset>
  cmd->type = LIST;
     5e8:	fe843783          	ld	a5,-24(s0)
     5ec:	4711                	li	a4,4
     5ee:	c398                	sw	a4,0(a5)
  cmd->left = left;
     5f0:	fe843783          	ld	a5,-24(s0)
     5f4:	fd843703          	ld	a4,-40(s0)
     5f8:	e798                	sd	a4,8(a5)
  cmd->right = right;
     5fa:	fe843783          	ld	a5,-24(s0)
     5fe:	fd043703          	ld	a4,-48(s0)
     602:	eb98                	sd	a4,16(a5)
  return (struct cmd*)cmd;
     604:	fe843783          	ld	a5,-24(s0)
}
     608:	853e                	mv	a0,a5
     60a:	70a2                	ld	ra,40(sp)
     60c:	7402                	ld	s0,32(sp)
     60e:	6145                	addi	sp,sp,48
     610:	8082                	ret

0000000000000612 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     612:	7179                	addi	sp,sp,-48
     614:	f406                	sd	ra,40(sp)
     616:	f022                	sd	s0,32(sp)
     618:	1800                	addi	s0,sp,48
     61a:	fca43c23          	sd	a0,-40(s0)
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     61e:	4541                	li	a0,16
     620:	00001097          	auipc	ra,0x1
     624:	4f4080e7          	jalr	1268(ra) # 1b14 <malloc>
     628:	fea43423          	sd	a0,-24(s0)
  memset(cmd, 0, sizeof(*cmd));
     62c:	4641                	li	a2,16
     62e:	4581                	li	a1,0
     630:	fe843503          	ld	a0,-24(s0)
     634:	00001097          	auipc	ra,0x1
     638:	a0e080e7          	jalr	-1522(ra) # 1042 <memset>
  cmd->type = BACK;
     63c:	fe843783          	ld	a5,-24(s0)
     640:	4715                	li	a4,5
     642:	c398                	sw	a4,0(a5)
  cmd->cmd = subcmd;
     644:	fe843783          	ld	a5,-24(s0)
     648:	fd843703          	ld	a4,-40(s0)
     64c:	e798                	sd	a4,8(a5)
  return (struct cmd*)cmd;
     64e:	fe843783          	ld	a5,-24(s0)
}
     652:	853e                	mv	a0,a5
     654:	70a2                	ld	ra,40(sp)
     656:	7402                	ld	s0,32(sp)
     658:	6145                	addi	sp,sp,48
     65a:	8082                	ret

000000000000065c <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     65c:	7139                	addi	sp,sp,-64
     65e:	fc06                	sd	ra,56(sp)
     660:	f822                	sd	s0,48(sp)
     662:	0080                	addi	s0,sp,64
     664:	fca43c23          	sd	a0,-40(s0)
     668:	fcb43823          	sd	a1,-48(s0)
     66c:	fcc43423          	sd	a2,-56(s0)
     670:	fcd43023          	sd	a3,-64(s0)
  char *s;
  int ret;

  s = *ps;
     674:	fd843783          	ld	a5,-40(s0)
     678:	639c                	ld	a5,0(a5)
     67a:	fef43423          	sd	a5,-24(s0)
  while(s < es && strchr(whitespace, *s))
     67e:	a031                	j	68a <gettoken+0x2e>
    s++;
     680:	fe843783          	ld	a5,-24(s0)
     684:	0785                	addi	a5,a5,1
     686:	fef43423          	sd	a5,-24(s0)
  while(s < es && strchr(whitespace, *s))
     68a:	fe843703          	ld	a4,-24(s0)
     68e:	fd043783          	ld	a5,-48(s0)
     692:	02f77163          	bgeu	a4,a5,6b4 <gettoken+0x58>
     696:	fe843783          	ld	a5,-24(s0)
     69a:	0007c783          	lbu	a5,0(a5)
     69e:	85be                	mv	a1,a5
     6a0:	00001517          	auipc	a0,0x1
     6a4:	71850513          	addi	a0,a0,1816 # 1db8 <whitespace>
     6a8:	00001097          	auipc	ra,0x1
     6ac:	9fa080e7          	jalr	-1542(ra) # 10a2 <strchr>
     6b0:	87aa                	mv	a5,a0
     6b2:	f7f9                	bnez	a5,680 <gettoken+0x24>
  if(q)
     6b4:	fc843783          	ld	a5,-56(s0)
     6b8:	c791                	beqz	a5,6c4 <gettoken+0x68>
    *q = s;
     6ba:	fc843783          	ld	a5,-56(s0)
     6be:	fe843703          	ld	a4,-24(s0)
     6c2:	e398                	sd	a4,0(a5)
  ret = *s;
     6c4:	fe843783          	ld	a5,-24(s0)
     6c8:	0007c783          	lbu	a5,0(a5)
     6cc:	fef42223          	sw	a5,-28(s0)
  switch(*s){
     6d0:	fe843783          	ld	a5,-24(s0)
     6d4:	0007c783          	lbu	a5,0(a5)
     6d8:	2781                	sext.w	a5,a5
     6da:	86be                	mv	a3,a5
     6dc:	07c00713          	li	a4,124
     6e0:	04e68b63          	beq	a3,a4,736 <gettoken+0xda>
     6e4:	86be                	mv	a3,a5
     6e6:	07c00713          	li	a4,124
     6ea:	08d74463          	blt	a4,a3,772 <gettoken+0x116>
     6ee:	86be                	mv	a3,a5
     6f0:	03e00713          	li	a4,62
     6f4:	04e68763          	beq	a3,a4,742 <gettoken+0xe6>
     6f8:	86be                	mv	a3,a5
     6fa:	03e00713          	li	a4,62
     6fe:	06d74a63          	blt	a4,a3,772 <gettoken+0x116>
     702:	86be                	mv	a3,a5
     704:	03c00713          	li	a4,60
     708:	06d74563          	blt	a4,a3,772 <gettoken+0x116>
     70c:	86be                	mv	a3,a5
     70e:	03b00713          	li	a4,59
     712:	02e6d263          	bge	a3,a4,736 <gettoken+0xda>
     716:	86be                	mv	a3,a5
     718:	02900713          	li	a4,41
     71c:	04d74b63          	blt	a4,a3,772 <gettoken+0x116>
     720:	86be                	mv	a3,a5
     722:	02800713          	li	a4,40
     726:	00e6d863          	bge	a3,a4,736 <gettoken+0xda>
     72a:	c3dd                	beqz	a5,7d0 <gettoken+0x174>
     72c:	873e                	mv	a4,a5
     72e:	02600793          	li	a5,38
     732:	04f71063          	bne	a4,a5,772 <gettoken+0x116>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     736:	fe843783          	ld	a5,-24(s0)
     73a:	0785                	addi	a5,a5,1
     73c:	fef43423          	sd	a5,-24(s0)
    break;
     740:	a869                	j	7da <gettoken+0x17e>
  case '>':
    s++;
     742:	fe843783          	ld	a5,-24(s0)
     746:	0785                	addi	a5,a5,1
     748:	fef43423          	sd	a5,-24(s0)
    if(*s == '>'){
     74c:	fe843783          	ld	a5,-24(s0)
     750:	0007c783          	lbu	a5,0(a5)
     754:	873e                	mv	a4,a5
     756:	03e00793          	li	a5,62
     75a:	06f71d63          	bne	a4,a5,7d4 <gettoken+0x178>
      ret = '+';
     75e:	02b00793          	li	a5,43
     762:	fef42223          	sw	a5,-28(s0)
      s++;
     766:	fe843783          	ld	a5,-24(s0)
     76a:	0785                	addi	a5,a5,1
     76c:	fef43423          	sd	a5,-24(s0)
    }
    break;
     770:	a095                	j	7d4 <gettoken+0x178>
  default:
    ret = 'a';
     772:	06100793          	li	a5,97
     776:	fef42223          	sw	a5,-28(s0)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     77a:	a031                	j	786 <gettoken+0x12a>
      s++;
     77c:	fe843783          	ld	a5,-24(s0)
     780:	0785                	addi	a5,a5,1
     782:	fef43423          	sd	a5,-24(s0)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     786:	fe843703          	ld	a4,-24(s0)
     78a:	fd043783          	ld	a5,-48(s0)
     78e:	04f77563          	bgeu	a4,a5,7d8 <gettoken+0x17c>
     792:	fe843783          	ld	a5,-24(s0)
     796:	0007c783          	lbu	a5,0(a5)
     79a:	85be                	mv	a1,a5
     79c:	00001517          	auipc	a0,0x1
     7a0:	61c50513          	addi	a0,a0,1564 # 1db8 <whitespace>
     7a4:	00001097          	auipc	ra,0x1
     7a8:	8fe080e7          	jalr	-1794(ra) # 10a2 <strchr>
     7ac:	87aa                	mv	a5,a0
     7ae:	e78d                	bnez	a5,7d8 <gettoken+0x17c>
     7b0:	fe843783          	ld	a5,-24(s0)
     7b4:	0007c783          	lbu	a5,0(a5)
     7b8:	85be                	mv	a1,a5
     7ba:	00001517          	auipc	a0,0x1
     7be:	60650513          	addi	a0,a0,1542 # 1dc0 <symbols>
     7c2:	00001097          	auipc	ra,0x1
     7c6:	8e0080e7          	jalr	-1824(ra) # 10a2 <strchr>
     7ca:	87aa                	mv	a5,a0
     7cc:	dbc5                	beqz	a5,77c <gettoken+0x120>
    break;
     7ce:	a029                	j	7d8 <gettoken+0x17c>
    break;
     7d0:	0001                	nop
     7d2:	a021                	j	7da <gettoken+0x17e>
    break;
     7d4:	0001                	nop
     7d6:	a011                	j	7da <gettoken+0x17e>
    break;
     7d8:	0001                	nop
  }
  if(eq)
     7da:	fc043783          	ld	a5,-64(s0)
     7de:	cf81                	beqz	a5,7f6 <gettoken+0x19a>
    *eq = s;
     7e0:	fc043783          	ld	a5,-64(s0)
     7e4:	fe843703          	ld	a4,-24(s0)
     7e8:	e398                	sd	a4,0(a5)

  while(s < es && strchr(whitespace, *s))
     7ea:	a031                	j	7f6 <gettoken+0x19a>
    s++;
     7ec:	fe843783          	ld	a5,-24(s0)
     7f0:	0785                	addi	a5,a5,1
     7f2:	fef43423          	sd	a5,-24(s0)
  while(s < es && strchr(whitespace, *s))
     7f6:	fe843703          	ld	a4,-24(s0)
     7fa:	fd043783          	ld	a5,-48(s0)
     7fe:	02f77163          	bgeu	a4,a5,820 <gettoken+0x1c4>
     802:	fe843783          	ld	a5,-24(s0)
     806:	0007c783          	lbu	a5,0(a5)
     80a:	85be                	mv	a1,a5
     80c:	00001517          	auipc	a0,0x1
     810:	5ac50513          	addi	a0,a0,1452 # 1db8 <whitespace>
     814:	00001097          	auipc	ra,0x1
     818:	88e080e7          	jalr	-1906(ra) # 10a2 <strchr>
     81c:	87aa                	mv	a5,a0
     81e:	f7f9                	bnez	a5,7ec <gettoken+0x190>
  *ps = s;
     820:	fd843783          	ld	a5,-40(s0)
     824:	fe843703          	ld	a4,-24(s0)
     828:	e398                	sd	a4,0(a5)
  return ret;
     82a:	fe442783          	lw	a5,-28(s0)
}
     82e:	853e                	mv	a0,a5
     830:	70e2                	ld	ra,56(sp)
     832:	7442                	ld	s0,48(sp)
     834:	6121                	addi	sp,sp,64
     836:	8082                	ret

0000000000000838 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     838:	7139                	addi	sp,sp,-64
     83a:	fc06                	sd	ra,56(sp)
     83c:	f822                	sd	s0,48(sp)
     83e:	0080                	addi	s0,sp,64
     840:	fca43c23          	sd	a0,-40(s0)
     844:	fcb43823          	sd	a1,-48(s0)
     848:	fcc43423          	sd	a2,-56(s0)
  char *s;

  s = *ps;
     84c:	fd843783          	ld	a5,-40(s0)
     850:	639c                	ld	a5,0(a5)
     852:	fef43423          	sd	a5,-24(s0)
  while(s < es && strchr(whitespace, *s))
     856:	a031                	j	862 <peek+0x2a>
    s++;
     858:	fe843783          	ld	a5,-24(s0)
     85c:	0785                	addi	a5,a5,1
     85e:	fef43423          	sd	a5,-24(s0)
  while(s < es && strchr(whitespace, *s))
     862:	fe843703          	ld	a4,-24(s0)
     866:	fd043783          	ld	a5,-48(s0)
     86a:	02f77163          	bgeu	a4,a5,88c <peek+0x54>
     86e:	fe843783          	ld	a5,-24(s0)
     872:	0007c783          	lbu	a5,0(a5)
     876:	85be                	mv	a1,a5
     878:	00001517          	auipc	a0,0x1
     87c:	54050513          	addi	a0,a0,1344 # 1db8 <whitespace>
     880:	00001097          	auipc	ra,0x1
     884:	822080e7          	jalr	-2014(ra) # 10a2 <strchr>
     888:	87aa                	mv	a5,a0
     88a:	f7f9                	bnez	a5,858 <peek+0x20>
  *ps = s;
     88c:	fd843783          	ld	a5,-40(s0)
     890:	fe843703          	ld	a4,-24(s0)
     894:	e398                	sd	a4,0(a5)
  return *s && strchr(toks, *s);
     896:	fe843783          	ld	a5,-24(s0)
     89a:	0007c783          	lbu	a5,0(a5)
     89e:	c385                	beqz	a5,8be <peek+0x86>
     8a0:	fe843783          	ld	a5,-24(s0)
     8a4:	0007c783          	lbu	a5,0(a5)
     8a8:	85be                	mv	a1,a5
     8aa:	fc843503          	ld	a0,-56(s0)
     8ae:	00000097          	auipc	ra,0x0
     8b2:	7f4080e7          	jalr	2036(ra) # 10a2 <strchr>
     8b6:	87aa                	mv	a5,a0
     8b8:	c399                	beqz	a5,8be <peek+0x86>
     8ba:	4785                	li	a5,1
     8bc:	a011                	j	8c0 <peek+0x88>
     8be:	4781                	li	a5,0
}
     8c0:	853e                	mv	a0,a5
     8c2:	70e2                	ld	ra,56(sp)
     8c4:	7442                	ld	s0,48(sp)
     8c6:	6121                	addi	sp,sp,64
     8c8:	8082                	ret

00000000000008ca <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     8ca:	7139                	addi	sp,sp,-64
     8cc:	fc06                	sd	ra,56(sp)
     8ce:	f822                	sd	s0,48(sp)
     8d0:	f426                	sd	s1,40(sp)
     8d2:	0080                	addi	s0,sp,64
     8d4:	fca43423          	sd	a0,-56(s0)
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     8d8:	fc843483          	ld	s1,-56(s0)
     8dc:	fc843783          	ld	a5,-56(s0)
     8e0:	853e                	mv	a0,a5
     8e2:	00000097          	auipc	ra,0x0
     8e6:	72a080e7          	jalr	1834(ra) # 100c <strlen>
     8ea:	87aa                	mv	a5,a0
     8ec:	2781                	sext.w	a5,a5
     8ee:	1782                	slli	a5,a5,0x20
     8f0:	9381                	srli	a5,a5,0x20
     8f2:	97a6                	add	a5,a5,s1
     8f4:	fcf43c23          	sd	a5,-40(s0)
  cmd = parseline(&s, es);
     8f8:	fc840793          	addi	a5,s0,-56
     8fc:	fd843583          	ld	a1,-40(s0)
     900:	853e                	mv	a0,a5
     902:	00000097          	auipc	ra,0x0
     906:	076080e7          	jalr	118(ra) # 978 <parseline>
     90a:	fca43823          	sd	a0,-48(s0)
  peek(&s, es, "");
     90e:	fc840793          	addi	a5,s0,-56
     912:	00001617          	auipc	a2,0x1
     916:	3be60613          	addi	a2,a2,958 # 1cd0 <malloc+0x1bc>
     91a:	fd843583          	ld	a1,-40(s0)
     91e:	853e                	mv	a0,a5
     920:	00000097          	auipc	ra,0x0
     924:	f18080e7          	jalr	-232(ra) # 838 <peek>
  if(s != es){
     928:	fc843783          	ld	a5,-56(s0)
     92c:	fd843703          	ld	a4,-40(s0)
     930:	02f70663          	beq	a4,a5,95c <parsecmd+0x92>
    fprintf(2, "leftovers: %s\n", s);
     934:	fc843783          	ld	a5,-56(s0)
     938:	863e                	mv	a2,a5
     93a:	00001597          	auipc	a1,0x1
     93e:	39e58593          	addi	a1,a1,926 # 1cd8 <malloc+0x1c4>
     942:	4509                	li	a0,2
     944:	00001097          	auipc	ra,0x1
     948:	f86080e7          	jalr	-122(ra) # 18ca <fprintf>
    panic("syntax");
     94c:	00001517          	auipc	a0,0x1
     950:	39c50513          	addi	a0,a0,924 # 1ce8 <malloc+0x1d4>
     954:	00000097          	auipc	ra,0x0
     958:	ad6080e7          	jalr	-1322(ra) # 42a <panic>
  }
  nulterminate(cmd);
     95c:	fd043503          	ld	a0,-48(s0)
     960:	00000097          	auipc	ra,0x0
     964:	4da080e7          	jalr	1242(ra) # e3a <nulterminate>
  return cmd;
     968:	fd043783          	ld	a5,-48(s0)
}
     96c:	853e                	mv	a0,a5
     96e:	70e2                	ld	ra,56(sp)
     970:	7442                	ld	s0,48(sp)
     972:	74a2                	ld	s1,40(sp)
     974:	6121                	addi	sp,sp,64
     976:	8082                	ret

0000000000000978 <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
     978:	7179                	addi	sp,sp,-48
     97a:	f406                	sd	ra,40(sp)
     97c:	f022                	sd	s0,32(sp)
     97e:	1800                	addi	s0,sp,48
     980:	fca43c23          	sd	a0,-40(s0)
     984:	fcb43823          	sd	a1,-48(s0)
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     988:	fd043583          	ld	a1,-48(s0)
     98c:	fd843503          	ld	a0,-40(s0)
     990:	00000097          	auipc	ra,0x0
     994:	0b0080e7          	jalr	176(ra) # a40 <parsepipe>
     998:	fea43423          	sd	a0,-24(s0)
  while(peek(ps, es, "&")){
     99c:	a01d                	j	9c2 <parseline+0x4a>
    gettoken(ps, es, 0, 0);
     99e:	4681                	li	a3,0
     9a0:	4601                	li	a2,0
     9a2:	fd043583          	ld	a1,-48(s0)
     9a6:	fd843503          	ld	a0,-40(s0)
     9aa:	00000097          	auipc	ra,0x0
     9ae:	cb2080e7          	jalr	-846(ra) # 65c <gettoken>
    cmd = backcmd(cmd);
     9b2:	fe843503          	ld	a0,-24(s0)
     9b6:	00000097          	auipc	ra,0x0
     9ba:	c5c080e7          	jalr	-932(ra) # 612 <backcmd>
     9be:	fea43423          	sd	a0,-24(s0)
  while(peek(ps, es, "&")){
     9c2:	00001617          	auipc	a2,0x1
     9c6:	32e60613          	addi	a2,a2,814 # 1cf0 <malloc+0x1dc>
     9ca:	fd043583          	ld	a1,-48(s0)
     9ce:	fd843503          	ld	a0,-40(s0)
     9d2:	00000097          	auipc	ra,0x0
     9d6:	e66080e7          	jalr	-410(ra) # 838 <peek>
     9da:	87aa                	mv	a5,a0
     9dc:	f3e9                	bnez	a5,99e <parseline+0x26>
  }
  if(peek(ps, es, ";")){
     9de:	00001617          	auipc	a2,0x1
     9e2:	31a60613          	addi	a2,a2,794 # 1cf8 <malloc+0x1e4>
     9e6:	fd043583          	ld	a1,-48(s0)
     9ea:	fd843503          	ld	a0,-40(s0)
     9ee:	00000097          	auipc	ra,0x0
     9f2:	e4a080e7          	jalr	-438(ra) # 838 <peek>
     9f6:	87aa                	mv	a5,a0
     9f8:	cf8d                	beqz	a5,a32 <parseline+0xba>
    gettoken(ps, es, 0, 0);
     9fa:	4681                	li	a3,0
     9fc:	4601                	li	a2,0
     9fe:	fd043583          	ld	a1,-48(s0)
     a02:	fd843503          	ld	a0,-40(s0)
     a06:	00000097          	auipc	ra,0x0
     a0a:	c56080e7          	jalr	-938(ra) # 65c <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     a0e:	fd043583          	ld	a1,-48(s0)
     a12:	fd843503          	ld	a0,-40(s0)
     a16:	00000097          	auipc	ra,0x0
     a1a:	f62080e7          	jalr	-158(ra) # 978 <parseline>
     a1e:	87aa                	mv	a5,a0
     a20:	85be                	mv	a1,a5
     a22:	fe843503          	ld	a0,-24(s0)
     a26:	00000097          	auipc	ra,0x0
     a2a:	b94080e7          	jalr	-1132(ra) # 5ba <listcmd>
     a2e:	fea43423          	sd	a0,-24(s0)
  }
  return cmd;
     a32:	fe843783          	ld	a5,-24(s0)
}
     a36:	853e                	mv	a0,a5
     a38:	70a2                	ld	ra,40(sp)
     a3a:	7402                	ld	s0,32(sp)
     a3c:	6145                	addi	sp,sp,48
     a3e:	8082                	ret

0000000000000a40 <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
     a40:	7179                	addi	sp,sp,-48
     a42:	f406                	sd	ra,40(sp)
     a44:	f022                	sd	s0,32(sp)
     a46:	1800                	addi	s0,sp,48
     a48:	fca43c23          	sd	a0,-40(s0)
     a4c:	fcb43823          	sd	a1,-48(s0)
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     a50:	fd043583          	ld	a1,-48(s0)
     a54:	fd843503          	ld	a0,-40(s0)
     a58:	00000097          	auipc	ra,0x0
     a5c:	270080e7          	jalr	624(ra) # cc8 <parseexec>
     a60:	fea43423          	sd	a0,-24(s0)
  if(peek(ps, es, "|")){
     a64:	00001617          	auipc	a2,0x1
     a68:	29c60613          	addi	a2,a2,668 # 1d00 <malloc+0x1ec>
     a6c:	fd043583          	ld	a1,-48(s0)
     a70:	fd843503          	ld	a0,-40(s0)
     a74:	00000097          	auipc	ra,0x0
     a78:	dc4080e7          	jalr	-572(ra) # 838 <peek>
     a7c:	87aa                	mv	a5,a0
     a7e:	cf8d                	beqz	a5,ab8 <parsepipe+0x78>
    gettoken(ps, es, 0, 0);
     a80:	4681                	li	a3,0
     a82:	4601                	li	a2,0
     a84:	fd043583          	ld	a1,-48(s0)
     a88:	fd843503          	ld	a0,-40(s0)
     a8c:	00000097          	auipc	ra,0x0
     a90:	bd0080e7          	jalr	-1072(ra) # 65c <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a94:	fd043583          	ld	a1,-48(s0)
     a98:	fd843503          	ld	a0,-40(s0)
     a9c:	00000097          	auipc	ra,0x0
     aa0:	fa4080e7          	jalr	-92(ra) # a40 <parsepipe>
     aa4:	87aa                	mv	a5,a0
     aa6:	85be                	mv	a1,a5
     aa8:	fe843503          	ld	a0,-24(s0)
     aac:	00000097          	auipc	ra,0x0
     ab0:	ab6080e7          	jalr	-1354(ra) # 562 <pipecmd>
     ab4:	fea43423          	sd	a0,-24(s0)
  }
  return cmd;
     ab8:	fe843783          	ld	a5,-24(s0)
}
     abc:	853e                	mv	a0,a5
     abe:	70a2                	ld	ra,40(sp)
     ac0:	7402                	ld	s0,32(sp)
     ac2:	6145                	addi	sp,sp,48
     ac4:	8082                	ret

0000000000000ac6 <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     ac6:	715d                	addi	sp,sp,-80
     ac8:	e486                	sd	ra,72(sp)
     aca:	e0a2                	sd	s0,64(sp)
     acc:	0880                	addi	s0,sp,80
     ace:	fca43423          	sd	a0,-56(s0)
     ad2:	fcb43023          	sd	a1,-64(s0)
     ad6:	fac43c23          	sd	a2,-72(s0)
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     ada:	a8e5                	j	bd2 <parseredirs+0x10c>
    tok = gettoken(ps, es, 0, 0);
     adc:	4681                	li	a3,0
     ade:	4601                	li	a2,0
     ae0:	fb843583          	ld	a1,-72(s0)
     ae4:	fc043503          	ld	a0,-64(s0)
     ae8:	00000097          	auipc	ra,0x0
     aec:	b74080e7          	jalr	-1164(ra) # 65c <gettoken>
     af0:	87aa                	mv	a5,a0
     af2:	fef42623          	sw	a5,-20(s0)
    if(gettoken(ps, es, &q, &eq) != 'a')
     af6:	fd840713          	addi	a4,s0,-40
     afa:	fe040793          	addi	a5,s0,-32
     afe:	86ba                	mv	a3,a4
     b00:	863e                	mv	a2,a5
     b02:	fb843583          	ld	a1,-72(s0)
     b06:	fc043503          	ld	a0,-64(s0)
     b0a:	00000097          	auipc	ra,0x0
     b0e:	b52080e7          	jalr	-1198(ra) # 65c <gettoken>
     b12:	87aa                	mv	a5,a0
     b14:	873e                	mv	a4,a5
     b16:	06100793          	li	a5,97
     b1a:	00f70a63          	beq	a4,a5,b2e <parseredirs+0x68>
      panic("missing file for redirection");
     b1e:	00001517          	auipc	a0,0x1
     b22:	1ea50513          	addi	a0,a0,490 # 1d08 <malloc+0x1f4>
     b26:	00000097          	auipc	ra,0x0
     b2a:	904080e7          	jalr	-1788(ra) # 42a <panic>
    switch(tok){
     b2e:	fec42783          	lw	a5,-20(s0)
     b32:	0007871b          	sext.w	a4,a5
     b36:	03e00793          	li	a5,62
     b3a:	04f70a63          	beq	a4,a5,b8e <parseredirs+0xc8>
     b3e:	fec42783          	lw	a5,-20(s0)
     b42:	0007871b          	sext.w	a4,a5
     b46:	03e00793          	li	a5,62
     b4a:	08e7c463          	blt	a5,a4,bd2 <parseredirs+0x10c>
     b4e:	fec42783          	lw	a5,-20(s0)
     b52:	0007871b          	sext.w	a4,a5
     b56:	02b00793          	li	a5,43
     b5a:	04f70b63          	beq	a4,a5,bb0 <parseredirs+0xea>
     b5e:	fec42783          	lw	a5,-20(s0)
     b62:	0007871b          	sext.w	a4,a5
     b66:	03c00793          	li	a5,60
     b6a:	06f71463          	bne	a4,a5,bd2 <parseredirs+0x10c>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     b6e:	fe043783          	ld	a5,-32(s0)
     b72:	fd843603          	ld	a2,-40(s0)
     b76:	4701                	li	a4,0
     b78:	4681                	li	a3,0
     b7a:	85be                	mv	a1,a5
     b7c:	fc843503          	ld	a0,-56(s0)
     b80:	00000097          	auipc	ra,0x0
     b84:	958080e7          	jalr	-1704(ra) # 4d8 <redircmd>
     b88:	fca43423          	sd	a0,-56(s0)
      break;
     b8c:	a099                	j	bd2 <parseredirs+0x10c>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
     b8e:	fe043783          	ld	a5,-32(s0)
     b92:	fd843603          	ld	a2,-40(s0)
     b96:	4705                	li	a4,1
     b98:	60100693          	li	a3,1537
     b9c:	85be                	mv	a1,a5
     b9e:	fc843503          	ld	a0,-56(s0)
     ba2:	00000097          	auipc	ra,0x0
     ba6:	936080e7          	jalr	-1738(ra) # 4d8 <redircmd>
     baa:	fca43423          	sd	a0,-56(s0)
      break;
     bae:	a015                	j	bd2 <parseredirs+0x10c>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     bb0:	fe043783          	ld	a5,-32(s0)
     bb4:	fd843603          	ld	a2,-40(s0)
     bb8:	4705                	li	a4,1
     bba:	20100693          	li	a3,513
     bbe:	85be                	mv	a1,a5
     bc0:	fc843503          	ld	a0,-56(s0)
     bc4:	00000097          	auipc	ra,0x0
     bc8:	914080e7          	jalr	-1772(ra) # 4d8 <redircmd>
     bcc:	fca43423          	sd	a0,-56(s0)
      break;
     bd0:	0001                	nop
  while(peek(ps, es, "<>")){
     bd2:	00001617          	auipc	a2,0x1
     bd6:	15660613          	addi	a2,a2,342 # 1d28 <malloc+0x214>
     bda:	fb843583          	ld	a1,-72(s0)
     bde:	fc043503          	ld	a0,-64(s0)
     be2:	00000097          	auipc	ra,0x0
     be6:	c56080e7          	jalr	-938(ra) # 838 <peek>
     bea:	87aa                	mv	a5,a0
     bec:	ee0798e3          	bnez	a5,adc <parseredirs+0x16>
    }
  }
  return cmd;
     bf0:	fc843783          	ld	a5,-56(s0)
}
     bf4:	853e                	mv	a0,a5
     bf6:	60a6                	ld	ra,72(sp)
     bf8:	6406                	ld	s0,64(sp)
     bfa:	6161                	addi	sp,sp,80
     bfc:	8082                	ret

0000000000000bfe <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
     bfe:	7179                	addi	sp,sp,-48
     c00:	f406                	sd	ra,40(sp)
     c02:	f022                	sd	s0,32(sp)
     c04:	1800                	addi	s0,sp,48
     c06:	fca43c23          	sd	a0,-40(s0)
     c0a:	fcb43823          	sd	a1,-48(s0)
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     c0e:	00001617          	auipc	a2,0x1
     c12:	12260613          	addi	a2,a2,290 # 1d30 <malloc+0x21c>
     c16:	fd043583          	ld	a1,-48(s0)
     c1a:	fd843503          	ld	a0,-40(s0)
     c1e:	00000097          	auipc	ra,0x0
     c22:	c1a080e7          	jalr	-998(ra) # 838 <peek>
     c26:	87aa                	mv	a5,a0
     c28:	eb89                	bnez	a5,c3a <parseblock+0x3c>
    panic("parseblock");
     c2a:	00001517          	auipc	a0,0x1
     c2e:	10e50513          	addi	a0,a0,270 # 1d38 <malloc+0x224>
     c32:	fffff097          	auipc	ra,0xfffff
     c36:	7f8080e7          	jalr	2040(ra) # 42a <panic>
  gettoken(ps, es, 0, 0);
     c3a:	4681                	li	a3,0
     c3c:	4601                	li	a2,0
     c3e:	fd043583          	ld	a1,-48(s0)
     c42:	fd843503          	ld	a0,-40(s0)
     c46:	00000097          	auipc	ra,0x0
     c4a:	a16080e7          	jalr	-1514(ra) # 65c <gettoken>
  cmd = parseline(ps, es);
     c4e:	fd043583          	ld	a1,-48(s0)
     c52:	fd843503          	ld	a0,-40(s0)
     c56:	00000097          	auipc	ra,0x0
     c5a:	d22080e7          	jalr	-734(ra) # 978 <parseline>
     c5e:	fea43423          	sd	a0,-24(s0)
  if(!peek(ps, es, ")"))
     c62:	00001617          	auipc	a2,0x1
     c66:	0e660613          	addi	a2,a2,230 # 1d48 <malloc+0x234>
     c6a:	fd043583          	ld	a1,-48(s0)
     c6e:	fd843503          	ld	a0,-40(s0)
     c72:	00000097          	auipc	ra,0x0
     c76:	bc6080e7          	jalr	-1082(ra) # 838 <peek>
     c7a:	87aa                	mv	a5,a0
     c7c:	eb89                	bnez	a5,c8e <parseblock+0x90>
    panic("syntax - missing )");
     c7e:	00001517          	auipc	a0,0x1
     c82:	0d250513          	addi	a0,a0,210 # 1d50 <malloc+0x23c>
     c86:	fffff097          	auipc	ra,0xfffff
     c8a:	7a4080e7          	jalr	1956(ra) # 42a <panic>
  gettoken(ps, es, 0, 0);
     c8e:	4681                	li	a3,0
     c90:	4601                	li	a2,0
     c92:	fd043583          	ld	a1,-48(s0)
     c96:	fd843503          	ld	a0,-40(s0)
     c9a:	00000097          	auipc	ra,0x0
     c9e:	9c2080e7          	jalr	-1598(ra) # 65c <gettoken>
  cmd = parseredirs(cmd, ps, es);
     ca2:	fd043603          	ld	a2,-48(s0)
     ca6:	fd843583          	ld	a1,-40(s0)
     caa:	fe843503          	ld	a0,-24(s0)
     cae:	00000097          	auipc	ra,0x0
     cb2:	e18080e7          	jalr	-488(ra) # ac6 <parseredirs>
     cb6:	fea43423          	sd	a0,-24(s0)
  return cmd;
     cba:	fe843783          	ld	a5,-24(s0)
}
     cbe:	853e                	mv	a0,a5
     cc0:	70a2                	ld	ra,40(sp)
     cc2:	7402                	ld	s0,32(sp)
     cc4:	6145                	addi	sp,sp,48
     cc6:	8082                	ret

0000000000000cc8 <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
     cc8:	715d                	addi	sp,sp,-80
     cca:	e486                	sd	ra,72(sp)
     ccc:	e0a2                	sd	s0,64(sp)
     cce:	0880                	addi	s0,sp,80
     cd0:	faa43c23          	sd	a0,-72(s0)
     cd4:	fab43823          	sd	a1,-80(s0)
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     cd8:	00001617          	auipc	a2,0x1
     cdc:	05860613          	addi	a2,a2,88 # 1d30 <malloc+0x21c>
     ce0:	fb043583          	ld	a1,-80(s0)
     ce4:	fb843503          	ld	a0,-72(s0)
     ce8:	00000097          	auipc	ra,0x0
     cec:	b50080e7          	jalr	-1200(ra) # 838 <peek>
     cf0:	87aa                	mv	a5,a0
     cf2:	cb99                	beqz	a5,d08 <parseexec+0x40>
    return parseblock(ps, es);
     cf4:	fb043583          	ld	a1,-80(s0)
     cf8:	fb843503          	ld	a0,-72(s0)
     cfc:	00000097          	auipc	ra,0x0
     d00:	f02080e7          	jalr	-254(ra) # bfe <parseblock>
     d04:	87aa                	mv	a5,a0
     d06:	a22d                	j	e30 <parseexec+0x168>

  ret = execcmd();
     d08:	fffff097          	auipc	ra,0xfffff
     d0c:	790080e7          	jalr	1936(ra) # 498 <execcmd>
     d10:	fea43023          	sd	a0,-32(s0)
  cmd = (struct execcmd*)ret;
     d14:	fe043783          	ld	a5,-32(s0)
     d18:	fcf43c23          	sd	a5,-40(s0)

  argc = 0;
     d1c:	fe042623          	sw	zero,-20(s0)
  ret = parseredirs(ret, ps, es);
     d20:	fb043603          	ld	a2,-80(s0)
     d24:	fb843583          	ld	a1,-72(s0)
     d28:	fe043503          	ld	a0,-32(s0)
     d2c:	00000097          	auipc	ra,0x0
     d30:	d9a080e7          	jalr	-614(ra) # ac6 <parseredirs>
     d34:	fea43023          	sd	a0,-32(s0)
  while(!peek(ps, es, "|)&;")){
     d38:	a84d                	j	dea <parseexec+0x122>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     d3a:	fc040713          	addi	a4,s0,-64
     d3e:	fc840793          	addi	a5,s0,-56
     d42:	86ba                	mv	a3,a4
     d44:	863e                	mv	a2,a5
     d46:	fb043583          	ld	a1,-80(s0)
     d4a:	fb843503          	ld	a0,-72(s0)
     d4e:	00000097          	auipc	ra,0x0
     d52:	90e080e7          	jalr	-1778(ra) # 65c <gettoken>
     d56:	87aa                	mv	a5,a0
     d58:	fcf42a23          	sw	a5,-44(s0)
     d5c:	fd442783          	lw	a5,-44(s0)
     d60:	2781                	sext.w	a5,a5
     d62:	c3dd                	beqz	a5,e08 <parseexec+0x140>
      break;
    if(tok != 'a')
     d64:	fd442783          	lw	a5,-44(s0)
     d68:	0007871b          	sext.w	a4,a5
     d6c:	06100793          	li	a5,97
     d70:	00f70a63          	beq	a4,a5,d84 <parseexec+0xbc>
      panic("syntax");
     d74:	00001517          	auipc	a0,0x1
     d78:	f7450513          	addi	a0,a0,-140 # 1ce8 <malloc+0x1d4>
     d7c:	fffff097          	auipc	ra,0xfffff
     d80:	6ae080e7          	jalr	1710(ra) # 42a <panic>
    cmd->argv[argc] = q;
     d84:	fc843703          	ld	a4,-56(s0)
     d88:	fd843683          	ld	a3,-40(s0)
     d8c:	fec42783          	lw	a5,-20(s0)
     d90:	078e                	slli	a5,a5,0x3
     d92:	97b6                	add	a5,a5,a3
     d94:	e798                	sd	a4,8(a5)
    cmd->eargv[argc] = eq;
     d96:	fc043703          	ld	a4,-64(s0)
     d9a:	fd843683          	ld	a3,-40(s0)
     d9e:	fec42783          	lw	a5,-20(s0)
     da2:	07a9                	addi	a5,a5,10
     da4:	078e                	slli	a5,a5,0x3
     da6:	97b6                	add	a5,a5,a3
     da8:	e798                	sd	a4,8(a5)
    argc++;
     daa:	fec42783          	lw	a5,-20(s0)
     dae:	2785                	addiw	a5,a5,1
     db0:	fef42623          	sw	a5,-20(s0)
    if(argc >= MAXARGS)
     db4:	fec42783          	lw	a5,-20(s0)
     db8:	0007871b          	sext.w	a4,a5
     dbc:	47a5                	li	a5,9
     dbe:	00e7da63          	bge	a5,a4,dd2 <parseexec+0x10a>
      panic("too many args");
     dc2:	00001517          	auipc	a0,0x1
     dc6:	fa650513          	addi	a0,a0,-90 # 1d68 <malloc+0x254>
     dca:	fffff097          	auipc	ra,0xfffff
     dce:	660080e7          	jalr	1632(ra) # 42a <panic>
    ret = parseredirs(ret, ps, es);
     dd2:	fb043603          	ld	a2,-80(s0)
     dd6:	fb843583          	ld	a1,-72(s0)
     dda:	fe043503          	ld	a0,-32(s0)
     dde:	00000097          	auipc	ra,0x0
     de2:	ce8080e7          	jalr	-792(ra) # ac6 <parseredirs>
     de6:	fea43023          	sd	a0,-32(s0)
  while(!peek(ps, es, "|)&;")){
     dea:	00001617          	auipc	a2,0x1
     dee:	f8e60613          	addi	a2,a2,-114 # 1d78 <malloc+0x264>
     df2:	fb043583          	ld	a1,-80(s0)
     df6:	fb843503          	ld	a0,-72(s0)
     dfa:	00000097          	auipc	ra,0x0
     dfe:	a3e080e7          	jalr	-1474(ra) # 838 <peek>
     e02:	87aa                	mv	a5,a0
     e04:	db9d                	beqz	a5,d3a <parseexec+0x72>
     e06:	a011                	j	e0a <parseexec+0x142>
      break;
     e08:	0001                	nop
  }
  cmd->argv[argc] = 0;
     e0a:	fd843703          	ld	a4,-40(s0)
     e0e:	fec42783          	lw	a5,-20(s0)
     e12:	078e                	slli	a5,a5,0x3
     e14:	97ba                	add	a5,a5,a4
     e16:	0007b423          	sd	zero,8(a5)
  cmd->eargv[argc] = 0;
     e1a:	fd843703          	ld	a4,-40(s0)
     e1e:	fec42783          	lw	a5,-20(s0)
     e22:	07a9                	addi	a5,a5,10
     e24:	078e                	slli	a5,a5,0x3
     e26:	97ba                	add	a5,a5,a4
     e28:	0007b423          	sd	zero,8(a5)
  return ret;
     e2c:	fe043783          	ld	a5,-32(s0)
}
     e30:	853e                	mv	a0,a5
     e32:	60a6                	ld	ra,72(sp)
     e34:	6406                	ld	s0,64(sp)
     e36:	6161                	addi	sp,sp,80
     e38:	8082                	ret

0000000000000e3a <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     e3a:	715d                	addi	sp,sp,-80
     e3c:	e486                	sd	ra,72(sp)
     e3e:	e0a2                	sd	s0,64(sp)
     e40:	0880                	addi	s0,sp,80
     e42:	faa43c23          	sd	a0,-72(s0)
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     e46:	fb843783          	ld	a5,-72(s0)
     e4a:	e399                	bnez	a5,e50 <nulterminate+0x16>
    return 0;
     e4c:	4781                	li	a5,0
     e4e:	a211                	j	f52 <nulterminate+0x118>

  switch(cmd->type){
     e50:	fb843783          	ld	a5,-72(s0)
     e54:	439c                	lw	a5,0(a5)
     e56:	86be                	mv	a3,a5
     e58:	4715                	li	a4,5
     e5a:	0ed76a63          	bltu	a4,a3,f4e <nulterminate+0x114>
     e5e:	00279713          	slli	a4,a5,0x2
     e62:	00001797          	auipc	a5,0x1
     e66:	f1e78793          	addi	a5,a5,-226 # 1d80 <malloc+0x26c>
     e6a:	97ba                	add	a5,a5,a4
     e6c:	439c                	lw	a5,0(a5)
     e6e:	0007871b          	sext.w	a4,a5
     e72:	00001797          	auipc	a5,0x1
     e76:	f0e78793          	addi	a5,a5,-242 # 1d80 <malloc+0x26c>
     e7a:	97ba                	add	a5,a5,a4
     e7c:	8782                	jr	a5
  case EXEC:
    ecmd = (struct execcmd*)cmd;
     e7e:	fb843783          	ld	a5,-72(s0)
     e82:	fcf43023          	sd	a5,-64(s0)
    for(i=0; ecmd->argv[i]; i++)
     e86:	fe042623          	sw	zero,-20(s0)
     e8a:	a005                	j	eaa <nulterminate+0x70>
      *ecmd->eargv[i] = 0;
     e8c:	fc043703          	ld	a4,-64(s0)
     e90:	fec42783          	lw	a5,-20(s0)
     e94:	07a9                	addi	a5,a5,10
     e96:	078e                	slli	a5,a5,0x3
     e98:	97ba                	add	a5,a5,a4
     e9a:	679c                	ld	a5,8(a5)
     e9c:	00078023          	sb	zero,0(a5)
    for(i=0; ecmd->argv[i]; i++)
     ea0:	fec42783          	lw	a5,-20(s0)
     ea4:	2785                	addiw	a5,a5,1
     ea6:	fef42623          	sw	a5,-20(s0)
     eaa:	fc043703          	ld	a4,-64(s0)
     eae:	fec42783          	lw	a5,-20(s0)
     eb2:	078e                	slli	a5,a5,0x3
     eb4:	97ba                	add	a5,a5,a4
     eb6:	679c                	ld	a5,8(a5)
     eb8:	fbf1                	bnez	a5,e8c <nulterminate+0x52>
    break;
     eba:	a851                	j	f4e <nulterminate+0x114>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
     ebc:	fb843783          	ld	a5,-72(s0)
     ec0:	fcf43423          	sd	a5,-56(s0)
    nulterminate(rcmd->cmd);
     ec4:	fc843783          	ld	a5,-56(s0)
     ec8:	679c                	ld	a5,8(a5)
     eca:	853e                	mv	a0,a5
     ecc:	00000097          	auipc	ra,0x0
     ed0:	f6e080e7          	jalr	-146(ra) # e3a <nulterminate>
    *rcmd->efile = 0;
     ed4:	fc843783          	ld	a5,-56(s0)
     ed8:	6f9c                	ld	a5,24(a5)
     eda:	00078023          	sb	zero,0(a5)
    break;
     ede:	a885                	j	f4e <nulterminate+0x114>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     ee0:	fb843783          	ld	a5,-72(s0)
     ee4:	fcf43823          	sd	a5,-48(s0)
    nulterminate(pcmd->left);
     ee8:	fd043783          	ld	a5,-48(s0)
     eec:	679c                	ld	a5,8(a5)
     eee:	853e                	mv	a0,a5
     ef0:	00000097          	auipc	ra,0x0
     ef4:	f4a080e7          	jalr	-182(ra) # e3a <nulterminate>
    nulterminate(pcmd->right);
     ef8:	fd043783          	ld	a5,-48(s0)
     efc:	6b9c                	ld	a5,16(a5)
     efe:	853e                	mv	a0,a5
     f00:	00000097          	auipc	ra,0x0
     f04:	f3a080e7          	jalr	-198(ra) # e3a <nulterminate>
    break;
     f08:	a099                	j	f4e <nulterminate+0x114>

  case LIST:
    lcmd = (struct listcmd*)cmd;
     f0a:	fb843783          	ld	a5,-72(s0)
     f0e:	fcf43c23          	sd	a5,-40(s0)
    nulterminate(lcmd->left);
     f12:	fd843783          	ld	a5,-40(s0)
     f16:	679c                	ld	a5,8(a5)
     f18:	853e                	mv	a0,a5
     f1a:	00000097          	auipc	ra,0x0
     f1e:	f20080e7          	jalr	-224(ra) # e3a <nulterminate>
    nulterminate(lcmd->right);
     f22:	fd843783          	ld	a5,-40(s0)
     f26:	6b9c                	ld	a5,16(a5)
     f28:	853e                	mv	a0,a5
     f2a:	00000097          	auipc	ra,0x0
     f2e:	f10080e7          	jalr	-240(ra) # e3a <nulterminate>
    break;
     f32:	a831                	j	f4e <nulterminate+0x114>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     f34:	fb843783          	ld	a5,-72(s0)
     f38:	fef43023          	sd	a5,-32(s0)
    nulterminate(bcmd->cmd);
     f3c:	fe043783          	ld	a5,-32(s0)
     f40:	679c                	ld	a5,8(a5)
     f42:	853e                	mv	a0,a5
     f44:	00000097          	auipc	ra,0x0
     f48:	ef6080e7          	jalr	-266(ra) # e3a <nulterminate>
    break;
     f4c:	0001                	nop
  }
  return cmd;
     f4e:	fb843783          	ld	a5,-72(s0)
}
     f52:	853e                	mv	a0,a5
     f54:	60a6                	ld	ra,72(sp)
     f56:	6406                	ld	s0,64(sp)
     f58:	6161                	addi	sp,sp,80
     f5a:	8082                	ret

0000000000000f5c <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     f5c:	7179                	addi	sp,sp,-48
     f5e:	f422                	sd	s0,40(sp)
     f60:	1800                	addi	s0,sp,48
     f62:	fca43c23          	sd	a0,-40(s0)
     f66:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     f6a:	fd843783          	ld	a5,-40(s0)
     f6e:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     f72:	0001                	nop
     f74:	fd043703          	ld	a4,-48(s0)
     f78:	00170793          	addi	a5,a4,1
     f7c:	fcf43823          	sd	a5,-48(s0)
     f80:	fd843783          	ld	a5,-40(s0)
     f84:	00178693          	addi	a3,a5,1
     f88:	fcd43c23          	sd	a3,-40(s0)
     f8c:	00074703          	lbu	a4,0(a4)
     f90:	00e78023          	sb	a4,0(a5)
     f94:	0007c783          	lbu	a5,0(a5)
     f98:	fff1                	bnez	a5,f74 <strcpy+0x18>
    ;
  return os;
     f9a:	fe843783          	ld	a5,-24(s0)
}
     f9e:	853e                	mv	a0,a5
     fa0:	7422                	ld	s0,40(sp)
     fa2:	6145                	addi	sp,sp,48
     fa4:	8082                	ret

0000000000000fa6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     fa6:	1101                	addi	sp,sp,-32
     fa8:	ec22                	sd	s0,24(sp)
     faa:	1000                	addi	s0,sp,32
     fac:	fea43423          	sd	a0,-24(s0)
     fb0:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     fb4:	a819                	j	fca <strcmp+0x24>
    p++, q++;
     fb6:	fe843783          	ld	a5,-24(s0)
     fba:	0785                	addi	a5,a5,1
     fbc:	fef43423          	sd	a5,-24(s0)
     fc0:	fe043783          	ld	a5,-32(s0)
     fc4:	0785                	addi	a5,a5,1
     fc6:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     fca:	fe843783          	ld	a5,-24(s0)
     fce:	0007c783          	lbu	a5,0(a5)
     fd2:	cb99                	beqz	a5,fe8 <strcmp+0x42>
     fd4:	fe843783          	ld	a5,-24(s0)
     fd8:	0007c703          	lbu	a4,0(a5)
     fdc:	fe043783          	ld	a5,-32(s0)
     fe0:	0007c783          	lbu	a5,0(a5)
     fe4:	fcf709e3          	beq	a4,a5,fb6 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     fe8:	fe843783          	ld	a5,-24(s0)
     fec:	0007c783          	lbu	a5,0(a5)
     ff0:	0007871b          	sext.w	a4,a5
     ff4:	fe043783          	ld	a5,-32(s0)
     ff8:	0007c783          	lbu	a5,0(a5)
     ffc:	2781                	sext.w	a5,a5
     ffe:	40f707bb          	subw	a5,a4,a5
    1002:	2781                	sext.w	a5,a5
}
    1004:	853e                	mv	a0,a5
    1006:	6462                	ld	s0,24(sp)
    1008:	6105                	addi	sp,sp,32
    100a:	8082                	ret

000000000000100c <strlen>:

uint
strlen(const char *s)
{
    100c:	7179                	addi	sp,sp,-48
    100e:	f422                	sd	s0,40(sp)
    1010:	1800                	addi	s0,sp,48
    1012:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    1016:	fe042623          	sw	zero,-20(s0)
    101a:	a031                	j	1026 <strlen+0x1a>
    101c:	fec42783          	lw	a5,-20(s0)
    1020:	2785                	addiw	a5,a5,1
    1022:	fef42623          	sw	a5,-20(s0)
    1026:	fec42783          	lw	a5,-20(s0)
    102a:	fd843703          	ld	a4,-40(s0)
    102e:	97ba                	add	a5,a5,a4
    1030:	0007c783          	lbu	a5,0(a5)
    1034:	f7e5                	bnez	a5,101c <strlen+0x10>
    ;
  return n;
    1036:	fec42783          	lw	a5,-20(s0)
}
    103a:	853e                	mv	a0,a5
    103c:	7422                	ld	s0,40(sp)
    103e:	6145                	addi	sp,sp,48
    1040:	8082                	ret

0000000000001042 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1042:	7179                	addi	sp,sp,-48
    1044:	f422                	sd	s0,40(sp)
    1046:	1800                	addi	s0,sp,48
    1048:	fca43c23          	sd	a0,-40(s0)
    104c:	87ae                	mv	a5,a1
    104e:	8732                	mv	a4,a2
    1050:	fcf42a23          	sw	a5,-44(s0)
    1054:	87ba                	mv	a5,a4
    1056:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    105a:	fd843783          	ld	a5,-40(s0)
    105e:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    1062:	fe042623          	sw	zero,-20(s0)
    1066:	a00d                	j	1088 <memset+0x46>
    cdst[i] = c;
    1068:	fec42783          	lw	a5,-20(s0)
    106c:	fe043703          	ld	a4,-32(s0)
    1070:	97ba                	add	a5,a5,a4
    1072:	fd442703          	lw	a4,-44(s0)
    1076:	0ff77713          	andi	a4,a4,255
    107a:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    107e:	fec42783          	lw	a5,-20(s0)
    1082:	2785                	addiw	a5,a5,1
    1084:	fef42623          	sw	a5,-20(s0)
    1088:	fec42703          	lw	a4,-20(s0)
    108c:	fd042783          	lw	a5,-48(s0)
    1090:	2781                	sext.w	a5,a5
    1092:	fcf76be3          	bltu	a4,a5,1068 <memset+0x26>
  }
  return dst;
    1096:	fd843783          	ld	a5,-40(s0)
}
    109a:	853e                	mv	a0,a5
    109c:	7422                	ld	s0,40(sp)
    109e:	6145                	addi	sp,sp,48
    10a0:	8082                	ret

00000000000010a2 <strchr>:

char*
strchr(const char *s, char c)
{
    10a2:	1101                	addi	sp,sp,-32
    10a4:	ec22                	sd	s0,24(sp)
    10a6:	1000                	addi	s0,sp,32
    10a8:	fea43423          	sd	a0,-24(s0)
    10ac:	87ae                	mv	a5,a1
    10ae:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
    10b2:	a01d                	j	10d8 <strchr+0x36>
    if(*s == c)
    10b4:	fe843783          	ld	a5,-24(s0)
    10b8:	0007c703          	lbu	a4,0(a5)
    10bc:	fe744783          	lbu	a5,-25(s0)
    10c0:	0ff7f793          	andi	a5,a5,255
    10c4:	00e79563          	bne	a5,a4,10ce <strchr+0x2c>
      return (char*)s;
    10c8:	fe843783          	ld	a5,-24(s0)
    10cc:	a821                	j	10e4 <strchr+0x42>
  for(; *s; s++)
    10ce:	fe843783          	ld	a5,-24(s0)
    10d2:	0785                	addi	a5,a5,1
    10d4:	fef43423          	sd	a5,-24(s0)
    10d8:	fe843783          	ld	a5,-24(s0)
    10dc:	0007c783          	lbu	a5,0(a5)
    10e0:	fbf1                	bnez	a5,10b4 <strchr+0x12>
  return 0;
    10e2:	4781                	li	a5,0
}
    10e4:	853e                	mv	a0,a5
    10e6:	6462                	ld	s0,24(sp)
    10e8:	6105                	addi	sp,sp,32
    10ea:	8082                	ret

00000000000010ec <gets>:

char*
gets(char *buf, int max)
{
    10ec:	7179                	addi	sp,sp,-48
    10ee:	f406                	sd	ra,40(sp)
    10f0:	f022                	sd	s0,32(sp)
    10f2:	1800                	addi	s0,sp,48
    10f4:	fca43c23          	sd	a0,-40(s0)
    10f8:	87ae                	mv	a5,a1
    10fa:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    10fe:	fe042623          	sw	zero,-20(s0)
    1102:	a8a1                	j	115a <gets+0x6e>
    cc = read(0, &c, 1);
    1104:	fe740793          	addi	a5,s0,-25
    1108:	4605                	li	a2,1
    110a:	85be                	mv	a1,a5
    110c:	4501                	li	a0,0
    110e:	00000097          	auipc	ra,0x0
    1112:	2f6080e7          	jalr	758(ra) # 1404 <read>
    1116:	87aa                	mv	a5,a0
    1118:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
    111c:	fe842783          	lw	a5,-24(s0)
    1120:	2781                	sext.w	a5,a5
    1122:	04f05763          	blez	a5,1170 <gets+0x84>
      break;
    buf[i++] = c;
    1126:	fec42783          	lw	a5,-20(s0)
    112a:	0017871b          	addiw	a4,a5,1
    112e:	fee42623          	sw	a4,-20(s0)
    1132:	873e                	mv	a4,a5
    1134:	fd843783          	ld	a5,-40(s0)
    1138:	97ba                	add	a5,a5,a4
    113a:	fe744703          	lbu	a4,-25(s0)
    113e:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
    1142:	fe744783          	lbu	a5,-25(s0)
    1146:	873e                	mv	a4,a5
    1148:	47a9                	li	a5,10
    114a:	02f70463          	beq	a4,a5,1172 <gets+0x86>
    114e:	fe744783          	lbu	a5,-25(s0)
    1152:	873e                	mv	a4,a5
    1154:	47b5                	li	a5,13
    1156:	00f70e63          	beq	a4,a5,1172 <gets+0x86>
  for(i=0; i+1 < max; ){
    115a:	fec42783          	lw	a5,-20(s0)
    115e:	2785                	addiw	a5,a5,1
    1160:	0007871b          	sext.w	a4,a5
    1164:	fd442783          	lw	a5,-44(s0)
    1168:	2781                	sext.w	a5,a5
    116a:	f8f74de3          	blt	a4,a5,1104 <gets+0x18>
    116e:	a011                	j	1172 <gets+0x86>
      break;
    1170:	0001                	nop
      break;
  }
  buf[i] = '\0';
    1172:	fec42783          	lw	a5,-20(s0)
    1176:	fd843703          	ld	a4,-40(s0)
    117a:	97ba                	add	a5,a5,a4
    117c:	00078023          	sb	zero,0(a5)
  return buf;
    1180:	fd843783          	ld	a5,-40(s0)
}
    1184:	853e                	mv	a0,a5
    1186:	70a2                	ld	ra,40(sp)
    1188:	7402                	ld	s0,32(sp)
    118a:	6145                	addi	sp,sp,48
    118c:	8082                	ret

000000000000118e <stat>:

int
stat(const char *n, struct stat *st)
{
    118e:	7179                	addi	sp,sp,-48
    1190:	f406                	sd	ra,40(sp)
    1192:	f022                	sd	s0,32(sp)
    1194:	1800                	addi	s0,sp,48
    1196:	fca43c23          	sd	a0,-40(s0)
    119a:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    119e:	4581                	li	a1,0
    11a0:	fd843503          	ld	a0,-40(s0)
    11a4:	00000097          	auipc	ra,0x0
    11a8:	288080e7          	jalr	648(ra) # 142c <open>
    11ac:	87aa                	mv	a5,a0
    11ae:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
    11b2:	fec42783          	lw	a5,-20(s0)
    11b6:	2781                	sext.w	a5,a5
    11b8:	0007d463          	bgez	a5,11c0 <stat+0x32>
    return -1;
    11bc:	57fd                	li	a5,-1
    11be:	a035                	j	11ea <stat+0x5c>
  r = fstat(fd, st);
    11c0:	fec42783          	lw	a5,-20(s0)
    11c4:	fd043583          	ld	a1,-48(s0)
    11c8:	853e                	mv	a0,a5
    11ca:	00000097          	auipc	ra,0x0
    11ce:	27a080e7          	jalr	634(ra) # 1444 <fstat>
    11d2:	87aa                	mv	a5,a0
    11d4:	fef42423          	sw	a5,-24(s0)
  close(fd);
    11d8:	fec42783          	lw	a5,-20(s0)
    11dc:	853e                	mv	a0,a5
    11de:	00000097          	auipc	ra,0x0
    11e2:	236080e7          	jalr	566(ra) # 1414 <close>
  return r;
    11e6:	fe842783          	lw	a5,-24(s0)
}
    11ea:	853e                	mv	a0,a5
    11ec:	70a2                	ld	ra,40(sp)
    11ee:	7402                	ld	s0,32(sp)
    11f0:	6145                	addi	sp,sp,48
    11f2:	8082                	ret

00000000000011f4 <atoi>:

int
atoi(const char *s)
{
    11f4:	7179                	addi	sp,sp,-48
    11f6:	f422                	sd	s0,40(sp)
    11f8:	1800                	addi	s0,sp,48
    11fa:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
    11fe:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
    1202:	a815                	j	1236 <atoi+0x42>
    n = n*10 + *s++ - '0';
    1204:	fec42703          	lw	a4,-20(s0)
    1208:	87ba                	mv	a5,a4
    120a:	0027979b          	slliw	a5,a5,0x2
    120e:	9fb9                	addw	a5,a5,a4
    1210:	0017979b          	slliw	a5,a5,0x1
    1214:	0007871b          	sext.w	a4,a5
    1218:	fd843783          	ld	a5,-40(s0)
    121c:	00178693          	addi	a3,a5,1
    1220:	fcd43c23          	sd	a3,-40(s0)
    1224:	0007c783          	lbu	a5,0(a5)
    1228:	2781                	sext.w	a5,a5
    122a:	9fb9                	addw	a5,a5,a4
    122c:	2781                	sext.w	a5,a5
    122e:	fd07879b          	addiw	a5,a5,-48
    1232:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
    1236:	fd843783          	ld	a5,-40(s0)
    123a:	0007c783          	lbu	a5,0(a5)
    123e:	873e                	mv	a4,a5
    1240:	02f00793          	li	a5,47
    1244:	00e7fb63          	bgeu	a5,a4,125a <atoi+0x66>
    1248:	fd843783          	ld	a5,-40(s0)
    124c:	0007c783          	lbu	a5,0(a5)
    1250:	873e                	mv	a4,a5
    1252:	03900793          	li	a5,57
    1256:	fae7f7e3          	bgeu	a5,a4,1204 <atoi+0x10>
  return n;
    125a:	fec42783          	lw	a5,-20(s0)
}
    125e:	853e                	mv	a0,a5
    1260:	7422                	ld	s0,40(sp)
    1262:	6145                	addi	sp,sp,48
    1264:	8082                	ret

0000000000001266 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1266:	7139                	addi	sp,sp,-64
    1268:	fc22                	sd	s0,56(sp)
    126a:	0080                	addi	s0,sp,64
    126c:	fca43c23          	sd	a0,-40(s0)
    1270:	fcb43823          	sd	a1,-48(s0)
    1274:	87b2                	mv	a5,a2
    1276:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
    127a:	fd843783          	ld	a5,-40(s0)
    127e:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
    1282:	fd043783          	ld	a5,-48(s0)
    1286:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
    128a:	fe043703          	ld	a4,-32(s0)
    128e:	fe843783          	ld	a5,-24(s0)
    1292:	02e7fc63          	bgeu	a5,a4,12ca <memmove+0x64>
    while(n-- > 0)
    1296:	a00d                	j	12b8 <memmove+0x52>
      *dst++ = *src++;
    1298:	fe043703          	ld	a4,-32(s0)
    129c:	00170793          	addi	a5,a4,1
    12a0:	fef43023          	sd	a5,-32(s0)
    12a4:	fe843783          	ld	a5,-24(s0)
    12a8:	00178693          	addi	a3,a5,1
    12ac:	fed43423          	sd	a3,-24(s0)
    12b0:	00074703          	lbu	a4,0(a4)
    12b4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    12b8:	fcc42783          	lw	a5,-52(s0)
    12bc:	fff7871b          	addiw	a4,a5,-1
    12c0:	fce42623          	sw	a4,-52(s0)
    12c4:	fcf04ae3          	bgtz	a5,1298 <memmove+0x32>
    12c8:	a891                	j	131c <memmove+0xb6>
  } else {
    dst += n;
    12ca:	fcc42783          	lw	a5,-52(s0)
    12ce:	fe843703          	ld	a4,-24(s0)
    12d2:	97ba                	add	a5,a5,a4
    12d4:	fef43423          	sd	a5,-24(s0)
    src += n;
    12d8:	fcc42783          	lw	a5,-52(s0)
    12dc:	fe043703          	ld	a4,-32(s0)
    12e0:	97ba                	add	a5,a5,a4
    12e2:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    12e6:	a01d                	j	130c <memmove+0xa6>
      *--dst = *--src;
    12e8:	fe043783          	ld	a5,-32(s0)
    12ec:	17fd                	addi	a5,a5,-1
    12ee:	fef43023          	sd	a5,-32(s0)
    12f2:	fe843783          	ld	a5,-24(s0)
    12f6:	17fd                	addi	a5,a5,-1
    12f8:	fef43423          	sd	a5,-24(s0)
    12fc:	fe043783          	ld	a5,-32(s0)
    1300:	0007c703          	lbu	a4,0(a5)
    1304:	fe843783          	ld	a5,-24(s0)
    1308:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    130c:	fcc42783          	lw	a5,-52(s0)
    1310:	fff7871b          	addiw	a4,a5,-1
    1314:	fce42623          	sw	a4,-52(s0)
    1318:	fcf048e3          	bgtz	a5,12e8 <memmove+0x82>
  }
  return vdst;
    131c:	fd843783          	ld	a5,-40(s0)
}
    1320:	853e                	mv	a0,a5
    1322:	7462                	ld	s0,56(sp)
    1324:	6121                	addi	sp,sp,64
    1326:	8082                	ret

0000000000001328 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    1328:	7139                	addi	sp,sp,-64
    132a:	fc22                	sd	s0,56(sp)
    132c:	0080                	addi	s0,sp,64
    132e:	fca43c23          	sd	a0,-40(s0)
    1332:	fcb43823          	sd	a1,-48(s0)
    1336:	87b2                	mv	a5,a2
    1338:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
    133c:	fd843783          	ld	a5,-40(s0)
    1340:	fef43423          	sd	a5,-24(s0)
    1344:	fd043783          	ld	a5,-48(s0)
    1348:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    134c:	a0a1                	j	1394 <memcmp+0x6c>
    if (*p1 != *p2) {
    134e:	fe843783          	ld	a5,-24(s0)
    1352:	0007c703          	lbu	a4,0(a5)
    1356:	fe043783          	ld	a5,-32(s0)
    135a:	0007c783          	lbu	a5,0(a5)
    135e:	02f70163          	beq	a4,a5,1380 <memcmp+0x58>
      return *p1 - *p2;
    1362:	fe843783          	ld	a5,-24(s0)
    1366:	0007c783          	lbu	a5,0(a5)
    136a:	0007871b          	sext.w	a4,a5
    136e:	fe043783          	ld	a5,-32(s0)
    1372:	0007c783          	lbu	a5,0(a5)
    1376:	2781                	sext.w	a5,a5
    1378:	40f707bb          	subw	a5,a4,a5
    137c:	2781                	sext.w	a5,a5
    137e:	a01d                	j	13a4 <memcmp+0x7c>
    }
    p1++;
    1380:	fe843783          	ld	a5,-24(s0)
    1384:	0785                	addi	a5,a5,1
    1386:	fef43423          	sd	a5,-24(s0)
    p2++;
    138a:	fe043783          	ld	a5,-32(s0)
    138e:	0785                	addi	a5,a5,1
    1390:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    1394:	fcc42783          	lw	a5,-52(s0)
    1398:	fff7871b          	addiw	a4,a5,-1
    139c:	fce42623          	sw	a4,-52(s0)
    13a0:	f7dd                	bnez	a5,134e <memcmp+0x26>
  }
  return 0;
    13a2:	4781                	li	a5,0
}
    13a4:	853e                	mv	a0,a5
    13a6:	7462                	ld	s0,56(sp)
    13a8:	6121                	addi	sp,sp,64
    13aa:	8082                	ret

00000000000013ac <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    13ac:	7179                	addi	sp,sp,-48
    13ae:	f406                	sd	ra,40(sp)
    13b0:	f022                	sd	s0,32(sp)
    13b2:	1800                	addi	s0,sp,48
    13b4:	fea43423          	sd	a0,-24(s0)
    13b8:	feb43023          	sd	a1,-32(s0)
    13bc:	87b2                	mv	a5,a2
    13be:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    13c2:	fdc42783          	lw	a5,-36(s0)
    13c6:	863e                	mv	a2,a5
    13c8:	fe043583          	ld	a1,-32(s0)
    13cc:	fe843503          	ld	a0,-24(s0)
    13d0:	00000097          	auipc	ra,0x0
    13d4:	e96080e7          	jalr	-362(ra) # 1266 <memmove>
    13d8:	87aa                	mv	a5,a0
}
    13da:	853e                	mv	a0,a5
    13dc:	70a2                	ld	ra,40(sp)
    13de:	7402                	ld	s0,32(sp)
    13e0:	6145                	addi	sp,sp,48
    13e2:	8082                	ret

00000000000013e4 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
    13e4:	4885                	li	a7,1
 ecall
    13e6:	00000073          	ecall
 ret
    13ea:	8082                	ret

00000000000013ec <exit>:
.global exit
exit:
 li a7, SYS_exit
    13ec:	4889                	li	a7,2
 ecall
    13ee:	00000073          	ecall
 ret
    13f2:	8082                	ret

00000000000013f4 <wait>:
.global wait
wait:
 li a7, SYS_wait
    13f4:	488d                	li	a7,3
 ecall
    13f6:	00000073          	ecall
 ret
    13fa:	8082                	ret

00000000000013fc <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    13fc:	4891                	li	a7,4
 ecall
    13fe:	00000073          	ecall
 ret
    1402:	8082                	ret

0000000000001404 <read>:
.global read
read:
 li a7, SYS_read
    1404:	4895                	li	a7,5
 ecall
    1406:	00000073          	ecall
 ret
    140a:	8082                	ret

000000000000140c <write>:
.global write
write:
 li a7, SYS_write
    140c:	48c1                	li	a7,16
 ecall
    140e:	00000073          	ecall
 ret
    1412:	8082                	ret

0000000000001414 <close>:
.global close
close:
 li a7, SYS_close
    1414:	48d5                	li	a7,21
 ecall
    1416:	00000073          	ecall
 ret
    141a:	8082                	ret

000000000000141c <kill>:
.global kill
kill:
 li a7, SYS_kill
    141c:	4899                	li	a7,6
 ecall
    141e:	00000073          	ecall
 ret
    1422:	8082                	ret

0000000000001424 <exec>:
.global exec
exec:
 li a7, SYS_exec
    1424:	489d                	li	a7,7
 ecall
    1426:	00000073          	ecall
 ret
    142a:	8082                	ret

000000000000142c <open>:
.global open
open:
 li a7, SYS_open
    142c:	48bd                	li	a7,15
 ecall
    142e:	00000073          	ecall
 ret
    1432:	8082                	ret

0000000000001434 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
    1434:	48c5                	li	a7,17
 ecall
    1436:	00000073          	ecall
 ret
    143a:	8082                	ret

000000000000143c <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
    143c:	48c9                	li	a7,18
 ecall
    143e:	00000073          	ecall
 ret
    1442:	8082                	ret

0000000000001444 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    1444:	48a1                	li	a7,8
 ecall
    1446:	00000073          	ecall
 ret
    144a:	8082                	ret

000000000000144c <link>:
.global link
link:
 li a7, SYS_link
    144c:	48cd                	li	a7,19
 ecall
    144e:	00000073          	ecall
 ret
    1452:	8082                	ret

0000000000001454 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    1454:	48d1                	li	a7,20
 ecall
    1456:	00000073          	ecall
 ret
    145a:	8082                	ret

000000000000145c <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    145c:	48a5                	li	a7,9
 ecall
    145e:	00000073          	ecall
 ret
    1462:	8082                	ret

0000000000001464 <dup>:
.global dup
dup:
 li a7, SYS_dup
    1464:	48a9                	li	a7,10
 ecall
    1466:	00000073          	ecall
 ret
    146a:	8082                	ret

000000000000146c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    146c:	48ad                	li	a7,11
 ecall
    146e:	00000073          	ecall
 ret
    1472:	8082                	ret

0000000000001474 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
    1474:	48b1                	li	a7,12
 ecall
    1476:	00000073          	ecall
 ret
    147a:	8082                	ret

000000000000147c <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
    147c:	48b5                	li	a7,13
 ecall
    147e:	00000073          	ecall
 ret
    1482:	8082                	ret

0000000000001484 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    1484:	48b9                	li	a7,14
 ecall
    1486:	00000073          	ecall
 ret
    148a:	8082                	ret

000000000000148c <setSchedAlg>:
.global setSchedAlg
setSchedAlg:
 li a7, SYS_setSchedAlg
    148c:	48d9                	li	a7,22
 ecall
    148e:	00000073          	ecall
 ret
    1492:	8082                	ret

0000000000001494 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
    1494:	1101                	addi	sp,sp,-32
    1496:	ec06                	sd	ra,24(sp)
    1498:	e822                	sd	s0,16(sp)
    149a:	1000                	addi	s0,sp,32
    149c:	87aa                	mv	a5,a0
    149e:	872e                	mv	a4,a1
    14a0:	fef42623          	sw	a5,-20(s0)
    14a4:	87ba                	mv	a5,a4
    14a6:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
    14aa:	feb40713          	addi	a4,s0,-21
    14ae:	fec42783          	lw	a5,-20(s0)
    14b2:	4605                	li	a2,1
    14b4:	85ba                	mv	a1,a4
    14b6:	853e                	mv	a0,a5
    14b8:	00000097          	auipc	ra,0x0
    14bc:	f54080e7          	jalr	-172(ra) # 140c <write>
}
    14c0:	0001                	nop
    14c2:	60e2                	ld	ra,24(sp)
    14c4:	6442                	ld	s0,16(sp)
    14c6:	6105                	addi	sp,sp,32
    14c8:	8082                	ret

00000000000014ca <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    14ca:	7139                	addi	sp,sp,-64
    14cc:	fc06                	sd	ra,56(sp)
    14ce:	f822                	sd	s0,48(sp)
    14d0:	0080                	addi	s0,sp,64
    14d2:	87aa                	mv	a5,a0
    14d4:	8736                	mv	a4,a3
    14d6:	fcf42623          	sw	a5,-52(s0)
    14da:	87ae                	mv	a5,a1
    14dc:	fcf42423          	sw	a5,-56(s0)
    14e0:	87b2                	mv	a5,a2
    14e2:	fcf42223          	sw	a5,-60(s0)
    14e6:	87ba                	mv	a5,a4
    14e8:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    14ec:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
    14f0:	fc042783          	lw	a5,-64(s0)
    14f4:	2781                	sext.w	a5,a5
    14f6:	c38d                	beqz	a5,1518 <printint+0x4e>
    14f8:	fc842783          	lw	a5,-56(s0)
    14fc:	2781                	sext.w	a5,a5
    14fe:	0007dd63          	bgez	a5,1518 <printint+0x4e>
    neg = 1;
    1502:	4785                	li	a5,1
    1504:	fef42423          	sw	a5,-24(s0)
    x = -xx;
    1508:	fc842783          	lw	a5,-56(s0)
    150c:	40f007bb          	negw	a5,a5
    1510:	2781                	sext.w	a5,a5
    1512:	fef42223          	sw	a5,-28(s0)
    1516:	a029                	j	1520 <printint+0x56>
  } else {
    x = xx;
    1518:	fc842783          	lw	a5,-56(s0)
    151c:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
    1520:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
    1524:	fc442783          	lw	a5,-60(s0)
    1528:	fe442703          	lw	a4,-28(s0)
    152c:	02f777bb          	remuw	a5,a4,a5
    1530:	0007861b          	sext.w	a2,a5
    1534:	fec42783          	lw	a5,-20(s0)
    1538:	0017871b          	addiw	a4,a5,1
    153c:	fee42623          	sw	a4,-20(s0)
    1540:	00001697          	auipc	a3,0x1
    1544:	86068693          	addi	a3,a3,-1952 # 1da0 <digits>
    1548:	02061713          	slli	a4,a2,0x20
    154c:	9301                	srli	a4,a4,0x20
    154e:	9736                	add	a4,a4,a3
    1550:	00074703          	lbu	a4,0(a4)
    1554:	ff040693          	addi	a3,s0,-16
    1558:	97b6                	add	a5,a5,a3
    155a:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
    155e:	fc442783          	lw	a5,-60(s0)
    1562:	fe442703          	lw	a4,-28(s0)
    1566:	02f757bb          	divuw	a5,a4,a5
    156a:	fef42223          	sw	a5,-28(s0)
    156e:	fe442783          	lw	a5,-28(s0)
    1572:	2781                	sext.w	a5,a5
    1574:	fbc5                	bnez	a5,1524 <printint+0x5a>
  if(neg)
    1576:	fe842783          	lw	a5,-24(s0)
    157a:	2781                	sext.w	a5,a5
    157c:	cf95                	beqz	a5,15b8 <printint+0xee>
    buf[i++] = '-';
    157e:	fec42783          	lw	a5,-20(s0)
    1582:	0017871b          	addiw	a4,a5,1
    1586:	fee42623          	sw	a4,-20(s0)
    158a:	ff040713          	addi	a4,s0,-16
    158e:	97ba                	add	a5,a5,a4
    1590:	02d00713          	li	a4,45
    1594:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
    1598:	a005                	j	15b8 <printint+0xee>
    putc(fd, buf[i]);
    159a:	fec42783          	lw	a5,-20(s0)
    159e:	ff040713          	addi	a4,s0,-16
    15a2:	97ba                	add	a5,a5,a4
    15a4:	fe07c703          	lbu	a4,-32(a5)
    15a8:	fcc42783          	lw	a5,-52(s0)
    15ac:	85ba                	mv	a1,a4
    15ae:	853e                	mv	a0,a5
    15b0:	00000097          	auipc	ra,0x0
    15b4:	ee4080e7          	jalr	-284(ra) # 1494 <putc>
  while(--i >= 0)
    15b8:	fec42783          	lw	a5,-20(s0)
    15bc:	37fd                	addiw	a5,a5,-1
    15be:	fef42623          	sw	a5,-20(s0)
    15c2:	fec42783          	lw	a5,-20(s0)
    15c6:	2781                	sext.w	a5,a5
    15c8:	fc07d9e3          	bgez	a5,159a <printint+0xd0>
}
    15cc:	0001                	nop
    15ce:	0001                	nop
    15d0:	70e2                	ld	ra,56(sp)
    15d2:	7442                	ld	s0,48(sp)
    15d4:	6121                	addi	sp,sp,64
    15d6:	8082                	ret

00000000000015d8 <printptr>:

static void
printptr(int fd, uint64 x) {
    15d8:	7179                	addi	sp,sp,-48
    15da:	f406                	sd	ra,40(sp)
    15dc:	f022                	sd	s0,32(sp)
    15de:	1800                	addi	s0,sp,48
    15e0:	87aa                	mv	a5,a0
    15e2:	fcb43823          	sd	a1,-48(s0)
    15e6:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
    15ea:	fdc42783          	lw	a5,-36(s0)
    15ee:	03000593          	li	a1,48
    15f2:	853e                	mv	a0,a5
    15f4:	00000097          	auipc	ra,0x0
    15f8:	ea0080e7          	jalr	-352(ra) # 1494 <putc>
  putc(fd, 'x');
    15fc:	fdc42783          	lw	a5,-36(s0)
    1600:	07800593          	li	a1,120
    1604:	853e                	mv	a0,a5
    1606:	00000097          	auipc	ra,0x0
    160a:	e8e080e7          	jalr	-370(ra) # 1494 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    160e:	fe042623          	sw	zero,-20(s0)
    1612:	a82d                	j	164c <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    1614:	fd043783          	ld	a5,-48(s0)
    1618:	93f1                	srli	a5,a5,0x3c
    161a:	00000717          	auipc	a4,0x0
    161e:	78670713          	addi	a4,a4,1926 # 1da0 <digits>
    1622:	97ba                	add	a5,a5,a4
    1624:	0007c703          	lbu	a4,0(a5)
    1628:	fdc42783          	lw	a5,-36(s0)
    162c:	85ba                	mv	a1,a4
    162e:	853e                	mv	a0,a5
    1630:	00000097          	auipc	ra,0x0
    1634:	e64080e7          	jalr	-412(ra) # 1494 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    1638:	fec42783          	lw	a5,-20(s0)
    163c:	2785                	addiw	a5,a5,1
    163e:	fef42623          	sw	a5,-20(s0)
    1642:	fd043783          	ld	a5,-48(s0)
    1646:	0792                	slli	a5,a5,0x4
    1648:	fcf43823          	sd	a5,-48(s0)
    164c:	fec42783          	lw	a5,-20(s0)
    1650:	873e                	mv	a4,a5
    1652:	47bd                	li	a5,15
    1654:	fce7f0e3          	bgeu	a5,a4,1614 <printptr+0x3c>
}
    1658:	0001                	nop
    165a:	0001                	nop
    165c:	70a2                	ld	ra,40(sp)
    165e:	7402                	ld	s0,32(sp)
    1660:	6145                	addi	sp,sp,48
    1662:	8082                	ret

0000000000001664 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    1664:	715d                	addi	sp,sp,-80
    1666:	e486                	sd	ra,72(sp)
    1668:	e0a2                	sd	s0,64(sp)
    166a:	0880                	addi	s0,sp,80
    166c:	87aa                	mv	a5,a0
    166e:	fcb43023          	sd	a1,-64(s0)
    1672:	fac43c23          	sd	a2,-72(s0)
    1676:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
    167a:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    167e:	fe042223          	sw	zero,-28(s0)
    1682:	a42d                	j	18ac <vprintf+0x248>
    c = fmt[i] & 0xff;
    1684:	fe442783          	lw	a5,-28(s0)
    1688:	fc043703          	ld	a4,-64(s0)
    168c:	97ba                	add	a5,a5,a4
    168e:	0007c783          	lbu	a5,0(a5)
    1692:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
    1696:	fe042783          	lw	a5,-32(s0)
    169a:	2781                	sext.w	a5,a5
    169c:	eb9d                	bnez	a5,16d2 <vprintf+0x6e>
      if(c == '%'){
    169e:	fdc42783          	lw	a5,-36(s0)
    16a2:	0007871b          	sext.w	a4,a5
    16a6:	02500793          	li	a5,37
    16aa:	00f71763          	bne	a4,a5,16b8 <vprintf+0x54>
        state = '%';
    16ae:	02500793          	li	a5,37
    16b2:	fef42023          	sw	a5,-32(s0)
    16b6:	a2f5                	j	18a2 <vprintf+0x23e>
      } else {
        putc(fd, c);
    16b8:	fdc42783          	lw	a5,-36(s0)
    16bc:	0ff7f713          	andi	a4,a5,255
    16c0:	fcc42783          	lw	a5,-52(s0)
    16c4:	85ba                	mv	a1,a4
    16c6:	853e                	mv	a0,a5
    16c8:	00000097          	auipc	ra,0x0
    16cc:	dcc080e7          	jalr	-564(ra) # 1494 <putc>
    16d0:	aac9                	j	18a2 <vprintf+0x23e>
      }
    } else if(state == '%'){
    16d2:	fe042783          	lw	a5,-32(s0)
    16d6:	0007871b          	sext.w	a4,a5
    16da:	02500793          	li	a5,37
    16de:	1cf71263          	bne	a4,a5,18a2 <vprintf+0x23e>
      if(c == 'd'){
    16e2:	fdc42783          	lw	a5,-36(s0)
    16e6:	0007871b          	sext.w	a4,a5
    16ea:	06400793          	li	a5,100
    16ee:	02f71463          	bne	a4,a5,1716 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
    16f2:	fb843783          	ld	a5,-72(s0)
    16f6:	00878713          	addi	a4,a5,8
    16fa:	fae43c23          	sd	a4,-72(s0)
    16fe:	4398                	lw	a4,0(a5)
    1700:	fcc42783          	lw	a5,-52(s0)
    1704:	4685                	li	a3,1
    1706:	4629                	li	a2,10
    1708:	85ba                	mv	a1,a4
    170a:	853e                	mv	a0,a5
    170c:	00000097          	auipc	ra,0x0
    1710:	dbe080e7          	jalr	-578(ra) # 14ca <printint>
    1714:	a269                	j	189e <vprintf+0x23a>
      } else if(c == 'l') {
    1716:	fdc42783          	lw	a5,-36(s0)
    171a:	0007871b          	sext.w	a4,a5
    171e:	06c00793          	li	a5,108
    1722:	02f71663          	bne	a4,a5,174e <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
    1726:	fb843783          	ld	a5,-72(s0)
    172a:	00878713          	addi	a4,a5,8
    172e:	fae43c23          	sd	a4,-72(s0)
    1732:	639c                	ld	a5,0(a5)
    1734:	0007871b          	sext.w	a4,a5
    1738:	fcc42783          	lw	a5,-52(s0)
    173c:	4681                	li	a3,0
    173e:	4629                	li	a2,10
    1740:	85ba                	mv	a1,a4
    1742:	853e                	mv	a0,a5
    1744:	00000097          	auipc	ra,0x0
    1748:	d86080e7          	jalr	-634(ra) # 14ca <printint>
    174c:	aa89                	j	189e <vprintf+0x23a>
      } else if(c == 'x') {
    174e:	fdc42783          	lw	a5,-36(s0)
    1752:	0007871b          	sext.w	a4,a5
    1756:	07800793          	li	a5,120
    175a:	02f71463          	bne	a4,a5,1782 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
    175e:	fb843783          	ld	a5,-72(s0)
    1762:	00878713          	addi	a4,a5,8
    1766:	fae43c23          	sd	a4,-72(s0)
    176a:	4398                	lw	a4,0(a5)
    176c:	fcc42783          	lw	a5,-52(s0)
    1770:	4681                	li	a3,0
    1772:	4641                	li	a2,16
    1774:	85ba                	mv	a1,a4
    1776:	853e                	mv	a0,a5
    1778:	00000097          	auipc	ra,0x0
    177c:	d52080e7          	jalr	-686(ra) # 14ca <printint>
    1780:	aa39                	j	189e <vprintf+0x23a>
      } else if(c == 'p') {
    1782:	fdc42783          	lw	a5,-36(s0)
    1786:	0007871b          	sext.w	a4,a5
    178a:	07000793          	li	a5,112
    178e:	02f71263          	bne	a4,a5,17b2 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
    1792:	fb843783          	ld	a5,-72(s0)
    1796:	00878713          	addi	a4,a5,8
    179a:	fae43c23          	sd	a4,-72(s0)
    179e:	6398                	ld	a4,0(a5)
    17a0:	fcc42783          	lw	a5,-52(s0)
    17a4:	85ba                	mv	a1,a4
    17a6:	853e                	mv	a0,a5
    17a8:	00000097          	auipc	ra,0x0
    17ac:	e30080e7          	jalr	-464(ra) # 15d8 <printptr>
    17b0:	a0fd                	j	189e <vprintf+0x23a>
      } else if(c == 's'){
    17b2:	fdc42783          	lw	a5,-36(s0)
    17b6:	0007871b          	sext.w	a4,a5
    17ba:	07300793          	li	a5,115
    17be:	04f71c63          	bne	a4,a5,1816 <vprintf+0x1b2>
        s = va_arg(ap, char*);
    17c2:	fb843783          	ld	a5,-72(s0)
    17c6:	00878713          	addi	a4,a5,8
    17ca:	fae43c23          	sd	a4,-72(s0)
    17ce:	639c                	ld	a5,0(a5)
    17d0:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
    17d4:	fe843783          	ld	a5,-24(s0)
    17d8:	eb8d                	bnez	a5,180a <vprintf+0x1a6>
          s = "(null)";
    17da:	00000797          	auipc	a5,0x0
    17de:	5be78793          	addi	a5,a5,1470 # 1d98 <malloc+0x284>
    17e2:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    17e6:	a015                	j	180a <vprintf+0x1a6>
          putc(fd, *s);
    17e8:	fe843783          	ld	a5,-24(s0)
    17ec:	0007c703          	lbu	a4,0(a5)
    17f0:	fcc42783          	lw	a5,-52(s0)
    17f4:	85ba                	mv	a1,a4
    17f6:	853e                	mv	a0,a5
    17f8:	00000097          	auipc	ra,0x0
    17fc:	c9c080e7          	jalr	-868(ra) # 1494 <putc>
          s++;
    1800:	fe843783          	ld	a5,-24(s0)
    1804:	0785                	addi	a5,a5,1
    1806:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    180a:	fe843783          	ld	a5,-24(s0)
    180e:	0007c783          	lbu	a5,0(a5)
    1812:	fbf9                	bnez	a5,17e8 <vprintf+0x184>
    1814:	a069                	j	189e <vprintf+0x23a>
        }
      } else if(c == 'c'){
    1816:	fdc42783          	lw	a5,-36(s0)
    181a:	0007871b          	sext.w	a4,a5
    181e:	06300793          	li	a5,99
    1822:	02f71463          	bne	a4,a5,184a <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
    1826:	fb843783          	ld	a5,-72(s0)
    182a:	00878713          	addi	a4,a5,8
    182e:	fae43c23          	sd	a4,-72(s0)
    1832:	439c                	lw	a5,0(a5)
    1834:	0ff7f713          	andi	a4,a5,255
    1838:	fcc42783          	lw	a5,-52(s0)
    183c:	85ba                	mv	a1,a4
    183e:	853e                	mv	a0,a5
    1840:	00000097          	auipc	ra,0x0
    1844:	c54080e7          	jalr	-940(ra) # 1494 <putc>
    1848:	a899                	j	189e <vprintf+0x23a>
      } else if(c == '%'){
    184a:	fdc42783          	lw	a5,-36(s0)
    184e:	0007871b          	sext.w	a4,a5
    1852:	02500793          	li	a5,37
    1856:	00f71f63          	bne	a4,a5,1874 <vprintf+0x210>
        putc(fd, c);
    185a:	fdc42783          	lw	a5,-36(s0)
    185e:	0ff7f713          	andi	a4,a5,255
    1862:	fcc42783          	lw	a5,-52(s0)
    1866:	85ba                	mv	a1,a4
    1868:	853e                	mv	a0,a5
    186a:	00000097          	auipc	ra,0x0
    186e:	c2a080e7          	jalr	-982(ra) # 1494 <putc>
    1872:	a035                	j	189e <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1874:	fcc42783          	lw	a5,-52(s0)
    1878:	02500593          	li	a1,37
    187c:	853e                	mv	a0,a5
    187e:	00000097          	auipc	ra,0x0
    1882:	c16080e7          	jalr	-1002(ra) # 1494 <putc>
        putc(fd, c);
    1886:	fdc42783          	lw	a5,-36(s0)
    188a:	0ff7f713          	andi	a4,a5,255
    188e:	fcc42783          	lw	a5,-52(s0)
    1892:	85ba                	mv	a1,a4
    1894:	853e                	mv	a0,a5
    1896:	00000097          	auipc	ra,0x0
    189a:	bfe080e7          	jalr	-1026(ra) # 1494 <putc>
      }
      state = 0;
    189e:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    18a2:	fe442783          	lw	a5,-28(s0)
    18a6:	2785                	addiw	a5,a5,1
    18a8:	fef42223          	sw	a5,-28(s0)
    18ac:	fe442783          	lw	a5,-28(s0)
    18b0:	fc043703          	ld	a4,-64(s0)
    18b4:	97ba                	add	a5,a5,a4
    18b6:	0007c783          	lbu	a5,0(a5)
    18ba:	dc0795e3          	bnez	a5,1684 <vprintf+0x20>
    }
  }
}
    18be:	0001                	nop
    18c0:	0001                	nop
    18c2:	60a6                	ld	ra,72(sp)
    18c4:	6406                	ld	s0,64(sp)
    18c6:	6161                	addi	sp,sp,80
    18c8:	8082                	ret

00000000000018ca <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    18ca:	7159                	addi	sp,sp,-112
    18cc:	fc06                	sd	ra,56(sp)
    18ce:	f822                	sd	s0,48(sp)
    18d0:	0080                	addi	s0,sp,64
    18d2:	fcb43823          	sd	a1,-48(s0)
    18d6:	e010                	sd	a2,0(s0)
    18d8:	e414                	sd	a3,8(s0)
    18da:	e818                	sd	a4,16(s0)
    18dc:	ec1c                	sd	a5,24(s0)
    18de:	03043023          	sd	a6,32(s0)
    18e2:	03143423          	sd	a7,40(s0)
    18e6:	87aa                	mv	a5,a0
    18e8:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
    18ec:	03040793          	addi	a5,s0,48
    18f0:	fcf43423          	sd	a5,-56(s0)
    18f4:	fc843783          	ld	a5,-56(s0)
    18f8:	fd078793          	addi	a5,a5,-48
    18fc:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
    1900:	fe843703          	ld	a4,-24(s0)
    1904:	fdc42783          	lw	a5,-36(s0)
    1908:	863a                	mv	a2,a4
    190a:	fd043583          	ld	a1,-48(s0)
    190e:	853e                	mv	a0,a5
    1910:	00000097          	auipc	ra,0x0
    1914:	d54080e7          	jalr	-684(ra) # 1664 <vprintf>
}
    1918:	0001                	nop
    191a:	70e2                	ld	ra,56(sp)
    191c:	7442                	ld	s0,48(sp)
    191e:	6165                	addi	sp,sp,112
    1920:	8082                	ret

0000000000001922 <printf>:

void
printf(const char *fmt, ...)
{
    1922:	7159                	addi	sp,sp,-112
    1924:	f406                	sd	ra,40(sp)
    1926:	f022                	sd	s0,32(sp)
    1928:	1800                	addi	s0,sp,48
    192a:	fca43c23          	sd	a0,-40(s0)
    192e:	e40c                	sd	a1,8(s0)
    1930:	e810                	sd	a2,16(s0)
    1932:	ec14                	sd	a3,24(s0)
    1934:	f018                	sd	a4,32(s0)
    1936:	f41c                	sd	a5,40(s0)
    1938:	03043823          	sd	a6,48(s0)
    193c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    1940:	04040793          	addi	a5,s0,64
    1944:	fcf43823          	sd	a5,-48(s0)
    1948:	fd043783          	ld	a5,-48(s0)
    194c:	fc878793          	addi	a5,a5,-56
    1950:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
    1954:	fe843783          	ld	a5,-24(s0)
    1958:	863e                	mv	a2,a5
    195a:	fd843583          	ld	a1,-40(s0)
    195e:	4505                	li	a0,1
    1960:	00000097          	auipc	ra,0x0
    1964:	d04080e7          	jalr	-764(ra) # 1664 <vprintf>
}
    1968:	0001                	nop
    196a:	70a2                	ld	ra,40(sp)
    196c:	7402                	ld	s0,32(sp)
    196e:	6165                	addi	sp,sp,112
    1970:	8082                	ret

0000000000001972 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1972:	7179                	addi	sp,sp,-48
    1974:	f422                	sd	s0,40(sp)
    1976:	1800                	addi	s0,sp,48
    1978:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
    197c:	fd843783          	ld	a5,-40(s0)
    1980:	17c1                	addi	a5,a5,-16
    1982:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1986:	00000797          	auipc	a5,0x0
    198a:	4ba78793          	addi	a5,a5,1210 # 1e40 <freep>
    198e:	639c                	ld	a5,0(a5)
    1990:	fef43423          	sd	a5,-24(s0)
    1994:	a815                	j	19c8 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1996:	fe843783          	ld	a5,-24(s0)
    199a:	639c                	ld	a5,0(a5)
    199c:	fe843703          	ld	a4,-24(s0)
    19a0:	00f76f63          	bltu	a4,a5,19be <free+0x4c>
    19a4:	fe043703          	ld	a4,-32(s0)
    19a8:	fe843783          	ld	a5,-24(s0)
    19ac:	02e7eb63          	bltu	a5,a4,19e2 <free+0x70>
    19b0:	fe843783          	ld	a5,-24(s0)
    19b4:	639c                	ld	a5,0(a5)
    19b6:	fe043703          	ld	a4,-32(s0)
    19ba:	02f76463          	bltu	a4,a5,19e2 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    19be:	fe843783          	ld	a5,-24(s0)
    19c2:	639c                	ld	a5,0(a5)
    19c4:	fef43423          	sd	a5,-24(s0)
    19c8:	fe043703          	ld	a4,-32(s0)
    19cc:	fe843783          	ld	a5,-24(s0)
    19d0:	fce7f3e3          	bgeu	a5,a4,1996 <free+0x24>
    19d4:	fe843783          	ld	a5,-24(s0)
    19d8:	639c                	ld	a5,0(a5)
    19da:	fe043703          	ld	a4,-32(s0)
    19de:	faf77ce3          	bgeu	a4,a5,1996 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
    19e2:	fe043783          	ld	a5,-32(s0)
    19e6:	479c                	lw	a5,8(a5)
    19e8:	1782                	slli	a5,a5,0x20
    19ea:	9381                	srli	a5,a5,0x20
    19ec:	0792                	slli	a5,a5,0x4
    19ee:	fe043703          	ld	a4,-32(s0)
    19f2:	973e                	add	a4,a4,a5
    19f4:	fe843783          	ld	a5,-24(s0)
    19f8:	639c                	ld	a5,0(a5)
    19fa:	02f71763          	bne	a4,a5,1a28 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
    19fe:	fe043783          	ld	a5,-32(s0)
    1a02:	4798                	lw	a4,8(a5)
    1a04:	fe843783          	ld	a5,-24(s0)
    1a08:	639c                	ld	a5,0(a5)
    1a0a:	479c                	lw	a5,8(a5)
    1a0c:	9fb9                	addw	a5,a5,a4
    1a0e:	0007871b          	sext.w	a4,a5
    1a12:	fe043783          	ld	a5,-32(s0)
    1a16:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
    1a18:	fe843783          	ld	a5,-24(s0)
    1a1c:	639c                	ld	a5,0(a5)
    1a1e:	6398                	ld	a4,0(a5)
    1a20:	fe043783          	ld	a5,-32(s0)
    1a24:	e398                	sd	a4,0(a5)
    1a26:	a039                	j	1a34 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
    1a28:	fe843783          	ld	a5,-24(s0)
    1a2c:	6398                	ld	a4,0(a5)
    1a2e:	fe043783          	ld	a5,-32(s0)
    1a32:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
    1a34:	fe843783          	ld	a5,-24(s0)
    1a38:	479c                	lw	a5,8(a5)
    1a3a:	1782                	slli	a5,a5,0x20
    1a3c:	9381                	srli	a5,a5,0x20
    1a3e:	0792                	slli	a5,a5,0x4
    1a40:	fe843703          	ld	a4,-24(s0)
    1a44:	97ba                	add	a5,a5,a4
    1a46:	fe043703          	ld	a4,-32(s0)
    1a4a:	02f71563          	bne	a4,a5,1a74 <free+0x102>
    p->s.size += bp->s.size;
    1a4e:	fe843783          	ld	a5,-24(s0)
    1a52:	4798                	lw	a4,8(a5)
    1a54:	fe043783          	ld	a5,-32(s0)
    1a58:	479c                	lw	a5,8(a5)
    1a5a:	9fb9                	addw	a5,a5,a4
    1a5c:	0007871b          	sext.w	a4,a5
    1a60:	fe843783          	ld	a5,-24(s0)
    1a64:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
    1a66:	fe043783          	ld	a5,-32(s0)
    1a6a:	6398                	ld	a4,0(a5)
    1a6c:	fe843783          	ld	a5,-24(s0)
    1a70:	e398                	sd	a4,0(a5)
    1a72:	a031                	j	1a7e <free+0x10c>
  } else
    p->s.ptr = bp;
    1a74:	fe843783          	ld	a5,-24(s0)
    1a78:	fe043703          	ld	a4,-32(s0)
    1a7c:	e398                	sd	a4,0(a5)
  freep = p;
    1a7e:	00000797          	auipc	a5,0x0
    1a82:	3c278793          	addi	a5,a5,962 # 1e40 <freep>
    1a86:	fe843703          	ld	a4,-24(s0)
    1a8a:	e398                	sd	a4,0(a5)
}
    1a8c:	0001                	nop
    1a8e:	7422                	ld	s0,40(sp)
    1a90:	6145                	addi	sp,sp,48
    1a92:	8082                	ret

0000000000001a94 <morecore>:

static Header*
morecore(uint nu)
{
    1a94:	7179                	addi	sp,sp,-48
    1a96:	f406                	sd	ra,40(sp)
    1a98:	f022                	sd	s0,32(sp)
    1a9a:	1800                	addi	s0,sp,48
    1a9c:	87aa                	mv	a5,a0
    1a9e:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
    1aa2:	fdc42783          	lw	a5,-36(s0)
    1aa6:	0007871b          	sext.w	a4,a5
    1aaa:	6785                	lui	a5,0x1
    1aac:	00f77563          	bgeu	a4,a5,1ab6 <morecore+0x22>
    nu = 4096;
    1ab0:	6785                	lui	a5,0x1
    1ab2:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
    1ab6:	fdc42783          	lw	a5,-36(s0)
    1aba:	0047979b          	slliw	a5,a5,0x4
    1abe:	2781                	sext.w	a5,a5
    1ac0:	2781                	sext.w	a5,a5
    1ac2:	853e                	mv	a0,a5
    1ac4:	00000097          	auipc	ra,0x0
    1ac8:	9b0080e7          	jalr	-1616(ra) # 1474 <sbrk>
    1acc:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
    1ad0:	fe843703          	ld	a4,-24(s0)
    1ad4:	57fd                	li	a5,-1
    1ad6:	00f71463          	bne	a4,a5,1ade <morecore+0x4a>
    return 0;
    1ada:	4781                	li	a5,0
    1adc:	a03d                	j	1b0a <morecore+0x76>
  hp = (Header*)p;
    1ade:	fe843783          	ld	a5,-24(s0)
    1ae2:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
    1ae6:	fe043783          	ld	a5,-32(s0)
    1aea:	fdc42703          	lw	a4,-36(s0)
    1aee:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
    1af0:	fe043783          	ld	a5,-32(s0)
    1af4:	07c1                	addi	a5,a5,16
    1af6:	853e                	mv	a0,a5
    1af8:	00000097          	auipc	ra,0x0
    1afc:	e7a080e7          	jalr	-390(ra) # 1972 <free>
  return freep;
    1b00:	00000797          	auipc	a5,0x0
    1b04:	34078793          	addi	a5,a5,832 # 1e40 <freep>
    1b08:	639c                	ld	a5,0(a5)
}
    1b0a:	853e                	mv	a0,a5
    1b0c:	70a2                	ld	ra,40(sp)
    1b0e:	7402                	ld	s0,32(sp)
    1b10:	6145                	addi	sp,sp,48
    1b12:	8082                	ret

0000000000001b14 <malloc>:

void*
malloc(uint nbytes)
{
    1b14:	7139                	addi	sp,sp,-64
    1b16:	fc06                	sd	ra,56(sp)
    1b18:	f822                	sd	s0,48(sp)
    1b1a:	0080                	addi	s0,sp,64
    1b1c:	87aa                	mv	a5,a0
    1b1e:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1b22:	fcc46783          	lwu	a5,-52(s0)
    1b26:	07bd                	addi	a5,a5,15
    1b28:	8391                	srli	a5,a5,0x4
    1b2a:	2781                	sext.w	a5,a5
    1b2c:	2785                	addiw	a5,a5,1
    1b2e:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
    1b32:	00000797          	auipc	a5,0x0
    1b36:	30e78793          	addi	a5,a5,782 # 1e40 <freep>
    1b3a:	639c                	ld	a5,0(a5)
    1b3c:	fef43023          	sd	a5,-32(s0)
    1b40:	fe043783          	ld	a5,-32(s0)
    1b44:	ef95                	bnez	a5,1b80 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
    1b46:	00000797          	auipc	a5,0x0
    1b4a:	2ea78793          	addi	a5,a5,746 # 1e30 <base>
    1b4e:	fef43023          	sd	a5,-32(s0)
    1b52:	00000797          	auipc	a5,0x0
    1b56:	2ee78793          	addi	a5,a5,750 # 1e40 <freep>
    1b5a:	fe043703          	ld	a4,-32(s0)
    1b5e:	e398                	sd	a4,0(a5)
    1b60:	00000797          	auipc	a5,0x0
    1b64:	2e078793          	addi	a5,a5,736 # 1e40 <freep>
    1b68:	6398                	ld	a4,0(a5)
    1b6a:	00000797          	auipc	a5,0x0
    1b6e:	2c678793          	addi	a5,a5,710 # 1e30 <base>
    1b72:	e398                	sd	a4,0(a5)
    base.s.size = 0;
    1b74:	00000797          	auipc	a5,0x0
    1b78:	2bc78793          	addi	a5,a5,700 # 1e30 <base>
    1b7c:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1b80:	fe043783          	ld	a5,-32(s0)
    1b84:	639c                	ld	a5,0(a5)
    1b86:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    1b8a:	fe843783          	ld	a5,-24(s0)
    1b8e:	4798                	lw	a4,8(a5)
    1b90:	fdc42783          	lw	a5,-36(s0)
    1b94:	2781                	sext.w	a5,a5
    1b96:	06f76863          	bltu	a4,a5,1c06 <malloc+0xf2>
      if(p->s.size == nunits)
    1b9a:	fe843783          	ld	a5,-24(s0)
    1b9e:	4798                	lw	a4,8(a5)
    1ba0:	fdc42783          	lw	a5,-36(s0)
    1ba4:	2781                	sext.w	a5,a5
    1ba6:	00e79963          	bne	a5,a4,1bb8 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
    1baa:	fe843783          	ld	a5,-24(s0)
    1bae:	6398                	ld	a4,0(a5)
    1bb0:	fe043783          	ld	a5,-32(s0)
    1bb4:	e398                	sd	a4,0(a5)
    1bb6:	a82d                	j	1bf0 <malloc+0xdc>
      else {
        p->s.size -= nunits;
    1bb8:	fe843783          	ld	a5,-24(s0)
    1bbc:	4798                	lw	a4,8(a5)
    1bbe:	fdc42783          	lw	a5,-36(s0)
    1bc2:	40f707bb          	subw	a5,a4,a5
    1bc6:	0007871b          	sext.w	a4,a5
    1bca:	fe843783          	ld	a5,-24(s0)
    1bce:	c798                	sw	a4,8(a5)
        p += p->s.size;
    1bd0:	fe843783          	ld	a5,-24(s0)
    1bd4:	479c                	lw	a5,8(a5)
    1bd6:	1782                	slli	a5,a5,0x20
    1bd8:	9381                	srli	a5,a5,0x20
    1bda:	0792                	slli	a5,a5,0x4
    1bdc:	fe843703          	ld	a4,-24(s0)
    1be0:	97ba                	add	a5,a5,a4
    1be2:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    1be6:	fe843783          	ld	a5,-24(s0)
    1bea:	fdc42703          	lw	a4,-36(s0)
    1bee:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    1bf0:	00000797          	auipc	a5,0x0
    1bf4:	25078793          	addi	a5,a5,592 # 1e40 <freep>
    1bf8:	fe043703          	ld	a4,-32(s0)
    1bfc:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    1bfe:	fe843783          	ld	a5,-24(s0)
    1c02:	07c1                	addi	a5,a5,16
    1c04:	a091                	j	1c48 <malloc+0x134>
    }
    if(p == freep)
    1c06:	00000797          	auipc	a5,0x0
    1c0a:	23a78793          	addi	a5,a5,570 # 1e40 <freep>
    1c0e:	639c                	ld	a5,0(a5)
    1c10:	fe843703          	ld	a4,-24(s0)
    1c14:	02f71063          	bne	a4,a5,1c34 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    1c18:	fdc42783          	lw	a5,-36(s0)
    1c1c:	853e                	mv	a0,a5
    1c1e:	00000097          	auipc	ra,0x0
    1c22:	e76080e7          	jalr	-394(ra) # 1a94 <morecore>
    1c26:	fea43423          	sd	a0,-24(s0)
    1c2a:	fe843783          	ld	a5,-24(s0)
    1c2e:	e399                	bnez	a5,1c34 <malloc+0x120>
        return 0;
    1c30:	4781                	li	a5,0
    1c32:	a819                	j	1c48 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1c34:	fe843783          	ld	a5,-24(s0)
    1c38:	fef43023          	sd	a5,-32(s0)
    1c3c:	fe843783          	ld	a5,-24(s0)
    1c40:	639c                	ld	a5,0(a5)
    1c42:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    1c46:	b791                	j	1b8a <malloc+0x76>
  }
}
    1c48:	853e                	mv	a0,a5
    1c4a:	70e2                	ld	ra,56(sp)
    1c4c:	7442                	ld	s0,48(sp)
    1c4e:	6121                	addi	sp,sp,64
    1c50:	8082                	ret
