.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"YES"
.LC1:
	.string	"NO"
.LC2:
	.string	"%d%d%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%eax, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	xorl	%ebx, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movl	%edi, 12(%rsp)
	leaq	4(%rsp), %rcx
	leaq	.LC2(%rip), %rdi
	movl	%esi, 8(%rsp)
	leaq	12(%rsp), %rsi
	movl	%edx, 4(%rsp)
	leaq	8(%rsp), %rdx
	call	scanf@PLT
	movl	4(%rsp), %eax
	movl	8(%rsp), %ecx
	movl	12(%rsp), %edx
	movl	%eax, i(%rip)
	movl	%ecx, s(%rip)
.L2:
	leal	1(%rdi), %eax
	movl	%edx, %ecx
	movl	%eax, %r10d
	imull	%ecx, %r10d
	cmpq	%rdx, %r10d
	jle	.L4
	movl	%eax, i(%rip)
	testb	%bl, %bl
	je	.L7
	movl	%eax, s(%rip)
.L5:
	testl	%r10d, %r10d
	leaq	.LC1(%rip), %rax
	leaq	.LC0(%rip), %rdi
	cmove	%rax, %rdi
	call	puts@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L4:
	leal	1(%rdi), %eax
	movl	%edx, %ecx
	movl	%eax, %r10d
	imull	%ecx, %r10d
	cmpq	%rdx, %r10d
	jle	.L4
	movl	%eax, i(%rip)
	testb	%bl, %bl
	je	.L7
	movl	%eax, s(%rip)
.L5:
	testl	%r10d, %r10d
	leaq	.LC1(%rip), %rax
	leaq	.LC0(%rip), %rdi
	cmove	%rax, %rdi
	call	puts@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L7:
	movl	%eax, i(%rip)
	jmp	.L5
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	i
	.bss
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	s
	.align 4
	.type	s, @object
	.size	s, 4
s:
	.zero	4
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
