
build/binary-tree-sort:     file format elf32-tradbigmips
build/binary-tree-sort


Disassembly of section .text:

bfc00000 <_start>:
bfc00000:	3c061000 	lui	a2,0x1000
bfc00004:	40866000 	mtc0	a2,c0_sr
bfc00008:	40806800 	mtc0	zero,c0_cause
bfc0000c:	3c1d8000 	lui	sp,0x8000
bfc00010:	27bd3fe0 	addiu	sp,sp,16352
bfc00014:	3c1e8001 	lui	s8,0x8001
bfc00018:	27de8180 	addiu	s8,s8,-32384
bfc0001c:	34070000 	li	a3,0x0
bfc00020:	00e00013 	mtlo	a3
bfc00024:	34180000 	li	t8,0x0
bfc00028:	03000011 	mthi	t8
bfc0002c:	0bf00132 	j	bfc004c8 <main>
bfc00030:	00000000 	nop

bfc00034 <exit>:
exit():
bfc00034:	0bf0000d 	j	bfc00034 <exit>
bfc00038:	00000000 	nop

bfc0003c <delay>:
delay():
bfc0003c:	27bdfff0 	addiu	sp,sp,-16
bfc00040:	afbe000c 	sw	s8,12(sp)
bfc00044:	03a0f021 	move	s8,sp
bfc00048:	afc00000 	sw	zero,0(s8)
bfc0004c:	10000005 	b	bfc00064 <delay+0x28>
bfc00050:	00000000 	nop
bfc00054:	8fc20000 	lw	v0,0(s8)
bfc00058:	00000000 	nop
bfc0005c:	24420001 	addiu	v0,v0,1
bfc00060:	afc20000 	sw	v0,0(s8)
bfc00064:	8fc30000 	lw	v1,0(s8)
bfc00068:	3c02004c 	lui	v0,0x4c
bfc0006c:	34424b40 	ori	v0,v0,0x4b40
bfc00070:	1462fff8 	bne	v1,v0,bfc00054 <delay+0x18>
bfc00074:	00000000 	nop
bfc00078:	03c0e821 	move	sp,s8
bfc0007c:	8fbe000c 	lw	s8,12(sp)
bfc00080:	27bd0010 	addiu	sp,sp,16
bfc00084:	03e00008 	jr	ra
bfc00088:	00000000 	nop

bfc0008c <init>:
init():
bfc0008c:	27bdffe8 	addiu	sp,sp,-24
bfc00090:	afbf0014 	sw	ra,20(sp)
bfc00094:	afbe0010 	sw	s8,16(sp)
bfc00098:	03a0f021 	move	s8,sp
bfc0009c:	3c02bfaf 	lui	v0,0xbfaf
bfc000a0:	3442f000 	ori	v0,v0,0xf000
bfc000a4:	240300f0 	li	v1,240
bfc000a8:	ac430000 	sw	v1,0(v0)
bfc000ac:	0ff0000f 	jal	bfc0003c <delay>
bfc000b0:	00000000 	nop
bfc000b4:	03c0e821 	move	sp,s8
bfc000b8:	8fbf0014 	lw	ra,20(sp)
bfc000bc:	8fbe0010 	lw	s8,16(sp)
bfc000c0:	27bd0018 	addiu	sp,sp,24
bfc000c4:	03e00008 	jr	ra
bfc000c8:	00000000 	nop

bfc000cc <print_result>:
print_result():
bfc000cc:	27bdffe8 	addiu	sp,sp,-24
bfc000d0:	afbf0014 	sw	ra,20(sp)
bfc000d4:	afbe0010 	sw	s8,16(sp)
bfc000d8:	03a0f021 	move	s8,sp
bfc000dc:	afc40018 	sw	a0,24(s8)
bfc000e0:	8fc30018 	lw	v1,24(s8)
bfc000e4:	24020001 	li	v0,1
bfc000e8:	14620009 	bne	v1,v0,bfc00110 <print_result+0x44>
bfc000ec:	00000000 	nop
bfc000f0:	0ff0000f 	jal	bfc0003c <delay>
bfc000f4:	00000000 	nop
bfc000f8:	3c02bfaf 	lui	v0,0xbfaf
bfc000fc:	3442f000 	ori	v0,v0,0xf000
bfc00100:	2403000f 	li	v1,15
bfc00104:	ac430000 	sw	v1,0(v0)
bfc00108:	1000fff9 	b	bfc000f0 <print_result+0x24>
bfc0010c:	00000000 	nop
bfc00110:	3c02bfaf 	lui	v0,0xbfaf
bfc00114:	3442f000 	ori	v0,v0,0xf000
bfc00118:	240300f0 	li	v1,240
bfc0011c:	ac430000 	sw	v1,0(v0)
bfc00120:	03c0e821 	move	sp,s8
bfc00124:	8fbf0014 	lw	ra,20(sp)
bfc00128:	8fbe0010 	lw	s8,16(sp)
bfc0012c:	27bd0018 	addiu	sp,sp,24
bfc00130:	03e00008 	jr	ra
bfc00134:	00000000 	nop

bfc00138 <rson>:
rson():
bfc00138:	27bdfff8 	addiu	sp,sp,-8
bfc0013c:	afbe0004 	sw	s8,4(sp)
bfc00140:	03a0f021 	move	s8,sp
bfc00144:	afc40008 	sw	a0,8(s8)
bfc00148:	3c038000 	lui	v1,0x8000
bfc0014c:	8fc20008 	lw	v0,8(s8)
bfc00150:	24630320 	addiu	v1,v1,800
bfc00154:	00021080 	sll	v0,v0,0x2
bfc00158:	00022080 	sll	a0,v0,0x2
bfc0015c:	00821023 	subu	v0,a0,v0
bfc00160:	00621021 	addu	v0,v1,v0
bfc00164:	8c420004 	lw	v0,4(v0)
bfc00168:	00000000 	nop
bfc0016c:	1440000e 	bnez	v0,bfc001a8 <rson+0x70>
bfc00170:	00000000 	nop
bfc00174:	8f828650 	lw	v0,-31152(gp)
bfc00178:	00000000 	nop
bfc0017c:	24420001 	addiu	v0,v0,1
bfc00180:	af828650 	sw	v0,-31152(gp)
bfc00184:	8f838650 	lw	v1,-31152(gp)
bfc00188:	3c048000 	lui	a0,0x8000
bfc0018c:	8fc20008 	lw	v0,8(s8)
bfc00190:	24840320 	addiu	a0,a0,800
bfc00194:	00021080 	sll	v0,v0,0x2
bfc00198:	00022880 	sll	a1,v0,0x2
bfc0019c:	00a21023 	subu	v0,a1,v0
bfc001a0:	00821021 	addu	v0,a0,v0
bfc001a4:	ac430004 	sw	v1,4(v0)
bfc001a8:	3c038000 	lui	v1,0x8000
bfc001ac:	8fc20008 	lw	v0,8(s8)
bfc001b0:	24630320 	addiu	v1,v1,800
bfc001b4:	00021080 	sll	v0,v0,0x2
bfc001b8:	00022080 	sll	a0,v0,0x2
bfc001bc:	00821023 	subu	v0,a0,v0
bfc001c0:	00621021 	addu	v0,v1,v0
bfc001c4:	8c420004 	lw	v0,4(v0)
bfc001c8:	03c0e821 	move	sp,s8
bfc001cc:	8fbe0004 	lw	s8,4(sp)
bfc001d0:	27bd0008 	addiu	sp,sp,8
bfc001d4:	03e00008 	jr	ra
bfc001d8:	00000000 	nop

bfc001dc <lson>:
lson():
bfc001dc:	27bdfff8 	addiu	sp,sp,-8
bfc001e0:	afbe0004 	sw	s8,4(sp)
bfc001e4:	03a0f021 	move	s8,sp
bfc001e8:	afc40008 	sw	a0,8(s8)
bfc001ec:	3c048000 	lui	a0,0x8000
bfc001f0:	8fc20008 	lw	v0,8(s8)
bfc001f4:	00000000 	nop
bfc001f8:	00021080 	sll	v0,v0,0x2
bfc001fc:	00021880 	sll	v1,v0,0x2
bfc00200:	00621823 	subu	v1,v1,v0
bfc00204:	24820320 	addiu	v0,a0,800
bfc00208:	00621021 	addu	v0,v1,v0
bfc0020c:	8c420000 	lw	v0,0(v0)
bfc00210:	00000000 	nop
bfc00214:	1440000f 	bnez	v0,bfc00254 <lson+0x78>
bfc00218:	00000000 	nop
bfc0021c:	8f828650 	lw	v0,-31152(gp)
bfc00220:	00000000 	nop
bfc00224:	24420001 	addiu	v0,v0,1
bfc00228:	af828650 	sw	v0,-31152(gp)
bfc0022c:	8f848650 	lw	a0,-31152(gp)
bfc00230:	3c058000 	lui	a1,0x8000
bfc00234:	8fc20008 	lw	v0,8(s8)
bfc00238:	00000000 	nop
bfc0023c:	00021080 	sll	v0,v0,0x2
bfc00240:	00021880 	sll	v1,v0,0x2
bfc00244:	00621823 	subu	v1,v1,v0
bfc00248:	24a20320 	addiu	v0,a1,800
bfc0024c:	00621021 	addu	v0,v1,v0
bfc00250:	ac440000 	sw	a0,0(v0)
bfc00254:	3c048000 	lui	a0,0x8000
bfc00258:	8fc20008 	lw	v0,8(s8)
bfc0025c:	00000000 	nop
bfc00260:	00021080 	sll	v0,v0,0x2
bfc00264:	00021880 	sll	v1,v0,0x2
bfc00268:	00621823 	subu	v1,v1,v0
bfc0026c:	24820320 	addiu	v0,a0,800
bfc00270:	00621021 	addu	v0,v1,v0
bfc00274:	8c420000 	lw	v0,0(v0)
bfc00278:	03c0e821 	move	sp,s8
bfc0027c:	8fbe0004 	lw	s8,4(sp)
bfc00280:	27bd0008 	addiu	sp,sp,8
bfc00284:	03e00008 	jr	ra
bfc00288:	00000000 	nop

