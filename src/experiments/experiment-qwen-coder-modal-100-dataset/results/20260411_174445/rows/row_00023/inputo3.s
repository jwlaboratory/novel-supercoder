	.file	"inputC.c"
	.text
	.p2align 4
	.type	get_i.part.0, @function
get_i.part.0:
.LFB7:
	.cfi_startproc
	movl	%r8d, %eax
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	subl	%ecx, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%edi, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%edx, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%eax, %ebx
	shrl	$31, %ebx
	addl	%eax, %ebx
	sarl	%ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	addl	%ecx, %ebx
	cmpl	%edx, %ecx
	jge	.L10
	cmpl	%esi, %ebx
	jle	.L10
	leal	1(%rdi,%rdi), %edi
	cmpl	%esi, %ecx
	jl	.L3
	cmpl	%edx, %ebx
	jg	.L3
	movslq	%edi, %rdi
	movl	hocchann(,%rdi,4), %r15d
.L2:
	cmpl	%ebp, %ebx
	jge	.L11
.L41:
	cmpl	%r12d, %r14d
	jle	.L11
	cmpl	%r12d, %ebx
	leal	1(%r13), %eax
	setge	%cl
	cmpl	%ebp, %r14d
	leal	(%rax,%rax), %edx
	setle	%r10b
	testb	%cl, %cl
	je	.L5
	testb	%r10b, %r10b
	je	.L5
	movslq	%edx, %rdx
	movl	hocchann(,%rdx,4), %eax
.L4:
	cmpl	%r15d, %eax
	cmovl	%r15d, %eax
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
.L3:
	.cfi_restore_state
	movl	%ebx, %r8d
	movl	%ebp, %edx
	movl	%r12d, %esi
	call	get_i.part.0
	movl	%eax, %r15d
	cmpl	%ebp, %ebx
	jl	.L41
	.p2align 4,,10
	.p2align 3
.L11:
	xorl	%eax, %eax
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L10:
	xorl	%r15d, %r15d
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L5:
	movl	%r14d, %esi
	leal	2(%rdx,%rdx), %r9d
	subl	%ebx, %esi
	movl	%esi, %r13d
	shrl	$31, %r13d
	addl	%esi, %r13d
	sarl	%r13d
	addl	%ebx, %r13d
	cmpl	%r13d, %r12d
	jge	.L12
	leal	1(,%rax,4), %edi
	cmpl	%r13d, %ebp
	jl	.L7
	testb	%cl, %cl
	je	.L7
	movslq	%edi, %rdi
	xorl	%eax, %eax
	movl	hocchann(,%rdi,4), %ebx
	cmpl	%r13d, %ebp
	je	.L8
.L9:
	movl	%r14d, %r8d
	movl	%r13d, %ecx
	movl	%ebp, %edx
	movl	%r12d, %esi
	movl	%r9d, %edi
	call	get_i.part.0
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L12:
	xorl	%ebx, %ebx
.L6:
	cmpl	%r13d, %ebp
	jle	.L14
	cmpl	%r13d, %r12d
	jg	.L9
	testb	%r10b, %r10b
	je	.L9
	movslq	%r9d, %r9
	movl	hocchann(,%r9,4), %eax
.L8:
	cmpl	%ebx, %eax
	cmovl	%ebx, %eax
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L7:
	movl	%ebx, %ecx
	movl	%r13d, %r8d
	movl	%ebp, %edx
	movl	%r12d, %esi
	movb	%r10b, 15(%rsp)
	movl	%r9d, 8(%rsp)
	call	get_i.part.0
	movl	8(%rsp), %r9d
	movzbl	15(%rsp), %r10d
	movl	%eax, %ebx
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L14:
	xorl	%eax, %eax
	jmp	.L8
	.cfi_endproc
.LFE7:
	.size	get_i.part.0, .-get_i.part.0
	.p2align 4
	.globl	init
	.type	init, @function
init:
.LFB3:
	.cfi_startproc
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L46:
	cmpl	%eax, %esi
	jle	.L43
	movl	(%rdi,%rax,4), %edx
	movl	%edx, hocchann+1048572(,%rax,4)
	addq	$1, %rax
	cmpq	$262144, %rax
	jne	.L46
.L45:
	movl	$262142, %eax
	.p2align 4,,10
	.p2align 3
.L47:
	movl	hocchann+4(,%rax,8), %edx
	movl	hocchann+8(,%rax,8), %ecx
	cmpl	%ecx, %edx
	cmovl	%ecx, %edx
	movl	%edx, hocchann(,%rax,4)
	subq	$1, %rax
	jnb	.L47
	ret
	.p2align 4,,10
	.p2align 3
