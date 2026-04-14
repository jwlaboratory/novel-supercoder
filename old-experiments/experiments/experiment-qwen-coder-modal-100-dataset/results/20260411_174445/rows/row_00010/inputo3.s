	.file	"inputC.c"
	.text
	.p2align 4
	.globl	edge_comp_cost
	.type	edge_comp_cost, @function
edge_comp_cost:
.LFB19:
	.cfi_startproc
	movl	8(%rsi), %edx
	movl	$1, %eax
	cmpl	%edx, 8(%rdi)
	jl	.L1
	setg	%al
	movzbl	%al, %eax
	negl	%eax
.L1:
	ret
	.cfi_endproc
.LFE19:
	.size	edge_comp_cost, .-edge_comp_cost
	.p2align 4
	.globl	dijkstra_comp
	.type	dijkstra_comp, @function
dijkstra_comp:
.LFB8:
	.cfi_startproc
	movl	(%rsi), %edx
	movl	$1, %eax
	cmpl	%edx, (%rdi)
	jg	.L5
	movl	$-1, %eax
	jl	.L5
	movl	4(%rsi), %ecx
	movl	$1, %eax
	cmpl	%ecx, 4(%rdi)
	jg	.L5
	setl	%al
	movzbl	%al, %eax
	negl	%eax
.L5:
	ret
	.cfi_endproc
.LFE8:
	.size	dijkstra_comp, .-dijkstra_comp
	.p2align 4
	.globl	dijkstra_queue_adjust
	.type	dijkstra_queue_adjust, @function
dijkstra_queue_adjust:
.LFB9:
	.cfi_startproc
	movl	dijkstra_queue_num(%rip), %esi
	.p2align 4,,10
	.p2align 3
.L11:
	leal	(%rdi,%rdi), %eax
	leal	1(%rax), %ecx
	addl	$2, %eax
	cmpl	%esi, %ecx
	jge	.L15
.L12:
	movslq	%ecx, %rdx
	movl	dijkstra_queue+4(,%rdx,8), %r8d
	movslq	%edi, %rdx
	cmpl	%r8d, dijkstra_queue+4(,%rdx,8)
	jle	.L15
	cmpl	%eax, %esi
	jle	.L19
	movslq	%eax, %r9
	cmpl	dijkstra_queue+4(,%r9,8), %r8d
	cmovle	%ecx, %eax
.L16:
	cmpl	%edi, %eax
	je	.L14
	movslq	%eax, %rcx
	movq	dijkstra_queue(,%rdx,8), %r8
	movq	dijkstra_queue(,%rcx,8), %rdi
	movq	%r8, dijkstra_queue(,%rcx,8)
	movq	%rdi, dijkstra_queue(,%rdx,8)
	movl	%eax, %edi
	leal	(%rdi,%rdi), %eax
	leal	1(%rax), %ecx
	addl	$2, %eax
	cmpl	%esi, %ecx
	jl	.L12
.L15:
	cmpl	%eax, %esi
	jle	.L14
	movslq	%eax, %rcx
	movslq	%edi, %rdx
	movl	dijkstra_queue+4(,%rcx,8), %ecx
	cmpl	%ecx, dijkstra_queue+4(,%rdx,8)
	jg	.L16
	.p2align 4,,10
	.p2align 3
.L14:
	testl	%edi, %edi
	jle	.L10
	subl	$1, %edi
	sarl	%edi
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L19:
	movl	%ecx, %eax
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L10:
	ret
	.cfi_endproc
.LFE9:
	.size	dijkstra_queue_adjust, .-dijkstra_queue_adjust
	.p2align 4
	.globl	dijkstra_queue_push
	.type	dijkstra_queue_push, @function
dijkstra_queue_push:
.LFB10:
	.cfi_startproc
	movl	%edi, %edx
	movl	dijkstra_queue_num(%rip), %edi
	leal	1(%rdi), %eax
	movl	%eax, dijkstra_queue_num(%rip)
	movslq	%edi, %rax
	movl	%edx, dijkstra_queue(,%rax,8)
	movl	%esi, dijkstra_queue+4(,%rax,8)
	jmp	dijkstra_queue_adjust
	.cfi_endproc
.LFE10:
	.size	dijkstra_queue_push, .-dijkstra_queue_push
	.p2align 4
	.globl	dijkstra_queue_pop
	.type	dijkstra_queue_pop, @function
dijkstra_queue_pop:
.LFB11:
	.cfi_startproc
	movl	dijkstra_queue_num(%rip), %edx
	movq	dijkstra_queue(%rip), %r10
	testl	%edx, %edx
	jle	.L22
	subl	$1, %edx
	xorl	%edi, %edi
	movl	%edx, dijkstra_queue_num(%rip)
	movslq	%edx, %rdx
	movq	dijkstra_queue(,%rdx,8), %rax
	movq	%rax, dijkstra_queue(%rip)
	call	dijkstra_queue_adjust
.L22:
	movq	%r10, %rax
	ret
	.cfi_endproc
.LFE11:
	.size	dijkstra_queue_pop, .-dijkstra_queue_pop
	.p2align 4
	.globl	dijkstra_init
	.type	dijkstra_init, @function
dijkstra_init:
.LFB12:
	.cfi_startproc
	movl	$0, dijkstra_edge_num(%rip)
	ret
	.cfi_endproc
.LFE12:
	.size	dijkstra_init, .-dijkstra_init
	.p2align 4
	.globl	dijkstra_addedge
	.type	dijkstra_addedge, @function
dijkstra_addedge:
.LFB13:
	.cfi_startproc
	movslq	dijkstra_edge_num(%rip), %rax
	movl	%edx, %ecx
	movq	%rax, %rdx
	leaq	(%rax,%rax,2), %rax
	salq	$2, %rax
	addl	$1, %edx
	movl	%edi, dijkstra_edge(%rax)
	movl	%esi, dijkstra_edge+4(%rax)
	movl	%ecx, dijkstra_edge+8(%rax)
	movl	%edx, dijkstra_edge_num(%rip)
	ret
	.cfi_endproc
.LFE13:
	.size	dijkstra_addedge, .-dijkstra_addedge
	.p2align 4
	.globl	dijkstra_setup
	.type	dijkstra_setup, @function
dijkstra_setup:
.LFB14:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$dijkstra_comp, %ecx
	movl	$12, %edx
	movslq	dijkstra_edge_num(%rip), %rsi
	movl	$dijkstra_edge, %edi
	call	qsort
	movl	$dijkstra_node_edge, %edi
	movl	$800000, %edx
	xorl	%esi, %esi
	call	memset
	movl	dijkstra_edge_num(%rip), %edi
	testl	%edi, %edi
	jle	.L26
	movslq	dijkstra_edge(%rip), %rax
	movl	$dijkstra_edge, %esi
	xorl	%edx, %edx
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L34:
	movl	%edx, dijkstra_node_edge+4(,%rax,8)
	movslq	%ecx, %rax
	addq	$12, %rsi
	movl	%edx, dijkstra_node_edge(,%rax,8)
	addl	$1, %edx
	cmpl	%edi, %edx
	je	.L29
.L28:
	movslq	%ecx, %rax
.L30:
	movl	(%rsi), %ecx
	cmpl	%eax, %ecx
	jne	.L34
	addl	$1, %edx
	addq	$12, %rsi
	cmpl	%edi, %edx
	jne	.L28
.L29:
	movl	%edi, dijkstra_node_edge+4(,%rax,8)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	.cfi_restore_state
	movslq	dijkstra_edge(%rip), %rax
	xorl	%edi, %edi
	movl	%edi, dijkstra_node_edge+4(,%rax,8)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	dijkstra_setup, .-dijkstra_setup
	.p2align 4
	.globl	dijkstra_search
	.type	dijkstra_search, @function
dijkstra_search:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$400000, %edx
	movslq	%esi, %rbp
	movl	$255, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movl	$dijkstra_cost, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	memset
	movl	$100000, %edx
	xorl	%esi, %esi
	movl	$dijkstra_visited, %edi
	call	memset
	movl	$0, dijkstra_queue_num(%rip)
	testl	%ebp, %ebp
	jle	.L48
	leaq	(%rbx,%rbp,4), %r11
	xorl	%edi, %edi
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L37:
	movl	dijkstra_queue_num(%rip), %edi
.L38:
	movl	(%rbx), %edx
	leal	1(%rdi), %eax
	addq	$4, %rbx
	movl	%eax, dijkstra_queue_num(%rip)
	movslq	%edi, %rax
	movl	%edx, dijkstra_queue(,%rax,8)
	movl	$0, dijkstra_queue+4(,%rax,8)
	call	dijkstra_queue_adjust
	cmpq	%r11, %rbx
	jne	.L37
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L47:
	subl	$1, %eax
	movslq	dijkstra_queue(%rip), %r10
	xorl	%edi, %edi
	movl	dijkstra_queue+4(%rip), %ebx
	movl	%eax, dijkstra_queue_num(%rip)
	cltq
	movq	dijkstra_queue(,%rax,8), %rax
	movq	%rax, dijkstra_queue(%rip)
	call	dijkstra_queue_adjust
	cmpb	$0, dijkstra_visited(%r10)
	je	.L40
.L45:
	movl	dijkstra_queue_num(%rip), %eax
.L41:
	testl	%eax, %eax
	jg	.L47
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	.cfi_restore_state
	movl	dijkstra_node_edge(,%r10,8), %ebp
	movl	dijkstra_node_edge+4(,%r10,8), %ecx
	movb	$1, dijkstra_visited(%r10)
	movl	%ebx, dijkstra_cost(,%r10,4)
	cmpl	%ecx, %ebp
	jge	.L45
	movslq	%ebp, %rax
	leaq	(%rax,%rax,2), %rax
	leaq	dijkstra_edge+4(,%rax,4), %r11
.L46:
	movslq	(%r11), %rdx
	cmpb	$0, dijkstra_visited(%rdx)
	movq	%rdx, %rax
	je	.L51
.L43:
	addl	$1, %ebp
	addq	$12, %r11
	cmpl	%ecx, %ebp
	jge	.L45
	movslq	(%r11), %rdx
	cmpb	$0, dijkstra_visited(%rdx)
	movq	%rdx, %rax
	jne	.L43
.L51:
	movl	4(%r11), %edx
	movd	%eax, %xmm0
	addl	$1, %ebp
	addq	$12, %r11
	movl	dijkstra_queue_num(%rip), %edi
	addl	%ebx, %edx
	movd	%edx, %xmm1
	leal	1(%rdi), %edx
	movl	%edx, dijkstra_queue_num(%rip)
	punpckldq	%xmm1, %xmm0
	movslq	%edi, %rdx
	movq	%xmm0, dijkstra_queue(,%rdx,8)
	call	dijkstra_queue_adjust
	movl	dijkstra_node_edge+4(,%r10,8), %ecx
	cmpl	%ecx, %ebp
	jl	.L46
	jmp	.L45
.L48:
	xorl	%eax, %eax
	jmp	.L41
	.cfi_endproc
.LFE15:
	.size	dijkstra_search, .-dijkstra_search
	.p2align 4
	.globl	uf_init
	.type	uf_init, @function
uf_init:
.LFB16:
	.cfi_startproc
	movl	$400000, %edx
	xorl	%esi, %esi
	movl	$uf_table, %edi
	jmp	memset
	.cfi_endproc
.LFE16:
	.size	uf_init, .-uf_init
	.p2align 4
	.globl	uf_merge
	.type	uf_merge, @function
uf_merge:
.LFB17:
	.cfi_startproc
	movslq	%edi, %rdx
	movl	uf_table(,%rdx,4), %ecx
	testl	%ecx, %ecx
	jle	.L61
	subl	$1, %ecx
	movslq	%ecx, %rax
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L67
	.p2align 4,,10
	.p2align 3
.L55:
	movl	%eax, uf_table(,%rdx,4)
	leal	-1(%rax), %edx
	movl	%ecx, %edi
	movslq	%edx, %rax
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L54
	movl	%edx, %ecx
	movslq	%edi, %rdx
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L67:
	movl	%ecx, %edx
	.p2align 4,,10
	.p2align 3
.L54:
	movslq	%esi, %rcx
	movl	uf_table(,%rcx,4), %edi
	testl	%edi, %edi
	jle	.L63
.L69:
	subl	$1, %edi
	movslq	%edi, %rax
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L68
	.p2align 4,,10
	.p2align 3
.L58:
	movl	%eax, uf_table(,%rcx,4)
	leal	-1(%rax), %ecx
	movl	%edi, %esi
	movslq	%ecx, %rax
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L57
	movl	%ecx, %edi
	movslq	%esi, %rcx
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L68:
	movl	%edi, %ecx
	.p2align 4,,10
	.p2align 3
.L57:
	cmpl	%ecx, %edx
	je	.L53
	movslq	%edx, %rdx
	addl	$1, %ecx
	movl	%ecx, uf_table(,%rdx,4)
.L53:
	ret
	.p2align 4,,10
	.p2align 3
.L61:
	movslq	%esi, %rcx
	movl	%edi, %edx
	movl	uf_table(,%rcx,4), %edi
	testl	%edi, %edi
	jg	.L69
	.p2align 4,,10
	.p2align 3
.L63:
	movl	%esi, %ecx
	jmp	.L57
	.cfi_endproc
.LFE17:
	.size	uf_merge, .-uf_merge
	.p2align 4
	.globl	uf_issame
	.type	uf_issame, @function
uf_issame:
.LFB18:
	.cfi_startproc
	movslq	%edi, %rcx
	movl	uf_table(,%rcx,4), %edx
	testl	%edx, %edx
	jle	.L77
	subl	$1, %edx
	movslq	%edx, %rax
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L83
	.p2align 4,,10
	.p2align 3
.L72:
	movl	%eax, uf_table(,%rcx,4)
	leal	-1(%rax), %ecx
	movl	%edx, %edi
	movslq	%ecx, %rax
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L71
	movl	%ecx, %edx
	movslq	%edi, %rcx
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L83:
	movl	%edx, %ecx
	.p2align 4,,10
	.p2align 3
.L71:
	movslq	%esi, %rdx
	movl	uf_table(,%rdx,4), %edi
	testl	%edi, %edi
	jle	.L79
.L85:
	subl	$1, %edi
	movslq	%edi, %rax
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L84
	.p2align 4,,10
	.p2align 3
.L75:
	movl	%eax, uf_table(,%rdx,4)
	leal	-1(%rax), %edx
	movl	%edi, %esi
	movslq	%edx, %rax
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L74
	movl	%edx, %edi
	movslq	%esi, %rdx
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L84:
	movl	%edi, %edx
.L74:
	xorl	%eax, %eax
	cmpl	%edx, %ecx
	sete	%al
	ret
	.p2align 4,,10
	.p2align 3
.L77:
	movslq	%esi, %rdx
	movl	%edi, %ecx
	movl	uf_table(,%rdx,4), %edi
	testl	%edi, %edi
	jg	.L85
.L79:
	movl	%esi, %edx
	xorl	%eax, %eax
	cmpl	%edx, %ecx
	sete	%al
	ret
	.cfi_endproc
.LFE18:
	.size	uf_issame, .-uf_issame
	.p2align 4
	.globl	make_tree
	.type	make_tree, @function
make_tree:
.LFB20:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%esi, %r14d
	movl	%edx, %esi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movslq	%edi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	movl	%edx, tree_depth(,%r12,4)
	movslq	mati_douro(,%r12,8), %rbx
	movl	%edx, 72(%rsp)
	movl	mati_douro+4(,%r12,8), %edx
	movl	%r14d, tree_parent(,%r12,4)
	cmpl	%edx, %ebx
	jge	.L86
	movq	%r12, %rcx
	leal	8(%rsi), %r11d
.L123:
	leaq	(%rbx,%rbx,2), %rax
	movl	douro_use+4(,%rax,4), %r15d
	cmpl	%r14d, %r15d
	je	.L89
	movl	72(%rsp), %esi
	movslq	%r15d, %rax
	movl	mati_douro+4(,%rax,8), %edi
	movl	%ecx, tree_parent(,%rax,4)
	addl	$1, %esi
	movl	%esi, tree_depth(,%rax,4)
	movl	mati_douro(,%rax,8), %esi
	cmpl	%edi, %esi
	jge	.L89
	movl	%r14d, 116(%rsp)
	movslq	%esi, %rbp
	movq	%r12, 120(%rsp)
	movq	%rbx, 104(%rsp)
	movl	%ecx, %ebx
	movq	%rax, 96(%rsp)
	movl	%r15d, %eax
.L122:
	leaq	0(%rbp,%rbp,2), %rdx
	movl	douro_use+4(,%rdx,4), %r12d
	cmpl	%r12d, %ebx
	je	.L92
	movl	72(%rsp), %esi
	movslq	%r12d, %r15
	movl	%eax, tree_parent(,%r15,4)
	leal	2(%rsi), %edx
	movl	mati_douro+4(,%r15,8), %esi
	movl	%edx, tree_depth(,%r15,4)
	movl	mati_douro(,%r15,8), %edx
	cmpl	%esi, %edx
	jge	.L92
	movq	%rbp, 88(%rsp)
	movslq	%edx, %r13
	movl	%ebx, 112(%rsp)
.L121:
	leaq	0(%r13,%r13,2), %rdx
	movl	douro_use+4(,%rdx,4), %ecx
	cmpl	%ecx, %eax
	je	.L95
	movl	72(%rsp), %r10d
	movslq	%ecx, %rbp
	movl	mati_douro(,%rbp,8), %edi
	movl	%r12d, tree_parent(,%rbp,4)
	leal	3(%r10), %edx
	movl	%edx, tree_depth(,%rbp,4)
	movl	mati_douro+4(,%rbp,8), %edx
	cmpl	%edx, %edi
	jge	.L95
	movl	%eax, 76(%rsp)
	movslq	%edi, %rbx
	movq	%r13, 80(%rsp)
	movq	%rbp, 64(%rsp)
	movq	%rbx, %rbp
.L120:
	leaq	0(%rbp,%rbp,2), %rsi
	movl	douro_use+4(,%rsi,4), %r8d
	cmpl	%r8d, %r12d
	je	.L98
	movslq	%r8d, %r14
	leal	4(%r10), %esi
	movl	%esi, tree_depth(,%r14,4)
	movl	mati_douro(,%r14,8), %edi
	movl	mati_douro+4(,%r14,8), %esi
	movl	%ecx, tree_parent(,%r14,4)
	cmpl	%esi, %edi
	jge	.L98
	movl	%r12d, 52(%rsp)
	movslq	%edi, %r13
	movl	%esi, %eax
	movl	%r10d, %esi
	movq	%rbp, 56(%rsp)
	movq	%r13, %rdi
	movl	%r8d, %ebp
	movq	%r14, 40(%rsp)
	movq	%r15, %r14
	movl	%ecx, %r15d
.L119:
	leaq	(%rdi,%rdi,2), %rdx
	movl	douro_use+4(,%rdx,4), %ecx
	cmpl	%ecx, %r15d
	je	.L101
	movslq	%ecx, %rbx
	leal	5(%rsi), %edx
	movl	%edx, tree_depth(,%rbx,4)
	movslq	mati_douro(,%rbx,8), %r12
	movl	mati_douro+4(,%rbx,8), %edx
	movl	%ebp, tree_parent(,%rbx,4)
	cmpl	%edx, %r12d
	jge	.L101
	movl	%r15d, 48(%rsp)
	leal	6(%rsi), %r9d
	movq	%r14, %r13
	movq	%rdi, 32(%rsp)
	movl	%r9d, %r14d
	movq	%rbx, 24(%rsp)
	movl	%esi, 16(%rsp)
	movl	%ebp, %esi
.L118:
	leaq	(%r12,%r12,2), %rax
	movl	douro_use+4(,%rax,4), %r9d
	cmpl	%r9d, %esi
	je	.L104
	movslq	%r9d, %r8
	movslq	mati_douro(,%r8,8), %r15
	movl	mati_douro+4(,%r8,8), %eax
	movl	%ecx, tree_parent(,%r8,4)
	movl	%r14d, tree_depth(,%r8,4)
	cmpl	%eax, %r15d
	jge	.L104
	movl	16(%rsp), %ebx
	movq	%r12, 8(%rsp)
	movl	%ecx, %r10d
	movq	%r8, %rbp
	movl	%esi, 20(%rsp)
	addl	$7, %ebx
	movl	%ebx, 4(%rsp)
.L117:
	leaq	(%r15,%r15,2), %rdx
	movl	douro_use+4(,%rdx,4), %r8d
	cmpl	%r8d, %r10d
	je	.L107
	movslq	%r8d, %rcx
	movl	4(%rsp), %ebx
	movslq	mati_douro(,%rcx,8), %r12
	movl	mati_douro+4(,%rcx,8), %edx
	movl	%r9d, tree_parent(,%rcx,4)
	movl	%ebx, tree_depth(,%rcx,4)
	cmpl	%edx, %r12d
	jge	.L107
	movl	%r10d, (%rsp)
	movl	%edx, %edi
	movq	%rcx, %r10
.L116:
	leaq	(%r12,%r12,2), %rax
	movl	douro_use+4(,%rax,4), %esi
	cmpl	%esi, %r9d
	je	.L110
	movslq	%esi, %rbx
	movslq	mati_douro(,%rbx,8), %rax
	movl	mati_douro+4(,%rbx,8), %ecx
	movl	%r8d, tree_parent(,%rbx,4)
	movl	%r11d, tree_depth(,%rbx,4)
	cmpl	%ecx, %eax
	jge	.L110
.L115:
	leaq	(%rax,%rax,2), %rdx
	movl	douro_use+4(,%rdx,4), %edi
	cmpl	%edi, %r8d
	je	.L112
	movq	%rax, 136(%rsp)
	movl	16(%rsp), %eax
	movl	%r11d, 156(%rsp)
	leal	9(%rax), %edx
	movq	%r10, 144(%rsp)
	movl	%r8d, 152(%rsp)
	movl	%r9d, 132(%rsp)
	movl	%esi, 128(%rsp)
	call	make_tree
	movq	136(%rsp), %rax
	movl	mati_douro+4(,%rbx,8), %ecx
	movl	128(%rsp), %esi
	movl	132(%rsp), %r9d
	addq	$1, %rax
	movl	152(%rsp), %r8d
	movq	144(%rsp), %r10
	cmpl	%eax, %ecx
	movl	156(%rsp), %r11d
	jg	.L115
	.p2align 4,,10
	.p2align 3
.L114:
	movl	mati_douro+4(,%r10,8), %edi
.L110:
	addq	$1, %r12
	cmpl	%r12d, %edi
	jg	.L116
	movl	(%rsp), %r10d
	movl	mati_douro+4(,%rbp,8), %eax
.L107:
	addq	$1, %r15
	cmpl	%r15d, %eax
	jg	.L117
	movq	24(%rsp), %rax
	movq	8(%rsp), %r12
	movl	%r10d, %ecx
	movl	20(%rsp), %esi
	movl	mati_douro+4(,%rax,8), %edx
.L104:
	addq	$1, %r12
	cmpl	%r12d, %edx
	jg	.L118
	movq	40(%rsp), %rax
	movl	%esi, %ebp
	movl	48(%rsp), %r15d
	movq	%r13, %r14
	movq	32(%rsp), %rdi
	movl	16(%rsp), %esi
	movl	mati_douro+4(,%rax,8), %eax
.L101:
	addq	$1, %rdi
	cmpl	%edi, %eax
	jg	.L119
	movq	64(%rsp), %rax
	movl	52(%rsp), %r12d
	movl	%r15d, %ecx
	movl	%esi, %r10d
	movq	56(%rsp), %rbp
	movq	%r14, %r15
	movl	mati_douro+4(,%rax,8), %edx
.L98:
	addq	$1, %rbp
	cmpl	%ebp, %edx
	jg	.L120
	movl	76(%rsp), %eax
	movq	80(%rsp), %r13
	movl	mati_douro+4(,%r15,8), %esi
.L95:
	addq	$1, %r13
	cmpl	%r13d, %esi
	jg	.L121
	movq	96(%rsp), %rsi
	movq	88(%rsp), %rbp
	movl	112(%rsp), %ebx
	movl	mati_douro+4(,%rsi,8), %edi
.L92:
	addq	$1, %rbp
	cmpl	%ebp, %edi
	jg	.L122
	movq	120(%rsp), %r12
	movl	%ebx, %ecx
	movl	116(%rsp), %r14d
	movq	104(%rsp), %rbx
	movl	mati_douro+4(,%r12,8), %edx
.L89:
	addq	$1, %rbx
	cmpl	%ebx, %edx
	jg	.L123
.L86:
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L112:
	.cfi_restore_state
	addq	$1, %rax
	cmpl	%eax, %ecx
	jg	.L115
	jmp	.L114
	.cfi_endproc
.LFE20:
	.size	make_tree, .-make_tree
	.p2align 4
	.globl	lca_setup
	.type	lca_setup, @function
