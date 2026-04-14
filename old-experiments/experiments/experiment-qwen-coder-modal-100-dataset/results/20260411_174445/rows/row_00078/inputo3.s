	.file	"inputC.c"
	.text
	.p2align 4
	.globl	min
	.type	min, @function
min:
.LFB8:
	.cfi_startproc
	cmpl	%esi, %edi
	movl	%esi, %eax
	cmovle	%edi, %eax
	ret
	.cfi_endproc
.LFE8:
	.size	min, .-min
	.p2align 4
	.globl	calcnCr
	.type	calcnCr, @function
calcnCr:
.LFB9:
	.cfi_startproc
	movl	$nCr+520, %r8d
	xorl	%esi, %esi
	movq	$-512, %rdi
	movq	$1, nCr(%rip)
	.p2align 4,,10
	.p2align 3
.L4:
	movq	nCr+512(%rsi), %rdx
	leaq	nCr+512(%rsi), %rax
	.p2align 4,,10
	.p2align 3
.L5:
	leaq	(%rax,%rdi), %rcx
	addq	$8, %rax
	movq	(%rcx,%rsi), %rcx
	addq	%rcx, %rdx
	addq	(%rax), %rcx
	movq	%rdx, -8(%rax)
	movq	%rcx, %rdx
	movq	%rcx, (%rax)
	cmpq	%r8, %rax
	jne	.L5
	subq	$512, %rdi
	addq	$512, %rsi
	leaq	520(%rax), %r8
	cmpq	$nCr+32760, %rax
	jne	.L4
	ret
	.cfi_endproc
.LFE9:
	.size	calcnCr, .-calcnCr
	.p2align 4
	.globl	rep
	.type	rep, @function
rep:
.LFB10:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	%esi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movslq	%ecx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$512, %rsp
	.cfi_def_cfa_offset 560
	cmpl	$-1, %edi
	je	.L30
	leal	-1(%rdi), %r12d
	movl	%edi, %r13d
	movl	%ebp, %ecx
	movq	%rdx, %rbx
	movl	%r12d, %edi
	call	rep
	movl	$1, %edi
	movl	%r13d, %ecx
	movq	s(%rip), %rax
	sall	%cl, %edi
	xorq	t(%rip), %rax
	movslq	%edi, %rdx
	testq	%rdx, %rax
	je	.L8
	testl	%ebp, %ebp
	jle	.L22
	movq	%rbx, %rdx
	leaq	(%rbx,%rbp,4), %rsi
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L31:
	movslq	%ecx, %r8
	addq	$4, %rdx
	addl	$1, %ecx
	movl	%eax, 256(%rsp,%r8,4)
	cmpq	%rsi, %rdx
	je	.L16
.L19:
	movl	(%rdx), %eax
	testl	%eax, %edi
	jne	.L31
	movslq	%ebx, %r8
	addq	$4, %rdx
	addl	$1, %ebx
	movl	%eax, (%rsp,%r8,4)
	cmpq	%rsi, %rdx
	jne	.L19
.L16:
	addl	$1, %r14d
	leaq	256(%rsp), %rdx
	movl	%r12d, %edi
	movl	%r14d, %esi
	call	rep
	movl	%ebx, %ecx
	movq	%rsp, %rdx
	movl	%r14d, %esi
	movl	%r12d, %edi
	call	rep
.L8:
	addq	$512, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
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
.L30:
	.cfi_restore_state
	movl	k(%rip), %eax
	cmpl	%eax, %ebp
	cmovle	%ebp, %eax
	andl	$1, %r14d
	negl	%r14d
	sbbq	%rsi, %rsi
	movl	%eax, %ecx
	orq	$1, %rsi
	testl	%eax, %eax
	jle	.L8
	movq	%rbp, %rax
	subl	$1, %ecx
	salq	$6, %rbp
	movq	res(%rip), %rdx
	salq	$9, %rax
	addq	%rbp, %rcx
	addq	$nCr+8, %rax
	leaq	nCr+16(,%rcx,8), %rdi
	.p2align 4,,10
	.p2align 3
.L13:
	movq	(%rax), %rcx
	addq	$8, %rax
	imulq	%rsi, %rcx
	addq	%rcx, %rdx
	cmpq	%rax, %rdi
	jne	.L13
	movq	%rdx, res(%rip)
	addq	$512, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
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
.L22:
	.cfi_restore_state
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
	jmp	.L16
	.cfi_endproc
.LFE10:
	.size	rep, .-rep
	.p2align 4
	.type	rep.constprop.5, @function
rep.constprop.5:
.LFB12:
	.cfi_startproc
	movslq	%edx, %r10
	subq	$520, %rsp
	.cfi_def_cfa_offset 528
	movq	%rsi, %rdx
	movl	%edi, %r11d
	movq	%rsi, %r9
	movl	%r10d, %ecx
	movl	%edi, %esi
	movl	$11, %edi
	call	rep
	movq	s(%rip), %rax
	xorq	t(%rip), %rax
	testb	$16, %ah
	je	.L32
	testl	%r10d, %r10d
	jle	.L38
	movq	%r9, %rsi
	leaq	(%r9,%r10,4), %rdx
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L44:
	movslq	%ecx, %rdi
	addq	$4, %rsi
	addl	$1, %ecx
	movl	%eax, 256(%rsp,%rdi,4)
	cmpq	%rsi, %rdx
	je	.L34
.L37:
	movl	(%rsi), %eax
	testb	$16, %ah
	jne	.L44
	movslq	%r9d, %rdi
	addq	$4, %rsi
	addl	$1, %r9d
	movl	%eax, (%rsp,%rdi,4)
	cmpq	%rsi, %rdx
	jne	.L37
.L34:
	addl	$1, %r11d
	leaq	256(%rsp), %rdx
	movl	$11, %edi
	movl	%r11d, %esi
	call	rep
	movl	%r9d, %ecx
	movq	%rsp, %rdx
	movl	%r11d, %esi
	movl	$11, %edi
	call	rep
.L32:
	addq	$520, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L38:
	.cfi_restore_state
	xorl	%r9d, %r9d
	xorl	%ecx, %ecx
	jmp	.L34
	.cfi_endproc
.LFE12:
	.size	rep.constprop.5, .-rep.constprop.5
	.p2align 4
	.type	rep.constprop.4, @function
rep.constprop.4:
.LFB13:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movslq	%edx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%ebp, %edx
	movq	%rsi, %rbx
	subq	$512, %rsp
	.cfi_def_cfa_offset 544
	call	rep.constprop.5
	movq	s(%rip), %rax
	xorq	t(%rip), %rax
	testb	$32, %ah
	je	.L45
	testl	%ebp, %ebp
	jle	.L51
	movq	%rbx, %rsi
	leaq	(%rbx,%rbp,4), %rcx
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L57:
	movslq	%edx, %rdi
	addq	$4, %rsi
	addl	$1, %edx
	movl	%eax, 256(%rsp,%rdi,4)
	cmpq	%rsi, %rcx
	je	.L47
.L50:
	movl	(%rsi), %eax
	testb	$32, %ah
	jne	.L57
	movslq	%ebx, %rdi
	addq	$4, %rsi
	addl	$1, %ebx
	movl	%eax, (%rsp,%rdi,4)
	cmpq	%rsi, %rcx
	jne	.L50
.L47:
	addl	$1, %r12d
	leaq	256(%rsp), %rsi
	movl	%r12d, %edi
	call	rep.constprop.5
	movl	%ebx, %edx
	movq	%rsp, %rsi
	movl	%r12d, %edi
	call	rep.constprop.5
.L45:
	addq	$512, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L51:
	.cfi_restore_state
	xorl	%ebx, %ebx
	xorl	%edx, %edx
	jmp	.L47
	.cfi_endproc
.LFE13:
	.size	rep.constprop.4, .-rep.constprop.4
	.p2align 4
	.type	rep.constprop.3, @function
rep.constprop.3:
.LFB14:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movslq	%edx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%ebp, %edx
	movq	%rsi, %rbx
	subq	$512, %rsp
	.cfi_def_cfa_offset 544
	call	rep.constprop.4
	movq	s(%rip), %rax
	xorq	t(%rip), %rax
	testb	$64, %ah
	je	.L58
	testl	%ebp, %ebp
	jle	.L64
	movq	%rbx, %rsi
	leaq	(%rbx,%rbp,4), %rcx
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	jmp	.L63
	.p2align 4,,10
	.p2align 3
.L70:
	movslq	%edx, %rdi
	addq	$4, %rsi
	addl	$1, %edx
	movl	%eax, 256(%rsp,%rdi,4)
	cmpq	%rsi, %rcx
	je	.L60
.L63:
	movl	(%rsi), %eax
	testb	$64, %ah
	jne	.L70
	movslq	%ebx, %rdi
	addq	$4, %rsi
	addl	$1, %ebx
	movl	%eax, (%rsp,%rdi,4)
	cmpq	%rsi, %rcx
	jne	.L63
.L60:
	addl	$1, %r12d
	leaq	256(%rsp), %rsi
	movl	%r12d, %edi
	call	rep.constprop.4
	movl	%ebx, %edx
	movq	%rsp, %rsi
	movl	%r12d, %edi
	call	rep.constprop.4
.L58:
	addq	$512, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L64:
	.cfi_restore_state
	xorl	%ebx, %ebx
	xorl	%edx, %edx
	jmp	.L60
	.cfi_endproc
.LFE14:
	.size	rep.constprop.3, .-rep.constprop.3
	.p2align 4
	.type	rep.constprop.2, @function
rep.constprop.2:
.LFB15:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movslq	%edx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%ebp, %edx
	movq	%rsi, %rbx
	subq	$512, %rsp
	.cfi_def_cfa_offset 544
	call	rep.constprop.3
	movq	s(%rip), %rax
	xorq	t(%rip), %rax
	testb	$-128, %ah
	je	.L71
	testl	%ebp, %ebp
	jle	.L77
	movq	%rbx, %rsi
	leaq	(%rbx,%rbp,4), %rcx
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L83:
	movslq	%edx, %rdi
	addq	$4, %rsi
	addl	$1, %edx
	movl	%eax, 256(%rsp,%rdi,4)
	cmpq	%rsi, %rcx
	je	.L73
.L76:
	movl	(%rsi), %eax
	testb	$-128, %ah
	jne	.L83
	movslq	%ebx, %rdi
	addq	$4, %rsi
	addl	$1, %ebx
	movl	%eax, (%rsp,%rdi,4)
	cmpq	%rsi, %rcx
	jne	.L76
.L73:
	addl	$1, %r12d
	leaq	256(%rsp), %rsi
	movl	%r12d, %edi
	call	rep.constprop.3
	movl	%ebx, %edx
	movq	%rsp, %rsi
	movl	%r12d, %edi
	call	rep.constprop.3
.L71:
	addq	$512, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L77:
	.cfi_restore_state
	xorl	%ebx, %ebx
	xorl	%edx, %edx
	jmp	.L73
	.cfi_endproc
.LFE15:
	.size	rep.constprop.2, .-rep.constprop.2
	.p2align 4
	.type	rep.constprop.1, @function
rep.constprop.1:
.LFB16:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movslq	%edx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%ebp, %edx
	movq	%rsi, %rbx
	subq	$512, %rsp
	.cfi_def_cfa_offset 544
	call	rep.constprop.2
	movq	s(%rip), %rax
	xorq	t(%rip), %rax
	testl	$65536, %eax
	je	.L84
	testl	%ebp, %ebp
	jle	.L90
	movq	%rbx, %rsi
	leaq	(%rbx,%rbp,4), %rcx
	xorl	%edx, %edx
	xorl	%ebx, %ebx
	jmp	.L89
	.p2align 4,,10
	.p2align 3
.L96:
	movslq	%edx, %rdi
	addq	$4, %rsi
	addl	$1, %edx
	movl	%eax, 256(%rsp,%rdi,4)
	cmpq	%rsi, %rcx
	je	.L86
.L89:
	movl	(%rsi), %eax
	testl	$65536, %eax
	jne	.L96
	movslq	%ebx, %rdi
	addq	$4, %rsi
	addl	$1, %ebx
	movl	%eax, (%rsp,%rdi,4)
	cmpq	%rsi, %rcx
	jne	.L89
.L86:
	addl	$1, %r12d
	leaq	256(%rsp), %rsi
	movl	%r12d, %edi
	call	rep.constprop.2
	movl	%ebx, %edx
	movq	%rsp, %rsi
	movl	%r12d, %edi
	call	rep.constprop.2
.L84:
	addq	$512, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L90:
	.cfi_restore_state
	xorl	%ebx, %ebx
	xorl	%edx, %edx
	jmp	.L86
	.cfi_endproc
.LFE16:
	.size	rep.constprop.1, .-rep.constprop.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d%d%d"
.LC1:
	.string	"0"
.LC2:
	.string	"%d"
.LC3:
	.string	"%lld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$1040, %rsp
	.cfi_def_cfa_offset 1072
	call	calcnCr
	movl	$t, %r8d
	movl	$s, %ecx
	movl	$k, %edx
	leaq	12(%rsp), %rsi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movq	t(%rip), %rax
	notq	%rax
	testq	%rax, s(%rip)
	jne	.L124
	cmpl	$0, 12(%rsp)
	jle	.L101
	leaq	16(%rsp), %rbx
	xorl	%ebp, %ebp
	movq	%rbx, %r12
	.p2align 4,,10
	.p2align 3
.L102:
	movq	%r12, %rsi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	addl	$1, %ebp
	call	__isoc99_scanf
	movslq	12(%rsp), %rax
	addq	$4, %r12
	cmpl	%ebp, %eax
	jg	.L102
	testl	%eax, %eax
	jle	.L101
	movq	s(%rip), %rdi
	movq	t(%rip), %r8
	leaq	(%rbx,%rax,4), %rsi
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L104:
	movslq	(%rbx), %rax
	movq	%rax, %rcx
	movq	%rax, %rdx
	notq	%rcx
	testq	%rdi, %rcx
	jne	.L103
	movq	%r8, %rcx
	notq	%rcx
	testq	%rax, %rcx
	jne	.L103
	movslq	%ebp, %rax
	addl	$1, %ebp
	movl	%edx, 272(%rsp,%rax,4)
.L103:
	addq	$4, %rbx
	cmpq	%rbx, %rsi
	jne	.L104
	movl	%ebp, %edx
	leaq	272(%rsp), %rsi
	xorl	%edi, %edi
	call	rep.constprop.1
	movq	s(%rip), %rax
	xorq	t(%rip), %rax
	testl	$131072, %eax
	je	.L111
	testl	%ebp, %ebp
	jle	.L106
	leaq	272(%rsp), %rax
	movslq	%ebp, %rbp
	xorl	%ebx, %ebx
	xorl	%ecx, %ecx
	leaq	(%rax,%rbp,4), %rsi
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L125:
	movslq	%ecx, %rdi
	addq	$4, %rax
	addl	$1, %ecx
	movl	%edx, 784(%rsp,%rdi,4)
	cmpq	%rax, %rsi
	je	.L110
.L109:
	movl	(%rax), %edx
	testl	$131072, %edx
	jne	.L125
	movslq	%ebx, %rdi
	addq	$4, %rax
	addl	$1, %ebx
	movl	%edx, 528(%rsp,%rdi,4)
	cmpq	%rax, %rsi
	jne	.L109
.L110:
	movl	%ecx, %edx
	leaq	784(%rsp), %rsi
	movl	$1, %edi
	call	rep.constprop.1
	movl	%ebx, %edx
	movl	$1, %edi
	leaq	528(%rsp), %rsi
	call	rep.constprop.1
.L111:
	movq	res(%rip), %rsi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	call	printf
	jmp	.L122
.L124:
	movl	$.LC1, %edi
	call	puts
.L122:
	addq	$1040, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L101:
	.cfi_restore_state
	xorl	%edx, %edx
	leaq	272(%rsp), %rsi
	xorl	%edi, %edi
	call	rep.constprop.1
	movq	t(%rip), %rax
	xorq	s(%rip), %rax
	testl	$131072, %eax
	je	.L111
.L106:
	xorl	%ebx, %ebx
	xorl	%ecx, %ecx
	jmp	.L110
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.globl	k
	.bss
	.align 8
	.type	k, @object
	.size	k, 8
k:
	.zero	8
	.globl	t
	.align 8
	.type	t, @object
	.size	t, 8
t:
	.zero	8
	.globl	s
	.align 8
	.type	s, @object
	.size	s, 8
s:
	.zero	8
	.globl	res
	.align 8
	.type	res, @object
	.size	res, 8
res:
	.zero	8
	.globl	nCr
	.align 32
	.type	nCr, @object
	.size	nCr, 32768
nCr:
	.zero	32768
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
