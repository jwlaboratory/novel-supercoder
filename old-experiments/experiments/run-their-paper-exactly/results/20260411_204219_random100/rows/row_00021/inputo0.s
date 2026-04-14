```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d "
.LC1:
	.string	"%d"
.LC2:
	.string	"%d\n%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	n(%rip), %rsi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$1, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	.LC0(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rbp, %rdi
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	leaq	4(%rsp), %rsi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	n(%rip), %ecx
	cmpl	$1, %ecx
	jle	.L2
	movl	$1, %ebx
	movq	%rsp, %r13
	leaq	.LC1(%rip), %rbp
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%eax, %eax
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	__isoc99_scanf@PLT
	movl	(%rsp), %eax
	xorl	%edx, %edx
	movl	n(%rip), %ecx
	cmpl	4(%rsp), %eax
	setle	%dl
	addl	$1, %ebx
	movl	%eax, 4(%rsp)
	addl	%edx, %r12d
	cmpl	%ebx, %ecx
	jg	.L4
.L2:
	xorl	%eax, %eax
	movl	%r12d, %edx
	movl	$1, %edi
	leaq	.LC2(%rip), %rsi
	call	__printf_chk@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L10
	addq	$24, %rsp
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
.L10:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	n
	.bss
	.align 4
	.type	n, @object
	.size	n, 4
n:
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
```