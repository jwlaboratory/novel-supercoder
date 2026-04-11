	.arch armv8-a
	.text
	.align	2
	.global	insert
	.type	insert, %function
insert:
	stp	x29, x30, [sp, -32]!
	mov	x29, sp

	mov	w2, w0              // key
	mov	x0, 32
	bl	malloc

	// z in x0
	mov	x1, x0              // z
	str	xzr, [x1]           // right = NULL
	str	xzr, [x1, 8]        // left = NULL
	str	w2, [x1, 24]

	adrp	x3, root
	add	x3, x3, :lo12:root
	ldr	x4, [x3]            // x = root
	mov	x5, xzr             // y = NULL

	cbz	x4, .Linsert_root

.Lloop:
	mov	x5, x4
	ldr	w6, [x4, 24]
	cmp	w2, w6
	blt	.Lgo_left
	ldr	x4, [x4]            // right
	cbnz	x4, .Lloop
	b	.Lattach_right

.Lgo_left:
	ldr	x4, [x4, 8]         // left
	cbnz	x4, .Lloop

.Lattach_left:
	str	x5, [x1, 16]
	str	x1, [x5, 8]
	b	.Ldone

.Lattach_right:
	str	x5, [x1, 16]
	str	x1, [x5]
	b	.Ldone

.Linsert_root:
	str	xzr, [x1, 16]
	str	x1, [x3]

.Ldone:
	ldp	x29, x30, [sp], 32
	ret


	.global	inorder
	.type	inorder, %function
inorder:
	cbz	x0, .Lin_ret

	stp	x29, x30, [sp, -16]!
	mov	x29, sp

	ldr	x1, [x0, 8]
	cbz	x1, .Lskip_left
	mov	x0, x1
	bl	inorder
.Lskip_left:

	adrp	x2, .LC0
	add	x2, x2, :lo12:.LC0
	ldr	w1, [x0, 24]
	mov	x0, x2
	bl	printf

	ldr	x1, [x0, 0]
	cbz	x1, .Lin_done
	mov	x0, x1
	bl	inorder

.Lin_done:
	ldp	x29, x30, [sp], 16
.Lin_ret:
	ret


	.global	preorder
	.type	preorder, %function
preorder:
	cbz	x0, .Lpre_ret

	stp	x29, x30, [sp, -16]!
	mov	x29, sp

	adrp	x2, .LC0
	add	x2, x2, :lo12:.LC0
	ldr	w1, [x0, 24]
	mov	x0, x2
	bl	printf

	ldr	x1, [x0, 8]
	cbz	x1, .Lskip_l
	mov	x0, x1
	bl	preorder
.Lskip_l:

	ldr	x1, [x0, 0]
	cbz	x1, .Lpre_done
	mov	x0, x1
	bl	preorder

.Lpre_done:
	ldp	x29, x30, [sp], 16
.Lpre_ret:
	ret


	.section	.rodata
.LC0:
	.string " %d"

	.bss
	.align 3
	.global root
root:
	.zero 8