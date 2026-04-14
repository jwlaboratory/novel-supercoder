	.arch armv8-a
	.file	"inputC.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%d"
	.align	3
.LC1:
	.string	"%d:%d"
	.align	3
.LC2:
	.string	"alert"
	.align	3
.LC3:
	.string	"safe"
	.align	3
.LC4:
	.string	"warning"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,15
	.global	main
	.type	main, %function
main:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	adrp	x0, .LC0
	add	x1, sp, 60
	add	x0, x0, :lo12:.LC0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	bl	__isoc99_scanf
	ldr	w19, [sp, 60]
	cbz	w19, .L2
	adrp	x20, .LC1
	adrp	x21, .LC4
	adrp	x22, .LC2
	add	x20, x20, :lo12:.LC1
	add	x21, x21, :lo12:.LC4
	add	x22, x22, :lo12:.LC2
	mov	w0, 0
	fmov	d8, 3.0e+1
	fmov	d9, 1.8e+2
	fmov	d10, 9.0e+1
.L15:
	add	x2, sp, 56
	add	x1, sp, 52
	mov	x0, x20
	bl	__isoc99_scanf
	ldr	w1, [sp, 52]
	cmp	w1, 11
	bhi	.L3
	ldr	w2, [sp, 56]
	cmp	w2, 59
	bhi	.L3
	// Calculate hangle = (hour * 30) + (minute / 2)
	lsl	w3, w1, 5
	sub	w3, w3, w1, lsl 1
	add	w4, w2, w2, lsr 31
	asr	w4, w4, 1
	add	w3, w3, w4
	// Calculate mangle = minute * 6
	add	w4, w2, w2, lsl 1
	lsl	w4, w4, 1
	// Calculate difangle = abs(hangle - mangle)
	sub	w5, w3, w4
	cmp	w5, 0
	neg	w6, w5
	csel	w5, w6, w5, lt
	// Check angle ranges
	cmp	w5, 180
	ble	.L5
	cmp	w2, 30
	ble	.L6
	cmp	w1, 5
	bgt	.L6
	rsb	w5, w3, 360
	add	w5, w5, w4
	b	.L5
.L6:
	rsb	w5, w4, 360
	add	w5, w5, w3
.L5:
	cmp	w5, 30
	blt	.L7
	cmp	w5, 90
	blt	.L8
	cmp	w5, 180
	ble	.L9
.L8:
	mov	x0, x21
	bl	puts
	b	.L3
.L7:
	mov	x0, x22
	bl	puts
	b	.L3
.L9:
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	puts
.L3:
	add	w0, w0, 1
	cmp	w19, w0
	bgt	.L15
.L2:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits