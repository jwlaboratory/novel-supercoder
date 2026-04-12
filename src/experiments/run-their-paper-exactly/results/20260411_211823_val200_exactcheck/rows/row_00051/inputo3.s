.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	" "
.LC4:
	.string	"Yes"
.LC5:
	.string	"No"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$128, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	.LC3(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$208, %rsp
	.cfi_def_cfa_offset 240
	movdqa	.LC0(%rip), %xmm0
	movq	stdin(%rip), %rdx
	movq	%fs:40, %rax
	movq	%rax, 200(%rsp)
	xorl	%eax, %eax
	leaq	64(%rsp), %r12
	movl	$1, 48(%rsp)
	movaps	%xmm0, (%rsp)
	movdqa	.LC1(%rip), %xmm0
	movq	%r12, %rdi
	movaps	%xmm0, 16(%rsp)
	movdqa	.LC2(%rip), %xmm0
	movaps	%xmm0, 32(%rsp)
	call	fgets@PLT
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	strtok@PLT
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %rdi
	call	strtol@PLT
	movq	%rbp, %rsi
	xorl	%edi, %edi
	movq	%rax, %rbx
	call	strtok@PLT
	movl	$10, %edx
	xorl	%esi, %esi
	movslq	%ebx, %rbx
	movq	%rax, %rdi
	call	strtol@PLT
	cltq
	movl	(%rsp,%rax,4), %eax
	cmpl	%eax, (%rsp,%rbx,4)
	je	.L7
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
.L3:
	movq	200(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L8
	addq	$208, %rsp
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
.L7:
	.cfi_restore_state
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L3
.L8:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	3
	.long	1
	.align 16
.LC1:
	.long	2
	.long	1
	.long	2
	.long	1
	.align 16
.LC2:
	.long	1
	.long	2
	.long	1
	.long	2
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