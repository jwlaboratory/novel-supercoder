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
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	.LC0(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	k(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	i(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%edi, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
.L2:
	movl	i(%rip), %eax
	xorl	%edx, %edx
	subl	$1, %ebx
	je	.L3
	xorl	%edx, %edx
	xorl	%eax, x(%rip)
	setne	%dl
	rep bsfl	%eax, %eax
	cltq
	movl	%edx, (%r12,%rax,4)
.L3:
	movq	%rbp, %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	scanf@PLT
	movl	%eax, %esi
	cmpl	$-1, %eax
	jne	.L2
	movl	x(%rip), %r8d
	movl	c(%rip), %r10d
	movl	$30, %edx
	xorl	%r11d, %r11d
	leaq	k(%rip), %r9
.L5:
	movslq	%edx, %rdi
	leal	-1(%rdi), %ecx
	movl	%edx, %edx
	subq	$1, %rdi
	movslq	%ecx, %rcx
	subq	%rdx, %rdi
	jmp	.L6
.L6:
	movl	(%r9,%rcx,4), %eax
	sall	%cl, %eax
	subq	$1, %rcx
	testl	%r8d, %eax
	jne	.L19
	cmpq	%rdi, %rcx
	jne	.L6
	movl	%ecx, i(%rip)
	testb	%r11b, %r11b
	je	.L8
	movl	%r10d, c(%rip)
	movl	%r8d, x(%rip)
.L8:
	movl	x(%rip), %eax
	testl	%eax, %eax
	jne	.L9
	movl	c(%rip), %esi
.L9:
	movq	%r13, %rdi
	xorl	%eax, %eax
	call	printf@PLT
	addq	$8, %rsp
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
.L19:
	leal	-1(%rax,%rax), %eax
	addl	$1, %r10d
	movl	$1, %r11d
	xorl	%eax, %r8d
	jmp	.L5
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	x
	.bss
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.zero	4
	.globl	k
	.align 32
	.type	k, @object
	.size	k, 120
k:
	.zero	120
	.globl	i
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	c
	.align 4
	.type	c, @object
	.size	c, 4
c:
	.zero	4
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
