	.file	"inputC.c"
	.text
	.p2align 4
	.globl	min_heapify
	.type	min_heapify, @function
min_heapify:
.LFB3:
	.cfi_startproc
	movl	qsize(%rip), %esi
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L10:
	movslq	%ecx, %rdx
	movl	que+4(,%rdx,8), %r8d
	movslq	%edi, %rdx
	cmpl	que+4(,%rdx,8), %r8d
	jge	.L2
	cmpl	%eax, %esi
	jg	.L6
	movl	%ecx, %eax
.L7:
	cmpl	%edi, %eax
	je	.L1
	movslq	%eax, %rcx
	movl	que+4(,%rdx,8), %edi
	movzwl	que(,%rdx,8), %r8d
	movq	que(,%rcx,8), %r9
	movq	%r9, que(,%rdx,8)
	movw	%r8w, que(,%rcx,8)
	movl	%edi, que+4(,%rcx,8)
	movl	%eax, %edi
.L8:
	leal	(%rdi,%rdi), %ecx
	leal	1(%rcx), %eax
	cmpl	%ecx, %esi
	jg	.L10
.L2:
	cmpl	%eax, %esi
	jg	.L4
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	movslq	%edi, %rdx
	movslq	%eax, %rcx
	movl	que+4(,%rdx,8), %r10d
	cmpl	%r10d, que+4(,%rcx,8)
	jl	.L7
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	movslq	%eax, %r9
	cmpl	que+4(,%r9,8), %r8d
	cmovle	%ecx, %eax
	jmp	.L7
.L1:
	ret
	.cfi_endproc
.LFE3:
	.size	min_heapify, .-min_heapify
	.p2align 4
	.globl	deq
	.type	deq, @function
deq:
.LFB4:
	.cfi_startproc
	movl	qsize(%rip), %eax
	xorl	%esi, %esi
	leal	-1(%rax), %edi
	movslq	%edi, %rax
	movl	%edi, qsize(%rip)
	movq	que(,%rax,8), %rax
	movq	%rax, que(%rip)
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L19:
	movslq	%ecx, %rdx
	movl	que+4(,%rdx,8), %r8d
	movslq	%esi, %rdx
	cmpl	que+4(,%rdx,8), %r8d
	jge	.L12
	cmpl	%eax, %edi
	jle	.L18
	movslq	%eax, %r9
	cmpl	que+4(,%r9,8), %r8d
	cmovle	%ecx, %eax
.L16:
	cmpl	%eax, %esi
	je	.L11
	movslq	%eax, %rcx
	movl	que+4(,%rdx,8), %esi
	movzwl	que(,%rdx,8), %r8d
	movq	que(,%rcx,8), %r9
	movq	%r9, que(,%rdx,8)
	movw	%r8w, que(,%rcx,8)
	movl	%esi, que+4(,%rcx,8)
	movl	%eax, %esi
.L17:
	leal	(%rsi,%rsi), %ecx
	leal	1(%rcx), %eax
	cmpl	%ecx, %edi
	jg	.L19
.L12:
	cmpl	%eax, %edi
	jg	.L14
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	movslq	%esi, %rdx
	movslq	%eax, %rcx
	movl	que+4(,%rdx,8), %r10d
	cmpl	%r10d, que+4(,%rcx,8)
	jl	.L16
.L11:
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	movl	%ecx, %eax
	jmp	.L16
	.cfi_endproc
.LFE4:
	.size	deq, .-deq
	.p2align 4
	.globl	enq
	.type	enq, @function
enq:
.LFB5:
	.cfi_startproc
	movslq	qsize(%rip), %rax
	leal	1(%rax), %ecx
	movl	%ecx, qsize(%rip)
	movslq	%eax, %rcx
	movb	%dil, que(,%rcx,8)
	movb	%sil, que+1(,%rcx,8)
	movl	%edx, que+4(,%rcx,8)
	testl	%eax, %eax
	jg	.L21
	ret
	.p2align 4,,10
	.p2align 3
.L23:
	movzwl	que(,%rax,8), %edi
	movl	que+4(,%rax,8), %edx
	movq	que(,%rcx,8), %r8
	movq	%r8, que(,%rax,8)
	movw	%di, que(,%rcx,8)
	movl	%edx, que+4(,%rcx,8)
	testl	%esi, %esi
	je	.L20
	movslq	%esi, %rax
