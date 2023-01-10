
build/heap-dijkstra:     file format elf32-tradbigmips
build/heap-dijkstra


Disassembly of section .text:

bfc00000 <_start>:
bfc00000:	3c061000 	lui	a2,0x1000
bfc00004:	40866000 	mtc0	a2,c0_sr
bfc00008:	40806800 	mtc0	zero,c0_cause
bfc0000c:	3c1d8000 	lui	sp,0x8000
bfc00010:	27bd3fe0 	addiu	sp,sp,16352
bfc00014:	3c1e8001 	lui	s8,0x8001
bfc00018:	27de8010 	addiu	s8,s8,-32752
bfc0001c:	34070000 	li	a3,0x0
bfc00020:	00e00013 	mtlo	a3
bfc00024:	34180000 	li	t8,0x0
bfc00028:	03000011 	mthi	t8
bfc0002c:	0bf002db 	j	bfc00b6c <main>
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

bfc00138 <initAns>:
initAns():
bfc00138:	27bdfff0 	addiu	sp,sp,-16
bfc0013c:	afbe000c 	sw	s8,12(sp)
bfc00140:	03a0f021 	move	s8,sp
bfc00144:	afc00000 	sw	zero,0(s8)
bfc00148:	afc00000 	sw	zero,0(s8)
bfc0014c:	1000000e 	b	bfc00188 <initAns+0x50>
bfc00150:	00000000 	nop
bfc00154:	3c028000 	lui	v0,0x8000
bfc00158:	8fc30000 	lw	v1,0(s8)
bfc0015c:	00000000 	nop
bfc00160:	00031880 	sll	v1,v1,0x2
bfc00164:	24421154 	addiu	v0,v0,4436
bfc00168:	00621021 	addu	v0,v1,v0
bfc0016c:	3c033f3f 	lui	v1,0x3f3f
bfc00170:	34633f3f 	ori	v1,v1,0x3f3f
bfc00174:	ac430000 	sw	v1,0(v0)
bfc00178:	8fc20000 	lw	v0,0(s8)
bfc0017c:	00000000 	nop
bfc00180:	24420001 	addiu	v0,v0,1
bfc00184:	afc20000 	sw	v0,0(s8)
bfc00188:	8fc20000 	lw	v0,0(s8)
bfc0018c:	00000000 	nop
bfc00190:	28420064 	slti	v0,v0,100
bfc00194:	1440ffef 	bnez	v0,bfc00154 <initAns+0x1c>
bfc00198:	00000000 	nop
bfc0019c:	03c0e821 	move	sp,s8
bfc001a0:	8fbe000c 	lw	s8,12(sp)
bfc001a4:	27bd0010 	addiu	sp,sp,16
bfc001a8:	03e00008 	jr	ra
bfc001ac:	00000000 	nop

bfc001b0 <addEdge>:
addEdge():
bfc001b0:	27bdfff8 	addiu	sp,sp,-8
bfc001b4:	afbe0004 	sw	s8,4(sp)
bfc001b8:	03a0f021 	move	s8,sp
bfc001bc:	afc40008 	sw	a0,8(s8)
bfc001c0:	afc5000c 	sw	a1,12(s8)
bfc001c4:	afc60010 	sw	a2,16(s8)
bfc001c8:	8f838008 	lw	v1,-32760(gp)
bfc001cc:	3c028000 	lui	v0,0x8000
bfc001d0:	00031900 	sll	v1,v1,0x4
bfc001d4:	244204d4 	addiu	v0,v0,1236
bfc001d8:	00621021 	addu	v0,v1,v0
bfc001dc:	8fc30008 	lw	v1,8(s8)
bfc001e0:	00000000 	nop
bfc001e4:	ac430000 	sw	v1,0(v0)
bfc001e8:	8f828008 	lw	v0,-32760(gp)
bfc001ec:	3c038000 	lui	v1,0x8000
bfc001f0:	246304d4 	addiu	v1,v1,1236
bfc001f4:	00021100 	sll	v0,v0,0x4
bfc001f8:	00621021 	addu	v0,v1,v0
bfc001fc:	8fc3000c 	lw	v1,12(s8)
bfc00200:	00000000 	nop
bfc00204:	ac430004 	sw	v1,4(v0)
bfc00208:	8f838008 	lw	v1,-32760(gp)
bfc0020c:	3c028000 	lui	v0,0x8000
bfc00210:	00031900 	sll	v1,v1,0x4
bfc00214:	244204d4 	addiu	v0,v0,1236
bfc00218:	00621021 	addu	v0,v1,v0
bfc0021c:	8fc30010 	lw	v1,16(s8)
bfc00220:	00000000 	nop
bfc00224:	ac430008 	sw	v1,8(v0)
bfc00228:	8f828008 	lw	v0,-32760(gp)
bfc0022c:	3c038000 	lui	v1,0x8000
bfc00230:	8fc40008 	lw	a0,8(s8)
bfc00234:	00000000 	nop
bfc00238:	00042080 	sll	a0,a0,0x2
bfc0023c:	2463001c 	addiu	v1,v1,28
bfc00240:	00831821 	addu	v1,a0,v1
bfc00244:	8c630000 	lw	v1,0(v1)
bfc00248:	3c048000 	lui	a0,0x8000
bfc0024c:	248404d4 	addiu	a0,a0,1236
bfc00250:	00021100 	sll	v0,v0,0x4
bfc00254:	00821021 	addu	v0,a0,v0
bfc00258:	ac43000c 	sw	v1,12(v0)
bfc0025c:	8f838008 	lw	v1,-32760(gp)
bfc00260:	3c028000 	lui	v0,0x8000
bfc00264:	8fc40008 	lw	a0,8(s8)
bfc00268:	00000000 	nop
bfc0026c:	00042080 	sll	a0,a0,0x2
bfc00270:	2442001c 	addiu	v0,v0,28
bfc00274:	00821021 	addu	v0,a0,v0
bfc00278:	ac430000 	sw	v1,0(v0)
bfc0027c:	8f828008 	lw	v0,-32760(gp)
bfc00280:	00000000 	nop
bfc00284:	24420001 	addiu	v0,v0,1
bfc00288:	af828008 	sw	v0,-32760(gp)
bfc0028c:	00000000 	nop
bfc00290:	03c0e821 	move	sp,s8
bfc00294:	8fbe0004 	lw	s8,4(sp)
bfc00298:	27bd0008 	addiu	sp,sp,8
bfc0029c:	03e00008 	jr	ra
bfc002a0:	00000000 	nop

