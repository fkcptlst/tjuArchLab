
build/merge-sort:     file format elf32-tradbigmips
build/merge-sort


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
bfc0002c:	0bf00133 	j	bfc004cc <main>
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

bfc00138 <merge_sort>:
merge_sort():
bfc00138:	27bdffd8 	addiu	sp,sp,-40
bfc0013c:	afbf0024 	sw	ra,36(sp)
bfc00140:	afbe0020 	sw	s8,32(sp)
bfc00144:	03a0f021 	move	s8,sp
bfc00148:	afc40028 	sw	a0,40(s8)
bfc0014c:	afc5002c 	sw	a1,44(s8)
bfc00150:	afc60030 	sw	a2,48(s8)
bfc00154:	8fc3002c 	lw	v1,44(s8)
bfc00158:	8fc20030 	lw	v0,48(s8)
bfc0015c:	00000000 	nop
bfc00160:	0062102a 	slt	v0,v1,v0
bfc00164:	104000d2 	beqz	v0,bfc004b0 <merge_sort+0x378>
bfc00168:	00000000 	nop
bfc0016c:	8fc3002c 	lw	v1,44(s8)
bfc00170:	8fc20030 	lw	v0,48(s8)
bfc00174:	00000000 	nop
bfc00178:	00621021 	addu	v0,v1,v0
bfc0017c:	00021043 	sra	v0,v0,0x1
bfc00180:	afc2001c 	sw	v0,28(s8)
bfc00184:	8fc40028 	lw	a0,40(s8)
bfc00188:	8fc5002c 	lw	a1,44(s8)
bfc0018c:	8fc6001c 	lw	a2,28(s8)
bfc00190:	0ff0004e 	jal	bfc00138 <merge_sort>
bfc00194:	00000000 	nop
bfc00198:	8fc2001c 	lw	v0,28(s8)
bfc0019c:	00000000 	nop
bfc001a0:	24420001 	addiu	v0,v0,1
bfc001a4:	8fc40028 	lw	a0,40(s8)
bfc001a8:	00402821 	move	a1,v0
bfc001ac:	8fc60030 	lw	a2,48(s8)
bfc001b0:	0ff0004e 	jal	bfc00138 <merge_sort>
bfc001b4:	00000000 	nop
bfc001b8:	8fc2002c 	lw	v0,44(s8)
bfc001bc:	00000000 	nop
bfc001c0:	afc20010 	sw	v0,16(s8)
bfc001c4:	8fc2001c 	lw	v0,28(s8)
bfc001c8:	00000000 	nop
bfc001cc:	24420001 	addiu	v0,v0,1
bfc001d0:	afc20014 	sw	v0,20(s8)
bfc001d4:	8fc2002c 	lw	v0,44(s8)
bfc001d8:	00000000 	nop
bfc001dc:	afc20018 	sw	v0,24(s8)
bfc001e0:	8fc2002c 	lw	v0,44(s8)
bfc001e4:	00000000 	nop
bfc001e8:	afc20010 	sw	v0,16(s8)
bfc001ec:	8fc2001c 	lw	v0,28(s8)
bfc001f0:	00000000 	nop
bfc001f4:	24420001 	addiu	v0,v0,1
bfc001f8:	afc20014 	sw	v0,20(s8)
bfc001fc:	8fc2002c 	lw	v0,44(s8)
bfc00200:	00000000 	nop
bfc00204:	afc20018 	sw	v0,24(s8)
bfc00208:	10000041 	b	bfc00310 <merge_sort+0x1d8>
bfc0020c:	00000000 	nop
bfc00210:	8fc20010 	lw	v0,16(s8)
bfc00214:	00000000 	nop
bfc00218:	00021080 	sll	v0,v0,0x2
bfc0021c:	8fc30028 	lw	v1,40(s8)
bfc00220:	00000000 	nop
bfc00224:	00621021 	addu	v0,v1,v0
bfc00228:	8c430000 	lw	v1,0(v0)
bfc0022c:	8fc20014 	lw	v0,20(s8)
bfc00230:	00000000 	nop
bfc00234:	00021080 	sll	v0,v0,0x2
bfc00238:	8fc40028 	lw	a0,40(s8)
bfc0023c:	00000000 	nop
bfc00240:	00821021 	addu	v0,a0,v0
bfc00244:	8c420000 	lw	v0,0(v0)
bfc00248:	00000000 	nop
bfc0024c:	0062102a 	slt	v0,v1,v0
bfc00250:	10400019 	beqz	v0,bfc002b8 <merge_sort+0x180>
bfc00254:	00000000 	nop
bfc00258:	8fc20010 	lw	v0,16(s8)
bfc0025c:	00000000 	nop
bfc00260:	00021080 	sll	v0,v0,0x2
bfc00264:	8fc30028 	lw	v1,40(s8)
bfc00268:	00000000 	nop
bfc0026c:	00621021 	addu	v0,v1,v0
bfc00270:	8c430000 	lw	v1,0(v0)
bfc00274:	3c028000 	lui	v0,0x8000
bfc00278:	8fc40018 	lw	a0,24(s8)
bfc0027c:	00000000 	nop
bfc00280:	00042080 	sll	a0,a0,0x2
bfc00284:	24420190 	addiu	v0,v0,400
bfc00288:	00821021 	addu	v0,a0,v0
bfc0028c:	ac430000 	sw	v1,0(v0)
bfc00290:	8fc20018 	lw	v0,24(s8)
bfc00294:	00000000 	nop
bfc00298:	24420001 	addiu	v0,v0,1
bfc0029c:	afc20018 	sw	v0,24(s8)
bfc002a0:	8fc20010 	lw	v0,16(s8)
bfc002a4:	00000000 	nop
bfc002a8:	24420001 	addiu	v0,v0,1
bfc002ac:	afc20010 	sw	v0,16(s8)
bfc002b0:	10000017 	b	bfc00310 <merge_sort+0x1d8>
bfc002b4:	00000000 	nop
bfc002b8:	8fc20014 	lw	v0,20(s8)
bfc002bc:	00000000 	nop
bfc002c0:	00021080 	sll	v0,v0,0x2
bfc002c4:	8fc30028 	lw	v1,40(s8)
bfc002c8:	00000000 	nop
bfc002cc:	00621021 	addu	v0,v1,v0
bfc002d0:	8c430000 	lw	v1,0(v0)
bfc002d4:	3c028000 	lui	v0,0x8000
bfc002d8:	8fc40018 	lw	a0,24(s8)
bfc002dc:	00000000 	nop
bfc002e0:	00042080 	sll	a0,a0,0x2
bfc002e4:	24420190 	addiu	v0,v0,400
bfc002e8:	00821021 	addu	v0,a0,v0
bfc002ec:	ac430000 	sw	v1,0(v0)
bfc002f0:	8fc20018 	lw	v0,24(s8)
bfc002f4:	00000000 	nop
bfc002f8:	24420001 	addiu	v0,v0,1
bfc002fc:	afc20018 	sw	v0,24(s8)
bfc00300:	8fc20014 	lw	v0,20(s8)
bfc00304:	00000000 	nop
bfc00308:	24420001 	addiu	v0,v0,1
bfc0030c:	afc20014 	sw	v0,20(s8)
bfc00310:	8fc30010 	lw	v1,16(s8)
bfc00314:	8fc2001c 	lw	v0,28(s8)
bfc00318:	00000000 	nop
bfc0031c:	0043102a 	slt	v0,v0,v1
bfc00320:	1440001f 	bnez	v0,bfc003a0 <merge_sort+0x268>
bfc00324:	00000000 	nop
bfc00328:	8fc30014 	lw	v1,20(s8)
bfc0032c:	8fc20030 	lw	v0,48(s8)
bfc00330:	00000000 	nop
bfc00334:	0043102a 	slt	v0,v0,v1
bfc00338:	1040ffb5 	beqz	v0,bfc00210 <merge_sort+0xd8>
bfc0033c:	00000000 	nop
bfc00340:	10000017 	b	bfc003a0 <merge_sort+0x268>
bfc00344:	00000000 	nop
bfc00348:	8fc20010 	lw	v0,16(s8)
bfc0034c:	00000000 	nop
bfc00350:	00021080 	sll	v0,v0,0x2
bfc00354:	8fc30028 	lw	v1,40(s8)
bfc00358:	00000000 	nop
bfc0035c:	00621021 	addu	v0,v1,v0
bfc00360:	8c430000 	lw	v1,0(v0)
bfc00364:	3c028000 	lui	v0,0x8000
bfc00368:	8fc40018 	lw	a0,24(s8)
bfc0036c:	00000000 	nop
bfc00370:	00042080 	sll	a0,a0,0x2
bfc00374:	24420190 	addiu	v0,v0,400
bfc00378:	00821021 	addu	v0,a0,v0
bfc0037c:	ac430000 	sw	v1,0(v0)
bfc00380:	8fc20018 	lw	v0,24(s8)
bfc00384:	00000000 	nop
bfc00388:	24420001 	addiu	v0,v0,1
bfc0038c:	afc20018 	sw	v0,24(s8)
bfc00390:	8fc20010 	lw	v0,16(s8)
bfc00394:	00000000 	nop
bfc00398:	24420001 	addiu	v0,v0,1
bfc0039c:	afc20010 	sw	v0,16(s8)
bfc003a0:	8fc30010 	lw	v1,16(s8)
bfc003a4:	8fc2001c 	lw	v0,28(s8)
bfc003a8:	00000000 	nop
bfc003ac:	0043102a 	slt	v0,v0,v1
bfc003b0:	1040ffe5 	beqz	v0,bfc00348 <merge_sort+0x210>
bfc003b4:	00000000 	nop
bfc003b8:	10000017 	b	bfc00418 <merge_sort+0x2e0>
bfc003bc:	00000000 	nop
bfc003c0:	8fc20014 	lw	v0,20(s8)
bfc003c4:	00000000 	nop
bfc003c8:	00021080 	sll	v0,v0,0x2
bfc003cc:	8fc30028 	lw	v1,40(s8)
bfc003d0:	00000000 	nop
bfc003d4:	00621021 	addu	v0,v1,v0
bfc003d8:	8c430000 	lw	v1,0(v0)
bfc003dc:	3c028000 	lui	v0,0x8000
bfc003e0:	8fc40018 	lw	a0,24(s8)
bfc003e4:	00000000 	nop
bfc003e8:	00042080 	sll	a0,a0,0x2
bfc003ec:	24420190 	addiu	v0,v0,400
bfc003f0:	00821021 	addu	v0,a0,v0
bfc003f4:	ac430000 	sw	v1,0(v0)
bfc003f8:	8fc20018 	lw	v0,24(s8)
bfc003fc:	00000000 	nop
bfc00400:	24420001 	addiu	v0,v0,1
bfc00404:	afc20018 	sw	v0,24(s8)
bfc00408:	8fc20014 	lw	v0,20(s8)
bfc0040c:	00000000 	nop
bfc00410:	24420001 	addiu	v0,v0,1
bfc00414:	afc20014 	sw	v0,20(s8)
bfc00418:	8fc30014 	lw	v1,20(s8)
bfc0041c:	8fc20030 	lw	v0,48(s8)
bfc00420:	00000000 	nop
bfc00424:	0043102a 	slt	v0,v0,v1
bfc00428:	1040ffe5 	beqz	v0,bfc003c0 <merge_sort+0x288>
bfc0042c:	00000000 	nop
bfc00430:	8fc2002c 	lw	v0,44(s8)
bfc00434:	00000000 	nop
bfc00438:	afc20018 	sw	v0,24(s8)
bfc0043c:	10000014 	b	bfc00490 <merge_sort+0x358>
bfc00440:	00000000 	nop
bfc00444:	8fc20018 	lw	v0,24(s8)
bfc00448:	00000000 	nop
bfc0044c:	00021080 	sll	v0,v0,0x2
bfc00450:	8fc30028 	lw	v1,40(s8)
bfc00454:	00000000 	nop
bfc00458:	00621021 	addu	v0,v1,v0
bfc0045c:	3c038000 	lui	v1,0x8000
bfc00460:	8fc40018 	lw	a0,24(s8)
bfc00464:	00000000 	nop
bfc00468:	00042080 	sll	a0,a0,0x2
bfc0046c:	24630190 	addiu	v1,v1,400
bfc00470:	00831821 	addu	v1,a0,v1
bfc00474:	8c630000 	lw	v1,0(v1)
bfc00478:	00000000 	nop
bfc0047c:	ac430000 	sw	v1,0(v0)
bfc00480:	8fc20018 	lw	v0,24(s8)
bfc00484:	00000000 	nop
bfc00488:	24420001 	addiu	v0,v0,1
bfc0048c:	afc20018 	sw	v0,24(s8)
bfc00490:	8fc30018 	lw	v1,24(s8)
bfc00494:	8fc20030 	lw	v0,48(s8)
bfc00498:	00000000 	nop
bfc0049c:	0043102a 	slt	v0,v0,v1
bfc004a0:	1040ffe8 	beqz	v0,bfc00444 <merge_sort+0x30c>
bfc004a4:	00000000 	nop
bfc004a8:	10000002 	b	bfc004b4 <merge_sort+0x37c>
bfc004ac:	00000000 	nop
bfc004b0:	00000000 	nop
bfc004b4:	03c0e821 	move	sp,s8
bfc004b8:	8fbf0024 	lw	ra,36(sp)
bfc004bc:	8fbe0020 	lw	s8,32(sp)
bfc004c0:	27bd0028 	addiu	sp,sp,40
bfc004c4:	03e00008 	jr	ra
bfc004c8:	00000000 	nop