bfc0028c <insert>:
insert():
bfc0028c:	27bdffe8 	addiu	sp,sp,-24
bfc00290:	afbf0014 	sw	ra,20(sp)
bfc00294:	afbe0010 	sw	s8,16(sp)
bfc00298:	03a0f021 	move	s8,sp
bfc0029c:	afc40018 	sw	a0,24(s8)
bfc002a0:	afc5001c 	sw	a1,28(s8)
bfc002a4:	3c048000 	lui	a0,0x8000
bfc002a8:	8fc2001c 	lw	v0,28(s8)
bfc002ac:	00000000 	nop
bfc002b0:	00021080 	sll	v0,v0,0x2
bfc002b4:	00021880 	sll	v1,v0,0x2
bfc002b8:	00621823 	subu	v1,v1,v0
bfc002bc:	24820320 	addiu	v0,a0,800
bfc002c0:	00621021 	addu	v0,v1,v0
bfc002c4:	8c420008 	lw	v0,8(v0)
bfc002c8:	00000000 	nop
bfc002cc:	1440000e 	bnez	v0,bfc00308 <insert+0x7c>
bfc002d0:	00000000 	nop
bfc002d4:	3c048000 	lui	a0,0x8000
bfc002d8:	8fc2001c 	lw	v0,28(s8)
bfc002dc:	00000000 	nop
bfc002e0:	00021080 	sll	v0,v0,0x2
bfc002e4:	00021880 	sll	v1,v0,0x2
bfc002e8:	00621823 	subu	v1,v1,v0
bfc002ec:	24820320 	addiu	v0,a0,800
bfc002f0:	00621021 	addu	v0,v1,v0
bfc002f4:	8fc30018 	lw	v1,24(s8)
bfc002f8:	00000000 	nop
bfc002fc:	ac430008 	sw	v1,8(v0)
bfc00300:	1000001f 	b	bfc00380 <insert+0xf4>
bfc00304:	00000000 	nop
bfc00308:	3c048000 	lui	a0,0x8000
bfc0030c:	8fc2001c 	lw	v0,28(s8)
bfc00310:	00000000 	nop
bfc00314:	00021080 	sll	v0,v0,0x2
bfc00318:	00021880 	sll	v1,v0,0x2
bfc0031c:	00621823 	subu	v1,v1,v0
bfc00320:	24820320 	addiu	v0,a0,800
bfc00324:	00621021 	addu	v0,v1,v0
bfc00328:	8c430008 	lw	v1,8(v0)
bfc0032c:	8fc20018 	lw	v0,24(s8)
bfc00330:	00000000 	nop
bfc00334:	0062102a 	slt	v0,v1,v0
bfc00338:	1040000a 	beqz	v0,bfc00364 <insert+0xd8>
bfc0033c:	00000000 	nop
bfc00340:	8fc4001c 	lw	a0,28(s8)
bfc00344:	0ff0004e 	jal	bfc00138 <rson>
bfc00348:	00000000 	nop
bfc0034c:	8fc40018 	lw	a0,24(s8)
bfc00350:	00402821 	move	a1,v0
bfc00354:	0ff000a3 	jal	bfc0028c <insert>
bfc00358:	00000000 	nop
bfc0035c:	10000008 	b	bfc00380 <insert+0xf4>
bfc00360:	00000000 	nop
bfc00364:	8fc4001c 	lw	a0,28(s8)
bfc00368:	0ff00077 	jal	bfc001dc <lson>
bfc0036c:	00000000 	nop
bfc00370:	8fc40018 	lw	a0,24(s8)
bfc00374:	00402821 	move	a1,v0
bfc00378:	0ff000a3 	jal	bfc0028c <insert>
bfc0037c:	00000000 	nop
bfc00380:	03c0e821 	move	sp,s8
bfc00384:	8fbf0014 	lw	ra,20(sp)
bfc00388:	8fbe0010 	lw	s8,16(sp)
bfc0038c:	27bd0018 	addiu	sp,sp,24
bfc00390:	03e00008 	jr	ra
bfc00394:	00000000 	nop

