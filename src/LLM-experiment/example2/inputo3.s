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
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	mov	x29, sp
	add	x1, sp, 76
	stp	wzr, wzr, [sp, 68]
	bl	__isoc99_scanf
	ldr	w0, [sp, 76]
	mov	w1, 9999
	sub	w0, w0, #1
	cmp	w0, w1
	bhi	.L2
	mov	x0, 140737488355328
	stp	x19, x20, [sp, 16]
	.cfi_offset 20, -56
	.cfi_offset 19, -64
	adrp	x20, .LC1
	add	x20, x20, :lo12:.LC1
	str	x21, [sp, 32]
	.cfi_offset 21, -48
	adrp	x21, .LC4
	add	x21, x21, :lo12:.LC4
	movk	x0, 0x4066, lsl 48
	mov	w19, 0
	str	d10, [sp, 40]
	.cfi_offset 74, -40
	fmov	d10, 3.0e+1
	stp	d8, d9, [sp, 48]
	.cfi_offset 73, -24
	.cfi_offset 72, -32
	fmov	d8, x0
	fmov	d9, 5.0e-1
	.p2align 3,,7
.L19:
	add	x2, sp, 72
	add	x1, sp, 68
	mov	x0, x20
	bl	__isoc99_scanf
	ldr	w0, [sp, 68]
	cmp	w0, 11
	bhi	.L3
	ldr	w2, [sp, 72]
	cmp	w2, 59
	bhi	.L3
	lsl	w1, w0, 4
	scvtf	d2, w2
	sub	w1, w1, w0
	add	w3, w2, w2, lsl 1
	lsl	w1, w1, 1
	lsl	w3, w3, 1
	fmul	d2, d2, d9
	scvtf	d1, w1
	scvtf	d0, w3
	fadd	d1, d1, d2
	fsub	d2, d1, d0
	fcmpe	d2, #0.0
	bmi	.L20
	fcmpe	d2, d8
	bgt	.L6
	fcmpe	d2, #0.0
	bge	.L21
	.p2align 3,,7
.L8:
	mov	x0, x21
	bl	puts
	.p2align 3,,7
.L3:
	ldr	w0, [sp, 76]
	add	w19, w19, 1
	cmp	w0, w19
	bgt	.L19
	ldp	x19, x20, [sp, 16]
	.cfi_restore 20
	.cfi_restore 19
	ldr	x21, [sp, 32]
	.cfi_restore 21
	ldp	d8, d9, [sp, 48]
	.cfi_restore 73
	.cfi_restore 72
	ldr	d10, [sp, 40]
	.cfi_restore 74
.L2:
	mov	w0, 0
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
.L6:
	.cfi_def_cfa_offset 80
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	.cfi_offset 21, -48
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	.cfi_offset 72, -32
	.cfi_offset 73, -24
	.cfi_offset 74, -40
	cmp	w2, 30
	ccmp	w0, 5, 0, gt
	mov	x0, 140737488355328
	movk	x0, 0x4076, lsl 48
	fmov	d2, x0
	ble	.L28
	fadd	d0, d0, d2
	fsub	d0, d0, d1
.L13:
	fcmpe	d0, #0.0
	bge	.L7
	b	.L8
.L20:
	mov	x1, 140737488355328
	movk	x1, 0xc066, lsl 48
	fmov	d3, x1
	fcmpe	d2, d3
	bmi	.L6
	fneg	d0, d2
.L7:
	fcmpe	d0, d10
	bmi	.L10
	mov	x0, 140737488355328
	movk	x0, 0x4056, lsl 48
	fmov	d1, x0
	fcmpe	d0, d1
	bge	.L22
	b	.L8
.L10:
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	puts
	b	.L3
.L21:
	fmov	d0, 3.0e+1
	fcmpe	d2, d0
	bmi	.L10
	mov	x0, 140737488355328
	movk	x0, 0x4056, lsl 48
	fmov	d0, x0
	fcmpe	d2, d0
	bge	.L11
	b	.L8
.L22:
	mov	x0, 140737488355328
	movk	x0, 0x4066, lsl 48
	fmov	d1, x0
	fcmpe	d0, d1
	bls	.L11
	b	.L8
.L28:
	fadd	d1, d1, d2
	fsub	d0, d1, d0
	b	.L13
.L11:
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	puts
	b	.L3
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
	