.L43:
	movl	$0, hocchann+1048572(,%rax,4)
	addq	$1, %rax
	cmpq	$262144, %rax
	jne	.L46
	jmp	.L45
	.cfi_endproc
.LFE3:
	.size	init, .-init
	.p2align 4
	.globl	get_i
	.type	get_i, @function
get_i:
.LFB4:
	.cfi_startproc
	cmpl	%ecx, %edx
	jle	.L95
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
	movl	%r8d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpl	%esi, %r8d
	jle	.L63
	cmpl	%esi, %ecx
	movl	%edx, %r11d
	setge	%al
	cmpl	%r8d, %edx
	setge	%r14b
	testb	%al, %al
	je	.L54
	testb	%r14b, %r14b
	je	.L54
	movslq	%edi, %rdi
	movl	hocchann(,%rdi,4), %eax
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
.L54:
	.cfi_restore_state
	movl	%r12d, %edx
	leal	1(%rdi), %ebx
	subl	%ecx, %edx
	leal	(%rbx,%rbx), %r15d
	movl	%edx, %r13d
	shrl	$31, %r13d
	addl	%edx, %r13d
	sarl	%r13d
	addl	%ecx, %r13d
	cmpl	%r13d, %esi
	jge	.L64
	cmpl	%r13d, %r11d
	leal	-1(%r15), %edi
	setge	%dl
	andb	%al, %dl
	je	.L56
	movslq	%edi, %rdi
	xorl	%eax, %eax
	movl	hocchann(,%rdi,4), %r9d
	cmpl	%r13d, %r11d
	je	.L57
.L58:
	movl	%r12d, %eax
	leal	2(%r15,%r15), %r15d
	subl	%r13d, %eax
	movl	%eax, %r10d
	shrl	$31, %r10d
	addl	%eax, %r10d
	sarl	%r10d
	leal	(%r10,%r13), %ebp
	cmpl	%ebp, %esi
	jge	.L67
	leal	1(,%rbx,4), %edi
	cmpl	%ebp, %r11d
	jl	.L60
	testb	%dl, %dl
	je	.L60
	movslq	%edi, %rdi
	xorl	%eax, %eax
	movl	hocchann(,%rdi,4), %ebx
	cmpl	%ebp, %r11d
	je	.L61
.L62:
	movl	%r12d, %r8d
	movl	%ebp, %ecx
	movl	%r11d, %edx
	movl	%r15d, %edi
	movl	%r9d, 8(%rsp)
	call	get_i.part.0
	movl	8(%rsp), %r9d
.L61:
	cmpl	%eax, %ebx
	cmovge	%ebx, %eax
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L63:
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
.L64:
	.cfi_restore_state
	xorl	%r9d, %r9d
.L55:
	cmpl	%r13d, %r11d
	jle	.L66
	cmpl	%r13d, %esi
	setle	%al
	movl	%eax, %edx
	testb	%r14b, %r14b
	je	.L58
	testb	%al, %al
	je	.L58
	movslq	%r15d, %r15
	movl	hocchann(,%r15,4), %eax
.L57:
	cmpl	%r9d, %eax
	cmovl	%r9d, %eax
	addq	$24, %rsp
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
.L95:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L56:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movl	%r13d, %r8d
	movl	%r11d, %edx
	movl	%esi, 8(%rsp)
	call	get_i.part.0
	movl	8(%rsp), %esi
	movl	%eax, %r9d
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L66:
	xorl	%eax, %eax
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L67:
	xorl	%ebx, %ebx
.L59:
	cmpl	%ebp, %r11d
	jle	.L69
	cmpl	%ebp, %esi
	jg	.L62
	testb	%r14b, %r14b
	je	.L62
	movslq	%r15d, %r15
	movl	hocchann(,%r15,4), %eax
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L60:
	movl	%ebp, %r8d
	movl	%r13d, %ecx
	movl	%r11d, %edx
	movl	%r9d, 12(%rsp)
	movl	%esi, 8(%rsp)
	call	get_i.part.0
	movl	8(%rsp), %esi
	movl	12(%rsp), %r9d
	movl	%eax, %ebx
	jmp	.L59
.L69:
	xorl	%eax, %eax
	jmp	.L61
	.cfi_endproc
.LFE4:
	.size	get_i, .-get_i
	.p2align 4
	.globl	get
	.type	get, @function
