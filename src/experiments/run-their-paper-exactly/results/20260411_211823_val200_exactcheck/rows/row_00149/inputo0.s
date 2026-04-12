```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d"
.LC1:
	.string	"%d %d %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rdx
	movq	%rsp, %rsi
	call	__isoc99_scanf@PLT
	movl	(%rsp), %edi
	testl	%edi, %edi
	js	.L2
	imull	$1000, %edi, %r10d
	movl	4(%rsp), %esi
	movl	%edi, %edx
	xorl	%r9d, %r9d
.L3:
	movl	%r10d, %eax
	xorl	%ecx, %ecx
	testl	%edx, %edx
	jns	.L6
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L4:
	addl	$1, %ecx
	addl	$4000, %eax
	cmpl	%edx, %ecx
	jg	.L7
.L6:
	movl	%edx, %r8d
	subl	%ecx, %r8d
	cmpl	%eax, %esi
	jne	.L4
	movl	%r9d, %edx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L5:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L14
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
	addl	$1, %r9d
	subl	$1, %edx
	addl	$9000, %r10d
	cmpl	%r9d, %edi
	jge	.L3
.L2:
	orl	$-1, %r8d
	orl	$-1, %ecx
	orl	$-1, %edx
	movl	$1, %edi
	leaq	.LC1(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L5
.L14:
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