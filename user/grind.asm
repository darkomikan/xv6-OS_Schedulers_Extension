
user/_grind:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <do_rand>:
#include "kernel/riscv.h"

// from FreeBSD.
int
do_rand(unsigned long *ctx)
{
       0:	7139                	addi	sp,sp,-64
       2:	fc22                	sd	s0,56(sp)
       4:	0080                	addi	s0,sp,64
       6:	fca43423          	sd	a0,-56(s0)
 * October 1988, p. 1195.
 */
    long hi, lo, x;

    /* Transform to [1, 0x7ffffffe] range. */
    x = (*ctx % 0x7ffffffe) + 1;
       a:	fc843783          	ld	a5,-56(s0)
       e:	6398                	ld	a4,0(a5)
      10:	800007b7          	lui	a5,0x80000
      14:	ffe7c793          	xori	a5,a5,-2
      18:	02f777b3          	remu	a5,a4,a5
      1c:	0785                	addi	a5,a5,1
      1e:	fef43423          	sd	a5,-24(s0)
    hi = x / 127773;
      22:	fe843703          	ld	a4,-24(s0)
      26:	67fd                	lui	a5,0x1f
      28:	31d78793          	addi	a5,a5,797 # 1f31d <__global_pointer$+0x1cc4d>
      2c:	02f747b3          	div	a5,a4,a5
      30:	fef43023          	sd	a5,-32(s0)
    lo = x % 127773;
      34:	fe843703          	ld	a4,-24(s0)
      38:	67fd                	lui	a5,0x1f
      3a:	31d78793          	addi	a5,a5,797 # 1f31d <__global_pointer$+0x1cc4d>
      3e:	02f767b3          	rem	a5,a4,a5
      42:	fcf43c23          	sd	a5,-40(s0)
    x = 16807 * lo - 2836 * hi;
      46:	fd843703          	ld	a4,-40(s0)
      4a:	6791                	lui	a5,0x4
      4c:	1a778793          	addi	a5,a5,423 # 41a7 <__global_pointer$+0x1ad7>
      50:	02f70733          	mul	a4,a4,a5
      54:	fe043683          	ld	a3,-32(s0)
      58:	77fd                	lui	a5,0xfffff
      5a:	4ec78793          	addi	a5,a5,1260 # fffffffffffff4ec <__global_pointer$+0xffffffffffffce1c>
      5e:	02f687b3          	mul	a5,a3,a5
      62:	97ba                	add	a5,a5,a4
      64:	fef43423          	sd	a5,-24(s0)
    if (x < 0)
      68:	fe843783          	ld	a5,-24(s0)
      6c:	0007db63          	bgez	a5,82 <do_rand+0x82>
        x += 0x7fffffff;
      70:	fe843703          	ld	a4,-24(s0)
      74:	800007b7          	lui	a5,0x80000
      78:	fff7c793          	not	a5,a5
      7c:	97ba                	add	a5,a5,a4
      7e:	fef43423          	sd	a5,-24(s0)
    /* Transform to [0, 0x7ffffffd] range. */
    x--;
      82:	fe843783          	ld	a5,-24(s0)
      86:	17fd                	addi	a5,a5,-1
      88:	fef43423          	sd	a5,-24(s0)
    *ctx = x;
      8c:	fe843703          	ld	a4,-24(s0)
      90:	fc843783          	ld	a5,-56(s0)
      94:	e398                	sd	a4,0(a5)
    return (x);
      96:	fe843783          	ld	a5,-24(s0)
      9a:	2781                	sext.w	a5,a5
}
      9c:	853e                	mv	a0,a5
      9e:	7462                	ld	s0,56(sp)
      a0:	6121                	addi	sp,sp,64
      a2:	8082                	ret

00000000000000a4 <rand>:

unsigned long rand_next = 1;

int
rand(void)
{
      a4:	1141                	addi	sp,sp,-16
      a6:	e406                	sd	ra,8(sp)
      a8:	e022                	sd	s0,0(sp)
      aa:	0800                	addi	s0,sp,16
    return (do_rand(&rand_next));
      ac:	00002517          	auipc	a0,0x2
      b0:	e3c50513          	addi	a0,a0,-452 # 1ee8 <rand_next>
      b4:	00000097          	auipc	ra,0x0
      b8:	f4c080e7          	jalr	-180(ra) # 0 <do_rand>
      bc:	87aa                	mv	a5,a0
}
      be:	853e                	mv	a0,a5
      c0:	60a2                	ld	ra,8(sp)
      c2:	6402                	ld	s0,0(sp)
      c4:	0141                	addi	sp,sp,16
      c6:	8082                	ret

00000000000000c8 <go>:

