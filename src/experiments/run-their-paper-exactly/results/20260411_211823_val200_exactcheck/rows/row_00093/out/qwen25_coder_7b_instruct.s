.file	"temp.c"
	.text
	.p2align 4
	.globl	popcnt64
	.type	popcnt64, @function
popcnt64:
.LFB0:
	.cfi_startproc
	endbr64
	movabsq	$6148914691236517205, %rdx
	movq	%rdi, %rax
	movabsq	$1085102592571150095, %rcx
	shrq	%rax
	andq	%rdx, %rdi
	andq	%rdx, %rax
	movabsq	$3689348814741910323, %rdx
	addq	%rax, %rdi
	movq	%rdi, %rax
	andq	%rdx, %rdi
	shrq	$2, %rax
	andq	%rdx, %rax
	addq	%rdi, %rax
	movq	%rax, %rdx
	andq	%rcx, %rax
	shrq	$4, %rdx
	andq	%rcx, %rax
	movabsq	$71777214294589695, %rcx
	addq	%rdx, %rax
	movq	%rax, %rdx
	andq	%rcx, %rax
	shrq	$8, %rdx
	andq	%rcx, %rax
	movabsq	$281470681808895, %rcx
	addq	%rdx, %rax
	movq	%rax, %rdx
	andq	%rcx, %rax
	shrq	$16, %rdx
	andq	%rcx, %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	movl	%edx, %edx
	shrq	$32, %rax
	addq	%rdx, %rax
	ret
	.cfi_endproc
.LFE0:
	.size	popcnt64, .-popcnt64
	.p2align 4
	.globl	clz64
	.type	clz64, @function
clz64:
.LFB1:
	.cfi_startproc
	endbr64
	movabsq	$6148914691236517205, %rcx
	movq	%rdi, %rax
	shrq	%rax
	orq	%rdi, %rax
	movq	%rax, %rdx
	shrq	$2, %rdx
	orq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$4, %rax
	orq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$8, %rdx
	orq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$16, %rax
	orq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$32, %rdx
	orq	%rax, %rdx
	movq	%rdx, %rax
	andq	%rcx, %rdx
	shrq	%rax
	andq	%rcx, %rax
	movabsq	$3689348814741910323, %rcx
	addq	%rdx, %rax
	movq	%rax, %rdx
	andq	%rcx, %rax
	shrq	$2, %rdx
	andq	%rcx, %rax
	movabsq	$1085102592571150095, %rcx
	addq	%rdx, %rax
	movq	%rax, %rdx
	andq	%rcx, %rax
	shrq	$4, %rdx
	andq	%rcx, %rax
	movabsq	$71777214294589695, %rcx
	addq	%rdx, %rax
	movq	%rax, %rdx
	andq	%rcx, %rax
	shrq	$8, %rdx
	andq	%rcx, %rax
	movabsq	$281470681808895, %rcx
	addq	%rdx, %rax
	movq	%rdx, %rax
	andq	%rcx, %rax
	shrq	$16, %rdx
	andq	%rcx, %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	movl	%eax, %eax
	shrq	$32, %rdx
	addq	%rax, %rdx
	movl	$64, %eax
	subq	%rdx, %rax
	ret
	.cfi_endproc
.LFE1:
	.size	clz64, .-clz64
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lld"
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movq	(%rsp), %rdi
	leaq	.LC1(%rip), %rsi
	call	clz64
	movl	$64, %edx
	movl	$1, %edi
	subq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L7
	xorl	%eax, %eax
	addq	$24, %rsp
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
