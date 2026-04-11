cmp:
    .cfi_startproc
    movapd (%rdi), %xmm0
    movapd (%rsi), %xmm1
    subpd %xmm1, %xmm0
    movapd %xmm0, %xmm2
    movsd .LC1(%rip), %xmm3
    andpd %xmm2, %xmm0
    comisd %xmm0, %xmm3
    jbe .L11
    movapd 16(%rdi), %xmm0
    movapd 16(%rsi), %xmm1
    subpd %xmm1, %xmm0
    movapd %xmm0, %xmm2
    movsd .LC1(%rip), %xmm3
    andpd %xmm2, %xmm0
    comisd %xmm0, %xmm3
    ja .L1
.L11:
    ret
    .cfi_endproc
