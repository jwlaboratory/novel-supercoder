	.arch armv8-a
	.file	"inputC.c"
	.text
	.align	2
	.p2align 4,,11
	.global	insert
	.type	insert, %function
insert:
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	str	x21, [sp, 32]
	mov	w20, w0
	mov	x0, 32
	bl	malloc
	mov	x19, x0
	stp	xzr, xzr, [x19]
	str	w20, [x19, 24]
	adrp	x1, .LANCHOR0
	ldr	x1, [x1, #:lo12:.LANCHOR0]
	cbz	x1, .Lins_root
	mov	x2, xzr
	mov	x3, x1
.Lins_loop:
	mov	x2, x3
	ldr	w4, [x3, 24]
	cmp	w20, w4
	bge	.Lins_right
	ldr	x3, [x3, 8]
	cbnz	x3, .Lins_loop
	b	.Lins_done_loop
.Lins_right:
	ldr	x3, [x3]
	cbnz	x3, .Lins_loop
.Lins_done_loop:
	str	x2, [x19, 16]
	ldr	w4, [x2, 24]
	cmp	w20, w4
	bge	.Lins_y_right
	str	x19, [x2, 8]
	b	.Lins_end
.Lins_y_right:
	str	x19, [x2]
	b	.Lins_end
.Lins_root:
	str	xzr, [x19, 16]
	adrp	x1, .LANCHOR0
	str	x19, [x1, #:lo12:.LANCHOR0]
.Lins_end:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret
	.size	insert, .-insert

	.align	2
	.p2align 4,,11
	.global	write_int
	.type	write_int, %function
write_int:
	adrp	x1, out_buf_len
	ldr	x2, [x1, #:lo12:out_buf_len]
	adrp	x3, out_buf
	add	x3, x3, #:lo12:out_buf
	cbz	w0, .Lwi_zero
	tbnz	w0, 31, .Lwi_neg
.Lwi_pos:
	mov	w4, 0
	mov	w5, 10
	sub	sp, sp, 16
	mov	x6, sp
.Lwi_loop:
	udiv	w7, w0, w5
	msub	w8, w7, w5, w0
	add	w8, w8, '0'
	strb	w8, [x6, w4, sxtw]
	add	w4, w4, 1
	mov	w0, w7
	cbnz	w0, .Lwi_loop
	sub	w4, w4, 1
.Lwi_rev_loop:
	ldrb	w0, [x6, w4, sxtw]
	strb	w0, [x3, x2, sxtw]
	add	x2, x2, 1
	subs	w4, w4, 1
	bge	.Lwi_rev_loop
	add	sp, sp, 16
	b	.Lwi_done
.Lwi_neg:
	neg	w0, w0
	mov	w8, '-'
	strb	w8, [x3, x2, sxtw]
	add	x2, x2, 1
	b	.Lwi_pos
.Lwi_zero:
	mov	w8, '0'
	strb	w8, [x3, x2, sxtw]
	add	x2, x2, 1
.Lwi_done:
	str	x2, [x1, #:lo12:out_buf_len]
	ret
	.size	write_int, .-write_int

	.align	2
	.p2align 4,,11
	.global	inorder
	.type	inorder, %function
inorder:
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [sp, 16]
	mov	x19, x0
	cbz	x19, .Learly_ret_inorder
	ldr	x0, [x19, 8]
	cbz	x0, .Lno_left
	bl	inorder
.Lno_left:
	adrp	x1, out_buf_len
	ldr	x2, [x1, #:lo12:out_buf_len]
	adrp	x3, out_buf
	add	x3, x3, #:lo12:out_buf
	mov	w0, ' '
	strb	w0, [x3, x2, sxtw]
	add	x2, x2, 1
	str	x2, [x1, #:lo12:out_buf_len]
	ldr	w0, [x19, 24]
	bl	write_int
	ldr	x0, [x19]
	cbz	x0, .Lno_right
	bl	inorder
.Lno_right:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.Learly_ret_inorder:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	inorder, .-inorder

	.align	2
	.p2align 4,,11
	.global	preorder
	.type	preorder, %function
preorder:
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [sp, 16]
	mov	x19, x0
	cbz	x19, .Learly_ret_preorder
	adrp	x1, out_buf_len
	ldr	x2, [x1, #:lo12:out_buf_len]
	adrp	x3, out_buf
	add	x3, x3, #:lo12:out_buf
	mov	w0, ' '
	strb	w0, [x3, x2, sxtw]
	add	x2, x2, 1
	str	x2, [x1, #:lo12:out_buf_len]
	ldr	w0, [x19, 24]
	bl	write_int
	ldr	x0, [x19, 8]
	cbz	x0, .Lno_left_pre
	bl	preorder
.Lno_left_pre:
	ldr	x0, [x19]
	cbz	x0, .Lno_right_pre
	bl	preorder
.Lno_right_pre:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
.Learly_ret_preorder:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	ret
	.size	preorder, .-preorder

	.align	2
	.p2align 4,,11
	.global	flush_buf
	.type	flush_buf, %function
flush_buf:
	adrp	x1, out_buf_len
	ldr	x2, [x1, #:lo12:out_buf_len]
	cbz	x2, .Lflush_done
	adrp	x0, out_buf
	add	x0, x0, #:lo12:out_buf
	mov	x1, x0
	mov	x0, 1
	mov	x8, 64
	svc	0
	adrp	x1, out_buf_len
	str	xzr, [x1, #:lo12:out_buf_len]
.Lflush_done:
	ret
	.size	flush_buf, .-flush_buf

	.section	.rodata.str1.8,"aMS",@progbits,1
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
	stp	x29, x30, [sp, -112]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	add	x1, sp, 96
	bl	__isoc99_scanf
	ldr	w21, [sp, 96]
	lsl	x0, x21, 5
	bl	malloc
	mov	x19, x0
	mov	x20, 0
	adrp	x23, .LANCHOR0
	str	xzr, [x23, #:lo12:.LANCHOR0]
	mov	w22, 0
.Lloop_start:
	cmp	w22, w21
	bge	.Lloop_end
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	add	x1, sp, 80
	bl	__isoc99_scanf
	ldrb	w0, [sp, 80]
	cmp	w0, 'i'
	bne	.Lnot_insert
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	add	x1, sp, 100
	bl	__isoc99_scanf
	ldr	w24, [sp, 100]
	add	x0, x19, x20
	add	x20, x20, 32
	stp	xzr, xzr, [x0]
	str	w24, [x0, 24]
	ldr	x1, [x23, #:lo12:.LANCHOR0]
	cbz	x1, .Lins_root_main
	mov	x2, xzr
	mov	x3, x1
.Lins_loop_main:
	mov	x2, x3
	ldr	w4, [x3, 24]
	cmp	w24, w4
	bge	.Lins_right_main
	ldr	x3, [x3, 8]
	cbnz	x3, .Lins_loop_main
	b	.Lins_done_loop_main
.Lins_right_main:
	ldr	x3, [x3]
	cbnz	x3, .Lins_loop_main
.Lins_done_loop_main:
	str	x2, [x0, 16]
	ldr	w4, [x2, 24]
	cmp	w24, w4
	bge	.Lins_y_right_main
	str	x0, [x2, 8]
	b	.Lins_end_main
.Lins_y_right_main:
	str	x0, [x2]
	b	.Lins_end_main
.Lins_root_main:
	str	xzr, [x0, 16]
	str	x0, [x23, #:lo12:.LANCHOR0]
.Lins_end_main:
	add	w22, w22, 1
	b	.Lloop_start
.Lnot_insert:
	ldr	x0, [x23, #:lo12:.LANCHOR0]
	bl	inorder
	adrp	x1, out_buf_len
	ldr	x2, [x1, #:lo12:out_buf_len]
	adrp	x3, out_buf
	add	x3, x3, #:lo12:out_buf
	mov	w0, 10
	strb	w0, [x3, x2, sxtw]
	add	x2, x2, 1
	str	x2, [x1, #:lo12:out_buf_len]
	ldr	x0, [x23, #:lo12:.LANCHOR0]
	bl	preorder
	adrp	x1, out_buf_len
	ldr	x2, [x1, #:lo12:out_buf_len]
	adrp	x3, out_buf
	add	x3, x3, #:lo12:out_buf
	mov	w0, 10
	strb	w0, [x3, x2, sxtw]
	add	x2, x2, 1
	str	x2, [x1, #:lo12:out_buf_len]
	bl	flush_buf
	add	w22, w22, 1
	b	.Lloop_start
.Lloop_end:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 112
	ret
	.size	main, .-main

	.global	root
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	root, %object
	.size	root, 8
root:
	.zero	8

	.align	3
	.global	out_buf
	.type	out_buf, %object
	.size	out_buf, 8000000
out_buf:
	.space	8000000

	.align	3
	.global	out_buf_len
	.type	out_buf_len, %object
	.size	out_buf_len, 8
out_buf_len:
	.space	8

	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits