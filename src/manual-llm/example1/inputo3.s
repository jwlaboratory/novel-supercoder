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
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x21, [sp, 32]
	.cfi_offset 21, -16
	adrp	x21, .LANCHOR0
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	mov	w20, w0
	mov	x0, 32
	ldr	x19, [x21, #:lo12:.LANCHOR0]
	bl	malloc
	stp	xzr, xzr, [x0]
	str	w20, [x0, 24]
	cbz	x19, .L2
	.p2align 3,,7
.L7:
	ldr	w1, [x19, 24]
	ldp	x3, x2, [x19]
	cmp	w20, w1
	bge	.L3
.L14:
	cbz	x2, .L13
	mov	x19, x2
	ldr	w1, [x19, 24]
	ldp	x3, x2, [x19]
	cmp	w20, w1
	blt	.L14
.L3:
	cbz	x3, .L6
	mov	x19, x3
	b	.L7
	.p2align 2,,3
.L13:
	str	x19, [x0, 16]
	str	x0, [x19, 8]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L6:
	.cfi_restore_state
	str	x19, [x0, 16]
	str	x0, [x19]
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L2:
	.cfi_restore_state
	str	xzr, [x0, 16]
	ldp	x19, x20, [sp, 16]
	str	x0, [x21, #:lo12:.LANCHOR0]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
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
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	adrp	x23, .LC0
	add	x23, x23, :lo12:.LC0
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -16
	.cfi_offset 28, -8
	mov	x28, x0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x25, x26, [sp, 64]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 25, -32
	.cfi_offset 26, -24
.L34:
	ldr	x27, [x28, 8]
	cbz	x27, .L16
.L33:
	ldr	x26, [x27, 8]
	cbz	x26, .L17
.L32:
	ldr	x25, [x26, 8]
	cbz	x25, .L18
.L31:
	ldr	x24, [x25, 8]
	cbz	x24, .L19
.L30:
	ldr	x22, [x24, 8]
	cbz	x22, .L20
.L29:
	ldr	x21, [x22, 8]
	cbz	x21, .L21
.L28:
	ldr	x19, [x21, 8]
	cbz	x19, .L22
.L27:
	ldr	x20, [x19, 8]
	cbz	x20, .L23
.L26:
	ldr	x1, [x20, 8]
	mov	x0, x23
	cbz	x1, .L24
	mov	x0, x1
	bl	inorder
	ldr	w1, [x20, 24]
	mov	x0, x23
	bl	printf
	ldr	x20, [x20]
	cbnz	x20, .L26
	.p2align 3,,7
.L23:
	ldr	w1, [x19, 24]
	mov	x0, x23
	bl	printf
	ldr	x19, [x19]
	cbnz	x19, .L27
.L22:
	ldr	w1, [x21, 24]
	mov	x0, x23
	bl	printf
	ldr	x21, [x21]
	cbnz	x21, .L28
.L21:
	ldr	w1, [x22, 24]
	mov	x0, x23
	bl	printf
	ldr	x22, [x22]
	cbnz	x22, .L29
.L20:
	ldr	w1, [x24, 24]
	mov	x0, x23
	bl	printf
	ldr	x24, [x24]
	cbnz	x24, .L30
.L19:
	ldr	w1, [x25, 24]
	mov	x0, x23
	bl	printf
	ldr	x25, [x25]
	cbnz	x25, .L31
.L18:
	ldr	w1, [x26, 24]
	mov	x0, x23
	bl	printf
	ldr	x26, [x26]
	cbnz	x26, .L32
.L17:
	ldr	w1, [x27, 24]
	mov	x0, x23
	bl	printf
	ldr	x27, [x27]
	cbnz	x27, .L33
.L16:
	ldr	w1, [x28, 24]
	mov	x0, x23
	bl	printf
	ldr	x28, [x28]
	cbnz	x28, .L34
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L24:
	.cfi_restore_state
	ldr	w1, [x20, 24]
	bl	printf
	ldr	x20, [x20]
	cbnz	x20, .L26
	ldr	w1, [x19, 24]
	mov	x0, x23
	bl	printf
	ldr	x19, [x19]
	cbnz	x19, .L27
	b	.L22
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
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	adrp	x23, .LC0
	add	x23, x23, :lo12:.LC0
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -16
	.cfi_offset 28, -8
	mov	x28, x0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x25, x26, [sp, 64]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 25, -32
	.cfi_offset 26, -24
.L90:
	ldr	w1, [x28, 24]
	mov	x0, x23
	bl	printf
	ldr	x27, [x28, 8]
	cbz	x27, .L72
.L89:
	ldr	w1, [x27, 24]
	mov	x0, x23
	bl	printf
	ldr	x26, [x27, 8]
	cbz	x26, .L73
.L88:
	ldr	w1, [x26, 24]
	mov	x0, x23
	bl	printf
	ldr	x25, [x26, 8]
	cbz	x25, .L74
.L87:
	ldr	w1, [x25, 24]
	mov	x0, x23
	bl	printf
	ldr	x24, [x25, 8]
	cbz	x24, .L75
.L86:
	ldr	w1, [x24, 24]
	mov	x0, x23
	bl	printf
	ldr	x22, [x24, 8]
	cbz	x22, .L76
.L85:
	ldr	w1, [x22, 24]
	mov	x0, x23
	bl	printf
	ldr	x21, [x22, 8]
	cbz	x21, .L77
.L84:
	ldr	w1, [x21, 24]
	mov	x0, x23
	bl	printf
	ldr	x19, [x21, 8]
	cbz	x19, .L78
.L83:
	ldr	w1, [x19, 24]
	mov	x0, x23
	bl	printf
	ldr	x20, [x19, 8]
	cbz	x20, .L79
.L82:
	ldr	w1, [x20, 24]
	mov	x0, x23
	bl	printf
	ldr	x0, [x20, 8]
	cbz	x0, .L80
	bl	preorder
	ldr	x20, [x20]
	cbnz	x20, .L82
	.p2align 3,,7
.L79:
	ldr	x19, [x19]
	cbnz	x19, .L83
.L78:
	ldr	x21, [x21]
	cbnz	x21, .L84
.L77:
	ldr	x22, [x22]
	cbnz	x22, .L85
.L76:
	ldr	x24, [x24]
	cbnz	x24, .L86
.L75:
	ldr	x25, [x25]
	cbnz	x25, .L87
.L74:
	ldr	x26, [x26]
	cbnz	x26, .L88
.L73:
	ldr	x27, [x27]
	cbnz	x27, .L89
.L72:
	ldr	x28, [x28]
	cbnz	x28, .L90
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L80:
	.cfi_restore_state
	ldr	x20, [x20]
	cbnz	x20, .L82
	ldr	x19, [x19]
	cbnz	x19, .L83
	b	.L78
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
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	adrp	x23, .LC1
	add	x23, x23, :lo12:.LC1
	mov	x0, x23
	add	x1, sp, 64
	bl	__isoc99_scanf
	ldr	w0, [sp, 64]
	cmp	w0, 0
	ble	.L139
	adrp	x24, .LANCHOR0
	stp	x19, x20, [sp, 16]
	.cfi_offset 20, -72
	.cfi_offset 19, -80
	mov	w20, 0
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -56
	.cfi_offset 21, -64
	adrp	x22, .LC2
	add	x22, x22, :lo12:.LC2
	b	.L137
	.p2align 2,,3
.L129:
	cmp	w0, 112
	beq	.L143
.L136:
	ldr	w0, [sp, 64]
	add	w20, w20, 1
	cmp	w0, w20
	ble	.L144
.L137:
	add	x1, sp, 72
	mov	x0, x22
	bl	__isoc99_scanf
	ldrb	w0, [sp, 72]
	cmp	w0, 105
	bne	.L129
	add	x1, sp, 68
	mov	x0, x23
	bl	__isoc99_scanf
	ldr	w21, [sp, 68]
	ldr	x19, [x24, #:lo12:.LANCHOR0]
	mov	x0, 32
	bl	malloc
	stp	xzr, xzr, [x0]
	str	w21, [x0, 24]
	cbz	x19, .L130
	.p2align 3,,7
.L135:
	ldr	w1, [x19, 24]
	ldp	x2, x3, [x19]
	cmp	w21, w1
	blt	.L131
.L146:
	cbz	x2, .L145
	mov	x19, x2
	ldr	w1, [x19, 24]
	ldp	x2, x3, [x19]
	cmp	w21, w1
	bge	.L146
.L131:
	cbz	x3, .L134
	mov	x19, x3
	b	.L135
	.p2align 2,,3
.L143:
	ldr	x0, [x24, #:lo12:.LANCHOR0]
	add	w20, w20, 1
	bl	inorder
	mov	w0, 10
	bl	putchar
	ldr	x0, [x24, #:lo12:.LANCHOR0]
	bl	preorder
	mov	w0, 10
	bl	putchar
	ldr	w0, [sp, 64]
	cmp	w0, w20
	bgt	.L137
	.p2align 3,,7
.L144:
	ldp	x19, x20, [sp, 16]
	.cfi_restore 20
	.cfi_restore 19
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
.L139:
	mov	w0, 0
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L145:
	.cfi_def_cfa_offset 96
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	str	x19, [x0, 16]
	str	x0, [x19]
	b	.L136
	.p2align 2,,3
.L134:
	str	x19, [x0, 16]
	str	x0, [x19, 8]
	b	.L136
.L130:
	str	x0, [x24, #:lo12:.LANCHOR0]
	str	xzr, [x0, 16]
	b	.L136
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