.L21:
	movl	%eax, %esi
	sarl	%esi
	movslq	%esi, %rcx
	cmpl	%edx, que+4(,%rcx,8)
	jg	.L23
.L20:
	ret
	.cfi_endproc
.LFE5:
	.size	enq, .-enq
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d"
.LC1:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$10, %esi
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	stdin(%rip), %rdx
	leaq	54(%rsp), %rdi
	call	fgets
	leaq	48(%rsp), %rcx
	leaq	44(%rsp), %rdx
	xorl	%eax, %eax
	movl	$.LC0, %esi
	leaq	54(%rsp), %rdi
	call	__isoc99_sscanf
	movl	44(%rsp), %eax
	testl	%eax, %eax
	jle	.L70
	movl	$map, %edi
	xorl	%r12d, %r12d
	movl	%ebp, 8(%rsp)
	orl	$-1, %r14d
	movl	%edi, %r8d
	movl	%r15d, %ebp
	orq	$-1, %r13
	movl	%ebx, %r15d
	negl	%r8d
	movl	%r12d, %ebx
	movl	%r8d, %r12d
.L38:
	movq	stdin(%rip), %rdx
	movl	$33, %esi
	movq	%rdi, (%rsp)
	call	fgets
	movl	%r13d, %eax
	movq	(%rsp), %rdi
	orl	%r14d, %eax
	js	.L97
.L31:
	addl	$1, %ebx
	cmpl	%ebx, 44(%rsp)
	jle	.L95
	testl	%eax, %eax
	js	.L68
	movslq	%ebx, %rcx
	movl	%r15d, %ebx
	movl	%ebp, %r15d
	movl	8(%rsp), %ebp
	movq	%rcx, %r12
	imulq	$33, %rcx, %rcx
	movl	%ebx, (%rsp)
	addq	$map, %rcx
	movq	%rcx, %rbx
	.p2align 4,,10
	.p2align 3
.L39:
	movq	stdin(%rip), %rdx
	movq	%rbx, %rdi
	movl	$33, %esi
	addl	$1, %r12d
	addq	$33, %rbx
	call	fgets
	cmpl	%r12d, 44(%rsp)
	jg	.L39
	movslq	(%rsp), %rbx
.L30:
	movl	$dist, %edx
	movl	$544, %ecx
	movsbl	%bl, %esi
	movabsq	$1157442765409226768, %rax
	movl	$0, qsize(%rip)
	movq	%rdx, %rdi
	xorl	%edx, %edx
	rep stosq
	movl	$269488144, (%rdi)
	movsbl	%r13b, %edi
	call	enq
	movq	%r13, %rax
	salq	$5, %rax
	addq	%r13, %rax
	movl	qsize(%rip), %r13d
	addq	%rbx, %rax
	movl	$0, dist(,%rax,4)
	testl	%r13d, %r13d
	je	.L41
	movl	%r14d, %r10d
	movl	%r13d, %eax
	.p2align 4,,10
	.p2align 3
.L66:
	subl	$1, %eax
	movsbl	que(%rip), %r11d
	movsbl	que+1(%rip), %ebx
	xorl	%edi, %edi
	movslq	%eax, %rdx
	movl	%eax, qsize(%rip)
	movq	que(,%rdx,8), %rdx
	movq	%rdx, que(%rip)
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L98:
	movslq	%esi, %rcx
	movl	que+4(,%rcx,8), %r8d
	movslq	%edi, %rcx
	cmpl	que+4(,%rcx,8), %r8d
	jge	.L42
	cmpl	%edx, %eax
	jle	.L71
	movslq	%edx, %r9
	cmpl	que+4(,%r9,8), %r8d
	cmovle	%esi, %edx
.L46:
	cmpl	%edx, %edi
	je	.L45
	movslq	%edx, %rsi
	movl	que+4(,%rcx,8), %edi
	movzwl	que(,%rcx,8), %r8d
	movq	que(,%rsi,8), %r9
	movq	%r9, que(,%rcx,8)
	movw	%r8w, que(,%rsi,8)
	movl	%edi, que+4(,%rsi,8)
	movl	%edx, %edi
