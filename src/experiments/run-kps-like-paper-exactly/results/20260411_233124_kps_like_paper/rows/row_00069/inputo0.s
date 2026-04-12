	.file	"inputC.c"
	.text
	.globl	count
	.bss
	.align 4
	.type	count, @object
	.size	count, 4
count:
	.zero	4
	.globl	L
	.align 32
	.type	L, @object
	.size	L, 1000008
L:
	.zero	1000008
	.globl	R
	.align 32
	.type	R, @object
	.size	R, 1000008
R:
	.zero	1000008
	.text
	.globl	merge
	.type	merge, @function
merge:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	%edx, -48(%rbp)
	movl	%ecx, -52(%rbp)
	movl	-48(%rbp), %eax
	subl	-44(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-52(%rbp), %eax
	subl	-48(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L2
.L3:
	movl	-44(%rbp), %edx
	movl	-20(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	L(%rip), %rdx
	movl	%eax, (%rcx,%rdx)
	addl	$1, -20(%rbp)
.L2:
	movl	-20(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L3
	movl	$0, -20(%rbp)
	jmp	.L4
.L5:
	movl	-48(%rbp), %edx
	movl	-20(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	R(%rip), %rdx
	movl	%eax, (%rcx,%rdx)
	addl	$1, -20(%rbp)
.L4:
	movl	-20(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L5
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	L(%rip), %rax
	movl	$2000000001, (%rdx,%rax)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	R(%rip), %rax
	movl	$2000000001, (%rdx,%rax)
	movl	$0, -20(%rbp)
	movl	$0, -16(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.L6
.L9:
	movl	count(%rip), %eax
	addl	$1, %eax
	movl	%eax, count(%rip)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	L(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	R(%rip), %rax
	movl	(%rcx,%rax), %eax
	cmpl	%eax, %edx
	jg	.L7
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	L(%rip), %rax
	movl	(%rcx,%rax), %eax
	movl	%eax, (%rdx)
	jmp	.L8
.L7:
	movl	-16(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -16(%rbp)
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	R(%rip), %rax
	movl	(%rcx,%rax), %eax
	movl	%eax, (%rdx)
.L8:
	addl	$1, -12(%rbp)
.L6:
	movl	-12(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L9
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	merge, .-merge
	.globl	mergeSort
	.type	mergeSort, @function
mergeSort:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	-28(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -32(%rbp)
	jle	.L12
	movl	-28(%rbp), %edx
	movl	-32(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %edx
	movl	-28(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	mergeSort
	movl	-32(%rbp), %edx
	movl	-4(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	mergeSort
	movl	-32(%rbp), %ecx
	movl	-4(%rbp), %edx
	movl	-28(%rbp), %esi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	merge
.L12:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	mergeSort, .-mergeSort
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-1998848(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$1184, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-2000024(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -2000020(%rbp)
	jmp	.L14
.L15:
	leaq	-2000016(%rbp), %rdx
	movl	-2000020(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -2000020(%rbp)
.L14:
	movl	-2000024(%rbp), %eax
	cmpl	%eax, -2000020(%rbp)
	jl	.L15
	movl	-2000024(%rbp), %edx
	leaq	-2000016(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	mergeSort
	movl	$0, -2000020(%rbp)
	jmp	.L16
.L18:
	cmpl	$0, -2000020(%rbp)
	jle	.L17
	movl	$32, %edi
	call	putchar@PLT
.L17:
	movl	-2000020(%rbp), %eax
	cltq
	movl	-2000016(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -2000020(%rbp)
.L16:
	movl	-2000024(%rbp), %eax
	cmpl	%eax, -2000020(%rbp)
	jl	.L18
	movl	$10, %edi
	call	putchar@PLT
	movl	count(%rip), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
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
