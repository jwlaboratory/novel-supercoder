	.file	"inputC.c"
	.text
	.p2align 4
	.globl	pilehigh
	.type	pilehigh, @function
pilehigh:
.LFB8:
	.cfi_startproc
	movl	n(%rip), %ecx
	testl	%ecx, %ecx
	jle	.L4
	movslq	%edi, %rdi
	xorl	%edx, %edx
	leaq	(%rdi,%rdi,4), %rax
	leaq	(%rax,%rax,4), %rax
	salq	$4, %rax
	addq	$map, %rax
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L7:
	addl	$1, %edx
	addq	$4, %rax
	cmpl	%ecx, %edx
	je	.L1
.L3:
	movl	(%rax), %esi
	testl	%esi, %esi
	jne	.L7
.L1:
	movl	%edx, %eax
	ret
.L4:
	xorl	%edx, %edx
	jmp	.L1
	.cfi_endproc
.LFE8:
	.size	pilehigh, .-pilehigh
	.p2align 4
	.globl	takeoff
	.type	takeoff, @function
takeoff:
.LFB9:
	.cfi_startproc
	movl	n(%rip), %r8d
	leal	-1(%r8), %eax
	cmpl	%esi, %eax
	jle	.L8
	movslq	%edi, %rax
	leaq	(%rax,%rax,4), %rax
	leaq	(%rax,%rax,4), %rdx
	movslq	%r8d, %rax
	leaq	(%rax,%rdx,4), %rax
	leal	-2(%r8), %edx
	subl	%esi, %edx
	leaq	map(,%rax,4), %rcx
	subq	%rdx, %rax
	leaq	map-4(,%rax,4), %rdi
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L10:
	subq	$4, %rcx
	cmpq	%rdi, %rcx
	je	.L8
.L14:
	movl	-4(%rcx), %esi
	testl	%esi, %esi
	je	.L10
	testl	%r8d, %r8d
	jle	.L10
.L13:
	movl	$map, %edx
	xorl	%eax, %eax
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L11:
	addl	$1, %eax
	addq	$400, %rdx
	cmpl	%eax, %r8d
	je	.L21
.L12:
	movl	(%rdx), %r9d
	testl	%r9d, %r9d
	jne	.L11
	cltq
	subq	$4, %rcx
	leaq	(%rax,%rax,4), %rax
	leaq	(%rax,%rax,4), %rax
	salq	$4, %rax
	movl	%esi, map(%rax)
	movl	$0, (%rcx)
	cmpq	%rdi, %rcx
	jne	.L14
.L8:
	ret
	.p2align 4,,10
	.p2align 3
.L21:
	subq	$4, %rcx
	cmpq	%rdi, %rcx
	je	.L8
	movl	-4(%rcx), %esi
	testl	%esi, %esi
	je	.L10
	jmp	.L13
	.cfi_endproc
.LFE9:
	.size	takeoff, .-takeoff
	.p2align 4
	.globl	puton
	.type	puton, @function
puton:
.LFB10:
	.cfi_startproc
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	movslq	%edx, %rdx
	addl	$1, %ecx
	leaq	(%rdi,%rdi,4), %rax
	leaq	(%rdx,%rdx,4), %rdx
	movslq	%ecx, %rcx
	leaq	(%rax,%rax,4), %rax
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rsi,%rax,4), %rax
	leaq	(%rcx,%rdx,4), %rdx
	movl	map(,%rax,4), %esi
	movl	%esi, map(,%rdx,4)
	movl	$0, map(,%rax,4)
	ret
	.cfi_endproc
.LFE10:
	.size	puton, .-puton
	.p2align 4
	.globl	pileup
	.type	pileup, @function
pileup:
.LFB11:
	.cfi_startproc
	movl	%esi, %r8d
	cmpl	%esi, %edi
	je	.L23
	movl	n(%rip), %esi
	testl	%esi, %esi
	jle	.L26
	movl	$map, %ecx
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L27:
	movq	%rcx, %rax
	xorl	%edx, %edx
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L87:
	addl	$1, %edx
	addq	$4, %rax
	cmpl	%esi, %edx
	je	.L86