.L47:
	leal	(%rdi,%rdi), %esi
	leal	1(%rsi), %edx
	cmpl	%esi, %eax
	jg	.L98
.L42:
	cmpl	%edx, %eax
	jg	.L44
.L45:
	movslq	%r11d, %rcx
	movslq	%ebx, %rdx
	movq	%rcx, %rax
	salq	$5, %rax
	addq	%rcx, %rax
	addq	%rdx, %rax
	movl	dist(,%rax,4), %r9d
	cmpl	%r10d, %r11d
	jne	.L72
	cmpl	%r15d, %ebx
	je	.L92
.L72:
	movl	44(%rsp), %ebp
	movl	48(%rsp), %r14d
	movl	%r11d, %eax
	addl	mv(%rip), %eax
	js	.L50
	movl	mv+4(%rip), %edx
	addl	%ebx, %edx
	cmpl	%ebp, %eax
	jge	.L50
	testl	%edx, %edx
	js	.L50
	cmpl	%r14d, %edx
	jge	.L50
	movslq	%eax, %rsi
	movslq	%edx, %rdi
	movq	%rsi, %rcx
	salq	$5, %rcx
	addq	%rsi, %rcx
	movzbl	map(%rdi,%rcx), %esi
	cmpb	$111, %sil
	je	.L51
	cmpb	$46, %sil
	je	.L99
	.p2align 4,,10
	.p2align 3
.L50:
	movl	%r11d, %eax
	addl	mv+8(%rip), %eax
	js	.L52
	movl	%ebx, %edx
	addl	mv+12(%rip), %edx
	js	.L52
	cmpl	%ebp, %eax
	jge	.L52
	cmpl	%r14d, %edx
	jge	.L52
	movslq	%eax, %rsi
	movslq	%edx, %rdi
	movq	%rsi, %rcx
	salq	$5, %rcx
	addq	%rsi, %rcx
	movzbl	map(%rdi,%rcx), %esi
	cmpb	$111, %sil
	je	.L53
	cmpb	$46, %sil
	je	.L100
	.p2align 4,,10
	.p2align 3
.L52:
	movl	%r11d, %eax
	addl	mv+16(%rip), %eax
	js	.L54
	movl	mv+20(%rip), %edx
	addl	%ebx, %edx
	cmpl	%ebp, %eax
	jge	.L54
	testl	%edx, %edx
	js	.L54
	cmpl	%r14d, %edx
	jge	.L54
	movslq	%eax, %rsi
	movslq	%edx, %rdi
	movq	%rsi, %rcx
	salq	$5, %rcx
	addq	%rsi, %rcx
	movzbl	map(%rdi,%rcx), %esi
	cmpb	$111, %sil
	je	.L55
	cmpb	$46, %sil
	je	.L101
	.p2align 4,,10
	.p2align 3
.L54:
	movl	%r11d, %eax
	addl	mv+24(%rip), %eax
	js	.L56
	movl	mv+28(%rip), %edx
	addl	%ebx, %edx
	cmpl	%ebp, %eax
	jge	.L56
	testl	%edx, %edx
	js	.L56
	cmpl	%r14d, %edx
	jge	.L56
	movslq	%eax, %rsi
	movslq	%edx, %rdi
	movq	%rsi, %rcx
	salq	$5, %rcx
	addq	%rsi, %rcx
	movzbl	map(%rdi,%rcx), %esi
	cmpb	$111, %sil
	je	.L57
	cmpb	$46, %sil
	je	.L102
	.p2align 4,,10
	.p2align 3
.L56:
	leal	3(%r9), %edi
	movl	%r9d, 8(%rsp)
	movslq	qsize(%rip), %rax
	movl	$mv, %r8d
	movl	%r10d, 12(%rsp)
	movl	%r15d, 16(%rsp)
	movl	%edi, (%rsp)
	movl	%ebx, %edi
	movl	%r11d, %ebx
	movl	%edi, %r11d
.L58:
	movl	(%r8), %r10d
	movl	4(%r8), %r9d
	movl	%r11d, %ecx
	movl	%ebx, %edx
	movl	$3, %esi
	xorl	%edi, %edi
