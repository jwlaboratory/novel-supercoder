.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s"
.LC1:
	.string	"-1"
.LC2:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	-196608(%rsp), %r11
	.cfi_def_cfa 11, 196624
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$3408, %rsp
	.cfi_def_cfa_offset 200032
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 200008(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbp
	movq	%rbp, %rsi
	call	__isoc99_scanf@PLT
	movq	%rbp, %rdi
	call	strlen@PLT
	testl	%eax, %eax
	je	.L11
	leal	-1(%rax), %edx
	xorl	%r8d, %r8d
	xorl	%eax, %eax
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L3:
	cmpb	$120, %sil
	je	.L18
	cmpb	%sil, %cl
	jne	.L7
.L4:
	addl	$1, %eax
	subl	$1, %edx
.L5:
	cmpl	%eax, %edx
	jl	.L2
.L9:
	movslq	%eax, %rcx
	movslq	%edx, %rsi
	movzbl	(%rsp,%rcx), %ecx
	movzbl	(%rsp,%rsi), %esi
	cmpb	$120, %cl
	jne	.L3
	cmpb	$120, %sil
	je	.L4
	addl	$1, %eax
	addl	$1, %r8d
	cmpl	%eax, %edx
	jge	.L9
.L2:
	movl	%r8d, %edx
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L8:
	movq	200008(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L19
	addq	$200016, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	.cfi_restore_state
	subl	$1, %edx
	addl	$1, %r8d
	jmp	.L5
.L7:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	jmp	.L8
.L11:
	xorl	%r8d, %r8d
	jmp	.L2
.L19:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
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