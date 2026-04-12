	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$464, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -452(%rbp)
	movl	$0, -436(%rbp)
	leaq	-460(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-460(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -432(%rbp)
	movl	$0, -448(%rbp)
	jmp	.L2
.L3:
	movl	-448(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-432(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -448(%rbp)
.L2:
	movl	-460(%rbp), %eax
	cmpl	%eax, -448(%rbp)
	jl	.L3
	leaq	-456(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-456(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -424(%rbp)
	movl	$0, -448(%rbp)
	jmp	.L4
.L5:
	movl	-448(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-424(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -448(%rbp)
.L4:
	movl	-456(%rbp), %eax
	cmpl	%eax, -448(%rbp)
	jl	.L5
	movl	$0, -448(%rbp)
	jmp	.L6
.L15:
	movl	$0, -436(%rbp)
	movl	$0, -444(%rbp)
	jmp	.L7
.L14:
	movl	-448(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-432(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-444(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-424(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L8
	movl	$0, -440(%rbp)
	jmp	.L9
.L11:
	movl	-440(%rbp), %eax
	cltq
	movl	-416(%rbp,%rax,4), %edx
	movl	-444(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-424(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L10
	movl	$1, -436(%rbp)
.L10:
	addl	$1, -440(%rbp)
.L9:
	movl	-440(%rbp), %eax
	cmpl	-452(%rbp), %eax
	jl	.L11
	cmpl	$1, -436(%rbp)
	je	.L18
	movl	-444(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-424(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-452(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -452(%rbp)
	movl	(%rcx), %edx
	cltq
	movl	%edx, -416(%rbp,%rax,4)
	jmp	.L13
.L8:
	addl	$1, -444(%rbp)
.L7:
	movl	-456(%rbp), %eax
	cmpl	%eax, -444(%rbp)
	jl	.L14
	jmp	.L13
.L18:
	nop
.L13:
	addl	$1, -448(%rbp)
.L6:
	movl	-460(%rbp), %eax
	cmpl	%eax, -448(%rbp)
	jl	.L15
	movl	-452(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-432(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-424(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
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
