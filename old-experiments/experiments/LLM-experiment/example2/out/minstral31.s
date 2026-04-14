	.arch armv8-a
	.text
	.align 5
	.global main
	.type main, %function

main:
	stp	x29, x30, [sp, -128]!	// Allocate stack space
	mov	x29, sp

	// Load constants for scanf formats
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	adrp	x2, .LC2
	add	x2, x2, :lo12:.LC2
	adrp	x3, .LC3
	add	x3, x3, :lo12:.LC3
	adrp	x4, .LC4
	add	x4, x4, :lo12:.LC4

	// Read num and validate range
	stp	x2, x3, [sp, 112]
	stp	x4, xzr, [sp, 120]
	bl	__isoc99_scanf
	ldr	w5, [sp, 112]
	cmp	w5, 1
	blt	.Lexit
	cmp	w5, 10000
	bhi	.Lexit

	// Precompute constants for angle calculations
	movk	x6, 0x4066, lsl 48	// 30.0 (hangle multiplier)
	fmov	d16, x6
	movk	x6, 0x4049, lsl 48	// 6.0 (mangle multiplier)
	fmov	d17, x6
	fmov	d18, 360.0		// 360.0 (for angle wrapping)
	fmov	d19, 180.0		// 180.0 (threshold)
	fmov	d20, 90.0		// 90.0 (safe threshold)
	fmov	d21, 30.0		// 30.0 (alert threshold)
	fmov	d22, 0.0		// 0.0 (for comparisons)

	// Initialize loop counter
	mov	w7, 0			// i = 0

.Lloop:
	// Read hour and minute
	stp	x7, xzr, [sp, 96]
	stp	xzr, xzr, [sp, 104]
	mov	x0, x1
	bl	__isoc99_scanf
	ldr	w8, [sp, 96]		// hour
	ldr	w9, [sp, 104]		// minute

	// Validate hour and minute ranges
	cmp	w8, 0
	blt	.Lnext_iter
	cmp	w8, 11
	bhi	.Lnext_iter
	cmp	w9, 0
	blt	.Lnext_iter
	cmp	w9, 59
	bhi	.Lnext_iter

	// Calculate hangle = (hour * 30) + (minute / 2)
	scvtf	d0, w8
	fmul	d0, d0, d16		// hour * 30
	scvtf	d1, w9
	fmul	d1, d1, d23		// minute * 0.5 (precompute 0.5)
	fadd	d16, d0, d1		// hangle

	// Calculate mangle = minute * 6
	scvtf	d0, w9
	fmul	d17, d0, d17		// mangle

	// Compute difangle = abs(hangle - mangle)
	fsub	d0, d16, d17
	fabs	d0, d0
	fmov	d24, d0			// difangle

	// Check if difangle > 180 (angle wrapping needed)
	fcmp	d0, d19
	bhi	.Langle_wrap

	// Check alert condition (0 <= difangle < 30)
	fcmp	d0, d22
	blt	.Lnext_iter
	fcmp	d0, d21
	bhi	.Lcheck_safe
	// Print "alert"
	mov	x0, x2
	bl	puts
	b	.Lnext_iter

.Lcheck_safe:
	// Check safe condition (90 <= difangle <= 180)
	fcmp	d0, d20
	blt	.Lprint_warning
	fcmp	d0, d19
	bhi	.Lprint_warning
	// Print "safe"
	mov	x0, x3
	bl	puts
	b	.Lnext_iter

.Lprint_warning:
	// Print "warning"
	mov	x0, x4
	bl	puts
	b	.Lnext_iter

.Langle_wrap:
	// Handle angle wrapping (difangle > 180)
	cmp	w8, 5			// hour < 6?
	bhi	.Lwrap_case2
	cmp	w9, 30			// minute > 30?
	bhi	.Lwrap_case1
	b	.Lwrap_case2

.Lwrap_case1:
	// difangle = hangle + 360 - mangle
	fadd	d0, d16, d18
	fsub	d24, d0, d17
	b	.Lcheck_conditions

.Lwrap_case2:
	// difangle = mangle + 360 - hangle
	fadd	d0, d17, d18
	fsub	d24, d0, d16

.Lcheck_conditions:
	// Re-check conditions with wrapped angle
	fmov	d0, d24
	fcmp	d0, d21
	bhi	.Lcheck_safe_wrapped
	// Print "alert"
	mov	x0, x2
	bl	puts
	b	.Lnext_iter

.Lcheck_safe_wrapped:
	fcmp	d0, d20
	blt	.Lprint_warning
	fcmp	d0, d19
	bhi	.Lprint_warning
	// Print "safe"
	mov	x0, x3
	bl	puts
	b	.Lnext_iter

.Lnext_iter:
	add	w7, w7, 1		// i++
	cmp	w7, w5
	blt	.Lloop

.Lexit:
	mov	w0, 0
	ldp	x29, x30, [sp], 128
	ret

	// Constants for scanf formats (merged for efficiency)
	.section .rodata
.LC0:	.string	"%d"
.LC1:	.string	"%d:%d"
.LC2:	.string	"alert"
.LC3:	.string	"safe"
.LC4:	.string	"warning"