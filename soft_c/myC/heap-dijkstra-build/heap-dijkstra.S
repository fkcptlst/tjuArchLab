	.file	1 "heap-dijkstra.c"
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

	.comm	ans,400,4

	.comm	edge,3200,4

	.comm	head,400,4
	.globl	cnt
	.section	.sdata,"aw",@progbits
	.align	2
	.type	cnt, @object
	.size	cnt, 4
cnt:
	.word	1
	.text
	.align	2
	.globl	initAns
	.set	nomips16
	.set	nomicromips
	.ent	initAns
	.type	initAns, @function
initAns:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	sw	$0,0($fp)
	sw	$0,0($fp)
	b	.L9
	nop

.L10:
	lui	$2,%hi(ans)
	lw	$3,0($fp)
	nop
	sll	$3,$3,2
	addiu	$2,$2,%lo(ans)
	addu	$2,$3,$2
	li	$3,1061093376			# 0x3f3f0000
	ori	$3,$3,0x3f3f
	sw	$3,0($2)
	lw	$2,0($fp)
	nop
	addiu	$2,$2,1
	sw	$2,0($fp)
.L9:
	lw	$2,0($fp)
	nop
	slt	$2,$2,100
	bne	$2,$0,.L10
	nop

	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	initAns
	.size	initAns, .-initAns
	.align	2
	.globl	addEdge
	.set	nomips16
	.set	nomicromips
	.ent	addEdge
	.type	addEdge, @function
addEdge:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	sw	$5,12($fp)
	sw	$6,16($fp)
	lw	$3,%gp_rel(cnt)($28)
	lui	$2,%hi(edge)
	sll	$3,$3,4
	addiu	$2,$2,%lo(edge)
	addu	$2,$3,$2
	lw	$3,8($fp)
	nop
	sw	$3,0($2)
	lw	$2,%gp_rel(cnt)($28)
	lui	$3,%hi(edge)
	addiu	$3,$3,%lo(edge)
	sll	$2,$2,4
	addu	$2,$3,$2
	lw	$3,12($fp)
	nop
	sw	$3,4($2)
	lw	$3,%gp_rel(cnt)($28)
	lui	$2,%hi(edge)
	sll	$3,$3,4
	addiu	$2,$2,%lo(edge)
	addu	$2,$3,$2
	lw	$3,16($fp)
	nop
	sw	$3,8($2)
	lw	$2,%gp_rel(cnt)($28)
	lui	$3,%hi(head)
	lw	$4,8($fp)
	nop
	sll	$4,$4,2
	addiu	$3,$3,%lo(head)
	addu	$3,$4,$3
	lw	$3,0($3)
	lui	$4,%hi(edge)
	addiu	$4,$4,%lo(edge)
	sll	$2,$2,4
	addu	$2,$4,$2
	sw	$3,12($2)
	lw	$3,%gp_rel(cnt)($28)
	lui	$2,%hi(head)
	lw	$4,8($fp)
	nop
	sll	$4,$4,2
	addiu	$2,$2,%lo(head)
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,%gp_rel(cnt)($28)
	nop
	addiu	$2,$2,1
	sw	$2,%gp_rel(cnt)($28)
	nop
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	addEdge
	.size	addEdge, .-addEdge

	.comm	heap,808,4
	.align	2
	.globl	getMin
	.set	nomips16
	.set	nomicromips
	.ent	getMin
	.type	getMin, @function
getMin:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	sw	$5,12($fp)
	lw	$2,8($fp)
	lw	$3,12($fp)
	nop
	lw	$4,0($3)
	lw	$3,4($3)
	sw	$4,0($2)
	sw	$3,4($2)
	lw	$2,8($fp)
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	getMin
	.size	getMin, .-getMin
	.align	2
	.globl	initHeap
	.set	nomips16
	.set	nomicromips
	.ent	initHeap
	.type	initHeap, @function
