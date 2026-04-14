section .text
global main
extern __isoc99_scanf
extern __printf_chk
extern puts
extern __stack_chk_fail

main:
push rbp
mov rbp, rsp
sub rsp, 16
mov [rbp-8], rsp
xor eax, eax
lea rdi, [rbp-12]
call __isoc99_scanf
mov edi, [rbp-12]
mov ecx, rsp
lea eax, [rdi+1]
cltq
lea rax, [rax*8+15]
and rax, -4096
sub rsp, rax
and rsp, -16
cmp rsp, ecx
je .L3
.L22:
sub rsp, 4096
or rsp, 0
cmp rsp, ecx
jne .L22
.L3:
and edx, 4095
sub rsp, rdx
test rdx, rdx
jne .L23
.L4:
lea r10, [rsp+7]
mov eax, edi
dec eax
mov rax, rax/8
cmp eax, 1
jbe .L24
movdqa [LC2], xmm0
mov qword [rsp+rax*8+16], 0
movups [rsp+rax*8], xmm0
cmp edi, 2
je .L11
mov qword [rsp+rax*8+24], 1
cmp edi, 3
je .L11
lea eax, [rdi-4]
lea rsi, [r10+8]
mov r9, -8543223828751151131
lea r8, [r10+rax*8+16]
jmp .L10
.L25:
mov rcx, rsi
add rsi, 8
imul r9, rcx
mov rcx, rsi
sar rcx, 63
add rcx, rdx
sar rcx, 29
sub rcx, rdx
imul rdx, 1000000007, rdx
sub rcx, rdx
mov qword [rsi+16], rcx
cmp rsi, r8
je .L11
 jmp .L10
.L11:
mov rdx, [r10+rdi*8]
lea rsi, [LC3]
mov edi, 1
xor eax, eax
call __printf_chk
jmp .L6
.L24:
lea rdi, [LC1]
call puts
jmp .L6
.L23:
or rsp, rdx
jmp .L4
.L6:
mov rsp, [rbp-8]
pop rbp
ret
.L24:
call __stack_chk_fail
