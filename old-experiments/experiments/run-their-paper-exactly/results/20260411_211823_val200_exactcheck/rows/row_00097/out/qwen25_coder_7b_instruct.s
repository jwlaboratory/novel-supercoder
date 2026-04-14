.file	"temp.c"
	.text
	.p2align 4
	.globl	comp
	.type	comp, @function
comp:
.LFB63:
	.cfi_startproc
	endbr64
	movl	(%rdi), %eax
	subl	(%rsi), %eax
	ret
	.cfi_endproc
.LFE63:
	.size	comp, .-comp
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Yes"
.LC1:
	.string	"No"
.LC2:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB64:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	-77824(%rsp), %r11
	.cfi_def_cfa 11, 77872
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$2208, %rsp
	.cfi_def_cfa_offset 80080
	leaq	.LC2(%rip), %r14
	movq	%r14, %rdi
	movq	%fs:40, %rax
	movq	%rax, 80024(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L12
	leaq	16(%rsp), %rbx
	xorl	%ebp, %ebp
	movq	%rbx, %r12
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%r12, %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	addl	$1, %ebp
	call	__isoc99_scanf@PLT
	movl	12(%rsp), %eax
	addq	$4, %r12
	cmpl	%ebp, %eax
	jg	.L5
	testl	%eax, %eax
	jle	.L12
	leaq	40016(%rsp), %rbp
	xorl	%r12d, %r12d
	movq	%rbp, %r13
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%r13, %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	addl	$1, %r12d
	call	__isoc99_scanf@PLT
	movl	12(%rsp), %eax
	addq	$4, %r13
	cmpl	%r12d, %eax
	jg	.L6
	testl	%eax, %eax
	jle	.L12
	movslq	%eax, %rsi
	xorl	%edx, %edx
	xorl	%r8d, %r8d
	xorl	%edi, %edi
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L20:
	subl	%ecx, %eax
	sarl	%eax
	cltq
	addq	%rax, %rdi
.L9:
	addq	$1, %rdx
	cmpq	%rdx, %rsi
	je	.L19
.L10:
	movl	(%rbx,%rdx,4), %ecx
	movl	0(%rbp,%rdx,4), %eax
	cmpl	%eax, %ecx
	jl	.L20
	jle	.L9
	subl	%eax, %ecx
	addq	$1, %rdx
	movslq	%ecx, %rcx
	addq	%rcx, %r8
	cmpq	%rdx, %rsi
	jne	.L10
.L19:
	leaq	.LC1(%rip), %r9
	cmpq	%rdi, %r8
	jle	.L12
.L11:
	movq	%r9, %rdi
	call	puts@PLT
	movq	80024(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L21
	addq	$80032, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
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
.L12:
	.cfi_restore_state
	leaq	.LC0(%rip), %r9
	jmp	.L11
.L21:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE64:
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
