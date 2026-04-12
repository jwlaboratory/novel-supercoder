section .text
global main

main:
push rbp
mov rbp, rsp
sub rsp, 48

lea rdi, [rip + LC0]
xor eax, eax
call scanf
mov ecx, eax
test ecx, ecx
jl .L2

xor r13d, r13d
xor r12d, r12d

.L4:
lea rsi, [dists + r13*4]
xor ebx, ebx

.L3:
mov edi, rsi
lea rsi, [rip + LC1]
xor eax, eax
add ebx, 1
call scanf
mov esi, eax
add rsi, 4
cmp ebx, ecx
jg .L3

add r12d, 1
add r13, 300
cmp r12d, ecx
jg .L4

test ecx, ecx
jl .L2

xor r9d, r9d
xor r10d, r10d
xor r13d, r13d
movsx r11, ecx
mov ebp, 1

.L5:
mov r12d, dists
xor edi, edi

.L12:
mov eax, [r12 + r9*4]
mov rsi, r12
xor edx, edx
xor ebx, ebx

.L10:
mov ecx, [rsi]
add ecx, [r12 + rdx*4 + r9*4]
cmp ecx, eax
jle .L6
mov edi, rip + LC2
call puts
jmp .L7

.L6:
cmp edi, r10d
je .L8
cmp edx, edi
je .L8
cmp edx, r10d
cmovne ebp, ebx

.L8:
add rdx, 1
add rsi, 1200
cmp rdx, r11
je .L31
jmp .L10

.L31:
movsx r8d, eax
add r13, r8d
test ebx, ebx
cmove r13, rdx
add edi, 1
add r12, 4
cmp edi, ecx
jne .L12
add r10d, 1
add r9, 1200
cmp r10d, ecx
jne .L5
jmp .L13

.L2:
xor r13d, r13d
.L13:
mov rsi, r13
mov edi, rip + LC3
xor eax, eax
shrq rsi
call printf
jmp .L7

.L7:
add rsp, 48
pop rbp
ret
