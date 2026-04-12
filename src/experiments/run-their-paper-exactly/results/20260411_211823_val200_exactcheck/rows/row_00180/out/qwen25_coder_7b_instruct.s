.file	"temp.c"
	.text
	.p2align 4
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB39:
	.cfi_startproc
	endbr64
	movl	(%rdi), %eax
	subl	(%rsi), %eax
	ret
	.cfi_endproc
.LFE39:
	.size	cmp, .-cmp
	.p2align 4
	.globl	fun
	.type	fun, @function
fun:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leal	(%rsi,%rsi), %r12d
	leaq	cmp(%rip), %rcx
	movl	$4, %edx
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movslq	%r12d, %rbx
	movq	%rbx, %rsi
	call	qsort@PLT
	testl	%r12d, %r12d
	jle	.L7
	xorl	%eax, %eax
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L6:
	testb	$1, %al
	jne	.L5
	addl	0(%rbp,%rax,4), %r8d
.L5:
	addq	$1, %rax
	cmpq	%rbx, %rax
	jne	.L6
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%r8d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
	xorl	%r8d, %r8d
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movl	%r8d, %eax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	fun, .-fun
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	.LC0(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%r12, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xorl	%ebx, %ebx
	subq	$840, %rsp
	.cfi_def_cfa_offset 880
	movq	%fs:40, %rax
	movq	%rax, 824(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rsi
	leaq	16(%rsp), %r13
	movq	%r13, %rbp
	call	__isoc99_scanf@PLT
	movl	12(%rsp), %esi
	testl	%esi, %esi
	jle	.L11
	.p2align 4,,10
	.p2align 3
.L12:
	movq	%rbp, %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf@PLT
	movl	12(%rsp), %esi
	addq	$4, %rbp
	leal	(%rsi,%rsi), %eax
	cmpl	%ebx, %eax
	jg	.L12
.L11:
	movq	%r13, %rdi
	call	fun
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	824(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L18
	addq	$840, %rsp
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
.L18:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
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
