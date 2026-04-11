	.file	"inputC.c"
	.text
	.p2align 4
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB9:
	.cfi_startproc
	movl	8(%rsi), %eax
	movl	8(%rdi), %edx
	cmpl	%edx, %eax
	je	.L2
	subl	%edx, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	movl	12(%rsi), %eax
	subl	12(%rdi), %eax
	ret
	.cfi_endproc
.LFE9:
	.size	cmp, .-cmp
	.p2align 4
	.globl	bitcount64
	.type	bitcount64, @function
bitcount64:
.LFB8:
	.cfi_startproc
	movabsq	$24019198012642645, %rdx
	movq	%rdi, %rax
	movabsq	$4238682002231055, %rcx
	sarq	%rax
	andq	%rdx, %rdi
	andq	%rdx, %rax
	movabsq	$14411518807585587, %rdx
	addq	%rax, %rdi
	movq	%rdi, %rax
	andq	%rdx, %rdi
	sarq	$2, %rax
	andq	%rdx, %rax
	addq	%rdi, %rax
	movq	%rax, %rdx
	andq	%rcx, %rax
	sarq	$4, %rdx
	andq	%rcx, %rdx
	movabsq	$1095233372415, %rcx
	addq	%rax, %rdx
	movq	%rdx, %rax
	sarq	$8, %rax
	andq	%rcx, %rax
	movabsq	$71777214294589695, %rcx
	andq	%rcx, %rdx
	movabsq	$1095216726015, %rcx
	addq	%rdx, %rax
	movq	%rax, %rdx
	sarq	$16, %rdx
	andq	%rcx, %rdx
	movabsq	$281470681808895, %rcx
	andq	%rcx, %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	sarq	$32, %rdx
	addl	%edx, %eax
	ret
	.cfi_endproc
.LFE8:
	.size	bitcount64, .-bitcount64
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC1:
	.string	"%d%d%d%d"
.LC2:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$.LC0, %edi
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$1, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	leaq	60(%rsp), %rsi
	call	__isoc99_scanf
	movl	60(%rsp), %eax
	testl	%eax, %eax
	jle	.L8
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%r12, %xmm1
	xorl	%r13d, %r13d
	punpcklqdq	%xmm1, %xmm1
.L13:
	leaq	72(%rsp), %rcx
	leaq	68(%rsp), %rdx
	xorl	%eax, %eax
	movaps	%xmm1, (%rsp)
	movl	$.LC1, %edi
	leaq	76(%rsp), %r8
	leaq	64(%rsp), %rsi
	movl	%r13d, %ebx
	call	__isoc99_scanf
	movslq	64(%rsp), %rax
	movslq	68(%rsp), %rdi
	imull	$60, 72(%rsp), %edx
	addl	76(%rsp), %edx
	imull	$60, %eax, %ecx
	movdqa	(%rsp), %xmm1
	addl	%edi, %ecx
	cmpl	%edx, %ecx
	jg	.L9
	leal	1(%rdx), %esi
	subl	%ecx, %esi
	cmpl	%edx, %ecx
	je	.L10
	movq	%rax, %rdx
	salq	$4, %rdx
	subq	%rax, %rdx
	leaq	(%rdi,%rdx,4), %rax
	imulq	$1440, %r13, %rdx
	addq	%rdx, %rax
	movl	%esi, %edx
	shrl	%edx
	leaq	a(,%rax,8), %rax
	salq	$4, %rdx
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L11:
	movdqu	(%rax), %xmm0
	addq	$16, %rax
	por	%xmm1, %xmm0
	movups	%xmm0, -16(%rax)
	cmpq	%rax, %rdx
	jne	.L11
	testb	$1, %sil
	je	.L9
	andl	$-2, %esi
	leal	(%rsi,%rcx), %edx
.L10:
	movslq	%ebx, %rax
	movslq	%edx, %rdx
	imulq	$1440, %rax, %rax
	addq	%rdx, %rax
	orq	%r12, a(,%rax,8)
