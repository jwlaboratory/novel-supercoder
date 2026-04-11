	.file	"inputC.c"
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
	sall	$8, %eax
	orl	%edi, %eax
	sall	$8, %eax
	orl	%esi, %eax
	leaq	con(%r14), %rsi
	sall	$8, %eax
	orl	%ecx, %eax
	movl	%eax, kari+1(%r15)
	movslq	16(%r12), %rcx
	xorl	%eax, %eax
	movb	0(%r13,%rcx), %al
	movslq	20(%r12), %rcx
	movzbl	0(%r13,%rcx), %edx
	movb	%dl, %ah
	movw	%ax, kari+5(%r15)
	movslq	con(%r14), %rax
	testl	%eax, %eax
	jne	.L29
.L24:
	movl	12(%rsp), %edi
	movb	$1, f(%rbp)
	call	combi
	testl	%eax, %eax
	jne	.L18
	movb	$0, f(%rbp)
	jmp	.L21
.L18:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movl	$1, %eax
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
	.cfi_endproc
.LFE6:
	.size	combi, .-combi
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"YES"
.LC1:
	.string	"NO"
.LC2:
	.string	"%s"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB7:
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
	subq	$632, %rsp
	.cfi_def_cfa_offset 688
.L173:
	movl	$dice+9, %ebp
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L75:
	xorl	%eax, %eax
	movq	%rbp, %rsi
	movl	$.LC2, %edi
	call	__isoc99_scanf
	cmpq	$1, %rbx
	je	.L450
	movb	$0, f(%rbx)
	addq	$1, %rbx
	addq	$8, %rbp
	cmpq	$9, %rbx
	jne	.L75
	movl	con+144(%rip), %eax
	movl	con+48(%rip), %r13d
	movl	$1, %r14d
	movl	con+60(%rip), %r11d
	movl	con+96(%rip), %r8d
	movl	%eax, 376(%rsp)
	movl	con+192(%rip), %eax
	movl	%r13d, %r15d
	movq	%r14, %r13
	movl	con+72(%rip), %r9d
	movl	%r11d, %r12d
	movl	%eax, 372(%rsp)
	movl	con+240(%rip), %eax
	movl	%eax, 368(%rsp)
	movl	con+288(%rip), %eax
	movl	%eax, 380(%rsp)
	movl	con+336(%rip), %eax
	movl	%eax, 16(%rsp)
	movl	con+384(%rip), %eax
	movl	%eax, 8(%rsp)
	movl	con+52(%rip), %eax
	movl	%eax, 92(%rsp)
	movl	con+56(%rip), %eax
	movl	%eax, 104(%rsp)
	movl	con+64(%rip), %eax
	movl	%eax, 176(%rsp)
	movl	con+68(%rip), %eax
	movl	%eax, 180(%rsp)
	movl	con+76(%rip), %eax
	movl	%eax, 264(%rsp)
	movl	con+80(%rip), %eax
	movl	%eax, 268(%rsp)
	movl	con+84(%rip), %eax
	movl	%eax, 292(%rsp)
	movl	con+100(%rip), %eax
	movl	%eax, 84(%rsp)
	movl	con+104(%rip), %eax
	movl	%eax, 88(%rsp)
	movl	con+108(%rip), %eax
	movl	%eax, 408(%rsp)
	movl	con+112(%rip), %eax
	movl	%eax, 168(%rsp)
	movl	con+116(%rip), %eax
	movl	%eax, 172(%rsp)
	movl	con+120(%rip), %eax
	movl	%eax, 208(%rsp)
	movl	con+124(%rip), %eax
	movl	%eax, 256(%rsp)
	movl	con+128(%rip), %eax
	movl	%eax, 260(%rsp)
	movl	con+132(%rip), %eax
	movl	%eax, 288(%rsp)
	movl	con+148(%rip), %eax
	movl	%eax, 60(%rsp)
	movl	con+152(%rip), %eax
	movl	%eax, 56(%rsp)
	movl	con+156(%rip), %eax
	movl	%eax, 364(%rsp)
	movl	con+160(%rip), %eax
	movl	%eax, 140(%rsp)
	movl	con+164(%rip), %eax
	movl	%eax, 136(%rsp)
	movl	con+168(%rip), %eax
	movl	%eax, 388(%rsp)
	movl	con+172(%rip), %eax
	movl	%eax, 248(%rsp)
	movl	con+176(%rip), %eax
	movl	%eax, 252(%rsp)
	movl	con+180(%rip), %eax
	movl	%eax, 284(%rsp)
	movl	con+196(%rip), %eax
	movl	%eax, 68(%rsp)
	movl	con+200(%rip), %eax
	movl	%eax, 64(%rsp)
	movl	con+204(%rip), %eax
	movl	%eax, 108(%rsp)
	movl	con+208(%rip), %eax
	movl	%eax, 148(%rsp)
	movl	con+212(%rip), %eax
	movl	%eax, 144(%rsp)
	movl	con+216(%rip), %eax
	movl	%eax, 192(%rsp)
	movl	con+220(%rip), %eax
	movl	%eax, 232(%rsp)
	movl	con+224(%rip), %eax
	movl	%eax, 228(%rsp)
	movl	con+228(%rip), %eax
	movl	%eax, 272(%rsp)
	movl	con+244(%rip), %eax
	movl	%eax, 76(%rsp)
	movl	con+248(%rip), %eax
	movl	%eax, 72(%rsp)
	movl	con+252(%rip), %eax
	movl	%eax, 120(%rsp)
	movl	con+256(%rip), %eax
	movl	%eax, 156(%rsp)
	movl	con+260(%rip), %eax
	movl	%eax, 152(%rsp)
	movl	con+264(%rip), %eax
	movl	%eax, 196(%rsp)
	movl	con+268(%rip), %eax
	movslq	con+348(%rip), %rdx
	movl	%eax, 240(%rsp)
	movl	con+272(%rip), %eax
	movl	%edx, 80(%rsp)
	movl	%eax, 236(%rsp)
	movl	con+276(%rip), %eax
	movl	%eax, 276(%rsp)
	movl	con+292(%rip), %eax
	movl	%eax, 48(%rsp)
	movl	con+296(%rip), %eax
	movl	%eax, 44(%rsp)
	movl	con+300(%rip), %eax
	movl	%eax, 384(%rsp)
	movl	con+304(%rip), %eax
	movl	%eax, 164(%rsp)
	movl	con+308(%rip), %eax
	movl	%eax, 160(%rsp)
	movl	con+312(%rip), %eax
	movl	%eax, 200(%rsp)
	movl	con+316(%rip), %eax
	movl	%eax, 216(%rsp)
	movl	con+320(%rip), %eax
	movl	%eax, 212(%rsp)
	movl	con+324(%rip), %eax
	movl	%eax, 280(%rsp)
	movl	con+340(%rip), %eax
	movl	%eax, 320(%rsp)
	movl	con+344(%rip), %eax
	movl	%eax, 52(%rsp)
	movl	con+356(%rip), %eax
	movl	%eax, 124(%rsp)
	movl	con+360(%rip), %eax
	movl	con+388(%rip), %ebp
	movl	%eax, 20(%rsp)
	movl	con+364(%rip), %eax
	movl	%eax, 224(%rsp)
	movl	con+368(%rip), %eax
	movl	%eax, 220(%rsp)
	movl	con+372(%rip), %eax
	movl	%eax, 244(%rsp)
	movl	con+392(%rip), %eax
	movl	%eax, 336(%rsp)
	movl	con+396(%rip), %eax
	movl	%eax, 12(%rsp)
	movl	con+400(%rip), %eax
	movl	%eax, 360(%rsp)
	movl	con+404(%rip), %eax
	movl	%eax, 332(%rsp)
	movl	con+408(%rip), %eax
	movl	%eax, 40(%rsp)
	movl	con+412(%rip), %eax
	movl	%eax, 328(%rsp)
	movl	con+416(%rip), %eax
	movl	%eax, 324(%rsp)
	movl	con+420(%rip), %eax
	movl	%eax, 204(%rsp)
	movslq	con+352(%rip), %rax
	leaq	kari(%rax,%rdx,8), %rax
	movq	%rax, 128(%rsp)
.L172:
	cmpb	$0, f(%r13)
	je	.L451
.L76:
	addq	$1, %r13
	cmpq	$9, %r13
	jne	.L172
	movl	$.LC1, %edi
	jmp	.L156
	.p2align 4,,10
	.p2align 3
.L450:
	cmpb	$48, dice+9(%rip)
	je	.L286
	movb	$0, f+1(%rip)
	addq	$8, %rbp
	movl	$2, %ebx
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L451:
	movslq	8(%rsp), %rdx
	movslq	%ebp, %rax
	movslq	%r13d, %rcx
	movl	$rot+4, %ebx
	movl	%ebp, 468(%rsp)
	movl	%r9d, %ebp
	leaq	kari(%rax,%rdx,8), %rax
	movq	%r13, 296(%rsp)
	movl	%r12d, %r13d
	movl	%r8d, %r12d
	movq	%rax, 32(%rsp)
.L77:
	movslq	12(%rbx), %rax
	leaq	dice(,%rcx,8), %rdx
	movslq	8(%rbx), %r8
	movslq	4(%rbx), %rdi
	movslq	(%rbx), %rsi
	movzbl	(%rdx,%rax), %eax
	movzbl	(%rdx,%r8), %r8d
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rdx,%rsi), %esi
	sall	$8, %eax
	orl	%r8d, %eax
	sall	$8, %eax
	orl	%edi, %eax
	sall	$8, %eax
	orl	%esi, %eax
	movslq	16(%rbx), %rsi
	movl	%eax, kari+9(%rip)
	xorl	%eax, %eax
	movb	(%rdx,%rsi), %al
	movslq	20(%rbx), %rsi
	movb	(%rdx,%rsi), %ah
	movw	%ax, kari+13(%rip)
	testl	%r15d, %r15d
	je	.L81
	movslq	104(%rsp), %rax
	movslq	%r15d, %rsi
	movzbl	kari+8(%rax), %edx
	movslq	92(%rsp), %rax
	movsbq	kari(%rax,%rsi,8), %r14
	cmpb	$90, %r14b
	jg	.L174
	cmpb	$90, %dl
	jle	.L78
.L174:
	cmpb	$96, %r14b
	jle	.L175
	cmpb	$96, %dl
	jg	.L78
.L175:
	movq	%rcx, 96(%rsp)
	movb	%dl, 24(%rsp)
	call	__ctype_toupper_loc
	movsbq	24(%rsp), %rdx
	movq	96(%rsp), %rcx
	movq	(%rax), %rsi
	movl	(%rsi,%rdx,4), %eax
	cmpl	%eax, (%rsi,%r14,4)
	jne	.L78
	testl	%r13d, %r13d
	je	.L81
	movslq	180(%rsp), %rax
	movslq	%r13d, %rdi
	movsbq	kari+8(%rax), %rdx
	movslq	176(%rsp), %rax
	movsbq	kari(%rax,%rdi,8), %rax
	cmpb	$90, %al
	jg	.L176
	cmpb	$90, %dl
	jle	.L78
.L176:
	cmpb	$96, %al
	jle	.L177
	cmpb	$96, %dl
	jg	.L78
.L177:
	movl	(%rsi,%rdx,4), %edi
	cmpl	%edi, (%rsi,%rax,4)
	jne	.L78
	testl	%ebp, %ebp
	je	.L81
	movslq	268(%rsp), %rax
	movslq	%ebp, %rdi
	movsbq	kari+8(%rax), %rdx
	movslq	264(%rsp), %rax
	movsbq	kari(%rax,%rdi,8), %rax
	cmpb	$90, %al
	jg	.L178
	cmpb	$90, %dl
	jle	.L78
.L178:
	cmpb	$96, %al
	jle	.L179
	cmpb	$96, %dl
	jle	.L179
	.p2align 4,,10
	.p2align 3
.L78:
	addq	$28, %rbx
	cmpq	$rot+676, %rbx
	jne	.L77
	movl	%r12d, %r8d
	movl	%ebp, %r9d
	movl	%r13d, %r12d
	movl	468(%rsp), %ebp
	movq	296(%rsp), %r13
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L179:
	movl	(%rsi,%rdx,4), %edi
	cmpl	%edi, (%rsi,%rax,4)
	jne	.L78
	movl	292(%rsp), %eax
	testl	%eax, %eax
	jne	.L78
.L81:
	movq	296(%rsp), %rax
	movl	$1, %r14d
	movl	%r13d, %edx
	movq	%rcx, %rsi
	movl	%r12d, %r13d
	movq	%rbx, %rcx
	movl	%ebp, %r12d
	movq	%r14, %rbp
	movb	$1, f(%rax)
	movslq	20(%rsp), %rax
	movq	%rax, 312(%rsp)
.L170:
	cmpb	$0, f(%rbp)
	je	.L452
.L86:
	addq	$1, %rbp
	cmpq	$9, %rbp
	jne	.L170
	movq	296(%rsp), %rax
	movq	%rcx, %rbx
	movl	%r12d, %ebp
	movq	%rsi, %rcx
	movl	%r13d, %r12d
	movl	%edx, %r13d
	movb	$0, f(%rax)
	jmp	.L78
	.p2align 4,,10
	.p2align 3
.L452:
	movslq	%ebp, %r14
	movq	%rcx, 472(%rsp)
	movl	$rot+4, %ebx
	movl	%edx, 484(%rsp)
	movl	%r12d, 504(%rsp)
	movq	%rsi, 488(%rsp)
	movl	%r15d, 480(%rsp)
	movq	%rbp, %r15
	movq	%r14, %rbp
	movl	408(%rsp), %r14d
.L87:
	movslq	12(%rbx), %rax
	leaq	dice(,%rbp,8), %rdx
	movslq	8(%rbx), %rdi
	movslq	4(%rbx), %rsi
	movslq	(%rbx), %rcx
	movzbl	(%rdx,%rax), %eax
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rdx,%rsi), %esi
	movzbl	(%rdx,%rcx), %ecx
	sall	$8, %eax
	orl	%edi, %eax
	sall	$8, %eax
	orl	%esi, %eax
	sall	$8, %eax
	orl	%ecx, %eax
	movslq	16(%rbx), %rcx
	movl	%eax, kari+17(%rip)
	xorl	%eax, %eax
	movb	(%rdx,%rcx), %al
	movslq	20(%rbx), %rcx
	movb	(%rdx,%rcx), %ah
	movw	%ax, kari+21(%rip)
	testl	%r13d, %r13d
	je	.L91
	movslq	88(%rsp), %rax
	movslq	%r13d, %rcx
	movzbl	kari+16(%rax), %edx
	movslq	84(%rsp), %rax
	movsbq	kari(%rax,%rcx,8), %r12
	cmpb	$90, %r12b
	jg	.L180
	cmpb	$90, %dl
	jle	.L88
.L180:
	cmpb	$96, %r12b
	jle	.L181
	cmpb	$96, %dl
	jg	.L88
.L181:
	movb	%dl, 24(%rsp)
	call	__ctype_toupper_loc
	movsbq	24(%rsp), %rdx
	movq	(%rax), %rcx
	movl	(%rcx,%rdx,4), %eax
	cmpl	%eax, (%rcx,%r12,4)
	jne	.L88
	testl	%r14d, %r14d
	je	.L91
	movslq	172(%rsp), %rax
	movslq	%r14d, %rsi
	movsbq	kari+16(%rax), %rdx
	movslq	168(%rsp), %rax
	movsbq	kari(%rax,%rsi,8), %rax
	cmpb	$90, %al
	jg	.L182
	cmpb	$90, %dl
	jle	.L88
.L182:
	cmpb	$96, %al
	jle	.L183
	cmpb	$96, %dl
	jg	.L88
.L183:
	movl	(%rcx,%rdx,4), %edi
	cmpl	%edi, (%rcx,%rax,4)
	jne	.L88
	movl	208(%rsp), %edi
	testl	%edi, %edi
	je	.L91
	movslq	260(%rsp), %rax
	movslq	%edi, %rsi
	movsbq	kari+16(%rax), %rdx
	movslq	256(%rsp), %rax
	movsbq	kari(%rax,%rsi,8), %rax
	cmpb	$90, %al
	jg	.L184
	cmpb	$90, %dl
	jle	.L88
.L184:
	cmpb	$96, %al
	jle	.L185
	cmpb	$96, %dl
	jle	.L185
	.p2align 4,,10
	.p2align 3
.L88:
	addq	$28, %rbx
	cmpq	$rot+676, %rbx
	jne	.L87
	movq	%r15, %rbp
	movq	472(%rsp), %rcx
	movl	480(%rsp), %r15d
	movl	484(%rsp), %edx
	movl	504(%rsp), %r12d
	movq	488(%rsp), %rsi
	jmp	.L86
	.p2align 4,,10
	.p2align 3
.L185:
	movl	(%rcx,%rdx,4), %edi
	cmpl	%edi, (%rcx,%rax,4)
	jne	.L88
	movl	288(%rsp), %eax
	testl	%eax, %eax
	jne	.L88
.L91:
	movq	312(%rsp), %rax
	movb	$1, f(%r15)
	movl	$1, %r12d
	movq	%rbx, %rdi
	salq	$3, %rax
	movq	%rax, 304(%rsp)
	movl	%r14d, %eax
	movl	%r13d, %r14d
	movq	%r12, %r13
.L168:
	cmpb	$0, f(%r13)
	je	.L453
.L96:
	addq	$1, %r13
	cmpq	$9, %r13
	jne	.L168
	movl	%r14d, %r13d
	movb	$0, f(%r15)
	movq	%rdi, %rbx
	movl	%eax, %r14d
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L453:
	movslq	%r13d, %rsi
	movq	%rdi, 496(%rsp)
	movl	$rot+4, %ebx
	movq	%rsi, 112(%rsp)
	movl	%eax, 536(%rsp)
	movl	%r14d, 508(%rsp)
	movl	376(%rsp), %r14d
	movq	%r15, 512(%rsp)
	movl	364(%rsp), %r15d
	movq	%rbp, 520(%rsp)
	movl	388(%rsp), %ebp
.L97:
	movq	112(%rsp), %rax
	movslq	8(%rbx), %rdi
	movslq	4(%rbx), %rsi
	movslq	(%rbx), %rcx
	leaq	dice(,%rax,8), %rdx
	movslq	12(%rbx), %rax
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rdx,%rsi), %esi
	movzbl	(%rdx,%rax), %eax
	movzbl	(%rdx,%rcx), %ecx
	sall	$8, %eax
	orl	%edi, %eax
	sall	$8, %eax
	orl	%esi, %eax
	sall	$8, %eax
	orl	%ecx, %eax
	movslq	16(%rbx), %rcx
	movl	%eax, kari+25(%rip)
	xorl	%eax, %eax
	movb	(%rdx,%rcx), %al
	movslq	20(%rbx), %rcx
	movb	(%rdx,%rcx), %ah
	movw	%ax, kari+29(%rip)
	testl	%r14d, %r14d
	je	.L101
	movslq	56(%rsp), %rax
	movslq	%r14d, %rdx
	movsbq	kari+24(%rax), %r12
	movslq	60(%rsp), %rax
	movzbl	kari(%rax,%rdx,8), %edx
	cmpb	$90, %r12b
	jg	.L186
	cmpb	$90, %dl
	jle	.L98
.L186:
	cmpb	$96, %r12b
	jle	.L187
	cmpb	$96, %dl
	jg	.L98
.L187:
	movb	%dl, 24(%rsp)
	call	__ctype_toupper_loc
	movsbq	24(%rsp), %rdx
	movq	(%rax), %rcx
	movl	(%rcx,%rdx,4), %eax
	cmpl	%eax, (%rcx,%r12,4)
	jne	.L98
	testl	%r15d, %r15d
	je	.L101
	movslq	136(%rsp), %rax
	movslq	%r15d, %rsi
	movsbq	kari+24(%rax), %rdx
	movslq	140(%rsp), %rax
	movsbq	kari(%rax,%rsi,8), %rax
	cmpb	$90, %dl
	jg	.L188
	cmpb	$90, %al
	jle	.L98
.L188:
	cmpb	$96, %dl
	jle	.L189
	cmpb	$96, %al
	jg	.L98
.L189:
	movl	(%rcx,%rax,4), %eax
	cmpl	%eax, (%rcx,%rdx,4)
	jne	.L98
	testl	%ebp, %ebp
	je	.L101
	movslq	252(%rsp), %rax
	movslq	%ebp, %rsi
	movsbq	kari+24(%rax), %rdx
	movslq	248(%rsp), %rax
	movsbq	kari(%rax,%rsi,8), %rax
	cmpb	$90, %al
	jg	.L190
	cmpb	$90, %dl
	jle	.L98
.L190:
	cmpb	$96, %al
	jle	.L191
	cmpb	$96, %dl
	jle	.L191
	.p2align 4,,10
	.p2align 3
.L98:
	addq	$28, %rbx
	cmpq	$rot+676, %rbx
	jne	.L97
	movq	496(%rsp), %rdi
	movl	508(%rsp), %r14d
	movl	536(%rsp), %eax
	movq	512(%rsp), %r15
	movq	520(%rsp), %rbp
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L191:
	movl	(%rcx,%rdx,4), %edi
	cmpl	%edi, (%rcx,%rax,4)
	jne	.L98
	movl	284(%rsp), %eax
	testl	%eax, %eax
	jne	.L98
.L101:
	movq	304(%rsp), %rax
	movl	$1, %r12d
	movq	%r13, %rcx
	movl	%r15d, %esi
	movb	$1, f(%r13)
	movl	%r14d, %r15d
	movl	%ebp, %r13d
	movq	%r12, %rbp
	addq	$kari, %rax
	movq	%rax, 184(%rsp)
	movq	%rbx, %rax
.L166:
	cmpb	$0, f(%rbp)
	je	.L454
.L106:
	addq	$1, %rbp
	cmpq	$9, %rbp
	jne	.L166
	movl	%r15d, %r14d
	movl	%r13d, %ebp
	movb	$0, f(%rcx)
	movq	%rax, %rbx
	movl	%esi, %r15d
	movq	%rcx, %r13
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L454:
	movq	%rcx, 528(%rsp)
	movslq	%ebp, %rdx
	movl	$rot+4, %ebx
	movl	%esi, 540(%rsp)
	leaq	dice(,%rdx,8), %r14
	movq	%rax, 544(%rsp)
	movl	%r15d, 552(%rsp)
	movl	%r13d, 556(%rsp)
	movl	372(%rsp), %r13d
.L107:
	movslq	12(%rbx), %rax
	movslq	8(%rbx), %rsi
	movslq	4(%rbx), %rcx
	movslq	(%rbx), %rdx
	movzbl	(%r14,%rax), %eax
	movzbl	(%r14,%rsi), %esi
	movzbl	(%r14,%rcx), %ecx
	movzbl	(%r14,%rdx), %edx
	sall	$8, %eax
	orl	%esi, %eax
	sall	$8, %eax
	orl	%ecx, %eax
	sall	$8, %eax
	orl	%edx, %eax
	movslq	16(%rbx), %rdx
	movl	%eax, kari+33(%rip)
	xorl	%eax, %eax
	movb	(%r14,%rdx), %al
	movslq	20(%rbx), %rdx
	movzbl	(%r14,%rdx), %ecx
	movb	%cl, %ah
	movw	%ax, kari+37(%rip)
	testl	%r13d, %r13d
	je	.L111
	movslq	64(%rsp), %rax
	movslq	%r13d, %rdx
	movsbq	kari+32(%rax), %r12
	movslq	68(%rsp), %rax
	movsbq	kari(%rax,%rdx,8), %r15
	cmpb	$90, %r12b
	jg	.L192
	cmpb	$90, %r15b
	jle	.L108
.L192:
	cmpb	$96, %r12b
	jle	.L193
	cmpb	$96, %r15b
	jg	.L108
.L193:
	call	__ctype_toupper_loc
	movq	(%rax), %rcx
	movl	(%rcx,%r15,4), %eax
	cmpl	%eax, (%rcx,%r12,4)
	jne	.L108
	movl	108(%rsp), %edi
	testl	%edi, %edi
	je	.L111
	movslq	144(%rsp), %rax
	movslq	%edi, %rsi
	movsbq	kari+32(%rax), %rdx
	movslq	148(%rsp), %rax
	movsbq	kari(%rax,%rsi,8), %rax
	cmpb	$90, %dl
	jg	.L194
	cmpb	$90, %al
	jle	.L108
.L194:
	cmpb	$96, %dl
	jle	.L195
	cmpb	$96, %al
	jg	.L108
.L195:
	movl	(%rcx,%rax,4), %eax
	cmpl	%eax, (%rcx,%rdx,4)
	jne	.L108
	movl	192(%rsp), %edi
	testl	%edi, %edi
	je	.L111
	movslq	228(%rsp), %rax
	movslq	%edi, %rsi
	movsbq	kari+32(%rax), %rdx
	movslq	232(%rsp), %rax
	movsbq	kari(%rax,%rsi,8), %rax
	cmpb	$90, %dl
	jg	.L196
	cmpb	$90, %al
	jle	.L108
.L196:
	cmpb	$96, %dl
	jle	.L197
	cmpb	$96, %al
	jle	.L197
	.p2align 4,,10
	.p2align 3
.L108:
	addq	$28, %rbx
	cmpq	$rot+676, %rbx
	jne	.L107
	movq	528(%rsp), %rcx
	movl	540(%rsp), %esi
	movq	544(%rsp), %rax
	movl	552(%rsp), %r15d
	movl	556(%rsp), %r13d
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L197:
	movl	(%rcx,%rax,4), %eax
	cmpl	%eax, (%rcx,%rdx,4)
	jne	.L108
	movl	272(%rsp), %r15d
	testl	%r15d, %r15d
	jne	.L108
.L111:
	movb	$1, f(%rbp)
	movl	%r13d, %edx
	movq	%rbp, %rcx
	movq	%rbx, %r13
	movslq	320(%rsp), %r15
	movl	$1, %r12d
.L164:
	cmpb	$0, f(%r12)
	je	.L455
.L116:
	addq	$1, %r12
	cmpq	$9, %r12
	jne	.L164
	movq	%r13, %rbx
	movb	$0, f(%rcx)
	movq	%rcx, %rbp
	movl	%edx, %r13d
	jmp	.L108
	.p2align 4,,10
	.p2align 3
.L455:
	movslq	%r12d, %rax
	movl	%edx, 584(%rsp)
	movl	$rot+4, %r9d
	movq	%r12, %rbx
	leaq	dice(,%rax,8), %rbp
	movslq	16(%rsp), %rax
	movq	%rcx, 560(%rsp)
	movq	%r9, %rdi
	movq	%r14, 576(%rsp)
	movl	368(%rsp), %r12d
	movq	%rax, 352(%rsp)
	movq	%r13, 568(%rsp)
	movq	%r15, %r13
.L117:
	movslq	12(%rdi), %rax
	movslq	8(%rdi), %rsi
	movslq	4(%rdi), %rcx
	movslq	(%rdi), %rdx
	movzbl	0(%rbp,%rax), %eax
	movzbl	0(%rbp,%rsi), %esi
	movzbl	0(%rbp,%rcx), %ecx
	movzbl	0(%rbp,%rdx), %edx
	sall	$8, %eax
	orl	%esi, %eax
	sall	$8, %eax
	orl	%ecx, %eax
	sall	$8, %eax
	orl	%edx, %eax
	movslq	16(%rdi), %rdx
	movl	%eax, kari+41(%rip)
	xorl	%eax, %eax
	movb	0(%rbp,%rdx), %al
	movslq	20(%rdi), %rdx
	movb	0(%rbp,%rdx), %ah
	movw	%ax, kari+45(%rip)
	testl	%r12d, %r12d
	je	.L121
	movslq	72(%rsp), %rax
	movslq	%r12d, %rdx
	movsbq	kari+40(%rax), %r14
	movslq	76(%rsp), %rax
	movzbl	kari(%rax,%rdx,8), %r15d
	cmpb	$90, %r14b
	jg	.L198
	cmpb	$90, %r15b
	jle	.L118
.L198:
	cmpb	$96, %r14b
	jle	.L199
	cmpb	$96, %r15b
	jg	.L118
.L199:
	movq	%rdi, 24(%rsp)
	call	__ctype_toupper_loc
	movsbq	%r15b, %rdx
	movq	24(%rsp), %rdi
	movq	(%rax), %rcx
	movl	(%rcx,%rdx,4), %eax
	cmpl	%eax, (%rcx,%r14,4)
	jne	.L118
	movslq	120(%rsp), %rsi
	testl	%esi, %esi
	je	.L121
	movslq	152(%rsp), %rax
	movsbq	kari+40(%rax), %rdx
	movslq	156(%rsp), %rax
	movsbq	kari(%rax,%rsi,8), %rax
	cmpb	$90, %dl
	jg	.L200
	cmpb	$90, %al
	jle	.L118
.L200:
	cmpb	$96, %dl
	jle	.L201
	cmpb	$96, %al
	jg	.L118
.L201:
	movl	(%rcx,%rax,4), %eax
	cmpl	%eax, (%rcx,%rdx,4)
	jne	.L118
	movslq	196(%rsp), %rsi
	testl	%esi, %esi
	je	.L121
	movslq	236(%rsp), %rax
	movsbq	kari+40(%rax), %rdx
	movslq	240(%rsp), %rax
	movsbq	kari(%rax,%rsi,8), %rax
	cmpb	$90, %dl
	jg	.L202
	cmpb	$90, %al
	jle	.L118
