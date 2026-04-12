.file	"temp.c"
	.text
	.p2align 4
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB23:
	.cfi_startproc
	endbr64
	movl	%edi, %edx
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L6:
	cltd
	idivl	%esi
.L3:
	movl	%edx, %eax
	movl	%esi, %edx
	movl	%eax, %esi
.L2:
	cmpl	%esi, %edx
	jl	.L3
	movl	%edx, %eax
	testl	%esi, %esi
	jne	.L6
	ret
	.cfi_endproc
.LFE23:
	.size	gcd, .-gcd
	.p2align 4
	.globl	lcm
	.type	lcm, @function
lcm:
.LFB24:
	.cfi_startproc
	endbr64
	movl	%esi, %r8d
	movl	%edi, %ecx
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L11:
	movl	%ecx, %eax
	cltd
	idivl	%r8d
	movl	%edx, %ecx
.L9:
	movl	%ecx, %edx
	movl	%r8d, %ecx
	movl	%edx, %r8d
.L8:
	cmpl	%r8d, %ecx
	jl	.L9
	testl	%r8d, %r8d
	jne	.L11
	movl	%esi, %eax
	cltd
	idivl	%ecx
	imull	%edi, %eax
	ret
	.cfi_endproc
.LFE24:
	.size	lcm, .-lcm
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$1, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	.LC0(%rip), %rbx
	movq	%rbx, %rdi
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movl	(%rsp), %eax
	leal	-1(%rax), %edx
	movl	%edx, (%rsp)
	testl	%eax, %eax
	je	.L13
	leaq	4(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L17:
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	4(%rsp), %edi
	movl	%r12d, %esi
	movl	%edi, %ecx
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L22:
	movl	%ecx, %eax
	cltd
	idivl	%esi
	movl	%edx, %ecx
.L15:
	movl	%ecx, %edx
	movl	%esi, %ecx
	movl	%edx, %esi
.L14:
	cmpl	%esi, %ecx
	jl	.L15
	testl	%esi, %esi
	jne	.L22
	movl	%r12d, %eax
	cltd
	idivl	%ecx
	movl	%eax, %r12d
	movl	(%rsp), %eax
	imull	%edi, %r12d
	leal	-1(%rax), %edx
	movl	%edx, (%rsp)
	testl	%eax, %eax
	jne	.L17
.L13:
	xorl	%eax, %eax
	movl	%r12d, %edx
	movl	$1, %edi
	leaq	.LC1(%rip), %rsi
	call	__printf_chk@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L23
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L23:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE25:
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