.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d %d"
	.text
	.p2align 4
	.globl	get_int3
	.type	get_int3, @function
get_int3:
.LFB51:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdx, %rcx
	xorl	%eax, %eax
	movq	%rsi, %rdx
	movq	%rdi, %rsi
	leaq	.LC0(%rip), %rdi
	call	__isoc99_scanf@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE51:
	.size	get_int3, .-get_int3
	.section	.rodata.str1.1
.LC1:
	.string	"%d"
	.text
	.p2align 4
	.globl	fget_array
	.type	fget_array, @function
fget_array:
.LFB52:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L9
	leal	-1(%rsi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	4(%rdi,%rax,4), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	.LC1(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	__isoc99_scanf@PLT
	cmpq	%r12, %rbx
	jne	.L6
	popq	%rbx
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE52:
	.size	fget_array, .-fget_array
	.section	.rodata.str1.1
.LC2:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB53:
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
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	20(%rsp), %rcx
	leaq	16(%rsp), %rdx
	leaq	12(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L17
	leaq	arr.0(%rip), %rbx
	leal	-1(%rax), %edx
	leaq	4(%rbx), %rax
	leaq	.LC1(%rip), %rbp
	leaq	(%rax,%rdx,4), %r12
	.p2align 4,,10
	.p2align 3
.L16:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	__isoc99_scanf@PLT
	cmpq	%rbx, %r12
	jne	.L16
	movl	12(%rsp), %eax
.L17:
	movl	20(%rsp), %esi
	cmpl	$1, %eax
	je	.L23
	leal	-1(%rax), %edx
	subl	$2, %eax
	leaq	arr.0(%rip), %rdi
	movslq	%edx, %rdx
	cltq
	movl	(%rdi,%rdx,4), %ecx
	movl	(%rdi,%rax,4), %eax
	subl	%ecx, %eax
	movl	%eax, %edx
	negl	%edx
	cmovs	%eax, %edx
	movl	%ecx, %eax
	subl	%esi, %eax
	movl	%eax, %ecx
	negl	%ecx
	cmovns	%ecx, %eax
	cmpl	%eax, %edx
	cmovl	%eax, %edx
.L18:
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L24
	addq	$32, %rsp
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
.L23:
	.cfi_restore_state
	movl	arr.0(%rip), %eax
	subl	%esi, %eax
	movl	%eax, %edx
	negl	%edx
	cmovs	%eax, %edx
	jmp	.L18
.L24:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE53:
	.size	main, .-main
	.local	arr.0
	.comm	arr.0,8000,32
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
