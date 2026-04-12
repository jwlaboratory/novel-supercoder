```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d"
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	W(%rip), %rdx
	leaq	N(%rip), %rsi
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	.LC0(%rip), %rbx
	movq	%rbx, %rdi
	call	__isoc99_scanf@PLT
	movl	N(%rip), %eax
	movl	$0, i(%rip)
	movl	r(%rip), %r13d
	testl	%eax, %eax
	jle	.L3
	xorl	%eax, %eax
	leaq	w(%rip), %r12
	leaq	v(%rip), %rbp
	.p2align 4,,10
	.p2align 3
.L2:
	cltq
	movq	%rbx, %rdi
	salq	$2, %rax
	leaq	(%rax,%r12), %rdx
	leaq	(%rax,%rbp), %rsi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	movl	i(%rip), %eax
	movl	N(%rip), %r11d
	addl	$1, %eax
	movl	%eax, i(%rip)
	cmpl	%r11d, %eax
	jl	.L2
	movl	r(%rip), %r13d
	movl	$0, i(%rip)
	movl	%r13d, %esi
	testl	%r11d, %r11d
	jle	.L3
	movl	W(%rip), %ebp
	leaq	v(%rip), %r8
	leal	-1(%r11), %eax
	leaq	4(%r8), %rdx
	leaq	w(%rip), %r10
	leaq	(%rdx,%rax,4), %r12
	leal	1(%rbp), %ebx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L8:
	testl	%ebp, %ebp
	js	.L10
	movl	(%r10), %r9d
	movl	%ebx, %edi
	leaq	dp(%rip), %rcx
	movl	%r9d, %edx
	subl	%r9d, %edi
	negl	%edx
	movslq	%edx, %r9
	.p2align 4,,10
	.p2align 3
.L7:
	testl	%edx, %edx
	js	.L6
	movl	(%rcx), %r14d
	movl	(%r8), %eax
	addl	(%rcx,%r9,4), %eax
	cmpl	%r14d, %eax
	cmovl	%r14d, %eax
	cmpl	%eax, %esi
	movl	%eax, (%rcx)
	cmovl	%eax, %esi
	movl	$1, %eax
.L6:
	addl	$1, %edx
	addq	$4, %rcx
	cmpl	%edi, %edx
	jne	.L7
	movl	%ebx, %edx
.L5:
	addq	$4, %r8
	addq	$4, %r10
	cmpq	%r12, %r8
	jne	.L8
	movl	%edx, j(%rip)
	movl	%r11d, i(%rip)
	testb	%al, %al
	je	.L3
	movl	%esi, r(%rip)
	movl	%esi, %r13d
.L3:
	movl	%r13d, %edx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L5
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	r
	.bss
	.align 4
	.type	r, @object
	.size	r, 4
r:
	.zero	4
	.globl	dp
	.align 32
	.type	dp, @object
	.size	dp, 40020
dp:
	.zero	40020
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
	.globl	w
	.align 32
	.type	w, @object
	.size	w, 420
w:
	.zero	420
	.globl	v
	.align 32
	.type	v, @object
	.size	v, 420
v:
	.zero	420
	.globl	W
	.align 4
	.type	W, @object
	.size	W, 4
W:
	.zero	4
	.globl	N
	.align 4
	.type	N, @object
	.size	N, 4
N:
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
```