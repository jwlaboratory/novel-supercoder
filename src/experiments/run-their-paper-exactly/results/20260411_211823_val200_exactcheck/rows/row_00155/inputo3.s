.file	"temp.c"
	.text
	.p2align 4
	.globl	max
	.type	max, @function
max:
.LFB23:
	.cfi_startproc
	endbr64
	cmpl	%esi, %edi
	movl	%esi, %eax
	cmovge	%edi, %eax
	ret
	.cfi_endproc
.LFE23:
	.size	max, .-max
	.p2align 4
	.globl	amax
	.type	amax, @function
amax:
.LFB24:
	.cfi_startproc
	endbr64
	cmpl	%edx, %esi
	movl	%edi, %eax
	cmovl	%edx, %esi
	cmpl	%edi, %esi
	cmovge	%esi, %eax
	ret
	.cfi_endproc
.LFE24:
	.size	amax, .-amax
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d %d"
.LC1:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	endbr64
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	20(%rsp), %rcx
	leaq	16(%rsp), %rdx
	leaq	12(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movl	20(%rsp), %ecx
	movl	16(%rsp), %eax
	movl	12(%rsp), %esi
	leal	(%rax,%rax,4), %edi
	leal	(%rcx,%rcx,4), %edx
	leal	(%rsi,%rdx,2), %edx
	leal	(%rsi,%rdi,2), %edi
	addl	%eax, %edx
	addl	%ecx, %edi
	leal	(%rsi,%rsi,4), %esi
	cmpl	%edi, %edx
	leal	(%rax,%rsi,2), %eax
	leaq	.LC1(%rip), %rsi
	cmovl	%edi, %edx
	addl	%ecx, %eax
	movl	$1, %edi
	cmpl	%eax, %edx
	cmovl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE25:
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