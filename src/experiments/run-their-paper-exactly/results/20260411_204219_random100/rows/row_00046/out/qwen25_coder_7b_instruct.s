section .text
global main

main:
push rbp
mov rbp, rsp
sub rsp, 456

lea rdi, [LC0]
mov esi, 4
call __isoc99_scanf

mov eax, dword [rsp+4]
mov ebx, eax
dec eax
shl eax, 2
add rsp, 456
sub rsp, eax

mov ecx, -100
mov edx, 99999999

outer_loop:
mov esi, ecx
mov edi, 0

inner_loop:
mov eax, dword [rsp+4+ebx*4]
sub eax, ecx
imul eax, eax
add edi, eax
inc ecx
cmp ecx, 101
jl inner_loop

cmp edi, edx
cmovg edx, edi

inc esi
cmp esi, 201
jl outer_loop

mov eax, edx
mov esi, 1
lea rdi, [LC1]
call __printf_chk

mov rsp, rbp
pop rbp
ret