get:
.LFB5:
	.cfi_startproc
	xorl	%eax, %eax
	cmpl	%esi, %edi
	jl	.L135
	ret
	.p2align 4,,10
	.p2align 3
.L135:
	movl	%esi, %r11d
	testl	%esi, %esi
	jle	.L132
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edi, %ebx
	cmpl	$262143, %edi
	jg	.L107
	testl	%edi, %edi
	setle	%al
	cmpl	$262143, %esi
	setg	%r12b
	testb	%al, %al
	je	.L101
	testb	%r12b, %r12b
	je	.L101
	movl	hocchann(%rip), %eax
.L99:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L101:
	.cfi_restore_state
	cmpl	$131071, %ebx
	jg	.L108
	cmpl	$131071, %r11d
	jle	.L103
	testb	%al, %al
	je	.L103
	movl	hocchann+4(%rip), %ebp
	xorl	%eax, %eax
	cmpl	$131072, %r11d
	je	.L104
.L105:
	movl	$262144, %r8d
	movl	$131072, %ecx
	movl	%r11d, %edx
	movl	%ebx, %esi
	movl	$2, %edi
	call	get_i.part.0
.L104:
	cmpl	%eax, %ebp
	cmovge	%ebp, %eax
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L107:
	xorl	%eax, %eax
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L108:
	xorl	%ebp, %ebp
.L102:
	cmpl	$131072, %r11d
	jle	.L110
	cmpl	$131072, %ebx
	jg	.L105
	testb	%r12b, %r12b
	je	.L105
	movl	hocchann+8(%rip), %eax
	jmp	.L104
	.p2align 4,,10
	.p2align 3
.L132:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L103:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	movl	$131072, %r8d
	xorl	%ecx, %ecx
	movl	%r11d, %edx
	movl	%ebx, %esi
	movl	$1, %edi
	call	get_i.part.0
	movl	%eax, %ebp
	jmp	.L102
.L110:
	xorl	%eax, %eax
	jmp	.L104
	.cfi_endproc
.LFE5:
	.size	get, .-get
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d"
.LC1:
	.string	"%d"
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
	xorl	%eax, %eax
	movl	$K, %edx
	movl	$N, %esi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$.LC0, %edi
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
	call	__isoc99_scanf
	cmpl	$2, %eax
	jne	.L140
	movl	N(%rip), %esi
	testl	%esi, %esi
	jle	.L139
	movl	$a, %ebx
	xorl	%ebp, %ebp
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L266:
	movl	N(%rip), %esi
	addl	$1, %ebp
	addq	$4, %rbx
	cmpl	%ebp, %esi
	jle	.L139
.L141:
	xorl	%eax, %eax
	movq	%rbx, %rsi
	movl	$.LC1, %edi
	call	__isoc99_scanf
	cmpl	$1, %eax
	je	.L266
.L140:
	movl	$1, %eax
.L136:
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
.L139:
	.cfi_restore_state
	movl	$a, %edi
	xorl	%ebp, %ebp
	call	init
	movl	K(%rip), %edx
	cmpl	N(%rip), %edx
	movl	%edx, %r15d
	jge	.L189
	.p2align 4,,10
	.p2align 3
.L142:
	addl	$1, %edx
	movl	hocchann(%rip), %r9d
	xorl	%r13d, %r13d
	cmpl	%ebp, %edx
	jg	.L267
.L143:
	leal	1(%r15), %ebx
	cmpl	$131071, %ebp
	jg	.L268
.L145:
	xorl	%r12d, %r12d
.L183:
	leal	1(%r12), %r14d
	jmp	.L182
	.p2align 4,,10
	.p2align 3
.L163:
	cmpl	%r10d, %r13d
	jne	.L269
.L206:
	movl	%r11d, %ebx
.L182:
	cmpl	%r14d, %ebx
	jle	.L149
	movl	%ebx, %r11d
	xorl	%r10d, %r10d
	subl	%r12d, %r11d
	sarl	%r11d
	addl	%r12d, %r11d
	leal	0(%rbp,%r11), %edx
	cmpl	%edx, %ebp
	jge	.L163
	testl	%edx, %edx
	jle	.L163
	testl	%ebp, %ebp
	setle	%al
	cmpl	$262143, %edx
	jle	.L165
	movl	%r9d, %r10d
	testb	%al, %al
	jne	.L163
.L165:
	cmpl	$131071, %edx
	setg	4(%rsp)
	jle	.L210
	testb	%al, %al
	je	.L210
	movl	hocchann+4(%rip), %r10d
	xorl	%eax, %eax
	cmpl	$131072, %edx
	je	.L168
