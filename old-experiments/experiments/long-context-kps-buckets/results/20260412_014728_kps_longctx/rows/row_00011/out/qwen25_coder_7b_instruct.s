.file	"inputC.c"
	.text
	.globl	get_id
	.type	get_id, @function
get_id:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movl	id.0(%rip), %eax
	cmpl	$1, %eax
	jne	.L2
	movl	$0, id.0(%rip)
	movl	$1, 172+id.0(%rip)
	movl	$2, 180+id.0(%rip)
	movl	$3, 168+id.0(%rip)
	movl	$4, 188+id.0(%rip)
	movl	$5, 240+id.0(%rip)
	movl	$6, 248+id.0(%rip)
	movl	$7, 244+id.0(%rip)
	movl	$8, 152+id.0(%rip)
	movl	$9, 496+id.0(%rip)
	movl	$10, 376+id.0(%rip)
	movl	$11, 160+id.0(%rip)
	movl	$12, 164+id.0(%rip)
.L2:
	movsbl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	id.0(%rip), %rax
	movl	(%rdx,%rax), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	get_id, .-get_id
	.globl	enzansi_yuusen
	.bss
	.align 32
	.type	enzansi_yuusen, @object
	.size	enzansi_yuusen, 80
enzansi_yuusen:
	.zero	80
	.globl	enzansi_right_ketugo
	.align 32
	.type	enzansi_right_ketugo, @object
	.size	enzansi_right_ketugo, 80
enzansi_right_ketugo:
	.zero	80
	.text
	.globl	enzansi_isdopop
	.type	enzansi_isdopop, @function
enzansi_isdopop:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movl	%edi, %edx
	movl	%esi, %eax
	movb	%dl, -20(%rbp)
	movb	%al, -24(%rbp)
	movsbl	-20(%rbp), %eax
	movl	%eax, %edi
	call	get_id
	movl	%eax, -8(%rbp)
	movsbl	-24(%rbp), %eax
	movl	%eax, %edi
	call	get_id
	movl	%eax, -4(%rbp)
	cmpb	$40, -20(%rbp)
	jne	.L5
	movl	$0, %eax
	jmp	.L6
.L5:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	enzansi_yuusen(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	enzansi_yuusen(%rip), %rax
	movl	(%rcx,%rax), %eax
	cmpl	%eax, %edx
	jg	.L7
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	enzansi_yuusen(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	enzansi_yuusen(%rip), %rax
	movl	(%rcx,%rax), %eax
	cmpl	%eax, %edx
	jne	.L8
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	enzansi_right_ketugo(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	jne	.L8
.L7:
	movl	$1, %eax
	jmp	.L6
.L8:
	movl	$0, %eax
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	enzansi_isdopop, .-enzansi_isdopop
	.globl	main_stack_num
	.bss
	.align 4
	.type	main_stack_num, @object
	.size	main_stack_num, 4
main_stack_num:
	.zero	4
	.globl	main_stack
	.align 32
	.type	main_stack, @object
	.size	main_stack, 50000
main_stack:
	.zero	50000
	.globl	enzansi_stack_num
	.align 4
	.type	enzansi_stack_num, @object
	.size	enzansi_stack_num, 4
enzansi_stack_num:
	.zero	4
	.globl	enzansi_stack
	.align 32
	.type	enzansi_stack, @object
	.size	enzansi_stack, 100
enzansi_stack:
	.zero	100
	.globl	calc_stack_num
	.align 4
	.type	calc_stack_num, @object
	.size	calc_stack_num, 4
calc_stack_num:
	.zero	4
	.globl	calc_stack
	.align 32
	.type	calc_stack, @object
	.size	calc_stack, 100
calc_stack:
	.zero	100
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%s%d"
.LC2:
	.string	"%s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$264, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$0, -228(%rbp)
	leaq	-264(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -248(%rbp)
	jmp	.L11
.L40:
	cmpl	$0, -248(%rbp)
	jle	.L12
	movl	$10, %edi
	call	putchar@PLT
.L12:
	leaq	-260(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -244(%rbp)
	jmp	.L13
.L16:
	leaq	-256(%rbp), %rdx
	leaq	-236(%rbp), %rax
	movq	%rax, %rsi
