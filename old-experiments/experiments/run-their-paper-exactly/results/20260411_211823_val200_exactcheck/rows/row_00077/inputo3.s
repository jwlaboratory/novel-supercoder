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
	.string	"%d %d"
.LC1:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
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
	leaq	-397312(%rsp), %r11
	.cfi_def_cfa 11, 397352
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$2744, %rsp
	.cfi_def_cfa_offset 400096
	leaq	.LC0(%rip), %rbx
	movq	%rbx, %rdi
	movq	%fs:40, %rax
	movq	%rax, 400040(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rdx
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movl	4(%rsp), %eax
	addl	$1, %eax
	js	.L7
	cltq
	leaq	16(%rsp), %rbp
	xorl	%esi, %esi
	leaq	4(,%rax,4), %rdx
	movq	%rbp, %rdi
	call	memset@PLT
.L7:
	movl	(%rsp), %eax
	xorl	%r13d, %r13d
	leaq	12(%rsp), %r12
	leaq	8(%rsp), %rbp
	testl	%eax, %eax
	jle	.L6
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	8(%rsp), %edi
	movl	12(%rsp), %r8d
	movl	$1, %esi
	movl	%edi, %eax
	movl	%r8d, %ecx
	cltd
	idivl	%r8d
	testl	%eax, %eax
	cmovg	%eax, %esi
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L14:
	movl	%edi, %eax
	cltd
	idivl	%ecx
	movl	$1, %edx
	testl	%eax, %eax
	cmovle	%edx, %eax
	cmpl	%eax, %esi
	sete	%sil
	movzbl	%sil, %esi
	addl	%eax, %esi
.L10:
	movl	%r8d, %eax
	cltd
	idivl	%esi
	leal	1(%rcx), %edx
	cmpl	%ecx, %eax
	leal	1(%rax), %r9d
	leal	-1(%rsi,%rdi), %eax
	cmovl	%r9d, %edx
	movslq	%edx, %rdx
	subl	$1, 16(%rsp,%rdx,4)
	cltd
	idivl	%esi
	movslq	%eax, %rdx
	leal	-1(%rax), %ecx
	addl	$1, 16(%rsp,%rdx,4)
	testl	%ecx, %ecx
	jg	.L14
	addl	$1, %r13d
	cmpl	%r13d, (%rsp)
	jg	.L5
.L6:
	movl	4(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L9
	subl	$1, %ecx
	movl	16(%rsp), %edx
	leaq	20(%rsp), %rax
	leaq	24(%rsp,%rcx,4), %rcx
	.p2align 4,,10
	.p2align 3
.L15:
	addl	(%rax), %edx
	addq	$4, %rax
	movl	%edx, -4(%rax)
	cmpq	%rax, %rcx
	jne	.L15
	movl	$1, %ebx
	leaq	16(%rsp), %rbp
	leaq	.LC1(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L16:
	movl	0(%rbp,%rbx,4), %edx
	movq	%r12, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	__printf_chk@PLT
	cmpl	%ebx, 4(%rsp)
	jge	.L16
.L9:
	movq	400040(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L25
	addq	$400056, %rsp
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
.L25:
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