.L9:
	addq	$1, %r13
	cmpq	$3, %r13
	jne	.L13
	addl	$1, %ebp
	addq	%r12, %r12
	cmpl	%ebp, 60(%rsp)
	jg	.L7
.L8:
	movl	$sz, %r14d
	xorl	%r13d, %r13d
	movabsq	$24019198012642645, %r12
	movabsq	$14411518807585587, %rbp
	movabsq	$4238682002231055, %rbx
.L16:
	leaq	tbl(%r13,%r13), %rdi
	xorl	%edx, %edx
	movabsq	$1095233372415, %r10
	movabsq	$71777214294589695, %r9
	movabsq	$1095216726015, %r8
	movq	%rdi, %rcx
	movabsq	$281470681808895, %rsi
	.p2align 4,,10
	.p2align 3
.L15:
	movq	a(%r13,%rdx,8), %r11
	testq	%r11, %r11
	jle	.L14
	movq	%r11, %rax
	movq	%r11, (%rcx)
	andq	%r12, %r11
	addq	$16, %rcx
	sarq	%rax
	movl	%edx, -4(%rcx)
	andq	%r12, %rax
	addq	%r11, %rax
	movq	%rax, %r11
	andq	%rbp, %rax
	sarq	$2, %r11
	andq	%rbp, %r11
	addq	%rax, %r11
	movq	%r11, %rax
	andq	%rbx, %r11
	sarq	$4, %rax
	andq	%rbx, %rax
	addq	%r11, %rax
	movq	%rax, %r11
	andq	%r9, %rax
	sarq	$8, %r11
	andq	%r10, %r11
	addq	%rax, %r11
	movq	%r11, %rax
	andq	%rsi, %r11
	sarq	$16, %rax
	andq	%r8, %rax
	addq	%r11, %rax
	movq	%rax, %r11
	movl	%eax, %eax
	sarq	$32, %r11
	addq	%r11, %rax
	movl	%eax, -8(%rcx)
.L14:
	addq	$1, %rdx
	cmpq	$1440, %rdx
	jne	.L15
	subq	%rdi, %rcx
	movl	$16, %edx
	addq	$11520, %r13
	addq	$4, %r14
	sarq	$4, %rcx
	movl	%ecx, -4(%r14)
	movslq	%ecx, %rsi
	movl	$cmp, %ecx
	call	qsort
	cmpq	$34560, %r13
	jne	.L16
	movl	tbl+8(%rip), %r14d
	movl	tbl+23048(%rip), %r10d
	movq	tbl(%rip), %rdi
	andq	tbl+23040(%rip), %rdi
	movl	%r14d, %eax
	cmpl	%r14d, %r10d
	movl	tbl+46088(%rip), %esi
	cmovle	%r10d, %eax
	andq	tbl+46080(%rip), %rdi
	movl	%esi, 40(%rsp)
	cmpl	%eax, %esi
	cmovle	%esi, %eax
	movl	%eax, 60(%rsp)
	call	bitcount64
	cmpl	60(%rsp), %eax
	je	.L19
.L22:
	movl	$tbl, %r15d
	xorl	%ecx, %ecx
	movabsq	$24019198012642645, %r8
	movabsq	$14411518807585587, %rdi
	movabsq	$4238682002231055, %rsi
	movabsq	$1095233372415, %r13
	testl	%r14d, %r14d
	jle	.L55
	movl	%r14d, 36(%rsp)
.L20:
	cmpl	%ecx, %r10d
	jle	.L56
	movl	%r10d, 44(%rsp)
	movl	12(%r15), %r14d
	movl	$tbl+23040, %r11d
	movabsq	$71777214294589695, %r12
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L23:
	addq	$16, %r11
	cmpl	%ecx, 8(%r11)
	jle	.L57
