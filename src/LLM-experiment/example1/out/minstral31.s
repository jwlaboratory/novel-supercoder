// Optimized AArch64 assembly for BST operations (insert, inorder, preorder)
	.arch armv8-a
	.text
	.align 4

// Global variables
	.global root
	.bss
	.align 3
root:
	.skip 8

// Optimized insert function
	.global insert
	.type insert, %function
insert:
	// x0 = key, root is in .bss
	stp x29, x30, [sp, -48]!   // Save frame pointer and link register
	mov x29, sp
	str x19, [sp, 16]           // Save callee-saved registers
	str x20, [sp, 24]

	// Allocate node (32 bytes: 3 pointers + 1 int)
	mov x0, #32
	bl malloc
	str xzr, [x0]               // Clear left pointer
	str xzr, [x0, #8]           // Clear right pointer
	str w0, [x0, #24]           // Store key (w0 is already key)

	// Load root (global)
	adrp x19, root
	ldr x20, [x19, #:lo12:root]  // x20 = root

	// Traverse tree to find insertion point
	cbz x20, .L_insert_root      // If tree is empty, insert as root
.L_insert_loop:
	// Compare key with current node's key
	ldr w1, [x20, #24]          // w1 = current node's key
	cmp w0, w1                  // Compare new key with current key
	b.lt .L_insert_left         // If new key < current key, go left
	b.ge .L_insert_right        // Else, go right

.L_insert_left:
	// Move to left child
	ldr x21, [x20, #8]          // x21 = left child
	cbz x21, .L_insert_left_done // If no left child, insert here
	mov x20, x21                // Else, continue search
	b .L_insert_loop

.L_insert_right:
	// Move to right child
	ldr x21, [x20]              // x21 = right child
	cbz x21, .L_insert_right_done // If no right child, insert here
	mov x20, x21                // Else, continue search
	b .L_insert_loop

.L_insert_left_done:
	// Insert as left child
	str x20, [x0, #16]          // Set parent of new node
	str x0, [x20, #8]           // Set left child of parent
	b .L_insert_done

.L_insert_right_done:
	// Insert as right child
	str x20, [x0, #16]          // Set parent of new node
	str x0, [x20]               // Set right child of parent
	b .L_insert_done

.L_insert_root:
	// Insert as root
	str xzr, [x0, #16]          // No parent
	str x0, [x19, #:lo12:root]  // Update root
.L_insert_done:
	// Restore registers and return
	ldr x19, [sp, 16]
	ldr x20, [sp, 24]
	ldp x29, x30, [sp], 48
	ret

// Optimized inorder traversal (iterative to avoid stack overflow)
	.global inorder
	.type inorder, %function
inorder:
	stp x29, x30, [sp, -64]!    // Save frame pointer and link register
	mov x29, sp
	str x19, [sp, 16]           // Save callee-saved registers
	str x20, [sp, 24]
	str x21, [sp, 32]
	str x22, [sp, 40]

	// x0 = root
	mov x19, x0                 // x19 = current node
	adrp x20, .LC0              // Load printf format string
	add x20, x20, :lo12:.LC0

.L_inorder_loop:
	cbz x19, .L_inorder_done    // If no node, we're done

	// Traverse left subtree
.L_inorder_left:
	ldr x21, [x19, #8]          // x21 = left child
	cbz x21, .L_inorder_print   // If no left child, print current
	mov x19, x21                // Else, move to left child
	b .L_inorder_left

.L_inorder_print:
	// Print current node's key
	ldr w1, [x19, #24]          // w1 = key
	mov x0, x20                 // x0 = format string
	bl printf

	// Move to right subtree
.L_inorder_right:
	ldr x21, [x19]              // x21 = right child
	cbz x21, .L_inorder_done    // If no right child, we're done
	mov x19, x21                // Else, move to right child
	b .L_inorder_right

.L_inorder_done:
	// Restore registers and return
	ldr x19, [sp, 16]
	ldr x20, [sp, 24]
	ldr x21, [sp, 32]
	ldr x22, [sp, 40]
	ldp x29, x30, [sp], 64
	ret

// Optimized preorder traversal (iterative)
	.global preorder
	.type preorder, %function
preorder:
	stp x29, x30, [sp, -64]!    // Save frame pointer and link register
	mov x29, sp
	str x19, [sp, 16]           // Save callee-saved registers
	str x20, [sp, 24]
	str x21, [sp, 32]
	str x22, [sp, 40]

	// x0 = root
	mov x19, x0                 // x19 = current node
	adrp x20, .LC0              // Load printf format string
	add x20, x20, :lo12:.LC0

.L_preorder_loop:
	cbz x19, .L_preorder_done   // If no node, we're done

	// Print current node's key
	ldr w1, [x19, #24]          // w1 = key
	mov x0, x20                 // x0 = format string
	bl printf

	// Traverse left subtree
.L_preorder_left:
	ldr x21, [x19, #8]          // x21 = left child
	cbz x21, .L_preorder_right  // If no left child, go right
	mov x19, x21                // Else, move to left child
	b .L_preorder_left

.L_preorder_right:
	// Traverse right subtree
	ldr x21, [x19]              // x21 = right child
	cbz x21, .L_preorder_done   // If no right child, we're done
	mov x19, x21                // Else, move to right child
	b .L_preorder_right

.L_preorder_done:
	// Restore registers and return
	ldr x19, [sp, 16]
	ldr x20, [sp, 24]
	ldr x21, [sp, 32]
	ldr x22, [sp, 40]
	ldp x29, x30, [sp], 64
	ret

// Data section
	.section .rodata
.LC0:
	.string " %d"