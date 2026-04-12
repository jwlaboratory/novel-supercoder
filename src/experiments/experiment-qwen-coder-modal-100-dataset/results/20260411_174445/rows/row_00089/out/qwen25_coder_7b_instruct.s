.file	"inputC.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d%d\n"
.LC1:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	movl	$k, %edx
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$n, %esi
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	__isoc99_scanf
	movl	k(%rip), %eax
	movl	n(%rip), %edx
	leal	(%rdx,%rax,2), %eax
	movl	%eax, k(%rip)
.L5:
	xorl	%eax, %eax
	call	getchar_unlocked
	cmpl	p(%rip), %eax
	movl	%eax, c(%rip)
	jne	.L3
.L8:
	movl	n(%rip), %edx
.L4:
	movl	i(%rip), %eax
	leal	1(%rax), %ecx
	movl	%ecx, i(%rip)
	cmpl	%edx, %eax
	jl	.L5
	movl	k(%rip), %esi
	leal	-1(%rdx), %eax
	movl	$.LC1, %edi
	cmpl	%edx, %esi
	cmovge	%eax, %esi
	xorl	%eax, %eax
	call	printf
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	.cfi_restore_state
	subl	$1, k(%rip)
	movl	%eax, p(%rip)
	jmp	.L8
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.globl	p
	.bss
	.align 4
	.type	p, @object
	.size	p, 4
p:
	.zero	4
	.globl	c
	.align 4
	.type	c, @object
	.size	c, 4
c:
	.zero	4
	.globl	i
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.globl	k
	.align 4
	.type	k, @object
	.size	k, 4
k:
	.zero	4
	.globl	n
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.ident	"GCC: (GNU) 13.4.0"
	.section	.note.GNU-stack,"",@progbits