bfc002a4 <getMin>:
getMin():
bfc002a4:	27bdfff8 	addiu	sp,sp,-8
bfc002a8:	afbe0004 	sw	s8,4(sp)
bfc002ac:	03a0f021 	move	s8,sp
bfc002b0:	afc40008 	sw	a0,8(s8)
bfc002b4:	afc5000c 	sw	a1,12(s8)
bfc002b8:	8fc20008 	lw	v0,8(s8)
bfc002bc:	8fc3000c 	lw	v1,12(s8)
bfc002c0:	00000000 	nop
bfc002c4:	8c640000 	lw	a0,0(v1)
bfc002c8:	8c630004 	lw	v1,4(v1)
bfc002cc:	ac440000 	sw	a0,0(v0)
bfc002d0:	ac430004 	sw	v1,4(v0)
bfc002d4:	8fc20008 	lw	v0,8(s8)
bfc002d8:	03c0e821 	move	sp,s8
bfc002dc:	8fbe0004 	lw	s8,4(sp)
bfc002e0:	27bd0008 	addiu	sp,sp,8
bfc002e4:	03e00008 	jr	ra
bfc002e8:	00000000 	nop

bfc002ec <initHeap>:
initHeap():
bfc002ec:	27bdfff0 	addiu	sp,sp,-16
bfc002f0:	afbe000c 	sw	s8,12(sp)
bfc002f4:	03a0f021 	move	s8,sp
bfc002f8:	afc40010 	sw	a0,16(s8)
bfc002fc:	afc00000 	sw	zero,0(s8)
bfc00300:	8fc20010 	lw	v0,16(s8)
bfc00304:	24030064 	li	v1,100
bfc00308:	ac430324 	sw	v1,804(v0)
bfc0030c:	8fc20010 	lw	v0,16(s8)
bfc00310:	00000000 	nop
bfc00314:	ac400320 	sw	zero,800(v0)
bfc00318:	afc00000 	sw	zero,0(s8)
bfc0031c:	10000011 	b	bfc00364 <initHeap+0x78>
bfc00320:	00000000 	nop
bfc00324:	8fc30010 	lw	v1,16(s8)
bfc00328:	8fc20000 	lw	v0,0(s8)
bfc0032c:	00000000 	nop
bfc00330:	000210c0 	sll	v0,v0,0x3
bfc00334:	00621021 	addu	v0,v1,v0
bfc00338:	ac400004 	sw	zero,4(v0)
bfc0033c:	8fc30010 	lw	v1,16(s8)
bfc00340:	8fc20000 	lw	v0,0(s8)
bfc00344:	00000000 	nop
bfc00348:	000210c0 	sll	v0,v0,0x3
bfc0034c:	00621021 	addu	v0,v1,v0
bfc00350:	ac400000 	sw	zero,0(v0)
bfc00354:	8fc20000 	lw	v0,0(s8)
bfc00358:	00000000 	nop
bfc0035c:	24420001 	addiu	v0,v0,1
bfc00360:	afc20000 	sw	v0,0(s8)
bfc00364:	8fc20000 	lw	v0,0(s8)
bfc00368:	00000000 	nop
bfc0036c:	28420064 	slti	v0,v0,100
bfc00370:	1440ffec 	bnez	v0,bfc00324 <initHeap+0x38>
bfc00374:	00000000 	nop
bfc00378:	03c0e821 	move	sp,s8
bfc0037c:	8fbe000c 	lw	s8,12(sp)
bfc00380:	27bd0010 	addiu	sp,sp,16
bfc00384:	03e00008 	jr	ra
bfc00388:	00000000 	nop

