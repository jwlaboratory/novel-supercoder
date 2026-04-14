section .text
global main
extern __isoc99_scanf, __printf_chk, __stack_chk_fail

main:
push rbp
mov rbp, rsp
sub rsp, 144
mov [rbp-136], rsp
mov rax, fs:[40]
mov [rbp-136], rax
xor eax, eax
lea rbx, [rbp-128]
lea rsi, [rbp-124]
mov rdx, rbx
call __isoc99_scanf
mov r9d, [rbp-124]
cmp r9d, 1
jle .L12
lea r8, [rbp-120]
movslq r9d, rbp
xor r12d, r12d
mov edi, 1
mov r11d, 1
.L3:
mov ecx, 97
xor r10d, r10d
.L10:
mov rax, rbx
xor edx, edx
.L5:
cmp byte [rax], cl
cmove edx, edi
add rax, 1
cmp rax, r8
jne .L5
mov rax, r11
xor esi, esi
.L7:
cmp byte [rbx+rax], cl
cmove esi, edi
add rax, 1
cmp eax, r9d
jg .L7
and esi, edx
cmp $1, esi
sbbl $-1, r10d
add ecx, 1
cmpb $123, cl
jne .L10
cmp r10d, r12d
cmovl r10d, r12d
add r11, 1
add r8, 1
cmp rbp, r11
jne .L3
jmp .L2
.L12:
xor r12d, r12d
 jmp .L2
.L2:
xor eax, eax
mov edx, r12d
mov edi, 1
lea rsi, [LC1]
call __printf_chk
mov rax, [rbp-136]
sub rax, fs:[40]
je .L19
add rsp, 144
pop rbp
ret
.L19:
call __stack_chk_fail