void
go(int which_child)
{
      c8:	7155                	addi	sp,sp,-208
      ca:	e586                	sd	ra,200(sp)
      cc:	e1a2                	sd	s0,192(sp)
      ce:	0980                	addi	s0,sp,208
      d0:	87aa                	mv	a5,a0
      d2:	f2f42e23          	sw	a5,-196(s0)
  int fd = -1;
      d6:	57fd                	li	a5,-1
      d8:	fef42623          	sw	a5,-20(s0)
  static char buf[999];
  char *break0 = sbrk(0);
      dc:	4501                	li	a0,0
      de:	00001097          	auipc	ra,0x1
      e2:	30c080e7          	jalr	780(ra) # 13ea <sbrk>
      e6:	fca43c23          	sd	a0,-40(s0)
  uint64 iters = 0;
      ea:	fe043023          	sd	zero,-32(s0)

  mkdir("grindir");
      ee:	00002517          	auipc	a0,0x2
      f2:	ada50513          	addi	a0,a0,-1318 # 1bc8 <malloc+0x13e>
      f6:	00001097          	auipc	ra,0x1
      fa:	2d4080e7          	jalr	724(ra) # 13ca <mkdir>
  if(chdir("grindir") != 0){
      fe:	00002517          	auipc	a0,0x2
     102:	aca50513          	addi	a0,a0,-1334 # 1bc8 <malloc+0x13e>
     106:	00001097          	auipc	ra,0x1
     10a:	2cc080e7          	jalr	716(ra) # 13d2 <chdir>
     10e:	87aa                	mv	a5,a0
     110:	cf91                	beqz	a5,12c <go+0x64>
    printf("grind: chdir grindir failed\n");
     112:	00002517          	auipc	a0,0x2
     116:	abe50513          	addi	a0,a0,-1346 # 1bd0 <malloc+0x146>
     11a:	00001097          	auipc	ra,0x1
     11e:	77e080e7          	jalr	1918(ra) # 1898 <printf>
    exit(1);
     122:	4505                	li	a0,1
     124:	00001097          	auipc	ra,0x1
     128:	23e080e7          	jalr	574(ra) # 1362 <exit>
  }
  chdir("/");
     12c:	00002517          	auipc	a0,0x2
     130:	ac450513          	addi	a0,a0,-1340 # 1bf0 <malloc+0x166>
     134:	00001097          	auipc	ra,0x1
     138:	29e080e7          	jalr	670(ra) # 13d2 <chdir>
  
  while(1){
    iters++;
     13c:	fe043783          	ld	a5,-32(s0)
     140:	0785                	addi	a5,a5,1
     142:	fef43023          	sd	a5,-32(s0)
    if((iters % 500) == 0)
     146:	fe043703          	ld	a4,-32(s0)
     14a:	1f400793          	li	a5,500
     14e:	02f777b3          	remu	a5,a4,a5
     152:	e78d                	bnez	a5,17c <go+0xb4>
      write(1, which_child?"B":"A", 1);
     154:	f3c42783          	lw	a5,-196(s0)
     158:	2781                	sext.w	a5,a5
     15a:	c791                	beqz	a5,166 <go+0x9e>
     15c:	00002797          	auipc	a5,0x2
     160:	a9c78793          	addi	a5,a5,-1380 # 1bf8 <malloc+0x16e>
     164:	a029                	j	16e <go+0xa6>
     166:	00002797          	auipc	a5,0x2
     16a:	a9a78793          	addi	a5,a5,-1382 # 1c00 <malloc+0x176>
     16e:	4605                	li	a2,1
     170:	85be                	mv	a1,a5
     172:	4505                	li	a0,1
     174:	00001097          	auipc	ra,0x1
     178:	20e080e7          	jalr	526(ra) # 1382 <write>
    int what = rand() % 23;
     17c:	00000097          	auipc	ra,0x0
     180:	f28080e7          	jalr	-216(ra) # a4 <rand>
     184:	87aa                	mv	a5,a0
     186:	873e                	mv	a4,a5
     188:	47dd                	li	a5,23
     18a:	02f767bb          	remw	a5,a4,a5
     18e:	fcf42a23          	sw	a5,-44(s0)
    if(what == 1){
     192:	fd442783          	lw	a5,-44(s0)
     196:	0007871b          	sext.w	a4,a5
     19a:	4785                	li	a5,1
     19c:	02f71363          	bne	a4,a5,1c2 <go+0xfa>
      close(open("grindir/../a", O_CREATE|O_RDWR));
     1a0:	20200593          	li	a1,514
     1a4:	00002517          	auipc	a0,0x2
     1a8:	a6450513          	addi	a0,a0,-1436 # 1c08 <malloc+0x17e>
     1ac:	00001097          	auipc	ra,0x1
     1b0:	1f6080e7          	jalr	502(ra) # 13a2 <open>
     1b4:	87aa                	mv	a5,a0
     1b6:	853e                	mv	a0,a5
     1b8:	00001097          	auipc	ra,0x1
     1bc:	1d2080e7          	jalr	466(ra) # 138a <close>
     1c0:	bfb5                	j	13c <go+0x74>
    } else if(what == 2){
     1c2:	fd442783          	lw	a5,-44(s0)
     1c6:	0007871b          	sext.w	a4,a5
     1ca:	4789                	li	a5,2
     1cc:	02f71363          	bne	a4,a5,1f2 <go+0x12a>
      close(open("grindir/../grindir/../b", O_CREATE|O_RDWR));
     1d0:	20200593          	li	a1,514
     1d4:	00002517          	auipc	a0,0x2
     1d8:	a4450513          	addi	a0,a0,-1468 # 1c18 <malloc+0x18e>
     1dc:	00001097          	auipc	ra,0x1
     1e0:	1c6080e7          	jalr	454(ra) # 13a2 <open>
     1e4:	87aa                	mv	a5,a0
     1e6:	853e                	mv	a0,a5
     1e8:	00001097          	auipc	ra,0x1
     1ec:	1a2080e7          	jalr	418(ra) # 138a <close>
     1f0:	b7b1                	j	13c <go+0x74>
    } else if(what == 3){
     1f2:	fd442783          	lw	a5,-44(s0)
     1f6:	0007871b          	sext.w	a4,a5
     1fa:	478d                	li	a5,3
     1fc:	00f71b63          	bne	a4,a5,212 <go+0x14a>
      unlink("grindir/../a");
     200:	00002517          	auipc	a0,0x2
     204:	a0850513          	addi	a0,a0,-1528 # 1c08 <malloc+0x17e>
     208:	00001097          	auipc	ra,0x1
     20c:	1aa080e7          	jalr	426(ra) # 13b2 <unlink>
     210:	b735                	j	13c <go+0x74>
    } else if(what == 4){
     212:	fd442783          	lw	a5,-44(s0)
     216:	0007871b          	sext.w	a4,a5
     21a:	4791                	li	a5,4
     21c:	04f71a63          	bne	a4,a5,270 <go+0x1a8>
      if(chdir("grindir") != 0){
     220:	00002517          	auipc	a0,0x2
     224:	9a850513          	addi	a0,a0,-1624 # 1bc8 <malloc+0x13e>
     228:	00001097          	auipc	ra,0x1
     22c:	1aa080e7          	jalr	426(ra) # 13d2 <chdir>
     230:	87aa                	mv	a5,a0
     232:	cf91                	beqz	a5,24e <go+0x186>
        printf("grind: chdir grindir failed\n");
     234:	00002517          	auipc	a0,0x2
     238:	99c50513          	addi	a0,a0,-1636 # 1bd0 <malloc+0x146>
     23c:	00001097          	auipc	ra,0x1
     240:	65c080e7          	jalr	1628(ra) # 1898 <printf>
        exit(1);
     244:	4505                	li	a0,1
     246:	00001097          	auipc	ra,0x1
     24a:	11c080e7          	jalr	284(ra) # 1362 <exit>
      }
      unlink("../b");
     24e:	00002517          	auipc	a0,0x2
     252:	9e250513          	addi	a0,a0,-1566 # 1c30 <malloc+0x1a6>
     256:	00001097          	auipc	ra,0x1
     25a:	15c080e7          	jalr	348(ra) # 13b2 <unlink>
      chdir("/");
     25e:	00002517          	auipc	a0,0x2
     262:	99250513          	addi	a0,a0,-1646 # 1bf0 <malloc+0x166>
     266:	00001097          	auipc	ra,0x1
     26a:	16c080e7          	jalr	364(ra) # 13d2 <chdir>
     26e:	b5f9                	j	13c <go+0x74>
    } else if(what == 5){
     270:	fd442783          	lw	a5,-44(s0)
     274:	0007871b          	sext.w	a4,a5
     278:	4795                	li	a5,5
     27a:	02f71763          	bne	a4,a5,2a8 <go+0x1e0>
      close(fd);
     27e:	fec42783          	lw	a5,-20(s0)
     282:	853e                	mv	a0,a5
     284:	00001097          	auipc	ra,0x1
     288:	106080e7          	jalr	262(ra) # 138a <close>
      fd = open("/grindir/../a", O_CREATE|O_RDWR);
     28c:	20200593          	li	a1,514
     290:	00002517          	auipc	a0,0x2
     294:	9a850513          	addi	a0,a0,-1624 # 1c38 <malloc+0x1ae>
     298:	00001097          	auipc	ra,0x1
     29c:	10a080e7          	jalr	266(ra) # 13a2 <open>
     2a0:	87aa                	mv	a5,a0
     2a2:	fef42623          	sw	a5,-20(s0)
     2a6:	bd59                	j	13c <go+0x74>
    } else if(what == 6){
     2a8:	fd442783          	lw	a5,-44(s0)
     2ac:	0007871b          	sext.w	a4,a5
     2b0:	4799                	li	a5,6
     2b2:	02f71763          	bne	a4,a5,2e0 <go+0x218>
      close(fd);
     2b6:	fec42783          	lw	a5,-20(s0)
     2ba:	853e                	mv	a0,a5
     2bc:	00001097          	auipc	ra,0x1
     2c0:	0ce080e7          	jalr	206(ra) # 138a <close>
      fd = open("/./grindir/./../b", O_CREATE|O_RDWR);
     2c4:	20200593          	li	a1,514
     2c8:	00002517          	auipc	a0,0x2
     2cc:	98050513          	addi	a0,a0,-1664 # 1c48 <malloc+0x1be>
     2d0:	00001097          	auipc	ra,0x1
     2d4:	0d2080e7          	jalr	210(ra) # 13a2 <open>
     2d8:	87aa                	mv	a5,a0
     2da:	fef42623          	sw	a5,-20(s0)
     2de:	bdb9                	j	13c <go+0x74>
    } else if(what == 7){
     2e0:	fd442783          	lw	a5,-44(s0)
     2e4:	0007871b          	sext.w	a4,a5
     2e8:	479d                	li	a5,7
     2ea:	02f71063          	bne	a4,a5,30a <go+0x242>
      write(fd, buf, sizeof(buf));
     2ee:	fec42783          	lw	a5,-20(s0)
     2f2:	3e700613          	li	a2,999
     2f6:	00002597          	auipc	a1,0x2
     2fa:	bfa58593          	addi	a1,a1,-1030 # 1ef0 <buf.1241>
     2fe:	853e                	mv	a0,a5
     300:	00001097          	auipc	ra,0x1
     304:	082080e7          	jalr	130(ra) # 1382 <write>
     308:	bd15                	j	13c <go+0x74>
    } else if(what == 8){
     30a:	fd442783          	lw	a5,-44(s0)
     30e:	0007871b          	sext.w	a4,a5
     312:	47a1                	li	a5,8
     314:	02f71063          	bne	a4,a5,334 <go+0x26c>
      read(fd, buf, sizeof(buf));
     318:	fec42783          	lw	a5,-20(s0)
     31c:	3e700613          	li	a2,999
     320:	00002597          	auipc	a1,0x2
     324:	bd058593          	addi	a1,a1,-1072 # 1ef0 <buf.1241>
     328:	853e                	mv	a0,a5
     32a:	00001097          	auipc	ra,0x1
     32e:	050080e7          	jalr	80(ra) # 137a <read>
     332:	b529                	j	13c <go+0x74>
    } else if(what == 9){
     334:	fd442783          	lw	a5,-44(s0)
     338:	0007871b          	sext.w	a4,a5
     33c:	47a5                	li	a5,9
     33e:	04f71363          	bne	a4,a5,384 <go+0x2bc>
      mkdir("grindir/../a");
     342:	00002517          	auipc	a0,0x2
     346:	8c650513          	addi	a0,a0,-1850 # 1c08 <malloc+0x17e>
     34a:	00001097          	auipc	ra,0x1
     34e:	080080e7          	jalr	128(ra) # 13ca <mkdir>
      close(open("a/../a/./a", O_CREATE|O_RDWR));
     352:	20200593          	li	a1,514
     356:	00002517          	auipc	a0,0x2
     35a:	90a50513          	addi	a0,a0,-1782 # 1c60 <malloc+0x1d6>
     35e:	00001097          	auipc	ra,0x1
     362:	044080e7          	jalr	68(ra) # 13a2 <open>
     366:	87aa                	mv	a5,a0
     368:	853e                	mv	a0,a5
     36a:	00001097          	auipc	ra,0x1
     36e:	020080e7          	jalr	32(ra) # 138a <close>
      unlink("a/a");
     372:	00002517          	auipc	a0,0x2
     376:	8fe50513          	addi	a0,a0,-1794 # 1c70 <malloc+0x1e6>
     37a:	00001097          	auipc	ra,0x1
     37e:	038080e7          	jalr	56(ra) # 13b2 <unlink>
     382:	bb6d                	j	13c <go+0x74>
    } else if(what == 10){
     384:	fd442783          	lw	a5,-44(s0)
     388:	0007871b          	sext.w	a4,a5
     38c:	47a9                	li	a5,10
     38e:	04f71363          	bne	a4,a5,3d4 <go+0x30c>
      mkdir("/../b");
     392:	00002517          	auipc	a0,0x2
     396:	8e650513          	addi	a0,a0,-1818 # 1c78 <malloc+0x1ee>
     39a:	00001097          	auipc	ra,0x1
     39e:	030080e7          	jalr	48(ra) # 13ca <mkdir>
      close(open("grindir/../b/b", O_CREATE|O_RDWR));
     3a2:	20200593          	li	a1,514
     3a6:	00002517          	auipc	a0,0x2
     3aa:	8da50513          	addi	a0,a0,-1830 # 1c80 <malloc+0x1f6>
     3ae:	00001097          	auipc	ra,0x1
     3b2:	ff4080e7          	jalr	-12(ra) # 13a2 <open>
     3b6:	87aa                	mv	a5,a0
     3b8:	853e                	mv	a0,a5
     3ba:	00001097          	auipc	ra,0x1
     3be:	fd0080e7          	jalr	-48(ra) # 138a <close>
      unlink("b/b");
     3c2:	00002517          	auipc	a0,0x2
     3c6:	8ce50513          	addi	a0,a0,-1842 # 1c90 <malloc+0x206>
     3ca:	00001097          	auipc	ra,0x1
     3ce:	fe8080e7          	jalr	-24(ra) # 13b2 <unlink>
     3d2:	b3ad                	j	13c <go+0x74>
    } else if(what == 11){
     3d4:	fd442783          	lw	a5,-44(s0)
     3d8:	0007871b          	sext.w	a4,a5
     3dc:	47ad                	li	a5,11
     3de:	02f71763          	bne	a4,a5,40c <go+0x344>
      unlink("b");
     3e2:	00002517          	auipc	a0,0x2
     3e6:	8b650513          	addi	a0,a0,-1866 # 1c98 <malloc+0x20e>
     3ea:	00001097          	auipc	ra,0x1
     3ee:	fc8080e7          	jalr	-56(ra) # 13b2 <unlink>
      link("../grindir/./../a", "../b");
     3f2:	00002597          	auipc	a1,0x2
     3f6:	83e58593          	addi	a1,a1,-1986 # 1c30 <malloc+0x1a6>
     3fa:	00002517          	auipc	a0,0x2
     3fe:	8a650513          	addi	a0,a0,-1882 # 1ca0 <malloc+0x216>
     402:	00001097          	auipc	ra,0x1
     406:	fc0080e7          	jalr	-64(ra) # 13c2 <link>
     40a:	bb0d                	j	13c <go+0x74>
    } else if(what == 12){
     40c:	fd442783          	lw	a5,-44(s0)
     410:	0007871b          	sext.w	a4,a5
     414:	47b1                	li	a5,12
     416:	02f71763          	bne	a4,a5,444 <go+0x37c>
      unlink("../grindir/../a");
     41a:	00002517          	auipc	a0,0x2
     41e:	89e50513          	addi	a0,a0,-1890 # 1cb8 <malloc+0x22e>
     422:	00001097          	auipc	ra,0x1
     426:	f90080e7          	jalr	-112(ra) # 13b2 <unlink>
      link(".././b", "/grindir/../a");
     42a:	00002597          	auipc	a1,0x2
     42e:	80e58593          	addi	a1,a1,-2034 # 1c38 <malloc+0x1ae>
     432:	00002517          	auipc	a0,0x2
     436:	89650513          	addi	a0,a0,-1898 # 1cc8 <malloc+0x23e>
     43a:	00001097          	auipc	ra,0x1
     43e:	f88080e7          	jalr	-120(ra) # 13c2 <link>
     442:	b9ed                	j	13c <go+0x74>
    } else if(what == 13){
     444:	fd442783          	lw	a5,-44(s0)
     448:	0007871b          	sext.w	a4,a5
     44c:	47b5                	li	a5,13
     44e:	04f71a63          	bne	a4,a5,4a2 <go+0x3da>
      int pid = fork();
     452:	00001097          	auipc	ra,0x1
     456:	f08080e7          	jalr	-248(ra) # 135a <fork>
     45a:	87aa                	mv	a5,a0
     45c:	faf42823          	sw	a5,-80(s0)
      if(pid == 0){
     460:	fb042783          	lw	a5,-80(s0)
     464:	2781                	sext.w	a5,a5
     466:	e791                	bnez	a5,472 <go+0x3aa>
        exit(0);
     468:	4501                	li	a0,0
     46a:	00001097          	auipc	ra,0x1
     46e:	ef8080e7          	jalr	-264(ra) # 1362 <exit>
      } else if(pid < 0){
     472:	fb042783          	lw	a5,-80(s0)
     476:	2781                	sext.w	a5,a5
     478:	0007df63          	bgez	a5,496 <go+0x3ce>
        printf("grind: fork failed\n");
     47c:	00002517          	auipc	a0,0x2
     480:	85450513          	addi	a0,a0,-1964 # 1cd0 <malloc+0x246>
     484:	00001097          	auipc	ra,0x1
     488:	414080e7          	jalr	1044(ra) # 1898 <printf>
        exit(1);
     48c:	4505                	li	a0,1
     48e:	00001097          	auipc	ra,0x1
     492:	ed4080e7          	jalr	-300(ra) # 1362 <exit>
      }
      wait(0);
     496:	4501                	li	a0,0
     498:	00001097          	auipc	ra,0x1
     49c:	ed2080e7          	jalr	-302(ra) # 136a <wait>
     4a0:	b971                	j	13c <go+0x74>
    } else if(what == 14){
     4a2:	fd442783          	lw	a5,-44(s0)
     4a6:	0007871b          	sext.w	a4,a5
     4aa:	47b9                	li	a5,14
     4ac:	06f71263          	bne	a4,a5,510 <go+0x448>
      int pid = fork();
     4b0:	00001097          	auipc	ra,0x1
     4b4:	eaa080e7          	jalr	-342(ra) # 135a <fork>
     4b8:	87aa                	mv	a5,a0
     4ba:	faf42a23          	sw	a5,-76(s0)
      if(pid == 0){
     4be:	fb442783          	lw	a5,-76(s0)
     4c2:	2781                	sext.w	a5,a5
     4c4:	ef91                	bnez	a5,4e0 <go+0x418>
        fork();
     4c6:	00001097          	auipc	ra,0x1
     4ca:	e94080e7          	jalr	-364(ra) # 135a <fork>
        fork();
     4ce:	00001097          	auipc	ra,0x1
     4d2:	e8c080e7          	jalr	-372(ra) # 135a <fork>
        exit(0);
     4d6:	4501                	li	a0,0
     4d8:	00001097          	auipc	ra,0x1
     4dc:	e8a080e7          	jalr	-374(ra) # 1362 <exit>
      } else if(pid < 0){
     4e0:	fb442783          	lw	a5,-76(s0)
     4e4:	2781                	sext.w	a5,a5
     4e6:	0007df63          	bgez	a5,504 <go+0x43c>
        printf("grind: fork failed\n");
     4ea:	00001517          	auipc	a0,0x1
     4ee:	7e650513          	addi	a0,a0,2022 # 1cd0 <malloc+0x246>
     4f2:	00001097          	auipc	ra,0x1
     4f6:	3a6080e7          	jalr	934(ra) # 1898 <printf>
        exit(1);
     4fa:	4505                	li	a0,1
     4fc:	00001097          	auipc	ra,0x1
     500:	e66080e7          	jalr	-410(ra) # 1362 <exit>
      }
      wait(0);
     504:	4501                	li	a0,0
     506:	00001097          	auipc	ra,0x1
     50a:	e64080e7          	jalr	-412(ra) # 136a <wait>
     50e:	b13d                	j	13c <go+0x74>
    } else if(what == 15){
     510:	fd442783          	lw	a5,-44(s0)
     514:	0007871b          	sext.w	a4,a5
     518:	47bd                	li	a5,15
     51a:	00f71a63          	bne	a4,a5,52e <go+0x466>
      sbrk(6011);
     51e:	6785                	lui	a5,0x1
     520:	77b78513          	addi	a0,a5,1915 # 177b <vprintf+0x1a1>
     524:	00001097          	auipc	ra,0x1
     528:	ec6080e7          	jalr	-314(ra) # 13ea <sbrk>
     52c:	b901                	j	13c <go+0x74>
    } else if(what == 16){
     52e:	fd442783          	lw	a5,-44(s0)
     532:	0007871b          	sext.w	a4,a5
     536:	47c1                	li	a5,16
     538:	02f71c63          	bne	a4,a5,570 <go+0x4a8>
      if(sbrk(0) > break0)
     53c:	4501                	li	a0,0
     53e:	00001097          	auipc	ra,0x1
     542:	eac080e7          	jalr	-340(ra) # 13ea <sbrk>
     546:	872a                	mv	a4,a0
     548:	fd843783          	ld	a5,-40(s0)
     54c:	bee7f8e3          	bgeu	a5,a4,13c <go+0x74>
        sbrk(-(sbrk(0) - break0));
     550:	4501                	li	a0,0
     552:	00001097          	auipc	ra,0x1
     556:	e98080e7          	jalr	-360(ra) # 13ea <sbrk>
     55a:	872a                	mv	a4,a0
     55c:	fd843783          	ld	a5,-40(s0)
     560:	8f99                	sub	a5,a5,a4
     562:	2781                	sext.w	a5,a5
     564:	853e                	mv	a0,a5
     566:	00001097          	auipc	ra,0x1
     56a:	e84080e7          	jalr	-380(ra) # 13ea <sbrk>
     56e:	b6f9                	j	13c <go+0x74>
    } else if(what == 17){
     570:	fd442783          	lw	a5,-44(s0)
     574:	0007871b          	sext.w	a4,a5
     578:	47c5                	li	a5,17
     57a:	0af71863          	bne	a4,a5,62a <go+0x562>
      int pid = fork();
     57e:	00001097          	auipc	ra,0x1
     582:	ddc080e7          	jalr	-548(ra) # 135a <fork>
     586:	87aa                	mv	a5,a0
     588:	faf42c23          	sw	a5,-72(s0)
      if(pid == 0){
     58c:	fb842783          	lw	a5,-72(s0)
     590:	2781                	sext.w	a5,a5
     592:	e795                	bnez	a5,5be <go+0x4f6>
        close(open("a", O_CREATE|O_RDWR));
     594:	20200593          	li	a1,514
     598:	00001517          	auipc	a0,0x1
     59c:	75050513          	addi	a0,a0,1872 # 1ce8 <malloc+0x25e>
     5a0:	00001097          	auipc	ra,0x1
     5a4:	e02080e7          	jalr	-510(ra) # 13a2 <open>
     5a8:	87aa                	mv	a5,a0
     5aa:	853e                	mv	a0,a5
     5ac:	00001097          	auipc	ra,0x1
     5b0:	dde080e7          	jalr	-546(ra) # 138a <close>
        exit(0);
     5b4:	4501                	li	a0,0
     5b6:	00001097          	auipc	ra,0x1
     5ba:	dac080e7          	jalr	-596(ra) # 1362 <exit>
      } else if(pid < 0){
     5be:	fb842783          	lw	a5,-72(s0)
     5c2:	2781                	sext.w	a5,a5
     5c4:	0007df63          	bgez	a5,5e2 <go+0x51a>
        printf("grind: fork failed\n");
     5c8:	00001517          	auipc	a0,0x1
     5cc:	70850513          	addi	a0,a0,1800 # 1cd0 <malloc+0x246>
     5d0:	00001097          	auipc	ra,0x1
     5d4:	2c8080e7          	jalr	712(ra) # 1898 <printf>
        exit(1);
     5d8:	4505                	li	a0,1
     5da:	00001097          	auipc	ra,0x1
     5de:	d88080e7          	jalr	-632(ra) # 1362 <exit>
      }
      if(chdir("../grindir/..") != 0){
     5e2:	00001517          	auipc	a0,0x1
     5e6:	70e50513          	addi	a0,a0,1806 # 1cf0 <malloc+0x266>
     5ea:	00001097          	auipc	ra,0x1
     5ee:	de8080e7          	jalr	-536(ra) # 13d2 <chdir>
     5f2:	87aa                	mv	a5,a0
     5f4:	cf91                	beqz	a5,610 <go+0x548>
        printf("grind: chdir failed\n");
     5f6:	00001517          	auipc	a0,0x1
     5fa:	70a50513          	addi	a0,a0,1802 # 1d00 <malloc+0x276>
     5fe:	00001097          	auipc	ra,0x1
     602:	29a080e7          	jalr	666(ra) # 1898 <printf>
        exit(1);
     606:	4505                	li	a0,1
     608:	00001097          	auipc	ra,0x1
     60c:	d5a080e7          	jalr	-678(ra) # 1362 <exit>
      }
      kill(pid);
     610:	fb842783          	lw	a5,-72(s0)
     614:	853e                	mv	a0,a5
     616:	00001097          	auipc	ra,0x1
     61a:	d7c080e7          	jalr	-644(ra) # 1392 <kill>
      wait(0);
     61e:	4501                	li	a0,0
     620:	00001097          	auipc	ra,0x1
     624:	d4a080e7          	jalr	-694(ra) # 136a <wait>
     628:	be11                	j	13c <go+0x74>
    } else if(what == 18){
     62a:	fd442783          	lw	a5,-44(s0)
     62e:	0007871b          	sext.w	a4,a5
     632:	47c9                	li	a5,18
     634:	06f71463          	bne	a4,a5,69c <go+0x5d4>
      int pid = fork();
     638:	00001097          	auipc	ra,0x1
     63c:	d22080e7          	jalr	-734(ra) # 135a <fork>
     640:	87aa                	mv	a5,a0
     642:	faf42e23          	sw	a5,-68(s0)
      if(pid == 0){
     646:	fbc42783          	lw	a5,-68(s0)
     64a:	2781                	sext.w	a5,a5
     64c:	e385                	bnez	a5,66c <go+0x5a4>
        kill(getpid());
     64e:	00001097          	auipc	ra,0x1
     652:	d94080e7          	jalr	-620(ra) # 13e2 <getpid>
     656:	87aa                	mv	a5,a0
     658:	853e                	mv	a0,a5
     65a:	00001097          	auipc	ra,0x1
     65e:	d38080e7          	jalr	-712(ra) # 1392 <kill>
        exit(0);
     662:	4501                	li	a0,0
     664:	00001097          	auipc	ra,0x1
     668:	cfe080e7          	jalr	-770(ra) # 1362 <exit>
      } else if(pid < 0){
     66c:	fbc42783          	lw	a5,-68(s0)
     670:	2781                	sext.w	a5,a5
     672:	0007df63          	bgez	a5,690 <go+0x5c8>
        printf("grind: fork failed\n");
     676:	00001517          	auipc	a0,0x1
     67a:	65a50513          	addi	a0,a0,1626 # 1cd0 <malloc+0x246>
     67e:	00001097          	auipc	ra,0x1
     682:	21a080e7          	jalr	538(ra) # 1898 <printf>
        exit(1);
     686:	4505                	li	a0,1
     688:	00001097          	auipc	ra,0x1
     68c:	cda080e7          	jalr	-806(ra) # 1362 <exit>
      }
      wait(0);
     690:	4501                	li	a0,0
     692:	00001097          	auipc	ra,0x1
     696:	cd8080e7          	jalr	-808(ra) # 136a <wait>
     69a:	b44d                	j	13c <go+0x74>
    } else if(what == 19){
     69c:	fd442783          	lw	a5,-44(s0)
     6a0:	0007871b          	sext.w	a4,a5
     6a4:	47cd                	li	a5,19
     6a6:	10f71863          	bne	a4,a5,7b6 <go+0x6ee>
      int fds[2];
      if(pipe(fds) < 0){
     6aa:	fa840793          	addi	a5,s0,-88
     6ae:	853e                	mv	a0,a5
     6b0:	00001097          	auipc	ra,0x1
     6b4:	cc2080e7          	jalr	-830(ra) # 1372 <pipe>
     6b8:	87aa                	mv	a5,a0
     6ba:	0007df63          	bgez	a5,6d8 <go+0x610>
        printf("grind: pipe failed\n");
     6be:	00001517          	auipc	a0,0x1
     6c2:	65a50513          	addi	a0,a0,1626 # 1d18 <malloc+0x28e>
     6c6:	00001097          	auipc	ra,0x1
     6ca:	1d2080e7          	jalr	466(ra) # 1898 <printf>
        exit(1);
     6ce:	4505                	li	a0,1
     6d0:	00001097          	auipc	ra,0x1
     6d4:	c92080e7          	jalr	-878(ra) # 1362 <exit>
      }
      int pid = fork();
     6d8:	00001097          	auipc	ra,0x1
     6dc:	c82080e7          	jalr	-894(ra) # 135a <fork>
     6e0:	87aa                	mv	a5,a0
     6e2:	fcf42023          	sw	a5,-64(s0)
      if(pid == 0){
     6e6:	fc042783          	lw	a5,-64(s0)
     6ea:	2781                	sext.w	a5,a5
     6ec:	efbd                	bnez	a5,76a <go+0x6a2>
        fork();
     6ee:	00001097          	auipc	ra,0x1
     6f2:	c6c080e7          	jalr	-916(ra) # 135a <fork>
        fork();
     6f6:	00001097          	auipc	ra,0x1
     6fa:	c64080e7          	jalr	-924(ra) # 135a <fork>
        if(write(fds[1], "x", 1) != 1)
     6fe:	fac42783          	lw	a5,-84(s0)
     702:	4605                	li	a2,1
     704:	00001597          	auipc	a1,0x1
     708:	62c58593          	addi	a1,a1,1580 # 1d30 <malloc+0x2a6>
     70c:	853e                	mv	a0,a5
     70e:	00001097          	auipc	ra,0x1
     712:	c74080e7          	jalr	-908(ra) # 1382 <write>
     716:	87aa                	mv	a5,a0
     718:	873e                	mv	a4,a5
     71a:	4785                	li	a5,1
     71c:	00f70a63          	beq	a4,a5,730 <go+0x668>
          printf("grind: pipe write failed\n");
     720:	00001517          	auipc	a0,0x1
     724:	61850513          	addi	a0,a0,1560 # 1d38 <malloc+0x2ae>
     728:	00001097          	auipc	ra,0x1
     72c:	170080e7          	jalr	368(ra) # 1898 <printf>
        char c;
        if(read(fds[0], &c, 1) != 1)
     730:	fa842783          	lw	a5,-88(s0)
     734:	fa740713          	addi	a4,s0,-89
     738:	4605                	li	a2,1
     73a:	85ba                	mv	a1,a4
     73c:	853e                	mv	a0,a5
     73e:	00001097          	auipc	ra,0x1
     742:	c3c080e7          	jalr	-964(ra) # 137a <read>
     746:	87aa                	mv	a5,a0
     748:	873e                	mv	a4,a5
     74a:	4785                	li	a5,1
     74c:	00f70a63          	beq	a4,a5,760 <go+0x698>
          printf("grind: pipe read failed\n");
     750:	00001517          	auipc	a0,0x1
     754:	60850513          	addi	a0,a0,1544 # 1d58 <malloc+0x2ce>
     758:	00001097          	auipc	ra,0x1
     75c:	140080e7          	jalr	320(ra) # 1898 <printf>
        exit(0);
     760:	4501                	li	a0,0
     762:	00001097          	auipc	ra,0x1
     766:	c00080e7          	jalr	-1024(ra) # 1362 <exit>
      } else if(pid < 0){
     76a:	fc042783          	lw	a5,-64(s0)
     76e:	2781                	sext.w	a5,a5
     770:	0007df63          	bgez	a5,78e <go+0x6c6>
        printf("grind: fork failed\n");
     774:	00001517          	auipc	a0,0x1
     778:	55c50513          	addi	a0,a0,1372 # 1cd0 <malloc+0x246>
     77c:	00001097          	auipc	ra,0x1
     780:	11c080e7          	jalr	284(ra) # 1898 <printf>
        exit(1);
     784:	4505                	li	a0,1
     786:	00001097          	auipc	ra,0x1
     78a:	bdc080e7          	jalr	-1060(ra) # 1362 <exit>
      }
      close(fds[0]);
     78e:	fa842783          	lw	a5,-88(s0)
     792:	853e                	mv	a0,a5
     794:	00001097          	auipc	ra,0x1
     798:	bf6080e7          	jalr	-1034(ra) # 138a <close>
      close(fds[1]);
     79c:	fac42783          	lw	a5,-84(s0)
     7a0:	853e                	mv	a0,a5
     7a2:	00001097          	auipc	ra,0x1
     7a6:	be8080e7          	jalr	-1048(ra) # 138a <close>
      wait(0);
     7aa:	4501                	li	a0,0
     7ac:	00001097          	auipc	ra,0x1
     7b0:	bbe080e7          	jalr	-1090(ra) # 136a <wait>
     7b4:	b261                	j	13c <go+0x74>
    } else if(what == 20){
     7b6:	fd442783          	lw	a5,-44(s0)
     7ba:	0007871b          	sext.w	a4,a5
     7be:	47d1                	li	a5,20
     7c0:	0af71f63          	bne	a4,a5,87e <go+0x7b6>
      int pid = fork();
     7c4:	00001097          	auipc	ra,0x1
     7c8:	b96080e7          	jalr	-1130(ra) # 135a <fork>
     7cc:	87aa                	mv	a5,a0
     7ce:	fcf42223          	sw	a5,-60(s0)
      if(pid == 0){
     7d2:	fc442783          	lw	a5,-60(s0)
     7d6:	2781                	sext.w	a5,a5
     7d8:	ebbd                	bnez	a5,84e <go+0x786>
        unlink("a");
     7da:	00001517          	auipc	a0,0x1
     7de:	50e50513          	addi	a0,a0,1294 # 1ce8 <malloc+0x25e>
     7e2:	00001097          	auipc	ra,0x1
     7e6:	bd0080e7          	jalr	-1072(ra) # 13b2 <unlink>
        mkdir("a");
     7ea:	00001517          	auipc	a0,0x1
     7ee:	4fe50513          	addi	a0,a0,1278 # 1ce8 <malloc+0x25e>
     7f2:	00001097          	auipc	ra,0x1
     7f6:	bd8080e7          	jalr	-1064(ra) # 13ca <mkdir>
        chdir("a");
     7fa:	00001517          	auipc	a0,0x1
     7fe:	4ee50513          	addi	a0,a0,1262 # 1ce8 <malloc+0x25e>
     802:	00001097          	auipc	ra,0x1
     806:	bd0080e7          	jalr	-1072(ra) # 13d2 <chdir>
        unlink("../a");
     80a:	00001517          	auipc	a0,0x1
     80e:	56e50513          	addi	a0,a0,1390 # 1d78 <malloc+0x2ee>
     812:	00001097          	auipc	ra,0x1
     816:	ba0080e7          	jalr	-1120(ra) # 13b2 <unlink>
        fd = open("x", O_CREATE|O_RDWR);
     81a:	20200593          	li	a1,514
     81e:	00001517          	auipc	a0,0x1
     822:	51250513          	addi	a0,a0,1298 # 1d30 <malloc+0x2a6>
     826:	00001097          	auipc	ra,0x1
     82a:	b7c080e7          	jalr	-1156(ra) # 13a2 <open>
     82e:	87aa                	mv	a5,a0
     830:	fef42623          	sw	a5,-20(s0)
        unlink("x");
     834:	00001517          	auipc	a0,0x1
     838:	4fc50513          	addi	a0,a0,1276 # 1d30 <malloc+0x2a6>
     83c:	00001097          	auipc	ra,0x1
     840:	b76080e7          	jalr	-1162(ra) # 13b2 <unlink>
        exit(0);
     844:	4501                	li	a0,0
     846:	00001097          	auipc	ra,0x1
     84a:	b1c080e7          	jalr	-1252(ra) # 1362 <exit>
      } else if(pid < 0){
     84e:	fc442783          	lw	a5,-60(s0)
     852:	2781                	sext.w	a5,a5
     854:	0007df63          	bgez	a5,872 <go+0x7aa>
        printf("grind: fork failed\n");
     858:	00001517          	auipc	a0,0x1
     85c:	47850513          	addi	a0,a0,1144 # 1cd0 <malloc+0x246>
     860:	00001097          	auipc	ra,0x1
     864:	038080e7          	jalr	56(ra) # 1898 <printf>
        exit(1);
     868:	4505                	li	a0,1
     86a:	00001097          	auipc	ra,0x1
     86e:	af8080e7          	jalr	-1288(ra) # 1362 <exit>
      }
      wait(0);
     872:	4501                	li	a0,0
     874:	00001097          	auipc	ra,0x1
     878:	af6080e7          	jalr	-1290(ra) # 136a <wait>
     87c:	b0c1                	j	13c <go+0x74>
    } else if(what == 21){
     87e:	fd442783          	lw	a5,-44(s0)
     882:	0007871b          	sext.w	a4,a5
     886:	47d5                	li	a5,21
     888:	12f71e63          	bne	a4,a5,9c4 <go+0x8fc>
      unlink("c");
     88c:	00001517          	auipc	a0,0x1
     890:	4f450513          	addi	a0,a0,1268 # 1d80 <malloc+0x2f6>
     894:	00001097          	auipc	ra,0x1
     898:	b1e080e7          	jalr	-1250(ra) # 13b2 <unlink>
      // should always succeed. check that there are free i-nodes,
      // file descriptors, blocks.
      int fd1 = open("c", O_CREATE|O_RDWR);
     89c:	20200593          	li	a1,514
     8a0:	00001517          	auipc	a0,0x1
     8a4:	4e050513          	addi	a0,a0,1248 # 1d80 <malloc+0x2f6>
     8a8:	00001097          	auipc	ra,0x1
     8ac:	afa080e7          	jalr	-1286(ra) # 13a2 <open>
     8b0:	87aa                	mv	a5,a0
     8b2:	fcf42423          	sw	a5,-56(s0)
      if(fd1 < 0){
     8b6:	fc842783          	lw	a5,-56(s0)
     8ba:	2781                	sext.w	a5,a5
     8bc:	0007df63          	bgez	a5,8da <go+0x812>
        printf("grind: create c failed\n");
     8c0:	00001517          	auipc	a0,0x1
     8c4:	4c850513          	addi	a0,a0,1224 # 1d88 <malloc+0x2fe>
     8c8:	00001097          	auipc	ra,0x1
     8cc:	fd0080e7          	jalr	-48(ra) # 1898 <printf>
        exit(1);
     8d0:	4505                	li	a0,1
     8d2:	00001097          	auipc	ra,0x1
     8d6:	a90080e7          	jalr	-1392(ra) # 1362 <exit>
      }
      if(write(fd1, "x", 1) != 1){
     8da:	fc842783          	lw	a5,-56(s0)
     8de:	4605                	li	a2,1
     8e0:	00001597          	auipc	a1,0x1
     8e4:	45058593          	addi	a1,a1,1104 # 1d30 <malloc+0x2a6>
     8e8:	853e                	mv	a0,a5
     8ea:	00001097          	auipc	ra,0x1
     8ee:	a98080e7          	jalr	-1384(ra) # 1382 <write>
     8f2:	87aa                	mv	a5,a0
     8f4:	873e                	mv	a4,a5
     8f6:	4785                	li	a5,1
     8f8:	00f70f63          	beq	a4,a5,916 <go+0x84e>
        printf("grind: write c failed\n");
     8fc:	00001517          	auipc	a0,0x1
     900:	4a450513          	addi	a0,a0,1188 # 1da0 <malloc+0x316>
     904:	00001097          	auipc	ra,0x1
     908:	f94080e7          	jalr	-108(ra) # 1898 <printf>
        exit(1);
     90c:	4505                	li	a0,1
     90e:	00001097          	auipc	ra,0x1
     912:	a54080e7          	jalr	-1452(ra) # 1362 <exit>
      }
      struct stat st;
      if(fstat(fd1, &st) != 0){
     916:	f8840713          	addi	a4,s0,-120
     91a:	fc842783          	lw	a5,-56(s0)
     91e:	85ba                	mv	a1,a4
     920:	853e                	mv	a0,a5
     922:	00001097          	auipc	ra,0x1
     926:	a98080e7          	jalr	-1384(ra) # 13ba <fstat>
     92a:	87aa                	mv	a5,a0
     92c:	cf91                	beqz	a5,948 <go+0x880>
        printf("grind: fstat failed\n");
     92e:	00001517          	auipc	a0,0x1
     932:	48a50513          	addi	a0,a0,1162 # 1db8 <malloc+0x32e>
     936:	00001097          	auipc	ra,0x1
     93a:	f62080e7          	jalr	-158(ra) # 1898 <printf>
        exit(1);
     93e:	4505                	li	a0,1
     940:	00001097          	auipc	ra,0x1
     944:	a22080e7          	jalr	-1502(ra) # 1362 <exit>
      }
      if(st.size != 1){
     948:	f9843703          	ld	a4,-104(s0)
     94c:	4785                	li	a5,1
     94e:	02f70363          	beq	a4,a5,974 <go+0x8ac>
        printf("grind: fstat reports wrong size %d\n", (int)st.size);
     952:	f9843783          	ld	a5,-104(s0)
     956:	2781                	sext.w	a5,a5
     958:	85be                	mv	a1,a5
     95a:	00001517          	auipc	a0,0x1
     95e:	47650513          	addi	a0,a0,1142 # 1dd0 <malloc+0x346>
     962:	00001097          	auipc	ra,0x1
     966:	f36080e7          	jalr	-202(ra) # 1898 <printf>
        exit(1);
     96a:	4505                	li	a0,1
     96c:	00001097          	auipc	ra,0x1
     970:	9f6080e7          	jalr	-1546(ra) # 1362 <exit>
      }
      if(st.ino > 200){
     974:	f8c42783          	lw	a5,-116(s0)
     978:	873e                	mv	a4,a5
     97a:	0c800793          	li	a5,200
     97e:	02e7f263          	bgeu	a5,a4,9a2 <go+0x8da>
        printf("grind: fstat reports crazy i-number %d\n", st.ino);
     982:	f8c42783          	lw	a5,-116(s0)
     986:	85be                	mv	a1,a5
     988:	00001517          	auipc	a0,0x1
     98c:	47050513          	addi	a0,a0,1136 # 1df8 <malloc+0x36e>
     990:	00001097          	auipc	ra,0x1
     994:	f08080e7          	jalr	-248(ra) # 1898 <printf>
        exit(1);
     998:	4505                	li	a0,1
     99a:	00001097          	auipc	ra,0x1
     99e:	9c8080e7          	jalr	-1592(ra) # 1362 <exit>
      }
      close(fd1);
     9a2:	fc842783          	lw	a5,-56(s0)
     9a6:	853e                	mv	a0,a5
     9a8:	00001097          	auipc	ra,0x1
     9ac:	9e2080e7          	jalr	-1566(ra) # 138a <close>
      unlink("c");
     9b0:	00001517          	auipc	a0,0x1
     9b4:	3d050513          	addi	a0,a0,976 # 1d80 <malloc+0x2f6>
     9b8:	00001097          	auipc	ra,0x1
     9bc:	9fa080e7          	jalr	-1542(ra) # 13b2 <unlink>
     9c0:	f7cff06f          	j	13c <go+0x74>
    } else if(what == 22){
     9c4:	fd442783          	lw	a5,-44(s0)
     9c8:	0007871b          	sext.w	a4,a5
     9cc:	47d9                	li	a5,22
     9ce:	f6f71763          	bne	a4,a5,13c <go+0x74>
      // echo hi | cat
      int aa[2], bb[2];
      if(pipe(aa) < 0){
     9d2:	f8040793          	addi	a5,s0,-128
     9d6:	853e                	mv	a0,a5
     9d8:	00001097          	auipc	ra,0x1
     9dc:	99a080e7          	jalr	-1638(ra) # 1372 <pipe>
     9e0:	87aa                	mv	a5,a0
     9e2:	0207d063          	bgez	a5,a02 <go+0x93a>
        fprintf(2, "grind: pipe failed\n");
     9e6:	00001597          	auipc	a1,0x1
     9ea:	33258593          	addi	a1,a1,818 # 1d18 <malloc+0x28e>
     9ee:	4509                	li	a0,2
     9f0:	00001097          	auipc	ra,0x1
     9f4:	e50080e7          	jalr	-432(ra) # 1840 <fprintf>
        exit(1);
     9f8:	4505                	li	a0,1
     9fa:	00001097          	auipc	ra,0x1
     9fe:	968080e7          	jalr	-1688(ra) # 1362 <exit>
      }
      if(pipe(bb) < 0){
     a02:	f7840793          	addi	a5,s0,-136
     a06:	853e                	mv	a0,a5
     a08:	00001097          	auipc	ra,0x1
     a0c:	96a080e7          	jalr	-1686(ra) # 1372 <pipe>
     a10:	87aa                	mv	a5,a0
     a12:	0207d063          	bgez	a5,a32 <go+0x96a>
        fprintf(2, "grind: pipe failed\n");
     a16:	00001597          	auipc	a1,0x1
     a1a:	30258593          	addi	a1,a1,770 # 1d18 <malloc+0x28e>
     a1e:	4509                	li	a0,2
     a20:	00001097          	auipc	ra,0x1
     a24:	e20080e7          	jalr	-480(ra) # 1840 <fprintf>
        exit(1);
     a28:	4505                	li	a0,1
     a2a:	00001097          	auipc	ra,0x1
     a2e:	938080e7          	jalr	-1736(ra) # 1362 <exit>
      }
      int pid1 = fork();
     a32:	00001097          	auipc	ra,0x1
     a36:	928080e7          	jalr	-1752(ra) # 135a <fork>
     a3a:	87aa                	mv	a5,a0
     a3c:	fcf42823          	sw	a5,-48(s0)
      if(pid1 == 0){
     a40:	fd042783          	lw	a5,-48(s0)
     a44:	2781                	sext.w	a5,a5
     a46:	e3f9                	bnez	a5,b0c <go+0xa44>
        close(bb[0]);
     a48:	f7842783          	lw	a5,-136(s0)
     a4c:	853e                	mv	a0,a5
     a4e:	00001097          	auipc	ra,0x1
     a52:	93c080e7          	jalr	-1732(ra) # 138a <close>
        close(bb[1]);
     a56:	f7c42783          	lw	a5,-132(s0)
     a5a:	853e                	mv	a0,a5
     a5c:	00001097          	auipc	ra,0x1
     a60:	92e080e7          	jalr	-1746(ra) # 138a <close>
        close(aa[0]);
     a64:	f8042783          	lw	a5,-128(s0)
     a68:	853e                	mv	a0,a5
     a6a:	00001097          	auipc	ra,0x1
     a6e:	920080e7          	jalr	-1760(ra) # 138a <close>
        close(1);
     a72:	4505                	li	a0,1
     a74:	00001097          	auipc	ra,0x1
     a78:	916080e7          	jalr	-1770(ra) # 138a <close>
        if(dup(aa[1]) != 1){
     a7c:	f8442783          	lw	a5,-124(s0)
     a80:	853e                	mv	a0,a5
     a82:	00001097          	auipc	ra,0x1
     a86:	958080e7          	jalr	-1704(ra) # 13da <dup>
     a8a:	87aa                	mv	a5,a0
     a8c:	873e                	mv	a4,a5
     a8e:	4785                	li	a5,1
     a90:	02f70063          	beq	a4,a5,ab0 <go+0x9e8>
          fprintf(2, "grind: dup failed\n");
     a94:	00001597          	auipc	a1,0x1
     a98:	38c58593          	addi	a1,a1,908 # 1e20 <malloc+0x396>
     a9c:	4509                	li	a0,2
     a9e:	00001097          	auipc	ra,0x1
     aa2:	da2080e7          	jalr	-606(ra) # 1840 <fprintf>
          exit(1);
     aa6:	4505                	li	a0,1
     aa8:	00001097          	auipc	ra,0x1
     aac:	8ba080e7          	jalr	-1862(ra) # 1362 <exit>
        }
        close(aa[1]);
     ab0:	f8442783          	lw	a5,-124(s0)
     ab4:	853e                	mv	a0,a5
     ab6:	00001097          	auipc	ra,0x1
     aba:	8d4080e7          	jalr	-1836(ra) # 138a <close>
        char *args[3] = { "echo", "hi", 0 };
     abe:	00001797          	auipc	a5,0x1
     ac2:	37a78793          	addi	a5,a5,890 # 1e38 <malloc+0x3ae>
     ac6:	f4f43823          	sd	a5,-176(s0)
     aca:	00001797          	auipc	a5,0x1
     ace:	37678793          	addi	a5,a5,886 # 1e40 <malloc+0x3b6>
     ad2:	f4f43c23          	sd	a5,-168(s0)
     ad6:	f6043023          	sd	zero,-160(s0)
        exec("grindir/../echo", args);
     ada:	f5040793          	addi	a5,s0,-176
     ade:	85be                	mv	a1,a5
     ae0:	00001517          	auipc	a0,0x1
     ae4:	36850513          	addi	a0,a0,872 # 1e48 <malloc+0x3be>
     ae8:	00001097          	auipc	ra,0x1
     aec:	8b2080e7          	jalr	-1870(ra) # 139a <exec>
        fprintf(2, "grind: echo: not found\n");
     af0:	00001597          	auipc	a1,0x1
     af4:	36858593          	addi	a1,a1,872 # 1e58 <malloc+0x3ce>
     af8:	4509                	li	a0,2
     afa:	00001097          	auipc	ra,0x1
     afe:	d46080e7          	jalr	-698(ra) # 1840 <fprintf>
        exit(2);
     b02:	4509                	li	a0,2
     b04:	00001097          	auipc	ra,0x1
     b08:	85e080e7          	jalr	-1954(ra) # 1362 <exit>
      } else if(pid1 < 0){
     b0c:	fd042783          	lw	a5,-48(s0)
     b10:	2781                	sext.w	a5,a5
     b12:	0207d063          	bgez	a5,b32 <go+0xa6a>
        fprintf(2, "grind: fork failed\n");
     b16:	00001597          	auipc	a1,0x1
     b1a:	1ba58593          	addi	a1,a1,442 # 1cd0 <malloc+0x246>
     b1e:	4509                	li	a0,2
     b20:	00001097          	auipc	ra,0x1
     b24:	d20080e7          	jalr	-736(ra) # 1840 <fprintf>
        exit(3);
     b28:	450d                	li	a0,3
     b2a:	00001097          	auipc	ra,0x1
     b2e:	838080e7          	jalr	-1992(ra) # 1362 <exit>
      }
      int pid2 = fork();
     b32:	00001097          	auipc	ra,0x1
     b36:	828080e7          	jalr	-2008(ra) # 135a <fork>
     b3a:	87aa                	mv	a5,a0
     b3c:	fcf42623          	sw	a5,-52(s0)
      if(pid2 == 0){
     b40:	fcc42783          	lw	a5,-52(s0)
     b44:	2781                	sext.w	a5,a5
     b46:	ebed                	bnez	a5,c38 <go+0xb70>
        close(aa[1]);
     b48:	f8442783          	lw	a5,-124(s0)
     b4c:	853e                	mv	a0,a5
     b4e:	00001097          	auipc	ra,0x1
     b52:	83c080e7          	jalr	-1988(ra) # 138a <close>
        close(bb[0]);
     b56:	f7842783          	lw	a5,-136(s0)
     b5a:	853e                	mv	a0,a5
     b5c:	00001097          	auipc	ra,0x1
     b60:	82e080e7          	jalr	-2002(ra) # 138a <close>
        close(0);
     b64:	4501                	li	a0,0
     b66:	00001097          	auipc	ra,0x1
     b6a:	824080e7          	jalr	-2012(ra) # 138a <close>
        if(dup(aa[0]) != 0){
     b6e:	f8042783          	lw	a5,-128(s0)
     b72:	853e                	mv	a0,a5
     b74:	00001097          	auipc	ra,0x1
     b78:	866080e7          	jalr	-1946(ra) # 13da <dup>
     b7c:	87aa                	mv	a5,a0
     b7e:	cf99                	beqz	a5,b9c <go+0xad4>
          fprintf(2, "grind: dup failed\n");
     b80:	00001597          	auipc	a1,0x1
     b84:	2a058593          	addi	a1,a1,672 # 1e20 <malloc+0x396>
     b88:	4509                	li	a0,2
     b8a:	00001097          	auipc	ra,0x1
     b8e:	cb6080e7          	jalr	-842(ra) # 1840 <fprintf>
          exit(4);
     b92:	4511                	li	a0,4
     b94:	00000097          	auipc	ra,0x0
     b98:	7ce080e7          	jalr	1998(ra) # 1362 <exit>
        }
        close(aa[0]);
     b9c:	f8042783          	lw	a5,-128(s0)
     ba0:	853e                	mv	a0,a5
     ba2:	00000097          	auipc	ra,0x0
     ba6:	7e8080e7          	jalr	2024(ra) # 138a <close>
        close(1);
     baa:	4505                	li	a0,1
     bac:	00000097          	auipc	ra,0x0
     bb0:	7de080e7          	jalr	2014(ra) # 138a <close>
        if(dup(bb[1]) != 1){
     bb4:	f7c42783          	lw	a5,-132(s0)
     bb8:	853e                	mv	a0,a5
     bba:	00001097          	auipc	ra,0x1
     bbe:	820080e7          	jalr	-2016(ra) # 13da <dup>
     bc2:	87aa                	mv	a5,a0
     bc4:	873e                	mv	a4,a5
     bc6:	4785                	li	a5,1
     bc8:	02f70063          	beq	a4,a5,be8 <go+0xb20>
          fprintf(2, "grind: dup failed\n");
     bcc:	00001597          	auipc	a1,0x1
     bd0:	25458593          	addi	a1,a1,596 # 1e20 <malloc+0x396>
     bd4:	4509                	li	a0,2
     bd6:	00001097          	auipc	ra,0x1
     bda:	c6a080e7          	jalr	-918(ra) # 1840 <fprintf>
          exit(5);
     bde:	4515                	li	a0,5
     be0:	00000097          	auipc	ra,0x0
     be4:	782080e7          	jalr	1922(ra) # 1362 <exit>
        }
        close(bb[1]);
     be8:	f7c42783          	lw	a5,-132(s0)
     bec:	853e                	mv	a0,a5
     bee:	00000097          	auipc	ra,0x0
     bf2:	79c080e7          	jalr	1948(ra) # 138a <close>
        char *args[2] = { "cat", 0 };
     bf6:	00001797          	auipc	a5,0x1
     bfa:	27a78793          	addi	a5,a5,634 # 1e70 <malloc+0x3e6>
     bfe:	f4f43023          	sd	a5,-192(s0)
     c02:	f4043423          	sd	zero,-184(s0)
        exec("/cat", args);
     c06:	f4040793          	addi	a5,s0,-192
     c0a:	85be                	mv	a1,a5
     c0c:	00001517          	auipc	a0,0x1
     c10:	26c50513          	addi	a0,a0,620 # 1e78 <malloc+0x3ee>
     c14:	00000097          	auipc	ra,0x0
     c18:	786080e7          	jalr	1926(ra) # 139a <exec>
        fprintf(2, "grind: cat: not found\n");
     c1c:	00001597          	auipc	a1,0x1
     c20:	26458593          	addi	a1,a1,612 # 1e80 <malloc+0x3f6>
     c24:	4509                	li	a0,2
     c26:	00001097          	auipc	ra,0x1
     c2a:	c1a080e7          	jalr	-998(ra) # 1840 <fprintf>
        exit(6);
     c2e:	4519                	li	a0,6
     c30:	00000097          	auipc	ra,0x0
     c34:	732080e7          	jalr	1842(ra) # 1362 <exit>
      } else if(pid2 < 0){
     c38:	fcc42783          	lw	a5,-52(s0)
     c3c:	2781                	sext.w	a5,a5
     c3e:	0207d063          	bgez	a5,c5e <go+0xb96>
        fprintf(2, "grind: fork failed\n");
     c42:	00001597          	auipc	a1,0x1
     c46:	08e58593          	addi	a1,a1,142 # 1cd0 <malloc+0x246>
     c4a:	4509                	li	a0,2
     c4c:	00001097          	auipc	ra,0x1
     c50:	bf4080e7          	jalr	-1036(ra) # 1840 <fprintf>
        exit(7);
     c54:	451d                	li	a0,7
     c56:	00000097          	auipc	ra,0x0
     c5a:	70c080e7          	jalr	1804(ra) # 1362 <exit>
      }
      close(aa[0]);
     c5e:	f8042783          	lw	a5,-128(s0)
     c62:	853e                	mv	a0,a5
     c64:	00000097          	auipc	ra,0x0
     c68:	726080e7          	jalr	1830(ra) # 138a <close>
      close(aa[1]);
     c6c:	f8442783          	lw	a5,-124(s0)
     c70:	853e                	mv	a0,a5
     c72:	00000097          	auipc	ra,0x0
     c76:	718080e7          	jalr	1816(ra) # 138a <close>
      close(bb[1]);
     c7a:	f7c42783          	lw	a5,-132(s0)
     c7e:	853e                	mv	a0,a5
     c80:	00000097          	auipc	ra,0x0
     c84:	70a080e7          	jalr	1802(ra) # 138a <close>
      char buf[4] = { 0, 0, 0, 0 };
     c88:	f6042823          	sw	zero,-144(s0)
      read(bb[0], buf+0, 1);
     c8c:	f7842783          	lw	a5,-136(s0)
     c90:	f7040713          	addi	a4,s0,-144
     c94:	4605                	li	a2,1
     c96:	85ba                	mv	a1,a4
     c98:	853e                	mv	a0,a5
     c9a:	00000097          	auipc	ra,0x0
     c9e:	6e0080e7          	jalr	1760(ra) # 137a <read>
      read(bb[0], buf+1, 1);
     ca2:	f7842703          	lw	a4,-136(s0)
     ca6:	f7040793          	addi	a5,s0,-144
     caa:	0785                	addi	a5,a5,1
     cac:	4605                	li	a2,1
     cae:	85be                	mv	a1,a5
     cb0:	853a                	mv	a0,a4
     cb2:	00000097          	auipc	ra,0x0
     cb6:	6c8080e7          	jalr	1736(ra) # 137a <read>
      read(bb[0], buf+2, 1);
     cba:	f7842703          	lw	a4,-136(s0)
     cbe:	f7040793          	addi	a5,s0,-144
     cc2:	0789                	addi	a5,a5,2
     cc4:	4605                	li	a2,1
     cc6:	85be                	mv	a1,a5
     cc8:	853a                	mv	a0,a4
     cca:	00000097          	auipc	ra,0x0
     cce:	6b0080e7          	jalr	1712(ra) # 137a <read>
      close(bb[0]);
     cd2:	f7842783          	lw	a5,-136(s0)
     cd6:	853e                	mv	a0,a5
     cd8:	00000097          	auipc	ra,0x0
     cdc:	6b2080e7          	jalr	1714(ra) # 138a <close>
      int st1, st2;
      wait(&st1);
     ce0:	f6c40793          	addi	a5,s0,-148
     ce4:	853e                	mv	a0,a5
     ce6:	00000097          	auipc	ra,0x0
     cea:	684080e7          	jalr	1668(ra) # 136a <wait>
      wait(&st2);
     cee:	f6840793          	addi	a5,s0,-152
     cf2:	853e                	mv	a0,a5
     cf4:	00000097          	auipc	ra,0x0
     cf8:	676080e7          	jalr	1654(ra) # 136a <wait>
      if(st1 != 0 || st2 != 0 || strcmp(buf, "hi\n") != 0){
     cfc:	f6c42783          	lw	a5,-148(s0)
     d00:	e395                	bnez	a5,d24 <go+0xc5c>
     d02:	f6842783          	lw	a5,-152(s0)
     d06:	ef99                	bnez	a5,d24 <go+0xc5c>
     d08:	f7040793          	addi	a5,s0,-144
     d0c:	00001597          	auipc	a1,0x1
     d10:	18c58593          	addi	a1,a1,396 # 1e98 <malloc+0x40e>
     d14:	853e                	mv	a0,a5
     d16:	00000097          	auipc	ra,0x0
     d1a:	206080e7          	jalr	518(ra) # f1c <strcmp>
     d1e:	87aa                	mv	a5,a0
     d20:	c0078e63          	beqz	a5,13c <go+0x74>
        printf("grind: exec pipeline failed %d %d \"%s\"\n", st1, st2, buf);
     d24:	f6c42783          	lw	a5,-148(s0)
     d28:	f6842703          	lw	a4,-152(s0)
     d2c:	f7040693          	addi	a3,s0,-144
     d30:	863a                	mv	a2,a4
     d32:	85be                	mv	a1,a5
     d34:	00001517          	auipc	a0,0x1
     d38:	16c50513          	addi	a0,a0,364 # 1ea0 <malloc+0x416>
     d3c:	00001097          	auipc	ra,0x1
     d40:	b5c080e7          	jalr	-1188(ra) # 1898 <printf>
        exit(1);
     d44:	4505                	li	a0,1
     d46:	00000097          	auipc	ra,0x0
     d4a:	61c080e7          	jalr	1564(ra) # 1362 <exit>

0000000000000d4e <iter>:
  }
}

void
iter()
{
     d4e:	1101                	addi	sp,sp,-32
     d50:	ec06                	sd	ra,24(sp)
     d52:	e822                	sd	s0,16(sp)
     d54:	1000                	addi	s0,sp,32
  unlink("a");
     d56:	00001517          	auipc	a0,0x1
     d5a:	f9250513          	addi	a0,a0,-110 # 1ce8 <malloc+0x25e>
     d5e:	00000097          	auipc	ra,0x0
     d62:	654080e7          	jalr	1620(ra) # 13b2 <unlink>
  unlink("b");
     d66:	00001517          	auipc	a0,0x1
     d6a:	f3250513          	addi	a0,a0,-206 # 1c98 <malloc+0x20e>
     d6e:	00000097          	auipc	ra,0x0
     d72:	644080e7          	jalr	1604(ra) # 13b2 <unlink>
  
  int pid1 = fork();
     d76:	00000097          	auipc	ra,0x0
     d7a:	5e4080e7          	jalr	1508(ra) # 135a <fork>
     d7e:	87aa                	mv	a5,a0
     d80:	fef42623          	sw	a5,-20(s0)
  if(pid1 < 0){
     d84:	fec42783          	lw	a5,-20(s0)
     d88:	2781                	sext.w	a5,a5
     d8a:	0007df63          	bgez	a5,da8 <iter+0x5a>
    printf("grind: fork failed\n");
     d8e:	00001517          	auipc	a0,0x1
     d92:	f4250513          	addi	a0,a0,-190 # 1cd0 <malloc+0x246>
     d96:	00001097          	auipc	ra,0x1
     d9a:	b02080e7          	jalr	-1278(ra) # 1898 <printf>
    exit(1);
     d9e:	4505                	li	a0,1
     da0:	00000097          	auipc	ra,0x0
     da4:	5c2080e7          	jalr	1474(ra) # 1362 <exit>
  }
  if(pid1 == 0){
     da8:	fec42783          	lw	a5,-20(s0)
     dac:	2781                	sext.w	a5,a5
     dae:	e38d                	bnez	a5,dd0 <iter+0x82>
    rand_next = 31;
     db0:	00001797          	auipc	a5,0x1
     db4:	13878793          	addi	a5,a5,312 # 1ee8 <rand_next>
     db8:	477d                	li	a4,31
     dba:	e398                	sd	a4,0(a5)
    go(0);
     dbc:	4501                	li	a0,0
     dbe:	fffff097          	auipc	ra,0xfffff
     dc2:	30a080e7          	jalr	778(ra) # c8 <go>
    exit(0);
     dc6:	4501                	li	a0,0
     dc8:	00000097          	auipc	ra,0x0
     dcc:	59a080e7          	jalr	1434(ra) # 1362 <exit>
  }

  int pid2 = fork();
     dd0:	00000097          	auipc	ra,0x0
     dd4:	58a080e7          	jalr	1418(ra) # 135a <fork>
     dd8:	87aa                	mv	a5,a0
     dda:	fef42423          	sw	a5,-24(s0)
  if(pid2 < 0){
     dde:	fe842783          	lw	a5,-24(s0)
     de2:	2781                	sext.w	a5,a5
     de4:	0007df63          	bgez	a5,e02 <iter+0xb4>
    printf("grind: fork failed\n");
     de8:	00001517          	auipc	a0,0x1
     dec:	ee850513          	addi	a0,a0,-280 # 1cd0 <malloc+0x246>
     df0:	00001097          	auipc	ra,0x1
     df4:	aa8080e7          	jalr	-1368(ra) # 1898 <printf>
    exit(1);
     df8:	4505                	li	a0,1
     dfa:	00000097          	auipc	ra,0x0
     dfe:	568080e7          	jalr	1384(ra) # 1362 <exit>
  }
  if(pid2 == 0){
     e02:	fe842783          	lw	a5,-24(s0)
     e06:	2781                	sext.w	a5,a5
     e08:	e39d                	bnez	a5,e2e <iter+0xe0>
    rand_next = 7177;
     e0a:	00001797          	auipc	a5,0x1
     e0e:	0de78793          	addi	a5,a5,222 # 1ee8 <rand_next>
     e12:	6709                	lui	a4,0x2
     e14:	c0970713          	addi	a4,a4,-1015 # 1c09 <malloc+0x17f>
     e18:	e398                	sd	a4,0(a5)
    go(1);
     e1a:	4505                	li	a0,1
     e1c:	fffff097          	auipc	ra,0xfffff
     e20:	2ac080e7          	jalr	684(ra) # c8 <go>
    exit(0);
     e24:	4501                	li	a0,0
     e26:	00000097          	auipc	ra,0x0
     e2a:	53c080e7          	jalr	1340(ra) # 1362 <exit>
  }

  int st1 = -1;
     e2e:	57fd                	li	a5,-1
     e30:	fef42223          	sw	a5,-28(s0)
  wait(&st1);
     e34:	fe440793          	addi	a5,s0,-28
     e38:	853e                	mv	a0,a5
     e3a:	00000097          	auipc	ra,0x0
     e3e:	530080e7          	jalr	1328(ra) # 136a <wait>
  if(st1 != 0){
     e42:	fe442783          	lw	a5,-28(s0)
     e46:	cf99                	beqz	a5,e64 <iter+0x116>
    kill(pid1);
     e48:	fec42783          	lw	a5,-20(s0)
     e4c:	853e                	mv	a0,a5
     e4e:	00000097          	auipc	ra,0x0
     e52:	544080e7          	jalr	1348(ra) # 1392 <kill>
    kill(pid2);
     e56:	fe842783          	lw	a5,-24(s0)
     e5a:	853e                	mv	a0,a5
     e5c:	00000097          	auipc	ra,0x0
     e60:	536080e7          	jalr	1334(ra) # 1392 <kill>
  }
  int st2 = -1;
     e64:	57fd                	li	a5,-1
     e66:	fef42023          	sw	a5,-32(s0)
  wait(&st2);
     e6a:	fe040793          	addi	a5,s0,-32
     e6e:	853e                	mv	a0,a5
     e70:	00000097          	auipc	ra,0x0
     e74:	4fa080e7          	jalr	1274(ra) # 136a <wait>

  exit(0);
     e78:	4501                	li	a0,0
     e7a:	00000097          	auipc	ra,0x0
     e7e:	4e8080e7          	jalr	1256(ra) # 1362 <exit>

0000000000000e82 <main>:
}

int
main()
{
     e82:	1101                	addi	sp,sp,-32
     e84:	ec06                	sd	ra,24(sp)
     e86:	e822                	sd	s0,16(sp)
     e88:	1000                	addi	s0,sp,32
  while(1){
    int pid = fork();
     e8a:	00000097          	auipc	ra,0x0
     e8e:	4d0080e7          	jalr	1232(ra) # 135a <fork>
     e92:	87aa                	mv	a5,a0
     e94:	fef42623          	sw	a5,-20(s0)
    if(pid == 0){
     e98:	fec42783          	lw	a5,-20(s0)
     e9c:	2781                	sext.w	a5,a5
     e9e:	eb91                	bnez	a5,eb2 <main+0x30>
      iter();
     ea0:	00000097          	auipc	ra,0x0
     ea4:	eae080e7          	jalr	-338(ra) # d4e <iter>
      exit(0);
     ea8:	4501                	li	a0,0
     eaa:	00000097          	auipc	ra,0x0
     eae:	4b8080e7          	jalr	1208(ra) # 1362 <exit>
    }
    if(pid > 0){
     eb2:	fec42783          	lw	a5,-20(s0)
     eb6:	2781                	sext.w	a5,a5
     eb8:	00f05763          	blez	a5,ec6 <main+0x44>
      wait(0);
     ebc:	4501                	li	a0,0
     ebe:	00000097          	auipc	ra,0x0
     ec2:	4ac080e7          	jalr	1196(ra) # 136a <wait>
    }
    sleep(20);
     ec6:	4551                	li	a0,20
     ec8:	00000097          	auipc	ra,0x0
     ecc:	52a080e7          	jalr	1322(ra) # 13f2 <sleep>
  while(1){
     ed0:	bf6d                	j	e8a <main+0x8>

0000000000000ed2 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     ed2:	7179                	addi	sp,sp,-48
     ed4:	f422                	sd	s0,40(sp)
     ed6:	1800                	addi	s0,sp,48
     ed8:	fca43c23          	sd	a0,-40(s0)
     edc:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     ee0:	fd843783          	ld	a5,-40(s0)
     ee4:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     ee8:	0001                	nop
     eea:	fd043703          	ld	a4,-48(s0)
     eee:	00170793          	addi	a5,a4,1
     ef2:	fcf43823          	sd	a5,-48(s0)
     ef6:	fd843783          	ld	a5,-40(s0)
     efa:	00178693          	addi	a3,a5,1
     efe:	fcd43c23          	sd	a3,-40(s0)
     f02:	00074703          	lbu	a4,0(a4)
     f06:	00e78023          	sb	a4,0(a5)
     f0a:	0007c783          	lbu	a5,0(a5)
     f0e:	fff1                	bnez	a5,eea <strcpy+0x18>
    ;
  return os;
     f10:	fe843783          	ld	a5,-24(s0)
}
     f14:	853e                	mv	a0,a5
     f16:	7422                	ld	s0,40(sp)
     f18:	6145                	addi	sp,sp,48
     f1a:	8082                	ret

0000000000000f1c <strcmp>:

int
strcmp(const char *p, const char *q)
{
     f1c:	1101                	addi	sp,sp,-32
     f1e:	ec22                	sd	s0,24(sp)
     f20:	1000                	addi	s0,sp,32
     f22:	fea43423          	sd	a0,-24(s0)
     f26:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     f2a:	a819                	j	f40 <strcmp+0x24>
    p++, q++;
     f2c:	fe843783          	ld	a5,-24(s0)
     f30:	0785                	addi	a5,a5,1
     f32:	fef43423          	sd	a5,-24(s0)
     f36:	fe043783          	ld	a5,-32(s0)
     f3a:	0785                	addi	a5,a5,1
     f3c:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     f40:	fe843783          	ld	a5,-24(s0)
     f44:	0007c783          	lbu	a5,0(a5)
     f48:	cb99                	beqz	a5,f5e <strcmp+0x42>
     f4a:	fe843783          	ld	a5,-24(s0)
     f4e:	0007c703          	lbu	a4,0(a5)
     f52:	fe043783          	ld	a5,-32(s0)
     f56:	0007c783          	lbu	a5,0(a5)
     f5a:	fcf709e3          	beq	a4,a5,f2c <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     f5e:	fe843783          	ld	a5,-24(s0)
     f62:	0007c783          	lbu	a5,0(a5)
     f66:	0007871b          	sext.w	a4,a5
     f6a:	fe043783          	ld	a5,-32(s0)
     f6e:	0007c783          	lbu	a5,0(a5)
     f72:	2781                	sext.w	a5,a5
     f74:	40f707bb          	subw	a5,a4,a5
     f78:	2781                	sext.w	a5,a5
}
     f7a:	853e                	mv	a0,a5
     f7c:	6462                	ld	s0,24(sp)
     f7e:	6105                	addi	sp,sp,32
     f80:	8082                	ret

0000000000000f82 <strlen>:

uint
strlen(const char *s)
{
     f82:	7179                	addi	sp,sp,-48
     f84:	f422                	sd	s0,40(sp)
     f86:	1800                	addi	s0,sp,48
     f88:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     f8c:	fe042623          	sw	zero,-20(s0)
     f90:	a031                	j	f9c <strlen+0x1a>
     f92:	fec42783          	lw	a5,-20(s0)
     f96:	2785                	addiw	a5,a5,1
     f98:	fef42623          	sw	a5,-20(s0)
     f9c:	fec42783          	lw	a5,-20(s0)
     fa0:	fd843703          	ld	a4,-40(s0)
     fa4:	97ba                	add	a5,a5,a4
     fa6:	0007c783          	lbu	a5,0(a5)
     faa:	f7e5                	bnez	a5,f92 <strlen+0x10>
    ;
  return n;
     fac:	fec42783          	lw	a5,-20(s0)
}
     fb0:	853e                	mv	a0,a5
     fb2:	7422                	ld	s0,40(sp)
     fb4:	6145                	addi	sp,sp,48
     fb6:	8082                	ret

0000000000000fb8 <memset>:

void*
memset(void *dst, int c, uint n)
{
     fb8:	7179                	addi	sp,sp,-48
     fba:	f422                	sd	s0,40(sp)
     fbc:	1800                	addi	s0,sp,48
     fbe:	fca43c23          	sd	a0,-40(s0)
     fc2:	87ae                	mv	a5,a1
     fc4:	8732                	mv	a4,a2
     fc6:	fcf42a23          	sw	a5,-44(s0)
     fca:	87ba                	mv	a5,a4
     fcc:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     fd0:	fd843783          	ld	a5,-40(s0)
     fd4:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     fd8:	fe042623          	sw	zero,-20(s0)
     fdc:	a00d                	j	ffe <memset+0x46>
    cdst[i] = c;
     fde:	fec42783          	lw	a5,-20(s0)
     fe2:	fe043703          	ld	a4,-32(s0)
     fe6:	97ba                	add	a5,a5,a4
     fe8:	fd442703          	lw	a4,-44(s0)
     fec:	0ff77713          	andi	a4,a4,255
     ff0:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     ff4:	fec42783          	lw	a5,-20(s0)
     ff8:	2785                	addiw	a5,a5,1
     ffa:	fef42623          	sw	a5,-20(s0)
     ffe:	fec42703          	lw	a4,-20(s0)
    1002:	fd042783          	lw	a5,-48(s0)
    1006:	2781                	sext.w	a5,a5
    1008:	fcf76be3          	bltu	a4,a5,fde <memset+0x26>
  }
  return dst;
    100c:	fd843783          	ld	a5,-40(s0)
}
    1010:	853e                	mv	a0,a5
    1012:	7422                	ld	s0,40(sp)
    1014:	6145                	addi	sp,sp,48
    1016:	8082                	ret

0000000000001018 <strchr>:

char*
strchr(const char *s, char c)
{
    1018:	1101                	addi	sp,sp,-32
    101a:	ec22                	sd	s0,24(sp)
    101c:	1000                	addi	s0,sp,32
    101e:	fea43423          	sd	a0,-24(s0)
    1022:	87ae                	mv	a5,a1
    1024:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
    1028:	a01d                	j	104e <strchr+0x36>
    if(*s == c)
    102a:	fe843783          	ld	a5,-24(s0)
    102e:	0007c703          	lbu	a4,0(a5)
    1032:	fe744783          	lbu	a5,-25(s0)
    1036:	0ff7f793          	andi	a5,a5,255
    103a:	00e79563          	bne	a5,a4,1044 <strchr+0x2c>
      return (char*)s;
    103e:	fe843783          	ld	a5,-24(s0)
    1042:	a821                	j	105a <strchr+0x42>
  for(; *s; s++)
    1044:	fe843783          	ld	a5,-24(s0)
    1048:	0785                	addi	a5,a5,1
    104a:	fef43423          	sd	a5,-24(s0)
    104e:	fe843783          	ld	a5,-24(s0)
    1052:	0007c783          	lbu	a5,0(a5)
    1056:	fbf1                	bnez	a5,102a <strchr+0x12>
  return 0;
    1058:	4781                	li	a5,0
}
    105a:	853e                	mv	a0,a5
    105c:	6462                	ld	s0,24(sp)
    105e:	6105                	addi	sp,sp,32
    1060:	8082                	ret

0000000000001062 <gets>:

char*
gets(char *buf, int max)
{
    1062:	7179                	addi	sp,sp,-48
    1064:	f406                	sd	ra,40(sp)
    1066:	f022                	sd	s0,32(sp)
    1068:	1800                	addi	s0,sp,48
    106a:	fca43c23          	sd	a0,-40(s0)
    106e:	87ae                	mv	a5,a1
    1070:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1074:	fe042623          	sw	zero,-20(s0)
    1078:	a8a1                	j	10d0 <gets+0x6e>
    cc = read(0, &c, 1);
    107a:	fe740793          	addi	a5,s0,-25
    107e:	4605                	li	a2,1
    1080:	85be                	mv	a1,a5
    1082:	4501                	li	a0,0
    1084:	00000097          	auipc	ra,0x0
    1088:	2f6080e7          	jalr	758(ra) # 137a <read>
    108c:	87aa                	mv	a5,a0
    108e:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
    1092:	fe842783          	lw	a5,-24(s0)
    1096:	2781                	sext.w	a5,a5
    1098:	04f05763          	blez	a5,10e6 <gets+0x84>
      break;
    buf[i++] = c;
    109c:	fec42783          	lw	a5,-20(s0)
    10a0:	0017871b          	addiw	a4,a5,1
    10a4:	fee42623          	sw	a4,-20(s0)
    10a8:	873e                	mv	a4,a5
    10aa:	fd843783          	ld	a5,-40(s0)
    10ae:	97ba                	add	a5,a5,a4
    10b0:	fe744703          	lbu	a4,-25(s0)
    10b4:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
    10b8:	fe744783          	lbu	a5,-25(s0)
    10bc:	873e                	mv	a4,a5
    10be:	47a9                	li	a5,10
    10c0:	02f70463          	beq	a4,a5,10e8 <gets+0x86>
    10c4:	fe744783          	lbu	a5,-25(s0)
    10c8:	873e                	mv	a4,a5
    10ca:	47b5                	li	a5,13
    10cc:	00f70e63          	beq	a4,a5,10e8 <gets+0x86>
  for(i=0; i+1 < max; ){
    10d0:	fec42783          	lw	a5,-20(s0)
    10d4:	2785                	addiw	a5,a5,1
    10d6:	0007871b          	sext.w	a4,a5
    10da:	fd442783          	lw	a5,-44(s0)
    10de:	2781                	sext.w	a5,a5
    10e0:	f8f74de3          	blt	a4,a5,107a <gets+0x18>
    10e4:	a011                	j	10e8 <gets+0x86>
      break;
    10e6:	0001                	nop
      break;
  }
  buf[i] = '\0';
    10e8:	fec42783          	lw	a5,-20(s0)
    10ec:	fd843703          	ld	a4,-40(s0)
    10f0:	97ba                	add	a5,a5,a4
    10f2:	00078023          	sb	zero,0(a5)
  return buf;
    10f6:	fd843783          	ld	a5,-40(s0)
}
    10fa:	853e                	mv	a0,a5
    10fc:	70a2                	ld	ra,40(sp)
    10fe:	7402                	ld	s0,32(sp)
    1100:	6145                	addi	sp,sp,48
    1102:	8082                	ret

0000000000001104 <stat>:

int
stat(const char *n, struct stat *st)
{
    1104:	7179                	addi	sp,sp,-48
    1106:	f406                	sd	ra,40(sp)
    1108:	f022                	sd	s0,32(sp)
    110a:	1800                	addi	s0,sp,48
    110c:	fca43c23          	sd	a0,-40(s0)
    1110:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1114:	4581                	li	a1,0
    1116:	fd843503          	ld	a0,-40(s0)
    111a:	00000097          	auipc	ra,0x0
    111e:	288080e7          	jalr	648(ra) # 13a2 <open>
    1122:	87aa                	mv	a5,a0
    1124:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
    1128:	fec42783          	lw	a5,-20(s0)
    112c:	2781                	sext.w	a5,a5
    112e:	0007d463          	bgez	a5,1136 <stat+0x32>
    return -1;
    1132:	57fd                	li	a5,-1
    1134:	a035                	j	1160 <stat+0x5c>
  r = fstat(fd, st);
    1136:	fec42783          	lw	a5,-20(s0)
    113a:	fd043583          	ld	a1,-48(s0)
    113e:	853e                	mv	a0,a5
    1140:	00000097          	auipc	ra,0x0
    1144:	27a080e7          	jalr	634(ra) # 13ba <fstat>
    1148:	87aa                	mv	a5,a0
    114a:	fef42423          	sw	a5,-24(s0)
  close(fd);
    114e:	fec42783          	lw	a5,-20(s0)
    1152:	853e                	mv	a0,a5
    1154:	00000097          	auipc	ra,0x0
    1158:	236080e7          	jalr	566(ra) # 138a <close>
  return r;
    115c:	fe842783          	lw	a5,-24(s0)
}
    1160:	853e                	mv	a0,a5
    1162:	70a2                	ld	ra,40(sp)
    1164:	7402                	ld	s0,32(sp)
    1166:	6145                	addi	sp,sp,48
    1168:	8082                	ret

000000000000116a <atoi>:

int
atoi(const char *s)
{
    116a:	7179                	addi	sp,sp,-48
    116c:	f422                	sd	s0,40(sp)
    116e:	1800                	addi	s0,sp,48
    1170:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
    1174:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
    1178:	a815                	j	11ac <atoi+0x42>
    n = n*10 + *s++ - '0';
    117a:	fec42703          	lw	a4,-20(s0)
    117e:	87ba                	mv	a5,a4
    1180:	0027979b          	slliw	a5,a5,0x2
    1184:	9fb9                	addw	a5,a5,a4
    1186:	0017979b          	slliw	a5,a5,0x1
    118a:	0007871b          	sext.w	a4,a5
    118e:	fd843783          	ld	a5,-40(s0)
    1192:	00178693          	addi	a3,a5,1
    1196:	fcd43c23          	sd	a3,-40(s0)
    119a:	0007c783          	lbu	a5,0(a5)
    119e:	2781                	sext.w	a5,a5
    11a0:	9fb9                	addw	a5,a5,a4
    11a2:	2781                	sext.w	a5,a5
    11a4:	fd07879b          	addiw	a5,a5,-48
    11a8:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
    11ac:	fd843783          	ld	a5,-40(s0)
    11b0:	0007c783          	lbu	a5,0(a5)
    11b4:	873e                	mv	a4,a5
    11b6:	02f00793          	li	a5,47
    11ba:	00e7fb63          	bgeu	a5,a4,11d0 <atoi+0x66>
    11be:	fd843783          	ld	a5,-40(s0)
    11c2:	0007c783          	lbu	a5,0(a5)
    11c6:	873e                	mv	a4,a5
    11c8:	03900793          	li	a5,57
    11cc:	fae7f7e3          	bgeu	a5,a4,117a <atoi+0x10>
  return n;
    11d0:	fec42783          	lw	a5,-20(s0)
}
    11d4:	853e                	mv	a0,a5
    11d6:	7422                	ld	s0,40(sp)
    11d8:	6145                	addi	sp,sp,48
    11da:	8082                	ret

00000000000011dc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    11dc:	7139                	addi	sp,sp,-64
    11de:	fc22                	sd	s0,56(sp)
    11e0:	0080                	addi	s0,sp,64
    11e2:	fca43c23          	sd	a0,-40(s0)
    11e6:	fcb43823          	sd	a1,-48(s0)
    11ea:	87b2                	mv	a5,a2
    11ec:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
    11f0:	fd843783          	ld	a5,-40(s0)
    11f4:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
    11f8:	fd043783          	ld	a5,-48(s0)
    11fc:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
    1200:	fe043703          	ld	a4,-32(s0)
    1204:	fe843783          	ld	a5,-24(s0)
    1208:	02e7fc63          	bgeu	a5,a4,1240 <memmove+0x64>
    while(n-- > 0)
    120c:	a00d                	j	122e <memmove+0x52>
      *dst++ = *src++;
    120e:	fe043703          	ld	a4,-32(s0)
    1212:	00170793          	addi	a5,a4,1
    1216:	fef43023          	sd	a5,-32(s0)
    121a:	fe843783          	ld	a5,-24(s0)
    121e:	00178693          	addi	a3,a5,1
    1222:	fed43423          	sd	a3,-24(s0)
    1226:	00074703          	lbu	a4,0(a4)
    122a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    122e:	fcc42783          	lw	a5,-52(s0)
    1232:	fff7871b          	addiw	a4,a5,-1
    1236:	fce42623          	sw	a4,-52(s0)
    123a:	fcf04ae3          	bgtz	a5,120e <memmove+0x32>
    123e:	a891                	j	1292 <memmove+0xb6>
  } else {
    dst += n;
    1240:	fcc42783          	lw	a5,-52(s0)
    1244:	fe843703          	ld	a4,-24(s0)
    1248:	97ba                	add	a5,a5,a4
    124a:	fef43423          	sd	a5,-24(s0)
    src += n;
    124e:	fcc42783          	lw	a5,-52(s0)
    1252:	fe043703          	ld	a4,-32(s0)
    1256:	97ba                	add	a5,a5,a4
    1258:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    125c:	a01d                	j	1282 <memmove+0xa6>
      *--dst = *--src;
    125e:	fe043783          	ld	a5,-32(s0)
    1262:	17fd                	addi	a5,a5,-1
    1264:	fef43023          	sd	a5,-32(s0)
    1268:	fe843783          	ld	a5,-24(s0)
    126c:	17fd                	addi	a5,a5,-1
    126e:	fef43423          	sd	a5,-24(s0)
    1272:	fe043783          	ld	a5,-32(s0)
    1276:	0007c703          	lbu	a4,0(a5)
    127a:	fe843783          	ld	a5,-24(s0)
    127e:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    1282:	fcc42783          	lw	a5,-52(s0)
    1286:	fff7871b          	addiw	a4,a5,-1
    128a:	fce42623          	sw	a4,-52(s0)
    128e:	fcf048e3          	bgtz	a5,125e <memmove+0x82>
  }
  return vdst;
    1292:	fd843783          	ld	a5,-40(s0)
}
    1296:	853e                	mv	a0,a5
    1298:	7462                	ld	s0,56(sp)
    129a:	6121                	addi	sp,sp,64
    129c:	8082                	ret

000000000000129e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    129e:	7139                	addi	sp,sp,-64
    12a0:	fc22                	sd	s0,56(sp)
    12a2:	0080                	addi	s0,sp,64
    12a4:	fca43c23          	sd	a0,-40(s0)
    12a8:	fcb43823          	sd	a1,-48(s0)
    12ac:	87b2                	mv	a5,a2
    12ae:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
    12b2:	fd843783          	ld	a5,-40(s0)
    12b6:	fef43423          	sd	a5,-24(s0)
    12ba:	fd043783          	ld	a5,-48(s0)
    12be:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    12c2:	a0a1                	j	130a <memcmp+0x6c>
    if (*p1 != *p2) {
    12c4:	fe843783          	ld	a5,-24(s0)
    12c8:	0007c703          	lbu	a4,0(a5)
    12cc:	fe043783          	ld	a5,-32(s0)
    12d0:	0007c783          	lbu	a5,0(a5)
    12d4:	02f70163          	beq	a4,a5,12f6 <memcmp+0x58>
      return *p1 - *p2;
    12d8:	fe843783          	ld	a5,-24(s0)
    12dc:	0007c783          	lbu	a5,0(a5)
    12e0:	0007871b          	sext.w	a4,a5
    12e4:	fe043783          	ld	a5,-32(s0)
    12e8:	0007c783          	lbu	a5,0(a5)
    12ec:	2781                	sext.w	a5,a5
    12ee:	40f707bb          	subw	a5,a4,a5
    12f2:	2781                	sext.w	a5,a5
    12f4:	a01d                	j	131a <memcmp+0x7c>
    }
    p1++;
    12f6:	fe843783          	ld	a5,-24(s0)
    12fa:	0785                	addi	a5,a5,1
    12fc:	fef43423          	sd	a5,-24(s0)
    p2++;
    1300:	fe043783          	ld	a5,-32(s0)
    1304:	0785                	addi	a5,a5,1
    1306:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    130a:	fcc42783          	lw	a5,-52(s0)
    130e:	fff7871b          	addiw	a4,a5,-1
    1312:	fce42623          	sw	a4,-52(s0)
    1316:	f7dd                	bnez	a5,12c4 <memcmp+0x26>
  }
  return 0;
    1318:	4781                	li	a5,0
}
    131a:	853e                	mv	a0,a5
    131c:	7462                	ld	s0,56(sp)
    131e:	6121                	addi	sp,sp,64
    1320:	8082                	ret

