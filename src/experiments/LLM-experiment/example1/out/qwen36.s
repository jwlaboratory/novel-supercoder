	.arch armv8-a
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	" %d"
.LC1:
	.string	"%d"
.LC2:
	.string	"%s"

	.text
	.align	2
	.global	insert
	.type	insert, %function
insert:
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [sp, 16]
	mov	w19, w0
	adrp	x2, root
	ldr	x20, [x2, :lo12:root]
	cbz	x20, .L_ins_empty
	mov	x21, xzr
.L_ins_loop:
	mov	x21, x20
	ldr	w0, [x20, 24]
	cmp	w19, w0
	bge	1f
	ldr	x20, [x20, 8]
	cbnz	x20, .L_ins_loop
	b	2f
1:
	ldr	x20, [x20, 16]
	cbnz	x20, .L_ins_loop
2:
	mov	x0, 32
	bl	malloc
	stp	xzr, xzr, [x0]
	str	w19, [x0, 24]
	str	x21, [x0, 16]
	cbz	x21, .L_ins_root
	ldr	w1, [x21, 24]
	cmp	w19, w1
	bge	.L_ins_right
	str	x0, [x21, 8]
	b	.L_ins_end
.L_ins_root:
	adrp	x21, root
	str	x0, [x21, :lo12:root]
	b	.L_ins_end
.L_ins_right:
	str	x0, [x21, 16]
	b	.L_ins_end
.L_ins_empty:
	mov	x0, 32
	bl	malloc
	stp	xzr, xzr, [x0]
	str	w19, [x0, 24]
	str	xzr, [x0, 16]
	adrp	x21, root
	str	x0, [x21, :lo12:root]
.L_ins_end:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	insert, .-insert

	.align	2
	.global	inorder
	.type	inorder, %function
inorder:
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	cbz	x19, .L_in_ret
	ldr	x0, [x19, 8]
	cbz	x0, .L_in_left_done
	bl	inorder
.L_in_left_done:
	ldr	w1, [x19, 24]
	mov	x0, x20
	bl	printf
	ldr	x0, [x19, 16]
	cbz	x0, .L_in_ret
	bl	inorder
.L_in_ret:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	inorder, .-inorder

	.align	2
	.global	preorder
	.type	preorder, %function
preorder:
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	mov	x19, x0
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	cbz	x19, .L_pre_ret
	ldr	w1, [x19, 24]
	mov	x0, x20
	bl	printf
	ldr	x0, [x19, 8]
	cbz	x0, .L_pre_right
	bl	preorder
.L_pre_right:
	ldr	x0, [x19, 16]
	cbz	x0, .L_pre_ret
	bl	preorder
.L_pre_ret:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	preorder, .-preorder

	.section	.text.startup,"ax",@progbits
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	add	x1, sp, 28
	bl	__isoc99_scanf
	ldr	w20, [sp, 28]
	cbz	w20, .L_main_end
	mov	w19, wzr
	
	adrp	x23, .LC2
	add	x23, x23, :lo12:.LC2
	adrp	x24, .LC1
	add	x24, x24, :lo12:.LC1
	adrp	x22, root
	
.L_main_loop:
	mov	x0, x23
	add	x1, sp, 32
	bl	__isoc99_scanf
	ldrb	w0, [sp, 32]
	cmp	w0, #'i'
	bne	.L_main_print
	
	mov	x0, x24
	add	x1, sp, 28
	bl	__isoc99_scanf
	ldr	w0, [sp, 28]
	bl	insert
	b	.L_main_continue
	
.L_main_print:
	cmp	w0, #'p'
	bne	.L_main_continue
	ldr	x0, [x22, :lo12:root]
	cbz	x0, .L_main_skip_print
	bl	inorder
	mov	w0, 10
	bl	putchar
	ldr	x0, [x22, :lo12:root]
	bl	preorder
	mov	w0, 10
	bl	putchar
	
.L_main_skip_print:
.L_main_continue:
	add	w19, w19, 1
	cmp	w19, w20
	blt	.L_main_loop
	
.L_main_end:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	mov	w0, 0
	ret
	.size	main, .-main

	.bss
	.align	3
	.global	root
	.type	root, %object
	.size	root, 8
root:
	.zero	8