.L202:
	cmpb	$96, %dl
	jle	.L203
	cmpb	$96, %al
	jle	.L203
	.p2align 4,,10
	.p2align 3
.L118:
	addq	$28, %rdi
	cmpq	$rot+676, %rdi
	jne	.L117
	movq	%r13, %r15
	movl	584(%rsp), %edx
	movq	%rbx, %r12
	movq	560(%rsp), %rcx
	movq	576(%rsp), %r14
	movq	568(%rsp), %r13
	jmp	.L116
	.p2align 4,,10
	.p2align 3
.L203:
	movl	(%rcx,%rax,4), %eax
	cmpl	%eax, (%rcx,%rdx,4)
	jne	.L118
	movl	276(%rsp), %r14d
	testl	%r14d, %r14d
	jne	.L118
.L121:
	movq	352(%rsp), %rax
	movb	$1, f(%rbx)
	movq	%rbx, %rcx
	movq	%rbp, %rdx
	movl	$1, %r14d
	leaq	kari(%r13,%rax,8), %r9
	movl	%r12d, %eax
	movq	%r13, %r12
	movq	%r14, %r13
	movq	%r9, 24(%rsp)
.L162:
	cmpb	$0, f(%r13)
	je	.L456
.L126:
	addq	$1, %r13
	cmpq	$9, %r13
	jne	.L162
	movq	%r12, %r13
	movb	$0, f(%rcx)
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movl	%eax, %r12d
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L456:
	movslq	40(%rsp), %rsi
	movl	%eax, 588(%rsp)
	movslq	%r13d, %rbx
	movl	$rot+4, %ebp
	movq	%rcx, 592(%rsp)
	movl	380(%rsp), %r15d
	leaq	kari(,%rsi,8), %rsi
	movq	%rdi, 600(%rsp)
	movq	%rsi, 344(%rsp)
	movq	%rdx, 608(%rsp)
	movq	%r12, 616(%rsp)
	movq	%r13, %r12
	movl	384(%rsp), %r13d
.L127:
	movslq	12(%rbp), %rax
	leaq	dice(,%rbx,8), %rdx
	movslq	8(%rbp), %rdi
	movslq	4(%rbp), %rsi
	movslq	0(%rbp), %rcx
	movzbl	(%rdx,%rax), %eax
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rdx,%rsi), %esi
	movzbl	(%rdx,%rcx), %ecx
	sall	$8, %eax
	orl	%edi, %eax
	sall	$8, %eax
	orl	%esi, %eax
	sall	$8, %eax
	orl	%ecx, %eax
	movslq	16(%rbp), %rcx
	movl	%eax, kari+49(%rip)
	xorl	%eax, %eax
	movb	(%rdx,%rcx), %al
	movslq	20(%rbp), %rcx
	movb	(%rdx,%rcx), %ah
	movw	%ax, kari+53(%rip)
	testl	%r15d, %r15d
	je	.L131
	movslq	44(%rsp), %rax
	movslq	%r15d, %rdx
	movsbq	kari+48(%rax), %r14
	movslq	48(%rsp), %rax
	movzbl	kari(%rax,%rdx,8), %edx
	cmpb	$90, %r14b
	jg	.L204
	cmpb	$90, %dl
	jle	.L128
.L204:
	cmpb	$96, %r14b
	jle	.L205
	cmpb	$96, %dl
	jg	.L128
.L205:
	movb	%dl, 96(%rsp)
	call	__ctype_toupper_loc
	movsbq	96(%rsp), %rdx
	movq	(%rax), %rcx
	movl	(%rcx,%rdx,4), %eax
	cmpl	%eax, (%rcx,%r14,4)
	jne	.L128
	testl	%r13d, %r13d
	je	.L131
	movslq	160(%rsp), %rax
	movslq	%r13d, %rsi
	movsbq	kari+48(%rax), %rdx
	movslq	164(%rsp), %rax
	movsbq	kari(%rax,%rsi,8), %rax
	cmpb	$90, %dl
	jg	.L206
	cmpb	$90, %al
	jle	.L128
.L206:
	cmpb	$96, %dl
	jle	.L207
	cmpb	$96, %al
	jg	.L128
.L207:
	movl	(%rcx,%rax,4), %eax
	cmpl	%eax, (%rcx,%rdx,4)
	jne	.L128
	movl	200(%rsp), %edi
	testl	%edi, %edi
	je	.L131
	movslq	212(%rsp), %rax
	movslq	%edi, %rsi
	movsbq	kari+48(%rax), %rdx
	movslq	216(%rsp), %rax
	movsbq	kari(%rax,%rsi,8), %rax
	cmpb	$90, %dl
	jg	.L208
	cmpb	$90, %al
	jle	.L128
.L208:
	cmpb	$96, %dl
	jle	.L209
	cmpb	$96, %al
	jle	.L209
	.p2align 4,,10
	.p2align 3
.L128:
	addq	$28, %rbp
	cmpq	$rot+676, %rbp
	jne	.L127
	movq	%r12, %r13
	movl	588(%rsp), %eax
	movq	592(%rsp), %rcx
	movq	600(%rsp), %rdi
	movq	608(%rsp), %rdx
	movq	616(%rsp), %r12
	jmp	.L126
	.p2align 4,,10
	.p2align 3
.L209:
	movl	(%rcx,%rax,4), %eax
	cmpl	%eax, (%rcx,%rdx,4)
	jne	.L128
	movl	280(%rsp), %r11d
	testl	%r11d, %r11d
	jne	.L128
.L131:
	movslq	328(%rsp), %rax
	movq	344(%rsp), %rdi
	movb	$1, f(%r12)
	movl	$1, %r14d
	movq	%r12, 400(%rsp)
	movslq	336(%rsp), %r10
	addq	%rdi, %rax
	movl	%r15d, 412(%rsp)
	movq	%rax, 96(%rsp)
	movq	%rbp, 416(%rsp)
	movq	%rbx, 424(%rsp)
.L160:
	cmpb	$0, f(%r14)
	je	.L457
