section .text
global main
extern printf, scanf

main:
    push rbp
    mov rbp, rsp
    sub rsp, 40
    lea rdi, [rbp-4]
    call scanf
    mov eax, dword [rbp-4]
    test eax, eax
    jle .L6
    lea rsi, [rbp-8]
    xor ebx, ebx
    lea rdi, [rbp-12]
    call scanf
    mov eax, dword [rbp-8]
    add ebx, eax
    lea rdx, [rbp-16]
    xor ecx, ecx
    mov ecx, 1000000001
    lea rsi, [rdx+4*ebx]
.L3:
    cmp rsi, rdx
    je .L6
    mov eax, dword [rsi]
    cmp eax, ecx
    jl .L4
    mov ecx, eax
.L4:
    add rsi, 4
    jmp .L3
.L6:
    xor eax, eax
    mov eax, dword [rbp-12]
    lea rdi, [rbp-20]
    mov dword [rbp-20], eax
    lea rsi, [rbp-24]
    mov dword [rbp-24], 1
    lea rdi, [rbp-28]
    mov dword [rbp-28], 10
    lea rdi, [rbp-32]
    mov dword [rbp-32], 1
    lea rdi, [rbp-36]
    mov dword [rbp-36], 1
    lea rdi, [rbp-40]
    mov dword [rbp-40], 1
    lea rdi, [rbp-44]
    mov dword [rbp-44], 1
    lea rdi, [rbp-48]
    mov dword [rbp-48], 1
    lea rdi, [rbp-52]
    mov dword [rbp-52], 1
    lea rdi, [rbp-56]
    mov dword [rbp-56], 1
    lea rdi, [rbp-60]
    mov dword [rbp-60], 1
    lea rdi, [rbp-64]
    mov dword [rbp-64], 1
    lea rdi, [rbp-68]
    mov dword [rbp-68], 1
    lea rdi, [rbp-72]
    mov dword [rbp-72], 1
    lea rdi, [rbp-76]
    mov dword [rbp-76], 1
    lea rdi, [rbp-80]
    mov dword [rbp-80], 1
    lea rdi, [rbp-84]
    mov dword [rbp-84], 1
    lea rdi, [rbp-88]
    mov dword [rbp-88], 1
    lea rdi, [rbp-92]
    mov dword [rbp-92], 1
    lea rdi, [rbp-96]
    mov dword [rbp-96], 1
    lea rdi, [rbp-100]
    mov dword [rbp-100], 1
    lea rdi, [rbp-104]
    mov dword [rbp-104], 1
    lea rdi, [rbp-108]
    mov dword [rbp-108], 1
    lea rdi, [rbp-112]
    mov dword [rbp-112], 1
    lea rdi, [rbp-116]
    mov dword [rbp-116], 1
    lea rdi, [rbp-120]
    mov dword [rbp-120], 1
    lea rdi, [rbp-124]
    mov dword [rbp-124], 1
    lea rdi, [rbp-128]
    mov dword [rbp-128], 1
    lea rdi, [rbp-132]
    mov dword [rbp-132], 1
    lea rdi, [rbp-136]
    mov dword [rbp-136], 1
    lea rdi, [rbp-140]
    mov dword [rbp-140], 1
    lea rdi, [rbp-144]
    mov dword [rbp-144], 1
    lea rdi, [rbp-148]
    mov dword [rbp-148], 1
    lea rdi, [rbp-152]
    mov dword [rbp-152], 1
    lea rdi, [rbp-156]
    mov dword [rbp-156], 1
    lea rdi, [rbp-160]
    mov dword [rbp-160], 1
    lea rdi, [rbp-164]
    mov dword [rbp-164], 1
    lea rdi, [rbp-168]
    mov dword [rbp-168], 1
    lea rdi, [rbp-172]
    mov dword [rbp-172], 1
    lea rdi, [rbp-176]
    mov dword [rbp-176], 1
    lea rdi, [rbp-180]
    mov dword [rbp-180], 1
    lea rdi, [rbp-184]
    mov dword [rbp-184], 1
    lea rdi, [rbp-188]
    mov dword [rbp-188], 1
    lea rdi, [rbp-192]
    mov dword [rbp-192], 1
    lea rdi, [rbp-196]
    mov dword [rbp-196], 1
    lea rdi, [rbp-200]
    mov dword [rbp-200], 1
    lea rdi, [rbp-204]
    mov dword [rbp-204], 1
    lea rdi, [rbp-208]
    mov dword [rbp-208], 1
    lea rdi, [rbp-212]
    mov dword [rbp-212], 1
    lea rdi, [rbp-216]
    mov dword [rbp-216], 1
    lea rdi, [rbp-220]
    mov dword [rbp-220], 1
    lea rdi, [rbp-224]
    mov dword [rbp-224], 1
    lea rdi, [rbp-228]
    mov dword [rbp-228], 1
    lea rdi, [rbp-232]
    mov dword [rbp-232], 1
    lea rdi, [rbp-236]
    mov dword [rbp-236], 1
    lea rdi, [rbp-240]
    mov dword [rbp-240], 1
    lea rdi, [rbp-244]
    mov dword [rbp-244], 1
    lea rdi, [rbp-248]
    mov dword [rbp-248], 1
    lea rdi, [rbp-252]
    mov dword [rbp-252], 1
    lea rdi, [rbp-256]
    mov dword [rbp-256], 1
    lea rdi, [rbp-260]
    mov dword [rbp-260], 1
    lea rdi, [rbp-264]
    mov dword [rbp-264], 1
    lea rdi, [rbp-268]
    mov dword [rbp-268], 1
    lea rdi, [rbp-272]
    mov
