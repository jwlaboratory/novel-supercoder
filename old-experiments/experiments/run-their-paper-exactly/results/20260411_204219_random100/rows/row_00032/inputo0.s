```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d"
.LC1:
	.string	"NO"
.LC2:
	.string	"YES"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	-397312(%rsp), %r11
	.cfi_def_cfa 11, 397352
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$2744, %rsp
	.cfi_def_cfa_offset 400096
	leaq	.LC0(%rip), %rbx
	movq	%rbx, %rdi
	movq	%fs:40, %rax
	movq	%rax, 400040(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rdx
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movslq	(%rsp), %rdx
	testl	%edx, %edx
	jle	.L2
	salq	$2, %rdx
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	call	memset@PLT
.L2:
	movl	4(%rsp), %eax
	testl	%eax, %eax
	jle	.L3
	xorl	%r13d, %r13d
	leaq	12(%rsp), %r12
	leaq	8(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	8(%rsp), %eax
	addl	$1, %r13d
	subl	$1, %eax
	cltq
	addl	$1, 16(%rsp,%rax,4)
	movl	12(%rsp), %eax
	subl	$1, %eax
	cltq
	addl	$1, 16(%rsp,%rax,4)
	cmpl	%r13d, 4(%rsp)
	jg	.L4
.L3:
	movl	(%rsp), %eax
	testl	%eax, %eax
	jle	.L5
	subl	$1, %eax
	leaq	16(%rsp), %rdx
	leaq	20(%rsp,%rax,4), %rsi
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L6:
	addq	$4, %rdx
	cmpq	%rsi, %rdx
	je	.L5
.L8:
	movl	(%rdx), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	andl	$1, %eax
	subl	%ecx, %eax
	cmpl	$1, %eax
	jne	.L6
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	jmp	.L7
.L5:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
.L7:
	movq	400040(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L14
	addq	$400056, %rsp
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
.L14:
	.cfi_restore_state
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
```