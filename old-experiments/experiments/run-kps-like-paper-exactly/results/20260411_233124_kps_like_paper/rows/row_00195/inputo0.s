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
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -240(%rbp)
	jmp	.L14
.L15:
	leaq	-232(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movzbl	-232(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	get_id
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	enzansi_yuusen(%rip), %rdx
	movl	-244(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
	movzbl	-236(%rbp), %eax
	cmpb	$82, %al
	sete	%bl
	movzbl	-232(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	get_id
	movl	%eax, %edx
	movzbl	%bl, %eax
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	enzansi_right_ketugo(%rip), %rdx
	movl	%eax, (%rcx,%rdx)
	addl	$1, -240(%rbp)
.L14:
	movl	-256(%rbp), %eax
	cmpl	%eax, -240(%rbp)
	jl	.L15
	addl	$1, -244(%rbp)
.L13:
	movl	-260(%rbp), %eax
	cmpl	%eax, -244(%rbp)
	jl	.L16
	leaq	-252(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -244(%rbp)
	jmp	.L17
.L39:
	leaq	-224(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, calc_stack_num(%rip)
	movl	calc_stack_num(%rip), %eax
	movl	%eax, enzansi_stack_num(%rip)
	movl	enzansi_stack_num(%rip), %eax
	movl	%eax, main_stack_num(%rip)
	movl	$0, -240(%rbp)
	jmp	.L18
.L30:
	movl	-240(%rbp), %eax
	cltq
	movzbl	-224(%rbp,%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	get_id
	testl	%eax, %eax
	je	.L19
	movl	enzansi_stack_num(%rip), %eax
	testl	%eax, %eax
	jle	.L20
	movl	-240(%rbp), %eax
	cltq
	movzbl	-224(%rbp,%rax), %eax
	cmpb	$40, %al
	jne	.L21
	movl	enzansi_stack_num(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, enzansi_stack_num(%rip)
	movl	-240(%rbp), %edx
	movslq	%edx, %rdx
	movzbl	-224(%rbp,%rdx), %edx
	cltq
	leaq	enzansi_stack(%rip), %rcx
	movb	%dl, (%rax,%rcx)
	jmp	.L22
.L21:
	movl	-240(%rbp), %eax
	cltq
	movzbl	-224(%rbp,%rax), %eax
	cmpb	$41, %al
	jne	.L27
	jmp	.L24
.L26:
	movl	enzansi_stack_num(%rip), %eax
	subl	$1, %eax
	movl	%eax, enzansi_stack_num(%rip)
	movl	enzansi_stack_num(%rip), %ecx
	movl	calc_stack_num(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, calc_stack_num(%rip)
	movslq	%ecx, %rdx
	leaq	enzansi_stack(%rip), %rcx
	movzbl	(%rdx,%rcx), %edx
	cltq
	leaq	calc_stack(%rip), %rcx
	movb	%dl, (%rax,%rcx)
.L24:
	movl	enzansi_stack_num(%rip), %eax
	testl	%eax, %eax
	jle	.L25
	movl	enzansi_stack_num(%rip), %eax
	subl	$1, %eax
	cltq
	leaq	enzansi_stack(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	cmpb	$40, %al
	jne	.L26
.L25:
	movl	enzansi_stack_num(%rip), %eax
	testl	%eax, %eax
	jle	.L22
	movl	enzansi_stack_num(%rip), %eax
	subl	$1, %eax
	movl	%eax, enzansi_stack_num(%rip)
	jmp	.L22
.L29:
	movl	enzansi_stack_num(%rip), %eax
	subl	$1, %eax
	movl	%eax, enzansi_stack_num(%rip)
	movl	enzansi_stack_num(%rip), %ecx
	movl	calc_stack_num(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, calc_stack_num(%rip)
	movslq	%ecx, %rdx
	leaq	enzansi_stack(%rip), %rcx
	movzbl	(%rdx,%rcx), %edx
	cltq
	leaq	calc_stack(%rip), %rcx
	movb	%dl, (%rax,%rcx)
.L27:
	movl	enzansi_stack_num(%rip), %eax
	testl	%eax, %eax
	jle	.L28
	movl	-240(%rbp), %eax
	cltq
	movzbl	-224(%rbp,%rax), %eax
	movsbl	%al, %edx
	movl	enzansi_stack_num(%rip), %eax
	subl	$1, %eax
	cltq
	leaq	enzansi_stack(%rip), %rcx
	movzbl	(%rax,%rcx), %eax
	movsbl	%al, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	enzansi_isdopop
	testl	%eax, %eax
	jne	.L29
.L28:
	movl	enzansi_stack_num(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, enzansi_stack_num(%rip)
	movl	-240(%rbp), %edx
	movslq	%edx, %rdx
	movzbl	-224(%rbp,%rdx), %edx
	cltq
	leaq	enzansi_stack(%rip), %rcx
	movb	%dl, (%rax,%rcx)
	jmp	.L22
.L20:
	movl	enzansi_stack_num(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, enzansi_stack_num(%rip)
	movl	-240(%rbp), %edx
	movslq	%edx, %rdx
	movzbl	-224(%rbp,%rdx), %edx
	cltq
	leaq	enzansi_stack(%rip), %rcx
	movb	%dl, (%rax,%rcx)
	jmp	.L22
.L19:
	movl	calc_stack_num(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, calc_stack_num(%rip)
	movl	-240(%rbp), %edx
	movslq	%edx, %rdx
	movzbl	-224(%rbp,%rdx), %edx
	cltq
	leaq	calc_stack(%rip), %rcx
	movb	%dl, (%rax,%rcx)
.L22:
	addl	$1, -240(%rbp)
.L18:
	movl	-240(%rbp), %eax
	cltq
	movzbl	-224(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L30
	jmp	.L31
.L32:
	movl	enzansi_stack_num(%rip), %eax
	subl	$1, %eax
	movl	%eax, enzansi_stack_num(%rip)
	movl	enzansi_stack_num(%rip), %ecx
	movl	calc_stack_num(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, calc_stack_num(%rip)
	movslq	%ecx, %rdx
	leaq	enzansi_stack(%rip), %rcx
	movzbl	(%rdx,%rcx), %edx
	cltq
	leaq	calc_stack(%rip), %rcx
	movb	%dl, (%rax,%rcx)
.L31:
	movl	enzansi_stack_num(%rip), %eax
	testl	%eax, %eax
	jg	.L32
	movl	$0, -240(%rbp)
	jmp	.L33
.L38:
	movl	-240(%rbp), %eax
	cltq
	leaq	calc_stack(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	movb	%al, -228(%rbp)
	movl	-240(%rbp), %eax
	cltq
	leaq	calc_stack(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	get_id
	testl	%eax, %eax
	je	.L34
	movl	main_stack_num(%rip), %eax
	cmpl	$1, %eax
	jg	.L35
	movl	$1, %eax
	jmp	.L41
.L35:
	movl	main_stack_num(%rip), %eax
	subl	$2, %eax
	cltq
	imulq	$500, %rax, %rax
	leaq	main_stack(%rip), %rdx
	addq	%rax, %rdx
	leaq	-228(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcat@PLT
	movl	main_stack_num(%rip), %eax
	subl	$1, %eax
	cltq
	imulq	$500, %rax, %rax
	leaq	main_stack(%rip), %rdx
	addq	%rax, %rdx
	movl	main_stack_num(%rip), %eax
	subl	$2, %eax
	cltq
	imulq	$500, %rax, %rax
	leaq	main_stack(%rip), %rcx
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movl	main_stack_num(%rip), %eax
	subl	$2, %eax
	cltq
	imulq	$500, %rax, %rax
	leaq	main_stack(%rip), %rdx
	leaq	(%rax,%rdx), %rbx
	movq	%rbx, %rdi
	call	strlen@PLT
	addq	%rbx, %rax
	movw	$41, (%rax)
	movl	main_stack_num(%rip), %eax
	subl	$2, %eax
	cltq
	imulq	$500, %rax, %rax
	leaq	main_stack(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rdx
	movl	main_stack_num(%rip), %eax
	subl	$2, %eax
	cltq
	imulq	$500, %rax, %rax
	leaq	main_stack(%rip), %rcx
	addq	%rax, %rcx
	movl	main_stack_num(%rip), %eax
	subl	$2, %eax
	cltq
	imulq	$500, %rax, %rax
	leaq	1(%rax), %rsi
	leaq	main_stack(%rip), %rax
	addq	%rsi, %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memmove@PLT
	movl	main_stack_num(%rip), %eax
	subl	$2, %eax
	cltq
	imulq	$500, %rax, %rax
	leaq	main_stack(%rip), %rdx
	movb	$40, (%rax,%rdx)
	movl	main_stack_num(%rip), %eax
	subl	$1, %eax
	movl	%eax, main_stack_num(%rip)
	jmp	.L37
.L34:
	movl	main_stack_num(%rip), %eax
	leal	1(%rax), %edx
	movl	%edx, main_stack_num(%rip)
	cltq
	imulq	$500, %rax, %rax
	leaq	main_stack(%rip), %rdx
	addq	%rax, %rdx
	leaq	-228(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy@PLT
.L37:
	addl	$1, -240(%rbp)
.L33:
	movl	calc_stack_num(%rip), %eax
	cmpl	%eax, -240(%rbp)
	jl	.L38
	leaq	main_stack(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	addl	$1, -244(%rbp)
.L17:
	movl	-252(%rbp), %eax
	cmpl	%eax, -244(%rbp)
	jl	.L39
	addl	$1, -248(%rbp)
.L11:
	movl	-264(%rbp), %eax
	cmpl	%eax, -248(%rbp)
	jl	.L40
	movl	$0, %eax
.L41:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L42
	call	__stack_chk_fail@PLT
.L42:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.data
	.align 32
	.type	id.0, @object
	.size	id.0, 512
id.0:
	.long	1
	.zero	508
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
