	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 26, 0	sdk_version 26, 2
	.globl	_cmp                            ; -- Begin function cmp
	.p2align	2
_cmp:                                   ; @cmp
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	ldr	w8, [x8]
	ldr	x9, [sp]
	ldr	w9, [x9]
	subs	w0, w8, w9
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_twoSum                         ; -- Begin function twoSum
	.p2align	2
_twoSum:                                ; @twoSum
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	stur	w1, [x29, #-20]
	stur	w2, [x29, #-24]
	ldur	w8, [x29, #-20]
	add	w9, w8, #1
                                        ; implicit-def: $x8
	mov	x8, x9
	sxtw	x8, w8
	lsl	x0, x8, #3
	bl	_malloc
	str	x0, [sp, #8]
	str	wzr, [sp, #28]
	b	LBB1_1
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #28]
	ldur	w9, [x29, #-20]
	subs	w8, w8, w9
	b.ge	LBB1_4
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldur	x8, [x29, #-16]
	ldrsw	x9, [sp, #28]
	ldr	w8, [x8, x9, lsl #2]
	ldr	x9, [sp, #8]
	ldrsw	x10, [sp, #28]
	lsl	x10, x10, #3
	str	w8, [x9, x10]
	ldr	w8, [sp, #28]
	ldr	x9, [sp, #8]
	ldrsw	x10, [sp, #28]
	add	x9, x9, x10, lsl #3
	str	w8, [x9, #4]
	b	LBB1_3
LBB1_3:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #28]
	add	w8, w8, #1
	str	w8, [sp, #28]
	b	LBB1_1
LBB1_4:
	ldr	x0, [sp, #8]
	ldursw	x1, [x29, #-20]
	mov	x2, #8                          ; =0x8
	adrp	x3, _cmp@PAGE
	add	x3, x3, _cmp@PAGEOFF
	bl	_qsort
	str	wzr, [sp, #28]
	ldur	w8, [x29, #-20]
	subs	w8, w8, #1
	str	w8, [sp, #24]
	b	LBB1_5
LBB1_5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #28]
	ldr	w9, [sp, #24]
	subs	w8, w8, w9
	b.ge	LBB1_13
	b	LBB1_6
LBB1_6:                                 ;   in Loop: Header=BB1_5 Depth=1
	ldr	x8, [sp, #8]
	ldrsw	x9, [sp, #28]
	lsl	x9, x9, #3
	ldr	w8, [x8, x9]
	ldr	x9, [sp, #8]
	ldrsw	x10, [sp, #24]
	lsl	x10, x10, #3
	ldr	w9, [x9, x10]
	add	w8, w8, w9
	str	w8, [sp, #20]
	ldr	w8, [sp, #20]
	ldur	w9, [x29, #-24]
	subs	w8, w8, w9
	b.ne	LBB1_8
	b	LBB1_7
LBB1_7:
	mov	x0, #8                          ; =0x8
	bl	_malloc
	str	x0, [sp, #32]
	ldr	x8, [sp, #8]
	ldrsw	x9, [sp, #28]
	add	x8, x8, x9, lsl #3
	ldr	w8, [x8, #4]
	ldr	x9, [sp, #32]
	str	w8, [x9]
	ldr	x8, [sp, #8]
	ldrsw	x9, [sp, #24]
	add	x8, x8, x9, lsl #3
	ldr	w8, [x8, #4]
	ldr	x9, [sp, #32]
	str	w8, [x9, #4]
	ldr	x0, [sp, #8]
	bl	_free
	ldr	x8, [sp, #32]
	stur	x8, [x29, #-8]
	b	LBB1_14
LBB1_8:                                 ;   in Loop: Header=BB1_5 Depth=1
	ldr	w8, [sp, #20]
	ldur	w9, [x29, #-24]
	subs	w8, w8, w9
	b.ge	LBB1_10
	b	LBB1_9
LBB1_9:                                 ;   in Loop: Header=BB1_5 Depth=1
	ldr	w8, [sp, #28]
	add	w8, w8, #1
	str	w8, [sp, #28]
	b	LBB1_11
LBB1_10:                                ;   in Loop: Header=BB1_5 Depth=1
	ldr	w8, [sp, #24]
	subs	w8, w8, #1
	str	w8, [sp, #24]
	b	LBB1_11
LBB1_11:                                ;   in Loop: Header=BB1_5 Depth=1
	b	LBB1_12
LBB1_12:                                ;   in Loop: Header=BB1_5 Depth=1
	b	LBB1_5
LBB1_13:
	ldr	x0, [sp, #8]
	bl	_free
                                        ; kill: def $x8 killed $xzr
	stur	xzr, [x29, #-8]
	b	LBB1_14
LBB1_14:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
