	.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
.LC1:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movl	i(%rip), %ebp
	movl	z(%rip), %edi
	movl	%ecx, 12(%rsp)
	cmpl	%edi, %ebp
	jge	.L13
	movl	%edi, %r8d
	xorl	%eax, %eax
	imull	%edi, %r8d
.L4:
	movl	%ebp, %r11d
	cmpl	%ebp, %edi
	jle	.L8
	movl	%ebp, %ebx
	imull	%ebp, %ebx
	.p2align 4,,10
	.p2align 3
.L11:
	cmpl	%r11d, %edi
	jle	.L7
	movl	%r11d, %r10d
	movl	%r11d, %r9d
	imull	%r11d, %r10d
	addl	%ebx, %r10d
	.p2align 4,,10
	.p2align 3
.L9:
	movl	%r9d, %esi
	movl	%r9d, %eax
	imull	%r9d, %esi
	addl	%r10d, %esi
	.p2align 4,,10
	.p2align 3
.L6:
	movl	%eax, %edx
	imull	%eax, %edx
	addl	%esi, %edx
	cmpl	%r8d, %edx
	jge	.L5
	movslq	%edx, %rcx
	addl	$1, t(,%rcx,4)
.L5:
	addl	$1, %eax
	cmpl	%edi, %eax
	jl	.L6
	addl	$1, %r9d
	cmpl	%edi, %r9d
	jne	.L9
	movl	$1, %eax
.L7:
	addl	$1, %r11d
	cmpl	%edi, %r11d
	jne	.L11
.L8:
	addl	$1, %ebp
	cmpl	%ebp, %edi
	jne	.L4
	movl	%edi, i(%rip)
	testb	%al, %al
	je	.L13
	movl	%edx, 12(%rsp)
	jmp	.L13
.L14:
	movl	t(,%rax,4), %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
.L13:
	leaq	12(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	scanf
	movslq	12(%rsp), %rax
	testl	%eax, %eax
	jne	.L14
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	t
	.bss
	.align 32
	.type	t, @object
	.size	t, 262144
t:
	.zero	262144
	.globl	z
	.data
	.align 4
	.type	z, @object
	.size	z, 4
z:
	.long	256
	.globl	i
	.bss
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