.L171:
	cmpl	$196607, %edx
	jle	.L270
	movl	hocchann+20(%rip), %eax
	movl	%eax, 4(%rsp)
	xorl	%eax, %eax
	cmpl	$196608, %edx
	jne	.L271
.L169:
	movl	4(%rsp), %ecx
	cmpl	%eax, %ecx
	cmovge	%ecx, %eax
.L168:
	cmpl	%eax, %r10d
	cmovl	%eax, %r10d
	cmpl	%r10d, %r13d
	je	.L206
	.p2align 4,,10
	.p2align 3
.L269:
	movl	%r11d, %r12d
	jmp	.L183
	.p2align 4,,10
	.p2align 3
.L149:
	addl	%ebx, %ebp
	subl	$1, %ebx
	xorl	%eax, %eax
	movl	%r13d, %esi
	subl	%ebx, %r15d
	movl	$.LC1, %edi
	call	printf
	leal	0(%rbp,%r15), %edx
	cmpl	N(%rip), %edx
	jl	.L142
.L189:
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	putc
	xorl	%eax, %eax
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L268:
	xorl	%r12d, %r12d
	cmpl	$196607, %ebp
	jg	.L148
.L162:
	leal	1(%r12), %r14d
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L150:
	cmpl	%eax, %r13d
	jne	.L272
	movl	%r11d, %ebx
.L161:
	cmpl	%ebx, %r14d
	jge	.L149
	movl	%ebx, %r11d
	xorl	%eax, %eax
	subl	%r12d, %r11d
	sarl	%r11d
	addl	%r12d, %r11d
	leal	(%r11,%rbp), %edx
	cmpl	%edx, %ebp
	jge	.L150
	cmpl	$131072, %ebp
	setle	%al
	cmpl	$262143, %edx
	jle	.L153
	testb	%al, %al
	je	.L153
	movl	hocchann+8(%rip), %eax
.L157:
	xorl	%edx, %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	jmp	.L150
.L273:
	movl	%r11d, %r12d
.L148:
	leal	1(%r12), %r14d
	jmp	.L187
	.p2align 4,,10
	.p2align 3
.L184:
	cmpl	%eax, %r13d
	jne	.L273
	movl	%r11d, %ebx
.L187:
	cmpl	%r14d, %ebx
	jle	.L149
	movl	%ebx, %r11d
	xorl	%eax, %eax
	subl	%r12d, %r11d
	sarl	%r11d
	addl	%r12d, %r11d
	leal	(%r11,%rbp), %edx
	cmpl	%ebp, %edx
	jle	.L184
	cmpl	$262143, %ebp
	jg	.L184
	cmpl	$262143, %edx
	jle	.L185
	cmpl	$196608, %ebp
	jg	.L185
	movl	hocchann+24(%rip), %eax
.L186:
	xorl	%edx, %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	jmp	.L184
	.p2align 4,,10
	.p2align 3
.L267:
	testl	%edx, %edx
	jle	.L192
	cmpl	$262143, %ebp
	jg	.L192
	testl	%ebp, %ebp
	setle	%al
	cmpl	$262143, %edx
	jle	.L144
	testb	%al, %al
	je	.L144
	leal	1(%r15), %ebx
	movl	%r9d, %r13d
	jmp	.L145
.L272:
	movl	%r11d, %r12d
	jmp	.L162
.L210:
	cmpl	$65535, %ebp
	jg	.L274
	cmpl	$65535, %edx
	jle	.L211
	testb	%al, %al
	je	.L211
	movl	hocchann+12(%rip), %r10d
	cmpl	$65536, %edx
	je	.L178
.L179:
	movl	$65536, %ecx
	movl	%ebp, %esi
	movl	$4, %edi
	movl	%edx, 4(%rsp)
	movl	$131072, %r8d
	movl	%r10d, 12(%rsp)
	movl	%r9d, 8(%rsp)
	call	get_i.part.0
	movl	4(%rsp), %edx
	movl	8(%rsp), %r9d
	movl	12(%rsp), %r10d
.L177:
	cmpl	%eax, %r10d
	cmovl	%eax, %r10d
	cmpl	$131072, %edx
	jle	.L275
	cmpl	$262143, %edx
	jle	.L171
	movl	hocchann+8(%rip), %eax
	jmp	.L168
.L192:
	xorl	%r13d, %r13d
	jmp	.L143
