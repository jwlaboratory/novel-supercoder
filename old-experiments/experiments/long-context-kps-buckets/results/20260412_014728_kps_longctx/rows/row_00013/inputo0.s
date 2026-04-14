	.file	"inputC.c"
	.text
	.globl	max
	.type	max, @function
max:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.L2
	movl	-4(%rbp), %eax
	jmp	.L3
.L2:
	movl	-8(%rbp), %eax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	max, .-max
	.globl	min
	.type	min, @function
min:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.L5
	movl	-4(%rbp), %eax
	jmp	.L6
.L5:
	movl	-8(%rbp), %eax
.L6:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	min, .-min
	.globl	zt
	.type	zt, @function
zt:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$8, %rsp
	.cfi_offset 3, -24
	movl	%edi, -12(%rbp)
	movl	%esi, -16(%rbp)
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	max
	movl	%eax, %ebx
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	min
	movl	%eax, %edx
	movl	%ebx, %eax
	subl	%edx, %eax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	zt, .-zt
	.globl	round
	.type	round, @function
round:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cltd
	idivl	-8(%rbp)
	movl	%edx, %eax
	addl	%eax, %eax
	cmpl	%eax, -8(%rbp)
	jg	.L10
	movl	-4(%rbp), %eax
	cltd
	idivl	-8(%rbp)
	addl	$1, %eax
	jmp	.L11
.L10:
	movl	-4(%rbp), %eax
	cltd
	idivl	-8(%rbp)
.L11:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	round, .-round
	.globl	ceil
	.type	ceil, @function
ceil:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cltd
	idivl	-8(%rbp)
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L13
	movl	-4(%rbp), %eax
	cltd
	idivl	-8(%rbp)
	jmp	.L14
.L13:
	movl	-4(%rbp), %eax
	cltd
	idivl	-8(%rbp)
	addl	$1, %eax
.L14:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	ceil, .-ceil
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	jmp	.L16
.L17:
	movl	-20(%rbp), %eax
	cltd
	idivl	-24(%rbp)
	movl	%edx, -4(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -24(%rbp)
.L16:
	cmpl	$0, -24(%rbp)
	jne	.L17
	movl	-20(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	gcd, .-gcd
	.globl	lcm
	.type	lcm, @function
lcm:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	gcd
	movl	%eax, -4(%rbp)
	movl	-20(%rbp), %eax
	cltd
	idivl	-4(%rbp)
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	imull	-24(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	lcm, .-lcm
	.globl	nCr
	.type	nCr, @function
nCr:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$1, -4(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L22
.L23:
	movl	-20(%rbp), %eax
	addl	$1, %eax
	subl	-8(%rbp), %eax
	movl	-4(%rbp), %edx
	imull	%edx, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	cltd
	idivl	-8(%rbp)
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L22:
	movl	-8(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jle	.L23
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	nCr, .-nCr
	.globl	nHr
	.type	nHr, @function
nHr:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	leal	-1(%rax), %edx
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	%edx, %edi
	call	nCr
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	nHr, .-nHr
	.globl	fact
	.type	fact, @function
fact:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$1, -4(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L28
.L29:
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L28:
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jle	.L29
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	fact, .-fact
	.globl	pow
	.type	pow, @function
pow:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$1, -4(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L32
.L33:
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L32:
	movl	-8(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jle	.L33
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	pow, .-pow
	.globl	dsum
	.type	dsum, @function
dsum:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L36
.L37:
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	sarl	$2, %eax
	movl	%ecx, %esi
	sarl	$31, %esi
	subl	%esi, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	addl	%edx, -4(%rbp)
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$1717986919, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$2, %edx
	sarl	$31, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	movl	%eax, -20(%rbp)
.L36:
	cmpl	$0, -20(%rbp)
	jne	.L37
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	dsum, .-dsum
	.globl	dsumb
	.type	dsumb, @function
dsumb:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L40
.L41:
	movl	-20(%rbp), %eax
	cltd
	idivl	-24(%rbp)
	movl	%edx, %eax
	addl	%eax, -4(%rbp)
	movl	-20(%rbp), %eax
	cltd
	idivl	-24(%rbp)
	movl	%eax, -20(%rbp)
.L40:
	cmpl	$0, -20(%rbp)
	jne	.L41
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	dsumb, .-dsumb
	.globl	sankaku
	.type	sankaku, @function
sankaku:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	addl	$1, %eax
	imull	-4(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	sankaku, .-sankaku
	.globl	llmax
	.type	llmax, @function
llmax:
.LFB20:
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
	jle	.L46
	movq	-8(%rbp), %rax
	jmp	.L47
.L46:
	movq	-16(%rbp), %rax
.L47:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	llmax, .-llmax
	.globl	llmin
	.type	llmin, @function
llmin:
.LFB21:
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
	jge	.L49
	movq	-8(%rbp), %rax
	jmp	.L50
.L49:
	movq	-16(%rbp), %rax
.L50:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	llmin, .-llmin
	.globl	llzt
	.type	llzt, @function
llzt:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	llmax
	movq	%rax, %rbx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	llmin
	movq	%rax, %rdx
	movq	%rbx, %rax
	subq	%rdx, %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	llzt, .-llzt
	.globl	llround
	.type	llround, @function
llround:
.LFB23:
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
	cqto
	idivq	-16(%rbp)
	movq	%rdx, %rax
	addq	%rax, %rax
	cmpq	%rax, -16(%rbp)
	jg	.L54
	movq	-8(%rbp), %rax
	cqto
	idivq	-16(%rbp)
	addq	$1, %rax
	jmp	.L55
.L54:
	movq	-8(%rbp), %rax
	cqto
	idivq	-16(%rbp)
.L55:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	llround, .-llround
	.globl	llceil
	.type	llceil, @function
llceil:
.LFB24:
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
	cqto
	idivq	-16(%rbp)
	movq	%rdx, %rax
	testq	%rax, %rax
	jne	.L57
	movq	-8(%rbp), %rax
	cqto
	idivq	-16(%rbp)
	jmp	.L58
.L57:
	movq	-8(%rbp), %rax
	cqto
	idivq	-16(%rbp)
	addq	$1, %rax
.L58:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	llceil, .-llceil
	.globl	llgcd
	.type	llgcd, @function
llgcd:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	jmp	.L60
.L61:
	movq	-24(%rbp), %rax
	cqto
	idivq	-32(%rbp)
	movq	%rdx, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -32(%rbp)
.L60:
	cmpq	$0, -32(%rbp)
	jne	.L61
	movq	-24(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	llgcd, .-llgcd
	.globl	lllcm
	.type	lllcm, @function
lllcm:
.LFB26:
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
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	llgcd
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	cqto
	idivq	-8(%rbp)
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	imulq	-32(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	lllcm, .-lllcm
	.globl	llnCr
	.type	llnCr, @function
llnCr:
.LFB27:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$1, -8(%rbp)
	movq	$1, -16(%rbp)
	jmp	.L66
.L67:
	movq	-24(%rbp), %rax
	addq	$1, %rax
	subq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	imulq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	cqto
	idivq	-16(%rbp)
	movq	%rax, -8(%rbp)
	addq	$1, -16(%rbp)
.L66:
	movq	-16(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jle	.L67
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	llnCr, .-llnCr
	.globl	llnHr
	.type	llnHr, @function
llnHr:
.LFB28:
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
	call	llnCr
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	llnHr, .-llnHr
	.globl	llfact
	.type	llfact, @function
llfact:
.LFB29:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	$1, -8(%rbp)
	movq	$1, -16(%rbp)
	jmp	.L72
.L73:
	movq	-8(%rbp), %rax
	imulq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	addq	$1, -16(%rbp)
.L72:
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jle	.L73
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	llfact, .-llfact
	.globl	llpow
	.type	llpow, @function
llpow:
.LFB30:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$1, -8(%rbp)
	movq	$1, -16(%rbp)
	jmp	.L76
.L77:
	movq	-8(%rbp), %rax
	imulq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	addq	$1, -16(%rbp)
.L76:
	movq	-16(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jle	.L77
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	llpow, .-llpow
	.globl	lldsum
	.type	lldsum, @function
lldsum:
.LFB31:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L80
.L81:
	movq	-24(%rbp), %rcx
	movabsq	$7378697629483820647, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	movq	%rdx, %rax
	sarq	$2, %rax
	movq	%rcx, %rsi
	sarq	$63, %rsi
	subq	%rsi, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	subq	%rax, %rcx
	movq	%rcx, %rdx
	addq	%rdx, -8(%rbp)
	movq	-24(%rbp), %rcx
	movabsq	$7378697629483820647, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	movq	%rdx, %rax
	sarq	$2, %rax
	sarq	$63, %rcx
	movq	%rcx, %rdx
	subq	%rdx, %rax
	movq	%rax, -24(%rbp)
.L80:
	cmpq	$0, -24(%rbp)
	jne	.L81
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	lldsum, .-lldsum
	.globl	lldsumb
	.type	lldsumb, @function
lldsumb:
.LFB32:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L84
.L85:
	movq	-24(%rbp), %rax
	cqto
	idivq	-32(%rbp)
	movq	%rdx, %rax
	addq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	cqto
	idivq	-32(%rbp)
	movq	%rax, -24(%rbp)
.L84:
	cmpq	$0, -24(%rbp)
	jne	.L85
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	lldsumb, .-lldsumb
	.globl	llsankaku
	.type	llsankaku, @function
llsankaku:
.LFB33:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$1, %rax
	imulq	-8(%rbp), %rax
	movq	%rax, %rdx
	shrq	$63, %rdx
	addq	%rdx, %rax
	sarq	%rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	llsankaku, .-llsankaku
	.globl	dbmax
	.type	dbmax, @function
dbmax:
.LFB34:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-8(%rbp), %xmm0
	comisd	-16(%rbp), %xmm0
	jbe	.L94
	movsd	-8(%rbp), %xmm0
	jmp	.L92
.L94:
	movsd	-16(%rbp), %xmm0
.L92:
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	dbmax, .-dbmax
	.globl	dbmin
	.type	dbmin, @function
dbmin:
.LFB35:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	comisd	-8(%rbp), %xmm0
	jbe	.L100
	movsd	-8(%rbp), %xmm0
	jmp	.L98
.L100:
	movsd	-16(%rbp), %xmm0
.L98:
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	dbmin, .-dbmin
	.globl	dbzt
	.type	dbzt, @function
dbzt:
.LFB36:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset 3, -24
	movsd	%xmm0, -16(%rbp)
	movsd	%xmm1, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	dbmax
	movq	%xmm0, %rbx
	movsd	-24(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	dbmin
	movq	%rbx, %xmm1
	subsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	dbzt, .-dbzt
	.globl	sortfncsj
	.type	sortfncsj, @function
sortfncsj:
.LFB37:
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
	jle	.L104
	movl	$1, %eax
	jmp	.L105
.L104:
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L106
	movl	$0, %eax
	jmp	.L105
.L106:
	movl	$-1, %eax
.L105:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	sortfncsj, .-sortfncsj
	.globl	sortfnckj
	.type	sortfnckj, @function
sortfnckj:
.LFB38:
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
	jge	.L108
	movl	$1, %eax
	jmp	.L109
.L108:
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L110
	movl	$0, %eax
	jmp	.L109
.L110:
	movl	$-1, %eax
.L109:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	sortfnckj, .-sortfnckj
	.globl	llsortfncsj
	.type	llsortfncsj, @function
llsortfncsj:
.LFB39:
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
	jle	.L112
	movl	$1, %eax
	jmp	.L113
.L112:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L114
	movl	$0, %eax
	jmp	.L113
.L114:
	movl	$-1, %eax
.L113:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE39:
	.size	llsortfncsj, .-llsortfncsj
	.globl	llsortfnckj
	.type	llsortfnckj, @function
llsortfnckj:
.LFB40:
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
	jge	.L116
	movl	$1, %eax
	jmp	.L117
.L116:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L118
	movl	$0, %eax
	jmp	.L117
.L118:
	movl	$-1, %eax
.L117:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE40:
	.size	llsortfnckj, .-llsortfnckj
	.globl	dbsortfncsj
	.type	dbsortfncsj, @function
dbsortfncsj:
.LFB41:
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
	movsd	(%rax), %xmm0
	movq	-16(%rbp), %rax
	movsd	(%rax), %xmm1
	comisd	%xmm1, %xmm0
	jbe	.L127
	movl	$1, %eax
	jmp	.L122
.L127:
	movq	-8(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	-16(%rbp), %rax
	movsd	(%rax), %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L123
	ucomisd	%xmm1, %xmm0
	jne	.L123
	movl	$0, %eax
	jmp	.L122
.L123:
	movl	$-1, %eax
.L122:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE41:
	.size	dbsortfncsj, .-dbsortfncsj
	.globl	dbsortfnckj
	.type	dbsortfnckj, @function
dbsortfnckj:
.LFB42:
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
	jbe	.L136
	movl	$1, %eax
	jmp	.L131
.L136:
	movq	-8(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	-16(%rbp), %rax
	movsd	(%rax), %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L132
	ucomisd	%xmm1, %xmm0
	jne	.L132
	movl	$0, %eax
	jmp	.L131
.L132:
	movl	$-1, %eax
.L131:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE42:
	.size	dbsortfnckj, .-dbsortfnckj
	.globl	strsortfncsj
	.type	strsortfncsj, @function
strsortfncsj:
.LFB43:
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
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE43:
	.size	strsortfncsj, .-strsortfncsj
	.globl	strsortfnckj
	.type	strsortfnckj, @function
strsortfnckj:
.LFB44:
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
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE44:
	.size	strsortfnckj, .-strsortfnckj
	.globl	chsortfncsj
	.type	chsortfncsj, @function
chsortfncsj:
.LFB45:
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
	jle	.L142
	movl	$1, %eax
	jmp	.L143
.L142:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jne	.L144
	movl	$0, %eax
	jmp	.L143
.L144:
	movl	$-1, %eax
.L143:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE45:
	.size	chsortfncsj, .-chsortfncsj
	.globl	chsortfnckj
	.type	chsortfnckj, @function
chsortfnckj:
.LFB46:
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
	jge	.L146
	movl	$1, %eax
	jmp	.L147
.L146:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jne	.L148
	movl	$0, %eax
	jmp	.L147
.L148:
	movl	$-1, %eax
.L147:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE46:
	.size	chsortfnckj, .-chsortfnckj
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	shuffledget
	.type	shuffledget, @function
shuffledget:
.LFB47:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-2097152(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$48, %rsp
	movq	%rdi, -2097192(%rbp)
	movl	%esi, -2097196(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$0, -2097180(%rbp)
	jmp	.L150
.L151:
	movl	-2097180(%rbp), %eax
	cltq
	movl	-2097180(%rbp), %edx
	movl	%edx, -2097168(%rbp,%rax,4)
	addl	$1, -2097180(%rbp)
.L150:
	movl	-2097180(%rbp), %eax
	cmpl	-2097196(%rbp), %eax
	jl	.L151
	movl	-2097196(%rbp), %eax
	movl	%eax, -2097180(%rbp)
	jmp	.L152
.L153:
	call	rand@PLT
	cltd
	idivl	-2097180(%rbp)
	movl	%edx, -2097176(%rbp)
	movl	-2097180(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	-2097168(%rbp,%rax,4), %eax
	movl	%eax, -2097172(%rbp)
	movl	-2097180(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-2097176(%rbp), %eax
	cltq
	movl	-2097168(%rbp,%rax,4), %edx
	movslq	%ecx, %rax
	movl	%edx, -2097168(%rbp,%rax,4)
	movl	-2097176(%rbp), %eax
	cltq
	movl	-2097172(%rbp), %edx
	movl	%edx, -2097168(%rbp,%rax,4)
	subl	$1, -2097180(%rbp)
.L152:
	cmpl	$0, -2097180(%rbp)
	jg	.L153
	movl	$0, -2097180(%rbp)
	jmp	.L154
.L155:
	movl	-2097180(%rbp), %eax
	cltq
	movl	-2097168(%rbp,%rax,4), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-2097192(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -2097180(%rbp)
.L154:
	movl	-2097180(%rbp), %eax
	cmpl	-2097196(%rbp), %eax
	jl	.L155
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L156
	call	__stack_chk_fail@PLT
.L156:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE47:
	.size	shuffledget, .-shuffledget
	.globl	dx4
	.data
	.align 16
	.type	dx4, @object
	.size	dx4, 16
dx4:
	.long	1
	.long	-1
	.long	0
	.long	0
	.globl	dy4
	.align 16
	.type	dy4, @object
	.size	dy4, 16
dy4:
	.long	0
	.long	0
	.long	1
	.long	-1
	.globl	dx8
	.align 32
	.type	dx8, @object
	.size	dx8, 32
dx8:
	.long	-1
	.long	-1
	.long	-1
	.long	0
	.long	0
	.long	1
	.long	1
	.long	1
	.globl	dy8
	.align 32
	.type	dy8, @object
	.size	dy8, 32
dy8:
	.long	-1
	.long	0
	.long	1
	.long	-1
	.long	1
	.long	-1
	.long	0
	.long	1
	.text
	.globl	search
	.type	search, @function
search:
.LFB48:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -24(%rbp)
	movl	$0, -12(%rbp)
	movl	-24(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.L158
.L160:
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -20(%rbp)
	jle	.L159
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L158
.L159:
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
.L158:
	movl	-12(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.L160
	movl	-12(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE48:
	.size	search, .-search
	.globl	prarr
	.type	prarr, @function
prarr:
.LFB49:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L163
.L165:
	cmpl	$0, -4(%rbp)
	je	.L164
	movl	$32, %edi
	call	putchar@PLT
.L164:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L163:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L165
	movl	$10, %edi
	call	putchar@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE49:
	.size	prarr, .-prarr
	.globl	sdsortfnc
	.type	sdsortfnc, @function
sdsortfnc:
.LFB50:
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
	jge	.L168
	movl	$-1, %eax
	jmp	.L169
.L168:
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L170
	movl	$1, %eax
	jmp	.L169
.L170:
	movl	$0, %eax
.L169:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE50:
	.size	sdsortfnc, .-sdsortfnc
	.globl	sortfnc
	.type	sortfnc, @function
sortfnc:
.LFB51:
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
	jne	.L172
	movl	$0, %eax
	jmp	.L173
.L172:
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jge	.L174
	movl	$-1, %eax
	jmp	.L173
.L174:
	movl	$1, %eax
.L173:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE51:
	.size	sortfnc, .-sortfnc
	.globl	makemkj
	.type	makemkj, @function
makemkj:
.LFB52:
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
	movl	$0, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	$1, -12(%rbp)
	jmp	.L176
.L178:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-12(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	je	.L177
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	subl	-8(%rbp), %eax
	movl	%eax, 4(%rdx)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
.L177:
	addl	$1, -12(%rbp)
.L176:
	movl	-12(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L178
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	-36(%rbp), %eax
	subl	-8(%rbp), %eax
	movl	%eax, 4(%rdx)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	movl	%eax, (%rdx)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE52:
	.size	makemkj, .-makemkj
	.globl	mlis
	.type	mlis, @function
mlis:
.LFB53:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L180
.L189:
	movl	-16(%rbp), %eax
	imull	%eax, %eax
	cmpl	%eax, -36(%rbp)
	jl	.L191
	movl	-16(%rbp), %eax
	imull	%eax, %eax
	addl	$360000, %eax
	cmpl	%eax, -36(%rbp)
	jg	.L192
	movl	$0, -12(%rbp)
	movl	$600, -8(%rbp)
	jmp	.L185
.L188:
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -4(%rbp)
	movl	-16(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	imull	%eax, %eax
	addl	%edx, %eax
	cmpl	%eax, -36(%rbp)
	jne	.L186
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	-16(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
	addl	$1, -20(%rbp)
	jmp	.L184
.L186:
	movl	-16(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	imull	%eax, %eax
	addl	%edx, %eax
	cmpl	%eax, -36(%rbp)
	jge	.L187
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.L185
.L187:
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
.L185:
	movl	-12(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.L188
	jmp	.L184
.L192:
	nop
.L184:
	addl	$1, -16(%rbp)
.L180:
	cmpl	$600, -16(%rbp)
	jle	.L189
	jmp	.L182
.L191:
	nop
.L182:
	movl	-20(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE53:
	.size	mlis, .-mlis
	.globl	n
	.bss
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.text
	.globl	vid
	.type	vid, @function
vid:
.LFB54:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	n(%rip), %eax
	imull	-4(%rbp), %eax
	leal	(%rax,%rax), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE54:
	.size	vid, .-vid
	.globl	clbig
	.type	clbig, @function
clbig:
.LFB55:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movq	%rcx, -40(%rbp)
	movq	%r8, -48(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L200
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	$3, %eax
	subl	-24(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	jmp	.L198
.L199:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %esi
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	movq	-48(%rbp), %rdi
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	%rdi, %r8
	movl	%eax, %edi
	call	clbig
	addl	$1, -4(%rbp)
.L198:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movl	4(%rax), %eax
	addl	%edx, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L199
	jmp	.L195
.L200:
	nop
.L195:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE55:
	.size	clbig, .-clbig
	.section	.rodata
.LC1:
	.string	"%d%d%d"
.LC2:
	.string	"%d %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB56:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	-190373888(%rsp), %r11
.LPSRL1:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL1
	subq	$3328, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -190377152(%rbp)
	movq	$0, -190377144(%rbp)
	movq	$0, -190377136(%rbp)
	movq	$0, -190377128(%rbp)
	movq	$0, -190377120(%rbp)
	movq	$0, -190377112(%rbp)
	movq	$0, -190377104(%rbp)
	movq	$0, -190377096(%rbp)
	leaq	-190360704(%rbp), %rax
	movl	$2097152, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-188263552(%rbp), %rax
	movl	$2097152, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, -190377184(%rbp)
	movl	$0, -190377180(%rbp)
	movl	$0, -190377176(%rbp)
	movl	$0, -190377172(%rbp)
	leaq	-190377204(%rbp), %rdx
	leaq	-190377208(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	n(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-190377208(%rbp), %eax
	leaq	-190372992(%rbp), %rdx
	leaq	-190377088(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	mlis
	movl	%eax, -190377168(%rbp)
	movl	-190377204(%rbp), %eax
	leaq	-190364800(%rbp), %rdx
	leaq	-190368896(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	mlis
	movl	%eax, -190377164(%rbp)
	movl	$0, -190377200(%rbp)
	jmp	.L202
.L217:
	movl	$0, -190377196(%rbp)
	jmp	.L203
.L216:
	movl	$0, -190377192(%rbp)
	jmp	.L204
.L209:
	movl	-190377192(%rbp), %eax
	cltq
	movl	-190377088(%rbp,%rax,4), %edx
	movl	-190377200(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -190377160(%rbp)
	movl	-190377192(%rbp), %eax
	cltq
	movl	-190372992(%rbp,%rax,4), %edx
	movl	-190377196(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -190377156(%rbp)
	movl	n(%rip), %eax
	addl	%eax, %eax
	cmpl	%eax, -190377160(%rbp)
	jge	.L205
	movl	n(%rip), %eax
	addl	%eax, %eax
	cmpl	%eax, -190377156(%rbp)
	jge	.L205
	movl	-190377196(%rbp), %edx
	movl	-190377200(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377184(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -177777792(%rbp,%rdx,8)
	movl	-190377156(%rbp), %edx
	movl	-190377160(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377184(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -177777788(%rbp,%rdx,8)
	addl	$1, -190377184(%rbp)
	movl	-190377196(%rbp), %edx
	movl	-190377200(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377184(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -177777788(%rbp,%rdx,8)
	movl	-190377156(%rbp), %edx
	movl	-190377160(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377184(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -177777792(%rbp,%rdx,8)
	addl	$1, -190377184(%rbp)
.L205:
	movl	-190377192(%rbp), %eax
	cltq
	movl	-190377088(%rbp,%rax,4), %eax
	testl	%eax, %eax
	je	.L235
	movl	-190377192(%rbp), %eax
	cltq
	movl	-190372992(%rbp,%rax,4), %eax
	testl	%eax, %eax
	je	.L235
	movl	-190377192(%rbp), %eax
	cltq
	movl	-190377088(%rbp,%rax,4), %edx
	movl	-190377200(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -190377160(%rbp)
	movl	-190377192(%rbp), %eax
	cltq
	movl	-190372992(%rbp,%rax,4), %edx
	movl	-190377196(%rbp), %eax
	subl	%edx, %eax
	movl	%eax, -190377156(%rbp)
	movl	n(%rip), %eax
	addl	%eax, %eax
	cmpl	%eax, -190377160(%rbp)
	jge	.L208
	cmpl	$0, -190377156(%rbp)
	js	.L208
	movl	-190377196(%rbp), %edx
	movl	-190377200(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377184(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -177777792(%rbp,%rdx,8)
	movl	-190377156(%rbp), %edx
	movl	-190377160(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377184(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -177777788(%rbp,%rdx,8)
	addl	$1, -190377184(%rbp)
	movl	-190377196(%rbp), %edx
	movl	-190377200(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377184(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -177777788(%rbp,%rdx,8)
	movl	-190377156(%rbp), %edx
	movl	-190377160(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377184(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -177777792(%rbp,%rdx,8)
	addl	$1, -190377184(%rbp)
	jmp	.L208
.L235:
	nop
.L208:
	addl	$1, -190377192(%rbp)
.L204:
	movl	-190377192(%rbp), %eax
	cmpl	-190377168(%rbp), %eax
	jl	.L209
	movl	$0, -190377192(%rbp)
	jmp	.L210
.L215:
	movl	-190377192(%rbp), %eax
	cltq
	movl	-190368896(%rbp,%rax,4), %edx
	movl	-190377200(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -190377160(%rbp)
	movl	-190377192(%rbp), %eax
	cltq
	movl	-190364800(%rbp,%rax,4), %edx
	movl	-190377196(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -190377156(%rbp)
	movl	n(%rip), %eax
	addl	%eax, %eax
	cmpl	%eax, -190377160(%rbp)
	jge	.L211
	movl	n(%rip), %eax
	addl	%eax, %eax
	cmpl	%eax, -190377156(%rbp)
	jge	.L211
	movl	-190377196(%rbp), %edx
	movl	-190377200(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377180(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -88888896(%rbp,%rdx,8)
	movl	-190377156(%rbp), %edx
	movl	-190377160(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377180(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -88888892(%rbp,%rdx,8)
	addl	$1, -190377180(%rbp)
	movl	-190377196(%rbp), %edx
	movl	-190377200(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377180(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -88888892(%rbp,%rdx,8)
	movl	-190377156(%rbp), %edx
	movl	-190377160(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377180(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -88888896(%rbp,%rdx,8)
	addl	$1, -190377180(%rbp)
.L211:
	movl	-190377192(%rbp), %eax
	cltq
	movl	-190368896(%rbp,%rax,4), %eax
	testl	%eax, %eax
	je	.L236
	movl	-190377192(%rbp), %eax
	cltq
	movl	-190364800(%rbp,%rax,4), %eax
	testl	%eax, %eax
	je	.L236
	movl	-190377192(%rbp), %eax
	cltq
	movl	-190368896(%rbp,%rax,4), %edx
	movl	-190377200(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -190377160(%rbp)
	movl	-190377192(%rbp), %eax
	cltq
	movl	-190364800(%rbp,%rax,4), %edx
	movl	-190377196(%rbp), %eax
	subl	%edx, %eax
	movl	%eax, -190377156(%rbp)
	movl	n(%rip), %eax
	addl	%eax, %eax
	cmpl	%eax, -190377160(%rbp)
	jge	.L214
	cmpl	$0, -190377156(%rbp)
	js	.L214
	movl	-190377196(%rbp), %edx
	movl	-190377200(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377180(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -88888896(%rbp,%rdx,8)
	movl	-190377156(%rbp), %edx
	movl	-190377160(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377180(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -88888892(%rbp,%rdx,8)
	addl	$1, -190377180(%rbp)
	movl	-190377196(%rbp), %edx
	movl	-190377200(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377180(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -88888892(%rbp,%rdx,8)
	movl	-190377156(%rbp), %edx
	movl	-190377160(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	movl	-190377180(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -88888896(%rbp,%rdx,8)
	addl	$1, -190377180(%rbp)
	jmp	.L214
.L236:
	nop
.L214:
	addl	$1, -190377192(%rbp)
.L210:
	movl	-190377192(%rbp), %eax
	cmpl	-190377164(%rbp), %eax
	jl	.L215
	addl	$1, -190377196(%rbp)
.L203:
	movl	n(%rip), %eax
	addl	%eax, %eax
	cmpl	%eax, -190377196(%rbp)
	jl	.L216
	addl	$1, -190377200(%rbp)
.L202:
	movl	n(%rip), %eax
	addl	%eax, %eax
	cmpl	%eax, -190377200(%rbp)
	jl	.L217
	movl	$0, -190377200(%rbp)
	jmp	.L218
.L219:
	movl	-190377200(%rbp), %eax
	cltq
	movl	$0, -186166400(%rbp,%rax,8)
	movl	-190377200(%rbp), %eax
	cltq
	movl	$0, -186166396(%rbp,%rax,8)
	movl	-190377200(%rbp), %eax
	cltq
	movl	$0, -181972096(%rbp,%rax,8)
	movl	-190377200(%rbp), %eax
	cltq
	movl	$0, -181972092(%rbp,%rax,8)
	addl	$1, -190377200(%rbp)
.L218:
	cmpl	$524287, -190377200(%rbp)
	jle	.L219
	movl	-190377184(%rbp), %eax
	movslq	%eax, %rsi
	leaq	-177777792(%rbp), %rax
	leaq	sortfnc(%rip), %rdx
	movq	%rdx, %rcx
	movl	$8, %edx
	movq	%rax, %rdi
	call	qsort@PLT
	movl	-190377180(%rbp), %eax
	movslq	%eax, %rsi
	leaq	-88888896(%rbp), %rax
	leaq	sortfnc(%rip), %rdx
	movq	%rdx, %rcx
	movl	$8, %edx
	movq	%rax, %rdi
	call	qsort@PLT
	movl	-190377184(%rbp), %edx
	leaq	-186166400(%rbp), %rcx
	leaq	-177777792(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	makemkj
	movl	-190377180(%rbp), %edx
	leaq	-181972096(%rbp), %rcx
	leaq	-88888896(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	makemkj
	movl	$0, -190377200(%rbp)
	jmp	.L220
.L221:
	leaq	-186166400(%rbp), %rsi
	leaq	-177777792(%rbp), %rcx
	leaq	-190360704(%rbp), %rdx
	movl	-190377200(%rbp), %eax
	movq	%rsi, %r8
	movl	$2, %esi
	movl	%eax, %edi
	call	clbig
	leaq	-181972096(%rbp), %rsi
	leaq	-88888896(%rbp), %rcx
	leaq	-188263552(%rbp), %rdx
	movl	-190377200(%rbp), %eax
	movq	%rsi, %r8
	movl	$2, %esi
	movl	%eax, %edi
	call	clbig
	movl	-190377200(%rbp), %eax
	cltq
	movl	-190360704(%rbp,%rax,4), %eax
	movl	-190377200(%rbp), %edx
	movslq	%edx, %rdx
	movl	-188263552(%rbp,%rdx,4), %edx
	movslq	%edx, %rsi
	movslq	%eax, %rcx
	salq	$2, %rcx
	addq	%rsi, %rcx
	movl	-190377152(%rbp,%rcx,4), %ecx
	addl	$1, %ecx
	movslq	%edx, %rdx
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	%ecx, -190377152(%rbp,%rax,4)
	addl	$1, -190377200(%rbp)
.L220:
	movl	n(%rip), %edx
	movl	n(%rip), %eax
	imull	%edx, %eax
	sall	$2, %eax
	cmpl	%eax, -190377200(%rbp)
	jl	.L221
	movl	$1, -190377200(%rbp)
	jmp	.L222
.L226:
	movl	$1, -190377196(%rbp)
	jmp	.L223
.L225:
	movl	-190377196(%rbp), %eax
	movslq	%eax, %rdx
	movl	-190377200(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	-190377152(%rbp,%rax,4), %edx
	movl	n(%rip), %ecx
	movl	n(%rip), %eax
	imull	%ecx, %eax
	cmpl	%eax, %edx
	jl	.L224
	movl	-190377200(%rbp), %eax
	movl	%eax, -190377176(%rbp)
	movl	-190377196(%rbp), %eax
	movl	%eax, -190377172(%rbp)
.L224:
	addl	$1, -190377196(%rbp)
.L223:
	cmpl	$2, -190377196(%rbp)
	jle	.L225
	addl	$1, -190377200(%rbp)
.L222:
	cmpl	$2, -190377200(%rbp)
	jle	.L226
	movl	$0, -190377188(%rbp)
	movl	$0, -190377200(%rbp)
	jmp	.L227
.L232:
	movl	$0, -190377196(%rbp)
	jmp	.L228
.L231:
	movl	-190377196(%rbp), %edx
	movl	-190377200(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	cltq
	movl	-190360704(%rbp,%rax,4), %eax
	cmpl	%eax, -190377176(%rbp)
	jne	.L229
	movl	-190377196(%rbp), %edx
	movl	-190377200(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	vid
	cltq
	movl	-188263552(%rbp,%rax,4), %eax
	cmpl	%eax, -190377172(%rbp)
	jne	.L229
	movl	n(%rip), %edx
	movl	n(%rip), %eax
	imull	%edx, %eax
	cmpl	%eax, -190377188(%rbp)
	jge	.L230
	movl	-190377196(%rbp), %edx
	movl	-190377200(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L230:
	addl	$1, -190377188(%rbp)
.L229:
	addl	$1, -190377196(%rbp)
.L228:
	movl	n(%rip), %eax
	addl	%eax, %eax
	cmpl	%eax, -190377196(%rbp)
	jl	.L231
	addl	$1, -190377200(%rbp)
.L227:
	movl	n(%rip), %eax
	addl	%eax, %eax
	cmpl	%eax, -190377200(%rbp)
	jl	.L232
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L234
	call	__stack_chk_fail@PLT
.L234:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE56:
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
