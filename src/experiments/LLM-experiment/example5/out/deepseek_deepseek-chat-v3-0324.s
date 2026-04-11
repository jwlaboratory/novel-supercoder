.arch armv8-a
	.file	"inputC.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%d %d"
	.align	3
.LC1:
	.string	"%d"
	.align	3
.LC2:
	.string	"%d "
	.align	3
.LC3:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,15
	.global	main
	.type	main, %function
main:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -496]!
	.cfi_def_cfa_offset 496
	.cfi_offset 29, -496
	.cfi_offset 30, -488
	mov	x29, sp
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 19, -480
	.cfi_offset 20, -472
	.cfi_offset 21, -464
	.cfi_offset 22, -456
	.cfi_offset 23, -448
	.cfi_offset 24, -440
	.cfi_offset 25, -432
	.cfi_offset 26, -424
	.cfi_offset 27, -416
	.cfi_offset 28, -408
	add	x0, x29, 96
	mov	x2, 400
	mov	w1, 0
	bl	memset
	add	x2, x29, 92
	add	x1, x29, 88
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	__isoc99_scanf
	ldp	w22, w19, [x29, 88]
	mov	w0, w22
	mul	w0, w0, w19
	lsl	x0, x0, 2
	add	x0, x0, 15
	and	x0, x0, -16
	sub	sp, sp, x0
	cmp	w22, 0
	ble	.L24
	sbfiz	x24, w19, 2, 32
	adrp	x25, .LC1
	mov	x21, sp
	mov	x26, 0
	mov	w23, 0
	add	x25, x25, :lo12:.LC1
	cmp	w19, 0
	ble	.L7
.L6:
	add	x20, x21, x26
	mov	w27, 0
.L4:
	mov	x1, x20
	mov	x0, x25
	add	w27, w27, 1
	bl	__isoc99_scanf
	add	x20, x20, 4
	cmp	w19, w27
	bgt	.L4
	add	w23, w23, 1
	cmp	w22, w23
	beq	.L5
	add	x26, x26, x24
	cmp	w19, 0
	bgt	.L6
.L7:
	adrp	x23, .LC3
	adrp	x25, .LC2
	add	x23, x23, :lo12:.LC3
	add	x25, x25, :lo12:.LC2
	mov	w26, 0
.L8:
	add	x20, x29, 96
	mov	x27, 0
	mov	w28, 0
	cmp	w19, 0
	ble	.L11
.L9:
	ldr	w1, [x21, x27, lsl 2]
	mov	x0, x25
	bl	printf
	ldr	w0, [x21, x27, lsl 2]
	add	x27, x27, 1
	add	w28, w28, w0
	ldr	w1, [x20]
	add	w0, w1, w0
	str	w0, [x20], 4
	cmp	w19, w27
	bgt	.L9
.L11:
	mov	w1, w28
	mov	x0, x23
	bl	printf
	add	w26, w26, 1
	cmp	w22, w26
	ble	.L26
	add	x21, x21, x24
	b	.L8
.L26:
.L2:
	cmp	w19, 0
	ble	.L14
	adrp	x23, .LC2
	add	x20, x29, 96
	add	x23, x23, :lo12:.LC2
	mov	w21, 0
	mov	w25, 0
.L13:
	ldr	w24, [x20], 4
	mov	x0, x23
	add	w25, w25, 1
	mov	w1, w24
	bl	printf
	add	w21, w21, w24
	cmp	w19, w25
	bgt	.L13
.L12:
	mov	w1, w21
	mov	x0, x23
	bl	printf
	mov	sp, x29
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 496
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
	.cfi_def_cfa 31, 0
	ret
.L5:
	.cfi_restore_state
	cmp	w22, 0
	bgt	.L7
.L24:
	adrp	x23, .LC3
	add	x23, x23, :lo12:.LC3
	b	.L2
.L14:
	mov	w21, 0
	b	.L12
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
