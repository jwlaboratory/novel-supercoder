```assembly
	.file	"temp.c"
	.text
	.p2align 4
	.globl	push
	.type	push, @function
push:
.LFB39:
	.cfi_startproc
	endbr64
	movl	top(%rip), %eax
	leaq	S(%rip), %rdx
	addl	$1, %eax
	movl	%eax, top(%rip)
	cltq
	movl	%edi, (%rdx,%rax,4)
	ret
	.cfi_endproc
.LFE39:
	.size	push, .-push
	.p2align 4
	.globl	pop
	.type	pop, @function
pop:
.LFB40:
	.cfi_startproc
	endbr64
	movslq	top(%rip), %rax
	leal	-1(%rax), %edx
	movl	%edx, top(%rip)
	leaq	S(%rip), %rdx
	movl	(%rdx,%rax,4), %eax
	ret
	.cfi_endproc
.LFE40:
	.size	pop, .-pop
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s"
.LC1:
	.string	"%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	.LC0(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	S(%rip), %rbx
	subq	$112, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbp
	movl	$0, top(%rip)
	.p2align 4,,10
	.p2align 3
.L5:
	xorl	%eax, %eax
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	__isoc99_scanf@PLT
	cmpl	$-1, %eax
	je	.L13
	movzbl	(%rsp), %eax
	cmpb	$43, %al
	je	.L14
	cmpb	$45, %al
	je	.L15
	cmpb	$42, %al
	jne	.L9
	movslq	top(%rip), %rax
	leal	-1(%rax), %esi
	movslq	%esi, %rcx
	movl	%esi, top(%rip)
	movl	(%rbx,%rcx,4), %edx
	imull	(%rbx,%rax,4), %edx
	movl	%edx, (%rbx,%rcx,4)
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L14:
	movslq	top(%rip), %rax
	leal	-1(%rax), %ecx
	movl	(%rbx,%rax,4), %eax
	movslq	%ecx, %rdx
	movl	%ecx, top(%rip)
	addl	%eax, (%rbx,%rdx,4)
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L15:
	movslq	top(%rip), %rax
	leal	-1(%rax), %esi
	movslq	%esi, %rcx
	movl	%esi, top(%rip)
	movl	(%rbx,%rcx,4), %edx
	subl	(%rbx,%rax,4), %edx
	movl	%edx, (%rbx,%rcx,4)
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L9:
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	strtol@PLT
	movq	%rax, %r8
	movl	top(%rip), %eax
	addl	$1, %eax
	movl	%eax, top(%rip)
	cltq
	movl	%r8d, (%rbx,%rax,4)
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L13:
	movslq	top(%rip), %rax
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	leal	-1(%rax), %edx
	movl	%edx, top(%rip)
	movl	(%rbx,%rax,4), %edx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	104(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L16
	addq	$112, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L16:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.globl	S
	.bss
	.align 32
	.type	S, @object
	.size	S, 40000
S:
	.zero	40000
	.globl	top
	.align 4
	.type	top, @object
	.size	top, 4
top:
	.zero	4
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