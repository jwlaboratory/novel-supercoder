```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"1"
.LC1:
	.string	"0"
.LC2:
	.string	"%d"
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
	leaq	.LC2(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%r13, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movl	(%rsp), %eax
	testl	%eax, %eax
	jle	.L2
	leaq	a(%rip), %rbp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbp, %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf@PLT
	addq	$4, %rbp
	cmpl	%ebx, (%rsp)
	jg	.L3
.L2:
	leaq	4(%rsp), %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	4(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L10
	leaq	b(%rip), %r12
	xorl	%ebx, %ebx
	movq	%r12, %rbp
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rbp, %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf@PLT
	movl	4(%rsp), %ecx
	addq	$4, %rbp
	cmpl	%ebx, %ecx
	jg	.L5
	movl	(%rsp), %r8d
	testl	%ecx, %ecx
	jle	.L10
	testl	%r8d, %r8d
	jle	.L10
	movl	$1, %edx
	xorl	%eax, %eax
	leaq	-4+a(%rip), %r9
	.p2align 4,,10
	.p2align 3
.L6:
	movslq	%eax, %rsi
	movl	(%r12,%rsi,4), %ebx
	xorl	%esi, %esi
	cmpl	%ebx, (%r9,%rdx,4)
	sete	%sil
	addl	%esi, %eax
	cmpl	%edx, %r8d
	setg	%dil
	cmpl	%eax, %ecx
	setg	%sil
	addq	$1, %rdx
	testb	%sil, %dil
	jne	.L6
.L4:
	cmpl	%eax, %ecx
	leaq	.LC0(%rip), %rdi
	leaq	.LC1(%rip), %rax
	cmovne	%rax, %rdi
	call	puts@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L23
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
	xorl	%eax, %eax
	jmp	.L4
.L23:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	b
	.bss
	.align 32
	.type	b, @object
	.size	b, 800000
b:
	.zero	800000
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 800000
a:
	.zero	800000
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