	.file	"inputC.c"
	.text
	.globl	compare_sz_asc
	.type	compare_sz_asc, @function
compare_sz_asc:
.LFB6:
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
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jnb	.L2
	movl	$-1, %eax
	jmp	.L4
.L2:
	movl	$1, %eax
.L4:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	compare_sz_asc, .-compare_sz_asc
	.globl	compare_sz_desc
	.type	compare_sz_desc, @function
compare_sz_desc:
.LFB7:
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
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jbe	.L6
	movl	$-1, %eax
	jmp	.L8
.L6:
	movl	$1, %eax
.L8:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	compare_sz_desc, .-compare_sz_desc
	.globl	compare_i64_asc
	.type	compare_i64_asc, @function
compare_i64_asc:
.LFB8:
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
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jge	.L10
	movl	$-1, %eax
	jmp	.L12
.L10:
	movl	$1, %eax
.L12:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	compare_i64_asc, .-compare_i64_asc
	.globl	compare_i64_desc
	.type	compare_i64_desc, @function
compare_i64_desc:
.LFB9:
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
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jle	.L14
	movl	$-1, %eax
	jmp	.L16
.L14:
	movl	$1, %eax
.L16:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	compare_i64_desc, .-compare_i64_desc
	.globl	compare_u64_asc
	.type	compare_u64_asc, @function
compare_u64_asc:
.LFB10:
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
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jnb	.L18
	movl	$-1, %eax
	jmp	.L20
.L18:
	movl	$1, %eax
.L20:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	compare_u64_asc, .-compare_u64_asc
	.globl	compare_u64_desc
	.type	compare_u64_desc, @function
compare_u64_desc:
.LFB11:
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
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jbe	.L22
	movl	$-1, %eax
	jmp	.L24
.L22:
	movl	$1, %eax
.L24:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	compare_u64_desc, .-compare_u64_desc
	.globl	compare_c_asc
	.type	compare_c_asc, @function
compare_c_asc:
.LFB12:
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
	movzbl	(%rax), %edx
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jge	.L26
	movl	$-1, %eax
	jmp	.L28
.L26:
	movl	$1, %eax
.L28:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	compare_c_asc, .-compare_c_asc
	.globl	compare_c_desc
	.type	compare_c_desc, @function
compare_c_desc:
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
	movzbl	(%rax), %edx
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jle	.L30
	movl	$-1, %eax
	jmp	.L32
.L30:
	movl	$1, %eax
.L32:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	compare_c_desc, .-compare_c_desc
	.globl	compare_dp_asc
	.type	compare_dp_asc, @function
compare_dp_asc:
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
	movsd	(%rax), %xmm1
	movq	-16(%rbp), %rax
	movsd	(%rax), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L39
	movl	$-1, %eax
	jmp	.L37
.L39:
	movl	$1, %eax
.L37:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	compare_dp_asc, .-compare_dp_asc
	.type	modinvU64, @function
modinvU64:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	$1, -48(%rbp)
	movq	$0, -40(%rbp)
	jmp	.L41
.L42:
	movq	-64(%rbp), %rax
	cqto
	idivq	-56(%rbp)
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	imulq	-56(%rbp), %rax
	subq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-24(%rbp), %rax
	imulq	-40(%rbp), %rax
	subq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -40(%rbp)
.L41:
	cmpq	$0, -56(%rbp)
	jne	.L42
	movq	-48(%rbp), %rax
	cqto
	idivq	-32(%rbp)
	movq	%rdx, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jns	.L43
	movq	-48(%rbp), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -48(%rbp)
