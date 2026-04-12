.file	"optimized_inputC.s"
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
	movl	%edi, dijkstra_node_edge+
