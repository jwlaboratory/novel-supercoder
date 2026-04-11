	.file	"inputC.c"
	.text
	.p2align 4
	.globl	runProgram
	.type	runProgram, @function
runProgram:
.LFB3:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	movl	%esi, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	width(%rip), %eax
	leal	-1(%rax), %ebp
	testl	%edi, %edi
	js	.L3
	cmpl	%eax, %edi
	movl	%edi, %ebp
	movl	$0, %eax
	cmovge	%eax, %ebp
.L3:
	movl	height(%rip), %eax
	testl	%ebx, %ebx
	js	.L37
	cmpl	%eax, %ebx
	movl	$0, %eax
	cmovge	%eax, %ebx
.L5:
	movslq	%ebp, %r12
	movslq	%ebx, %r13
	movslq	%edx, %r8
	leaq	(%r12,%r12,4), %rax
	movslq	%ecx, %r14
	leaq	0(%r13,%rax,4), %rax
	salq	$4, %rax
	addq	%r8, %rax
	leaq	visited(%r14,%rax,4), %r15
	movsbl	(%r15), %eax
	testb	%al, %al
	jne	.L38
	leaq	0(%r13,%r13,2), %rax
	movb	$1, (%r15)
	movsbl	program(%r12,%rax,8), %r9d
	movl	%r9d, %eax
	subl	$48, %r9d
	cmpl	$9, %r9d
	jbe	.L39
	subl	$43, %eax
	cmpb	$81, %al
	ja	.L10
	movzbl	%al, %eax
	jmp	*.L12(,%rax,8)
	.section	.rodata
	.align 8
	.align 4
.L12:
	.quad	.L21
	.quad	.L10
	.quad	.L20
	.quad	.L19
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L18
	.quad	.L10
	.quad	.L17
	.quad	.L16
	.quad	.L28
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L15
	.quad	.L14
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L13
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L10
	.quad	.L11
	.text
	.p2align 4,,10
	.p2align 3
.L39:
	movl	dxy+4(,%r14,8), %esi
	movl	dxy(,%r14,8), %edi
	movl	%r9d, %edx
	movq	%r8, (%rsp)
	addl	%ebx, %esi
	addl	%ebp, %edi
	call	runProgram
	movzbl	(%r15), %ecx
	movq	(%rsp), %r8
	addl	%eax, %ecx
.L9:
	leaq	(%r12,%r12,4), %rdx
	leaq	0(%r13,%rdx,4), %rdx
	salq	$4, %rdx
	addq	%r8, %rdx
	movb	%cl, visited(%r14,%rdx,4)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
.L10:
	.cfi_restore_state
	movl	$1, %ecx
	xorl	%eax, %eax
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L37:
	leal	-1(%rax), %ebx
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L38:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	subl	$1, %eax
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
.L11:
	.cfi_restore_state
	movq	%r8, (%rsp)
	testl	%edx, %edx
	jne	.L23
	leal	1(%rbx), %esi
	movl	$3, %ecx
	movl	%ebp, %edi
.L35:
	call	runProgram
	leaq	(%r12,%r12,4), %rdx
	movq	(%rsp), %r8
	leaq	0(%r13,%rdx,4), %rdx
	salq	$6, %rdx
	movzbl	visited(%rdx,%r14), %ecx
	addl	%eax, %ecx
	jmp	.L9
.L21:
	movl	dxy+4(,%r14,8), %esi
	movq	%r8, (%rsp)
	cmpl	$15, %edx
	leal	1(%rdx), %eax
	movl	$0, %edx
	cmovne	%eax, %edx
	addl	%ebx, %esi
.L32:
	movl	dxy(,%r14,8), %edi
	addl	%ebp, %edi
.L33:
	call	runProgram
	leaq	(%r12,%r12,4), %rdx
	movq	(%rsp), %r8
	leaq	0(%r13,%rdx,4), %rdx
	salq	$4, %rdx
	addq	%r8, %rdx
	movzbl	visited(%r14,%rdx,4), %ecx
	addl	%eax, %ecx
	jmp	.L9
.L20:
	movl	$15, %eax
	subl	$1, %edx
	movq	%r8, (%rsp)
	cmovc	%eax, %edx
.L34:
	addl	dxy+4(,%r14,8), %ebx
	movl	%ebx, %esi
	jmp	.L32
