```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d"
.LC1:
	.string	"%d"
.LC2:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	.LC0(%rip), %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$4032, %rsp
	.cfi_def_cfa_offset 4064
	movq	%fs:40, %rax
	movq	%rax, 4024(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rdx
	leaq	8(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movl	8(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.L2
	leaq	16(%rsp), %rbp
	xorl	%ebx, %ebx
	leaq	.LC1(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbp, %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf@PLT
	movl	8(%rsp), %r8d
	addq	$4, %rbp
	cmpl	%ebx, %r8d
	jg	.L3
.L2:
	movl	%r8d, %eax
	movl	12(%rsp), %ebx
	cltd
	idivl	%ebx
	testl	%edx, %edx
	je	.L11
	leal	(%r8,%r8), %esi
	.p2align 4,,10
	.p2align 3
.L5:
	movl	%esi, %ecx
	addl	%r8d, %esi
	movl	%ecx, %eax
	cltd
	idivl	%ebx
	testl	%edx, %edx
	jne	.L5
.L4:
	movl	%ecx, %eax
	movl	16(%rsp), %esi
	cltd
	idivl	%ebx
	testl	%eax, %eax
	jle	.L12
	leal	1(%rax), %r11d
	movl	%ebx, %r9d
	xorl	%r10d, %r10d
	xorl	%ecx, %ecx
	movl	$1, %ebp
	.p2align 4,,10
	.p2align 3
.L7:
	movl	%esi, %eax
	movl	%esi, %edi
	movl	%esi, %edx
	cmpl	%ecx, %r9d
	jle	.L9
	.p2align 4,,10
	.p2align 3
.L8:
	cmpl	%eax, %esi
	cmovg	%eax, %esi
	cmpl	%eax, %edi
	cmovl	%eax, %edi
	addl	$1, %ecx
	movl	%ecx, %eax
	cltd
	idivl	%r8d
	movslq	%edx, %rdx
	movl	16(%rsp,%rdx,4), %eax
	cmpl	%r9d, %ecx
	jne	.L8
	movl	%esi, %edx
	movl	%eax, %esi
.L9:
	addl	%edi, %r10d
	addl	$1, %ebp
	addl	%ebx, %r9d
	subl	%edx, %r10d
	cmpl	%r11d, %ebp
	jne	.L7
.L6:
	xorl	%eax, %eax
	movl	%r10d, %edx
	movl	$1, %edi
	leaq	.LC2(%rip), %rsi
	call	__printf_chk@PLT
	movq	4024(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L20
	addq	$4032, %rsp
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
.L11:
	.cfi_restore_state
	movl	%r8d, %ecx
	jmp	.L4
.L12:
	xorl	%r10d, %r10d
	jmp	.L6
.L20:
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