	.file	"inputC.c"
	.text
	.globl	A
	.bss
	.align 32
	.type	A, @object
	.size	A, 4000000
A:
	.zero	4000000
	.globl	count
	.align 4
	.type	count, @object
	.size	count, 4
count:
	.zero	4
	.text
	.globl	Merge
	.type	Merge, @function
Merge:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-7999488(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$592, %rsp
	movq	%rdi, -8000056(%rbp)
	movl	%esi, -8000060(%rbp)
	movl	%edx, -8000064(%rbp)
	movl	%ecx, -8000068(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	-8000064(%rbp), %eax
	subl	-8000060(%rbp), %eax
	movl	%eax, -8000024(%rbp)
	movl	-8000068(%rbp), %eax
	subl	-8000064(%rbp), %eax
	movl	%eax, -8000020(%rbp)
	movl	$0, -8000036(%rbp)
	jmp	.L2
.L3:
	movl	-8000060(%rbp), %edx
	movl	-8000036(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8000056(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-8000036(%rbp), %eax
	cltq
	movl	%edx, -8000016(%rbp,%rax,4)
	addl	$1, -8000036(%rbp)
.L2:
	movl	-8000036(%rbp), %eax
	cmpl	-8000024(%rbp), %eax
	jl	.L3
	movl	$0, -8000032(%rbp)
	jmp	.L4
.L5:
	movl	-8000064(%rbp), %edx
	movl	-8000032(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8000056(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-8000032(%rbp), %eax
	cltq
	movl	%edx, -4000016(%rbp,%rax,4)
	addl	$1, -8000032(%rbp)
.L4:
	movl	-8000032(%rbp), %eax
	cmpl	-8000020(%rbp), %eax
	jl	.L5
	movl	-8000024(%rbp), %eax
	cltq
	movl	$2147483647, -8000016(%rbp,%rax,4)
	movl	-8000020(%rbp), %eax
	cltq
	movl	$2147483647, -4000016(%rbp,%rax,4)
	movl	$0, -8000036(%rbp)
	movl	$0, -8000032(%rbp)
	movl	-8000060(%rbp), %eax
	movl	%eax, -8000028(%rbp)
	jmp	.L6
.L9:
	movl	-8000036(%rbp), %eax
	cltq
	movl	-8000016(%rbp,%rax,4), %edx
	movl	-8000032(%rbp), %eax
	cltq
	movl	-4000016(%rbp,%rax,4), %eax
	cmpl	%eax, %edx
	jg	.L7
	movl	-8000028(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8000056(%rbp), %rax
	addq	%rax, %rdx
	movl	-8000036(%rbp), %eax
	cltq
	movl	-8000016(%rbp,%rax,4), %eax
	movl	%eax, (%rdx)
	movl	count(%rip), %eax
	addl	$1, %eax
	movl	%eax, count(%rip)
	addl	$1, -8000036(%rbp)
	jmp	.L8
.L7:
	movl	-8000028(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8000056(%rbp), %rax
	addq	%rax, %rdx
	movl	-8000032(%rbp), %eax
	cltq
	movl	-4000016(%rbp,%rax,4), %eax
	movl	%eax, (%rdx)
	movl	count(%rip), %eax
	addl	$1, %eax
	movl	%eax, count(%rip)
	addl	$1, -8000032(%rbp)
.L8:
	addl	$1, -8000028(%rbp)
.L6:
	movl	-8000028(%rbp), %eax
	cmpl	-8000068(%rbp), %eax
	jl	.L9
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	Merge, .-Merge
	.globl	Merge_Sort
	.type	Merge_Sort, @function
Merge_Sort:
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
	jle	.L13
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
	call	Merge_Sort
	movl	-32(%rbp), %edx
	movl	-4(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	Merge_Sort
	movl	-32(%rbp), %ecx
	movl	-4(%rbp), %edx
	movl	-28(%rbp), %esi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Merge
.L13:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	Merge_Sort, .-Merge_Sort
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d "
.LC2:
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
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -12(%rbp)
	jmp	.L15
.L16:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	A(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -12(%rbp)
.L15:
	movl	-16(%rbp), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L16
	movl	-16(%rbp), %eax
	movl	%eax, %edx
	movl	$0, %esi
	leaq	A(%rip), %rax
	movq	%rax, %rdi
	call	Merge_Sort
	movl	$0, -12(%rbp)
	jmp	.L17
.L18:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	A(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -12(%rbp)
.L17:
	movl	-16(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -12(%rbp)
	jl	.L18
	movl	-16(%rbp), %eax
	subl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	A(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	count(%rip), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
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
