	.file	1 "merge-sort.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 1
	.text
	.align	2
	.globl	delay
	.set	nomips16
	.set	nomicromips
	.ent	delay
	.type	delay, @function
delay:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	sw	$0,0($fp)
	b	.L2
	nop

.L3:
	lw	$2,0($fp)
	nop
	addiu	$2,$2,1
	sw	$2,0($fp)
.L2:
	lw	$3,0($fp)
	li	$2,4980736			# 0x4c0000
	ori	$2,$2,0x4b40
	bne	$3,$2,.L3
	nop

	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	delay
	.size	delay, .-delay
	.align	2
	.globl	init
	.set	nomips16
	.set	nomicromips
	.ent	init
	.type	init, @function
init:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	li	$2,-1079050240			# 0xffffffffbfaf0000
	ori	$2,$2,0xf000
	li	$3,240			# 0xf0
	sw	$3,0($2)
	jal	delay
	nop

	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	init
	.size	init, .-init
	.align	2
	.globl	print_result
	.set	nomips16
	.set	nomicromips
	.ent	print_result
	.type	print_result, @function
print_result:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	sw	$4,24($fp)
	lw	$3,24($fp)
	li	$2,1			# 0x1
	bne	$3,$2,.L6
	nop

.L7:
	jal	delay
	nop

	li	$2,-1079050240			# 0xffffffffbfaf0000
	ori	$2,$2,0xf000
	li	$3,15			# 0xf
	sw	$3,0($2)
	b	.L7
	nop

.L6:
	li	$2,-1079050240			# 0xffffffffbfaf0000
	ori	$2,$2,0xf000
	li	$3,240			# 0xf0
	sw	$3,0($2)
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	print_result
	.size	print_result, .-print_result
	.globl	a
	.data
	.align	2
	.type	a, @object
	.size	a, 400
a:
	.word	81
	.word	37
	.word	64
	.word	23
	.word	38
	.word	65
	.word	56
	.word	15
	.word	8
	.word	33
	.word	85
	.word	39
	.word	71
	.word	12
	.word	77
	.word	6
	.word	82
	.word	89
	.word	80
	.word	35
	.word	0
	.word	59
	.word	73
	.word	4
	.word	61
	.word	30
	.word	74
	.word	69
	.word	13
	.word	42
	.word	68
	.word	63
	.word	9
	.word	29
	.word	47
	.word	36
	.word	99
	.word	25
	.word	21
	.word	14
	.word	60
	.word	3
	.word	2
	.word	18
	.word	26
	.word	83
	.word	53
	.word	5
	.word	43
	.word	67
	.word	88
	.word	70
	.word	76
	.word	92
	.word	94
	.word	48
	.word	34
	.word	49
	.word	66
	.word	95
	.word	78
	.word	62
	.word	32
	.word	52
	.word	16
	.word	72
	.word	27
	.word	28
	.word	22
	.word	40
	.word	84
	.word	91
	.word	96
	.word	57
	.word	87
	.word	51
	.word	98
	.word	1
	.word	10
	.word	11
	.word	24
	.word	20
	.word	19
	.word	31
	.word	7
	.word	97
	.word	50
	.word	86
	.word	79
	.word	17
	.word	75
	.word	55
	.word	93
	.word	44
	.word	58
	.word	54
	.word	45
	.word	41
	.word	90
	.word	46

	.comm	tmp,400,4
	.text
	.align	2
	.globl	merge_sort
	.set	nomips16
	.set	nomicromips
	.ent	merge_sort
	.type	merge_sort, @function
merge_sort:
	.frame	$fp,40,$31		# vars= 16, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	sw	$5,44($fp)
	sw	$6,48($fp)
	lw	$3,44($fp)
	lw	$2,48($fp)
	nop
	slt	$2,$3,$2
	beq	$2,$0,.L21
	nop

.L9:
	lw	$3,44($fp)
	lw	$2,48($fp)
	nop
	addu	$2,$3,$2
	sra	$2,$2,1
	sw	$2,28($fp)
	lw	$4,40($fp)
	lw	$5,44($fp)
	lw	$6,28($fp)
	jal	merge_sort
	nop

	lw	$2,28($fp)
	nop
	addiu	$2,$2,1
	lw	$4,40($fp)
	move	$5,$2
	lw	$6,48($fp)
	jal	merge_sort
	nop

	lw	$2,44($fp)
	nop
	sw	$2,16($fp)
	lw	$2,28($fp)
	nop
	addiu	$2,$2,1
	sw	$2,20($fp)
	lw	$2,44($fp)
	nop
	sw	$2,24($fp)
	lw	$2,44($fp)
	nop
	sw	$2,16($fp)
	lw	$2,28($fp)
	nop
	addiu	$2,$2,1
	sw	$2,20($fp)
	lw	$2,44($fp)
	nop
	sw	$2,24($fp)
	b	.L11
	nop