initHeap:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	sw	$0,0($fp)
	lw	$2,16($fp)
	li	$3,100			# 0x64
	sw	$3,804($2)
	lw	$2,16($fp)
	nop
	sw	$0,800($2)
	sw	$0,0($fp)
	b	.L16
	nop

.L17:
	lw	$3,16($fp)
	lw	$2,0($fp)
	nop
	sll	$2,$2,3
	addu	$2,$3,$2
	sw	$0,4($2)
	lw	$3,16($fp)
	lw	$2,0($fp)
	nop
	sll	$2,$2,3
	addu	$2,$3,$2
	sw	$0,0($2)
	lw	$2,0($fp)
	nop
	addiu	$2,$2,1
	sw	$2,0($fp)
.L16:
	lw	$2,0($fp)
	nop
	slt	$2,$2,100
	bne	$2,$0,.L17
	nop

	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	initHeap
	.size	initHeap, .-initHeap
	.align	2
	.globl	push
	.set	nomips16
	.set	nomicromips
	.ent	push
	.type	push, @function
push:
	.frame	$fp,24,$31		# vars= 16, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$fp,20($sp)
	move	$fp,$sp
	sw	$4,24($fp)
	sw	$5,28($fp)
	sw	$6,32($fp)
	lw	$2,24($fp)
	nop
	lw	$3,800($2)
	lw	$2,24($fp)
	nop
	lw	$2,804($2)
	nop
	bne	$3,$2,.L19
	nop

	lw	$2,24($fp)
	b	.L20
	nop

.L19:
	lw	$2,24($fp)
	nop
	lw	$2,800($2)
	lw	$4,24($fp)
	sll	$3,$2,3
	addu	$3,$4,$3
	lw	$5,28($fp)
	lw	$4,32($fp)
	sw	$5,0($3)
	sw	$4,4($3)
	addiu	$3,$2,1
	lw	$2,24($fp)
	nop
	sw	$3,800($2)
	lw	$2,24($fp)
	nop
	lw	$2,800($2)
	nop
	addiu	$2,$2,-1
	sw	$2,0($fp)
	b	.L21
	nop

