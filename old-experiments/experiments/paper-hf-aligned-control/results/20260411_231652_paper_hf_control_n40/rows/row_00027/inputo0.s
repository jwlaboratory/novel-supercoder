```assembly
	.file	"temp.c"
	.text
	.p2align 4
	.globl	size
	.type	size, @function
size:
.LFB29:
	.cfi_startproc
	endbr64
	movl	(%rsi), %edx
	movl	$1, %eax
	cmpl	%edx, (%rdi)
	jg	.L1
	setl	%al
	movzbl	%al, %eax
	negl	%eax
.L1:
	ret
	.cfi_endproc
.LFE29:
	.size	size, .-size
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%[0-9 ^\n]"
.LC2:
	.string	" "
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	.LC0(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%r14, %rdi
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$1456, %rsp
	.cfi_def_cfa_offset 1504
	movq	%fs:40, %rax
	movq	%rax, 1448(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rsi
	call	scanf@PLT
	testl	%eax, %eax
	js	.L8
	leaq	416(%rsp), %rbp
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rdi
	movq	%rbp, %rsi
	call	scanf@PLT
	testl	%eax, %eax
	js	.L8
	leaq	.LC2(%rip), %r12
	movq	%rbp, %rdi
	movl	$1, %ebx
	movq	%r12, %rsi
	leaq	16(%rsp), %r13
	call	strtok@PLT
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %rdi
	call	strtol@PLT
	movl	%eax, 16(%rsp)
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L10:
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, 0(%r13,%rbx,4)
	addq	$1, %rbx
.L9:
	xorl	%edi, %edi
	movq	%r12, %rsi
	movl	%ebx, %ebp
	call	strtok@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L10
	movslq	%ebx, %rbx
	leaq	size(%rip), %rcx
	movl	$4, %edx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	call	qsort@PLT
	cmpl	$1, %ebp
	je	.L18
	movl	12(%rsp), %eax
	subl	$2, %ebp
	leaq	0(%r13,%rbx,4), %rdx
	xorl	%ecx, %ecx
	shrl	%ebp
	xorl	%esi, %esi
	leal	-1(%rax), %r9d
	subl	%ebp, %r9d
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L15:
	movl	-8(%rdx), %ecx
	movl	-4(%rdx), %edi
	leal	(%rsi,%rdi), %r8d
	addl	%ecx, %esi
	cmpl	%ecx, %edi
	movl	$1, %ecx
	cmovl	%r8d, %esi
	subl	$1, %eax
	subq	$8, %rdx
	cmpl	%r9d, %eax
	je	.L24
.L12:
	testl	%eax, %eax
	jg	.L15
	testb	%cl, %cl
	je	.L11
.L24:
	movl	%eax, 12(%rsp)
.L11:
	movq	%r14, %rdi
	xorl	%eax, %eax
	call	printf@PLT
	xorl	%eax, %eax
	jmp	.L5
.L8:
	movl	$1, %eax
.L5:
	movq	1448(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L25
	addq	$1456, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
	xorl	%esi, %esi
	jmp	.L11
.L25:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE28:
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