lca_setup:
.LFB21:
	.cfi_startproc
	movslq	mati_num(%rip), %r11
	testl	%r11d, %r11d
	jle	.L152
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	0(,%r11,4), %rsi
	xorl	%eax, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	.p2align 4,,10
	.p2align 3
.L140:
	movslq	tree_parent(%rax), %rdx
	movl	dijkstra_cost(%rax), %ecx
	movl	%edx, lca_goto(%rax)
	movl	%ecx, lca_cost(%rax)
	testl	%edx, %edx
	js	.L139
	movl	dijkstra_cost(,%rdx,4), %edx
	cmpl	%edx, %ecx
	jle	.L139
	movl	%edx, lca_cost(%rax)
.L139:
	addq	$4, %rax
	cmpq	%rsi, %rax
	jne	.L140
	leaq	400000(,%r11,4), %r8
	negq	%r11
	xorl	%r10d, %r10d
	salq	$2, %r11
	leaq	6800000(%r8), %rbx
	leaq	-400000(%r11), %rbp
	.p2align 4,,10
	.p2align 3
.L138:
	movslq	%r10d, %r9
	leaq	0(%rbp,%r8), %rcx
	leaq	(%r8,%r11), %rax
	imulq	$100000, %r9, %r9
	.p2align 4,,10
	.p2align 3
.L143:
	movslq	lca_goto(%rcx), %rdx
	movq	%rdx, %rsi
	addq	%r9, %rdx
	movl	lca_goto(,%rdx,4), %edi
	movl	%edi, lca_goto(%rax)
	movl	lca_cost(%rcx), %edi
	movl	%edi, lca_cost(%rax)
	testl	%esi, %esi
	js	.L142
	movl	lca_cost(,%rdx,4), %edx
	cmpl	%edx, %edi
	jle	.L142
	movl	%edx, lca_cost(%rax)
.L142:
	addq	$4, %rax
	addq	$4, %rcx
	cmpq	%r8, %rax
	jne	.L143
	addq	$400000, %r8
	addl	$1, %r10d
	cmpq	%rbx, %r8
	jne	.L138
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L152:
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE21:
	.size	lca_setup, .-lca_setup
	.p2align 4
	.globl	lca_go
	.type	lca_go, @function
lca_go:
.LFB22:
	.cfi_startproc
	movslq	%esi, %rcx
	movl	dijkstra_cost(,%rcx,4), %r8d
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L155:
	btl	%ecx, %edx
	jnc	.L154
	movslq	%ecx, %rax
	movslq	%esi, %rsi
	imulq	$100000, %rax, %rax
	addq	%rsi, %rax
	movl	lca_cost(,%rax,4), %esi
	cmpl	%esi, %r8d
	cmovg	%esi, %r8d
	movl	lca_goto(,%rax,4), %esi
.L154:
	addl	$1, %ecx
	cmpl	$18, %ecx
	jne	.L155
	testq	%rdi, %rdi
	je	.L156
	movl	%r8d, (%rdi)
.L156:
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE22:
	.size	lca_go, .-lca_go
	.p2align 4
	.globl	lca_query
	.type	lca_query, @function
lca_query:
.LFB23:
	.cfi_startproc
	cmpl	%esi, %edi
	je	.L216
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movslq	%edi, %r11
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	tree_depth(,%r11,4), %ecx
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movslq	%esi, %rbx
	movl	tree_depth(,%rbx,4), %r9d
	cmpl	%r9d, %ecx
	jle	.L167
	movl	dijkstra_cost(,%r11,4), %r8d
	subl	%r9d, %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L169:
	btl	%eax, %ecx
	jnc	.L168
	movslq	%eax, %rdx
	imulq	$100000, %rdx, %rdx
	addq	%r11, %rdx
	movl	lca_cost(,%rdx,4), %edi
	movslq	lca_goto(,%rdx,4), %r11
	cmpl	%edi, %r8d
	cmovg	%edi, %r8d
	movq	%r11, %rdi
.L168:
	addl	$1, %eax
	cmpl	$18, %eax
	jne	.L169
	movl	tree_depth(,%r11,4), %ecx
.L171:
	movl	%ecx, %r10d
	subl	$1, %r10d
	js	.L174
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L182:
	leal	(%r9,%r10), %eax
	movslq	%edi, %rbp
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	xorl	%eax, %eax
	sarl	%ecx
	.p2align 4,,10
	.p2align 3
.L176:
	btl	%eax, %ecx
	jnc	.L175
	movslq	%eax, %rdx
	imulq	$100000, %rdx, %rdx
	addq	%rbp, %rdx
	movslq	lca_goto(,%rdx,4), %rbp
.L175:
	addl	$1, %eax
	cmpl	$18, %eax
	jne	.L176
	movl	%esi, %edx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L178:
	btl	%eax, %ecx
	jnc	.L177
	movslq	%edx, %r12
	movslq	%eax, %rdx
	imulq	$100000, %rdx, %rdx
	addq	%r12, %rdx
	movl	lca_goto(,%rdx,4), %edx
.L177:
	addl	$1, %eax
	cmpl	$18, %eax
	jne	.L178
	cmpl	%ebp, %edx
	je	.L217
	leal	1(%rcx), %r9d
	cmpl	%r10d, %r9d
	jle	.L182
.L181:
	leal	1(%r10), %ecx
.L174:
	movl	dijkstra_cost(,%r11,4), %r9d
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L184:
	btl	%eax, %ecx
	jnc	.L183
	movslq	%eax, %rdx
	movslq	%edi, %rdi
	imulq	$100000, %rdx, %rdx
	addq	%rdi, %rdx
	movl	lca_cost(,%rdx,4), %edi
	cmpl	%edi, %r9d
	cmovg	%edi, %r9d
	movl	lca_goto(,%rdx,4), %edi
.L183:
	addl	$1, %eax
	cmpl	$18, %eax
	jne	.L184
	cmpl	%r8d, %r9d
	movl	dijkstra_cost(,%rbx,4), %edi
	cmovg	%r8d, %r9d
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L186:
	btl	%eax, %ecx
	jnc	.L185
	movslq	%eax, %rdx
	movslq	%esi, %rsi
	imulq	$100000, %rdx, %rdx
	addq	%rsi, %rdx
	movl	lca_cost(,%rdx,4), %esi
	cmpl	%esi, %edi
	cmovg	%esi, %edi
	movl	lca_goto(,%rdx,4), %esi