.L136:
	addq	$1, %r14
	cmpq	$9, %r14
	jne	.L160
	movq	400(%rsp), %r12
	movl	412(%rsp), %r15d
	movq	416(%rsp), %rbp
	movq	424(%rsp), %rbx
	movb	$0, f(%r12)
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L457:
	movslq	12(%rsp), %rsi
	movslq	%r14d, %rbx
	movl	$rot+4, %ebp
	movl	%r13d, 464(%rsp)
	movq	%rbx, %r12
	movq	%r10, %r13
	leaq	kari(,%rsi,8), %rax
	movq	%rax, 392(%rsp)
.L137:
	movslq	12(%rbp), %rax
	leaq	dice(,%r12,8), %rdx
	movslq	8(%rbp), %rdi
	movslq	4(%rbp), %rsi
	movslq	0(%rbp), %rcx
	movzbl	(%rdx,%rax), %eax
	movzbl	(%rdx,%rdi), %edi
	movzbl	(%rdx,%rsi), %esi
	movzbl	(%rdx,%rcx), %ecx
	sall	$8, %eax
	orl	%edi, %eax
	sall	$8, %eax
	orl	%esi, %eax
	sall	$8, %eax
	orl	%ecx, %eax
	movslq	16(%rbp), %rcx
	movl	%eax, kari+57(%rip)
	xorl	%eax, %eax
	movb	(%rdx,%rcx), %al
	movslq	20(%rbp), %rcx
	movb	(%rdx,%rcx), %ah
	movw	%ax, kari+61(%rip)
	movl	16(%rsp), %eax
	testl	%eax, %eax
	je	.L141
	movslq	52(%rsp), %rax
	movsbq	kari+56(%rax), %rbx
	movq	24(%rsp), %rax
	movsbq	(%rax), %r15
	cmpb	$90, %bl
	jg	.L210
	cmpb	$90, %r15b
	jle	.L138
.L210:
	cmpb	$96, %bl
	jle	.L211
	cmpb	$96, %r15b
	jg	.L138
.L211:
	call	__ctype_toupper_loc
	movq	(%rax), %rdx
	movl	(%rdx,%r15,4), %eax
	cmpl	%eax, (%rdx,%rbx,4)
	jne	.L138
	movl	80(%rsp), %r10d
	testl	%r10d, %r10d
	je	.L141
	movslq	124(%rsp), %rax
	movq	128(%rsp), %rbx
	movsbq	kari+56(%rax), %rax
	movsbq	(%rbx), %rcx
	cmpb	$90, %al
	jg	.L212
	cmpb	$90, %cl
	jle	.L138
.L212:
	cmpb	$96, %al
	jle	.L213
	cmpb	$96, %cl
	jg	.L138
.L213:
	movl	(%rdx,%rcx,4), %ebx
	cmpl	%ebx, (%rdx,%rax,4)
	jne	.L138
	movl	20(%rsp), %r9d
	testl	%r9d, %r9d
	je	.L141
	movslq	220(%rsp), %rax
	movslq	224(%rsp), %rcx
	movq	184(%rsp), %rdi
	movsbq	kari+56(%rax), %rax
	movsbq	(%rdi,%rcx), %rcx
	cmpb	$90, %al
	jg	.L214
	cmpb	$90, %cl
	jle	.L138
.L214:
	cmpb	$96, %al
	jle	.L215
	cmpb	$96, %cl
	jle	.L215
	.p2align 4,,10
	.p2align 3
.L138:
	addq	$28, %rbp
	cmpq	$rot+676, %rbp
	jne	.L137
	movq	%r13, %r10
	movl	464(%rsp), %r13d
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L215:
	movl	(%rdx,%rcx,4), %ebx
	cmpl	%ebx, (%rdx,%rax,4)
	jne	.L138
	movl	244(%rsp), %r8d
	testl	%r8d, %r8d
	jne	.L138
.L141:
	movq	%r14, %rcx
	movl	$1, %r15d
	movq	%rbp, %rsi
	movq	%r12, %rdi
	movslq	332(%rsp), %r8
	movslq	324(%rsp), %r9
	movb	$1, f(%r14)
	movq	%r8, %r14
.L158:
	cmpb	$0, f(%r15)
	je	.L458
.L146:
	addq	$1, %r15
	cmpq	$9, %r15
	jne	.L158
	movb	$0, f(%rcx)
	movq	%rcx, %r14
	movq	%rsi, %rbp
	movq	%rdi, %r12
	jmp	.L138
	.p2align 4,,10
	.p2align 3
.L458:
	movq	%rcx, 432(%rsp)
	movl	$rot+4, %ebx
	movslq	%r15d, %r12
	movslq	360(%rsp), %rbp
	movq	392(%rsp), %rax
	movq	%rsi, 448(%rsp)
	movq	%rdi, 456(%rsp)
	addq	%rax, %rbp
	movq	%r15, 440(%rsp)
	movq	%rbp, %r15
	movq	%r14, %rbp
	movq	%rbx, %r14
	movq	%r13, %rbx
	movq	%r9, %r13
.L147:
	movslq	12(%r14), %rax
	leaq	dice(,%r12,8), %rdx
	movslq	8(%r14), %r11
	movslq	4(%r14), %rsi
	movslq	(%r14), %rcx
	movzbl	(%rdx,%rax), %eax
	movzbl	(%rdx,%r11), %r11d
	movzbl	(%rdx,%rsi), %esi
	movzbl	(%rdx,%rcx), %ecx
	sall	$8, %eax
	orl	%r11d, %eax
	sall	$8, %eax
	orl	%esi, %eax
	sall	$8, %eax
	orl	%ecx, %eax
	movslq	16(%r14), %rcx
	movl	%eax, kari+65(%rip)
	xorl	%eax, %eax
	movb	(%rdx,%rcx), %al
	movslq	20(%r14), %rcx
	movb	(%rdx,%rcx), %ah
	movl	8(%rsp), %edx
	movw	%ax, kari+69(%rip)
	testl	%edx, %edx
	je	.L440
	movq	32(%rsp), %rax
	movzbl	kari+64(%rbx), %edx
	movzbl	(%rax), %ecx
	cmpb	$90, %dl
	jg	.L216
	cmpb	$90, %cl
	jle	.L148