0000000000001322 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    1322:	7179                	addi	sp,sp,-48
    1324:	f406                	sd	ra,40(sp)
    1326:	f022                	sd	s0,32(sp)
    1328:	1800                	addi	s0,sp,48
    132a:	fea43423          	sd	a0,-24(s0)
    132e:	feb43023          	sd	a1,-32(s0)
    1332:	87b2                	mv	a5,a2
    1334:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    1338:	fdc42783          	lw	a5,-36(s0)
    133c:	863e                	mv	a2,a5
    133e:	fe043583          	ld	a1,-32(s0)
    1342:	fe843503          	ld	a0,-24(s0)
    1346:	00000097          	auipc	ra,0x0
    134a:	e96080e7          	jalr	-362(ra) # 11dc <memmove>
    134e:	87aa                	mv	a5,a0
}
    1350:	853e                	mv	a0,a5
    1352:	70a2                	ld	ra,40(sp)
    1354:	7402                	ld	s0,32(sp)
    1356:	6145                	addi	sp,sp,48
    1358:	8082                	ret

000000000000135a <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
    135a:	4885                	li	a7,1
 ecall
    135c:	00000073          	ecall
 ret
    1360:	8082                	ret

0000000000001362 <exit>:
.global exit
exit:
 li a7, SYS_exit
    1362:	4889                	li	a7,2
 ecall
    1364:	00000073          	ecall
 ret
    1368:	8082                	ret