.L185:
	addl	$1, %eax
	cmpl	$18, %eax
	jne	.L186
	cmpl	%edi, %r9d
	movl	%edi, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	cmovle	%r9d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L167:
	.cfi_restore_state
	movl	$2147483647, %r8d
	jge	.L171
	movl	dijkstra_cost(,%rbx,4), %r8d
	subl	%ecx, %r9d
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L173:
	btl	%eax, %r9d
	jnc	.L172
	movslq	%eax, %rdx
	imulq	$100000, %rdx, %rdx
	addq	%rbx, %rdx
	movl	lca_cost(,%rdx,4), %esi
	movslq	lca_goto(,%rdx,4), %rbx
	cmpl	%esi, %r8d
	cmovg	%esi, %r8d
	movq	%rbx, %rsi
.L172:
	addl	$1, %eax
	cmpl	$18, %eax
	jne	.L173
	jmp	.L171
	.p2align 4,,10
	.p2align 3
.L217:
	leal	-1(%rcx), %r10d
	cmpl	%r9d, %r10d
	jge	.L182
	jmp	.L181
.L216:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	movslq	%edi, %rdi
	movl	dijkstra_cost(,%rdi,4), %eax
	ret
	.cfi_endproc
.LFE23:
	.size	lca_query, .-lca_query
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d%d%d"
.LC1:
	.string	"%d%d%d"
.LC2:
	.string	"%d"
.LC3:
	.string	"%d%d"
