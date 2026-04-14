.file	"inputC.c"
	.text
	.globl	compare_long
	.type	compare_long, @function
compare_long:
.LFB6:
	.cfi_startproc
	endbr64
	movq	%rdi, %rax
	movq	%rsi, %rdx
	movq	(%rax), %rcx
	movq	(%rdx), %rsi
	subq	%rsi, %rcx
	testq	%rcx, %rcx
	jle	.L2
	movl	$-1, %eax
	jmp	.L3
.L2:
	movl	$1, %eax
.L3:
	ret
	.cfi_endproc
.LFE6:
	.size	compare_long, .-compare_long
	.globl	min
	.type	min, @function
min:
.LFB7:
	.cfi_startproc
	endbr64
	movl	%edi, %eax
	cmpl	%esi, %eax
	cmovle	%esi, %eax
	ret
	.cfi_endproc
.LFE7:
	.size	min, .-min
	.globl	x
	.bss
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.zero	4
	.globl	y
	.align 4
	.type	y, @object
	.size	y, 4
y:
	.zero	4
	.globl	z
	.align 4
	.type	z, @object
	.size	z, 4
z:
	.zero	4
	.globl	w
	.align 4
	.type	w, @object
	.size	w, 4
w:
	.zero	4
	.globl	k
	.align 4
	.type	k, @object
	.size	k, 4
k:
	.zero	4
	.globl	i
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	j
	.align 4
	.type	j, @object
	.size	j, 4
j:
	.zero	4
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 8000
a:
	.zero	8000
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 8000
b:
	.zero	8000
	.globl	c
	.align 32
	.type	c, @object
	.size	c, 8000
c:
	.zero	8000
	.globl	d
	.align 32
	.type	d, @object
	.size	d, 8000000
d:
	.zero	8000000
	.globl	e
	.align 32
	.type	e, @object
	.size	e, 24000000
e:
	.zero	24000000
	.section	.rodata
.LC0:
	.string	"%d%d%d%d"
.LC1:
	.string	"%ld"
.LC2:
	.string	"%ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	k(%rip), %r8
	leaq	z(%rip), %rax
	movq	%rax, %rcx
	leaq	y(%rip), %rax
	movq	%rax, %rdx
	leaq	x(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, i(%rip)
.L8:
	movl	i(%rip), %eax
	cmpq	%rax, x(%rip)
	jge	.L9
	leaq	a(%rip), %rdx
	movq	%rax, %rcx
	movq	(%rdx,%rcx,8), %rsi
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rcx
	movq	%rsi, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, i(%rip)
	jmp	.L8
.L9:
	movl	$0, i(%rip)
.L10:
	movl	i(%rip), %eax
	cmpq	%rax, y(%rip)
	jge	.L11
	leaq	b(%rip), %rdx
	movq	%rax, %rcx
	movq	(%rdx,%rcx,8), %rsi
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rcx
	movq	%rsi, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, i(%rip)
	jmp	.L10
.L11:
	movl	$0, i(%rip)
.L12:
	movl	i(%rip), %eax
	cmpq	%rax, z(%rip)
	jge	.L13
	leaq	c(%rip), %rdx
	movq	%rax, %rcx
	movq	(%rdx,%rcx,8), %rsi
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rcx
	movq	%rsi, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, i(%rip)
	jmp	.L12
.L13:
	movl	$0, i(%rip)
.L14:
	movl	i(%rip), %eax
	cmpq	%rax, x(%rip)
	jge	.L15
	movl	i(%rip), %edx
	movl	y(%rip), %ecx
	imull	%ecx, %edx
	movl	j(%rip), %ecx
	addl	%edx, %ecx
	leaq	d(%rip), %rdx
	movq	%rax, %rsi
	movq	(%rdx,%rsi,8), %rdi
	movq	%rcx, %rsi
	movq	%rdi, (%rdx,%rsi,8)
	addl	$1, i(%rip)
	jmp	.L14
.L15:
	movl	i(%rip), %eax
	cmpq	%rax, x(%rip)
	jge	.L16
	movl	i(%rip), %edx
	movl	y(%rip), %ecx
	imull	%ecx, %edx
	movl	j(%rip), %ecx
	addl	%edx, %ecx
	leaq	d(%rip), %rdx
	movq	%rax, %rsi
	movq	(%rdx,%rsi,8), %rdi
	movq	%rcx, %rsi
	movq	%rdi, (%rdx,%rsi,8)
	addl	$1, i(%rip)
	jmp	.L15
.L16:
	movl	i(%rip), %eax
	cmpq	%rax, x(%rip)
	jge	.L17
	movl	i(%rip), %edx
	movl	y(%rip), %ecx
	imull	%ecx, %edx
	movl	j(%rip), %ecx
	addl	%edx, %ecx
	leaq	d(%rip), %rdx
	movq	%rax, %rsi
	movq	(%rdx,%rsi,8), %rdi
	movq	%rcx, %rsi
	movq	%rdi, (%rdx,%rsi,8)
	addl	$1, i(%rip)
	jmp	.L16
.L17:
	movl	x(%rip), %eax
	movl	y(%rip), %ecx
	imull	%ecx, %eax
	movq	%rax, %rdx
	movq	%rdx, %rsi
	movq	compare_long(%rip), %rdi
	movl	$8, %eax
	call	qsort@PLT
	movl	k(%rip), %eax
	movl	x(%rip), %ecx
	movl	y(%rip), %edx
	imull	%ecx, %edx
	movl	%eax, %esi
	movl	%edx, %edi
	call	min
	movl	%eax, w(%rip)
	movl	$0, i(%rip)
.L18:
	movl	i(%rip), %eax