.L64:
	addl	%r10d, %edx
	addl	%r9d, %ecx
	movl	%edx, %r15d
	orl	%ecx, %r15d
	js	.L59
	cmpl	%ebp, %edx
	jge	.L59
	cmpl	%r14d, %ecx
	jge	.L59
	movslq	%edx, %r12
	movslq	%ecx, %r15
	movq	%r12, %r13
	salq	$5, %r13
	addq	%r13, %r12
	cmpb	$35, map(%r15,%r12)
	je	.L60
	movl	(%rsp), %r13d
	addq	%r15, %r12
	addl	%edi, %r13d
	cmpl	%r13d, dist(,%r12,4)
	jg	.L103
	.p2align 4,,10
	.p2align 3
.L59:
	addl	$1, %edi
	subl	$1, %esi
	jne	.L64
.L60:
	addq	$8, %r8
	cmpq	$mv+32, %r8
	jne	.L58
	movl	8(%rsp), %r9d
	movl	12(%rsp), %r10d
	movl	16(%rsp), %r15d
	testl	%eax, %eax
	jne	.L66
.L92:
	movl	%r9d, %ebp
.L41:
	movl	%ebp, %esi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	printf
	addq	$72, %rsp
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
.L44:
	.cfi_restore_state
	movslq	%edx, %rsi
	movslq	%edi, %rcx
	movl	que+4(,%rsi,8), %esi
	cmpl	%esi, que+4(,%rcx,8)
	jg	.L46
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L71:
	movl	%esi, %edx
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L103:
	movl	%r13d, dist(,%r12,4)
	leal	1(%rax), %r15d
	movslq	%eax, %r12
	movl	%r15d, qsize(%rip)
	movb	%dl, que(,%r12,8)
	movb	%cl, que+1(,%r12,8)
	movl	%r13d, que+4(,%r12,8)
	testl	%eax, %eax
	jle	.L62
	movl	%r10d, 20(%rsp)
	movl	%r9d, 24(%rsp)
	movl	%edx, 28(%rsp)
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L63:
	movl	que+4(,%rax,8), %r12d
	movq	que(,%r9,8), %rdx
	movzwl	que(,%rax,8), %r13d
	movq	%rdx, que(,%rax,8)
	movw	%r13w, que(,%r9,8)
	movl	%r12d, que+4(,%r9,8)
	testl	%r10d, %r10d
	je	.L94
	movl	%r12d, %r13d
	movslq	%r10d, %rax
.L61:
	movl	%eax, %r10d
	sarl	%r10d
	movslq	%r10d, %r9
	cmpl	%r13d, que+4(,%r9,8)
	jg	.L63
.L94:
	movl	20(%rsp), %r10d
	movl	24(%rsp), %r9d
	movl	28(%rsp), %edx
.L62:
	movslq	%r15d, %rax
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L97:
	movslq	48(%rsp), %rcx
	testl	%ecx, %ecx
	jle	.L31
	addq	%rdi, %rcx
	movq	%rdi, %rax
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L32:
	cmpb	$71, %dl
	jne	.L33
	movb	$46, (%rax)
	movl	%esi, %ebp
	movl	%ebx, %r14d
.L33:
	addq	$1, %rax
	cmpq	%rcx, %rax
	je	.L104
.L34:
	movzbl	(%rax), %edx
	leal	(%r12,%rax), %esi
	cmpb	$83, %dl
	jne	.L32
	movb	$46, (%rax)
	addq	$1, %rax
	movl	%esi, %r15d
	movslq	%ebx, %r13
	cmpq	%rcx, %rax
	jne	.L34
.L104:
	addl	$1, %ebx
	cmpl	44(%rsp), %ebx
	jl	.L68
.L95:
	movslq	%r15d, %rbx
	movl	%ebp, %r15d
	movl	8(%rsp), %ebp
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L68:
	addq	$33, %rdi
	subl	$33, %r12d
	jmp	.L38