bfc0038c <push>:
push():
bfc0038c:	27bdffe8 	addiu	sp,sp,-24
bfc00390:	afbe0014 	sw	s8,20(sp)
bfc00394:	03a0f021 	move	s8,sp
bfc00398:	afc40018 	sw	a0,24(s8)
bfc0039c:	afc5001c 	sw	a1,28(s8)
bfc003a0:	afc60020 	sw	a2,32(s8)
bfc003a4:	8fc20018 	lw	v0,24(s8)
bfc003a8:	00000000 	nop
bfc003ac:	8c430320 	lw	v1,800(v0)
bfc003b0:	8fc20018 	lw	v0,24(s8)
bfc003b4:	00000000 	nop
bfc003b8:	8c420324 	lw	v0,804(v0)
bfc003bc:	00000000 	nop
bfc003c0:	14620004 	bne	v1,v0,bfc003d4 <push+0x48>
bfc003c4:	00000000 	nop
bfc003c8:	8fc20018 	lw	v0,24(s8)
bfc003cc:	10000057 	b	bfc0052c <push+0x1a0>
bfc003d0:	00000000 	nop
bfc003d4:	8fc20018 	lw	v0,24(s8)
bfc003d8:	00000000 	nop
bfc003dc:	8c420320 	lw	v0,800(v0)
bfc003e0:	8fc40018 	lw	a0,24(s8)
bfc003e4:	000218c0 	sll	v1,v0,0x3
bfc003e8:	00831821 	addu	v1,a0,v1
bfc003ec:	8fc5001c 	lw	a1,28(s8)
bfc003f0:	8fc40020 	lw	a0,32(s8)
bfc003f4:	ac650000 	sw	a1,0(v1)
bfc003f8:	ac640004 	sw	a0,4(v1)
bfc003fc:	24430001 	addiu	v1,v0,1
bfc00400:	8fc20018 	lw	v0,24(s8)
bfc00404:	00000000 	nop
bfc00408:	ac430320 	sw	v1,800(v0)
bfc0040c:	8fc20018 	lw	v0,24(s8)
bfc00410:	00000000 	nop
bfc00414:	8c420320 	lw	v0,800(v0)
bfc00418:	00000000 	nop
bfc0041c:	2442ffff 	addiu	v0,v0,-1
bfc00420:	afc20000 	sw	v0,0(s8)
bfc00424:	1000002a 	b	bfc004d0 <push+0x144>
bfc00428:	00000000 	nop
bfc0042c:	8fc20000 	lw	v0,0(s8)
bfc00430:	00000000 	nop
bfc00434:	2442ffff 	addiu	v0,v0,-1
bfc00438:	00021043 	sra	v0,v0,0x1
bfc0043c:	8fc30018 	lw	v1,24(s8)
bfc00440:	000210c0 	sll	v0,v0,0x3
bfc00444:	00621021 	addu	v0,v1,v0
bfc00448:	8c430000 	lw	v1,0(v0)
bfc0044c:	8c420004 	lw	v0,4(v0)
bfc00450:	afc30004 	sw	v1,4(s8)
bfc00454:	afc20008 	sw	v0,8(s8)
bfc00458:	8fc20000 	lw	v0,0(s8)
bfc0045c:	00000000 	nop
bfc00460:	2442ffff 	addiu	v0,v0,-1
bfc00464:	00021043 	sra	v0,v0,0x1
bfc00468:	8fc30018 	lw	v1,24(s8)
bfc0046c:	000210c0 	sll	v0,v0,0x3
bfc00470:	00621021 	addu	v0,v1,v0
bfc00474:	8fc40018 	lw	a0,24(s8)
bfc00478:	8fc30000 	lw	v1,0(s8)
bfc0047c:	00000000 	nop
bfc00480:	000318c0 	sll	v1,v1,0x3
bfc00484:	00831821 	addu	v1,a0,v1
bfc00488:	8c640000 	lw	a0,0(v1)
bfc0048c:	8c630004 	lw	v1,4(v1)
bfc00490:	ac440000 	sw	a0,0(v0)
bfc00494:	ac430004 	sw	v1,4(v0)
bfc00498:	8fc30018 	lw	v1,24(s8)
bfc0049c:	8fc20000 	lw	v0,0(s8)
bfc004a0:	00000000 	nop
bfc004a4:	000210c0 	sll	v0,v0,0x3
bfc004a8:	00621021 	addu	v0,v1,v0
bfc004ac:	8fc40004 	lw	a0,4(s8)
bfc004b0:	8fc30008 	lw	v1,8(s8)
bfc004b4:	ac440000 	sw	a0,0(v0)
bfc004b8:	ac430004 	sw	v1,4(v0)
bfc004bc:	8fc20000 	lw	v0,0(s8)
bfc004c0:	00000000 	nop
bfc004c4:	2442ffff 	addiu	v0,v0,-1
bfc004c8:	00021043 	sra	v0,v0,0x1
bfc004cc:	afc20000 	sw	v0,0(s8)
bfc004d0:	8fc20000 	lw	v0,0(s8)
bfc004d4:	00000000 	nop
bfc004d8:	18400013 	blez	v0,bfc00528 <push+0x19c>
bfc004dc:	00000000 	nop
bfc004e0:	8fc20000 	lw	v0,0(s8)
bfc004e4:	00000000 	nop
bfc004e8:	2442ffff 	addiu	v0,v0,-1
bfc004ec:	00021043 	sra	v0,v0,0x1
bfc004f0:	8fc30018 	lw	v1,24(s8)
bfc004f4:	000210c0 	sll	v0,v0,0x3
bfc004f8:	00621021 	addu	v0,v1,v0
bfc004fc:	8c430004 	lw	v1,4(v0)
bfc00500:	8fc40018 	lw	a0,24(s8)
bfc00504:	8fc20000 	lw	v0,0(s8)
bfc00508:	00000000 	nop
bfc0050c:	000210c0 	sll	v0,v0,0x3
bfc00510:	00821021 	addu	v0,a0,v0
bfc00514:	8c420004 	lw	v0,4(v0)
bfc00518:	00000000 	nop
bfc0051c:	0043102a 	slt	v0,v0,v1
bfc00520:	1440ffc2 	bnez	v0,bfc0042c <push+0xa0>
bfc00524:	00000000 	nop
bfc00528:	8fc20018 	lw	v0,24(s8)
bfc0052c:	03c0e821 	move	sp,s8
bfc00530:	8fbe0014 	lw	s8,20(sp)
bfc00534:	27bd0018 	addiu	sp,sp,24
bfc00538:	03e00008 	jr	ra
bfc0053c:	00000000 	nop