.L43:
	movq	-48(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	modinvU64, .-modinvU64
	.type	powSz, @function
powSz:
.LFB16:
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
	cmpq	$0, -16(%rbp)
	jne	.L46
	movl	$1, %eax
	jmp	.L47
.L46:
	cmpq	$1, -16(%rbp)
	jne	.L48
	movq	-8(%rbp), %rax
	jmp	.L47
.L48:
	movq	-16(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	jne	.L49
	movq	-16(%rbp), %rax
	shrq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	imulq	%rax, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	powSz
	jmp	.L47
.L49:
	movq	-16(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	powSz
	imulq	-8(%rbp), %rax
.L47:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	powSz, .-powSz
	.type	powU64, @function
powU64:
.LFB17:
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
	cmpq	$0, -16(%rbp)
	jne	.L51
	movl	$1, %eax
	jmp	.L52
.L51:
	cmpq	$1, -16(%rbp)
	jne	.L53
	movq	-8(%rbp), %rax
	jmp	.L52
.L53:
	movq	-16(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	jne	.L54
	movq	-16(%rbp), %rax
	shrq	%rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	imulq	%rax, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	powU64
	jmp	.L52
.L54:
	movq	-16(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	powU64
	imulq	-8(%rbp), %rax
.L52:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	powU64, .-powU64
	.type	powU64WMod, @function
powU64WMod:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L56
	movl	$1, %eax
	jmp	.L57
.L56:
	cmpq	$1, -16(%rbp)
	jne	.L58
	movq	-8(%rbp), %rax
	movl	$0, %edx
	divq	-24(%rbp)
	movq	%rdx, %rax
	jmp	.L57
.L58:
	movq	-16(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	jne	.L59
	movq	-16(%rbp), %rax
	shrq	%rax
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	imulq	%rax, %rax
	movl	$0, %edx
	divq	-24(%rbp)
	movq	%rdx, %rdi
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	movq	%rcx, %rsi
	call	powU64WMod
	jmp	.L57
.L59:
	movq	-16(%rbp), %rax
	leaq	-1(%rax), %rcx
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	powU64WMod
	imulq	-8(%rbp), %rax
	movl	$0, %edx
	divq	-24(%rbp)
	movq	%rdx, %rax
.L57:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	powU64WMod, .-powU64WMod
	.type	comb, @function
comb:
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
	movq	$1, -16(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L61
.L62:
	movq	-24(%rbp), %rax
	subq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	imulq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	-16(%rbp), %rax
	movl	$0, %edx
	divq	%rcx
	movq	%rax, -16(%rbp)
	addq	$1, -8(%rbp)
.L61:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L62
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	comb, .-comb
	.type	combU64, @function
combU64:
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
	movq	$1, -16(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L65
.L66:
	movq	-24(%rbp), %rax
	subq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	imulq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	-16(%rbp), %rax
	movl	$0, %edx
	divq	%rcx
	movq	%rax, -16(%rbp)
	addq	$1, -8(%rbp)
.L65:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L66
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	combU64, .-combU64
	.type	combU64WMod, @function
combU64WMod:
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$40, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	$1, -16(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L69
.L70:
	movq	-24(%rbp), %rax
	subq	-8(%rbp), %rax
	imulq	-16(%rbp), %rax
	movl	$0, %edx
	divq	-40(%rbp)
	movq	%rdx, -16(%rbp)
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	modinvU64
	imulq	-16(%rbp), %rax
	movl	$0, %edx
	divq	-40(%rbp)
	movq	%rdx, -16(%rbp)
	addq	$1, -8(%rbp)
.L69:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L70
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	combU64WMod, .-combU64WMod
	.type	permU64WMod, @function
permU64WMod:
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
	movq	$1, -16(%rbp)
	movq	$2, -8(%rbp)
	jmp	.L73
.L74:
	movq	-16(%rbp), %rax
	imulq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	$0, %edx
	divq	-32(%rbp)
	movq	%rdx, -16(%rbp)
	addq	$1, -8(%rbp)
.L73:
	movq	-8(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jbe	.L74
	movq	-16(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	permU64WMod, .-permU64WMod
	.type	gcdZu, @function
gcdZu:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	jmp	.L77
.L78:
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, %edx
	divq	-32(%rbp)
	movq	%rdx, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
.L77:
	movq	-24(%rbp), %rax
	movl	$0, %edx
	divq	-32(%rbp)
	movq	%rdx, %rax
	testq	%rax, %rax
	jne	.L78
	movq	-32(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	gcdZu, .-gcdZu
	.type	gcdU64, @function
gcdU64:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	jmp	.L81
.L82:
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, %edx
	divq	-32(%rbp)
	movq	%rdx, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
.L81:
	movq	-24(%rbp), %rax
	movl	$0, %edx
	divq	-32(%rbp)
	movq	%rdx, %rax
	testq	%rax, %rax
	jne	.L82
	movq	-32(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	gcdU64, .-gcdU64
	.type	bHeap_Init, @function
bHeap_Init:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 24(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	bHeap_Init, .-bHeap_Init
	.type	bHeap_Swap, @function
bHeap_Swap:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-56(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-64(%rbp), %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-56(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-72(%rbp), %rax
	salq	$3, %rax
	leaq	(%rdx,%rax), %rcx
	movq	-56(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-64(%rbp), %rax
	salq	$3, %rax
	addq	%rax, %rdx
	movq	(%rcx), %rax
	movq	%rax, (%rdx)
	movq	-56(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-72(%rbp), %rax
	salq	$3, %rax
	addq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-56(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L88
	movq	-64(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-56(%rbp), %rax
	movq	16(%rax), %rcx
	leaq	-32(%rbp), %rdx
	movq	-56(%rbp), %rax
	movl	$2, %esi
	movq	%rax, %rdi
	call	*%rcx
.L88:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L87
	call	__stack_chk_fail@PLT
.L87:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	bHeap_Swap, .-bHeap_Swap
	.type	bHeap_UpHeap, @function
bHeap_UpHeap:
.LFB27:
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
	cmpq	$0, -32(%rbp)
	je	.L92
	movq	-32(%rbp), %rax
	addq	$1, %rax
	shrq	%rax
	subq	$1, %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	24(%rdx), %rcx
	movq	-32(%rbp), %rdx
	salq	$3, %rdx
	addq	%rcx, %rdx
	movq	%rdx, %rcx
	movq	-24(%rbp), %rdx
	movq	24(%rdx), %rsi
	movq	-8(%rbp), %rdx
	salq	$3, %rdx
	addq	%rsi, %rdx
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	call	*%rax
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jle	.L89
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	bHeap_Swap
	cmpq	$0, -8(%rbp)
	je	.L89
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	bHeap_UpHeap
	jmp	.L89
.L92:
	nop
.L89:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	bHeap_UpHeap, .-bHeap_UpHeap
	.type	bHeap_DownHeap, @function
bHeap_DownHeap:
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	subq	$1, %rax
	cmpq	%rax, -64(%rbp)
	jnb	.L100
	movq	-64(%rbp), %rax
	addq	$1, %rax
	addq	%rax, %rax
	subq	$1, %rax
	movq	%rax, -16(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -16(%rbp)
	jnb	.L93
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	24(%rdx), %rcx
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rcx, %rdx
	movq	%rdx, %rcx
	movq	-56(%rbp), %rdx
	movq	24(%rdx), %rsi
	movq	-64(%rbp), %rdx
	salq	$3, %rdx
	addq	%rsi, %rdx
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	call	*%rax
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	js	.L96
	movq	-16(%rbp), %rax
	jmp	.L97
.L96:
	movl	$100000000, %eax
.L97:
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -8(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jnb	.L98
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	24(%rdx), %rcx
	movq	-8(%rbp), %rdx
	salq	$3, %rdx
	addq	%rcx, %rdx
	movq	%rdx, %rcx
	movq	-56(%rbp), %rdx
	movq	24(%rdx), %rsi
	movq	-64(%rbp), %rdx
	salq	$3, %rdx
	addq	%rsi, %rdx
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	call	*%rax
	movl	%eax, -32(%rbp)
	cmpq	$100000000, -24(%rbp)
	jne	.L99
	cmpl	$0, -32(%rbp)
	jle	.L98
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	jmp	.L98
.L99:
	cmpl	$0, -32(%rbp)
	jle	.L98
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	24(%rdx), %rcx
	movq	-8(%rbp), %rdx
	salq	$3, %rdx
	addq	%rcx, %rdx
	movq	%rdx, %rcx
	movq	-56(%rbp), %rdx
	movq	24(%rdx), %rsi
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rsi, %rdx
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	call	*%rax
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jle	.L98
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
.L98:
	cmpq	$100000000, -24(%rbp)
	je	.L93
	movq	-24(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	bHeap_Swap
	movq	-24(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	bHeap_DownHeap
	jmp	.L93
.L100:
	nop
.L93:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	bHeap_DownHeap, .-bHeap_DownHeap
	.type	bHeap_Add, @function
bHeap_Add:
.LFB29:
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
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-24(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	salq	$3, %rax
	addq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L102
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	subq	$1, %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rcx
	leaq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*%rcx
.L102:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	bHeap_UpHeap
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L103
	call	__stack_chk_fail@PLT
.L103:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	bHeap_Add, .-bHeap_Add
	.type	bHeap_RemoveTop, @function
bHeap_RemoveTop:
.LFB30:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L110
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	cmpq	$1, %rax
	jne	.L107
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	jmp	.L104
.L107:
	movq	-24(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	salq	$3, %rax
	subq	$8, %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rdx), %rdx
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L108
	movq	$0, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rcx
	leaq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*%rcx
.L108:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	bHeap_DownHeap
	jmp	.L104
.L110:
	nop
.L104:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L109
	call	__stack_chk_fail@PLT
.L109:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	bHeap_RemoveTop, .-bHeap_RemoveTop
	.type	bHeap_RemoveNode, @function
bHeap_RemoveNode:
.LFB31:
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
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	-1(%rax), %rdx
	movq	-16(%rbp), %rax
	cmpq	%rax, %rdx
	jne	.L112
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	-1(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	jmp	.L115
.L112:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	salq	$3, %rax
	subq	$8, %rax
	leaq	(%rdx,%rax), %rcx
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-16(%rbp), %rax
	salq	$3, %rax
	addq	%rax, %rdx
	movq	(%rcx), %rax
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	-1(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L114
	movq	-8(%rbp), %rax
	movq	16(%rax), %rcx
	leaq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	*%rcx
.L114:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	bHeap_DownHeap
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	bHeap_UpHeap
.L115:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	bHeap_RemoveNode, .-bHeap_RemoveNode
	.type	bHeap_GetTopVal, @function
bHeap_GetTopVal:
.LFB32:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L117
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	jmp	.L119
.L117:
	movl	$0, %eax
.L119:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	bHeap_GetTopVal, .-bHeap_GetTopVal
	.local	tree_Node
	.comm	tree_Node,6400000,32
	.type	tree_Init, @function
tree_Init:
.LFB33:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L121
.L122:
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	tree_Node(%rip), %rax
	movq	$0, (%rdx,%rax)
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	16+tree_Node(%rip), %rax
	movq	$0, (%rdx,%rax)
	movl	$1024, %edi
	call	malloc@PLT
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	8+tree_Node(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	24+tree_Node(%rip), %rax
	movq	$128, (%rdx,%rax)
	addq	$1, -8(%rbp)
.L121:
	movq	-8(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jb	.L122
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	tree_Init, .-tree_Init
	.type	tree_AddChild, @function
tree_AddChild:
.LFB34:
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
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	24+tree_Node(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rcx
	leaq	16+tree_Node(%rip), %rax
	movq	(%rcx,%rax), %rax
	cmpq	%rax, %rdx
	ja	.L124
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	24+tree_Node(%rip), %rax
	movq	(%rdx,%rax), %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rcx
	leaq	8+tree_Node(%rip), %rax
	movq	(%rcx,%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	-8(%rbp), %rdx
	movq	%rdx, %rcx
	salq	$5, %rcx
	leaq	8+tree_Node(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	24+tree_Node(%rip), %rax
	movq	(%rdx,%rax), %rax
	leaq	(%rax,%rax), %rcx
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	24+tree_Node(%rip), %rax
	movq	%rcx, (%rdx,%rax)
.L124:
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	8+tree_Node(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	16+tree_Node(%rip), %rax
	movq	(%rdx,%rax), %rax
	salq	$3, %rax
	leaq	(%rcx,%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	16+tree_Node(%rip), %rax
	movq	(%rdx,%rax), %rax
	leaq	1(%rax), %rcx
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	16+tree_Node(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	tree_AddChild, .-tree_AddChild
	.local	BN_Asc
	.comm	BN_Asc,1600000,32
	.local	BN_Desc
	.comm	BN_Desc,1600000,32
	.type	_bHeap_Compare_Asc, @function
_bHeap_Compare_Asc:
.LFB35:
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
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	ja	.L126
	movl	$-1, %eax
	jmp	.L128
.L126:
	movl	$1, %eax
.L128:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	_bHeap_Compare_Asc, .-_bHeap_Compare_Asc
	.type	_bHeap_Compare_Desc, @function
_bHeap_Compare_Desc:
.LFB36:
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
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jb	.L130
	movl	$-1, %eax
	jmp	.L132
.L130:
	movl	$1, %eax
.L132:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	_bHeap_Compare_Desc, .-_bHeap_Compare_Desc
	.local	PBHeap_Asc_Idx
	.comm	PBHeap_Asc_Idx,1600000,32
	.local	PBHeap_Desc_Idx
	.comm	PBHeap_Desc_Idx,1600000,32
	.type	_bHeap_NotifyNodeChange_Asc, @function
_bHeap_NotifyNodeChange_Asc:
.LFB37:
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
	jmp	.L134
.L135:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-24(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rsi
	movq	-40(%rbp), %rax
	addq	%rsi, %rax
	movq	(%rax), %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	(%rcx), %rax
	leaq	0(,%rdx,8), %rcx
	leaq	PBHeap_Asc_Idx(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	addq	$1, -8(%rbp)
.L134:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L135
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	_bHeap_NotifyNodeChange_Asc, .-_bHeap_NotifyNodeChange_Asc
	.type	_bHeap_NotifyNodeChange_Desc, @function
_bHeap_NotifyNodeChange_Desc:
.LFB38:
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
	jmp	.L137
.L138:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movq	-24(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rsi
	movq	-40(%rbp), %rax
	addq	%rsi, %rax
	movq	(%rax), %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	(%rcx), %rax
	leaq	0(,%rdx,8), %rcx
	leaq	PBHeap_Desc_Idx(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	addq	$1, -8(%rbp)
.L137:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L138
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	_bHeap_NotifyNodeChange_Desc, .-_bHeap_NotifyNodeChange_Desc
	.local	cnt
	.comm	cnt,800000,32
	.section	.rodata
.LC0:
	.string	"%lu"
.LC1:
	.string	"0"
.LC2:
	.string	"%lu\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	$0, -40(%rbp)
	jmp	.L140
.L141:
	movq	-40(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	cnt(%rip), %rax
	movq	$0, (%rdx,%rax)
	addq	$1, -40(%rbp)
.L140:
	movq	-56(%rbp), %rax
	cmpq	%rax, -40(%rbp)
	jb	.L141
	movq	$0, -32(%rbp)
	jmp	.L142
.L143:
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	-48(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	cnt(%rip), %rcx
	movq	(%rdx,%rcx), %rdx
	leaq	1(%rdx), %rcx
	leaq	0(,%rax,8), %rdx
	leaq	cnt(%rip), %rax
	movq	%rcx, (%rdx,%rax)
	addq	$1, -32(%rbp)
.L142:
	movq	-56(%rbp), %rax
	cmpq	%rax, -32(%rbp)
	jb	.L143
	movq	-56(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	jne	.L144
	movq	$0, -24(%rbp)
	jmp	.L145
.L149:
	movq	-24(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	jne	.L146
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	cnt(%rip), %rax
	movq	(%rdx,%rax), %rax
	testq	%rax, %rax
	je	.L147
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L156
.L146:
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	cnt(%rip), %rax
	movq	(%rdx,%rax), %rax
	cmpq	$2, %rax
	je	.L147
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L156
.L147:
	addq	$1, -24(%rbp)
.L145:
	movq	-56(%rbp), %rax
	cmpq	%rax, -24(%rbp)
	jb	.L149
	jmp	.L150
.L144:
	movq	$0, -16(%rbp)
	jmp	.L151
.L155:
	cmpq	$0, -16(%rbp)
	jne	.L152
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	cnt(%rip), %rax
	movq	(%rdx,%rax), %rax
	cmpq	$1, %rax
	je	.L153
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L156
.L152:
	movq	-16(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	jne	.L154
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	cnt(%rip), %rax
	movq	(%rdx,%rax), %rax
	cmpq	$2, %rax
	je	.L153
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L156
.L154:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	leaq	cnt(%rip), %rax
	movq	(%rdx,%rax), %rax
	testq	%rax, %rax
	je	.L153
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L156
.L153:
	addq	$1, -16(%rbp)
.L151:
	movq	-56(%rbp), %rax
	cmpq	%rax, -16(%rbp)
	jb	.L155
.L150:
	movq	-56(%rbp), %rax
	shrq	%rax
	movl	$1000000007, %edx
	movq	%rax, %rsi
	movl	$2, %edi
	call	powU64WMod
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
.L156:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L157
	call	__stack_chk_fail@PLT
.L157:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE39:
	.size	main, .-main
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
