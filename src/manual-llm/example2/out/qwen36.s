	.arch armv8-a
	.file	"inputC.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%d"
.LC1:
	.string	"%d:%d"
.LC2:
	.string	"alert"
.LC3:
	.string	"safe"
.LC4:
	.string	"warning"
	
	.text
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -128]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]

	// Pre-load string and format pointers to avoid repeated address calculation
	adrp	x24, .LC0
	add	x24, x24, :lo12:.LC0
	adrp	x25, .LC1
	add	x25, x25, :lo12:.LC1
	adrp	x26, .LC2
	add	x26, x26, :lo12:.LC2
	adrp	x27, .LC3
	add	x27, x27, :lo12:.LC3
	adrp	x28, .LC4
	add	x28, x28, :lo12:.LC4

	mov	x0, x24
	add	x1, sp, 96
	bl	__isoc99_scanf
	ldr	w20, [sp, 96]
	cmp	w20, 0
	ble	.L_exit
	cmp	w20, 10000
	bhi	.L_exit

	mov	w19, wzr
.L_loop:
	mov	x0, x25
	add	x1, sp, 100
	add	x2, sp, 104
	bl	__isoc99_scanf

	ldr	w21, [sp, 100]
	cmp	w21, 11
	bhi	.L_continue
	ldr	w22, [sp, 104]
	cmp	w22, 59
	bhi	.L_continue

	// Optimized integer math: angle_in_half_deg = |60*hour - 11*minute|
	// 60*h = (h << 6) - (h << 2)
	lsl	w23, w21, 6
	sub	w23, w23, w21, lsl 2
	// 11*m = (m << 3) + (m << 1) + m
	add	w24, w22, w22, lsl 1
	add	w24, w24, w22, lsl 3
	sub	w23, w23, w24

	// Absolute value
	cmp	w23, wzr
	bge	.L_pos
	neg	w23, w23
.L_pos:
	// Clamp reflex angle: if > 360 (180 deg), map to 720 - v
	cmp	w23, 360
	ble	.L_check
	mov	w0, 720
	sub	w23, w0, w23
.L_check:
	// Branch to appropriate message
	cmp	w23, 60
	bmi	.L_alert
	cmp	w23, 180
	bge	.L_safe
	mov	x0, x28
	b	.L_print
.L_alert:
	mov	x0, x26
	b	.L_print
.L_safe:
	mov	x0, x27
.L_print:
	bl	puts
.L_continue:
	add	w19, w19, 1
	cmp	w19, w20
	blt	.L_loop
.L_exit:
	mov	w0, wzr
	ldp	x27, x28, [sp, 80]
	ldp	x25, x26, [sp, 64]
	ldp	x23, x24, [sp, 48]
	ldp	x21, x22, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 128
	ret
	.size	main, .-main