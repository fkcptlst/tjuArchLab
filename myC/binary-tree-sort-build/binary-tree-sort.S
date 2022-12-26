	.file	1 "binary-tree-sort.c"
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
	.word	100
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

	.comm	ans,400,4

	.comm	tree,1200,4
	.globl	tree_cnt
	.section	.sbss,"aw",@nobits
	.align	2
	.type	tree_cnt, @object
	.size	tree_cnt, 4
tree_cnt:
	.space	4
	.globl	ans_cnt
	.align	2
	.type	ans_cnt, @object
	.size	ans_cnt, 4
ans_cnt:
	.space	4
	.text
	.align	2
	.globl	rson
	.set	nomips16
	.set	nomicromips
	.ent	rson
	.type	rson, @function
rson:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	lui	$3,%hi(tree)
	lw	$2,8($fp)
	addiu	$3,$3,%lo(tree)
	sll	$2,$2,2
	sll	$4,$2,2
	subu	$2,$4,$2
	addu	$2,$3,$2
	lw	$2,4($2)
	nop
	bne	$2,$0,.L9
	nop

	lw	$2,%gp_rel(tree_cnt)($28)
	nop
	addiu	$2,$2,1
	sw	$2,%gp_rel(tree_cnt)($28)
	lw	$3,%gp_rel(tree_cnt)($28)
	lui	$4,%hi(tree)
	lw	$2,8($fp)
	addiu	$4,$4,%lo(tree)
	sll	$2,$2,2
	sll	$5,$2,2
	subu	$2,$5,$2
	addu	$2,$4,$2
	sw	$3,4($2)
.L9:
	lui	$3,%hi(tree)
	lw	$2,8($fp)
	addiu	$3,$3,%lo(tree)
	sll	$2,$2,2
	sll	$4,$2,2
	subu	$2,$4,$2
	addu	$2,$3,$2
	lw	$2,4($2)
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	rson
	.size	rson, .-rson
	.align	2
	.globl	lson
	.set	nomips16
	.set	nomicromips
	.ent	lson
	.type	lson, @function
lson:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	lui	$4,%hi(tree)
	lw	$2,8($fp)
	nop
	sll	$2,$2,2
	sll	$3,$2,2
	subu	$3,$3,$2
	addiu	$2,$4,%lo(tree)
	addu	$2,$3,$2
	lw	$2,0($2)
	nop
	bne	$2,$0,.L12
	nop

	lw	$2,%gp_rel(tree_cnt)($28)
	nop
	addiu	$2,$2,1
	sw	$2,%gp_rel(tree_cnt)($28)
	lw	$4,%gp_rel(tree_cnt)($28)
	lui	$5,%hi(tree)
	lw	$2,8($fp)
	nop
	sll	$2,$2,2
	sll	$3,$2,2
	subu	$3,$3,$2
	addiu	$2,$5,%lo(tree)
	addu	$2,$3,$2
	sw	$4,0($2)
.L12:
	lui	$4,%hi(tree)
	lw	$2,8($fp)
	nop
	sll	$2,$2,2
	sll	$3,$2,2
	subu	$3,$3,$2
	addiu	$2,$4,%lo(tree)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	lson
	.size	lson, .-lson
	.align	2
	.globl	insert
	.set	nomips16
	.set	nomicromips
	.ent	insert
	.type	insert, @function
insert:
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
	sw	$5,28($fp)
	lui	$4,%hi(tree)
	lw	$2,28($fp)
	nop
	sll	$2,$2,2
	sll	$3,$2,2
	subu	$3,$3,$2
	addiu	$2,$4,%lo(tree)
	addu	$2,$3,$2
	lw	$2,8($2)
	nop
	bne	$2,$0,.L15
	nop

	lui	$4,%hi(tree)
	lw	$2,28($fp)
	nop
	sll	$2,$2,2
	sll	$3,$2,2
	subu	$3,$3,$2
	addiu	$2,$4,%lo(tree)
	addu	$2,$3,$2
	lw	$3,24($fp)
	nop
	sw	$3,8($2)
	b	.L14
	nop

.L15:
	lui	$4,%hi(tree)
	lw	$2,28($fp)
	nop
	sll	$2,$2,2
	sll	$3,$2,2
	subu	$3,$3,$2
	addiu	$2,$4,%lo(tree)
	addu	$2,$3,$2
	lw	$3,8($2)
	lw	$2,24($fp)
	nop
	slt	$2,$3,$2
	beq	$2,$0,.L17
	nop

	lw	$4,28($fp)
	jal	rson
	nop

	lw	$4,24($fp)
	move	$5,$2
	jal	insert
	nop

	b	.L14
	nop

