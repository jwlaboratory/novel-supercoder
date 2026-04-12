.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"YES"
.LC1:
	.string	"NO"
.LC2:
	.string	"%s"
.LC3:
	.string	"keyence"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB35:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC2(%rip), %rdi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
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
	subq	$264, %rsp
	.cfi_def_cfa_offset 320
	movq	%fs:40, %rax
	movq	%rax, 248(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rbp
	movq	%rbp, %rsi
	call	__isoc99_scanf@PLT
	movq	%rbp, %rdi
	call	strlen@PLT
	leaq	.LC3(%rip), %rsi
	movq	%rbp, %rdi
	movq	%rax, %rbx
	movl	%eax, %r13d
	call	strcmp@PLT
	movl	.LC3(%rip), %r11d
	movq	.LC3(%rip), %r14
	testl	%eax, %eax
	movq	.LC3(%rip), %r15
	sete	%al
	sall	$8, %r11d
	xorl	%esi, %esi
	xorl	%r8d, %r8d
	salq	$24, %r14
	movzbl	%al, %eax
	salq	$16, %r15
	movl	%eax, 12(%rsp)
	sarl	$24, %r11d
	sarq	$56, %r14
	sarq	$56, %r15
	.p2align 4,,10
	.p2align 3
.L2:
	movq	.LC3(%rip), %r10
	movzwl	.LC3(%rip), %r9d
	movl	%esi, %edi
	salq	$8, %r10
	sarw	$8, %r9w
	sarq	$56, %r10
	.p2align 4,,10
	.p2align 3
.L19:
	testq	%rbx, %rbx
	je	.L15
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L5:
	cmpl	%eax, %esi
	jg	.L24
	cmpl	%eax, %edi
	jg	.L3
.L24:
	movzbl	0(%rbp,%rax), %r12d
	movslq	%edx, %rcx
	addl	$1, %edx
	movb	%r12b, 128(%rsp,%rcx)
.L3:
	addq	$1, %rax
	cmpq	%rax, %rbx
	jne	.L5
	xorl	%eax, %eax
	cmpl	$7, %edx
	sete	%al
	testl	%edx, %edx
	je	.L6
	movzbl	.LC3(%rip), %ecx
	cmpb	%cl, 128(%rsp)
	cmovne	%r8d, %eax
	cmpl	$1, %edx
	je	.L6
	cmpb	%r9b, 129(%rsp)
	cmovne	%r8d, %eax
	cmpl	$2, %edx
	je	.L6
	cmpb	%r11b, 130(%rsp)
	cmovne	%r8d, %eax
	cmpl	$3, %edx
	je	.L6
	movl	.LC3(%rip), %ecx
	sarl	$24, %ecx
	cmpb	%cl, 131(%rsp)
	cmovne	%r8d, %eax
	cmpl	$4, %edx
	je	.L6
	cmpb	%r14b, 132(%rsp)
	cmovne	%r8d, %eax
	cmpl	$5, %edx
	je	.L6
	cmpb	%r15b, 133(%rsp)
	cmovne	%r8d, %eax
	cmpl	$6, %edx
	je	.L6
	cmpb	%r10b, 134(%rsp)
	je	.L59
.L14:
	addl	$1, %edi
	cmpl	%edi, %r13d
	jge	.L19
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L59:
	cmpl	$7, %edx
	je	.L6
	cmpb	$0, 135(%rsp)
	jne	.L14
	.p2align 4,,10
	.p2align 3
.L6:
	testl	%eax, %eax
	je	.L14
	movl	%eax, 12(%rsp)
.L15:
	addl	$1, %esi
	cmpl	%esi, %r13d
	jge	.L2
	movl	12(%rsp), %eax
	leaq	.LC0(%rip), %rdi
	testl	%eax, %eax
	leaq	.LC1(%rip), %rax
	cmove	%rax, %rdi
	call	puts@PLT
	movq	248(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L60
	addq	$264, %rsp
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
.L60:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE35:
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