.L14:
	lw	$2,16($fp)
	nop
	sll	$2,$2,2
	lw	$3,40($fp)
	nop
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,20($fp)
	nop
	sll	$2,$2,2
	lw	$4,40($fp)
	nop
	addu	$2,$4,$2
	lw	$2,0($2)
	nop
	slt	$2,$3,$2
	beq	$2,$0,.L12
	nop

	lw	$2,16($fp)
	nop
	sll	$2,$2,2
	lw	$3,40($fp)
	nop
	addu	$2,$3,$2
	lw	$3,0($2)
	lui	$2,%hi(tmp)
	lw	$4,24($fp)
	nop
	sll	$4,$4,2
	addiu	$2,$2,%lo(tmp)
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,24($fp)
	nop
	addiu	$2,$2,1
	sw	$2,24($fp)
	lw	$2,16($fp)
	nop
	addiu	$2,$2,1
	sw	$2,16($fp)
	b	.L11
	nop

.L12:
	lw	$2,20($fp)
	nop
	sll	$2,$2,2
	lw	$3,40($fp)
	nop
	addu	$2,$3,$2
	lw	$3,0($2)
	lui	$2,%hi(tmp)
	lw	$4,24($fp)
	nop
	sll	$4,$4,2
	addiu	$2,$2,%lo(tmp)
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,24($fp)
	nop
	addiu	$2,$2,1
	sw	$2,24($fp)
	lw	$2,20($fp)
	nop
	addiu	$2,$2,1
	sw	$2,20($fp)
.L11:
	lw	$3,16($fp)
	lw	$2,28($fp)
	nop
	slt	$2,$2,$3
	bne	$2,$0,.L15
	nop

	lw	$3,20($fp)
	lw	$2,48($fp)
	nop
	slt	$2,$2,$3
	beq	$2,$0,.L14
	nop

	b	.L15
	nop

.L16:
	lw	$2,16($fp)
	nop
	sll	$2,$2,2
	lw	$3,40($fp)
	nop
	addu	$2,$3,$2
	lw	$3,0($2)
	lui	$2,%hi(tmp)
	lw	$4,24($fp)
	nop
	sll	$4,$4,2
	addiu	$2,$2,%lo(tmp)
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,24($fp)
	nop
	addiu	$2,$2,1
	sw	$2,24($fp)
	lw	$2,16($fp)
	nop
	addiu	$2,$2,1
	sw	$2,16($fp)
.L15:
	lw	$3,16($fp)
	lw	$2,28($fp)
	nop
	slt	$2,$2,$3
	beq	$2,$0,.L16
	nop

	b	.L17
	nop

.L18:
	lw	$2,20($fp)
	nop
	sll	$2,$2,2
	lw	$3,40($fp)
	nop
	addu	$2,$3,$2
	lw	$3,0($2)
	lui	$2,%hi(tmp)
	lw	$4,24($fp)
	nop
	sll	$4,$4,2
	addiu	$2,$2,%lo(tmp)
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,24($fp)
	nop
	addiu	$2,$2,1
	sw	$2,24($fp)
	lw	$2,20($fp)
	nop
	addiu	$2,$2,1
	sw	$2,20($fp)
.L17:
	lw	$3,20($fp)
	lw	$2,48($fp)
	nop
	slt	$2,$2,$3
	beq	$2,$0,.L18
	nop

	lw	$2,44($fp)
	nop
	sw	$2,24($fp)
	b	.L19
	nop

.L20:
	lw	$2,24($fp)
	nop
	sll	$2,$2,2
	lw	$3,40($fp)
	nop
	addu	$2,$3,$2
	lui	$3,%hi(tmp)
	lw	$4,24($fp)
	nop
	sll	$4,$4,2
	addiu	$3,$3,%lo(tmp)
	addu	$3,$4,$3
	lw	$3,0($3)
	nop
	sw	$3,0($2)
	lw	$2,24($fp)
	nop
	addiu	$2,$2,1
	sw	$2,24($fp)
.L19:
	lw	$3,24($fp)
	lw	$2,48($fp)
	nop
	slt	$2,$2,$3
	beq	$2,$0,.L20
	nop

	b	.L8
	nop

.L21:
	nop
.L8:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	merge_sort
	.size	merge_sort, .-merge_sort
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,32,$31		# vars= 8, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	jal	init
	nop

	sw	$0,16($fp)
	lui	$2,%hi(a)
	addiu	$4,$2,%lo(a)
	move	$5,$0
	li	$6,99			# 0x63
	jal	merge_sort
	nop

	sw	$0,20($fp)
	b	.L23
	nop

.L26:
	lui	$2,%hi(a)
	lw	$3,20($fp)
	nop
	sll	$3,$3,2
	addiu	$2,$2,%lo(a)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,20($fp)
	nop
	beq	$3,$2,.L24
	nop

	li	$2,1			# 0x1
	sw	$2,16($fp)
	b	.L25
	nop

.L24:
	lw	$2,20($fp)
	nop
	addiu	$2,$2,1
	sw	$2,20($fp)
.L23:
	lw	$2,20($fp)
	nop
	slt	$2,$2,100
	bne	$2,$0,.L26
	nop

.L25:
	lw	$3,20($fp)
	li	$2,100			# 0x64
	beq	$3,$2,.L27
	nop

	li	$2,1			# 0x1
	sw	$2,16($fp)
.L27:
	lw	$2,16($fp)
	nop
	sltu	$2,$2,1
	andi	$2,$2,0x00ff
	move	$4,$2
	jal	print_result
	nop

.L28:
	b	.L28
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Sourcery CodeBench Lite 2013.05-65) 4.7.3"