.L270:
	movl	$196608, %r8d
	movl	$131072, %ecx
	movl	%ebp, %esi
	movl	$5, %edi
	movl	%r9d, 12(%rsp)
	movl	%r10d, 8(%rsp)
	call	get_i.part.0
	movl	8(%rsp), %r10d
	movl	12(%rsp), %r9d
	movl	%eax, 4(%rsp)
	xorl	%eax, %eax
	jmp	.L169
.L271:
	movl	$262144, %r8d
	movl	$196608, %ecx
	movl	%ebp, %esi
	movl	$6, %edi
	movl	%r9d, 12(%rsp)
	movl	%r10d, 8(%rsp)
	call	get_i.part.0
	movl	8(%rsp), %r10d
	movl	12(%rsp), %r9d
	jmp	.L169
.L211:
	movl	$65536, %r8d
	xorl	%ecx, %ecx
	movl	%ebp, %esi
	movl	$3, %edi
	movl	%r9d, 12(%rsp)
	movl	%edx, 8(%rsp)
	call	get_i.part.0
	movl	8(%rsp), %edx
	movl	12(%rsp), %r9d
	movl	%eax, %r10d
.L174:
	cmpl	$65536, %edx
	jle	.L178
	cmpl	$65536, %ebp
	jg	.L179
	cmpb	$0, 4(%rsp)
	je	.L179
	movl	hocchann+16(%rip), %eax
	jmp	.L177
.L144:
	cmpl	$131071, %ebp
	jg	.L193
	cmpl	$131071, %edx
	jle	.L147
	testb	%al, %al
	je	.L147
	movl	hocchann+4(%rip), %r13d
.L146:
	movl	$262144, %r8d
	movl	$131072, %ecx
	movl	%ebp, %esi
	movl	$2, %edi
	movl	%r9d, 4(%rsp)
	call	get_i
	movl	4(%rsp), %r9d
	cmpl	%r13d, %eax
	cmovge	%eax, %r13d
	jmp	.L143
.L153:
	cmpl	$196607, %edx
	jle	.L156
	testb	%al, %al
	je	.L156
	movl	hocchann+20(%rip), %r9d
	xorl	%eax, %eax
	cmpl	$196608, %edx
	jne	.L159
.L158:
	cmpl	%r9d, %eax
	cmovl	%r9d, %eax
	jmp	.L157
.L178:
	xorl	%eax, %eax
	testl	%r10d, %r10d
	cmovs	%eax, %r10d
	jmp	.L168
.L274:
	xorl	%r10d, %r10d
	jmp	.L174
.L156:
	movl	$131072, %ecx
	movl	%ebp, %esi
	movl	$5, %edi
	movl	%edx, 4(%rsp)
	movl	$196608, %r8d
	call	get_i.part.0
	movl	4(%rsp), %edx
	movl	%eax, %r9d
	cmpl	$196608, %edx
	jle	.L276
	cmpl	$262143, %edx
	jle	.L159
	movl	hocchann+24(%rip), %eax
	jmp	.L158
.L275:
	xorl	%eax, %eax
	jmp	.L168
.L193:
	xorl	%r13d, %r13d
	jmp	.L146
.L159:
	movl	$262144, %r8d
	movl	$196608, %ecx
	movl	%ebp, %esi
	movl	$6, %edi
	movl	%r9d, 4(%rsp)
	call	get_i.part.0
	movl	4(%rsp), %r9d
	jmp	.L158
.L147:
	movl	$131072, %r8d
	xorl	%ecx, %ecx
	movl	%ebp, %esi
	movl	$1, %edi
	movl	%r9d, 8(%rsp)
	movl	%edx, 4(%rsp)
	call	get_i.part.0
	movl	4(%rsp), %edx
	movl	8(%rsp), %r9d
	movl	%eax, %r13d
	jmp	.L146
.L185:
	movl	$262144, %r8d
	movl	$196608, %ecx
	movl	%ebp, %esi
	movl	$6, %edi
	call	get_i.part.0
	jmp	.L186
.L276:
	xorl	%eax, %eax
	jmp	.L158
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.globl	nokosu
	.bss
	.align 32
	.type	nokosu, @object
	.size	nokosu, 271828
nokosu:
	.zero	271828
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 1087312
a:
	.zero	1087312
	.globl	K
	.align 4
	.type	K, @object
	.size	K, 4
K:
	.zero	4
	.globl	N
	.align 4
	.type	N, @object
	.size	N, 4
N:
	.zero	4
	.globl	hocchann
	.align 32
	.type	hocchann, @object
	.size	hocchann, 2097148
hocchann:
	.zero	2097148
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
