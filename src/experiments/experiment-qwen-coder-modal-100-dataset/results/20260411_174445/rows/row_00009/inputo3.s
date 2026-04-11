	.file	"inputC.c"
	.text
	.p2align 4
	.globl	calc
	.type	calc, @function
calc:
.LFB3:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdx, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movsbq	(%rsi), %rdx
	cmpb	$91, %dl
	je	.L16
	movsbq	tr(%rdx), %rdx
	leaq	1(%rsi), %rax
	movsbl	(%rbx,%rdx), %edx
.L8:
	movl	%edx, 0(%rbp)
	cmpb	$93, (%rax)
	jne	.L1
	.p2align 4,,10
	.p2align 3
.L10:
	addq	$1, %rax
	cmpb	$93, (%rax)
	je	.L10
.L1:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
	movsbq	2(%rsi), %rax
	movzbl	1(%rsi), %r13d
	cmpb	$91, %al
	je	.L17
	movsbq	tr(%rax), %rax
	addq	$3, %rsi
	movsbl	(%rbx,%rax), %r12d
	movl	%r12d, 8(%rsp)
.L4:
	movsbq	(%rsi), %rdx
	cmpb	$91, %dl
	je	.L18
	movsbq	tr(%rdx), %rdx
	leaq	1(%rsi), %rax
	movsbl	(%rbx,%rdx), %edx
.L6:
	cmpb	$43, %r13b
	je	.L19
	movl	%r12d, %ecx
	andl	%edx, %ecx
	xorl	%r12d, %edx
	cmpb	$42, %r13b
	cmove	%ecx, %edx
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L19:
	orl	%r12d, %edx
	jmp	.L8
.L18:
	movq	%rbx, %rdx
	leaq	12(%rsp), %rdi
	call	calc
	movl	12(%rsp), %edx
	jmp	.L6
.L17:
	addq	$2, %rsi
	movq	%rbx, %rdx
	leaq	8(%rsp), %rdi
	call	calc
	movl	8(%rsp), %r12d
	movq	%rax, %rsi
	jmp	.L4
	.cfi_endproc
.LFE3:
	.size	calc, .-calc
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB4:
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movl	$50462976, tr+97(%rip)
.L21:
	movq	stdin(%rip), %rdx
	movl	$100, %esi
	movl	$S, %edi
	call	fgets
	testq	%rax, %rax
	je	.L47
	cmpb	$46, S(%rip)
	je	.L47
	movq	stdin(%rip), %rdx
	movl	$10, %esi
	leaq	20(%rsp), %rdi
	call	fgets
	movzbl	S(%rip), %ebx
	andl	$252645135, 20(%rsp)
	cmpb	$91, %bl
	je	.L65
	movsbq	%bl, %rax
	movzbl	S+1(%rip), %ecx
	movsbq	tr(%rax), %rax
	movl	%ecx, %r10d
	movsbl	20(%rsp,%rax), %r11d
	movl	$S+1, %eax
.L28:
	cmpb	$93, %cl
	jne	.L31
.L30:
	addq	$1, %rax
	cmpb	$93, (%rax)
	je	.L30
.L31:
	movb	$0, 20(%rsp)
	movl	$1, %r12d
	xorl	%r9d, %r9d
	movsbl	%bl, %ebp
.L46:
	movb	$0, 21(%rsp)
	xorl	%r13d, %r13d
.L45:
	movb	$0, 22(%rsp)
	movl	$1, %r14d
	.p2align 4,,10
	.p2align 3
.L44:
	movb	$0, 23(%rsp)
	movl	$1, %r8d
	.p2align 4,,10
	.p2align 3
.L43:
	cmpb	$91, %bl
	je	.L66
	movslq	%ebp, %rax
	movl	%r10d, %ecx
	movsbq	tr(%rax), %rax
	movsbl	20(%rsp,%rax), %edx
	movl	$S+1, %eax