.L29:
	cmpl	%edi, (%rax)
	jne	.L87
.L28:
	movl	$map, %edi
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L32:
	movq	%rdi, %rcx
	xorl	%eax, %eax
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L89:
	addl	$1, %eax
	addq	$4, %rcx
	cmpl	%esi, %eax
	je	.L88
.L34:
	cmpl	%r8d, (%rcx)
	jne	.L89
.L33:
	testl	%r8d, %r8d
	je	.L30
	cmpl	%r10d, %r9d
	jne	.L41
.L31:
	cmpl	%edx, %eax
	jge	.L90
.L23:
	ret
	.p2align 4,,10
	.p2align 3
.L86:
	addl	$1, %r9d
	addq	$400, %rcx
	cmpl	%edx, %r9d
	jne	.L27
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L88:
	addl	$1, %r10d
	addq	$400, %rdi
	cmpl	%eax, %r10d
	jne	.L32
	jmp	.L33
.L26:
	xorl	%r10d, %r10d
	testl	%r8d, %r8d
	jne	.L31
	xorl	%r9d, %r9d
.L30:
	testl	%edx, %edx
	je	.L23
	cmpl	%esi, %edx
	jge	.L23
	movslq	%r9d, %r9
	leal	-1(%rsi), %edi
	leaq	(%r9,%r9,4), %rax
	subl	%edx, %edi
	leaq	(%rax,%rax,4), %rcx
	movslq	%esi, %rax
	leaq	(%rax,%rcx,4), %rax
	leaq	map(,%rax,4), %rcx
	subq	%rdi, %rax
	leaq	map-4(,%rax,4), %r8
	jmp	.L40
	.p2align 4,,10
	.p2align 3
.L37:
	subq	$4, %rcx
	cmpq	%r8, %rcx
	je	.L91
.L40:
	movl	-4(%rcx), %edi
	testl	%edi, %edi
	je	.L37
	movl	$map, %edx
	xorl	%eax, %eax
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L38:
	addl	$1, %eax
	addq	$400, %rdx
	cmpl	%eax, %esi
	je	.L37
.L39:
	movl	(%rdx), %r9d
	testl	%r9d, %r9d
	jne	.L38
	cltq
	subq	$4, %rcx
	leaq	(%rax,%rax,4), %rax
	leaq	(%rax,%rax,4), %rax
	salq	$4, %rax
	movl	%edi, map(%rax)
	movl	$0, (%rcx)
	cmpq	%r8, %rcx
	jne	.L40
.L91:
	ret
.L90:
	leal	-1(%rsi), %ecx
	cmpl	%edx, %ecx
	jle	.L92
	movslq	%r10d, %r10
	leaq	(%r10,%r10,4), %rax
	leaq	(%rax,%rax,4), %rcx
	movslq	%esi, %rax
	leaq	(%rax,%rcx,4), %rax
	leal	-2(%rsi), %ecx
	subl	%edx, %ecx
	leaq	map(,%rax,4), %rdi
	subq	%rcx, %rax
	leaq	map-4(,%rax,4), %r11
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L45:
	subq	$4, %rdi
	cmpq	%r11, %rdi
	je	.L49
.L48:
	movl	-4(%rdi), %r9d
	testl	%r9d, %r9d
	je	.L45
	movl	$map, %ecx
	xorl	%eax, %eax
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L46:
	addl	$1, %eax
	addq	$400, %rcx
	cmpl	%eax, %esi
	je	.L45
.L47:
	cmpl	$0, (%rcx)
	jne	.L46
	cltq
	leaq	(%rax,%rax,4), %rax
	leaq	(%rax,%rax,4), %rax
	salq	$4, %rax
	movl	%r9d, map(%rax)
	movl	$0, -4(%rdi)
	jmp	.L45