bfc004cc <main>:
main():
bfc004cc:	27bdffe0 	addiu	sp,sp,-32
bfc004d0:	afbf001c 	sw	ra,28(sp)
bfc004d4:	afbe0018 	sw	s8,24(sp)
bfc004d8:	03a0f021 	move	s8,sp
bfc004dc:	0ff00023 	jal	bfc0008c <init>
bfc004e0:	00000000 	nop
bfc004e4:	afc00010 	sw	zero,16(s8)
bfc004e8:	3c028000 	lui	v0,0x8000
bfc004ec:	24440000 	addiu	a0,v0,0
bfc004f0:	00002821 	move	a1,zero
bfc004f4:	24060063 	li	a2,99
bfc004f8:	0ff0004e 	jal	bfc00138 <merge_sort>
bfc004fc:	00000000 	nop
bfc00500:	afc00014 	sw	zero,20(s8)
bfc00504:	10000014 	b	bfc00558 <main+0x8c>
bfc00508:	00000000 	nop
bfc0050c:	3c028000 	lui	v0,0x8000
bfc00510:	8fc30014 	lw	v1,20(s8)
bfc00514:	00000000 	nop
bfc00518:	00031880 	sll	v1,v1,0x2
bfc0051c:	24420000 	addiu	v0,v0,0
bfc00520:	00621021 	addu	v0,v1,v0
bfc00524:	8c430000 	lw	v1,0(v0)
bfc00528:	8fc20014 	lw	v0,20(s8)
bfc0052c:	00000000 	nop
bfc00530:	10620005 	beq	v1,v0,bfc00548 <main+0x7c>
bfc00534:	00000000 	nop
bfc00538:	24020001 	li	v0,1
bfc0053c:	afc20010 	sw	v0,16(s8)
bfc00540:	1000000a 	b	bfc0056c <main+0xa0>
bfc00544:	00000000 	nop
bfc00548:	8fc20014 	lw	v0,20(s8)
bfc0054c:	00000000 	nop
bfc00550:	24420001 	addiu	v0,v0,1
bfc00554:	afc20014 	sw	v0,20(s8)
bfc00558:	8fc20014 	lw	v0,20(s8)
bfc0055c:	00000000 	nop
bfc00560:	28420064 	slti	v0,v0,100
bfc00564:	1440ffe9 	bnez	v0,bfc0050c <main+0x40>
bfc00568:	00000000 	nop
bfc0056c:	8fc30014 	lw	v1,20(s8)
bfc00570:	24020064 	li	v0,100
bfc00574:	10620003 	beq	v1,v0,bfc00584 <main+0xb8>
bfc00578:	00000000 	nop
bfc0057c:	24020001 	li	v0,1
bfc00580:	afc20010 	sw	v0,16(s8)
bfc00584:	8fc20010 	lw	v0,16(s8)
bfc00588:	00000000 	nop
bfc0058c:	2c420001 	sltiu	v0,v0,1
bfc00590:	304200ff 	andi	v0,v0,0xff
bfc00594:	00402021 	move	a0,v0
bfc00598:	0ff00033 	jal	bfc000cc <print_result>
bfc0059c:	00000000 	nop
bfc005a0:	1000ffff 	b	bfc005a0 <main+0xd4>
bfc005a4:	00000000 	nop

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
80000050:	00000000 	nop
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

80000190 <tmp>:
	...

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
  64:	c0000000 	lwc0	$0,0(zero)
  68:	fffffffc 	0xfffffffc
	...
  74:	00000028 	0x28
  78:	0000001e 	0x1e
  7c:	0000001f 	0x1f
  80:	bfc004cc 	0xbfc004cc
  84:	c0000000 	lwc0	$0,0(zero)
  88:	fffffffc 	0xfffffffc
	...
  94:	00000020 	add	zero,zero,zero
  98:	0000001e 	0x1e
  9c:	0000001f 	0x1f

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
