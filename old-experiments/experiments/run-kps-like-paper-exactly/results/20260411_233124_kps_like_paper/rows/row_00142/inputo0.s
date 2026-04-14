	.file	"inputC.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	" %c %d"
.LC2:
	.string	"%c%d"
.LC3:
	.string	"\nStable"
.LC4:
	.string	"\nNot stable"
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
	leaq	-24576(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$2128, %rsp
	movl	%edi, -26692(%rbp)
	movq	%rsi, -26704(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-26688(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -26684(%rbp)
	jmp	.L2
.L3:
	leaq	-15216(%rbp), %rdx
	movl	-26684(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rdx, %rax
	leaq	4(%rax), %rdx
	leaq	-15216(%rbp), %rcx
	movl	-26684(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	%rcx, %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-26684(%rbp), %eax
	cltq
	movl	-26684(%rbp), %edx
	movslq	%edx, %rdx
	movq	-15216(%rbp,%rdx,8), %rdx
	movq	%rdx, -26672(%rbp,%rax,8)
	addl	$1, -26684(%rbp)
.L2:
	movl	-26688(%rbp), %eax
	cmpl	%eax, -26684(%rbp)
	jl	.L3
	movl	-26688(%rbp), %edx
	leaq	-15216(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	bubbleSort
	movl	-26688(%rbp), %edx
	leaq	-26672(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	selectionSort
	movl	$0, -26680(%rbp)
	jmp	.L4
.L6:
	cmpl	$0, -26680(%rbp)
	je	.L5
	movl	$32, %edi
	call	putchar@PLT
.L5:
	movl	-26680(%rbp), %eax
	cltq
	movl	-15212(%rbp,%rax,8), %edx
	movl	-26680(%rbp), %eax
	cltq
	movzbl	-15216(%rbp,%rax,8), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -26680(%rbp)
.L4:
	movl	-26688(%rbp), %eax
	cmpl	%eax, -26680(%rbp)
	jl	.L6
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -26676(%rbp)
	jmp	.L7
.L9:
	cmpl	$0, -26676(%rbp)
	je	.L8
	movl	$32, %edi
	call	putchar@PLT
.L8:
	movl	-26676(%rbp), %eax
	cltq
	movl	-26668(%rbp,%rax,8), %edx
	movl	-26676(%rbp), %eax
	cltq
	movzbl	-26672(%rbp,%rax,8), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -26676(%rbp)
.L7:
	movl	-26688(%rbp), %eax
	cmpl	%eax, -26676(%rbp)
	jl	.L9
	movl	-26688(%rbp), %edx
	leaq	-26672(%rbp), %rcx
	leaq	-15216(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	charCompare
	testl	%eax, %eax
	je	.L10
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L11
.L10:
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L11:
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.globl	charCompare
	.type	charCompare, @function
charCompare:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L15
.L18:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	je	.L16
	movl	$0, %eax
	jmp	.L17
.L16:
	addl	$1, -4(%rbp)
.L15:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L18
	movl	$1, %eax
.L17:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	charCompare, .-charCompare
	.globl	bubbleSort
	.type	bubbleSort, @function
bubbleSort:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L20
.L24:
	movl	-28(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L21
.L23:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %edx
	movl	-12(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	4(%rax), %eax
	cmpl	%eax, %edx
	jge	.L22
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	-12(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	movl	-12(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, (%rdx)
.L22:
	subl	$1, -12(%rbp)
.L21:
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.L23
	addl	$1, -16(%rbp)
.L20:
	movl	-16(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L24
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	bubbleSort, .-bubbleSort
	.globl	selectionSort
	.type	selectionSort, @function
selectionSort:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L26
.L30:
	movl	-20(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -16(%rbp)
	jmp	.L27
.L29:
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %edx
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movl	4(%rax), %eax
	cmpl	%eax, %edx
	jge	.L28
	movl	-16(%rbp), %eax
	movl	%eax, -12(%rbp)
.L28:
	addl	$1, -16(%rbp)
.L27:
	movl	-16(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L29
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, (%rdx)
	addl	$1, -20(%rbp)
.L26:
	movl	-20(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L30
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	selectionSort, .-selectionSort
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
