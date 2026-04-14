.file	"inputC.c"
	.text
	.globl	top
	.bss
	.align 4
	.type	top, @object
	.size	top, 4
top:
	.zero	4
	.globl	S
	.align 32
	.type	S, @object
	.size	S, 4000
S:
	.zero	4000
	.text
	.globl	push
	.type	push, @function
push:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	top(%rip), %eax
	addl	$1, %eax
	movl	%eax, top(%rip)
	movl	top(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	S(%rip), %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	push, .-push
	.globl	pop
	.type	pop, @function
pop:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	top(%rip), %eax
	subl	$1, %eax
	movl	%eax, top(%rip)
	movl	top(%rip), %eax
	addl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	S(%rip), %rax
	movl	(%rdx,%rax), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	pop, .-pop
	.section	.rodata
.LC0:
	.string	"%s"
.LC1:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, top(%rip)
.L5:
	movzbl	-112(%rbp), %eax
	cmpb	$43, %al
	je	.L6
	cmpb	$45, %al
	je	.L7
	cmpb	$42, %al
	je	.L8
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %edi
	call	push
	jmp	.L5
.L6:
	call	pop
	movl	%eax, -120(%rbp)
	call	pop
	movl	%eax, -116(%rbp)
	movl	-120(%rbp), %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %edi
	call	push
	jmp	.L5
.L7:
	call	pop
	movl	%eax, -116(%rbp)
	call	pop
	movl	%eax, -120(%rbp)
	movl	-120(%rbp), %eax
	subl	-116(%rbp), %eax
	movl	%eax, %edi
	call	push
	jmp	.L5
.L8:
	call	pop
	movl	%eax, -120(%rbp)
	call	pop
	movl	%eax, -116(%rbp)
	movl	-120(%rbp), %eax
	imull	-116(%rbp), %eax
	movl	%eax, %edi
	call	push
	jmp	.L5
.L9:
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$-1, %eax
	jne	.L5
	call	pop
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
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