000000000000136a <wait>:
.global wait
wait:
 li a7, SYS_wait
    136a:	488d                	li	a7,3
 ecall
    136c:	00000073          	ecall
 ret
    1370:	8082                	ret

0000000000001372 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    1372:	4891                	li	a7,4
 ecall
    1374:	00000073          	ecall
 ret
    1378:	8082                	ret

000000000000137a <read>:
.global read
read:
 li a7, SYS_read
    137a:	4895                	li	a7,5
 ecall
    137c:	00000073          	ecall
 ret
    1380:	8082                	ret

0000000000001382 <write>:
.global write
write:
 li a7, SYS_write
    1382:	48c1                	li	a7,16
 ecall
    1384:	00000073          	ecall
 ret
    1388:	8082                	ret

000000000000138a <close>:
.global close
close:
 li a7, SYS_close
    138a:	48d5                	li	a7,21
 ecall
    138c:	00000073          	ecall
 ret
    1390:	8082                	ret

0000000000001392 <kill>:
.global kill
kill:
 li a7, SYS_kill
    1392:	4899                	li	a7,6
 ecall
    1394:	00000073          	ecall
 ret
    1398:	8082                	ret

000000000000139a <exec>:
.global exec
exec:
 li a7, SYS_exec
    139a:	489d                	li	a7,7
 ecall
    139c:	00000073          	ecall
 ret
    13a0:	8082                	ret

