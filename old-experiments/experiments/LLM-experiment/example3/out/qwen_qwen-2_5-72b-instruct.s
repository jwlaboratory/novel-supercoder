.arch armv8-a
	.file	"inputC.c"
	.text
	.align	2
	.p2align 4,,11
	.global	in
	.type	in, %function
in:
.LFB3:
	.cfi_startproc
	mov	w0, 0
.L2:
	bl	getchar_unlocked
	and	w1, w0, 15
	add	w0, w0, w0, lsl 3
	add	w0, w0, w1, lsl 1
	cmp	w0, 47
	bge	.L2
	ret
	.cfi_endproc
.LFE3:
	.size	in, .-in
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%d"
	.align	3
.LC1:
	.string	" %d"
	.text
	.align	2
	.p2align 4,,11
	.global	dump
	.type	dump, %function
dump:
.LFB4:
	.cfi_startproc
	mov	x19, x0
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	cmp	w19, 1
	ble	.L7
	adrp	x20, .LC1
	add	x20, x20, :lo12:.LC1
	ldr	x1, [x19, 4]
.L8:
	mov	x0, x20
	bl	printf
	add	x1, x1, 4
	cmp	x1, x19, lsl 2
	bne	.L8
.L7:
	adrp	x0, stdout
	ldr	x0, [x0, #:lo12:stdout]
	mov	w1, 10
	bl	putc
	ret
	.cfi_endproc
.LFE4:
	.size	dump, .-dump
	.align	2
	.p2align 4,,11
	.global	insertion_sort
	.type	insertion_sort, %function
insertion_sort:
.LFB5:
	.cfi_startproc
	mov	x19, x0
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	cmp	w19, 1
	ble	.L12
	adrp	x20, .LC1
	add	x20, x20, :lo12:.LC1
	ldr	x1, [x19, 4]
.L13:
	mov	x0, x20
	bl	printf
	add	x1, x1, 4
	cmp	x1, x19, lsl 2
	bne	.L13
	adrp	x0, stdout
	ldr	x0, [x0, #:lo12:stdout]
	mov	w1, 10
	bl	putc
	mov	w20, 1
.L19:
	ldr	w21, [x19, w20, sxtw 2]
	mov	w22, w20
	sub	w20, w20, 1
.L15:
	ldr	w0, [x19, w20, sxtw 2]
	cmp	w0, w21
	bgt	.L17
.L16:
	str	w21, [x19, w22, sxtw 2]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	ldr	x1, [x19, 4]
.L18:
	mov	x0, x20
	bl	printf
	add	x1, x1, 4
	cmp	x1, x19, lsl 2
	bne	.L18
	adrp	x0, stdout
	ldr	x0, [x0, #:lo12:stdout]
	mov	w1, 10
	bl	putc
	add	w20, w20, 1
	b	.L19
.L17:
	str	w0, [x19, w22, sxtw 2]
	sub	w20, w20, 1
	b	.L15
.L12:
	ret
	.cfi_endproc
.LFE5:
	.size	insertion_sort, .-insertion_sort
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB6:
	.cfi_startproc
	bl	in
	mov	w19, w0
	cmp	w0, 0
	ble	.L27
	adrp	x20, .LANCHOR0
	add	x20, x20, :lo12:.LANCHOR0
	add	x21, x20, w0, sxtw 2
.L29:
	mov	w22, 0
	bl	getchar_unlocked
.L28:
	and	w0, w0, 15
	add	w22, w22, w22, lsl 3
	add	w22, w22, w0, lsl 1
	bl	getchar_unlocked
	cmp	w0, 47
	bge	.L28
	str	w22, [x20], 4
	cmp	x20, x21
	bne	.L29
.L27:
	mov	w0, w19
	bl	insertion_sort
	mov	w0, 0
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.global	a
	.bss
	.align	4
	.set	.LANCHOR0,. + 0
	.type	a, %object
	.size	a, 408
a:
	.zero	408
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
