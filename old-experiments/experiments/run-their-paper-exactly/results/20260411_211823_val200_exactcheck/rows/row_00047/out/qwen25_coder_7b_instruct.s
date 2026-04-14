.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
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
	leaq	.LC0(%rip), %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movl	4(%rsp), %eax
	cmpl	$1999, %eax
	jg	.L2
	movl	$654471207, %ecx
	movl	$8200, %r11d
.L3:
	leal	-2020(%r11), %r10d
	movl	%ecx, %ebx
.L14:
	leal	-2040(%r10), %r9d
	movl	%ebx, %ebp
.L12:
	leal	-2060(%r9), %edi
	movl	%ebp, %r8d
.L10:
	leal	-2080(%rdi), %esi
	movl	%r8d, %edx
.L8:
	xorl	%eax, %eax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L20:
	subl	$1, %eax
	cmpl	$-20, %eax
	je	.L19
.L5:
	cmpl	%edx, %eax
	jne	.L20
.L2:
	movl	$49, %edi
	call	putchar@PLT
.L4:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L21
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	.cfi_restore_state
	addl	$104, %esi
	addl	$654471208, %edx
	cmpl	%edi, %esi
	jne	.L8
	leal	103(%rsi), %edi
	addl	$1308942415, %r8d
	cmpl	%r9d, %edi
	jne	.L10
	leal	205(%rsi), %r9d
	addl	$1963413622, %ebp
	cmpl	%r10d, %r9d
	jne	.L12
	leal	306(%rsi), %r10d
	subl	$1677082467, %ebx
	cmpl	%r11d, %r10d
	jne	.L14
	leal	406(%rsi), %r11d
	subl	$1022611260, %ecx
	cmpl	$9794, %esi
	jne	.L3
	movl	$48, %edi
	call	putchar@PLT
	jmp	.L4
.L21:
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
