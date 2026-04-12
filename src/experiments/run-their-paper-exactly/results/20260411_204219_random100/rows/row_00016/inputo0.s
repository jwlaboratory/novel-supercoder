```assembly
	.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
.LC2:
	.string	"%d\n"
	.text
	.p2align 4
	.globl	run
	.type	run, @function
run:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	-798720(%rsp), %r11
	.cfi_def_cfa 11, 798760
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$1320, %rsp
	.cfi_def_cfa_offset 800080
	leaq	.LC0(%rip), %r13
	movq	%r13, %rdi
	movq	%fs:40, %rax
	movq	%rax, 800024(%rsp)
	xorl	%eax, %eax
	leaq	12(%rsp), %rsi
	call	__isoc99_scanf@PLT
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L2
	leaq	16(%rsp), %r12
	xorl	%ebx, %ebx
	movq	%r12, %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbp, %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	addl	$1, %ebx
	call	__isoc99_scanf@PLT
	movl	12(%rsp), %eax
	addq	$4, %rbp
	cmpl	%ebx, %eax
	jg	.L3
	testl	%eax, %eax
	jle	.L2
	leal	-1(%rax), %esi
	cmpl	$2, %esi
	jbe	.L13
	movl	%eax, %ecx
	movdqa	.LC1(%rip), %xmm0
	leaq	400020(%rsp), %rdx
	shrl	$2, %ecx
	subl	$1, %ecx
	salq	$4, %rcx
	leaq	400036(%rsp,%rcx), %rcx
	.p2align 4,,10
	.p2align 3
.L5:
	movups	%xmm0, (%rdx)
	addq	$16, %rdx
	cmpq	%rcx, %rdx
	jne	.L5
	movl	%eax, %ecx
	andl	$-4, %ecx
	leal	1(%rcx), %edx
	cmpl	%ecx, %eax
	je	.L6
.L4:
	movslq	%edx, %rcx
	movl	$1073741824, 400016(%rsp,%rcx,4)
	leal	1(%rdx), %ecx
	cmpl	%ecx, %eax
	jl	.L6
	movslq	%ecx, %rcx
	addl	$2, %edx
	movl	$1073741824, 400016(%rsp,%rcx,4)
	cmpl	%edx, %eax
	jl	.L6
	movslq	%edx, %rdx
	movl	$1073741824, 400016(%rsp,%rdx,4)
.L6:
	leaq	4(%r12), %r10
	xorl	%r9d, %r9d
	leaq	(%r10,%rsi,4), %r11
	.p2align 4,,10
	.p2align 3
.L10:
	movl	(%r12), %r8d
	leal	1(%r9), %ecx
	xorl	%edx, %edx
	movl	$1, %esi
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L9:
	leal	(%rcx,%rdx), %eax
	sarl	%eax
	movslq	%eax, %rdi
	cmpl	%r8d, 400016(%rsp,%rdi,4)
	jge	.L21
	movl	%eax, %edx
	leal	1(%rax), %esi
.L8:
	cmpl	%ecx, %esi
	jl	.L9
	movslq	%ecx, %rax
	cmpl	%ecx, %r9d
	movq	%r10, %r12
	movl	%r8d, 400016(%rsp,%rax,4)
	cmovl	%ecx, %r9d
	cmpq	%r11, %r10
	je	.L11
	addq	$4, %r10
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L21:
	movl	%eax, %ecx
	jmp	.L8
.L2:
	xorl	%r9d, %r9d
.L11:
	xorl	%eax, %eax
	movl	%r9d, %edx
	movl	$1, %edi
	leaq	.LC2(%rip), %rsi
	call	__printf_chk@PLT
	movq	800024(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L22
	addq	$800040, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L13:
	.cfi_restore_state
	movl	$1, %edx
	jmp	.L4
.L22:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	run, .-run
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	run
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	1073741824
	.long	1073741824
	.long	1073741824
	.long	1073741824
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
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
```