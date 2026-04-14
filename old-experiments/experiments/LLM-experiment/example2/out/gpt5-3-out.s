	.arch armv8-a
	.text
	.section .rodata
.LC0:	.string "%d"
.LC1:	.string "%d:%d"
.LC2:	.string "alert"
.LC3:	.string "safe"
.LC4:	.string "warning"

	.text
	.global main
	.type main, %function

main:
	stp	x29, x30, [sp, -64]!
	mov	x29, sp

	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	add	x1, sp, 60
	bl	scanf

	ldr	w20, [sp, 60]
	subs	w20, w20, #1
	b.mi	done
	cmp	w20, 9999
	b.hi	done

	mov	w19, 0
	adrp	x21, .LC1
	add	x21, x21, :lo12:.LC1

loop:
	add	x1, sp, 56
	add	x2, sp, 52
	mov	x0, x21
	bl	scanf

	ldr	w0, [sp, 56]   // hour
	ldr	w1, [sp, 52]   // minute

	cmp	w0, 11
	b.hi	next
	cmp	w1, 59
	b.hi	next

	// raw2 = abs(60*h - 11*m)
	mov	w2, 60
	mul	w2, w0, w2     // 60*h
	mov	w3, 11
	mul	w3, w1, w3     // 11*m
	sub	w2, w2, w3
	cmp	w2, 0
	cneg	w2, w2, lt     // abs

	// minimal2 = (raw2 <= 360) ? raw2 : 720 - raw2
	cmp	w2, 360
	b.le	check
	mov	w3, 720
	sub	w2, w3, w2

check:
	// if minimal2 < 60 -> alert
	cmp	w2, 60
	b.lt	alert

	// if 180 <= minimal2 <= 360 -> safe
	cmp	w2, 180
	b.lt	warn
	cmp	w2, 360
	b.le	safe

warn:
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	puts
	b	next

alert:
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	puts
	b	next

safe:
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	puts

next:
	add	w19, w19, 1
	cmp	w19, w20
	ble	loop

done:
	mov	w0, 0
	ldp	x29, x30, [sp], 64
	ret
