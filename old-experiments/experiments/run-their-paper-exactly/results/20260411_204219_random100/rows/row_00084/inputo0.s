```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s%s"
.LC1:
	.string	"UNRESTORABLE"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC0(%rip), %rdi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rbx
	leaq	80(%rsp), %rbp
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	call	__isoc99_scanf@PLT
	movq	%rbx, %rdi
	call	strlen@PLT
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	strlen@PLT
	movl	%r12d, %r9d
	leaq	(%rbx,%r12), %r10
	subl	%eax, %r9d
	js	.L3
	movl	%eax, %r11d
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%r12d, %r13d
	movl	%r8d, %r14d
	subl	%r8d, %r13d
	testq	%rax, %rax
	je	.L7
	movq	%r10, %rcx
	leal	-1(%r11), %edx
	subq	%r8, %rcx
	.p2align 4,,10
	.p2align 3
.L6:
	movzbl	-1(%rcx), %esi
	cmpb	$63, %sil
	je	.L4
	movslq	%edx, %rdi
	cmpb	80(%rsp,%rdi), %sil
	jne	.L5
.L4:
	subq	$1, %rcx
	subl	$1, %edx
	jnb	.L6
.L7:
	movl	%r13d, %edi
	subl	%eax, %edi
	movl	%edi, 12(%rsp)
	testl	%edi, %edi
	jle	.L22
	movl	12(%rsp), %eax
	movq	%rbx, %r15
	subl	$1, %eax
	leaq	17(%rsp,%rax), %rax
	movq	%rax, (%rsp)
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L10:
	call	putchar@PLT
	addq	$1, %r15
	cmpq	(%rsp), %r15
	je	.L22
.L12:
	movsbl	(%r15), %edi
	cmpb	$63, %dil
	jne	.L10
	movl	$97, %edi
	addq	$1, %r15
	call	putchar@PLT
	cmpq	(%rsp), %r15
	jne	.L12
.L22:
	cmpl	%r13d, 12(%rsp)
	jge	.L17
	leal	-1(%r13), %eax
	subl	12(%rsp), %eax
	leaq	81(%rsp,%rax), %r15
	.p2align 4,,10
	.p2align 3
.L16:
	movsbl	0(%rbp), %edi
	addq	$1, %rbp
	call	putchar@PLT
	cmpq	%r15, %rbp
	jne	.L16
.L17:
	cmpl	%r13d, %r12d
	jle	.L15
	movslq	%r13d, %r13
	leal	-1(%r14), %eax
	leaq	17(%rsp,%r13), %rbp
	addq	%r13, %rbx
	addq	%rax, %rbp
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L18:
	call	putchar@PLT
	addq	$1, %rbx
	cmpq	%rbx, %rbp
	je	.L15
.L20:
	movsbl	(%rbx), %edi
	cmpb	$63, %dil
	jne	.L18
	movl	$97, %edi
	addq	$1, %rbx
	call	putchar@PLT
	cmpq	%rbx, %rbp
	jne	.L20
.L15:
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L5:
	addq	$1, %r8
	cmpl	%r8d, %r9d
	jge	.L2
.L3:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
.L9:
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L38
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L38:
	.cfi_restore_state
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
```