00000000000013a2 <open>:
.global open
open:
 li a7, SYS_open
    13a2:	48bd                	li	a7,15
 ecall
    13a4:	00000073          	ecall
 ret
    13a8:	8082                	ret

00000000000013aa <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
    13aa:	48c5                	li	a7,17
 ecall
    13ac:	00000073          	ecall
 ret
    13b0:	8082                	ret

00000000000013b2 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
    13b2:	48c9                	li	a7,18
 ecall
    13b4:	00000073          	ecall
 ret
    13b8:	8082                	ret

00000000000013ba <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    13ba:	48a1                	li	a7,8
 ecall
    13bc:	00000073          	ecall
 ret
    13c0:	8082                	ret

00000000000013c2 <link>:
.global link
link:
 li a7, SYS_link
    13c2:	48cd                	li	a7,19
 ecall
    13c4:	00000073          	ecall
 ret
    13c8:	8082                	ret

00000000000013ca <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    13ca:	48d1                	li	a7,20
 ecall
    13cc:	00000073          	ecall
 ret
    13d0:	8082                	ret

00000000000013d2 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    13d2:	48a5                	li	a7,9
 ecall
    13d4:	00000073          	ecall
 ret
    13d8:	8082                	ret

00000000000013da <dup>:
.global dup
dup:
 li a7, SYS_dup
    13da:	48a9                	li	a7,10
 ecall
    13dc:	00000073          	ecall
 ret
    13e0:	8082                	ret