.L216:
	cmpb	$96, %dl
	jle	.L217
	cmpb	$96, %cl
	jg	.L148
.L217:
	movb	%dl, 343(%rsp)
	movb	%cl, 342(%rsp)
	call	__ctype_toupper_loc
	movsbq	342(%rsp), %rcx
	movsbq	343(%rsp), %rdx
	movq	(%rax), %rax
	movl	(%rax,%rcx,4), %edi
	cmpl	%edi, (%rax,%rdx,4)
	jne	.L148
	movl	12(%rsp), %edi
	testl	%edi, %edi
	je	.L440
	movsbq	kari+64(%rbp), %rdx
	movsbq	(%r15), %rcx
	cmpb	$90, %dl
	jg	.L218
	cmpb	$90, %cl
	jle	.L148
.L218:
	cmpb	$96, %dl
	jle	.L219
	cmpb	$96, %cl
	jg	.L148
.L219:
	movl	(%rax,%rcx,4), %edi
	cmpl	%edi, (%rax,%rdx,4)
	jne	.L148
	movl	40(%rsp), %esi
	testl	%esi, %esi
	je	.L440
	movq	96(%rsp), %rdi
	movsbq	kari+64(%r13), %rdx
	movsbq	(%rdi), %rcx
	cmpb	$90, %dl
	jg	.L220
	cmpb	$90, %cl
	jle	.L148
.L220:
	cmpb	$96, %dl
	jle	.L221
	cmpb	$96, %cl
	jg	.L148
.L221:
	movl	(%rax,%rcx,4), %edi
	cmpl	%edi, (%rax,%rdx,4)
	jne	.L148
	movl	204(%rsp), %ecx
	testl	%ecx, %ecx
	je	.L440
.L148:
	addq	$28, %r14
	cmpq	$rot+676, %r14
	jne	.L147
	movq	%r13, %r9
	movq	432(%rsp), %rcx
	movq	440(%rsp), %r15
	movq	%rbp, %r14
	movq	448(%rsp), %rsi
	movq	456(%rsp), %rdi
	movq	%rbx, %r13
	jmp	.L146
.L440:
	movb	$1, f(%r12)
	movl	$.LC0, %edi
.L156:
	call	puts
	jmp	.L173
.L286:
	addq	$632, %rsp
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
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.globl	f
	.bss
	.align 8
	.type	f, @object
	.size	f, 9
f:
	.zero	9
	.globl	kari
	.align 32
	.type	kari, @object
	.size	kari, 72
kari:
	.zero	72
	.globl	dice
	.align 32
	.type	dice, @object
	.size	dice, 72
dice:
	.zero	72
	.globl	con
	.data
	.align 32
	.type	con, @object
	.size	con, 432
con:
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	1
	.long	4
	.long	3
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	2
	.long	2
	.long	5
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	1
	.long	2
	.long	5
	.long	3
	.long	3
	.long	4
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	1
	.long	6
	.long	1
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	2
	.long	6
	.long	1
	.long	5
	.long	4
	.long	3
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	3
	.long	6
	.long	1
	.long	6
	.long	2
	.long	5
	.long	0
	.zero	8
	.long	0
	.zero	8
	.long	4
	.long	6
	.long	1
	.long	5
	.long	2
	.long	5
	.long	7
	.long	3
	.long	4
	.long	0
	.zero	8
	.globl	rot
	.align 32
	.type	rot, @object
	.size	rot, 672
rot:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	0
	.long	1
	.long	3
	.long	5
	.long	2
	.long	4
	.long	6
	.long	0
	.long	1
	.long	4
	.long	2
	.long	5
	.long	3
	.long	6
	.long	0
	.long	1
	.long	5
	.long	4
	.long	3
	.long	2
	.long	6
	.long	0
	.long	2
	.long	6
	.long	3
	.long	4
	.long	1
	.long	5
	.long	0
	.long	2
	.long	3
	.long	1
	.long	6
	.long	4
	.long	5
	.long	0
	.long	2
	.long	1
	.long	4
	.long	3
	.long	6
	.long	5
	.long	0
	.long	2
	.long	4
	.long	6
	.long	1
	.long	3
	.long	5
	.long	0
	.long	3
	.long	1
	.long	2
	.long	5
	.long	6
	.long	4
	.long	0
	.long	3
	.long	2
	.long	6
	.long	1
	.long	5
	.long	4
	.long	0
	.long	3
	.long	5
	.long	1
	.long	6
	.long	2
	.long	4
	.long	0
	.long	3
	.long	6
	.long	5
	.long	2
	.long	1
	.long	4
	.long	0
	.long	4
	.long	1
	.long	5
	.long	2
	.long	6
	.long	3
	.long	0
	.long	4
	.long	2
	.long	1
	.long	6
	.long	5
	.long	3
	.long	0
	.long	4
	.long	5
	.long	6
	.long	1
	.long	2
	.long	3
	.long	0
	.long	4
	.long	6
	.long	2
	.long	5
	.long	1
	.long	3
	.long	0
	.long	5
	.long	1
	.long	3
	.long	4
	.long	6
	.long	2
	.long	0
	.long	5
	.long	3
	.long	6
	.long	1
	.long	4
	.long	2
	.long	0
	.long	5
	.long	4
	.long	1
	.long	6
	.long	3
	.long	2
	.long	0
	.long	5
	.long	6
	.long	4
	.long	3
	.long	1
	.long	2
	.long	0
	.long	6
	.long	2
	.long	4
	.long	3
	.long	5
	.long	1
	.long	0
	.long	6
	.long	3
	.long	2
	.long	5
	.long	4
	.long	1
	.long	0
	.long	6
	.long	5
	.long	3
	.long	4
	.long	2
	.long	1
	.long	0
	.long	6
	.long	4
	.long	5
	.long	2
	.long	3
	.long	1
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