.L38:
	cmpb	$93, %cl
	jne	.L41
	.p2align 4,,10
	.p2align 3
.L40:
	addq	$1, %rax
	cmpb	$93, (%rax)
	je	.L40
.L41:
	xorl	%eax, %eax
	cmpl	%r11d, %edx
	movb	%r8b, 23(%rsp)
	sete	%al
	addl	$1, %r8d
	addl	%eax, %r9d
	cmpb	$11, %r8b
	jne	.L43
	movb	%r14b, 22(%rsp)
	addl	$1, %r14d
	cmpb	$11, %r14b
	jne	.L44
	addl	$1, %r13d
	movb	%r13b, 21(%rsp)
	cmpb	$10, %r13b
	jne	.L45
	movb	%r12b, 20(%rsp)
	addl	$1, %r12d
	cmpb	$11, %r12b
	jne	.L46
	movl	%r9d, %edx
	movl	%r11d, %esi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L21
.L47:
	addq	$40, %rsp
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
.L66:
	.cfi_restore_state
	movsbq	S+2(%rip), %rax
	cmpb	$91, %al
	je	.L67
	movsbq	tr(%rax), %rax
	movl	$S+3, %esi
	movsbl	20(%rsp,%rax), %r15d
	movl	%r15d, 12(%rsp)
.L34:
	movsbq	(%rsi), %rdx
	cmpb	$91, %dl
	je	.L68
	movsbq	tr(%rdx), %rdx
	leaq	1(%rsi), %rax
	movsbl	20(%rsp,%rdx), %edx
.L36:
	movzbl	(%rax), %ecx
	cmpb	$43, %r10b
	je	.L69
	movl	%edx, %esi
	xorl	%r15d, %edx
	andl	%r15d, %esi
	cmpb	$42, %r10b
	cmove	%esi, %edx
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L69:
	orl	%r15d, %edx
	jmp	.L38
.L68:
	leaq	20(%rsp), %rdx
	leaq	16(%rsp), %rdi
	call	calc
	movl	16(%rsp), %edx
	jmp	.L36
.L67:
	movl	$S+2, %esi
	leaq	20(%rsp), %rdx
	leaq	12(%rsp), %rdi
	call	calc
	movl	12(%rsp), %r15d
	movq	%rax, %rsi
	jmp	.L34
.L65:
	movsbq	S+2(%rip), %rax
	movzbl	S+1(%rip), %r10d
	cmpb	$91, %al
	je	.L70
	movsbq	tr(%rax), %rax
	movsbl	20(%rsp,%rax), %r11d
	movl	$S+3, %eax
	movl	%r11d, 12(%rsp)
.L24:
	movsbq	(%rax), %rdx
	cmpb	$91, %dl
	je	.L71
	movsbq	tr(%rdx), %rdx
	addq	$1, %rax
	movsbl	20(%rsp,%rdx), %edx
.L26:
	movzbl	(%rax), %ecx
	cmpb	$43, %r10b
	je	.L72
	movl	%r11d, %esi
	xorl	%edx, %r11d
	andl	%edx, %esi
	cmpb	$42, %r10b
	cmove	%esi, %r11d
	jmp	.L28
.L72:
	orl	%edx, %r11d
	jmp	.L28
.L71:
	leaq	20(%rsp), %rdx
	movq	%rax, %rsi
	leaq	16(%rsp), %rdi
	call	calc
	movl	16(%rsp), %edx
	jmp	.L26
.L70:
	leaq	20(%rsp), %rdx
	movl	$S+2, %esi
	leaq	12(%rsp), %rdi
	call	calc
	movl	12(%rsp), %r11d
	jmp	.L24
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.globl	S
	.bss
	.align 32
	.type	S, @object
	.size	S, 100
S:
	.zero	100
	.globl	tr
	.align 32
	.type	tr, @object
	.size	tr, 101
tr:
	.zero	101
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