bfc00398 <recover>:
recover():
bfc00398:	27bdffe8 	addiu	sp,sp,-24
bfc0039c:	afbf0014 	sw	ra,20(sp)
bfc003a0:	afbe0010 	sw	s8,16(sp)
bfc003a4:	03a0f021 	move	s8,sp
bfc003a8:	afc40018 	sw	a0,24(s8)
bfc003ac:	3c048000 	lui	a0,0x8000
bfc003b0:	8fc20018 	lw	v0,24(s8)
bfc003b4:	00000000 	nop
bfc003b8:	00021080 	sll	v0,v0,0x2
bfc003bc:	00021880 	sll	v1,v0,0x2
bfc003c0:	00621823 	subu	v1,v1,v0
bfc003c4:	24820320 	addiu	v0,a0,800
bfc003c8:	00621021 	addu	v0,v1,v0
bfc003cc:	8c420000 	lw	v0,0(v0)
bfc003d0:	00000000 	nop
bfc003d4:	1040000e 	beqz	v0,bfc00410 <recover+0x78>
bfc003d8:	00000000 	nop
bfc003dc:	3c048000 	lui	a0,0x8000
bfc003e0:	8fc20018 	lw	v0,24(s8)
bfc003e4:	00000000 	nop
bfc003e8:	00021080 	sll	v0,v0,0x2
bfc003ec:	00021880 	sll	v1,v0,0x2
bfc003f0:	00621823 	subu	v1,v1,v0
bfc003f4:	24820320 	addiu	v0,a0,800
bfc003f8:	00621021 	addu	v0,v1,v0
bfc003fc:	8c420000 	lw	v0,0(v0)
bfc00400:	00000000 	nop
bfc00404:	00402021 	move	a0,v0
bfc00408:	0ff000e6 	jal	bfc00398 <recover>
bfc0040c:	00000000 	nop
bfc00410:	8f848654 	lw	a0,-31148(gp)
bfc00414:	3c058000 	lui	a1,0x8000
bfc00418:	8fc20018 	lw	v0,24(s8)
bfc0041c:	00000000 	nop
bfc00420:	00021080 	sll	v0,v0,0x2
bfc00424:	00021880 	sll	v1,v0,0x2
bfc00428:	00621823 	subu	v1,v1,v0
bfc0042c:	24a20320 	addiu	v0,a1,800
bfc00430:	00621021 	addu	v0,v1,v0
bfc00434:	8c430008 	lw	v1,8(v0)
bfc00438:	3c028000 	lui	v0,0x8000
bfc0043c:	00042880 	sll	a1,a0,0x2
bfc00440:	24420190 	addiu	v0,v0,400
bfc00444:	00a21021 	addu	v0,a1,v0
bfc00448:	ac430000 	sw	v1,0(v0)
bfc0044c:	24820001 	addiu	v0,a0,1
bfc00450:	af828654 	sw	v0,-31148(gp)
bfc00454:	3c038000 	lui	v1,0x8000
bfc00458:	8fc20018 	lw	v0,24(s8)
bfc0045c:	24630320 	addiu	v1,v1,800
bfc00460:	00021080 	sll	v0,v0,0x2
bfc00464:	00022080 	sll	a0,v0,0x2
bfc00468:	00821023 	subu	v0,a0,v0
bfc0046c:	00621021 	addu	v0,v1,v0
bfc00470:	8c420004 	lw	v0,4(v0)
bfc00474:	00000000 	nop
bfc00478:	1040000d 	beqz	v0,bfc004b0 <recover+0x118>
bfc0047c:	00000000 	nop
bfc00480:	3c038000 	lui	v1,0x8000
bfc00484:	8fc20018 	lw	v0,24(s8)
bfc00488:	24630320 	addiu	v1,v1,800
bfc0048c:	00021080 	sll	v0,v0,0x2
bfc00490:	00022080 	sll	a0,v0,0x2
bfc00494:	00821023 	subu	v0,a0,v0
bfc00498:	00621021 	addu	v0,v1,v0
bfc0049c:	8c420004 	lw	v0,4(v0)
bfc004a0:	00000000 	nop
bfc004a4:	00402021 	move	a0,v0
bfc004a8:	0ff000e6 	jal	bfc00398 <recover>
bfc004ac:	00000000 	nop
bfc004b0:	03c0e821 	move	sp,s8
bfc004b4:	8fbf0014 	lw	ra,20(sp)
bfc004b8:	8fbe0010 	lw	s8,16(sp)
bfc004bc:	27bd0018 	addiu	sp,sp,24
bfc004c0:	03e00008 	jr	ra
bfc004c4:	00000000 	nop