.L23:
	lw	$2,0($fp)
	nop
	addiu	$2,$2,-1
	sra	$2,$2,1
	lw	$3,24($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,4($2)
	sw	$3,4($fp)
	sw	$2,8($fp)
	lw	$2,0($fp)
	nop
	addiu	$2,$2,-1
	sra	$2,$2,1
	lw	$3,24($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	lw	$4,24($fp)
	lw	$3,0($fp)
	nop
	sll	$3,$3,3
	addu	$3,$4,$3
	lw	$4,0($3)
	lw	$3,4($3)
	sw	$4,0($2)
	sw	$3,4($2)
	lw	$3,24($fp)
	lw	$2,0($fp)
	nop
	sll	$2,$2,3
	addu	$2,$3,$2
	lw	$4,4($fp)
	lw	$3,8($fp)
	sw	$4,0($2)
	sw	$3,4($2)
	lw	$2,0($fp)
	nop
	addiu	$2,$2,-1
	sra	$2,$2,1
	sw	$2,0($fp)
.L21:
	lw	$2,0($fp)
	nop
	blez	$2,.L22
	nop

	lw	$2,0($fp)
	nop
	addiu	$2,$2,-1
	sra	$2,$2,1
	lw	$3,24($fp)
	sll	$2,$2,3
	addu	$2,$3,$2
	lw	$3,4($2)
	lw	$4,24($fp)
	lw	$2,0($fp)
	nop
	sll	$2,$2,3
	addu	$2,$4,$2
	lw	$2,4($2)
	nop
	slt	$2,$2,$3
	bne	$2,$0,.L23
	nop

.L22:
	lw	$2,24($fp)
.L20:
	move	$sp,$fp
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	push
	.size	push, .-push
	.align	2
	.globl	heapify
	.set	nomips16
	.set	nomicromips
	.ent	heapify
	.type	heapify, @function
heapify:
	.frame	$fp,48,$31		# vars= 24, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$5,52($fp)
	lw	$2,48($fp)
	nop
	lw	$2,800($2)
	nop
	slt	$2,$2,2
	beq	$2,$0,.L25
	nop

	lw	$2,48($fp)
	b	.L26
	nop

.L25:
	lw	$2,52($fp)
	nop
	sll	$2,$2,1
	ori	$2,$2,0x1
	sw	$2,20($fp)
	lw	$2,52($fp)
	nop
	sll	$2,$2,1
	addiu	$2,$2,2
	sw	$2,24($fp)
	lw	$2,52($fp)
	nop
	sw	$2,16($fp)
	lw	$2,48($fp)
	nop
	lw	$3,800($2)
	lw	$2,20($fp)
	nop
	slt	$2,$2,$3
	beq	$2,$0,.L27
	nop

	lw	$3,48($fp)
	lw	$2,20($fp)
	nop
	sll	$2,$2,3
	addu	$2,$3,$2
	lw	$3,4($2)
	lw	$4,48($fp)
	lw	$2,52($fp)
	nop
	sll	$2,$2,3
	addu	$2,$4,$2
	lw	$2,4($2)
	nop
	slt	$2,$3,$2
	beq	$2,$0,.L27
	nop

	lw	$2,20($fp)
	nop
	sw	$2,16($fp)
.L27:
	lw	$2,48($fp)
	nop
	lw	$3,800($2)
	lw	$2,24($fp)
	nop
	slt	$2,$2,$3
	beq	$2,$0,.L28
	nop

	lw	$3,48($fp)
	lw	$2,24($fp)
	nop
	sll	$2,$2,3
	addu	$2,$3,$2
	lw	$3,4($2)
	lw	$4,48($fp)
	lw	$2,52($fp)
	nop
	sll	$2,$2,3
	addu	$2,$4,$2
	lw	$2,4($2)
	nop
	slt	$2,$3,$2
	beq	$2,$0,.L28
	nop

	lw	$2,24($fp)
	nop
	sw	$2,16($fp)
.L28:
	lw	$3,16($fp)
	lw	$2,52($fp)
	nop
	beq	$3,$2,.L29
	nop

	lw	$3,48($fp)
	lw	$2,52($fp)
	nop
	sll	$2,$2,3
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,4($2)
	sw	$3,28($fp)
	sw	$2,32($fp)
	lw	$3,48($fp)
	lw	$2,52($fp)
	nop
	sll	$2,$2,3
	addu	$2,$3,$2
	lw	$4,48($fp)
	lw	$3,16($fp)
	nop
	sll	$3,$3,3
	addu	$3,$4,$3
	lw	$4,0($3)
	lw	$3,4($3)
	sw	$4,0($2)
	sw	$3,4($2)
	lw	$3,48($fp)
	lw	$2,16($fp)
	nop
	sll	$2,$2,3
	addu	$2,$3,$2
	lw	$4,28($fp)
	lw	$3,32($fp)
	sw	$4,0($2)
	sw	$3,4($2)
	lw	$4,48($fp)
	lw	$5,16($fp)
	jal	heapify
	nop

	sw	$2,48($fp)
.L29:
	lw	$2,48($fp)
.L26:
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	heapify
	.size	heapify, .-heapify
	.align	2
	.globl	pop
	.set	nomips16
	.set	nomicromips
	.ent	pop
	.type	pop, @function
pop:
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
	lw	$2,24($fp)
	nop
	lw	$2,800($2)
	nop
	bne	$2,$0,.L31
	nop

	lw	$2,24($fp)
	b	.L32
	nop

.L31:
	lw	$2,28($fp)
	lw	$3,24($fp)
	nop
	lw	$4,0($3)
	lw	$3,4($3)
	sw	$4,0($2)
	sw	$3,4($2)
	lw	$2,24($fp)
	nop
	lw	$2,800($2)
	nop
	addiu	$3,$2,-1
	lw	$2,24($fp)
	nop
	sw	$3,800($2)
	lw	$2,24($fp)
	nop
	lw	$3,800($2)
	lw	$2,24($fp)
	lw	$4,24($fp)
	sll	$3,$3,3
	addu	$3,$4,$3
	lw	$4,0($3)
	lw	$3,4($3)
	sw	$4,0($2)
	sw	$3,4($2)
	lw	$4,24($fp)
	move	$5,$0
	jal	heapify
	nop

	sw	$2,24($fp)
	lw	$2,24($fp)
.L32:
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	pop
	.size	pop, .-pop
	.align	2
	.globl	empty
	.set	nomips16
	.set	nomicromips
	.ent	empty
	.type	empty, @function
empty:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	lw	$2,8($fp)
	nop
	lw	$2,800($2)
	nop
	sltu	$2,$2,1
	andi	$2,$2,0x00ff
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	empty
	.size	empty, .-empty
	.align	2
	.globl	Dijkstra
	.set	nomips16
	.set	nomicromips
	.ent	Dijkstra
	.type	Dijkstra, @function
Dijkstra:
	.frame	$fp,64,$31		# vars= 40, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-64
	sw	$31,60($sp)
	sw	$fp,56($sp)
	move	$fp,$sp
	sw	$4,64($fp)
	sw	$0,36($fp)
	lw	$2,64($fp)
	nop
	sw	$2,32($fp)
	lui	$2,%hi(ans)
	lw	$3,64($fp)
	nop
	sll	$3,$3,2
	addiu	$2,$2,%lo(ans)
	addu	$2,$3,$2
	sw	$0,0($2)
	lui	$2,%hi(heap)
	addiu	$4,$2,%lo(heap)
	lw	$5,32($fp)
	lw	$6,36($fp)
	jal	push
	nop

	b	.L36
	nop

.L41:
	addiu	$2,$fp,40
	lui	$3,%hi(heap)
	addiu	$4,$3,%lo(heap)
	move	$5,$2
	jal	pop
	nop

	lw	$3,44($fp)
	lw	$4,40($fp)
	lui	$2,%hi(ans)
	sll	$4,$4,2
	addiu	$2,$2,%lo(ans)
	addu	$2,$4,$2
	lw	$2,0($2)
	nop
	slt	$2,$2,$3
	bne	$2,$0,.L36
	nop

.L37:
	lw	$2,44($fp)
	nop
	sw	$2,20($fp)
	lw	$2,40($fp)
	nop
	sw	$2,24($fp)
	lui	$2,%hi(head)
	lw	$3,24($fp)
	nop
	sll	$3,$3,2
	addiu	$2,$2,%lo(head)
	addu	$2,$3,$2
	lw	$2,0($2)
	nop
	sw	$2,16($fp)
	b	.L38
	nop

.L40:
	lui	$3,%hi(edge)
	lw	$2,16($fp)
	addiu	$3,$3,%lo(edge)
	sll	$2,$2,4
	addu	$2,$3,$2
	lw	$2,4($2)
	nop
	sw	$2,28($fp)
	lui	$2,%hi(ans)
	lw	$3,28($fp)
	nop
	sll	$3,$3,2
	addiu	$2,$2,%lo(ans)
	addu	$2,$3,$2
	lw	$3,0($2)
	lui	$2,%hi(edge)
	lw	$4,16($fp)
	nop
	sll	$4,$4,4
	addiu	$2,$2,%lo(edge)
	addu	$2,$4,$2
	lw	$4,8($2)
	lw	$2,20($fp)
	nop
	addu	$2,$4,$2
	slt	$2,$2,$3
	beq	$2,$0,.L39
	nop

	lui	$2,%hi(edge)
	lw	$3,16($fp)
	nop
	sll	$3,$3,4
	addiu	$2,$2,%lo(edge)
	addu	$2,$3,$2
	lw	$3,8($2)
	lw	$2,20($fp)
	nop
	addu	$3,$3,$2
	lui	$2,%hi(ans)
	lw	$4,28($fp)
	nop
	sll	$4,$4,2
	addiu	$2,$2,%lo(ans)
	addu	$2,$4,$2
	sw	$3,0($2)
	lui	$2,%hi(ans)
	lw	$3,28($fp)
	nop
	sll	$3,$3,2
	addiu	$2,$2,%lo(ans)
	addu	$2,$3,$2
	lw	$2,0($2)
	nop
	sw	$2,52($fp)
	lw	$2,28($fp)
	nop
	sw	$2,48($fp)
	lui	$2,%hi(heap)
	addiu	$4,$2,%lo(heap)
	lw	$5,48($fp)
	lw	$6,52($fp)
	jal	push
	nop

.L39:
	lui	$3,%hi(edge)
	lw	$2,16($fp)
	addiu	$3,$3,%lo(edge)
	sll	$2,$2,4
	addu	$2,$3,$2
	lw	$2,12($2)
	nop
	sw	$2,16($fp)
.L38:
	lw	$2,16($fp)
	nop
	bne	$2,$0,.L40
	nop

.L36:
	lui	$2,%hi(heap)
	addiu	$4,$2,%lo(heap)
	jal	empty
	nop

	beq	$2,$0,.L41
	nop

	move	$sp,$fp
	lw	$31,60($sp)
	lw	$fp,56($sp)
	addiu	$sp,$sp,64
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	Dijkstra
	.size	Dijkstra, .-Dijkstra
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
	.globl	drawMap
	.set	nomips16
	.set	nomicromips
	.ent	drawMap
	.type	drawMap, @function
drawMap:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	li	$4,1			# 0x1
	li	$5,2			# 0x2
	li	$6,1			# 0x1
	jal	addEdge
	nop

	li	$4,1			# 0x1
	li	$5,4			# 0x4
	li	$6,4			# 0x4
	jal	addEdge
	nop

	li	$4,2			# 0x2
	li	$5,3			# 0x3
	li	$6,8			# 0x8
	jal	addEdge
	nop

	li	$4,2			# 0x2
	li	$5,4			# 0x4
	li	$6,2			# 0x2
	jal	addEdge
	nop

	li	$4,3			# 0x3
	li	$5,5			# 0x5
	li	$6,10			# 0xa
	jal	addEdge
	nop

	li	$4,4			# 0x4
	li	$5,2			# 0x2
	li	$6,2			# 0x2
	jal	addEdge
	nop

	li	$4,4			# 0x4
	li	$5,5			# 0x5
	li	$6,2			# 0x2
	jal	addEdge
	nop

	li	$4,5			# 0x5
	li	$5,3			# 0x3
	li	$6,3			# 0x3
	jal	addEdge
	nop

	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	drawMap
	.size	drawMap, .-drawMap
	.globl	real
	.data
	.align	2
	.type	real, @object
	.size	real, 24
real:
	.word	0
	.word	0
	.word	1
	.word	8
	.word	3
	.word	5
	.text
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
	jal	drawMap
	nop

	jal	initAns
	nop

	lui	$2,%hi(heap)
	addiu	$4,$2,%lo(heap)
	jal	initHeap
	nop

	li	$4,1			# 0x1
	jal	Dijkstra
	nop

	li	$2,1			# 0x1
	sw	$2,20($fp)
	b	.L44
	nop

.L47:
	lui	$2,%hi(ans)
	lw	$3,20($fp)
	nop
	sll	$3,$3,2
	addiu	$2,$2,%lo(ans)
	addu	$2,$3,$2
	lw	$3,0($2)
	lui	$2,%hi(real)
	lw	$4,20($fp)
	nop
	sll	$4,$4,2
	addiu	$2,$2,%lo(real)
	addu	$2,$4,$2
	lw	$2,0($2)
	nop
	beq	$3,$2,.L45
	nop

	li	$2,1			# 0x1
	sw	$2,16($fp)
	b	.L46
	nop

.L45:
	lw	$2,20($fp)
	nop
	addiu	$2,$2,1
	sw	$2,20($fp)
.L44:
	lw	$2,20($fp)
	nop
	slt	$2,$2,6
	bne	$2,$0,.L47
	nop

.L46:
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