.L19:
	movq	%r8, (%rsp)
	jmp	.L34
.L18:
	movq	%r8, (%rsp)
	leal	-1(%rbp), %edi
	movl	$1, %ecx
	movl	%ebx, %esi
	jmp	.L33
.L17:
	movq	%r8, (%rsp)
	leal	1(%rbp), %edi
	movl	$2, %ecx
	movl	%ebx, %esi
	jmp	.L33
.L16:
	leal	-1(%rbp), %edi
	movl	$1, %ecx
	movl	%ebx, %esi
	movq	%r8, 8(%rsp)
	movl	%edx, (%rsp)
	call	runProgram
	movl	(%rsp), %edx
	leal	1(%rbp), %edi
	movl	$2, %ecx
	movl	%ebx, %esi
	movl	%eax, %r15d
	call	runProgram
	movl	(%rsp), %edx
	leal	-1(%rbx), %esi
	xorl	%ecx, %ecx
	movl	%ebp, %edi
	orl	%eax, %r15d
	call	runProgram
	movl	(%rsp), %edx
	movl	$3, %ecx
	leal	1(%rbx), %esi
	movl	%ebp, %edi
	orl	%eax, %r15d
	call	runProgram
	leaq	(%r12,%r12,4), %rdx
	movq	8(%rsp), %r8
	leaq	0(%r13,%rdx,4), %rdx
	orl	%r15d, %eax
	salq	$4, %rdx
	addq	%r8, %rdx
	movzbl	visited(%r14,%rdx,4), %ecx
	addl	%eax, %ecx
	jmp	.L9
.L15:
	movq	%r8, (%rsp)
	leal	-1(%rbx), %esi
	xorl	%ecx, %ecx
	movl	%ebp, %edi
	jmp	.L33
.L14:
	movq	%r8, (%rsp)
	testl	%edx, %edx
	jne	.L22
	leal	1(%rbp), %edi
	movl	$2, %ecx
	movl	%ebx, %esi
	jmp	.L35
.L13:
	movq	%r8, (%rsp)
	leal	1(%rbx), %esi
	movl	$3, %ecx
	movl	%ebp, %edi
	jmp	.L33
.L28:
	movl	$2, %ecx
	movl	$1, %eax
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L22:
	leal	-1(%rbp), %edi
	movl	$1, %ecx
	movl	%ebx, %esi
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L23:
	leal	-1(%rbx), %esi
	xorl	%ecx, %ecx
	movl	%ebp, %edi
	jmp	.L33
	.cfi_endproc
.LFE3:
	.size	runProgram, .-runProgram
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"YES"
.LC1:
	.string	"NO"
.LC2:
	.string	"%d%d"
.LC3:
	.string	"%s"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$width, %edx
	movl	$height, %esi
	movl	$.LC2, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	xorl	%eax, %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	__isoc99_scanf
	movl	height(%rip), %eax
	testl	%eax, %eax
	jle	.L41
	movl	$program, %ebp
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L42:
	movq	%rbp, %rsi
	xorl	%eax, %eax
	movl	$.LC3, %edi
	addl	$1, %ebx
	call	__isoc99_scanf
	addq	$24, %rbp
	cmpl	%ebx, height(%rip)
	jg	.L42
.L41:
	xorl	%edx, %edx
	xorl	%esi, %esi
	xorl	%edi, %edi
	movl	$2, %ecx
	call	runProgram
	movl	$.LC1, %edi
	testl	%eax, %eax
	movl	$.LC0, %eax
	cmovne	%rax, %rdi
	call	puts
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.globl	dxy
	.section	.rodata
	.align 32
	.type	dxy, @object
	.size	dxy, 32
dxy:
	.long	0
	.long	-1
	.long	-1
	.long	0
	.long	1
	.long	0
	.long	0
	.long	1
	.globl	visited
	.bss
	.align 32
	.type	visited, @object
	.size	visited, 25600
visited:
	.zero	25600
	.globl	program
	.align 32
	.type	program, @object
	.size	program, 480
program:
	.zero	480
	.globl	height
	.align 4
	.type	height, @object
	.size	height, 4
height:
	.zero	4
	.globl	width
	.align 4
	.type	width, @object
	.size	width, 4
width:
	.zero	4
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
