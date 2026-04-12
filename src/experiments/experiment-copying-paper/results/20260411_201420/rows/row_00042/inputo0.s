```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld %lld"
.LC1:
	.string	"%lld"
.LC2:
	.string	"%lld\n"
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
	leaq	.LC0(%rip), %rdi
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	leaq	-48(%rbp), %rdx
	leaq	-56(%rbp), %rsi
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movq	-56(%rbp), %rcx
	movq	%rsp, %rsi
	leaq	15(,%rcx,8), %rax
	movq	%rax, %rdx
	andq	$-4096, %rax
	subq	%rax, %rsi
	andq	$-16, %rdx
	cmpq	%rsi, %rsp
	je	.L3
.L20:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rsi, %rsp
	jne	.L20
.L3:
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	jne	.L21
.L4:
	movq	%rsp, %r13
	testq	%rcx, %rcx
	jle	.L12
	movq	%r13, %r12
	xorl	%ebx, %ebx
	leaq	.LC1(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%r12, %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	__isoc99_scanf@PLT
	movq	-56(%rbp), %rax
	addq	$8, %r12
	cmpq	%rbx, %rax
	jg	.L6
	cmpq	$1, %rax
	jle	.L12
	movq	-48(%rbp), %rdi
	leaq	8(%r13), %rdx
	leaq	0(%r13,%rax,8), %r10
	xorl	%r8d, %r8d
	movl	%edi, %r9d
	.p2align 4,,10
	.p2align 3
.L9:
	movq	-8(%rdx), %rax
	movq	(%rdx), %rcx
	leaq	(%rax,%rcx), %rsi
	cmpq	%rdi, %rsi
	jle	.L7
	addl	%ecx, %eax
	subl	%r9d, %eax
	cltq
	subq	%rax, %rcx
	addq	%rax, %r8
	xorl	%eax, %eax
	testq	%rcx, %rcx
	cmovs	%rax, %rcx
	movq	%rcx, (%rdx)
.L7:
	addq	$8, %rdx
	cmpq	%rdx, %r10
	jne	.L9
.L5:
	xorl	%eax, %eax
	movq	%r8, %rdx
	movl	$1, %edi
	leaq	.LC2(%rip), %rsi
	call	__printf_chk@PLT
	movq	-40(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L22
	leaq	-32(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L21:
	.cfi_restore_state
	orq	$0, -8(%rsp,%rdx)
	jmp	.L4
.L12:
	xorl	%r8d, %r8d
	jmp	.L5
.L22:
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