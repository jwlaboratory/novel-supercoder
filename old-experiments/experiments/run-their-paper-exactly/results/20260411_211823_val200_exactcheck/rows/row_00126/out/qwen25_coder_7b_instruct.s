.file	"temp.c"
	.text
	.p2align 4
	.globl	compare_int
	.type	compare_int, @function
compare_int:
.LFB39:
	.cfi_startproc
	endbr64
	movl	(%rdi), %eax
	subl	(%rsi), %eax
	ret
	.cfi_endproc
.LFE39:
	.size	compare_int, .-compare_int
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d"
.LC1:
	.string	"%d"
.LC2:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$50, %ecx
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$440, %rsp
	.cfi_def_cfa_offset 480
	movq	%fs:40, %rax
	movq	%rax, 424(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rbp
	leaq	8(%rsp), %rsi
	movq	%rbp, %rdi
	leaq	12(%rsp), %rdx
	rep stosq
	leaq	.LC0(%rip), %rdi
	call	__isoc99_scanf@PLT
	movslq	8(%rsp), %rsi
	testl	%esi, %esi
	jle	.L12
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	leaq	.LC1(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L5:
	leaq	0(%rbp,%rbx,4), %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movslq	0(%rbp,%rbx,4), %rax
	movslq	8(%rsp), %rsi
	addq	$1, %rbx
	addq	%rax, %r12
	cmpl	%ebx, %esi
	jg	.L5
.L4:
	movslq	12(%rsp), %rax
	cmpq	%r12, %rax
	jg	.L16
	leaq	compare_int(%rip), %rcx
	movl	$4, %edx
	movq	%rbp, %rdi
	call	qsort@PLT
	movslq	8(%rsp), %rsi
	testl	%esi, %esi
	jle	.L7
	movl	12(%rsp), %ecx
	xorl	%eax, %eax
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L17:
	addq	$1, %rax
	cmpq	%rax, %rsi
	je	.L7
.L9:
	subl	0(%rbp,%rax,4), %ecx
	movl	%eax, %edx
	testl	%ecx, %ecx
	jg	.L17
	movl	%ecx, 12(%rsp)
	jne	.L10
	addl	$1, %edx
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L7:
	movq	424(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L18
	addq	$440, %rsp
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
.L16:
	.cfi_restore_state
	leal	-1(%rsi), %edx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rsi
	call	__printf_chk@PLT
	jmp	.L7
.L10:
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L7
.L12:
	xorl	%r12d, %r12d
	jmp	.L4
.L18:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE40:
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
