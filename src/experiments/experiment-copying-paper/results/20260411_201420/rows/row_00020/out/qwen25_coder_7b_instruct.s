section .text
global main

main:
push rbp
mov rbp, rsp
sub rsp, 48

mov eax, 0
lea rdi, [rbp-4]
call read_int
mov ecx, eax
test ecx, ecx
jle .L5

mov rbp, rsp
mov eax, 1
mov ebx, -200
mov ecx, 200
mov r14, rbp

.L4:
mov rsi, r14
xor eax, eax
lea rdi, [rbp-4]
call read_int
mov eax, [r14]
cmp eax, ecx
cmovg eax, ecx
cmp eax, ebx
cmovl eax, ebx
inc r15
add r14, 4
cmp r15, ecx
jge .L4
cmp ebx, ecx
jg .L5

mov eax, ecx
mov edi, ecx
dec eax
and edi, -4
xor xmm5, xmm5
shr eax, 2
lea r10, [rdi+1]
sal rax, 4
lea rsi, [rbp+rax+36]

.L6:
test ecx, ecx
jle .L20
cmp ebx, 2
jbe .L12
movd ebx, xmm6
mov rax, rbp
xor xmm2, xmm2
pslld $2, xmm6
pshufd $0, xmm6, xmm4

.L8:
movdqu [rax], xmm0
add rax, 16
psubd xmm4, xmm0
movdqa xmm1, xmm0
pmuludq xmm0, xmm1
psrlq $32, xmm0
pmuludq xmm0, xmm0
pshufd $8, xmm1, xmm1
pshufd $8, xmm0, xmm0
punpckldq xmm0, xmm1
movdqa xmm5, xmm0
pcmpgtd xmm1, xmm0
movdqa xmm1, xmm3
punpckldq xmm0, xmm3
punpckhdq xmm0, xmm1
paddq xmm3, xmm2
paddq xmm1, xmm2
cmp rsi, rax
jne .L8
movdqa xmm2, xmm0
mov eax, r10d
psrldq $8, xmm0
paddq xmm0, xmm2
mov rax, xmm2
cmp ecx, edi
je .L9
.L7:
movslq r11d, rdx
mov eax, [rbp+rdx*4+16]
sub eax, ebx
imul eax, eax
movslq rdx, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
add rax, rax
