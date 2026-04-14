.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"Yes"
.LC2:
	.string	"No"
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
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	leaq	-60(%rbp), %rsi
	pushq	%r13
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	leaq	.LC0(%rip), %r13
	pushq	%r12
	movq	%r13, %rdi
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	-60(%rbp), %ecx
	movq	%rsp, %rsi
	leal	1(%rcx), %eax
	cltq
	leaq	15(,%rax,4), %rax
	movq	%rax, %rdx
	andq	$-4096, %rax
	subq	%rax, %rsi
	andq	$-16, %rdx
	cmpq	%rsi, %rsp
	je	.L3
.L23:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rsi, %rsp
	jne	.L23
.L3:
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	jne	.L24
.L4:
	movq	%rsp, %r14
	testl	%ecx, %ecx
	jle	.L5
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	xorl	%r15d, %r15d
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%r14, %rsi
	xorl	%eax, %eax
	movq	%r13, %rdi
	call	__isoc99_scanf@PLT
	movl	(%r14), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	leal	(%rax,%rcx), %edx
	andl	$1, %edx
	subl	%ecx, %edx
	movl	-60(%rbp), %ecx
	cmpl	$1, %edx
	sete	%dl
	andl	$3, %eax
	movzbl	%dl, %edx
	addl	%edx, %r12d
	cmpl	$1, %eax
	adcl	$0, %ebx
	addl	$1, %r15d
	addq	$4, %r14
	cmpl	%r15d, %ecx
	jg	.L8
	leal	-1(%r12), %eax
	cmpl	%ebx, %eax
	jle	.L25
.L9:
	cmpl	%ebx, %r12d
	jg	.L11
.L5:
	andb	$1, %cl
	jne	.L11
.L12:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
.L10:
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L26
	leaq	-40(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L11:
	.cfi_restore_state
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	jmp	.L10
.L25:
	movl	%ecx, %eax
	movl	$2, %esi
	cltd
	idivl	%esi
	subl	$1, %edx
	jne	.L9
	jmp	.L12
.L24:
	orq	$0, -8(%rsp,%rdx)
	jmp	.L4
.L26:
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
