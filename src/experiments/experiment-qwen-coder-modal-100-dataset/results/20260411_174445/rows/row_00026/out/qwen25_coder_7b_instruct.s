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
