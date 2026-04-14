.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d %d %d"
.LC1:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC0(%rip), %rdi
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rdx
	leaq	16(%rsp), %rcx
	leaq	8(%rsp), %rsi
	leaq	20(%rsp), %r8
	call	__isoc99_scanf@PLT
	movl	20(%rsp), %edx
	leal	-1(%rdx), %eax
	testl	%edx, %edx
	movl	8(%rsp), %edx
	movl	%eax, 20(%rsp)
	je	.L24
	movl	12(%rsp), %ebx
	movl	16(%rsp), %r10d
	movl	%edx, %edi
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	xorl	%r11d, %r11d
	movl	%ebx, %ecx
	movl	%r10d, %esi
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L26:
	cmpl	%esi, %edi
	jl	.L4
	addl	%edi, %edi
	movl	$1, %r11d
.L5:
	subl	$1, %eax
	jb	.L25
.L7:
	cmpl	%ecx, %edi
	jge	.L26
.L4:
	cmpl	%esi, %ecx
	jl	.L6
	addl	%ecx, %ecx
	movl	$1, %r9d
	subl	$1, %eax
	jnb	.L7
.L25:
	movl	$-1, 20(%rsp)
	testb	%r8b, %r8b
	je	.L8
	movl	%esi, 16(%rsp)
	movl	%esi, %r10d
.L8:
	testb	%r9b, %r9b
	je	.L9
	movl	%ecx, 12(%rsp)
	movl	%ecx, %ebx
.L9:
	testb	%r11b, %r11b
	je	.L3
	movl	%edi, 8(%rsp)
	movl	%edi, %edx
.L3:
	addl	%ebx, %edx
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	addl	%r10d, %edx
	call	__printf_chk@PLT
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L27
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
	addl	%esi, %esi
	movl	$1, %r8d
	jmp	.L5
.L24:
	movl	12(%rsp), %ebx
	movl	16(%rsp), %r10d
	jmp	.L3
.L27:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
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