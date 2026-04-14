section .text
global main

main:
push rbp
mov rbp, rsp
sub rsp, 4096

mov [rbp-4], edi
lea rdi, [rbp-4]
lea rsi, [LC0]
call scanf
mov eax, [rbp-4]
dec eax
mov [k], eax

cmp [k], 0
jle .L2

lea r13, [rbp+16]
lea rbp, [rbp+2016]
lea r12, [rbp+4016]
lea rbx, [LC1]

.L3:
mov ecx, [k]
cmp eax, ecx
jl .L2
mov rdi, rbx
shl rcx, 2
add rdi, rax
mov rdx, r13
add rdx, rax
mov rsi, r12
add rsi, rax
xor eax, eax
call scanf
inc eax
mov [k], eax
jmp .L3

.L2:
mov eax, [i]
lea rbp, [rbp+2016]
lea r12, [rbp+4016]
lea rbx, [LC5]
cmp eax, [k]
jge .L8

movsd LC2, xmm5
movsd LC3, xmm4

.L4:
movsd LC4, xmm6
mov ecx, [i]
mov esi, [k]
add ecx, 1
dec esi
mov [i], ecx
cmp ecx, esi
jl .L4

.L8:
mov eax, 48
call putchar
mov rax, [rbp-4024]
mov rdi, rax
call printf
mov eax, [i]
mov [k], eax
mov eax, [k]
dec eax
mov [i], eax
cmp eax, 0
jge .L4

mov rsp, rbp
pop rbp
ret

section .bss
resb 4
resb 4
resb 4

section .rodata
LC0 db "%d", 0
LC1 db "%d%d%d", 0
LC5 db "%d\n", 0
LC2 dd 0, 1127219200
LC3 dd -1, 2147483647, 0, 0
LC4 dd 0, 1072693248
