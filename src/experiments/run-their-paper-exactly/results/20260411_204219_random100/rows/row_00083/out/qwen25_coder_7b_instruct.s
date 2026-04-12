.file	"temp.c"
	.text
	.p2align 4
	.globl	min
	.type	min, @function
min:
.LFB23:
	.cfi_startproc
	endbr64
	cmpl	%esi, %edi
	movl	%esi, %eax
	cmovle	%edi, %eax
	ret
	.cfi_endproc
.LFE23:
	.size	min, .-min
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d%d"
.LC1:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	.cfi_def_cfa_offset 56
	movq	%fs:40, %rax
	movq	%rax, 40(%rbp)
	xorl	%eax, %eax
	leaq	44(%rbp), %rcx
	leaq	36(%rbp), %rsi
	leaq	40(%rbp), %rdx
	call	__isoc99_scanf@PLT
	movl	40(%rbp), %r8d
	movl	36(%rbp), %esi
	cmpl	%esi, %r8d
	movl	%esi, %ecx
	cmovle	%r8d, %ecx
	testl	%ecx, %ecx
	jle	.L4
	movl	44(%rbp), %r9d
	xorl	%edi, %edi
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L11:
	subl	$1, %ecx
	je	.L4
.L6:
	movl	%esi, %eax
	cltd
	idivl	%ecx
	testl	%edx, %edx
	jne	.L5
	movl	%r8d, %eax
	cltd
	idivl	%ecx
	cmpl	$1, %edx
	adcl	$0, %edi
.L5:
	cmpl	%edi, %r9d
	jne	.L11
	movl	%ecx, %r12d
.L4:
	xorl	%eax, %eax
	movl	%r12d, %edx
	movl	$1, %edi
	leaq	.LC1(%rip), %rsi
	call	__printf_chk@PLT
	movq	40(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L12
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L12:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE24:
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
