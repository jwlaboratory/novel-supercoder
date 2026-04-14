.file	"temp.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"NO"
.LC1:
	.string	"YES"
.LC2:
	.string	"%d%*c"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%eax, %eax
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, 12(%rsp)
	leaq	12(%rsp), %rsi
	leaq	.LC2(%rip), %rdi
	call	scanf@PLT
	movl	12(%rsp), %eax
	leal	-1(%rax), %edx
	movl	%edx, 12(%rsp)
	testl	%eax, %eax
	je	.L2
	leaq	s(%rip), %rbx
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L15:
	subl	$1, %eax
.L13:
	movl	12(%rsp), %ecx
	movl	%eax, %edx
	movl	%eax, d(%rip)
	shrl	$31, %edx
	orl	r(%rip), %edx
	leal	-1(%rcx), %esi
	movl	%edx, r(%rip)
	movl	%esi, 12(%rsp)
	testl	%ecx, %ecx
	je	.L5
.L6:
	xorl	%eax, %eax
	movq	%rbx, %rdi
	call	gets@PLT
	cmpb	$65, (%rbx)
	movl	d(%rip), %eax
	jne	.L15
	addl	$1, %eax
	jmp	.L13
.L2:
	movl	r(%rip), %edx
	movl	d(%rip), %eax
.L5:
	orl	%eax, %edx
	leaq	.LC0(%rip), %rdi
	leaq	.LC1(%rip), %rax
	cmove	%rax, %rdi
	call	puts@PLT
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, d(%rip)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	s
	.bss
	.align 8
	.type	s, @object
	.size	s, 9
s:
	.zero	9
	.globl	r
	.align 4
	.type	r, @object
	.size	r, 4
r:
	.zero	4
	.globl	d
	.align 4
	.type	d, @object
	.size	d, 4
d:
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