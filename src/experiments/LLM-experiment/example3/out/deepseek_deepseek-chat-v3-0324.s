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
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp
	mov	w1, 0
	bl	getchar_unlocked
	.p2align 3,,7
.L2:
	and	w0, w0, 15
	add	w1, w1, w1, lsl 2
	add	w1, w0, w1, lsl 1
	bl	getchar_unlocked
	cmp	w0, 47
	bgt	.L2
	mov	w0, w1
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
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
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	adrp	x19, a
	mov	w20, w0
	add	x19, x19, :lo12:a
	ldr	w1, [x19]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	cmp	w20, 1
	ble	.L7
	sub	w20, w20, #2
	add	x0, x19, 4
	adrp	x1, .LC1
	add	x20, x0, w20, uxtw 2
	add	x1, x1, :lo12:.LC1
	.p2align 3,,7
.L8:
	ldr	w2, [x19, 4]!
	mov	x0, x1
	bl	printf
	cmp	x19, x20
	bne	.L8
.L7:
	adrp	x1, stdout
	mov	w0, 10
	ldr	x1, [x1, #:lo12:stdout]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	b	putc
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
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	adrp	x19, a
	mov	w20, w0
	add	x19, x19, :lo12:a
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -16
	.cfi_offset 22, -8
	mov	x0, x19
	bl	dump
	cmp	w20, 1
	ble	.L12
	mov	w21, 1
	.p2align 3,,7
.L14:
	ldr	w3, [x19, w21, sxtw 2]
	mov	w2, w21
	mov	x1, x19
	.p2align 3,,7
.L16:
	ldr	w0, [x1]
	cmp	w0, w3
	ble	.L15
	str	w0, [x1, 4]
	subs	w2, w2, #1
	sub	x1, x1, #4
	bne	.L16
	mov	w2, 0
.L15:
	str	w3, [x19, w2, sxtw 2]
	mov	x0, x19
	bl	dump
	add	w21, w21, 1
	cmp	w20, w21
	bne	.L14
.L12:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
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
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	bl	in
	mov	w19, w0
	cmp	w0, 0
	ble	.L21
	adrp	x1, a
	mov	w2, 0
	add	x1, x1, :lo12:a
	.p2align 3,,7
.L23:
	bl	getchar_unlocked
	.p2align 3,,7
.L22:
	and	w0, w0, 15
	add	w2, w2, w2, lsl 2
	add	w2, w0, w2, lsl 1
	bl	getchar_unlocked
	cmp	w0, 47
	bgt	.L22
	str	w2, [x1], 4
	subs	w19, w19, #1
	bne	.L23
.L21:
	adrp	x0, a
	add	x0, x0, :lo12:a
	ldr	w0, [x0]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	b	insertion_sort
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.bss
	.align	4
	.type	a, %object
	.size	a, 408
a:
	.zero	408
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
