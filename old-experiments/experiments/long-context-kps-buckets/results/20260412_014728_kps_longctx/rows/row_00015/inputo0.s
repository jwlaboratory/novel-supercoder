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
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addq	$1, -8(%rbp)
.L16:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jl	.L17
	addq	$1, -16(%rbp)
.L15:
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jl	.L18
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	input_array2, .-input_array2
	.globl	format_array
	.type	format_array, @function
format_array:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L21
.L22:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, (%rdx)
	addq	$1, -8(%rbp)
.L21:
	movq	-8(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jl	.L22
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	format_array, .-format_array
	.globl	get_random
	.type	get_random, @function
get_random:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	call	rand@PLT
	call	rand@PLT
	call	rand@PLT
	call	rand@PLT
	call	rand@PLT
	cltq
	movq	-16(%rbp), %rdx
	addq	$1, %rdx
	movq	%rdx, %rcx
	subq	-8(%rbp), %rcx
	cqto
	idivq	%rcx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	get_random, .-get_random
	.globl	factorial
	.type	factorial, @function
factorial:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	$1, -16(%rbp)
	movq	$1, -8(%rbp)
	jmp	.L27
.L28:
	movq	-8(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, %rcx
	movabsq	$-8543223828751151131, %rdx
	movq	%rcx, %rax
	mulq	%rdx
	movq	%rdx, %rax
	shrq	$29, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	imulq	$1000000007, %rax, %rdx
	movq	%rcx, %rax
	subq	%rdx, %rax
	movq	%rax, -16(%rbp)
	addq	$1, -8(%rbp)
.L27:
	movq	-8(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jle	.L28
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	factorial, .-factorial
	.globl	qsort_09
	.type	qsort_09, @function
qsort_09:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jge	.L31
	movl	$-1, %eax
	jmp	.L32
.L31:
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L33
	movl	$0, %eax
	jmp	.L32
.L33:
	movl	$1, %eax
.L32:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	qsort_09, .-qsort_09
	.globl	qsort_90
	.type	qsort_90, @function
qsort_90:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jge	.L35
	movl	$1, %eax
	jmp	.L36
.L35:
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L37
	movl	$0, %eax
	jmp	.L36
.L37:
	movl	$-1, %eax
.L36:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	qsort_90, .-qsort_90
	.globl	fibonacci
	.type	fibonacci, @function
fibonacci:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L39
	cmpq	$1, -24(%rbp)
	je	.L40
	jmp	.L43
.L39:
	movl	$0, %eax
	jmp	.L42
.L40:
	movl	$1, %eax
	jmp	.L42
.L43:
	movq	-24(%rbp), %rax
	subq	$1, %rax
	movq	%rax, %rdi
	call	fibonacci
	movq	%rax, %rbx
	movq	-24(%rbp), %rax
	subq	$2, %rax
	movq	%rax, %rdi
	call	fibonacci
	addq	%rbx, %rax
.L42:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	fibonacci, .-fibonacci
	.globl	sel_max
	.type	sel_max, @function
sel_max:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jle	.L45
	movq	-8(%rbp), %rax
	jmp	.L46
.L45:
	movq	-16(%rbp), %rax
.L46:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	sel_max, .-sel_max
	.globl	sel_min
	.type	sel_min, @function
sel_min:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jle	.L48
	movq	-16(%rbp), %rax
	jmp	.L49
.L48:
	movq	-8(%rbp), %rax
.L49:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	sel_min, .-sel_min
	.globl	can_DP
	.type	can_DP, @function
can_DP:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	$0, -8(%rbp)
	movq	$0, -24(%rbp)
	jmp	.L51
.L52:
	movq	-24(%rbp), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	addq	$1, -24(%rbp)
.L51:
	movq	-24(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jl	.L52
	movq	-64(%rbp), %rax
	movb	$1, (%rax)
	movq	$0, -24(%rbp)
	jmp	.L53
.L57:
	movq	-56(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	.L54
.L56:
	movq	-16(%rbp), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L55
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	cmpq	%rax, -56(%rbp)
	jle	.L55
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movb	$1, (%rax)
.L55:
	subq	$1, -16(%rbp)
.L54:
	cmpq	$0, -16(%rbp)
	jns	.L56
	addq	$1, -24(%rbp)
.L53:
	movq	-24(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jl	.L57
	movq	$0, -24(%rbp)
	jmp	.L58
.L60:
	movq	-24(%rbp), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L59
	addq	$1, -8(%rbp)
.L59:
	addq	$1, -24(%rbp)
.L58:
	movq	-24(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jl	.L60
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	can_DP, .-can_DP
	.globl	array_max
	.type	array_max, @function
array_max:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L63
.L65:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jge	.L64
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L64:
	addq	$1, -16(%rbp)
.L63:
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jl	.L65
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	array_max, .-array_max
	.globl	array_min
	.type	array_min, @function
array_min:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L68
.L70:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jle	.L69
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L69:
	addq	$1, -16(%rbp)
.L68:
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jl	.L70
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	array_min, .-array_min
	.globl	array_sum
	.type	array_sum, @function
array_sum:
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L73
.L74:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	addq	%rax, -16(%rbp)
	addq	$1, -8(%rbp)
.L73:
	movq	-8(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jl	.L74
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	array_sum, .-array_sum
	.globl	array_search
	.type	array_search, @function
array_search:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L77
.L80:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	%rax, -40(%rbp)
	jne	.L78
	movq	-8(%rbp), %rax
	jmp	.L79
.L78:
	addq	$1, -8(%rbp)
.L77:
	movq	-8(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jl	.L80
	movq	$-1, %rax
.L79:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	array_search, .-array_search
	.globl	Leven_dist
	.type	Leven_dist, @function
Leven_dist:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$168, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -136(%rbp)
	movq	%rsi, -144(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, -200(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	$1, %rax
	movq	%rax, -104(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	$1, %rax
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rcx
	movq	-104(%rbp), %rsi
	leaq	-1(%rcx), %rax
	movq	%rax, -88(%rbp)
	movq	%rcx, %rax
	movq	%rax, -192(%rbp)
	movq	$0, -184(%rbp)
	movq	%rcx, %rax
	leaq	0(,%rax,8), %rbx
	leaq	-1(%rsi), %rax
	movq	%rax, -80(%rbp)
	movq	%rcx, %rax
	movq	%rax, -160(%rbp)
	movq	$0, -152(%rbp)
	movq	%rsi, %rax
	movq	%rax, -176(%rbp)
	movq	$0, -168(%rbp)
	movq	-160(%rbp), %r8
	movq	-152(%rbp), %r9
	movq	%r9, %rdx
	movq	-176(%rbp), %r10
	movq	-168(%rbp), %r11
	imulq	%r10, %rdx
	movq	%r11, %rax
	imulq	%r8, %rax
	leaq	(%rdx,%rax), %rdi
	movq	%r8, %rax
	mulq	%r10
	addq	%rdx, %rdi
	movq	%rdi, %rdx
	movq	%rcx, %rax
	movq	%rax, %r14
	movl	$0, %r15d
	movq	%rsi, %rax
	movq	%rax, %r12
	movl	$0, %r13d
	movq	%r15, %rdx
	imulq	%r12, %rdx
	movq	%r13, %rax
	imulq	%r14, %rax
	leaq	(%rdx,%rax), %rdi
	movq	%r14, %rax
	mulq	%r12
	addq	%rdx, %rdi
	movq	%rdi, %rdx
	movq	%rcx, %rdx
	movq	%rsi, %rax
	imulq	%rdx, %rax
	leaq	0(,%rax,8), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %edi
	movl	$0, %edx
	divq	%rdi
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L82:
	cmpq	%rdx, %rsp
	je	.L83
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L82
.L83:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L84
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L84:
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -72(%rbp)
	movq	$0, -120(%rbp)
	jmp	.L85
.L86:
	movq	%rbx, %rdx
	shrq	$3, %rdx
	movq	-72(%rbp), %rax
	imulq	-120(%rbp), %rdx
	movq	-120(%rbp), %rcx
	movq	%rcx, (%rax,%rdx,8)
	addq	$1, -120(%rbp)
.L85:
	movq	-120(%rbp), %rax
	cmpq	-104(%rbp), %rax
	jl	.L86
	movq	$0, -120(%rbp)
	jmp	.L87
.L88:
	movq	-72(%rbp), %rax
	movq	-120(%rbp), %rdx
	movq	-120(%rbp), %rcx
	movq	%rcx, (%rax,%rdx,8)
	addq	$1, -120(%rbp)
.L87:
	movq	-120(%rbp), %rax
	cmpq	-96(%rbp), %rax
	jl	.L88
	movq	$1, -120(%rbp)
	jmp	.L89
.L92:
	movq	$1, -112(%rbp)
	jmp	.L90
.L91:
	movq	-120(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movq	-112(%rbp), %rax
	leaq	-1(%rax), %rcx
	movq	-144(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	setne	%al
	movzbl	%al, %eax
	movq	%rax, -64(%rbp)
	movq	%rbx, %rcx
	shrq	$3, %rcx
	movq	-120(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-112(%rbp), %rax
	leaq	-1(%rax), %rsi
	movq	-72(%rbp), %rax
	imulq	%rcx, %rdx
	addq	%rsi, %rdx
	movq	(%rax,%rdx,8), %rdx
	movq	-64(%rbp), %rax
	leaq	(%rdx,%rax), %r12
	movq	%rbx, %rdx
	shrq	$3, %rdx
	movq	-112(%rbp), %rax
	leaq	-1(%rax), %rcx
	movq	-72(%rbp), %rax
	imulq	-120(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rax,%rdx,8), %rax
	leaq	1(%rax), %rdx
	movq	%rbx, %rsi
	shrq	$3, %rsi
	movq	-120(%rbp), %rax
	leaq	-1(%rax), %rcx
	movq	-72(%rbp), %rax
	imulq	%rcx, %rsi
	movq	-112(%rbp), %rcx
	addq	%rsi, %rcx
	movq	(%rax,%rcx,8), %rax
	addq	$1, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	sel_min
	movq	%rbx, %r13
	shrq	$3, %r13
	movq	%r12, %rsi
	movq	%rax, %rdi
	call	sel_min
	movq	-72(%rbp), %rdx
	movq	%r13, %rsi
	imulq	-120(%rbp), %rsi
	movq	-112(%rbp), %rcx
	addq	%rsi, %rcx
	movq	%rax, (%rdx,%rcx,8)
	addq	$1, -112(%rbp)
.L90:
	movq	-112(%rbp), %rax
	cmpq	-96(%rbp), %rax
	jl	.L91
	addq	$1, -120(%rbp)
.L89:
	movq	-120(%rbp), %rax
	cmpq	-104(%rbp), %rax
	jl	.L92
	shrq	$3, %rbx
	movq	%rbx, %rcx
	movq	-104(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-96(%rbp), %rax
	leaq	-1(%rax), %rsi
	movq	-72(%rbp), %rax
	imulq	%rcx, %rdx
	addq	%rsi, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	-200(%rbp), %rsp
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L94
	call	__stack_chk_fail@PLT
.L94:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	Leven_dist, .-Leven_dist
	.globl	get_digit
	.type	get_digit, @function
get_digit:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	pxor	%xmm2, %xmm2
	cvtsi2sdq	-8(%rbp), %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	call	log10@PLT
	movsd	.LC2(%rip), %xmm1
	addsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	get_digit, .-get_digit
	.globl	ncr
	.type	ncr, @function
ncr:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-77824(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$3824, %rsp
	movq	%rdi, -81640(%rbp)
	movq	%rsi, -81648(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-81616(%rbp), %rax
	movl	$81600, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	$1, -80800(%rbp)
	movq	$1, -80792(%rbp)
	movq	$2, -81632(%rbp)
	jmp	.L98
.L101:
	movq	-81632(%rbp), %rax
	imulq	$816, %rax, %rax
	addq	%rbp, %rax
	subq	$81616, %rax
	movq	$1, (%rax)
	movq	$1, -81624(%rbp)
	jmp	.L99
.L100:
	movq	-81632(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-81624(%rbp), %rax
	leaq	-1(%rax), %rcx
	imulq	$102, %rdx, %rax
	addq	%rcx, %rax
	movq	-81616(%rbp,%rax,8), %rdx
	movq	-81632(%rbp), %rax
	subq	$1, %rax
	imulq	$102, %rax, %rcx
	movq	-81624(%rbp), %rax
	addq	%rcx, %rax
	movq	-81616(%rbp,%rax,8), %rax
	addq	%rax, %rdx
	movq	-81632(%rbp), %rax
	imulq	$102, %rax, %rcx
	movq	-81624(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, -81616(%rbp,%rax,8)
	addq	$1, -81624(%rbp)
.L99:
	movq	-81624(%rbp), %rax
	cmpq	-81632(%rbp), %rax
	jl	.L100
	movq	-81632(%rbp), %rax
	imulq	$824, %rax, %rax
	addq	%rbp, %rax
	subq	$81616, %rax
	movq	$1, (%rax)
	addq	$1, -81632(%rbp)
.L98:
	cmpq	$99, -81632(%rbp)
	jle	.L101
	movq	-81640(%rbp), %rax
	imulq	$102, %rax, %rdx
	movq	-81648(%rbp), %rax
	addq	%rdx, %rax
	movq	-81616(%rbp,%rax,8), %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L103
	call	__stack_chk_fail@PLT
.L103:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	ncr, .-ncr
	.globl	npr
	.type	npr, @function
npr:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	ncr
	movq	%rax, %rbx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	factorial
	imulq	%rbx, %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	npr, .-npr
	.globl	nhr
	.type	nhr, @function
nhr:
.LFB27:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	leaq	-1(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	ncr
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	nhr, .-nhr
	.globl	rounding
	.type	rounding, @function
rounding:
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	cvttsd2siq	%xmm0, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	rounding, .-rounding
	.globl	roundingup
	.type	roundingup, @function
roundingup:
.LFB29:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movsd	%xmm0, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	call	ceil@PLT
	cvttsd2siq	%xmm0, %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	roundingup, .-roundingup
	.globl	roundingdown
	.type	roundingdown, @function
roundingdown:
.LFB30:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movsd	%xmm0, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	call	floor@PLT
	cvttsd2siq	%xmm0, %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	roundingdown, .-roundingdown
	.globl	fifw
	.type	fifw, @function
fifw:
.LFB31:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	fifw, .-fifw
	.globl	fifr
	.type	fifr, @function
fifr:
.LFB32:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	movl	$1, -12(%rbp)
	jmp	.L117
.L118:
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	addl	$1, -12(%rbp)
.L117:
	cmpl	$998, -12(%rbp)
	jle	.L118
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	fifr, .-fifr
	.section	.rodata
.LC4:
	.string	"%ld %ld\n"
	.text
	.globl	GRAPH_input
	.type	GRAPH_input, @function
GRAPH_input:
.LFB33:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	8+GRAPH(%rip), %rax
	movq	%rax, %rdx
	leaq	GRAPH(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	$0, -8(%rbp)
	jmp	.L121
.L122:
	movq	-8(%rbp), %rax
	salq	$4, %rax
	leaq	24(%rax), %rdx
	leaq	GRAPH(%rip), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	$1, %rax
	salq	$4, %rax
	movq	%rax, %rcx
	leaq	GRAPH(%rip), %rax
	addq	%rcx, %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addq	$1, -8(%rbp)
.L121:
	movq	8+GRAPH(%rip), %rax
	cmpq	%rax, -8(%rbp)
	jl	.L122
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	GRAPH_input, .-GRAPH_input
	.globl	GRAPH_dfs
	.type	GRAPH_dfs, @function
GRAPH_dfs:
.LFB34:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	leaq	16016+GRAPH(%rip), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$1, (%rax)
	movl	$0, -4(%rbp)
	jmp	.L125
.L128:
	movl	-4(%rbp), %eax
	cltq
	addq	$1, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	GRAPH(%rip), %rax
	movq	(%rdx,%rax), %rax
	cmpq	%rax, -24(%rbp)
	jne	.L126
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	24+GRAPH(%rip), %rax
	movq	(%rdx,%rax), %rax
	leaq	16016+GRAPH(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L126
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	24+GRAPH(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rdi
	call	GRAPH_dfs
.L126:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	24+GRAPH(%rip), %rax
	movq	(%rdx,%rax), %rax
	cmpq	%rax, -24(%rbp)
	jne	.L127
	movl	-4(%rbp), %eax
	cltq
	addq	$1, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	GRAPH(%rip), %rax
	movq	(%rdx,%rax), %rax
	leaq	16016+GRAPH(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L127
	movl	-4(%rbp), %eax
	cltq
	addq	$1, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	leaq	GRAPH(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rdi
	call	GRAPH_dfs
.L127:
	addl	$1, -4(%rbp)
.L125:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	8+GRAPH(%rip), %rax
	cmpq	%rax, %rdx
	jl	.L128
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	GRAPH_dfs, .-GRAPH_dfs
	.globl	check_prime
	.type	check_prime, @function
check_prime:
.LFB35:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$2, -24(%rbp)
	jne	.L131
	movl	$1, %eax
	jmp	.L132
.L131:
	cmpq	$1, -24(%rbp)
	jle	.L133
	movq	-24(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	jne	.L134
.L133:
	movl	$0, %eax
	jmp	.L132
.L134:
	movl	$3, -4(%rbp)
	jmp	.L135
.L137:
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movq	-24(%rbp), %rax
	cqto
	idivq	%rcx
	movq	%rdx, %rax
	testq	%rax, %rax
	jne	.L136
	movl	$0, %eax
	jmp	.L132
.L136:
	addl	$2, -4(%rbp)
.L135:
	pxor	%xmm2, %xmm2
	cvtsi2sdl	-4(%rbp), %xmm2
	movsd	%xmm2, -32(%rbp)
	pxor	%xmm3, %xmm3
	cvtsi2sdq	-24(%rbp), %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	movsd	.LC2(%rip), %xmm1
	addsd	%xmm1, %xmm0
	comisd	-32(%rbp), %xmm0
	jnb	.L137
	movl	$1, %eax
.L132:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	check_prime, .-check_prime
	.section	.rodata
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 8
.LC3:
	.long	0
	.long	1071644672
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
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