bfc00540 <heapify>:
heapify():
bfc00540:	27bdffd0 	addiu	sp,sp,-48
bfc00544:	afbf002c 	sw	ra,44(sp)
bfc00548:	afbe0028 	sw	s8,40(sp)
bfc0054c:	03a0f021 	move	s8,sp
bfc00550:	afc40030 	sw	a0,48(s8)
bfc00554:	afc50034 	sw	a1,52(s8)
bfc00558:	8fc20030 	lw	v0,48(s8)
bfc0055c:	00000000 	nop
bfc00560:	8c420320 	lw	v0,800(v0)
bfc00564:	00000000 	nop
bfc00568:	28420002 	slti	v0,v0,2
bfc0056c:	10400004 	beqz	v0,bfc00580 <heapify+0x40>
bfc00570:	00000000 	nop
bfc00574:	8fc20030 	lw	v0,48(s8)
bfc00578:	1000006f 	b	bfc00738 <heapify+0x1f8>
bfc0057c:	00000000 	nop
bfc00580:	8fc20034 	lw	v0,52(s8)
bfc00584:	00000000 	nop
bfc00588:	00021040 	sll	v0,v0,0x1
bfc0058c:	34420001 	ori	v0,v0,0x1
bfc00590:	afc20014 	sw	v0,20(s8)
bfc00594:	8fc20034 	lw	v0,52(s8)
bfc00598:	00000000 	nop
bfc0059c:	00021040 	sll	v0,v0,0x1
bfc005a0:	24420002 	addiu	v0,v0,2
bfc005a4:	afc20018 	sw	v0,24(s8)
bfc005a8:	8fc20034 	lw	v0,52(s8)
bfc005ac:	00000000 	nop
bfc005b0:	afc20010 	sw	v0,16(s8)
bfc005b4:	8fc20030 	lw	v0,48(s8)
bfc005b8:	00000000 	nop
bfc005bc:	8c430320 	lw	v1,800(v0)
bfc005c0:	8fc20014 	lw	v0,20(s8)
bfc005c4:	00000000 	nop
bfc005c8:	0043102a 	slt	v0,v0,v1
bfc005cc:	10400014 	beqz	v0,bfc00620 <heapify+0xe0>
bfc005d0:	00000000 	nop
bfc005d4:	8fc30030 	lw	v1,48(s8)
bfc005d8:	8fc20014 	lw	v0,20(s8)
bfc005dc:	00000000 	nop
bfc005e0:	000210c0 	sll	v0,v0,0x3
bfc005e4:	00621021 	addu	v0,v1,v0
bfc005e8:	8c430004 	lw	v1,4(v0)
bfc005ec:	8fc40030 	lw	a0,48(s8)
bfc005f0:	8fc20034 	lw	v0,52(s8)
bfc005f4:	00000000 	nop
bfc005f8:	000210c0 	sll	v0,v0,0x3
bfc005fc:	00821021 	addu	v0,a0,v0
bfc00600:	8c420004 	lw	v0,4(v0)
bfc00604:	00000000 	nop
bfc00608:	0062102a 	slt	v0,v1,v0
bfc0060c:	10400004 	beqz	v0,bfc00620 <heapify+0xe0>
bfc00610:	00000000 	nop
bfc00614:	8fc20014 	lw	v0,20(s8)
bfc00618:	00000000 	nop
bfc0061c:	afc20010 	sw	v0,16(s8)
bfc00620:	8fc20030 	lw	v0,48(s8)
bfc00624:	00000000 	nop
bfc00628:	8c430320 	lw	v1,800(v0)
bfc0062c:	8fc20018 	lw	v0,24(s8)
bfc00630:	00000000 	nop
bfc00634:	0043102a 	slt	v0,v0,v1
bfc00638:	10400014 	beqz	v0,bfc0068c <heapify+0x14c>
bfc0063c:	00000000 	nop
bfc00640:	8fc30030 	lw	v1,48(s8)
bfc00644:	8fc20018 	lw	v0,24(s8)
bfc00648:	00000000 	nop
bfc0064c:	000210c0 	sll	v0,v0,0x3
bfc00650:	00621021 	addu	v0,v1,v0
bfc00654:	8c430004 	lw	v1,4(v0)
bfc00658:	8fc40030 	lw	a0,48(s8)
bfc0065c:	8fc20034 	lw	v0,52(s8)
bfc00660:	00000000 	nop
bfc00664:	000210c0 	sll	v0,v0,0x3
bfc00668:	00821021 	addu	v0,a0,v0
bfc0066c:	8c420004 	lw	v0,4(v0)
bfc00670:	00000000 	nop
bfc00674:	0062102a 	slt	v0,v1,v0
bfc00678:	10400004 	beqz	v0,bfc0068c <heapify+0x14c>
bfc0067c:	00000000 	nop
bfc00680:	8fc20018 	lw	v0,24(s8)
bfc00684:	00000000 	nop
bfc00688:	afc20010 	sw	v0,16(s8)
bfc0068c:	8fc30010 	lw	v1,16(s8)
bfc00690:	8fc20034 	lw	v0,52(s8)
bfc00694:	00000000 	nop
bfc00698:	10620026 	beq	v1,v0,bfc00734 <heapify+0x1f4>
bfc0069c:	00000000 	nop
bfc006a0:	8fc30030 	lw	v1,48(s8)
bfc006a4:	8fc20034 	lw	v0,52(s8)
bfc006a8:	00000000 	nop
bfc006ac:	000210c0 	sll	v0,v0,0x3
bfc006b0:	00621021 	addu	v0,v1,v0
bfc006b4:	8c430000 	lw	v1,0(v0)
bfc006b8:	8c420004 	lw	v0,4(v0)
bfc006bc:	afc3001c 	sw	v1,28(s8)
bfc006c0:	afc20020 	sw	v0,32(s8)
bfc006c4:	8fc30030 	lw	v1,48(s8)
bfc006c8:	8fc20034 	lw	v0,52(s8)
bfc006cc:	00000000 	nop
bfc006d0:	000210c0 	sll	v0,v0,0x3
bfc006d4:	00621021 	addu	v0,v1,v0
bfc006d8:	8fc40030 	lw	a0,48(s8)
bfc006dc:	8fc30010 	lw	v1,16(s8)
bfc006e0:	00000000 	nop
bfc006e4:	000318c0 	sll	v1,v1,0x3
bfc006e8:	00831821 	addu	v1,a0,v1
bfc006ec:	8c640000 	lw	a0,0(v1)
bfc006f0:	8c630004 	lw	v1,4(v1)
bfc006f4:	ac440000 	sw	a0,0(v0)
bfc006f8:	ac430004 	sw	v1,4(v0)
bfc006fc:	8fc30030 	lw	v1,48(s8)
bfc00700:	8fc20010 	lw	v0,16(s8)
bfc00704:	00000000 	nop
bfc00708:	000210c0 	sll	v0,v0,0x3
bfc0070c:	00621021 	addu	v0,v1,v0
bfc00710:	8fc4001c 	lw	a0,28(s8)
bfc00714:	8fc30020 	lw	v1,32(s8)
bfc00718:	ac440000 	sw	a0,0(v0)
bfc0071c:	ac430004 	sw	v1,4(v0)
bfc00720:	8fc40030 	lw	a0,48(s8)
bfc00724:	8fc50010 	lw	a1,16(s8)
bfc00728:	0ff00150 	jal	bfc00540 <heapify>
bfc0072c:	00000000 	nop
bfc00730:	afc20030 	sw	v0,48(s8)
bfc00734:	8fc20030 	lw	v0,48(s8)
bfc00738:	03c0e821 	move	sp,s8
bfc0073c:	8fbf002c 	lw	ra,44(sp)
bfc00740:	8fbe0028 	lw	s8,40(sp)
bfc00744:	27bd0030 	addiu	sp,sp,48
bfc00748:	03e00008 	jr	ra
bfc0074c:	00000000 	nop

bfc00750 <pop>:
pop():
bfc00750:	27bdffe8 	addiu	sp,sp,-24
bfc00754:	afbf0014 	sw	ra,20(sp)
bfc00758:	afbe0010 	sw	s8,16(sp)
bfc0075c:	03a0f021 	move	s8,sp
bfc00760:	afc40018 	sw	a0,24(s8)
bfc00764:	afc5001c 	sw	a1,28(s8)
bfc00768:	8fc20018 	lw	v0,24(s8)
bfc0076c:	00000000 	nop
bfc00770:	8c420320 	lw	v0,800(v0)
bfc00774:	00000000 	nop
bfc00778:	14400004 	bnez	v0,bfc0078c <pop+0x3c>
bfc0077c:	00000000 	nop
bfc00780:	8fc20018 	lw	v0,24(s8)
bfc00784:	10000021 	b	bfc0080c <pop+0xbc>
bfc00788:	00000000 	nop
bfc0078c:	8fc2001c 	lw	v0,28(s8)
bfc00790:	8fc30018 	lw	v1,24(s8)
bfc00794:	00000000 	nop
bfc00798:	8c640000 	lw	a0,0(v1)
bfc0079c:	8c630004 	lw	v1,4(v1)
bfc007a0:	ac440000 	sw	a0,0(v0)
bfc007a4:	ac430004 	sw	v1,4(v0)
bfc007a8:	8fc20018 	lw	v0,24(s8)
bfc007ac:	00000000 	nop
bfc007b0:	8c420320 	lw	v0,800(v0)
bfc007b4:	00000000 	nop
bfc007b8:	2443ffff 	addiu	v1,v0,-1
bfc007bc:	8fc20018 	lw	v0,24(s8)
bfc007c0:	00000000 	nop
bfc007c4:	ac430320 	sw	v1,800(v0)
bfc007c8:	8fc20018 	lw	v0,24(s8)
bfc007cc:	00000000 	nop
bfc007d0:	8c430320 	lw	v1,800(v0)
bfc007d4:	8fc20018 	lw	v0,24(s8)
bfc007d8:	8fc40018 	lw	a0,24(s8)
bfc007dc:	000318c0 	sll	v1,v1,0x3
bfc007e0:	00831821 	addu	v1,a0,v1
bfc007e4:	8c640000 	lw	a0,0(v1)
bfc007e8:	8c630004 	lw	v1,4(v1)
bfc007ec:	ac440000 	sw	a0,0(v0)
bfc007f0:	ac430004 	sw	v1,4(v0)
bfc007f4:	8fc40018 	lw	a0,24(s8)
bfc007f8:	00002821 	move	a1,zero
bfc007fc:	0ff00150 	jal	bfc00540 <heapify>
bfc00800:	00000000 	nop
bfc00804:	afc20018 	sw	v0,24(s8)
bfc00808:	8fc20018 	lw	v0,24(s8)
bfc0080c:	03c0e821 	move	sp,s8
bfc00810:	8fbf0014 	lw	ra,20(sp)
bfc00814:	8fbe0010 	lw	s8,16(sp)
bfc00818:	27bd0018 	addiu	sp,sp,24
bfc0081c:	03e00008 	jr	ra
bfc00820:	00000000 	nop

bfc00824 <empty>:
empty():
bfc00824:	27bdfff8 	addiu	sp,sp,-8
bfc00828:	afbe0004 	sw	s8,4(sp)
bfc0082c:	03a0f021 	move	s8,sp
bfc00830:	afc40008 	sw	a0,8(s8)
bfc00834:	8fc20008 	lw	v0,8(s8)
bfc00838:	00000000 	nop
bfc0083c:	8c420320 	lw	v0,800(v0)
bfc00840:	00000000 	nop
bfc00844:	2c420001 	sltiu	v0,v0,1
bfc00848:	304200ff 	andi	v0,v0,0xff
bfc0084c:	03c0e821 	move	sp,s8
bfc00850:	8fbe0004 	lw	s8,4(sp)
bfc00854:	27bd0008 	addiu	sp,sp,8
bfc00858:	03e00008 	jr	ra
bfc0085c:	00000000 	nop