bfc004c8 <main>:
main():
bfc004c8:	27bdffe0 	addiu	sp,sp,-32
bfc004cc:	afbf001c 	sw	ra,28(sp)
bfc004d0:	afbe0018 	sw	s8,24(sp)
bfc004d4:	03a0f021 	move	s8,sp
bfc004d8:	0ff00023 	jal	bfc0008c <init>
bfc004dc:	00000000 	nop
bfc004e0:	afc00010 	sw	zero,16(s8)
bfc004e4:	afc00014 	sw	zero,20(s8)
bfc004e8:	10000011 	b	bfc00530 <main+0x68>
bfc004ec:	00000000 	nop
bfc004f0:	3c028000 	lui	v0,0x8000
bfc004f4:	8fc30014 	lw	v1,20(s8)
bfc004f8:	00000000 	nop
bfc004fc:	00031880 	sll	v1,v1,0x2
bfc00500:	24420000 	addiu	v0,v0,0
bfc00504:	00621021 	addu	v0,v1,v0
bfc00508:	8c420000 	lw	v0,0(v0)
bfc0050c:	00000000 	nop
bfc00510:	00402021 	move	a0,v0
bfc00514:	00002821 	move	a1,zero
bfc00518:	0ff000a3 	jal	bfc0028c <insert>
bfc0051c:	00000000 	nop
bfc00520:	8fc20014 	lw	v0,20(s8)
bfc00524:	00000000 	nop
bfc00528:	24420001 	addiu	v0,v0,1
bfc0052c:	afc20014 	sw	v0,20(s8)
bfc00530:	8fc20014 	lw	v0,20(s8)
bfc00534:	00000000 	nop
bfc00538:	28420064 	slti	v0,v0,100
bfc0053c:	1440ffec 	bnez	v0,bfc004f0 <main+0x28>
bfc00540:	00000000 	nop
bfc00544:	00002021 	move	a0,zero
bfc00548:	0ff000e6 	jal	bfc00398 <recover>
bfc0054c:	00000000 	nop
bfc00550:	afc00014 	sw	zero,20(s8)
bfc00554:	10000015 	b	bfc005ac <main+0xe4>
bfc00558:	00000000 	nop
bfc0055c:	3c028000 	lui	v0,0x8000
bfc00560:	8fc30014 	lw	v1,20(s8)
bfc00564:	00000000 	nop
bfc00568:	00031880 	sll	v1,v1,0x2
bfc0056c:	24420190 	addiu	v0,v0,400
bfc00570:	00621021 	addu	v0,v1,v0
bfc00574:	8c430000 	lw	v1,0(v0)
bfc00578:	8fc20014 	lw	v0,20(s8)
bfc0057c:	00000000 	nop
bfc00580:	24420001 	addiu	v0,v0,1
bfc00584:	10620005 	beq	v1,v0,bfc0059c <main+0xd4>
bfc00588:	00000000 	nop
bfc0058c:	24020001 	li	v0,1
bfc00590:	afc20010 	sw	v0,16(s8)
bfc00594:	1000000a 	b	bfc005c0 <main+0xf8>
bfc00598:	00000000 	nop
bfc0059c:	8fc20014 	lw	v0,20(s8)
bfc005a0:	00000000 	nop
bfc005a4:	24420001 	addiu	v0,v0,1
bfc005a8:	afc20014 	sw	v0,20(s8)
bfc005ac:	8fc20014 	lw	v0,20(s8)
bfc005b0:	00000000 	nop
bfc005b4:	28420064 	slti	v0,v0,100
bfc005b8:	1440ffe8 	bnez	v0,bfc0055c <main+0x94>
bfc005bc:	00000000 	nop
bfc005c0:	8fc30014 	lw	v1,20(s8)
bfc005c4:	24020064 	li	v0,100
bfc005c8:	10620003 	beq	v1,v0,bfc005d8 <main+0x110>
bfc005cc:	00000000 	nop
bfc005d0:	24020001 	li	v0,1
bfc005d4:	afc20010 	sw	v0,16(s8)
bfc005d8:	8fc20010 	lw	v0,16(s8)
bfc005dc:	00000000 	nop
bfc005e0:	2c420001 	sltiu	v0,v0,1
bfc005e4:	304200ff 	andi	v0,v0,0xff
bfc005e8:	00402021 	move	a0,v0
bfc005ec:	0ff00033 	jal	bfc000cc <print_result>
bfc005f0:	00000000 	nop
bfc005f4:	00001021 	move	v0,zero
bfc005f8:	03c0e821 	move	sp,s8
bfc005fc:	8fbf001c 	lw	ra,28(sp)
bfc00600:	8fbe0018 	lw	s8,24(sp)
bfc00604:	27bd0020 	addiu	sp,sp,32
bfc00608:	03e00008 	jr	ra
bfc0060c:	00000000 	nop