.L41:
	leal	-1(%rsi), %eax
	movslq	%r9d, %r9
	cmpl	%edx, %eax
	jle	.L57
	leaq	(%r9,%r9,4), %rax
	leaq	(%rax,%rax,4), %rcx
	movslq	%esi, %rax
	leaq	(%rax,%rcx,4), %rax
	leal	-2(%rsi), %ecx
	subl	%edx, %ecx
	leaq	map(,%rax,4), %rdi
	subq	%rcx, %rax
	leaq	map-4(,%rax,4), %r11
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L53:
	subq	$4, %rdi
	cmpq	%r11, %rdi
	je	.L57
.L56:
	movl	-4(%rdi), %r8d
	testl	%r8d, %r8d
	je	.L53
	movl	$map, %ecx
	xorl	%eax, %eax
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L54:
	addl	$1, %eax
	addq	$400, %rcx
	cmpl	%eax, %esi
	je	.L53
.L55:
	cmpl	$0, (%rcx)
	jne	.L54
	cltq
	subq	$4, %rdi
	leaq	(%rax,%rax,4), %rax
	leaq	(%rax,%rax,4), %rax
	salq	$4, %rax
	movl	%r8d, map(%rax)
	movl	$0, (%rdi)
	cmpq	%r11, %rdi
	jne	.L56
.L57:
	movslq	%r10d, %r10
	xorl	%ecx, %ecx
	leaq	(%r10,%r10,4), %rax
	leaq	(%rax,%rax,4), %rax
	salq	$4, %rax
	addq	$map, %rax
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L93:
	addl	$1, %ecx
	addq	$4, %rax
	cmpl	%ecx, %esi
	je	.L58
.L52:
	movl	(%rax), %edi
	testl	%edi, %edi
	jne	.L93
.L58:
	leaq	(%r9,%r9,4), %rax
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	leaq	(%rax,%rax,4), %rax
	leaq	(%rdx,%rax,4), %rax
	leaq	(%r10,%r10,4), %rdx
	movl	map(,%rax,4), %esi
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rcx,%rdx,4), %rdx
	movl	%esi, map(,%rdx,4)
	movl	$0, map(,%rax,4)
	ret
.L92:
	testl	%esi, %esi
	jle	.L62
	movslq	%r10d, %r10
.L49:
	movl	$map, %r11d
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L44:
	movq	%r11, %rdi
	xorl	%ecx, %ecx
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L95:
	addq	$4, %rdi
	cmpl	%esi, %ecx
	je	.L94
.L50:
	movl	%ecx, %eax
	leal	1(%rcx), %ecx
	cmpl	%r8d, (%rdi)
	jne	.L95
.L43:
	leaq	(%r10,%r10,4), %rcx
	movslq	%edx, %rdx
	movslq	%r9d, %r9
	addl	$1, %eax
	leaq	(%rcx,%rcx,4), %rcx
	cltq
	leaq	(%rdx,%rcx,4), %rdx
	leaq	(%r9,%r9,4), %rcx
	movl	map(,%rdx,4), %esi
	leaq	(%rcx,%rcx,4), %rcx
	leaq	(%rax,%rcx,4), %rax
	movl	%esi, map(,%rax,4)
	movl	$0, map(,%rdx,4)
	ret
.L94:
	addl	$1, %r9d
	addq	$400, %r11
	cmpl	%r9d, %ecx
	jne	.L44
	movl	%r9d, %eax
	jmp	.L43
.L62:
	xorl	%r9d, %r9d
	movslq	%r10d, %r10
	jmp	.L43
	.cfi_endproc
.LFE11:
	.size	pileup, .-pileup
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	" %d "
.LC1:
	.string	" %d %d "
.LC2:
	.string	"end"
.LC3:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$424, %rsp
	.cfi_def_cfa_offset 448
	.p2align 4,,10
	.p2align 3
.L117:
	movl	$n, %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	__isoc99_scanf
	movl	n(%rip), %esi
	testl	%esi, %esi
	je	.L97
	movl	$map, %edx
	movl	$0, %eax
	jle	.L99
	.p2align 4,,10
	.p2align 3
