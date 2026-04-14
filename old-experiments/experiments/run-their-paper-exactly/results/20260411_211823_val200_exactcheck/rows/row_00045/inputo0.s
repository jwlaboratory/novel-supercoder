```assembly
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	s(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	%edi, %rbx
	movq	%r13, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	gets@PLT
	movslq	i(%rip), %rdx
	cmpb	$0, 0(%r13,%rdx)
	je	.L2
	movslq	k(%rip), %rcx
	leaq	t(%rip), %rbp
	leaq	0(%r13,%rdx), %r9
	leal	1(%rdx), %r14d
	movq	%rcx, %r11
	leaq	(%rcx,%rcx,2), %rcx
	subl	%r9d, %r14d
	leaq	0(%rbp,%rcx,2), %r12
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%r9, %r13
	movq	%r12, %rdi
	leal	6(%r11), %r10d
	movl	$5, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movl	%r10d, %edx
	movl	%eax, %esi
	movl	%eax, %r15d
	subl	%eax, %edx
	movl	%edx, k(%rip)
	testl	%eax, %eax
	je	.L4
	xorl	%edx, %edx
.L3:
	movl	%edx, %ecx
	addl	$1, %edx
	movzbl	(%r9,%rcx), %r8d
	movb	%r8b, (%rdi,%rcx)
	cmpl	%r15d, %edx
	jb	.L3
.L4:
	subl	$2, %esi
	addq	$6, %rdi
	movl	%esi, j(%rip)
	subq	$1, %rax
	jne	.L5
	leal	(%r14,%r9), %eax
	addl	$5, %r11d
	addq	$1, %r9
	addq	$30, %r12
	cmpb	$0, 1(%r13)
	movl	%eax, i(%rip)
	jne	.L6
.L7:
	movq	strcmp@GOTPCREL(%rip), %rcx
	movl	%r11d, %esi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	movl	$6, %edx
	call	qsort@PLT
	leaq	i(%rip), %rsi
	leaq	.LC0(%rip), %rdi
	xorl	%eax, %eax
	call	scanf@PLT
	movl	l(%rip), %r12d
	movl	i(%rip), %r13d
	cmpl	%r13d, %r12d
	jge	.L8
	leaq	(%rbx,%rbx,2), %rax
	leaq	0(%rbp,%rax,2), %rbx
	.p2align 4,,10
	.p2align 3
.L12:
	leaq	-6(%rbx), %rbp
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L9
	addl	$1, %r12d
	addq	$6, %rbx
	movl	%r12d, l(%rip)
	cmpl	%r13d, %r12d
	jl	.L12
.L11:
	movq	%rbp, %rdi
	call	puts@PLT
	addq	$8, %rsp
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
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
	addq	$6, %rbx
	cmpl	%r12d, %r13d
	jg	.L12
	jmp	.L11
.L2:
	movl	k(%rip), %r11d
	leaq	t(%rip), %rbp
	jmp	.L7
.L8:
	leal	-2(%rbx), %eax
	cltq
	imulq	$6, %rax, %rax
	addq	%rax, %rbp
	jmp	.L11
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	l
	.bss
	.align 4
	.type	l, @object
	.size	l, 4
l:
	.zero	4
	.globl	k
	.align 4
	.type	k, @object
	.size	k, 4
k:
	.zero	4
	.globl	j
	.align 4
	.type	j, @object
	.size	j, 4
j:
	.zero	4
	.globl	i
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	t
	.align 32
	.type	t, @object
	.size	t, 300000
t:
	.zero	300000
	.globl	s
	.align 32
	.type	s, @object
	.size	s, 5010
s:
	.zero	5010
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