Disassembly of section .data:

80000000 <_fdata>:
_fdata():
80000000:	00000051 	0x51
80000004:	00000025 	move	zero,zero
80000008:	00000040 	ssnop
8000000c:	00000017 	0x17
80000010:	00000026 	xor	zero,zero,zero
80000014:	00000041 	0x41
80000018:	00000038 	0x38
8000001c:	0000000f 	0xf
80000020:	00000008 	jr	zero
80000024:	00000021 	move	zero,zero
80000028:	00000055 	0x55
8000002c:	00000027 	nor	zero,zero,zero
80000030:	00000047 	0x47
80000034:	0000000c 	syscall
80000038:	0000004d 	break	0x0,0x1
8000003c:	00000006 	srlv	zero,zero,zero
80000040:	00000052 	0x52
80000044:	00000059 	0x59
80000048:	00000050 	0x50
8000004c:	00000023 	negu	zero,zero
80000050:	00000064 	0x64
80000054:	0000003b 	0x3b
80000058:	00000049 	0x49
8000005c:	00000004 	sllv	zero,zero,zero
80000060:	0000003d 	0x3d
80000064:	0000001e 	0x1e
80000068:	0000004a 	0x4a
8000006c:	00000045 	0x45
80000070:	0000000d 	break
80000074:	0000002a 	slt	zero,zero,zero
80000078:	00000044 	0x44
8000007c:	0000003f 	0x3f
80000080:	00000009 	jalr	zero,zero
80000084:	0000001d 	0x1d
80000088:	0000002f 	0x2f
8000008c:	00000024 	and	zero,zero,zero
80000090:	00000063 	0x63
80000094:	00000019 	multu	zero,zero
80000098:	00000015 	0x15
8000009c:	0000000e 	0xe
800000a0:	0000003c 	0x3c
800000a4:	00000003 	sra	zero,zero,0x0
800000a8:	00000002 	srl	zero,zero,0x0
800000ac:	00000012 	mflo	zero
800000b0:	0000001a 	div	zero,zero,zero
800000b4:	00000053 	0x53
800000b8:	00000035 	0x35
800000bc:	00000005 	0x5
800000c0:	0000002b 	sltu	zero,zero,zero
800000c4:	00000043 	sra	zero,zero,0x1
800000c8:	00000058 	0x58
800000cc:	00000046 	0x46
800000d0:	0000004c 	syscall	0x1
800000d4:	0000005c 	0x5c
800000d8:	0000005e 	0x5e
800000dc:	00000030 	0x30
800000e0:	00000022 	neg	zero,zero
800000e4:	00000031 	0x31
800000e8:	00000042 	srl	zero,zero,0x1
800000ec:	0000005f 	0x5f
800000f0:	0000004e 	0x4e
800000f4:	0000003e 	0x3e
800000f8:	00000020 	add	zero,zero,zero
800000fc:	00000034 	0x34
80000100:	00000010 	mfhi	zero
80000104:	00000048 	0x48
80000108:	0000001b 	divu	zero,zero,zero
8000010c:	0000001c 	0x1c
80000110:	00000016 	0x16
80000114:	00000028 	0x28
80000118:	00000054 	0x54
8000011c:	0000005b 	0x5b
80000120:	00000060 	0x60
80000124:	00000039 	0x39
80000128:	00000057 	0x57
8000012c:	00000033 	0x33
80000130:	00000062 	0x62
80000134:	00000001 	0x1
80000138:	0000000a 	0xa
8000013c:	0000000b 	0xb
80000140:	00000018 	mult	zero,zero
80000144:	00000014 	0x14
80000148:	00000013 	mtlo	zero
8000014c:	0000001f 	0x1f
80000150:	00000007 	srav	zero,zero,zero
80000154:	00000061 	0x61
80000158:	00000032 	0x32
8000015c:	00000056 	0x56
80000160:	0000004f 	0x4f
80000164:	00000011 	mthi	zero
80000168:	0000004b 	0x4b
8000016c:	00000037 	0x37
80000170:	0000005d 	0x5d
80000174:	0000002c 	0x2c
80000178:	0000003a 	0x3a
8000017c:	00000036 	0x36
80000180:	0000002d 	0x2d
80000184:	00000029 	0x29
80000188:	0000005a 	0x5a
8000018c:	0000002e 	0x2e

