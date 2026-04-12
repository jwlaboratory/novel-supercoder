section .text
global main

main:
push rbp
mov rbp, rsp
sub rsp, 400064

mov ecx, 400040
xor esi, esi
call memset

lea rdi, [rbp-400060]
lea rdx, [rbp-400056]
lea rsi, [rbp-400052]
xor eax, eax
mov edi, LC0
call __isoc99_scanf

mov eax, [rbp-400056]
test eax, eax
jle .L7

xor ebx, ebx
xor ebp, ebp

.L6:
lea rdx, [rbp-400060+ebx*4]
mov dword [rdx], -1
add ebp, 1
inc ebx
cmp ebx, [rbp-400056]
jle .L6

.L2:
lea rdx, [rbp-400060+ebx*4]
lea rsi, [rbp-400052]
mov edi, LC1
xor eax, eax
call __isoc99_scanf

movsx rdx, eax
mov eax, [rbp-400060+rdx*4]
test eax, eax
js .L5

cmp byte [rbp-400052+1], 'W'
je .L4

add ebp, eax
mov dword [rbp-400060+rdx*4], -1
inc ebx

.L5:
inc ebx
cmp ebx, [rbp-400056]
jle .L2

 jmp .L2

.L4:
add eax, 1
add ebx, 1
mov [rbp-400060+rdx*4], eax

.L7:
mov eax, ebp
mov esi, ebx
mov edi, LC2
xor edx, edx
call printf

add rsp, 400064
pop rbp
ret