.L100:
	addl	$1, %eax
	addq	$400, %rdx
	movl	%eax, -400(%rdx)
	cmpl	%eax, %esi
	jne	.L100
	cmpl	$1, %esi
	je	.L99
	movslq	%esi, %rax
	movl	$map+4, %ecx
	leaq	(%rax,%rax,4), %rax
	leaq	(%rax,%rax,4), %rbx
	leal	-2(%rsi), %eax
	salq	$4, %rbx
	leaq	4(,%rax,4), %rbp
	addq	%rcx, %rbx
	.p2align 4,,10
	.p2align 3
.L102:
	movq	%rcx, %rdi
	movq	%rbp, %rdx
	xorl	%esi, %esi
	call	memset
	movq	%rax, %rcx
	addq	$400, %rcx
	cmpq	%rbx, %rcx
	jne	.L102
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L103:
	call	pileup
.L99:
	leaq	8(%rsp), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	leaq	12(%rsp), %rdx
	call	__isoc99_scanf
	movl	8(%rsp), %edi
	movl	12(%rsp), %esi
	movl	%edi, %eax
	orl	%esi, %eax
	jne	.L103
	movl	n(%rip), %ecx
	testl	%ecx, %ecx
	jle	.L119
	movslq	%ecx, %rax
	movl	$map, %esi
	xorl	%r9d, %r9d
	leaq	(%rax,%rax,4), %rax
	leaq	(%rax,%rax,4), %rdi
	salq	$4, %rdi
	addq	%rsi, %rdi
	.p2align 4,,10
	.p2align 3
.L105:
	movq	%rsi, %rdx
	xorl	%eax, %eax
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L135:
	addl	$1, %eax
	addq	$4, %rdx
	cmpl	%ecx, %eax
	je	.L108
.L107:
	movl	(%rdx), %r8d
	testl	%r8d, %r8d
	jne	.L135
	testl	%eax, %eax
	jne	.L108
.L109:
	addq	$400, %rsi
	cmpq	%rdi, %rsi
	jne	.L105
	testl	%r9d, %r9d
	jle	.L119
	leaq	16(%rsp), %r10
	movslq	%r9d, %r11
	movl	$1, %r8d
	movq	%r10, %rsi
	leaq	20(%rsp), %rbx
	leal	-1(%r9), %ebp
	.p2align 4,,10
	.p2align 3
.L112:
	cmpl	%r8d, %r9d
	jle	.L116
	movl	%ebp, %eax
	subl	%r8d, %eax
	leaq	-1(%r8,%rax), %rax
	leaq	(%rbx,%rax,4), %rdi
	movq	%rsi, %rax
	.p2align 4,,10
	.p2align 3
.L115:
	movl	(%rsi), %edx
	movl	4(%rax), %ecx
	cmpl	%ecx, %edx
	jle	.L114
	movl	%ecx, (%rsi)
	movl	%edx, 4(%rax)
.L114:
	addq	$4, %rax
	cmpq	%rdi, %rax
	jne	.L115
.L116:
	leaq	1(%r8), %rax
	addq	$4, %rsi
	cmpq	%r11, %r8
	je	.L136
	movq	%rax, %r8
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L108:
	movslq	%r9d, %rdx
	addl	$1, %r9d
	movl	%eax, 16(%rsp,%rdx,4)
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L136:
	leaq	(%r10,%r8,4), %rbp
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L137:
	addq	$4, %rbx
.L118:
	movl	(%r10), %esi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	call	printf
	movq	%rbx, %r10
	cmpq	%rbx, %rbp
	jne	.L137
.L119:
	movl	$.LC2, %edi
	call	puts
	jmp	.L117
.L97:
	addq	$424, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.globl	map
	.bss
	.align 32
	.type	map, @object
	.size	map, 40000
map:
	.zero	40000
	.globl	n
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