Disassembly of section .bss:

80000190 <ans>:
	...

80000320 <tree>:
	...

Disassembly of section .sbss:

800007d0 <tree_cnt>:
800007d0:	00000000 	nop

800007d4 <ans_cnt>:
800007d4:	00000000 	nop

Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	710000c0 	0x710000c0
	...
  14:	80008180 	lb	zero,-32384(zero)

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	bfc0003c 	0xbfc0003c
   4:	40000000 	mfc0	zero,c0_index
   8:	fffffffc 	0xfffffffc
	...
  14:	00000010 	mfhi	zero
  18:	0000001e 	0x1e
  1c:	0000001f 	0x1f
  20:	bfc0008c 	0xbfc0008c
  24:	c0000000 	lwc0	$0,0(zero)
  28:	fffffffc 	0xfffffffc
	...
  34:	00000018 	mult	zero,zero
  38:	0000001e 	0x1e
  3c:	0000001f 	0x1f
  40:	bfc000cc 	0xbfc000cc
  44:	c0000000 	lwc0	$0,0(zero)
  48:	fffffffc 	0xfffffffc
	...
  54:	00000018 	mult	zero,zero
  58:	0000001e 	0x1e
  5c:	0000001f 	0x1f
  60:	bfc00138 	0xbfc00138
  64:	40000000 	mfc0	zero,c0_index
  68:	fffffffc 	0xfffffffc
	...
  74:	00000008 	jr	zero
  78:	0000001e 	0x1e
  7c:	0000001f 	0x1f
  80:	bfc001dc 	0xbfc001dc
  84:	40000000 	mfc0	zero,c0_index
  88:	fffffffc 	0xfffffffc
	...
  94:	00000008 	jr	zero
  98:	0000001e 	0x1e
  9c:	0000001f 	0x1f
  a0:	bfc0028c 	0xbfc0028c
  a4:	c0000000 	lwc0	$0,0(zero)
  a8:	fffffffc 	0xfffffffc
	...
  b4:	00000018 	mult	zero,zero
  b8:	0000001e 	0x1e
  bc:	0000001f 	0x1f
  c0:	bfc00398 	0xbfc00398
  c4:	c0000000 	lwc0	$0,0(zero)
  c8:	fffffffc 	0xfffffffc
	...
  d4:	00000018 	mult	zero,zero
  d8:	0000001e 	0x1e
  dc:	0000001f 	0x1f
  e0:	bfc004c8 	0xbfc004c8
  e4:	c0000000 	lwc0	$0,0(zero)
  e8:	fffffffc 	0xfffffffc
	...
  f4:	00000020 	add	zero,zero,zero
  f8:	0000001e 	0x1e
  fc:	0000001f 	0x1f

Disassembly of section .comment:

00000000 <.comment>:
   0:	4743433a 	c1	0x143433a
   4:	2028536f 	addi	t0,at,21359
   8:	75726365 	jalx	5c98d94 <_fdata-0x7a36726c>
   c:	72792043 	0x72792043
  10:	6f646542 	0x6f646542
  14:	656e6368 	0x656e6368
  18:	204c6974 	addi	t4,v0,26996
  1c:	65203230 	0x65203230
  20:	31332e30 	andi	s3,t1,0x2e30
  24:	352d3635 	ori	t5,t1,0x3635
  28:	2920342e 	slti	zero,t1,13358
  2c:	372e3300 	ori	t6,t9,0x3300

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	41000000 	bc0f	4 <_fdata-0x7ffffffc>
   4:	0f676e75 	jal	d9db9d4 <_fdata-0x7262462c>
   8:	00010000 	sll	zero,at,0x0
   c:	00070401 	0x70401