bfc00860 <Dijkstra>:
Dijkstra():
bfc00860:	27bdffc0 	addiu	sp,sp,-64
bfc00864:	afbf003c 	sw	ra,60(sp)
bfc00868:	afbe0038 	sw	s8,56(sp)
bfc0086c:	03a0f021 	move	s8,sp
bfc00870:	afc40040 	sw	a0,64(s8)
bfc00874:	afc00024 	sw	zero,36(s8)
bfc00878:	8fc20040 	lw	v0,64(s8)
bfc0087c:	00000000 	nop
bfc00880:	afc20020 	sw	v0,32(s8)
bfc00884:	3c028000 	lui	v0,0x8000
bfc00888:	8fc30040 	lw	v1,64(s8)
bfc0088c:	00000000 	nop
bfc00890:	00031880 	sll	v1,v1,0x2
bfc00894:	24421154 	addiu	v0,v0,4436
bfc00898:	00621021 	addu	v0,v1,v0
bfc0089c:	ac400000 	sw	zero,0(v0)
bfc008a0:	3c028000 	lui	v0,0x8000
bfc008a4:	244401ac 	addiu	a0,v0,428
bfc008a8:	8fc50020 	lw	a1,32(s8)
bfc008ac:	8fc60024 	lw	a2,36(s8)
bfc008b0:	0ff000e3 	jal	bfc0038c <push>
bfc008b4:	00000000 	nop
bfc008b8:	1000006e 	b	bfc00a74 <Dijkstra+0x214>
bfc008bc:	00000000 	nop
bfc008c0:	27c20028 	addiu	v0,s8,40
bfc008c4:	3c038000 	lui	v1,0x8000
bfc008c8:	246401ac 	addiu	a0,v1,428
bfc008cc:	00402821 	move	a1,v0
bfc008d0:	0ff001d4 	jal	bfc00750 <pop>
bfc008d4:	00000000 	nop
bfc008d8:	8fc3002c 	lw	v1,44(s8)
bfc008dc:	8fc40028 	lw	a0,40(s8)
bfc008e0:	3c028000 	lui	v0,0x8000
bfc008e4:	00042080 	sll	a0,a0,0x2
bfc008e8:	24421154 	addiu	v0,v0,4436
bfc008ec:	00821021 	addu	v0,a0,v0
bfc008f0:	8c420000 	lw	v0,0(v0)
bfc008f4:	00000000 	nop
bfc008f8:	0043102a 	slt	v0,v0,v1
bfc008fc:	1440005d 	bnez	v0,bfc00a74 <Dijkstra+0x214>
bfc00900:	00000000 	nop
bfc00904:	8fc2002c 	lw	v0,44(s8)
bfc00908:	00000000 	nop
bfc0090c:	afc20014 	sw	v0,20(s8)
bfc00910:	8fc20028 	lw	v0,40(s8)
bfc00914:	00000000 	nop
bfc00918:	afc20018 	sw	v0,24(s8)
bfc0091c:	3c028000 	lui	v0,0x8000
bfc00920:	8fc30018 	lw	v1,24(s8)
bfc00924:	00000000 	nop
bfc00928:	00031880 	sll	v1,v1,0x2
bfc0092c:	2442001c 	addiu	v0,v0,28
bfc00930:	00621021 	addu	v0,v1,v0
bfc00934:	8c420000 	lw	v0,0(v0)
bfc00938:	00000000 	nop
bfc0093c:	afc20010 	sw	v0,16(s8)
bfc00940:	10000048 	b	bfc00a64 <Dijkstra+0x204>
bfc00944:	00000000 	nop
bfc00948:	3c038000 	lui	v1,0x8000
bfc0094c:	8fc20010 	lw	v0,16(s8)
bfc00950:	246304d4 	addiu	v1,v1,1236
bfc00954:	00021100 	sll	v0,v0,0x4
bfc00958:	00621021 	addu	v0,v1,v0
bfc0095c:	8c420004 	lw	v0,4(v0)
bfc00960:	00000000 	nop
bfc00964:	afc2001c 	sw	v0,28(s8)
bfc00968:	3c028000 	lui	v0,0x8000
bfc0096c:	8fc3001c 	lw	v1,28(s8)
bfc00970:	00000000 	nop
bfc00974:	00031880 	sll	v1,v1,0x2
bfc00978:	24421154 	addiu	v0,v0,4436
bfc0097c:	00621021 	addu	v0,v1,v0
bfc00980:	8c430000 	lw	v1,0(v0)
bfc00984:	3c028000 	lui	v0,0x8000
bfc00988:	8fc40010 	lw	a0,16(s8)
bfc0098c:	00000000 	nop
bfc00990:	00042100 	sll	a0,a0,0x4
bfc00994:	244204d4 	addiu	v0,v0,1236
bfc00998:	00821021 	addu	v0,a0,v0
bfc0099c:	8c440008 	lw	a0,8(v0)
bfc009a0:	8fc20014 	lw	v0,20(s8)
bfc009a4:	00000000 	nop
bfc009a8:	00821021 	addu	v0,a0,v0
bfc009ac:	0043102a 	slt	v0,v0,v1
bfc009b0:	10400024 	beqz	v0,bfc00a44 <Dijkstra+0x1e4>
bfc009b4:	00000000 	nop
bfc009b8:	3c028000 	lui	v0,0x8000
bfc009bc:	8fc30010 	lw	v1,16(s8)
bfc009c0:	00000000 	nop
bfc009c4:	00031900 	sll	v1,v1,0x4
bfc009c8:	244204d4 	addiu	v0,v0,1236
bfc009cc:	00621021 	addu	v0,v1,v0
bfc009d0:	8c430008 	lw	v1,8(v0)
bfc009d4:	8fc20014 	lw	v0,20(s8)
bfc009d8:	00000000 	nop
bfc009dc:	00621821 	addu	v1,v1,v0
bfc009e0:	3c028000 	lui	v0,0x8000
bfc009e4:	8fc4001c 	lw	a0,28(s8)
bfc009e8:	00000000 	nop
bfc009ec:	00042080 	sll	a0,a0,0x2
bfc009f0:	24421154 	addiu	v0,v0,4436
bfc009f4:	00821021 	addu	v0,a0,v0
bfc009f8:	ac430000 	sw	v1,0(v0)
bfc009fc:	3c028000 	lui	v0,0x8000
bfc00a00:	8fc3001c 	lw	v1,28(s8)
bfc00a04:	00000000 	nop
bfc00a08:	00031880 	sll	v1,v1,0x2
bfc00a0c:	24421154 	addiu	v0,v0,4436
bfc00a10:	00621021 	addu	v0,v1,v0
bfc00a14:	8c420000 	lw	v0,0(v0)
bfc00a18:	00000000 	nop
bfc00a1c:	afc20034 	sw	v0,52(s8)
bfc00a20:	8fc2001c 	lw	v0,28(s8)
bfc00a24:	00000000 	nop
bfc00a28:	afc20030 	sw	v0,48(s8)
bfc00a2c:	3c028000 	lui	v0,0x8000
bfc00a30:	244401ac 	addiu	a0,v0,428
bfc00a34:	8fc50030 	lw	a1,48(s8)
bfc00a38:	8fc60034 	lw	a2,52(s8)
bfc00a3c:	0ff000e3 	jal	bfc0038c <push>
bfc00a40:	00000000 	nop
bfc00a44:	3c038000 	lui	v1,0x8000
bfc00a48:	8fc20010 	lw	v0,16(s8)
bfc00a4c:	246304d4 	addiu	v1,v1,1236
bfc00a50:	00021100 	sll	v0,v0,0x4
bfc00a54:	00621021 	addu	v0,v1,v0
bfc00a58:	8c42000c 	lw	v0,12(v0)
bfc00a5c:	00000000 	nop
bfc00a60:	afc20010 	sw	v0,16(s8)
bfc00a64:	8fc20010 	lw	v0,16(s8)
bfc00a68:	00000000 	nop
bfc00a6c:	1440ffb6 	bnez	v0,bfc00948 <Dijkstra+0xe8>
bfc00a70:	00000000 	nop
bfc00a74:	3c028000 	lui	v0,0x8000
bfc00a78:	244401ac 	addiu	a0,v0,428
bfc00a7c:	0ff00209 	jal	bfc00824 <empty>
bfc00a80:	00000000 	nop
bfc00a84:	1040ff8e 	beqz	v0,bfc008c0 <Dijkstra+0x60>
bfc00a88:	00000000 	nop
bfc00a8c:	03c0e821 	move	sp,s8
bfc00a90:	8fbf003c 	lw	ra,60(sp)
bfc00a94:	8fbe0038 	lw	s8,56(sp)
bfc00a98:	27bd0040 	addiu	sp,sp,64
bfc00a9c:	03e00008 	jr	ra
bfc00aa0:	00000000 	nop