00000000000013e2 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    13e2:	48ad                	li	a7,11
 ecall
    13e4:	00000073          	ecall
 ret
    13e8:	8082                	ret

00000000000013ea <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
    13ea:	48b1                	li	a7,12
 ecall
    13ec:	00000073          	ecall
 ret
    13f0:	8082                	ret

00000000000013f2 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
    13f2:	48b5                	li	a7,13
 ecall
    13f4:	00000073          	ecall
 ret
    13f8:	8082                	ret

00000000000013fa <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    13fa:	48b9                	li	a7,14
 ecall
    13fc:	00000073          	ecall
 ret
    1400:	8082                	ret

0000000000001402 <setSchedAlg>:
.global setSchedAlg
setSchedAlg:
 li a7, SYS_setSchedAlg
    1402:	48d9                	li	a7,22
 ecall
    1404:	00000073          	ecall
 ret
    1408:	8082                	ret

000000000000140a <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
    140a:	1101                	addi	sp,sp,-32
    140c:	ec06                	sd	ra,24(sp)
    140e:	e822                	sd	s0,16(sp)
    1410:	1000                	addi	s0,sp,32
    1412:	87aa                	mv	a5,a0
    1414:	872e                	mv	a4,a1
    1416:	fef42623          	sw	a5,-20(s0)
    141a:	87ba                	mv	a5,a4
    141c:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
    1420:	feb40713          	addi	a4,s0,-21
    1424:	fec42783          	lw	a5,-20(s0)
    1428:	4605                	li	a2,1
    142a:	85ba                	mv	a1,a4
    142c:	853e                	mv	a0,a5
    142e:	00000097          	auipc	ra,0x0
    1432:	f54080e7          	jalr	-172(ra) # 1382 <write>
}
    1436:	0001                	nop
    1438:	60e2                	ld	ra,24(sp)
    143a:	6442                	ld	s0,16(sp)
    143c:	6105                	addi	sp,sp,32
    143e:	8082                	ret

