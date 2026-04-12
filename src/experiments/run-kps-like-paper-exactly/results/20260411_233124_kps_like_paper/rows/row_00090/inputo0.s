	.file	"inputC.c"
	.text
	.globl	n
	.bss
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.globl	A
	.align 32
	.type	A, @object
	.size	A, 40000
A:
	.zero	40000
	.globl	dis
	.align 32
	.type	dis, @object
	.size	dis, 400
dis:
	.zero	400
	.globl	Q
	.align 32
	.type	Q, @object
	.size	Q, 400
Q:
	.zero	400
	.globl	head
	.align 4
	.type	head, @object
	.size	head, 4
head:
	.zero	4
	.globl	tail
	.data
	.align 4
	.type	tail, @object
	.size	tail, 4
tail:
	.long	1
	.text
	.globl	enqueue
	.type	enqueue, @function
enqueue:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	tail(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, tail(%rip)
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	Q(%rip), %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	enqueue, .-enqueue
	.globl	deq
	.type	deq, @function
deq:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	head(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, head(%rip)
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	Q(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	deq, .-deq
	.globl	empty
	.type	empty, @function
empty:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	head(%rip), %edx
	movl	tail(%rip), %eax
	cmpl	%eax, %edx
	sete	%al
	movzbl	%al, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	empty, .-empty
	.section	.rodata
.LC0:
	.string	"%d %d\n"
	.text
	.globl	bfs
	.type	bfs, @function
bfs:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	enqueue
	movl	$0, -12(%rbp)
	jmp	.L7
.L8:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	dis(%rip), %rax
	movl	$2097152, (%rdx,%rax)
	addl	$1, -12(%rbp)
.L7:
	movl	n(%rip), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L8
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	dis(%rip), %rax
	movl	$0, (%rdx,%rax)
	jmp	.L9
.L15:
	movl	$0, %eax
	call	deq
	movl	%eax, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L10
.L14:
	movl	-8(%rbp), %eax
	movslq	%eax, %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	A(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	je	.L20
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	dis(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$2097152, %eax
	jne	.L21
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	dis(%rip), %rax
	movl	(%rdx,%rax), %eax
	leal	1(%rax), %ecx
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	dis(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	enqueue
	jmp	.L12
.L20:
	nop
	jmp	.L12
.L21:
	nop
.L12:
	addl	$1, -8(%rbp)
.L10:
	movl	n(%rip), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L14
.L9:
	movl	$0, %eax
	call	empty
	testl	%eax, %eax
	je	.L15
	movl	$0, -12(%rbp)
	jmp	.L16
.L19:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	dis(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$2097152, %eax
	je	.L17
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	dis(%rip), %rax
	movl	(%rdx,%rax), %eax
	jmp	.L18
.L17:
	movl	$-1, %eax
.L18:
	movl	-12(%rbp), %edx
	leal	1(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -12(%rbp)
.L16:
	movl	n(%rip), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L19
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	bfs, .-bfs
	.section	.rodata
.LC1:
	.string	"%d"
.LC2:
	.string	"%d %d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	n(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -16(%rbp)
	jmp	.L23
.L26:
	movl	$0, -12(%rbp)
	jmp	.L24
.L25:
	movl	-12(%rbp), %eax
	movslq	%eax, %rcx
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	A(%rip), %rax
	movl	$0, (%rdx,%rax)
	addl	$1, -12(%rbp)
.L24:
	movl	n(%rip), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L25
	addl	$1, -16(%rbp)
.L23:
	movl	n(%rip), %eax
	cmpl	%eax, -16(%rbp)
	jl	.L26
	movl	$0, -16(%rbp)
	jmp	.L27
.L30:
	leaq	-24(%rbp), %rdx
	leaq	-28(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-28(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -28(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L28
.L29:
	leaq	-20(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -20(%rbp)
	movl	-28(%rbp), %eax
	movl	-20(%rbp), %edx
	movslq	%edx, %rcx
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	A(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -12(%rbp)
.L28:
	movl	-24(%rbp), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L29
	addl	$1, -16(%rbp)
.L27:
	movl	n(%rip), %eax
	cmpl	%eax, -16(%rbp)
	jl	.L30
	movl	$0, %edi
	call	bfs
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L32
	call	__stack_chk_fail@PLT
.L32:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
