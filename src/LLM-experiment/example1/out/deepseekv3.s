	.arch armv8-a
	.file	"inputC.c"
	.text
	.align	2
	.p2align 4,,11
	.global	insert
	.type	insert, %function
insert:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	adrp	x19, .LANCHOR0
	mov	w1, w0
	mov	x0, 32
	ldr	x2, [x19, #:lo12:.LANCHOR0]
	bl	malloc
	stp	xzr, xzr, [x0]
	str	w1, [x0, 24]
	cbz	x2, .L2
	.p2align 3,,7
.L7:
	ldr	w3, [x2, 24]
	cmp	w1, w3
	bge	.L3
	ldr	x3, [x2, 8]
	cbz	x3, .L6
	mov	x2, x3
	b	.L7
	.p2align 2,,3
.L3:
	ldr	x3, [x2, 16]
	cbz	x3, .L6
	mov	x2, x3
	b	.L7
	.p2align 2,,3
.L6:
	str	x2, [x0, 16]
	ldr	w3, [x2, 24]
	cmp	w1, w3
	bge	.L8
	str	x0, [x2, 8]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L8:
	.cfi_restore_state
	str	x0, [x2, 16]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L2:
	.cfi_restore_state
	str	x0, [x19, #:lo12:.LANCHOR0]
	str	xzr, [x0, 16]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	insert, .-insert
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	" %d"
	.text
	.align	2
	.p2align 4,,11
	.global	inorder
	.type	inorder, %function
inorder:
.LFB9:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	adrp	x19, .LC0
	add	x19, x19, :lo12:.LC0
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -16
	.cfi_offset 22, -8
	mov	x21, x0
.L34:
	ldr	x20, [x21, 8]
	cbz	x20, .L16
	mov	x0, x20
	bl	inorder
.L16:
	ldr	w1, [x21, 24]
	mov	x0, x19
	bl	printf
	ldr	x21, [x21, 16]
	cbnz	x21, .L34
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L16:
	.cfi_restore_state
	ldr	w1, [x21, 24]
	mov	x0, x19
	bl	printf
	ldr	x21, [x21, 16]
	cbnz	x21, .L34
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE9:
	.size	inorder, .-inorder
	.align	2
	.p2align 4,,11
	.global	preorder
	.type	preorder, %function
preorder:
.LFB10:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	adrp	x19, .LC0
	add	x19, x19, :lo12:.LC0
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -16
	.cfi_offset 22, -8
	mov	x21, x0
.L90:
	ldr	w1, [x21, 24]
	mov	x0, x19
	bl	printf
	ldr	x20, [x21, 8]
	cbz	x20, .L72
	mov	x0, x20
	bl	preorder
.L72:
	ldr	x21, [x21, 16]
	cbnz	x21, .L90
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L72:
	.cfi_restore_state
	ldr	x21, [x21, 16]
	cbnz	x21, .L90
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE10:
	.size	preorder, .-preorder
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"%d"
	.align	3
.LC2:
	.string	"%s"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB11:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	adrp	x19, .LC1
	add	x19, x19, :lo12:.LC1
	add	x1, sp, 48
	mov	x0, x19
	bl	__isoc99_scanf
	ldr	w0, [sp, 48]
	cmp	w0, 0
	ble	.L139
	adrp	x20, .LANCHOR0
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	mov	w21, 0
	adrp	x22, .LC2
	add	x22, x22, :lo12:.LC2
	b	.L137
	.p2align 2,,3
.L129:
	cmp	w0, 112
	beq	.L143
.L136:
	ldr	w0, [sp, 48]
	add	w21, w21, 1
	cmp	w0, w21
	ble	.L144
.L137:
	add	x1, sp, 56
	mov	x0, x22
	bl	__isoc99_scanf
	ldrb	w0, [sp, 56]
	cmp	w0, 105
	bne	.L129
	add	x1, sp, 52
	mov	x0, x19
	bl	__isoc99_scanf
	ldr	w0, [sp, 52]
	bl	insert
	b	.L136
	.p2align 2,,3
.L143:
	ldr	x0, [x20, #:lo12:.LANCHOR0]
	add	w21, w21, 1
	bl	inorder
	mov	w0, 10
	bl	putchar
	ldr	x0, [x20, #:lo12:.LANCHOR0]
	bl	preorder
	mov	w0, 10
	bl	putchar
	ldr	w0, [sp, 48]
	cmp	w0, w21
	bgt	.L137
	.p2align 3,,7
.L144:
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
.L139:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.global	root
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	root, %object
	.size	root, 8
root:
	.zero	8
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits