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
	movl	%ecx, b(%rip)
	movl	%edx, c(%rip)
	movl	$0, s(%rip)
	movl	$1, i(%rip)
.L2:
	cmpl	%i(%rip), %ebx
	jae	.L12
	movl	%i(%rip), %eax
	mulq	%rcx
	movl	%edx, %eax
	subl	%c(%rip), %eax
	cmovz	%eax, s(%rip)
	incq	%i(%rip)
	jmp	.L2
.L12:
	movl	$s(%rip), %eax
	testl	%eax, %eax
	je	.L7
	movl	$i(%rip), %ebx
.L5:
	testl	%ebx, %ebx
	je	.L7
	movl	$1, %eax
	cmovne	%eax, %ebx
	jmp	.L5
.L7:
	movl	$0, %eax
	cmpl	$0, s(%rip)
	cmovne	%eax, %ebx
	leaq	.LC1(%rip), %rdi
	cmovne	%rdi, %rsi
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
	.globl	b
	.bss
	.align 4
	.type	b, @object
	.size	b, 4
b:
	.zero	4
	.globl	c
	.bss
	.align 4
	.type	c, @object
	.size	c, 4
c:
	.zero	4
	.globl	s
	.bss
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
