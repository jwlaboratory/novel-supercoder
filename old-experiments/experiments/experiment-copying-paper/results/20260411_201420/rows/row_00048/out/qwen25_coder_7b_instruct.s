section .text
global selectionSort

selectionSort:
push rbp
mov rbp, rsp
sub rsp, 32
mov [rbp-4], edi
mov [rbp-8], esi
mov ecx, [rbp-8]
dec ecx
mov [rbp-12], ecx
xor eax, eax
mov [rbp-16], eax
mov ebx, [rbp-4]

outer_loop:
cmp ebx, [rbp-12]
jge end_outer_loop
mov ecx, ebx
mov [rbp-20], ecx
mov edx, ebx
mov [rbp-24], edx

inner_loop:
mov ecx, [rbp-20]
mov [rbp-28], ecx
mov edx, [rbp-24]
mov [rbp-32], edx
mov ecx, [rbp-4]
add ecx, [rbp-28]
shl ecx, 2
mov ecx, [rbp-4+rcx]
mov [rbp-36], ecx
mov ecx, [rbp-4]
add ecx, [rbp-32]
shl ecx, 2
mov ecx, [rbp-4+rcx]
mov [rbp-40], ecx
cmp [rbp-36], [rbp-40]
jl swap_elements
jmp continue_inner_loop

swap_elements:
mov ecx, [rbp-4]
add ecx, [rbp-28]
shl ecx, 2
mov ecx, [rbp-4+rcx]
mov [rbp-44], ecx
mov ecx, [rbp-4]
add ecx, [rbp-32]
shl ecx, 2
mov ecx, [rbp-4+rcx]
mov [rbp-48], ecx
mov ecx, [rbp-44]
mov [rbp-4], ecx
mov ecx, [rbp-48]
mov [rbp-4+rbp-28*4], ecx
inc dword [rbp-16]

continue_inner_loop:
mov ecx, [rbp-20]
inc ecx
mov [rbp-20], ecx
cmp ecx, [rbp-8]
jle inner_loop

end_inner_loop:
mov ecx, [rbp-16]
test ecx, ecx
je no_swap
mov ecx, [rbp-4]
add ecx, [rbp-12]
shl ecx, 2
mov ecx, [rbp-4+rcx]
mov [rbp-52], ecx
mov ecx, [rbp-4]
add ecx, [rbp-12]
shl ecx, 2
mov ecx, [rbp-4+rcx]
mov [rbp-56], ecx
mov ecx, [rbp-52]
mov [rbp-4], ecx
mov ecx, [rbp-56]
mov [rbp-4+rbp-12*4], ecx

no_swap:
mov ecx, [rbp-12]
inc ecx
mov [rbp-12], ecx
mov ecx, [rbp-16]
mov [rbp-16], ecx
jmp outer_loop

end_outer_loop:
mov eax, [rbp-16]
leave
ret

section .bss
selectionSort_size resd 1