.L17:
	lw	$4,28($fp)
	jal	lson
	nop

	lw	$4,24($fp)
	move	$5,$2
	jal	insert
	nop

.L14:
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	insert
	.size	insert, .-insert
	.align	2
	.globl	recover
	.set	nomips16
	.set	nomicromips
	.ent	recover
	.type	recover, @function
recover:
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
	lui	$4,%hi(tree)
	lw	$2,24($fp)
	nop
	sll	$2,$2,2
	sll	$3,$2,2
	subu	$3,$3,$2
	addiu	$2,$4,%lo(tree)
	addu	$2,$3,$2
	lw	$2,0($2)
	nop
	beq	$2,$0,.L19
	nop

	lui	$4,%hi(tree)
	lw	$2,24($fp)
	nop
	sll	$2,$2,2
	sll	$3,$2,2
	subu	$3,$3,$2
	addiu	$2,$4,%lo(tree)
	addu	$2,$3,$2
	lw	$2,0($2)
	nop
	move	$4,$2
	jal	recover
	nop

.L19:
	lw	$4,%gp_rel(ans_cnt)($28)
	lui	$5,%hi(tree)
	lw	$2,24($fp)
	nop
	sll	$2,$2,2
	sll	$3,$2,2
	subu	$3,$3,$2
	addiu	$2,$5,%lo(tree)
	addu	$2,$3,$2
	lw	$3,8($2)
	lui	$2,%hi(ans)
	sll	$5,$4,2
	addiu	$2,$2,%lo(ans)
	addu	$2,$5,$2
	sw	$3,0($2)
	addiu	$2,$4,1
	sw	$2,%gp_rel(ans_cnt)($28)
	lui	$3,%hi(tree)
	lw	$2,24($fp)
	addiu	$3,$3,%lo(tree)
	sll	$2,$2,2
	sll	$4,$2,2
	subu	$2,$4,$2
	addu	$2,$3,$2
	lw	$2,4($2)
	nop
	beq	$2,$0,.L18
	nop

	lui	$3,%hi(tree)
	lw	$2,24($fp)
	addiu	$3,$3,%lo(tree)
	sll	$2,$2,2
	sll	$4,$2,2
	subu	$2,$4,$2
	addu	$2,$3,$2
	lw	$2,4($2)
	nop
	move	$4,$2
	jal	recover
	nop

.L18:
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	recover
	.size	recover, .-recover
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
	sw	$0,20($fp)
	b	.L22
	nop

.L23:
	lui	$2,%hi(a)
	lw	$3,20($fp)
	nop
	sll	$3,$3,2
	addiu	$2,$2,%lo(a)
	addu	$2,$3,$2
	lw	$2,0($2)
	nop
	move	$4,$2
	move	$5,$0
	jal	insert
	nop

	lw	$2,20($fp)
	nop
	addiu	$2,$2,1
	sw	$2,20($fp)
.L22:
	lw	$2,20($fp)
	nop
	slt	$2,$2,100
	bne	$2,$0,.L23
	nop

	move	$4,$0
	jal	recover
	nop

	sw	$0,20($fp)
	b	.L24
	nop

.L27:
	lui	$2,%hi(ans)
	lw	$3,20($fp)
	nop
	sll	$3,$3,2
	addiu	$2,$2,%lo(ans)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,20($fp)
	nop
	addiu	$2,$2,1
	beq	$3,$2,.L25
	nop

	li	$2,1			# 0x1
	sw	$2,16($fp)
	b	.L26
	nop

.L25:
	lw	$2,20($fp)
	nop
	addiu	$2,$2,1
	sw	$2,20($fp)
.L24:
	lw	$2,20($fp)
	nop
	slt	$2,$2,100
	bne	$2,$0,.L27
	nop

.L26:
	lw	$3,20($fp)
	li	$2,100			# 0x64
	beq	$3,$2,.L28
	nop

	li	$2,1			# 0x1
	sw	$2,16($fp)
.L28:
	lw	$2,16($fp)
	nop
	sltu	$2,$2,1
	andi	$2,$2,0x00ff
	move	$4,$2
	jal	print_result
	nop

	move	$2,$0
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Sourcery CodeBench Lite 2013.05-65) 4.7.3"