.LC4:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$douro_num, %edx
	movl	$query_num, %r8d
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$omaturi_num, %ecx
	movl	$mati_num, %esi
	movl	$.LC0, %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	call	__isoc99_scanf
	movl	douro_num(%rip), %edx
	movl	$0, dijkstra_edge_num(%rip)
	testl	%edx, %edx
	jle	.L223
	movl	$douro, %ebx
	xorl	%ebp, %ebp
	leaq	76(%rsp), %r13
	leaq	72(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L222:
	movq	%r12, %rdx
	xorl	%eax, %eax
	movq	%r13, %rcx
	movl	$.LC1, %edi
	leaq	68(%rsp), %rsi
	addl	$1, %ebp
	addq	$12, %rbx
	call	__isoc99_scanf
	movl	68(%rsp), %eax
	movd	76(%rsp), %xmm3
	movslq	dijkstra_edge_num(%rip), %rdx
	subl	$1, %eax
	movdqa	%xmm3, %xmm4
	movd	%eax, %xmm1
	movl	72(%rsp), %eax
	movdqa	%xmm1, %xmm2
	subl	$1, %eax
	movd	%eax, %xmm0
	movq	%rdx, %rax
	leaq	(%rdx,%rdx,2), %rdx
	punpckldq	%xmm0, %xmm4
	punpckldq	%xmm0, %xmm2
	punpcklqdq	%xmm4, %xmm2
	movups	%xmm2, dijkstra_edge(,%rdx,4)
	leal	1(%rax), %edx
	movdqa	%xmm1, %xmm2
	addl	$2, %eax
	movslq	%edx, %rdx
	punpckldq	%xmm3, %xmm2
	movl	%eax, dijkstra_edge_num(%rip)
	leaq	(%rdx,%rdx,2), %rdx
	movq	%xmm2, dijkstra_edge+4(,%rdx,4)
	movd	%xmm1, -12(%rbx)
	movd	%xmm0, -8(%rbx)
	cmpl	%ebp, douro_num(%rip)
	jg	.L222
.L223:
	call	dijkstra_setup
	movl	omaturi_num(%rip), %esi
	movl	$omaturi_list, %ebx
	xorl	%ebp, %ebp
	testl	%esi, %esi
	jle	.L221
	.p2align 4,,10
	.p2align 3
.L224:
	movq	%rbx, %rsi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	addl	$1, %ebp
	call	__isoc99_scanf
	movl	omaturi_num(%rip), %esi
	subl	$1, (%rbx)
	addq	$4, %rbx
	cmpl	%ebp, %esi
	jg	.L224
.L221:
	movl	$omaturi_list, %edi
	call	dijkstra_search
	movslq	douro_num(%rip), %rdi
	testl	%edi, %edi
	jle	.L229
	leaq	(%rdi,%rdi,2), %rdx
	movl	$douro, %eax
	leaq	douro(,%rdx,4), %rsi
	.p2align 4,,10
	.p2align 3
.L228:
	movslq	(%rax), %rdx
	movslq	4(%rax), %rcx
	movl	dijkstra_cost(,%rdx,4), %edx
	movl	dijkstra_cost(,%rcx,4), %ecx
	cmpl	%ecx, %edx
	cmovg	%ecx, %edx
	addq	$12, %rax
	movl	%edx, -4(%rax)
	cmpq	%rsi, %rax
	jne	.L228
.L229:
	movq	%rdi, %rsi
	movl	$edge_comp_cost, %ecx
	movl	$12, %edx
	movl	$douro, %edi
	call	qsort
	movl	$400000, %edx
	xorl	%esi, %esi
	movl	$uf_table, %edi
	call	memset
	movslq	douro_num(%rip), %rax
	testl	%eax, %eax
	jle	.L303
	leaq	(%rax,%rax,2), %rax
	movl	$douro, %r8d
	xorl	%r11d, %r11d
	leaq	douro(,%rax,4), %rbp
	.p2align 4,,10
	.p2align 3
.L240:
	movslq	(%r8), %rbx
	movl	4(%r8), %r10d
	movl	uf_table(,%rbx,4), %ecx
	movq	%rbx, %r9
	testl	%ecx, %ecx
	jle	.L271
	subl	$1, %ecx
	movslq	%ebx, %rdx
	movslq	%ecx, %rax
	movl	%ecx, %esi
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L230
	.p2align 4,,10
	.p2align 3
.L231:
	leal	-1(%rax), %esi
	movl	%eax, uf_table(,%rdx,4)
	movslq	%ecx, %rdx
	movslq	%esi, %rax
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L230
	movl	%esi, %ecx
	jmp	.L231
.L271:
	movl	%ebx, %esi
	.p2align 4,,10
	.p2align 3
.L230:
	movslq	%r10d, %r12
	movl	uf_table(,%r12,4), %edi
	testl	%edi, %edi
	jle	.L274
	subl	$1, %edi
	movslq	%r10d, %rdx
	movslq	%edi, %rax
	movl	%edi, %ecx
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L232
	.p2align 4,,10
	.p2align 3
.L233:
	leal	-1(%rax), %ecx
	movl	%eax, uf_table(,%rdx,4)
	movslq	%edi, %rdx
	movslq	%ecx, %rax
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L232
	movl	%ecx, %edi
	jmp	.L233
.L274:
	movl	%r10d, %ecx
	.p2align 4,,10
	.p2align 3
.L232:
	cmpl	%ecx, %esi
	jne	.L304
.L234:
	addq	$12, %r8
	cmpq	%rbp, %r8
	jne	.L240
	leal	(%r11,%r11), %ebx
	movl	$12, %edx
	movl	$douro_use, %edi
	movl	$dijkstra_comp, %ecx
	movslq	%ebx, %rsi
	call	qsort
	xorl	%esi, %esi
	movl	$800000, %edx
	movl	$mati_douro, %edi
	call	memset
	testl	%ebx, %ebx
	jle	.L241
	movslq	douro_use(%rip), %rax
	movl	$douro_use, %esi
	xorl	%edx, %edx
	jmp	.L245
	.p2align 4,,10
	.p2align 3
.L305:
	movl	%edx, mati_douro+4(,%rax,8)
	movslq	%ecx, %rax
	addq	$12, %rsi
	movl	%edx, mati_douro(,%rax,8)
	addl	$1, %edx
	cmpl	%edx, %ebx
	je	.L246
.L243:
	movslq	%ecx, %rax
.L245:
	movl	(%rsi), %ecx
	cmpl	%eax, %ecx
	jne	.L305
	addl	$1, %edx
	addq	$12, %rsi
	cmpl	%edx, %ebx
	jne	.L243
.L246:
	movl	%ebx, mati_douro+4(,%rax,8)
	movl	mati_douro+4(%rip), %edx
	movslq	mati_douro(%rip), %r15
	movl	$-1, tree_parent(%rip)
	movl	$1, tree_depth(%rip)
	cmpl	%edx, %r15d
	jge	.L270
.L269:
	leaq	(%r15,%r15,2), %rax
	movl	douro_use+4(,%rax,4), %r14d
	cmpl	$-1, %r14d
	je	.L251
	movslq	%r14d, %rax
	movslq	mati_douro(,%rax,8), %r12
	movl	mati_douro+4(,%rax,8), %ecx
	movl	$0, tree_parent(,%rax,4)
	movl	$2, tree_depth(,%rax,4)
	cmpl	%r12d, %ecx
	jle	.L251
	movq	%r15, 56(%rsp)
	movl	%r14d, %esi
	movq	%rax, 48(%rsp)
.L268:
	leaq	(%r12,%r12,2), %rax
	movl	douro_use+4(,%rax,4), %edx
	testl	%edx, %edx
	je	.L254
	movslq	%edx, %r14
	movslq	mati_douro(,%r14,8), %rbx
	movl	mati_douro+4(,%r14,8), %edi
	movl	%esi, tree_parent(,%r14,4)
	movl	$3, tree_depth(,%r14,4)
	cmpl	%ebx, %edi
	jle	.L254
	movq	%r12, 40(%rsp)
	movl	%edx, %r15d
	movq	%rbx, %rbp
	movl	%esi, %edx
	movq	%r14, 32(%rsp)
.L267:
	leaq	0(%rbp,%rbp,2), %rax
	movl	douro_use+4(,%rax,4), %r14d
	cmpl	%r14d, %edx
	je	.L257
	movslq	%r14d, %r8
	movslq	mati_douro(,%r8,8), %rbx
	movl	mati_douro+4(,%r8,8), %r9d
	movl	%r15d, tree_parent(,%r8,4)
	movl	$4, tree_depth(,%r8,4)
	cmpl	%ebx, %r9d
	jle	.L257
	movl	%edx, 28(%rsp)
	movl	%r14d, %r12d
	movq	%r8, 8(%rsp)
	movq	%rbp, 16(%rsp)
	movq	%rbx, %rbp
.L266:
	leaq	0(%rbp,%rbp,2), %rax
	movl	douro_use+4(,%rax,4), %r14d
	cmpl	%r14d, %r15d
	je	.L260
	movslq	%r14d, %rbx
	movl	mati_douro(,%rbx,8), %eax
	movl	mati_douro+4(,%rbx,8), %edx
	movl	%r12d, tree_parent(,%rbx,4)
	movl	$5, tree_depth(,%rbx,4)
	cmpl	%eax, %edx
	jle	.L260
	movslq	%eax, %r13
.L265:
	leaq	0(%r13,%r13,2), %rax
	movl	douro_use+4(,%rax,4), %edi
	cmpl	%edi, %r12d
	je	.L262
	movl	$6, %edx
	movl	%r14d, %esi
	addq	$1, %r13
	call	make_tree
	movl	mati_douro+4(,%rbx,8), %edx
	cmpl	%r13d, %edx
	jg	.L265
.L264:
	movq	8(%rsp), %rax
	movl	mati_douro+4(,%rax,8), %r9d
.L260:
	addq	$1, %rbp
	cmpl	%ebp, %r9d
	jg	.L266
	movq	32(%rsp), %rax
	movq	16(%rsp), %rbp
	movl	28(%rsp), %edx
	movl	mati_douro+4(,%rax,8), %edi
.L257:
	addq	$1, %rbp
	cmpl	%ebp, %edi
	jg	.L267
	movq	48(%rsp), %rax
	movq	40(%rsp), %r12
	movl	%edx, %esi
	movl	mati_douro+4(,%rax,8), %ecx
.L254:
	addq	$1, %r12
	cmpl	%r12d, %ecx
	jg	.L268
	movq	56(%rsp), %r15
	movl	mati_douro+4(%rip), %edx
.L251:
	addq	$1, %r15
	cmpl	%r15d, %edx
	jg	.L269
.L270:
	call	lca_setup
	movl	query_num(%rip), %eax
	xorl	%ebx, %ebx
	leaq	76(%rsp), %r13
	leaq	72(%rsp), %r12
	testl	%eax, %eax
	jle	.L298
	.p2align 4,,10
	.p2align 3
.L248:
	movq	%r13, %rdx
	movq	%r12, %rsi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	72(%rsp), %eax
	addl	$1, %ebx
	leal	-1(%rax), %edi
	movl	76(%rsp), %eax
	movl	%edi, 72(%rsp)
	leal	-1(%rax), %esi
	movl	%esi, 76(%rsp)
	call	lca_query
	movl	$.LC4, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	call	printf
	cmpl	%ebx, query_num(%rip)
	jg	.L248
.L298:
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L262:
	.cfi_restore_state
	addq	$1, %r13
	cmpl	%r13d, %edx
	jg	.L265
	jmp	.L264
	.p2align 4,,10
	.p2align 3
.L304:
	movl	uf_table(,%rbx,4), %esi
	testl	%esi, %esi
	jle	.L277
	subl	$1, %esi
	movslq	%r9d, %rdx
	movslq	%esi, %rax
	movl	%esi, %ecx
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L235
	.p2align 4,,10
	.p2align 3
.L236:
	leal	-1(%rax), %ecx
	movl	%eax, uf_table(,%rdx,4)
	movslq	%esi, %rdx
	movslq	%ecx, %rax
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L235
	movl	%ecx, %esi
	jmp	.L236
.L277:
	movl	%r9d, %ecx
	.p2align 4,,10
	.p2align 3
.L235:
	movl	uf_table(,%r12,4), %edi
	testl	%edi, %edi
	jle	.L280
	subl	$1, %edi
	movslq	%r10d, %rdx
	movslq	%edi, %rax
	movl	%edi, %esi
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L237
	.p2align 4,,10
	.p2align 3
.L238:
	leal	-1(%rax), %esi
	movl	%eax, uf_table(,%rdx,4)
	movslq	%edi, %rdx
	movslq	%esi, %rax
	movl	uf_table(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L237
	movl	%esi, %edi
	jmp	.L238
.L280:
	movl	%r10d, %esi
	.p2align 4,,10
	.p2align 3
.L237:
	cmpl	%esi, %ecx
	je	.L239
	movslq	%ecx, %rcx
	addl	$1, %esi
	movl	%esi, uf_table(,%rcx,4)
.L239:
	movd	8(%r8), %xmm1
	leal	(%r11,%r11), %eax
	movd	%r10d, %xmm5
	movd	%r9d, %xmm0
	movslq	%eax, %rdx
	punpckldq	%xmm5, %xmm0
	addl	$1, %eax
	addl	$1, %r11d
	movdqa	%xmm1, %xmm2
	leaq	(%rdx,%rdx,2), %rdx
	cltq
	punpckldq	%xmm5, %xmm2
	leaq	(%rax,%rax,2), %rax
	punpcklqdq	%xmm2, %xmm0
	movups	%xmm0, douro_use(,%rdx,4)
	movd	%r9d, %xmm0
	punpckldq	%xmm1, %xmm0
	movq	%xmm0, douro_use+4(,%rax,4)
	jmp	.L234
.L303:
	movl	$dijkstra_comp, %ecx
	movl	$12, %edx
	xorl	%esi, %esi
	xorl	%ebx, %ebx
	movl	$douro_use, %edi
	call	qsort
	movl	$800000, %edx
	xorl	%esi, %esi
	movl	$mati_douro, %edi
	call	memset
	movslq	douro_use(%rip), %rax
	jmp	.L246
.L241:
	movslq	douro_use(%rip), %rax
	xorl	%ebx, %ebx
	jmp	.L246
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.globl	lca_cost
	.bss
	.align 32
	.type	lca_cost, @object
	.size	lca_cost, 7200000
lca_cost:
	.zero	7200000
	.globl	lca_goto
	.align 32
	.type	lca_goto, @object
	.size	lca_goto, 7200000
lca_goto:
	.zero	7200000
	.globl	tree_depth
	.align 32
	.type	tree_depth, @object
	.size	tree_depth, 400000
tree_depth:
	.zero	400000
	.globl	tree_parent
	.align 32
	.type	tree_parent, @object
	.size	tree_parent, 400000
tree_parent:
	.zero	400000
	.globl	mati_douro
	.align 32
	.type	mati_douro, @object
	.size	mati_douro, 800000
mati_douro:
	.zero	800000
	.globl	douro_use
	.align 32
	.type	douro_use, @object
	.size	douro_use, 2400000
douro_use:
	.zero	2400000
	.globl	douro
	.align 32
	.type	douro, @object
	.size	douro, 2400000
douro:
	.zero	2400000
	.globl	query_num
	.align 4
	.type	query_num, @object
	.size	query_num, 4
query_num:
	.zero	4
	.globl	omaturi_list
	.align 32
	.type	omaturi_list, @object
	.size	omaturi_list, 400000
omaturi_list:
	.zero	400000
	.globl	omaturi_num
	.align 4
	.type	omaturi_num, @object
	.size	omaturi_num, 4
omaturi_num:
	.zero	4
	.globl	douro_num
	.align 4
	.type	douro_num, @object
	.size	douro_num, 4
douro_num:
	.zero	4
	.globl	mati_num
	.align 4
	.type	mati_num, @object
	.size	mati_num, 4
mati_num:
	.zero	4
	.globl	uf_table
	.align 32
	.type	uf_table, @object
	.size	uf_table, 400000
uf_table:
	.zero	400000
	.globl	dijkstra_visited
	.align 32
	.type	dijkstra_visited, @object
	.size	dijkstra_visited, 100000
dijkstra_visited:
	.zero	100000
	.globl	dijkstra_cost
	.align 32
	.type	dijkstra_cost, @object
	.size	dijkstra_cost, 400000
dijkstra_cost:
	.zero	400000
	.globl	dijkstra_queue
	.align 32
	.type	dijkstra_queue, @object
	.size	dijkstra_queue, 3200008
dijkstra_queue:
	.zero	3200008
	.globl	dijkstra_queue_num
	.align 4
	.type	dijkstra_queue_num, @object
	.size	dijkstra_queue_num, 4
dijkstra_queue_num:
	.zero	4
	.globl	dijkstra_node_edge
	.align 32
	.type	dijkstra_node_edge, @object
	.size	dijkstra_node_edge, 800000
dijkstra_node_edge:
	.zero	800000
	.globl	dijkstra_edge
	.align 32
	.type	dijkstra_edge, @object
	.size	dijkstra_edge, 4800000
dijkstra_edge:
	.zero	4800000
	.globl	dijkstra_edge_num
	.align 4
	.type	dijkstra_edge_num, @object
	.size	dijkstra_edge_num, 4
dijkstra_edge_num:
	.zero	4
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
