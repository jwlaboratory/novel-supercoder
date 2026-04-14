	.file	"inputC.c"
	.text
	.globl	top
	.bss
	.align 4
	.type	top, @object
	.size	top, 4
top:
	.zero	4
	.globl	stac
	.align 32
	.type	stac, @object
	.size	stac, 404
stac:
	.zero	404
	.globl	s
	.align 32
	.type	s, @object
	.size	s, 100
s:
	.zero	100
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
	leaq	stac(%rip), %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
	nop
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
	leaq	stac(%rip), %rax
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
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	jmp	.L5
.L9:
	movzbl	s(%rip), %eax
	cmpb	$43, %al
	jne	.L6
	movl	$0, %eax
	call	pop
	movl	%eax, %ebx
	movl	$0, %eax
	call	pop
	addl	%ebx, %eax
	movl	%eax, %edi
	call	push
	jmp	.L5
.L6:
	movzbl	s(%rip), %eax
	cmpb	$45, %al
	jne	.L7
	movl	$0, %eax
	call	pop
	movl	%eax, -24(%rbp)
	movl	$0, %eax
	call	pop
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	subl	-24(%rbp), %eax
	movl	%eax, %edi
	call	push
	jmp	.L5
.L7:
	movzbl	s(%rip), %eax
	cmpb	$42, %al
	jne	.L8
	movl	$0, %eax
	call	pop
	movl	%eax, %ebx
	movl	$0, %eax
	call	pop
	imull	%ebx, %eax
	movl	%eax, %edi
	call	push
	jmp	.L5
.L8:
	leaq	s(%rip), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, %edi
	call	push
.L5:
	leaq	s(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$-1, %eax
	jne	.L9
	movl	$0, %eax
	call	pop
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rbx
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