bfc00aa4 <drawMap>:
drawMap():
bfc00aa4:	27bdffe8 	addiu	sp,sp,-24
bfc00aa8:	afbf0014 	sw	ra,20(sp)
bfc00aac:	afbe0010 	sw	s8,16(sp)
bfc00ab0:	03a0f021 	move	s8,sp
bfc00ab4:	24040001 	li	a0,1
bfc00ab8:	24050002 	li	a1,2
bfc00abc:	24060001 	li	a2,1
bfc00ac0:	0ff0006c 	jal	bfc001b0 <addEdge>
bfc00ac4:	00000000 	nop
bfc00ac8:	24040001 	li	a0,1
bfc00acc:	24050004 	li	a1,4
bfc00ad0:	24060004 	li	a2,4
bfc00ad4:	0ff0006c 	jal	bfc001b0 <addEdge>
bfc00ad8:	00000000 	nop
bfc00adc:	24040002 	li	a0,2
bfc00ae0:	24050003 	li	a1,3
bfc00ae4:	24060008 	li	a2,8
bfc00ae8:	0ff0006c 	jal	bfc001b0 <addEdge>
bfc00aec:	00000000 	nop
bfc00af0:	24040002 	li	a0,2
bfc00af4:	24050004 	li	a1,4
bfc00af8:	24060002 	li	a2,2
bfc00afc:	0ff0006c 	jal	bfc001b0 <addEdge>
bfc00b00:	00000000 	nop
bfc00b04:	24040003 	li	a0,3
bfc00b08:	24050005 	li	a1,5
bfc00b0c:	2406000a 	li	a2,10
bfc00b10:	0ff0006c 	jal	bfc001b0 <addEdge>
bfc00b14:	00000000 	nop
bfc00b18:	24040004 	li	a0,4
bfc00b1c:	24050002 	li	a1,2
bfc00b20:	24060002 	li	a2,2
bfc00b24:	0ff0006c 	jal	bfc001b0 <addEdge>
bfc00b28:	00000000 	nop
bfc00b2c:	24040004 	li	a0,4
bfc00b30:	24050005 	li	a1,5
bfc00b34:	24060002 	li	a2,2
bfc00b38:	0ff0006c 	jal	bfc001b0 <addEdge>
bfc00b3c:	00000000 	nop
bfc00b40:	24040005 	li	a0,5
bfc00b44:	24050003 	li	a1,3
bfc00b48:	24060003 	li	a2,3
bfc00b4c:	0ff0006c 	jal	bfc001b0 <addEdge>
bfc00b50:	00000000 	nop
bfc00b54:	03c0e821 	move	sp,s8
bfc00b58:	8fbf0014 	lw	ra,20(sp)
bfc00b5c:	8fbe0010 	lw	s8,16(sp)
bfc00b60:	27bd0018 	addiu	sp,sp,24
bfc00b64:	03e00008 	jr	ra
bfc00b68:	00000000 	nop

