.arch armv8-a
	.file	"inputC.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%d\n"
	.align	3
.LC1:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	adrp	x8, z
	ldr	w9, [x8, #:lo12:z]
	adrp	x10, n
	add	x10, x10, :lo12:n
	adrp	x11, i
	add	x11, x11, :lo12:i
	adrp	x12, .LC1
	add	x12, x12, :lo12:.LC1
	adrp	x13, .LC0
	add	x13, x13, :lo12:.LC0
	mov	w14, w0
	mov	w15, w1
	mov	w16, 0
	mov	w17, w9
	b	.L2
	.p2align 2,,3
.L15:
	add	w16, w16, w0
	cmp	w14, w16
	csel	w14, w14, w16, ge
	subs	w9, w9, #1
	str	w9, [x10]
	beq	.L12
.L6:
	cmp	w16, 0
	csel	w16, w16, wzr, ge
.L2:
	ldr	w9, [x10]
	cbnz	w9, .L3
	cmp	w14, 1
	beq	.L4
	mov	w1, w14
	mov	x0, x13
	bl	printf
	cmp	w0, 0
	cset	w16, eq
.L4:
	str	w17, [x11]
	mov	w14, w17
.L3:
	mov	x0, x12
	mov	x1, x11
	bl	scanf
	ldr	w0, [x11]
	cmp	w0, w17
	bne	.L15
	ldr	w9, [x10]
	cbnz	w9, .L6
.L12:
	mov	w0, 0
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
	.size	main, .-main
	.global	i
	.global	n
	.global	z
	.data
	.align	2
	.type	z, %object
	.size	z, 4
z:
	.word	-100000000
	.bss
	.align	2
	.type	n, %object
	.size	n, 4
n:
	.zero	4
	.type	i, %object
	.size	i, 4
i:
	.zero	4
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
