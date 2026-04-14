.file	"inputC.c"
	.text
	.globl	fifo
	.bss
	.align 32
	.type	fifo, @object
	.size	fifo, 8000
fifo:
	.zero	8000
	.globl	loop1
	.align 8
	.type	loop1, @object
	.size	loop1, 8
loop1:
	.zero	8
	.globl	loop2
	.align 8
	.type	loop2, @object
	.size	loop2, 8
loop2:
	.zero	8
	.globl	loop3
	.align 8
	.type	loop3, @object
	.size	loop3, 8
loop3:
	.zero	8
	.globl	loop4
	.align 8
	.type	loop4, @object
	.size	loop4, 8
loop4:
	.zero	8
	.globl	loop5
	.align 8
	.type	loop5, @object
	.size	loop5, 8
loop5:
	.zero	8
	.globl	i_temp
	.align 8
	.type	i_temp, @object
	.size	i_temp, 8
i_temp:
	.zero	8
	.globl	g_ans
	.align 8
	.type	g_ans, @object
	.size	g_ans, 8
g_ans:
	.zero	8
	.globl	GRAPH
	.align 32
	.type	GRAPH, @object
	.size	GRAPH, 16520
GRAPH:
	.zero	16520
	.globl	c_temp
	.type	c_temp, @object
	.size	c_temp, 1
c_temp:
	.zero	1
	.section	.rodata
.LC0:
	.string	"%ld"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	-32(%rbp), %rax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	movl	%eax, %edx
	negl	%edx
	cmovs	%eax, %edx
	movq	-32(%rbp), %rax
	movl	%eax, %ecx
	movq	-16(%rbp), %rax
	movl	%eax, %esi
	movl	%ecx, %eax
	subl	%esi, %eax
	movl	%eax, %ecx
	negl	%ecx
	cmovns	%ecx, %eax
	cmpl	%eax, %edx
	jle	.L2
	movl	$66, %edi
	call	putchar@PLT
	jmp	.L3
.L2:
	movl	$65, %edi
	call	putchar@PLT
.L3:
	movl	$10, %edi
	call	putchar@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.globl	input_array
	.type	input_array, @function
input_array:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L7
.L8:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addq	$1, -8(%rbp)
.L7:
	movq	-8(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jl	.L8
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	input_array, .-input_array
	.section	.rodata
.LC1:
	.string	"%ld "
	.text
	.globl	output_array
	.type	output_array, @function
output_array:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L11
.L12:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$1, -8(%rbp)
.L11:
	movq	-24(%rbp), %rax
	subq	$1, %rax
	cmpq	%rax, -8(%rbp)
	jl	.L12
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	output_array, .-output_array
	.globl	input_array2
	.type	input_array2, @function
input_array2:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L15
.L18:
	movq	$0, -8(%rbp)
	jmp	.L16
.L17:
	movq	-16(%rbp), %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %
