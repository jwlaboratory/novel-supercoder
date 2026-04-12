.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld"
.LC1:
	.string	"-1"
.LC2:
	.string	"%lld %lld"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	-1597440(%rsp), %r11
	.cfi_def_cfa 11, 1597480
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$3000, %rsp
	.cfi_def_cfa_offset 1600480
	movl	$1600400, %edx
	xorl	%esi, %esi
	leaq	.LC0(%rip), %r13
	movq	%fs:40, %rax
	movq	%rax, 1600424(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rbp
	movq	%rbp, %rdi
	call	memset@PLT
	leaq	8(%rsp), %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movq	8(%rsp), %rcx
	testq	%rcx, %rcx
	jle	.L2
	leaq	24(%rsp), %r12
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%r12, %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	addq	$8, %r12
	call	__isoc99_scanf@PLT
	movq	%rbx, %rax
	movq	8(%rsp), %rcx
	addq	$1, %rbx
	addq	$2, %rax
	cmpq	%rax, %rcx
	jge	.L3
.L2:
	movq	16(%rsp,%rcx,8), %r8
	cmpq	$2, %r8
	jne	.L7
	leal	-1(%rcx), %r9d
	movl	%ecx, %esi
	testl	%r9d, %r9d
	jle	.L11
	movslq	%r9d, %r9
	movl	$1, %eax
	movslq	%ecx, %rcx
	movq	16(%rsp,%r9,8), %rdi
	cqto
	idivq	%rdi
	leaq	1(%rax), %r8
	movq	16(%rsp,%rcx,8), %rax
	imulq	%rdi, %r8
	addq	$1, %rax
	cqto
	idivq	%rdi
	imulq	%rdi, %rax
	movq	%rax, %rcx
	cmpq	%rax, %r8
	jg	.L7
	leal	-2(%rsi), %eax
	movslq	%eax, %rdx
	movl	%eax, %eax
	leaq	0(,%rdx,8), %r10
	salq	$3, %rax
	subq	%rdx, %r9
	leaq	0(%rbp,%r10), %rdi
	subq	%rax, %r10
	addq	%rbp, %r10
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L9:
	movq	(%rdi), %rsi
	leaq	-1(%r8), %rax
	addq	(%rdi,%r9,8), %rcx
	subq	$8, %rdi
	cqto
	idivq	%rsi
	leaq	1(%rax), %r8
	leaq	-1(%rcx), %rax
	cqto
	imulq	%rsi, %r8
	idivq	%rsi
	imulq	%rax, %rsi
	movq	%rsi, %rcx
	cmpq	%rsi, %r8
	jg	.L7
.L8:
	cmpq	%r10, %rdi
	jne	.L9
.L6:
	addq	24(%rsp), %rcx
	movq	%r8, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	subq	$1, %rcx
	leaq	.LC2(%rip), %rsi
	call	__printf_chk@PLT
	jmp	.L5
.L7:
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L5:
	movq	1600424(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L15
	addq	$1600440, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore_state
	movl	$2, %ecx
	jmp	.L6
.L15:
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
