.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s"
.LC1:
	.string	"%d %d\n"
.LC2:
	.string	"-1 -1"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB35:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	str(%rip), %rbp
	leaq	.LC0(%rip), %rdi
	xorl	%eax, %eax
	movq	%rbp, %rsi
	call	__isoc99_scanf@PLT
	movq	%rbp, %rdi
	call	strlen@PLT
	cmpq	$1, %rax
	jbe	.L2
	movzbl	str(%rip), %esi
	leaq	2(%rbp), %r9
	subl	$1, %eax
	xorl	%ecx, %ecx
	movzbl	1+str(%rip), %edx
.L6:
	leal	1(%rcx), %r8d
	cmpb	%sil, %dl
	je	.L11
	movzbl	(%r9), %edi
	cmpb	%dil, %dl
	je	.L5
	cmpb	%dil, %sil
	je	.L5
	addq	$1, %r9
	movl	%edx, %esi
	cmpl	%eax, %r8d
	je	.L2
	movl	%edi, %edx
	movl	%r8d, %ecx
	jmp	.L6
.L11:
	addl	$2, %ecx
.L9:
	movl	%r8d, %edx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L4:
	xorl	%eax, %eax
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	addl	$3, %ecx
	jmp	.L9
.L2:
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	jmp	.L4
	.cfi_endproc
.LFE35:
	.size	main, .-main
	.text
	.p2align 4
	.globl	isUnb
	.type	isUnb, @function
isUnb:
.LFB36:
	.cfi_startproc
	endbr64
	movzbl	(%rdi), %ecx
	movzbl	1(%rdi), %edx
	movl	$1, %eax
	cmpb	%dl, %cl
	je	.L12
	movzbl	2(%rdi), %esi
	cmpb	%sil, %cl
	sete	%al
	cmpb	%sil, %dl
	sete	%dl
	orl	%edx, %eax
	movzbl	%al, %eax
.L12:
	ret
	.cfi_endproc
.LFE36:
	.size	isUnb, .-isUnb
	.p2align 4
	.globl	f
	.type	f, @function
f:
.LFB37:
	.cfi_startproc
	endbr64
	movzbl	1(%rdi), %eax
	cmpb	%al, (%rdi)
	sete	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE37:
	.size	f, .-f
	.globl	str
	.bss
	.align 32
	.type	str, @object
	.size	str, 100005
str:
	.zero	100005
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