cmp:
        sub     sp, sp, #16
        str     x0, [sp, 8]
        str     x1, [sp]
        ldr     x0, [sp, 8]
        ldr     w1, [x0]
        ldr     x0, [sp]
        ldr     w0, [x0]
        sub     w0, w1, w0
        add     sp, sp, 16
        ret
twoSum:
        stp     x29, x30, [sp, -64]!
        mov     x29, sp
        str     x0, [sp, 24]
        str     w1, [sp, 20]
        str     w2, [sp, 16]
        ldr     w0, [sp, 20]
        add     w0, w0, 1
        sxtw    x0, w0
        lsl     x0, x0, 3
        bl      malloc
        str     x0, [sp, 48]
        str     wzr, [sp, 60]
        b       .L4
.L5:
        ldrsw   x0, [sp, 60]
        lsl     x0, x0, 2
        ldr     x1, [sp, 24]
        add     x1, x1, x0
        ldrsw   x0, [sp, 60]
        lsl     x0, x0, 3
        ldr     x2, [sp, 48]
        add     x0, x2, x0
        ldr     w1, [x1]
        str     w1, [x0]
        ldrsw   x0, [sp, 60]
        lsl     x0, x0, 3
        ldr     x1, [sp, 48]
        add     x0, x1, x0
        ldr     w1, [sp, 60]
        str     w1, [x0, 4]
        ldr     w0, [sp, 60]
        add     w0, w0, 1
        str     w0, [sp, 60]
.L4:
        ldr     w1, [sp, 60]
        ldr     w0, [sp, 20]
        cmp     w1, w0
        blt     .L5
        ldrsw   x1, [sp, 20]
        adrp    x0, cmp
        add     x3, x0, :lo12:cmp
        mov     x2, 8
        ldr     x0, [sp, 48]
        bl      qsort
        str     wzr, [sp, 60]
        ldr     w0, [sp, 20]
        sub     w0, w0, #1
        str     w0, [sp, 56]
        b       .L6
.L10:
        ldrsw   x0, [sp, 60]
        lsl     x0, x0, 3
        ldr     x1, [sp, 48]
        add     x0, x1, x0
        ldr     w1, [x0]
        ldrsw   x0, [sp, 56]
        lsl     x0, x0, 3
        ldr     x2, [sp, 48]
        add     x0, x2, x0
        ldr     w0, [x0]
        add     w0, w1, w0
        str     w0, [sp, 44]
        ldr     w1, [sp, 44]
        ldr     w0, [sp, 16]
        cmp     w1, w0
        bne     .L7
        mov     x0, 8
        bl      malloc
        str     x0, [sp, 32]
        ldrsw   x0, [sp, 60]
        lsl     x0, x0, 3
        ldr     x1, [sp, 48]
        add     x0, x1, x0
        ldr     w1, [x0, 4]
        ldr     x0, [sp, 32]
        str     w1, [x0]
        ldrsw   x0, [sp, 56]
        lsl     x0, x0, 3
        ldr     x1, [sp, 48]
        add     x1, x1, x0
        ldr     x0, [sp, 32]
        add     x0, x0, 4
        ldr     w1, [x1, 4]
        str     w1, [x0]
        ldr     x0, [sp, 48]
        bl      free
        ldr     x0, [sp, 32]
        b       .L8
.L7:
        ldr     w1, [sp, 44]
        ldr     w0, [sp, 16]
        cmp     w1, w0
        bge     .L9
        ldr     w0, [sp, 60]
        add     w0, w0, 1
        str     w0, [sp, 60]
        b       .L6
.L9:
        ldr     w0, [sp, 56]
        sub     w0, w0, #1
        str     w0, [sp, 56]
.L6:
        ldr     w1, [sp, 60]
        ldr     w0, [sp, 56]
        cmp     w1, w0
        blt     .L10
        ldr     x0, [sp, 48]
        bl      free
        mov     x0, 0
.L8:
        ldp     x29, x30, [sp], 64
        ret