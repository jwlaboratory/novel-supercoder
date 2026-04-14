.file	"optimized_inputC.s"
	.text
	.p2align 4
	.globl	check
	.type	check, @function
check:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	cmpb	$90, %dil
	jg	.L7
	xorl	%eax, %eax
	cmpb	$90, %sil
	jg	.L7
.L1:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
	cmpb	$96, %bl
	jle	.L8
	xorl	%eax, %eax
	cmpb	$96, %bpl
	jg	.L1
.L8:
	call	__ctype_toupper_loc
	movsbq	%bl, %rbx
	movsbq	%bpl, %rbp
	movq	(%rax), %rax
	movl	(%rax,%rbp,4), %edx
	cmpl	%edx, (%rax,%rbx,4)
	sete	%al
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movzbl	%al, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5:
	.size	check, .-check
	.p2align 4
	.globl	combi
	.type	combi, @function
combi:
.LFB6:
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	%edi, 8(%rsp)
	cmpl	$9, %edi
	je	.L18
	movl	%edi, %eax
	movl	$1, %ebp
	addl	$1, %eax
	movl	%eax, 12(%rsp)
.L30:
	cmpb	$0, f(%rbp)
	je	.L69
.L19:
	addq	$1, %rbp
	cmpq	$9, %rbp
	jne	.L30
	addq	$24, %rsp
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
.L69:
	.cfi_restore_state
	movslq	8(%rsp), %rax
	movslq	%ebp, %rcx
	movl	$rot+4, %r12d
	leaq	dice(,%rcx,8), %r13
	leaq	(%rax,%rax,2), %r14
	leaq	0(,%rax,8), %r15
	salq	$4, %r14
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L29:
	movslq	8(%rsi), %rcx
	movslq	4(%rsi), %rsi
	movzbl	kari(%rcx,%r15), %ecx
	movzbl	kari(%rsi,%rax,8), %ebx
	cmpb	$90, %cl
	jg	.L32
	cmpb	$90, %bl
	jle	.L21
.L32:
	cmpb	$96, %cl
	jle	.L33
	cmpb	$96, %bl
	jg	.L21
.L33:
	movb	%cl, 7(%rsp)
	call	__ctype_toupper_loc
	movsbq	7(%rsp), %rcx
	movsbq	%bl, %rdi
	movq	(%rax), %rsi
	movl	(%rsi,%rdi,4), %eax
	cmpl	%eax, (%rsi,%rcx,4)
	jne	.L21
	movslq	con+12(%r14), %rax
	testl	%eax, %eax
	je	.L24
	movslq	con+20(%r14), %rdi
	movslq	con+16(%r14), %rcx
	movsbq	kari(%rdi,%r15), %rdi
	movsbq	kari(%rcx,%rax,8), %rax
	cmpb	$90, %dil
	jg	.L34
	cmpb	$90, %al
	jle	.L21
.L34:
	cmpb	$96, %dil
	jle	.L35
	cmpb	$96, %al
	jg	.L21
.L35:
	movl	(%rsi,%rax,4), %eax
	cmpl	%eax, (%rsi,%rdi,4)
	jne	.L21
	movslq	con+24(%r14), %rax
	testl	%eax, %eax
	je	.L24
	movslq	con+32(%r14), %rdi
	movslq	con+28(%r14), %rcx
	movsbq	kari(%rdi,%r15), %rdi
	movsbq	kari(%rcx,%rax,8), %rax
	cmpb	$90, %dil
	jg	.L36
	cmpb	$90, %al
	jle	.L21
.L36:
	cmpb	$96, %dil
	jle	.L37
	cmpb	$96, %al
	jg	.L21
.L37:
	movl	(%rsi,%rdi,4), %edx
	cmpl	%edx, (%rsi,%rax,4)
	jne	.L21
	movl	con+36(%r14), %eax
	testl	%eax, %eax
	je	.L24
.L21:
	addq	$28, %r12
	cmpq	$rot+676, %r12
	je	.L19
.L20:
	movslq	12(%r12), %rax
	movslq	8(%r12), %rdi
	movslq	4(%r12), %rsi
	movslq	(%r12), %rcx
	movzbl	0(%r13,%rax), %eax
	movzbl	0(%r13,%rdi), %edi
	movzbl	0(%r13,%rsi), %esi
	movzbl	0(%r13,%rcx), %ecx
	sall	$8,