0000000000001440 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1440:	7139                	addi	sp,sp,-64
    1442:	fc06                	sd	ra,56(sp)
    1444:	f822                	sd	s0,48(sp)
    1446:	0080                	addi	s0,sp,64
    1448:	87aa                	mv	a5,a0
    144a:	8736                	mv	a4,a3
    144c:	fcf42623          	sw	a5,-52(s0)
    1450:	87ae                	mv	a5,a1
    1452:	fcf42423          	sw	a5,-56(s0)
    1456:	87b2                	mv	a5,a2
    1458:	fcf42223          	sw	a5,-60(s0)
    145c:	87ba                	mv	a5,a4
    145e:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1462:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
    1466:	fc042783          	lw	a5,-64(s0)
    146a:	2781                	sext.w	a5,a5
    146c:	c38d                	beqz	a5,148e <printint+0x4e>
    146e:	fc842783          	lw	a5,-56(s0)
    1472:	2781                	sext.w	a5,a5
    1474:	0007dd63          	bgez	a5,148e <printint+0x4e>
    neg = 1;
    1478:	4785                	li	a5,1
    147a:	fef42423          	sw	a5,-24(s0)
    x = -xx;
    147e:	fc842783          	lw	a5,-56(s0)
    1482:	40f007bb          	negw	a5,a5
    1486:	2781                	sext.w	a5,a5
    1488:	fef42223          	sw	a5,-28(s0)
    148c:	a029                	j	1496 <printint+0x56>
  } else {
    x = xx;
    148e:	fc842783          	lw	a5,-56(s0)
    1492:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
    1496:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
    149a:	fc442783          	lw	a5,-60(s0)
    149e:	fe442703          	lw	a4,-28(s0)
    14a2:	02f777bb          	remuw	a5,a4,a5
    14a6:	0007861b          	sext.w	a2,a5
    14aa:	fec42783          	lw	a5,-20(s0)
    14ae:	0017871b          	addiw	a4,a5,1
    14b2:	fee42623          	sw	a4,-20(s0)
    14b6:	00001697          	auipc	a3,0x1
    14ba:	a1a68693          	addi	a3,a3,-1510 # 1ed0 <digits>
    14be:	02061713          	slli	a4,a2,0x20
    14c2:	9301                	srli	a4,a4,0x20
    14c4:	9736                	add	a4,a4,a3
    14c6:	00074703          	lbu	a4,0(a4)
    14ca:	ff040693          	addi	a3,s0,-16
    14ce:	97b6                	add	a5,a5,a3
    14d0:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
    14d4:	fc442783          	lw	a5,-60(s0)
    14d8:	fe442703          	lw	a4,-28(s0)
    14dc:	02f757bb          	divuw	a5,a4,a5
    14e0:	fef42223          	sw	a5,-28(s0)
    14e4:	fe442783          	lw	a5,-28(s0)
    14e8:	2781                	sext.w	a5,a5
    14ea:	fbc5                	bnez	a5,149a <printint+0x5a>
  if(neg)
    14ec:	fe842783          	lw	a5,-24(s0)
    14f0:	2781                	sext.w	a5,a5
    14f2:	cf95                	beqz	a5,152e <printint+0xee>
    buf[i++] = '-';
    14f4:	fec42783          	lw	a5,-20(s0)
    14f8:	0017871b          	addiw	a4,a5,1
    14fc:	fee42623          	sw	a4,-20(s0)
    1500:	ff040713          	addi	a4,s0,-16
    1504:	97ba                	add	a5,a5,a4
    1506:	02d00713          	li	a4,45
    150a:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
    150e:	a005                	j	152e <printint+0xee>
    putc(fd, buf[i]);
    1510:	fec42783          	lw	a5,-20(s0)
    1514:	ff040713          	addi	a4,s0,-16
    1518:	97ba                	add	a5,a5,a4
    151a:	fe07c703          	lbu	a4,-32(a5)
    151e:	fcc42783          	lw	a5,-52(s0)
    1522:	85ba                	mv	a1,a4
    1524:	853e                	mv	a0,a5
    1526:	00000097          	auipc	ra,0x0
    152a:	ee4080e7          	jalr	-284(ra) # 140a <putc>
  while(--i >= 0)
    152e:	fec42783          	lw	a5,-20(s0)
    1532:	37fd                	addiw	a5,a5,-1
    1534:	fef42623          	sw	a5,-20(s0)
    1538:	fec42783          	lw	a5,-20(s0)
    153c:	2781                	sext.w	a5,a5
    153e:	fc07d9e3          	bgez	a5,1510 <printint+0xd0>
}
    1542:	0001                	nop
    1544:	0001                	nop
    1546:	70e2                	ld	ra,56(sp)
    1548:	7442                	ld	s0,48(sp)
    154a:	6121                	addi	sp,sp,64
    154c:	8082                	ret

000000000000154e <printptr>:

static void
printptr(int fd, uint64 x) {
    154e:	7179                	addi	sp,sp,-48
    1550:	f406                	sd	ra,40(sp)
    1552:	f022                	sd	s0,32(sp)
    1554:	1800                	addi	s0,sp,48
    1556:	87aa                	mv	a5,a0
    1558:	fcb43823          	sd	a1,-48(s0)
    155c:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
    1560:	fdc42783          	lw	a5,-36(s0)
    1564:	03000593          	li	a1,48
    1568:	853e                	mv	a0,a5
    156a:	00000097          	auipc	ra,0x0
    156e:	ea0080e7          	jalr	-352(ra) # 140a <putc>
  putc(fd, 'x');
    1572:	fdc42783          	lw	a5,-36(s0)
    1576:	07800593          	li	a1,120
    157a:	853e                	mv	a0,a5
    157c:	00000097          	auipc	ra,0x0
    1580:	e8e080e7          	jalr	-370(ra) # 140a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    1584:	fe042623          	sw	zero,-20(s0)
    1588:	a82d                	j	15c2 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    158a:	fd043783          	ld	a5,-48(s0)
    158e:	93f1                	srli	a5,a5,0x3c
    1590:	00001717          	auipc	a4,0x1
    1594:	94070713          	addi	a4,a4,-1728 # 1ed0 <digits>
    1598:	97ba                	add	a5,a5,a4
    159a:	0007c703          	lbu	a4,0(a5)
    159e:	fdc42783          	lw	a5,-36(s0)
    15a2:	85ba                	mv	a1,a4
    15a4:	853e                	mv	a0,a5
    15a6:	00000097          	auipc	ra,0x0
    15aa:	e64080e7          	jalr	-412(ra) # 140a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    15ae:	fec42783          	lw	a5,-20(s0)
    15b2:	2785                	addiw	a5,a5,1
    15b4:	fef42623          	sw	a5,-20(s0)
    15b8:	fd043783          	ld	a5,-48(s0)
    15bc:	0792                	slli	a5,a5,0x4
    15be:	fcf43823          	sd	a5,-48(s0)
    15c2:	fec42783          	lw	a5,-20(s0)
    15c6:	873e                	mv	a4,a5
    15c8:	47bd                	li	a5,15
    15ca:	fce7f0e3          	bgeu	a5,a4,158a <printptr+0x3c>
}
    15ce:	0001                	nop
    15d0:	0001                	nop
    15d2:	70a2                	ld	ra,40(sp)
    15d4:	7402                	ld	s0,32(sp)
    15d6:	6145                	addi	sp,sp,48
    15d8:	8082                	ret

00000000000015da <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    15da:	715d                	addi	sp,sp,-80
    15dc:	e486                	sd	ra,72(sp)
    15de:	e0a2                	sd	s0,64(sp)
    15e0:	0880                	addi	s0,sp,80
    15e2:	87aa                	mv	a5,a0
    15e4:	fcb43023          	sd	a1,-64(s0)
    15e8:	fac43c23          	sd	a2,-72(s0)
    15ec:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
    15f0:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    15f4:	fe042223          	sw	zero,-28(s0)
    15f8:	a42d                	j	1822 <vprintf+0x248>
    c = fmt[i] & 0xff;
    15fa:	fe442783          	lw	a5,-28(s0)
    15fe:	fc043703          	ld	a4,-64(s0)
    1602:	97ba                	add	a5,a5,a4
    1604:	0007c783          	lbu	a5,0(a5)
    1608:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
    160c:	fe042783          	lw	a5,-32(s0)
    1610:	2781                	sext.w	a5,a5
    1612:	eb9d                	bnez	a5,1648 <vprintf+0x6e>
      if(c == '%'){
    1614:	fdc42783          	lw	a5,-36(s0)
    1618:	0007871b          	sext.w	a4,a5
    161c:	02500793          	li	a5,37
    1620:	00f71763          	bne	a4,a5,162e <vprintf+0x54>
        state = '%';
    1624:	02500793          	li	a5,37
    1628:	fef42023          	sw	a5,-32(s0)
    162c:	a2f5                	j	1818 <vprintf+0x23e>
      } else {
        putc(fd, c);
    162e:	fdc42783          	lw	a5,-36(s0)
    1632:	0ff7f713          	andi	a4,a5,255
    1636:	fcc42783          	lw	a5,-52(s0)
    163a:	85ba                	mv	a1,a4
    163c:	853e                	mv	a0,a5
    163e:	00000097          	auipc	ra,0x0
    1642:	dcc080e7          	jalr	-564(ra) # 140a <putc>
    1646:	aac9                	j	1818 <vprintf+0x23e>
      }
    } else if(state == '%'){
    1648:	fe042783          	lw	a5,-32(s0)
    164c:	0007871b          	sext.w	a4,a5
    1650:	02500793          	li	a5,37
    1654:	1cf71263          	bne	a4,a5,1818 <vprintf+0x23e>
      if(c == 'd'){
    1658:	fdc42783          	lw	a5,-36(s0)
    165c:	0007871b          	sext.w	a4,a5
    1660:	06400793          	li	a5,100
    1664:	02f71463          	bne	a4,a5,168c <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
    1668:	fb843783          	ld	a5,-72(s0)
    166c:	00878713          	addi	a4,a5,8
    1670:	fae43c23          	sd	a4,-72(s0)
    1674:	4398                	lw	a4,0(a5)
    1676:	fcc42783          	lw	a5,-52(s0)
    167a:	4685                	li	a3,1
    167c:	4629                	li	a2,10
    167e:	85ba                	mv	a1,a4
    1680:	853e                	mv	a0,a5
    1682:	00000097          	auipc	ra,0x0
    1686:	dbe080e7          	jalr	-578(ra) # 1440 <printint>
    168a:	a269                	j	1814 <vprintf+0x23a>
      } else if(c == 'l') {
    168c:	fdc42783          	lw	a5,-36(s0)
    1690:	0007871b          	sext.w	a4,a5
    1694:	06c00793          	li	a5,108
    1698:	02f71663          	bne	a4,a5,16c4 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
    169c:	fb843783          	ld	a5,-72(s0)
    16a0:	00878713          	addi	a4,a5,8
    16a4:	fae43c23          	sd	a4,-72(s0)
    16a8:	639c                	ld	a5,0(a5)
    16aa:	0007871b          	sext.w	a4,a5
    16ae:	fcc42783          	lw	a5,-52(s0)
    16b2:	4681                	li	a3,0
    16b4:	4629                	li	a2,10
    16b6:	85ba                	mv	a1,a4
    16b8:	853e                	mv	a0,a5
    16ba:	00000097          	auipc	ra,0x0
    16be:	d86080e7          	jalr	-634(ra) # 1440 <printint>
    16c2:	aa89                	j	1814 <vprintf+0x23a>
      } else if(c == 'x') {
    16c4:	fdc42783          	lw	a5,-36(s0)
    16c8:	0007871b          	sext.w	a4,a5
    16cc:	07800793          	li	a5,120
    16d0:	02f71463          	bne	a4,a5,16f8 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
    16d4:	fb843783          	ld	a5,-72(s0)
    16d8:	00878713          	addi	a4,a5,8
    16dc:	fae43c23          	sd	a4,-72(s0)
    16e0:	4398                	lw	a4,0(a5)
    16e2:	fcc42783          	lw	a5,-52(s0)
    16e6:	4681                	li	a3,0
    16e8:	4641                	li	a2,16
    16ea:	85ba                	mv	a1,a4
    16ec:	853e                	mv	a0,a5
    16ee:	00000097          	auipc	ra,0x0
    16f2:	d52080e7          	jalr	-686(ra) # 1440 <printint>
    16f6:	aa39                	j	1814 <vprintf+0x23a>
      } else if(c == 'p') {
    16f8:	fdc42783          	lw	a5,-36(s0)
    16fc:	0007871b          	sext.w	a4,a5
    1700:	07000793          	li	a5,112
    1704:	02f71263          	bne	a4,a5,1728 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
    1708:	fb843783          	ld	a5,-72(s0)
    170c:	00878713          	addi	a4,a5,8
    1710:	fae43c23          	sd	a4,-72(s0)
    1714:	6398                	ld	a4,0(a5)
    1716:	fcc42783          	lw	a5,-52(s0)
    171a:	85ba                	mv	a1,a4
    171c:	853e                	mv	a0,a5
    171e:	00000097          	auipc	ra,0x0
    1722:	e30080e7          	jalr	-464(ra) # 154e <printptr>
    1726:	a0fd                	j	1814 <vprintf+0x23a>
      } else if(c == 's'){
    1728:	fdc42783          	lw	a5,-36(s0)
    172c:	0007871b          	sext.w	a4,a5
    1730:	07300793          	li	a5,115
    1734:	04f71c63          	bne	a4,a5,178c <vprintf+0x1b2>
        s = va_arg(ap, char*);
    1738:	fb843783          	ld	a5,-72(s0)
    173c:	00878713          	addi	a4,a5,8
    1740:	fae43c23          	sd	a4,-72(s0)
    1744:	639c                	ld	a5,0(a5)
    1746:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
    174a:	fe843783          	ld	a5,-24(s0)
    174e:	eb8d                	bnez	a5,1780 <vprintf+0x1a6>
          s = "(null)";
    1750:	00000797          	auipc	a5,0x0
    1754:	77878793          	addi	a5,a5,1912 # 1ec8 <malloc+0x43e>
    1758:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    175c:	a015                	j	1780 <vprintf+0x1a6>
          putc(fd, *s);
    175e:	fe843783          	ld	a5,-24(s0)
    1762:	0007c703          	lbu	a4,0(a5)
    1766:	fcc42783          	lw	a5,-52(s0)
    176a:	85ba                	mv	a1,a4
    176c:	853e                	mv	a0,a5
    176e:	00000097          	auipc	ra,0x0
    1772:	c9c080e7          	jalr	-868(ra) # 140a <putc>
          s++;
    1776:	fe843783          	ld	a5,-24(s0)
    177a:	0785                	addi	a5,a5,1
    177c:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    1780:	fe843783          	ld	a5,-24(s0)
    1784:	0007c783          	lbu	a5,0(a5)
    1788:	fbf9                	bnez	a5,175e <vprintf+0x184>
    178a:	a069                	j	1814 <vprintf+0x23a>
        }
      } else if(c == 'c'){
    178c:	fdc42783          	lw	a5,-36(s0)
    1790:	0007871b          	sext.w	a4,a5
    1794:	06300793          	li	a5,99
    1798:	02f71463          	bne	a4,a5,17c0 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
    179c:	fb843783          	ld	a5,-72(s0)
    17a0:	00878713          	addi	a4,a5,8
    17a4:	fae43c23          	sd	a4,-72(s0)
    17a8:	439c                	lw	a5,0(a5)
    17aa:	0ff7f713          	andi	a4,a5,255
    17ae:	fcc42783          	lw	a5,-52(s0)
    17b2:	85ba                	mv	a1,a4
    17b4:	853e                	mv	a0,a5
    17b6:	00000097          	auipc	ra,0x0
    17ba:	c54080e7          	jalr	-940(ra) # 140a <putc>
    17be:	a899                	j	1814 <vprintf+0x23a>
      } else if(c == '%'){
    17c0:	fdc42783          	lw	a5,-36(s0)
    17c4:	0007871b          	sext.w	a4,a5
    17c8:	02500793          	li	a5,37
    17cc:	00f71f63          	bne	a4,a5,17ea <vprintf+0x210>
        putc(fd, c);
    17d0:	fdc42783          	lw	a5,-36(s0)
    17d4:	0ff7f713          	andi	a4,a5,255
    17d8:	fcc42783          	lw	a5,-52(s0)
    17dc:	85ba                	mv	a1,a4
    17de:	853e                	mv	a0,a5
    17e0:	00000097          	auipc	ra,0x0
    17e4:	c2a080e7          	jalr	-982(ra) # 140a <putc>
    17e8:	a035                	j	1814 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    17ea:	fcc42783          	lw	a5,-52(s0)
    17ee:	02500593          	li	a1,37
    17f2:	853e                	mv	a0,a5
    17f4:	00000097          	auipc	ra,0x0
    17f8:	c16080e7          	jalr	-1002(ra) # 140a <putc>
        putc(fd, c);
    17fc:	fdc42783          	lw	a5,-36(s0)
    1800:	0ff7f713          	andi	a4,a5,255
    1804:	fcc42783          	lw	a5,-52(s0)
    1808:	85ba                	mv	a1,a4
    180a:	853e                	mv	a0,a5
    180c:	00000097          	auipc	ra,0x0
    1810:	bfe080e7          	jalr	-1026(ra) # 140a <putc>
      }
      state = 0;
    1814:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    1818:	fe442783          	lw	a5,-28(s0)
    181c:	2785                	addiw	a5,a5,1
    181e:	fef42223          	sw	a5,-28(s0)
    1822:	fe442783          	lw	a5,-28(s0)
    1826:	fc043703          	ld	a4,-64(s0)
    182a:	97ba                	add	a5,a5,a4
    182c:	0007c783          	lbu	a5,0(a5)
    1830:	dc0795e3          	bnez	a5,15fa <vprintf+0x20>
    }
  }
}
    1834:	0001                	nop
    1836:	0001                	nop
    1838:	60a6                	ld	ra,72(sp)
    183a:	6406                	ld	s0,64(sp)
    183c:	6161                	addi	sp,sp,80
    183e:	8082                	ret

