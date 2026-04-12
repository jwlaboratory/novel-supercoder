section .text
global main

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32

    lea rdi, [LC0]
    call __isoc99_scanf
    lea rdi, [LC0]
    call __isoc99_scanf

    cvtsi2sd xmm0, [rsp+16]
    call log
    movsd [rsp+8], xmm0

    cvtsi2sd xmm0, [rsp+20]
    call log
    movsd [rsp+16], xmm0

    xorpd xmm0, xmm0
    movsd xmm1, [rsp+8]
    divsd [rsp+16]
    cvttsd2si eax, xmm1
    add eax, 1

    lea rdi, [LC1]
    mov esi, eax
    xor edi, edi
    call __printf_chk

    leave
    ret