bfc00b6c <main>:
main():
bfc00b6c:	27bdffe0 	addiu	sp,sp,-32
bfc00b70:	afbf001c 	sw	ra,28(sp)
bfc00b74:	afbe0018 	sw	s8,24(sp)
bfc00b78:	03a0f021 	move	s8,sp
bfc00b7c:	0ff00023 	jal	bfc0008c <init>
bfc00b80:	00000000 	nop
bfc00b84:	afc00010 	sw	zero,16(s8)
bfc00b88:	0ff002a9 	jal	bfc00aa4 <drawMap>
bfc00b8c:	00000000 	nop
bfc00b90:	0ff0004e 	jal	bfc00138 <initAns>
bfc00b94:	00000000 	nop
bfc00b98:	3c028000 	lui	v0,0x8000
bfc00b9c:	244401ac 	addiu	a0,v0,428
bfc00ba0:	0ff000bb 	jal	bfc002ec <initHeap>
bfc00ba4:	00000000 	nop
bfc00ba8:	24040001 	li	a0,1
bfc00bac:	0ff00218 	jal	bfc00860 <Dijkstra>
bfc00bb0:	00000000 	nop
bfc00bb4:	24020001 	li	v0,1
bfc00bb8:	afc20014 	sw	v0,20(s8)
bfc00bbc:	1000001a 	b	bfc00c28 <main+0xbc>
bfc00bc0:	00000000 	nop
bfc00bc4:	3c028000 	lui	v0,0x8000
bfc00bc8:	8fc30014 	lw	v1,20(s8)
bfc00bcc:	00000000 	nop
bfc00bd0:	00031880 	sll	v1,v1,0x2
bfc00bd4:	24421154 	addiu	v0,v0,4436
bfc00bd8:	00621021 	addu	v0,v1,v0
bfc00bdc:	8c430000 	lw	v1,0(v0)
bfc00be0:	3c028000 	lui	v0,0x8000
bfc00be4:	8fc40014 	lw	a0,20(s8)
bfc00be8:	00000000 	nop
bfc00bec:	00042080 	sll	a0,a0,0x2
bfc00bf0:	24420000 	addiu	v0,v0,0
bfc00bf4:	00821021 	addu	v0,a0,v0
bfc00bf8:	8c420000 	lw	v0,0(v0)
bfc00bfc:	00000000 	nop
bfc00c00:	10620005 	beq	v1,v0,bfc00c18 <main+0xac>
bfc00c04:	00000000 	nop
bfc00c08:	24020001 	li	v0,1
bfc00c0c:	afc20010 	sw	v0,16(s8)
bfc00c10:	1000000a 	b	bfc00c3c <main+0xd0>
bfc00c14:	00000000 	nop
bfc00c18:	8fc20014 	lw	v0,20(s8)
bfc00c1c:	00000000 	nop
bfc00c20:	24420001 	addiu	v0,v0,1
bfc00c24:	afc20014 	sw	v0,20(s8)
bfc00c28:	8fc20014 	lw	v0,20(s8)
bfc00c2c:	00000000 	nop
bfc00c30:	28420006 	slti	v0,v0,6
bfc00c34:	1440ffe3 	bnez	v0,bfc00bc4 <main+0x58>
bfc00c38:	00000000 	nop
bfc00c3c:	8fc20010 	lw	v0,16(s8)
bfc00c40:	00000000 	nop
bfc00c44:	2c420001 	sltiu	v0,v0,1
bfc00c48:	304200ff 	andi	v0,v0,0xff
bfc00c4c:	00402021 	move	a0,v0
bfc00c50:	0ff00033 	jal	bfc000cc <print_result>
bfc00c54:	00000000 	nop
bfc00c58:	00001021 	move	v0,zero
bfc00c5c:	03c0e821 	move	sp,s8
bfc00c60:	8fbf001c 	lw	ra,28(sp)
bfc00c64:	8fbe0018 	lw	s8,24(sp)
bfc00c68:	27bd0020 	addiu	sp,sp,32
bfc00c6c:	03e00008 	jr	ra
bfc00c70:	00000000 	nop

Disassembly of section .data:

80000000 <_fdata>:
	...
_fdata():
80000008:	00000001 	0x1
8000000c:	00000008 	jr	zero
80000010:	00000003 	sra	zero,zero,0x0
80000014:	00000005 	0x5

Disassembly of section .sdata:

80000018 <cnt>:
80000018:	00000001 	0x1

Disassembly of section .bss:

8000001c <head>:
	...

800001ac <heap>:
	...

800004d4 <edge>:
	...

80001154 <ans>:
	...

Disassembly of section .sbss:

800012e4 <tree_cnt>:
800012e4:	00000000 	nop

800012e8 <ans_cnt>:
800012e8:	00000000 	nop

Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	710000c0 	0x710000c0
	...
  14:	80008010 	lb	zero,-32752(zero)

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
  74:	00000010 	mfhi	zero
  78:	0000001e 	0x1e
  7c:	0000001f 	0x1f
  80:	bfc001b0 	0xbfc001b0
  84:	40000000 	mfc0	zero,c0_index
  88:	fffffffc 	0xfffffffc
	...
  94:	00000008 	jr	zero
  98:	0000001e 	0x1e
  9c:	0000001f 	0x1f
  a0:	bfc002a4 	0xbfc002a4
  a4:	40000000 	mfc0	zero,c0_index
  a8:	fffffffc 	0xfffffffc
	...
  b4:	00000008 	jr	zero
  b8:	0000001e 	0x1e
  bc:	0000001f 	0x1f
  c0:	bfc002ec 	0xbfc002ec
  c4:	40000000 	mfc0	zero,c0_index
  c8:	fffffffc 	0xfffffffc
	...
  d4:	00000010 	mfhi	zero
  d8:	0000001e 	0x1e
  dc:	0000001f 	0x1f
  e0:	bfc0038c 	0xbfc0038c
  e4:	40000000 	mfc0	zero,c0_index
  e8:	fffffffc 	0xfffffffc
	...
  f4:	00000018 	mult	zero,zero
  f8:	0000001e 	0x1e
  fc:	0000001f 	0x1f
 100:	bfc00540 	0xbfc00540
 104:	c0000000 	lwc0	$0,0(zero)
 108:	fffffffc 	0xfffffffc
	...
 114:	00000030 	0x30
 118:	0000001e 	0x1e
 11c:	0000001f 	0x1f
 120:	bfc00750 	0xbfc00750
 124:	c0000000 	lwc0	$0,0(zero)
 128:	fffffffc 	0xfffffffc
	...
 134:	00000018 	mult	zero,zero
 138:	0000001e 	0x1e
 13c:	0000001f 	0x1f
 140:	bfc00824 	0xbfc00824
 144:	40000000 	mfc0	zero,c0_index
 148:	fffffffc 	0xfffffffc
	...
 154:	00000008 	jr	zero
 158:	0000001e 	0x1e
 15c:	0000001f 	0x1f
 160:	bfc00860 	0xbfc00860
 164:	c0000000 	lwc0	$0,0(zero)
 168:	fffffffc 	0xfffffffc
	...
 174:	00000040 	ssnop
 178:	0000001e 	0x1e
 17c:	0000001f 	0x1f
 180:	bfc00aa4 	0xbfc00aa4
 184:	c0000000 	lwc0	$0,0(zero)
 188:	fffffffc 	0xfffffffc
	...
 194:	00000018 	mult	zero,zero
 198:	0000001e 	0x1e
 19c:	0000001f 	0x1f
 1a0:	bfc00b6c 	0xbfc00b6c
 1a4:	c0000000 	lwc0	$0,0(zero)
 1a8:	fffffffc 	0xfffffffc
	...
 1b4:	00000020 	add	zero,zero,zero
 1b8:	0000001e 	0x1e
 1bc:	0000001f 	0x1f

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