0000000000001840 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    1840:	7159                	addi	sp,sp,-112
    1842:	fc06                	sd	ra,56(sp)
    1844:	f822                	sd	s0,48(sp)
    1846:	0080                	addi	s0,sp,64
    1848:	fcb43823          	sd	a1,-48(s0)
    184c:	e010                	sd	a2,0(s0)
    184e:	e414                	sd	a3,8(s0)
    1850:	e818                	sd	a4,16(s0)
    1852:	ec1c                	sd	a5,24(s0)
    1854:	03043023          	sd	a6,32(s0)
    1858:	03143423          	sd	a7,40(s0)
    185c:	87aa                	mv	a5,a0
    185e:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
    1862:	03040793          	addi	a5,s0,48
    1866:	fcf43423          	sd	a5,-56(s0)
    186a:	fc843783          	ld	a5,-56(s0)
    186e:	fd078793          	addi	a5,a5,-48
    1872:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
    1876:	fe843703          	ld	a4,-24(s0)
    187a:	fdc42783          	lw	a5,-36(s0)
    187e:	863a                	mv	a2,a4
    1880:	fd043583          	ld	a1,-48(s0)
    1884:	853e                	mv	a0,a5
    1886:	00000097          	auipc	ra,0x0
    188a:	d54080e7          	jalr	-684(ra) # 15da <vprintf>
}
    188e:	0001                	nop
    1890:	70e2                	ld	ra,56(sp)
    1892:	7442                	ld	s0,48(sp)
    1894:	6165                	addi	sp,sp,112
    1896:	8082                	ret

0000000000001898 <printf>:

void
printf(const char *fmt, ...)
{
    1898:	7159                	addi	sp,sp,-112
    189a:	f406                	sd	ra,40(sp)
    189c:	f022                	sd	s0,32(sp)
    189e:	1800                	addi	s0,sp,48
    18a0:	fca43c23          	sd	a0,-40(s0)
    18a4:	e40c                	sd	a1,8(s0)
    18a6:	e810                	sd	a2,16(s0)
    18a8:	ec14                	sd	a3,24(s0)
    18aa:	f018                	sd	a4,32(s0)
    18ac:	f41c                	sd	a5,40(s0)
    18ae:	03043823          	sd	a6,48(s0)
    18b2:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    18b6:	04040793          	addi	a5,s0,64
    18ba:	fcf43823          	sd	a5,-48(s0)
    18be:	fd043783          	ld	a5,-48(s0)
    18c2:	fc878793          	addi	a5,a5,-56
    18c6:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
    18ca:	fe843783          	ld	a5,-24(s0)
    18ce:	863e                	mv	a2,a5
    18d0:	fd843583          	ld	a1,-40(s0)
    18d4:	4505                	li	a0,1
    18d6:	00000097          	auipc	ra,0x0
    18da:	d04080e7          	jalr	-764(ra) # 15da <vprintf>
}
    18de:	0001                	nop
    18e0:	70a2                	ld	ra,40(sp)
    18e2:	7402                	ld	s0,32(sp)
    18e4:	6165                	addi	sp,sp,112
    18e6:	8082                	ret

00000000000018e8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    18e8:	7179                	addi	sp,sp,-48
    18ea:	f422                	sd	s0,40(sp)
    18ec:	1800                	addi	s0,sp,48
    18ee:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
    18f2:	fd843783          	ld	a5,-40(s0)
    18f6:	17c1                	addi	a5,a5,-16
    18f8:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    18fc:	00001797          	auipc	a5,0x1
    1900:	9ec78793          	addi	a5,a5,-1556 # 22e8 <freep>
    1904:	639c                	ld	a5,0(a5)
    1906:	fef43423          	sd	a5,-24(s0)
    190a:	a815                	j	193e <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    190c:	fe843783          	ld	a5,-24(s0)
    1910:	639c                	ld	a5,0(a5)
    1912:	fe843703          	ld	a4,-24(s0)
    1916:	00f76f63          	bltu	a4,a5,1934 <free+0x4c>
    191a:	fe043703          	ld	a4,-32(s0)
    191e:	fe843783          	ld	a5,-24(s0)
    1922:	02e7eb63          	bltu	a5,a4,1958 <free+0x70>
    1926:	fe843783          	ld	a5,-24(s0)
    192a:	639c                	ld	a5,0(a5)
    192c:	fe043703          	ld	a4,-32(s0)
    1930:	02f76463          	bltu	a4,a5,1958 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1934:	fe843783          	ld	a5,-24(s0)
    1938:	639c                	ld	a5,0(a5)
    193a:	fef43423          	sd	a5,-24(s0)
    193e:	fe043703          	ld	a4,-32(s0)
    1942:	fe843783          	ld	a5,-24(s0)
    1946:	fce7f3e3          	bgeu	a5,a4,190c <free+0x24>
    194a:	fe843783          	ld	a5,-24(s0)
    194e:	639c                	ld	a5,0(a5)
    1950:	fe043703          	ld	a4,-32(s0)
    1954:	faf77ce3          	bgeu	a4,a5,190c <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1958:	fe043783          	ld	a5,-32(s0)
    195c:	479c                	lw	a5,8(a5)
    195e:	1782                	slli	a5,a5,0x20
    1960:	9381                	srli	a5,a5,0x20
    1962:	0792                	slli	a5,a5,0x4
    1964:	fe043703          	ld	a4,-32(s0)
    1968:	973e                	add	a4,a4,a5
    196a:	fe843783          	ld	a5,-24(s0)
    196e:	639c                	ld	a5,0(a5)
    1970:	02f71763          	bne	a4,a5,199e <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
    1974:	fe043783          	ld	a5,-32(s0)
    1978:	4798                	lw	a4,8(a5)
    197a:	fe843783          	ld	a5,-24(s0)
    197e:	639c                	ld	a5,0(a5)
    1980:	479c                	lw	a5,8(a5)
    1982:	9fb9                	addw	a5,a5,a4
    1984:	0007871b          	sext.w	a4,a5
    1988:	fe043783          	ld	a5,-32(s0)
    198c:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
    198e:	fe843783          	ld	a5,-24(s0)
    1992:	639c                	ld	a5,0(a5)
    1994:	6398                	ld	a4,0(a5)
    1996:	fe043783          	ld	a5,-32(s0)
    199a:	e398                	sd	a4,0(a5)
    199c:	a039                	j	19aa <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
    199e:	fe843783          	ld	a5,-24(s0)
    19a2:	6398                	ld	a4,0(a5)
    19a4:	fe043783          	ld	a5,-32(s0)
    19a8:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
    19aa:	fe843783          	ld	a5,-24(s0)
    19ae:	479c                	lw	a5,8(a5)
    19b0:	1782                	slli	a5,a5,0x20
    19b2:	9381                	srli	a5,a5,0x20
    19b4:	0792                	slli	a5,a5,0x4
    19b6:	fe843703          	ld	a4,-24(s0)
    19ba:	97ba                	add	a5,a5,a4
    19bc:	fe043703          	ld	a4,-32(s0)
    19c0:	02f71563          	bne	a4,a5,19ea <free+0x102>
    p->s.size += bp->s.size;
    19c4:	fe843783          	ld	a5,-24(s0)
    19c8:	4798                	lw	a4,8(a5)
    19ca:	fe043783          	ld	a5,-32(s0)
    19ce:	479c                	lw	a5,8(a5)
    19d0:	9fb9                	addw	a5,a5,a4
    19d2:	0007871b          	sext.w	a4,a5
    19d6:	fe843783          	ld	a5,-24(s0)
    19da:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
    19dc:	fe043783          	ld	a5,-32(s0)
    19e0:	6398                	ld	a4,0(a5)
    19e2:	fe843783          	ld	a5,-24(s0)
    19e6:	e398                	sd	a4,0(a5)
    19e8:	a031                	j	19f4 <free+0x10c>
  } else
    p->s.ptr = bp;
    19ea:	fe843783          	ld	a5,-24(s0)
    19ee:	fe043703          	ld	a4,-32(s0)
    19f2:	e398                	sd	a4,0(a5)
  freep = p;
    19f4:	00001797          	auipc	a5,0x1
    19f8:	8f478793          	addi	a5,a5,-1804 # 22e8 <freep>
    19fc:	fe843703          	ld	a4,-24(s0)
    1a00:	e398                	sd	a4,0(a5)
}
    1a02:	0001                	nop
    1a04:	7422                	ld	s0,40(sp)
    1a06:	6145                	addi	sp,sp,48
    1a08:	8082                	ret

0000000000001a0a <morecore>:

static Header*
morecore(uint nu)
{
    1a0a:	7179                	addi	sp,sp,-48
    1a0c:	f406                	sd	ra,40(sp)
    1a0e:	f022                	sd	s0,32(sp)
    1a10:	1800                	addi	s0,sp,48
    1a12:	87aa                	mv	a5,a0
    1a14:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
    1a18:	fdc42783          	lw	a5,-36(s0)
    1a1c:	0007871b          	sext.w	a4,a5
    1a20:	6785                	lui	a5,0x1
    1a22:	00f77563          	bgeu	a4,a5,1a2c <morecore+0x22>
    nu = 4096;
    1a26:	6785                	lui	a5,0x1
    1a28:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
    1a2c:	fdc42783          	lw	a5,-36(s0)
    1a30:	0047979b          	slliw	a5,a5,0x4
    1a34:	2781                	sext.w	a5,a5
    1a36:	2781                	sext.w	a5,a5
    1a38:	853e                	mv	a0,a5
    1a3a:	00000097          	auipc	ra,0x0
    1a3e:	9b0080e7          	jalr	-1616(ra) # 13ea <sbrk>
    1a42:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
    1a46:	fe843703          	ld	a4,-24(s0)
    1a4a:	57fd                	li	a5,-1
    1a4c:	00f71463          	bne	a4,a5,1a54 <morecore+0x4a>
    return 0;
    1a50:	4781                	li	a5,0
    1a52:	a03d                	j	1a80 <morecore+0x76>
  hp = (Header*)p;
    1a54:	fe843783          	ld	a5,-24(s0)
    1a58:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
    1a5c:	fe043783          	ld	a5,-32(s0)
    1a60:	fdc42703          	lw	a4,-36(s0)
    1a64:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
    1a66:	fe043783          	ld	a5,-32(s0)
    1a6a:	07c1                	addi	a5,a5,16
    1a6c:	853e                	mv	a0,a5
    1a6e:	00000097          	auipc	ra,0x0
    1a72:	e7a080e7          	jalr	-390(ra) # 18e8 <free>
  return freep;
    1a76:	00001797          	auipc	a5,0x1
    1a7a:	87278793          	addi	a5,a5,-1934 # 22e8 <freep>
    1a7e:	639c                	ld	a5,0(a5)
}
    1a80:	853e                	mv	a0,a5
    1a82:	70a2                	ld	ra,40(sp)
    1a84:	7402                	ld	s0,32(sp)
    1a86:	6145                	addi	sp,sp,48
    1a88:	8082                	ret

0000000000001a8a <malloc>:

void*
malloc(uint nbytes)
{
    1a8a:	7139                	addi	sp,sp,-64
    1a8c:	fc06                	sd	ra,56(sp)
    1a8e:	f822                	sd	s0,48(sp)
    1a90:	0080                	addi	s0,sp,64
    1a92:	87aa                	mv	a5,a0
    1a94:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1a98:	fcc46783          	lwu	a5,-52(s0)
    1a9c:	07bd                	addi	a5,a5,15
    1a9e:	8391                	srli	a5,a5,0x4
    1aa0:	2781                	sext.w	a5,a5
    1aa2:	2785                	addiw	a5,a5,1
    1aa4:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
    1aa8:	00001797          	auipc	a5,0x1
    1aac:	84078793          	addi	a5,a5,-1984 # 22e8 <freep>
    1ab0:	639c                	ld	a5,0(a5)
    1ab2:	fef43023          	sd	a5,-32(s0)
    1ab6:	fe043783          	ld	a5,-32(s0)
    1aba:	ef95                	bnez	a5,1af6 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
    1abc:	00001797          	auipc	a5,0x1
    1ac0:	81c78793          	addi	a5,a5,-2020 # 22d8 <base>
    1ac4:	fef43023          	sd	a5,-32(s0)
    1ac8:	00001797          	auipc	a5,0x1
    1acc:	82078793          	addi	a5,a5,-2016 # 22e8 <freep>
    1ad0:	fe043703          	ld	a4,-32(s0)
    1ad4:	e398                	sd	a4,0(a5)
    1ad6:	00001797          	auipc	a5,0x1
    1ada:	81278793          	addi	a5,a5,-2030 # 22e8 <freep>
    1ade:	6398                	ld	a4,0(a5)
    1ae0:	00000797          	auipc	a5,0x0
    1ae4:	7f878793          	addi	a5,a5,2040 # 22d8 <base>
    1ae8:	e398                	sd	a4,0(a5)
    base.s.size = 0;
    1aea:	00000797          	auipc	a5,0x0
    1aee:	7ee78793          	addi	a5,a5,2030 # 22d8 <base>
    1af2:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1af6:	fe043783          	ld	a5,-32(s0)
    1afa:	639c                	ld	a5,0(a5)
    1afc:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    1b00:	fe843783          	ld	a5,-24(s0)
    1b04:	4798                	lw	a4,8(a5)
    1b06:	fdc42783          	lw	a5,-36(s0)
    1b0a:	2781                	sext.w	a5,a5
    1b0c:	06f76863          	bltu	a4,a5,1b7c <malloc+0xf2>
      if(p->s.size == nunits)
    1b10:	fe843783          	ld	a5,-24(s0)
    1b14:	4798                	lw	a4,8(a5)
    1b16:	fdc42783          	lw	a5,-36(s0)
    1b1a:	2781                	sext.w	a5,a5
    1b1c:	00e79963          	bne	a5,a4,1b2e <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
    1b20:	fe843783          	ld	a5,-24(s0)
    1b24:	6398                	ld	a4,0(a5)
    1b26:	fe043783          	ld	a5,-32(s0)
    1b2a:	e398                	sd	a4,0(a5)
    1b2c:	a82d                	j	1b66 <malloc+0xdc>
      else {
        p->s.size -= nunits;
    1b2e:	fe843783          	ld	a5,-24(s0)
    1b32:	4798                	lw	a4,8(a5)
    1b34:	fdc42783          	lw	a5,-36(s0)
    1b38:	40f707bb          	subw	a5,a4,a5
    1b3c:	0007871b          	sext.w	a4,a5
    1b40:	fe843783          	ld	a5,-24(s0)
    1b44:	c798                	sw	a4,8(a5)
        p += p->s.size;
    1b46:	fe843783          	ld	a5,-24(s0)
    1b4a:	479c                	lw	a5,8(a5)
    1b4c:	1782                	slli	a5,a5,0x20
    1b4e:	9381                	srli	a5,a5,0x20
    1b50:	0792                	slli	a5,a5,0x4
    1b52:	fe843703          	ld	a4,-24(s0)
    1b56:	97ba                	add	a5,a5,a4
    1b58:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    1b5c:	fe843783          	ld	a5,-24(s0)
    1b60:	fdc42703          	lw	a4,-36(s0)
    1b64:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    1b66:	00000797          	auipc	a5,0x0
    1b6a:	78278793          	addi	a5,a5,1922 # 22e8 <freep>
    1b6e:	fe043703          	ld	a4,-32(s0)
    1b72:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    1b74:	fe843783          	ld	a5,-24(s0)
    1b78:	07c1                	addi	a5,a5,16
    1b7a:	a091                	j	1bbe <malloc+0x134>
    }
    if(p == freep)
    1b7c:	00000797          	auipc	a5,0x0
    1b80:	76c78793          	addi	a5,a5,1900 # 22e8 <freep>
    1b84:	639c                	ld	a5,0(a5)
    1b86:	fe843703          	ld	a4,-24(s0)
    1b8a:	02f71063          	bne	a4,a5,1baa <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    1b8e:	fdc42783          	lw	a5,-36(s0)
    1b92:	853e                	mv	a0,a5
    1b94:	00000097          	auipc	ra,0x0
    1b98:	e76080e7          	jalr	-394(ra) # 1a0a <morecore>
    1b9c:	fea43423          	sd	a0,-24(s0)
    1ba0:	fe843783          	ld	a5,-24(s0)
    1ba4:	e399                	bnez	a5,1baa <malloc+0x120>
        return 0;
    1ba6:	4781                	li	a5,0
    1ba8:	a819                	j	1bbe <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1baa:	fe843783          	ld	a5,-24(s0)
    1bae:	fef43023          	sd	a5,-32(s0)
    1bb2:	fe843783          	ld	a5,-24(s0)
    1bb6:	639c                	ld	a5,0(a5)
    1bb8:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    1bbc:	b791                	j	1b00 <malloc+0x76>
  }
}
    1bbe:	853e                	mv	a0,a5
    1bc0:	70e2                	ld	ra,56(sp)
    1bc2:	7442                	ld	s0,48(sp)
    1bc4:	6121                	addi	sp,sp,64
    1bc6:	8082                	ret
