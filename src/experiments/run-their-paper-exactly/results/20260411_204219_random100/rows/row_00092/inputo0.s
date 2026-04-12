```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d"
.LC1:
	.string	"%d %d %d %d"
.LC2:
	.string	"even"
.LC3:
	.string	"hiroshi"
.LC4:
	.string	"kenjiro"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	.LC0(%rip), %rbp
	movq	%rbp, %rdi
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rdx
	leaq	8(%rsp), %rsi
	call	__isoc99_scanf@PLT
	leaq	20(%rsp), %rdx
	movq	%rbp, %rdi
	xorl	%eax, %eax
	leaq	16(%rsp), %rsi
	call	__isoc99_scanf@PLT
	leaq	32(%rsp), %rcx
	leaq	28(%rsp), %rdx
	xorl	%eax, %eax
	leaq	24(%rsp), %rsi
	leaq	36(%rsp), %r8
	leaq	.LC1(%rip), %rdi
	call	__isoc99_scanf@PLT
	movl	8(%rsp), %r10d
	movl	12(%rsp), %edi
	movl	24(%rsp), %eax
	movl	28(%rsp), %r9d
	movl	%r10d, %ecx
	movl	%edi, %edx
	movl	32(%rsp), %r8d
	movl	36(%rsp), %esi
	imull	%r9d, %edx
	imull	%eax, %ecx
	addl	%edx, %ecx
	movslq	%r10d, %rdx
	sarl	$31, %r10d
	imulq	$1717986919, %rdx, %rdx
	sarq	$34, %rdx
	subl	%r10d, %edx
	imull	%r8d, %edx
	addl	%edx, %ecx
	movslq	%edi, %rdx
	sarl	$31, %edi
	imulq	$1717986919, %rdx, %rdx
	sarq	$35, %rdx
	subl	%edi, %edx
	movl	20(%rsp), %edi
	imull	%esi, %edx
	imull	%edi, %r9d
	addl	%edx, %ecx
	movslq	16(%rsp), %rdx
	imull	%edx, %eax
	movq	%rdx, %r10
	imulq	$1717986919, %rdx, %rdx
	sarl	$31, %r10d
	addl	%r9d, %eax
	sarq	$34, %rdx
	subl	%r10d, %edx
	imull	%r8d, %edx
	addl	%edx, %eax
	movslq	%edi, %rdx
	imulq	$1717986919, %rdx, %rdx
	sarq	$35, %rdx
	sarl	$31, %edi
	subl	%edi, %edx
	imull	%esi, %edx
	addl	%edx, %eax
	cmpl	%eax, %ecx
	je	.L8
	jg	.L9
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
.L3:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L10
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L9:
	.cfi_restore_state
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	jmp	.L3
.L8:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	jmp	.L3
.L10:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
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
```