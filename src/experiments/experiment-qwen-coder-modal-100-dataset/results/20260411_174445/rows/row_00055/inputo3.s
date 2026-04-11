	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	" "
.LC1:
	.string	"%ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$10000000, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$20000008, %rsp
	.cfi_def_cfa_offset 20000032
	movq	stdin(%rip), %rdx
	movq	%rsp, %rdi
	call	fgets
	movl	$.LC0, %esi
	movq	%rsp, %rdi
	call	strtok
	movl	$10, %edx
	leaq	10000000(%rsp), %rsi
	movq	%rax, %rdi
	call	strtoll
	movl	$.LC0, %esi
	xorl	%edi, %edi
	movq	%rax, %rbp
	call	strtok
	movl	$10, %edx
	leaq	10000000(%rsp), %rsi
	movq	%rax, %rdi
	call	strtoll
	movl	$.LC0, %esi
	xorl	%edi, %edi
	movq	%rax, %rbx
	call	strtok
	leaq	10000000(%rsp), %rsi
	movl	$10, %edx
	movq	%rax, %rdi
	call	strtoll
	movq	%rax, %rsi
	leaq	-1(%rbx), %rax
	cmpq	%rsi, %rax
	jg	.L2
	imulq	%rbp, %rax
	cqto
	idivq	%rbx
	movq	%rax, %rsi
.L3:
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	printf
	addq	$20000008, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L2:
	.cfi_restore_state
	movq	%rsi, %rax
	cqto
	idivq	%rbx
	movq	%rax, %rcx
	movq	%rsi, %rax
	imulq	%rbp, %rax
	imulq	%rcx, %rbp
	cqto
	idivq	%rbx
	subq	%rbp, %rax
	movq	%rax, %rsi
	jmp	.L3
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