.L55:
	addq	%rdi, %rcx
	leal	1(%r9), %r8d
	cmpl	%r8d, dist(,%rcx,4)
	jle	.L54
	movsbl	%dl, %esi
	movsbl	%al, %edi
	movl	%r8d, %edx
	movl	%r8d, dist(,%rcx,4)
	call	enq
	movl	44(%rsp), %ebp
	movl	48(%rsp), %r14d
	jmp	.L54
.L57:
	addq	%rdi, %rcx
	leal	1(%r9), %r8d
	cmpl	%r8d, dist(,%rcx,4)
	jle	.L56
	movsbl	%dl, %esi
	movsbl	%al, %edi
	movl	%r8d, %edx
	movl	%r8d, dist(,%rcx,4)
	call	enq
	movl	44(%rsp), %ebp
	movl	48(%rsp), %r14d
	jmp	.L56
.L51:
	addq	%rdi, %rcx
	leal	1(%r9), %r8d
	cmpl	%r8d, dist(,%rcx,4)
	jle	.L50
	movsbl	%dl, %esi
	movsbl	%al, %edi
	movl	%r8d, %edx
	movl	%r8d, dist(,%rcx,4)
	call	enq
	movl	44(%rsp), %ebp
	movl	48(%rsp), %r14d
	jmp	.L50
.L53:
	addq	%rdi, %rcx
	leal	1(%r9), %r8d
	cmpl	%r8d, dist(,%rcx,4)
	jle	.L52
	movsbl	%dl, %esi
	movsbl	%al, %edi
	movl	%r8d, %edx
	movl	%r8d, dist(,%rcx,4)
	call	enq
	movl	44(%rsp), %ebp
	movl	48(%rsp), %r14d
	jmp	.L52
.L102:
	addq	%rdi, %rcx
	leal	2(%r9), %esi
	cmpl	%esi, dist(,%rcx,4)
	jle	.L56
	movl	%esi, dist(,%rcx,4)
	movsbl	%dl, %ecx
	movsbl	%al, %edi
	movl	%esi, %edx
	movl	%ecx, %esi
	call	enq
	movl	44(%rsp), %ebp
	movl	48(%rsp), %r14d
	jmp	.L56
.L101:
	addq	%rdi, %rcx
	leal	2(%r9), %esi
	cmpl	%esi, dist(,%rcx,4)
	jle	.L54
	movl	%esi, dist(,%rcx,4)
	movsbl	%dl, %ecx
	movsbl	%al, %edi
	movl	%esi, %edx
	movl	%ecx, %esi
	call	enq
	movl	44(%rsp), %ebp
	movl	48(%rsp), %r14d
	jmp	.L54
.L100:
	addq	%rdi, %rcx
	leal	2(%r9), %esi
	cmpl	%esi, dist(,%rcx,4)
	jle	.L52
	movl	%esi, dist(,%rcx,4)
	movsbl	%dl, %ecx
	movsbl	%al, %edi
	movl	%esi, %edx
	movl	%ecx, %esi
	call	enq
	movl	44(%rsp), %ebp
	movl	48(%rsp), %r14d
	jmp	.L52
.L99:
	addq	%rdi, %rcx
	leal	2(%r9), %esi
	cmpl	%esi, dist(,%rcx,4)
	jle	.L50
	movl	%esi, dist(,%rcx,4)
	movsbl	%dl, %ecx
	movsbl	%al, %edi
	movl	%esi, %edx
	movl	%ecx, %esi
	call	enq
	movl	44(%rsp), %ebp
	movl	48(%rsp), %r14d
	jmp	.L50
.L70:
	orl	$-1, %r14d
	orq	$-1, %r13
	jmp	.L30
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.globl	mv
	.data
	.align 32
	.type	mv, @object
	.size	mv, 32
mv:
	.long	-1
	.long	0
	.long	0
	.long	1
	.long	1
	.long	0
	.long	0
	.long	-1
	.globl	dist
	.bss
	.align 32
	.type	dist, @object
	.size	dist, 4356
dist:
	.zero	4356
	.globl	map
	.align 32
	.type	map, @object
	.size	map, 1089
map:
	.zero	1089
	.globl	qsize
	.align 4
	.type	qsize, @object
	.size	qsize, 4
qsize:
	.zero	4
	.globl	que
	.align 32
	.type	que, @object
	.size	que, 80000
que:
	.zero	80000
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
