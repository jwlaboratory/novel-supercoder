.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%ld %ld"
.LC1:
	.string	"%ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rdx
	leaq	8(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movq	16(%rsp), %rcx
	movq	8(%rsp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdx
	negq	%rsi
	cmovs	%rcx, %rsi
	negq	%rdx
	cmovs	%rax, %rdx
	cmpq	%rdx, %rsi
	jl	.L2
	testq	%rax, %rax
	js	.L3
	testq	%rcx, %rcx
	js	.L4
	subq	%rax, %rcx
	movq	%rcx, %rdx
	jmp	.L5
.L2:
	testq	%rax, %rax
	js	.L7
	testq	%rcx, %rcx
	jle	.L8
.L14:
	leaq	2(%rax), %rdx
	subq	%rcx, %rdx
.L5:
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L17
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	testq	%rcx, %rcx
	js	.L14
.L15:
	leaq	1(%rcx,%rax), %rdx
	jmp	.L5
.L8:
	leaq	1(%rax), %rdx
	je	.L5
	jmp	.L15
.L4:
	movl	$1, %edx
	subq	%rax, %rdx
	subq	%rcx, %rdx
	jmp	.L5
.L7:
	movq	%rcx, %rdx
	subq	%rax, %rdx
	testq	%rcx, %rcx
	jle	.L5
	movl	$1, %edx
	subq	%rcx, %rdx
	subq	%rax, %rdx
	jmp	.L5
.L17:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
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