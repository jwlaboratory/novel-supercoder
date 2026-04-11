movq	%r12, 8(%rsp)
	movq	%r13, %r12
	movq	%rbp, %r13
.L44:
	movl	cross(,%r14,4), %edi
	testl	%edi, %edi
	jne	.L33
	cmpb	$0, rel(%r15,%r12)
	jne	.L34
	cmpb	$0, rel(%r13,%r14)
	je	.L33
.L34:
	movl	%r8d, cross(,%r14,4)
	testl	%edx, %edx
	jle	.L63
	movq	%r13, 0(%rsp)
	xorl	%r10d, %r10d
	xorl	%ebx, %ebx
	movq	%rbp, %r12
	movq	%r14, 8(%rsp)
	movq	%r15, %r13
	movq	%r12, %r14
.L43:
	movl	cross(,%r15,4), %edi
	testl	%edi, %edi
	jne	.L35
	cmpb	$0, rel(%r12,%r13)
	jne	.L36
	cmpb	$0, rel(%r14,%r15)
	je	.L35
.L36:
	movl	%r8d, cross(,%r15,4)
	testl	%edx, %edx
	jle	.L64
	movq	%r14, 8(%rsp)
	xorl	%r10d, %r10d
	xorl	%ebx, %ebx
	movq	%rbp, %r12
	movq	%r15, 0(%rsp)
	movq	%r13, %r12
	movq	%r14, %r13
.L42:
	movl	cross(,%r12,4), %edi
	testl	%edi, %edi
	jne	.L37
	cmpb	$0, rel(%r13,%r12)
	jne	.L38
	cmpb	$0, rel(%r15,%rbp)
	je	.L37
.L38:
	movl	%r8d, cross(,%r12,4)
	testl	%edx, %edx
	jle	.L65
	movq	%r15, 8(%rsp)
	xorl	%r10d, %r10d
	xorl	%ebx, %ebx
	movq	%rbp, %r12
	movq	%r15, 8(%rsp)
	movq	%r13, %r12
	movq	%r14, %r13
.L41:
	movl	cross(,%r13,4), %edi
	testl	%edi, %edi
	jne	.L39
	cmpb	$0, rel(%r14,%r12)
	jne	.L40
	cmpb	$0, rel(%r15,%rbp)
	je	.L39
.L40:
	movl	%r8d, cross(,%r13,4)
	testl	%edx, %edx
	jle	.L66
	movq	%r14, 8(%rsp)
	xorl	%r10d, %r10d
	xorl	%ebx, %ebx
	movq	%rbp, %r12
	movq	%r15, 8(%rsp)
	movq	%r13, %r12
	movq	%r14, %r13
.L41:
	movl	cross(,%r12,4), %edi
	testl	%edi, %edi
	jne	.L39
	cmpb	$0, rel(%r14,%r12)
	jne	.L40
	cmpb	$0, rel(%r15,%rbp)
	je	.L39
.L40:
	movl	%r8d, cross(,%r12,4)
	testl	%edx, %edx
	jle	.L66
	movq	%r14, 8(%rsp)
	xorl	%r10d, %r10d
	xorl	%ebx, %ebx
	movq	%rbp, %r12
	movq	%r15, 8(%rsp)
	movq	%r13, %r12
	movq	%r14, %r13
.L41:
	movl	cross(,%r12,4), %edi
	testl	%edi, %edi
	jne	.L39
	cmpb	$0, rel(%r14,%r12)
	jne	.L40
	cmpb	$0, rel(%r15,%rbp)
	je	.L39
.L40:
	movl	%r8d, cross(,%r12,4)
	testl	%edx, %edx
	jle	.L66
	movq	%r14, 8(%rsp)
	xorl	%r10d, %r10d
	xorl	%ebx, %ebx
	movq	%rbp, %r12
	movq	%r15, 8(%rsp)
	movq	%r13, %r12
	movq	%r14, %r13
.L41:
	movl	cross(,%r12,4), %edi
	testl	%edi, %edi
	jne	.L39
	cmpb	$0, rel(%r14,%r12)
	jne	.L40
	cmpb	$0, rel(%r15,%rbp)
	je	.L39
.L40:
	movl	%r8d, cross(,%r12,4)
	testl	%edx, %edx
	jle	.L66
	movq	%r14, 8(%rsp)
	xorl	%r10d, %r10d
	xorl	%ebx, %ebx
	movq	%rbp, %r12
	movq	%r15, 8(%rsp)
	movq	%r13, %r12
	movq	%r14, %r13
.L41:
	movl	cross(,%r12,4), %edi
	testl	%edi, %edi
	jne	.L39
	cmpb	$0, rel(%r14,%r12)
	jne	.L40
	cmpb	$0, rel(%r15,%rbp)
	je	.L39
.L40:
	movl	%r8d, cross(,%r12,4)
	testl	%edx, %edx
	jle	.L66
	movq	%r14, 8(%rsp)
	xorl	%r10d, %r10d
	xorl	%ebx, %ebx
	movq	%rbp, %r12
	movq	%r15, 8(%rsp)
	movq	%r13, %r12
	movq	%r14, %r13
.L41:
	movl	cross(,%r12,4), %edi
	testl	%edi, %edi
	jne	.L39
	cmpb	$0, rel(%r14,%r12)
	jne	.L40
	cmpb	$0, rel(%r15,%rbp)
	je	.L39
.L40:
	movl	%r8d, cross(,%r12,4)
	testl	%edx, %edx
	jle	.L66
	movq	%r14, 8(%rsp)
	xorl	%r10d, %r10d
	xorl	%ebx, %ebx
	movq	%rbp, %r12
	movq	%r15, 8(%rsp)
	movq	%r13, %r12
	movq	%r14, %r13
.L41:
	movl	cross(,%r12,4), %edi
	testl	%edi, %edi
	jne	.L39
	cmpb	$0, rel(%r14,%r12)
	jne	.L40
	cmpb	$0, rel(%r15,%rbp)
	je	.L39
.L40:
	movl	%r8d, cross(,%r12,4)
	testl	%edx, %edx
	jle	.L66
	movq	%
