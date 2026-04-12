.file	"temp.c"
	.text
	.p2align 4
	.globl	load
	.type	load, @function
load:
.LFB23:
	.cfi_startproc
	endbr64
	movl	k(%rip), %r9d
	testl	%r9d, %r9d
	jle	.L6
	movl	n(%rip), %ecx
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	leaq	T(%rip), %r10
.L3:
	movslq	%r8d, %rax
	leaq	(%r10,%rax,8), %rdx
	xorl	%eax, %eax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L4:
	addl	$1, %r8d
	addq	$8, %rdx
	cmpl	%r8d, %ecx
	je	.L1
.L5:
	addq	(%rdx), %rax
	cmpq	%rdi, %rax
	jle	.L4
	addl	$1, %esi
	cmpl	%r9d, %esi
	jne	.L3
.L1:
	movl	%r8d, %eax
	ret
.L6:
	xorl	%r8d, %r8d
	jmp	.L1
	.cfi_endproc
.LFE23:
	.size	load, .-load
	.p2align 4
	.globl	solve
	.type	solve, @function
solve:
.LFB24:
	.cfi_startproc
	endbr64
	movl	k(%rip), %r11d
	movl	n(%rip), %r9d
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$1000000000, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	T(%rip), %r8
	xorl	%ebx, %ebx
.L9:
	leaq	1(%rbx), %rbp
	cmpq	%rbp, %rax
	jle	.L22
	.p2align 4,,10
	.p2align 3
.L15:
	leaq	(%rax,%rbx), %rsi
	xorl	%edi, %edi
	xorl	%r10d, %r10d
	sarq	%rsi
	testl	%r11d, %r11d
	jle	.L11
.L10:
	movslq	%edi, %rdx
	xorl	%ecx, %ecx
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L13:
	addq	$1, %rdx
	cmpl	%edx, %r9d
	je	.L18
.L14:
	addq	(%r8,%rdx,8), %rcx
	movl	%edx, %edi
	cmpq	%rcx, %rsi
	jge	.L13
	addl	$1, %r10d
	cmpl	%r10d, %r11d
	jne	.L10
.L11:
	cmpl	%edi, %r9d
	jle	.L18
	movq	%rsi, %rbx
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L18:
	movq	%rsi, %rax
	cmpq	%rbp, %rax
	jg	.L15
.L22:
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	solve, .-solve
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d%"
.LC1:
	.string	"%d"
.LC2:
	.string	"%llu\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	k(%rip), %rdx
	leaq	n(%rip), %rsi
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	.LC0(%rip), %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	call	__isoc99_scanf@PLT
	movl	n(%rip), %eax
	testl	%eax, %eax
	jle	.L24
	leaq	T(%rip), %rbp
	xorl	%ebx, %ebx
	leaq	.LC1(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L25:
	movq	%rbp, %rsi
	xorl	%eax, %eax
	movq	%r12, %rdi
	addl	$1, %ebx
	call	__isoc99_scanf@PLT
	addq	$8, %rbp
	cmpl	%ebx, n(%rip)
	jg	.L25
.L24:
	xorl	%eax, %eax
	call	solve
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	movl	%eax, %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	popq	%rbx
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.globl	k
	.bss
	.align 4
	.type	k, @object
	.size	k, 4
k:
	.zero	4
	.globl	n
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.globl	T
	.align 32
	.type	T, @object
	.size	T, 800000
T:
	.zero	800000
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
