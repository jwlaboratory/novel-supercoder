.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d %d %d %d %s"
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	-98304(%rsp), %r11
	.cfi_def_cfa 11, 98320
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$1760, %rsp
	.cfi_def_cfa_offset 100080
	pxor	%xmm0, %xmm0
	movl	$99994, %edx
	xorl	%esi, %esi
	movq	%fs:40, %rax
	movq	%rax, 100056(%rsp)
	xorl	%eax, %eax
	leaq	48(%rsp), %rdi
	movaps	%xmm0, 32(%rsp)
	call	memset@PLT
	leaq	16(%rsp), %rdx
	xorl	%eax, %eax
	leaq	12(%rsp), %rsi
	leaq	20(%rsp), %rcx
	subq	$8, %rsp
	.cfi_def_cfa_offset 100088
	leaq	.LC0(%rip), %rdi
	leaq	40(%rsp), %rbx
	pushq	%rbx
	.cfi_def_cfa_offset 100096
	leaq	44(%rsp), %r9
	leaq	40(%rsp), %r8
	call	__isoc99_scanf@PLT
	movslq	32(%rsp), %rsi
	popq	%rax
	.cfi_def_cfa_offset 100088
	popq	%rdx
	.cfi_def_cfa_offset 100080
	testl	%esi, %esi
	jle	.L14
	leal	-1(%rsi), %edx
	movl	24(%rsp), %r10d
	movl	20(%rsp), %r9d
	movq	%rbx, %rax
	leaq	33(%rsp,%rdx), %rdi
	movl	28(%rsp), %r8d
	xorl	%edx, %edx
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L3:
	cmpb	$115, %cl
	je	.L5
	cmpb	$112, %cl
	jne	.L4
	addl	%r10d, %edx
.L4:
	addq	$1, %rax
	cmpq	%rdi, %rax
	je	.L2
.L6:
	movzbl	(%rax), %ecx
	cmpb	$114, %cl
	jne	.L3
	addq	$1, %rax
	addl	%r8d, %edx
	cmpq	%rdi, %rax
	jne	.L6
.L2:
	movl	12(%rsp), %ecx
	cmpl	%esi, %ecx
	jle	.L7
	subl	$1, %ecx
	movl	20(%rsp), %r10d
	movl	28(%rsp), %r9d
	movq	%rbx, %rax
	subl	%esi, %ecx
	movl	24(%rsp), %r8d
	leaq	33(%rsp,%rcx), %rdi
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L20:
	cmpb	$114, %cl
	je	.L19
	cmpb	$115, %cl
	jne	.L11
	addl	%r10d, %edx
.L10:
	addq	$1, %rax
	cmpq	%rdi, %rax
	je	.L7
.L12:
	movzbl	(%rax,%rsi), %ecx
	cmpb	(%rax), %cl
	jne	.L20
	movb	$109, (%rax,%rsi)
	addq	$1, %rax
	cmpq	%rdi, %rax
	jne	.L12
.L7:
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	100056(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L21
	addq	$100064, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	.cfi_restore_state
	addl	%r9d, %edx
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L11:
	cmpb	$112, %cl
	jne	.L10
	addl	%r8d, %edx
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L19:
	addl	%r9d, %edx
	jmp	.L10
.L14:
	xorl	%edx, %edx
	jmp	.L2
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