.L26:
	movl	12(%r11), %r10d
	cmpl	%r14d, %r10d
	jle	.L23
	movabsq	$1095216726015, %rbx
	movq	(%r15), %r9
	andq	(%r11), %r9
	movabsq	$281470681808895, %rbp
	movq	%r9, %rdx
	movq	%r9, %rax
	sarq	%rdx
	andq	%r8, %rax
	andq	%r8, %rdx
	addq	%rax, %rdx
	movq	%rdx, %rax
	andq	%rdi, %rdx
	sarq	$2, %rax
	andq	%rdi, %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	andq	%rsi, %rdx
	sarq	$4, %rax
	andq	%rsi, %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	andq	%r12, %rdx
	sarq	$8, %rax
	andq	%r13, %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	andq	%rbp, %rax
	sarq	$16, %rdx
	andq	%rbx, %rdx
	addq	%rdx, %rax
	movq	%rax, %rdx
	sarq	$32, %rdx
	addl	%edx, %eax
	cmpl	%ecx, %eax
	jle	.L23
	cmpl	%ecx, 40(%rsp)
	jle	.L23
	movl	%r14d, (%rsp)
	movl	$tbl+46080, %edx
	movq	%r11, 24(%rsp)
	movl	36(%rsp), %r11d
	.p2align 4,,10
	.p2align 3
.L25:
	cmpl	12(%rdx), %r10d
	jge	.L24
	movq	(%rdx), %rax
	andq	%r9, %rax
	movq	%rax, %r14
	andq	%r8, %rax
	sarq	%r14
	andq	%r8, %r14
	addq	%r14, %rax
	movq	%rax, %r14
	andq	%rdi, %rax
	sarq	$2, %r14
	andq	%rdi, %r14
	addq	%r14, %rax
	movq	%rax, %r14
	andq	%rsi, %rax
	sarq	$4, %r14
	andq	%rsi, %r14
	addq	%r14, %rax
	movq	%rax, %r14
	andq	%r12, %rax
	sarq	$8, %r14
	andq	%r13, %r14
	addq	%r14, %rax
	movq	%rax, %r14
	andq	%rbp, %rax
	sarq	$16, %r14
	andq	%rbx, %r14
	addq	%r14, %rax
	movq	%rax, %r14
	movl	%eax, %eax
	sarq	$32, %r14
	addq	%rax, %r14
	cmpl	%ecx, %r14d
	jle	.L24
	cmpl	%r11d, %r14d
	je	.L51
	movl	%r14d, %ecx
.L24:
	addq	$16, %rdx
	cmpl	%ecx, 8(%rdx)
	jg	.L25
	movq	24(%rsp), %r11
	movl	(%rsp), %r14d
	addq	$16, %r11
	cmpl	%ecx, 8(%r11)
	jg	.L26
.L57:
	movl	24(%r15), %eax
	addq	$16, %r15
	movl	44(%rsp), %r10d
	movl	%eax, 36(%rsp)
	cmpl	%eax, %ecx
	jl	.L20
.L54:
	movl	%ecx, %r14d
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L51:
	movl	%r11d, %r14d
.L21:
	movl	%r14d, %esi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	call	printf
	addq	$88, %rsp
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
.L19:
	.cfi_restore_state
	movl	tbl+23052(%rip), %edx
	cmpl	%edx, tbl+12(%rip)
	jge	.L22
	cmpl	tbl+46092(%rip), %edx
	jge	.L22
	movl	%eax, %r14d
	jmp	.L21
.L55:
	xorl	%r14d, %r14d
	jmp	.L21
.L56:
	leaq	16(%r15), %rax
	cmpl	%ecx, 24(%r15)
	jle	.L54
.L28:
	addq	$16, %rax
	cmpl	%ecx, 8(%rax)
	jg	.L28
	jmp	.L54
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.globl	a
	.bss
	.align 32
	.type	a, @object
	.size	a, 34560
a:
	.zero	34560
	.globl	sz
	.align 8
	.type	sz, @object
	.size	sz, 12
sz:
	.zero	12
	.globl	tbl
	.align 32
	.type	tbl, @object
	.size	tbl, 69120
tbl:
	.zero	69120
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
