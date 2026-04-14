.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d %d %d %d"
.LC1:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	leaq	8(%rsp), %rcx
	leaq	4(%rsp), %rdx
	leaq	16(%rsp), %r9
	leaq	12(%rsp), %r8
	call	__isoc99_scanf@PLT
	movslq	(%rsp), %rax
	movq	%rax, %rcx
	imulq	$1717986919, %rax, %rax
	movl	%ecx, %edx
	sarl	$31, %edx
	sarq	$34, %rax
	subl	%edx, %eax
	leal	(%rax,%rax,4), %edx
	movl	%eax, %esi
	movl	%ecx, %eax
	addl	%edx, %edx
	subl	%edx, %eax
	je	.L2
	movl	$10, %edx
	leal	5(%rsi,%rsi,4), %ecx
	subl	%eax, %edx
	addl	%ecx, %ecx
	movl	%edx, %eax
.L2:
	movslq	4(%rsp), %rdx
	movq	%rdx, %rsi
	imulq	$1717986919, %rdx, %rdx
	movl	%esi, %edi
	leal	(%rcx,%rsi), %r9d
	sarl	$31, %edi
	sarq	$34, %rdx
	subl	%edi, %edx
	leal	(%rdx,%rdx,4), %edi
	movl	%edx, %r8d
	addl	%edi, %edi
	subl	%edi, %esi
	movl	%esi, %edx
	je	.L4
	movl	$10, %esi
	subl	%edx, %esi
	leal	5(%r8,%r8,4), %edx
	cmpl	%esi, %eax
	leal	(%rcx,%rdx,2), %r9d
	cmovl	%esi, %eax
.L4:
	movslq	8(%rsp), %rdx
	movq	%rdx, %rcx
	imulq	$1717986919, %rdx, %rdx
	movl	%ecx, %esi
	leal	(%r9,%rcx), %r8d
	sarl	$31, %esi
	sarq	$34, %rdx
	subl	%esi, %edx
	leal	(%rdx,%rdx,4), %esi
	movl	%edx, %edi
	addl	%esi, %esi
	subl	%esi, %ecx
	movl	%ecx, %edx
	je	.L6
	movl	$10, %ecx
	subl	%edx, %ecx
	leal	5(%rdi,%rdi,4), %edx
	cmpl	%ecx, %eax
	leal	(%r9,%rdx,2), %r8d
	cmovl	%ecx, %eax
.L6:
	movslq	12(%rsp), %rdx
	movq	%rdx, %rcx
	imulq	$1717986919, %rdx, %rdx
	movl	%ecx, %esi
	leal	(%r8,%rcx), %r9d
	sarl	$31, %esi
	sarq	$34, %rdx
	subl	%esi, %edx
	leal	(%rdx,%rdx,4), %esi
	movl	%edx, %edi
	addl	%esi, %esi
	subl	%esi, %ecx
	movl	%ecx, %edx
	je	.L8
	movl	$10, %ecx
	subl	%edx, %ecx
	leal	5(%rdi,%rdi,4), %edx
	cmpl	%ecx, %eax
	leal	(%r8,%rdx,2), %r9d
	cmovl	%ecx, %eax
.L8:
	movslq	16(%rsp), %rdx
	movq	%rdx, %rcx
	imulq	$1717986919, %rdx, %rdx
	movl	%ecx, %esi
	sarl	$31, %esi
	sarq	$34, %rdx
	subl	%esi, %edx
	leal	(%rdx,%rdx,4), %esi
	movl	%edx, %edi
	movl	%ecx, %edx
	addl	%esi, %esi
	subl	%esi, %edx
	je	.L20
	movl	$10, %ecx
	subl	%edx, %ecx
	leal	5(%rdi,%rdi,4), %edx
	cmpl	%ecx, %eax
	leal	(%r9,%rdx,2), %edx
	cmovl	%ecx, %eax
.L10:
	subl	%eax, %edx
	leaq	.LC1(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L21
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L20:
	.cfi_restore_state
	leal	(%rcx,%r9), %edx
	jmp	.L10
.L21:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
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