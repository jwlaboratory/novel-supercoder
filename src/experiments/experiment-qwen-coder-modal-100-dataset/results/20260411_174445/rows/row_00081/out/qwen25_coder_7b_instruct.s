section .text
global main
extern printf, scanf

section .bss
Dis resd 11
Divider resd 5

section .data
LC0 db "%d %d", 0
LC1 db "%d", 0
LC2 db "%d\n", 0

section .text
main:
push rbp
mov rbp, rsp
sub rsp, 24

mov eax, [K]
test eax, eax
jle .L5

.L2:
xor eax, eax
lea rsi, [rsp+12]
mov edi, LC1
add ebx, 1
call scanf
mov esi, [rsp+12]
cdqe
cmp ebx, [K]
mov dword [Dis+4*rsi], 1
ja .L2

.L5:
mov rcx, [N]
mov ebx, 1
mov rax, rcx
imul rax, 1717986919
sar rax, 34
sub ecx, edx
je .L4

.L3:
mov rdx, rcx
sar rdx, 31
add ebx, 1
imul rdx, 1717986919
mov esi, ecx
sar rdx, 34
mov ecx, edx
sub ecx, esi
jne .L3

.L4:
mov ebp, [Dis]
test ebp, ebp
je .L6
mov r12d, [Dis+4]
test r12d, r12d
je .L7
mov ebp, [Dis+8]
test ebp, ebp
je .L32
mov r11d, [Dis+12]
test r11d, r11d
je .L33
cmp dword [Dis+16], 0
je .L34
cmp dword [Dis+20], 0
je .L35
cmp dword [Dis+24], 0
je .L36
cmp dword [Dis+28], 0
je .L37
cmp dword [Dis+32], 0
je .L38
cmp byte [Dis+36], 1
sbbl ebp, ebp
add ebp, 10

.L8:
mov r12d, [Dis+4]
.L29:
mov r10d, [Dis+8]
test r10d, r10d
je .L41
mov r9d, [Dis+12]
test r9d, r9d
je .L42
mov r8d, [Dis+16]
test r8d, r8d
je .L43
cmp dword [Dis+20], 0
je .L44
cmp dword [Dis+24], 0
je .L45
cmp dword [Dis+28], 0
je .L46
cmp dword [Dis+32], 0
je .L47
mov r8d, 10
je .L84

.L10:
mov r14d, [Dis+32]
test r14d, r14d
je .L50
mov esi, [Dis+28]
test esi, esi
je .L51
mov ecx, [Dis+24]
test ecx, ecx
je .L52
cmp dword [Dis+20], 0
je .L53
cmp dword [Dis+16], 0
je .L54
cmp dword [Dis+12], 0
je .L55
cmp dword [Dis+8], 0
je .L56
xor ecx, ecx
test edx, edx
sete cl
mov r13d, 5
mov esi, 6
mov ecx, cl
sub ebx, r13d
sub ebx, esi
mov r13, rcx
mov eax, [Divider+r13*4]
imul eax, ecx
cmp esi, 5
je .L12
mov rdi, rcx
mov esi, 7
sub ebx, esi
imul eax, [Divider+rdi*4], ecx
add eax, esi
mov esi, 8
sub ebx, esi
imul eax, [Divider+rsi*4], ecx
add eax, esi
mov esi, 9
sub ebx, esi
imul eax, [Divider+r11*4], ecx
add eax, esi
cmp esi, 5
je .L13
mov rsi, ecx
imul eax, [Divider+rsi*4], ecx
add eax, esi
.L13:
cmp eax, edx
jg .L85

.L27:
mov eax, 4
.L16:
cdq
idiv [Divider+r13*4]
mov edx, eax
mov ecx, eax
imul rax, 1717986919
sar ecx, 31
sar rax, 34
sub ecx, edx
lea ecx, [rdx+rdx*4]
add ecx, ecx
sub ecx, eax
mov eax, ecx
mov edx, rax
cdqe
mov ebp, [Dis+4*rax]
test ebp, ebp
je .L86
mov esi, 1
add edx, 1
mov rax, [Dis+4*rdx]
test rax, rax
je .L21
mov esi, 2
add edx, 1
mov rax, [Dis+4*rdx]
test rax, rax
je .L21
mov esi, 3
add edx, 1
mov rax, [Dis+4*rdx]
test rax, rax
je .L21
mov esi, 4
add edx, 1
mov rax, [Dis+4*rdx]
test rax, rax
je .L21
mov esi, 5
add edx, 1
mov rax, [Dis+4*rdx]
test rax, rax
je .L21
mov esi, 6
add edx, 1
mov rax, [Dis+4*rdx]
test rax, rax
je .L21
mov esi, 7
add edx, 1
mov rax, [Dis+4*rdx]
test rax, rax
je .L21
mov esi, 8
add edx, 1
mov rax, [Dis+4*rdx]
test rax, rax
je .L21
mov esi, 9
add edx, 1
mov rax, [Dis+4*rdx]
test rax, rax
je .L21
mov esi, 10
.L21:
mov [Divider+r13*4], esi
mov r14d, 1
cmp esi, 10
je .L87

.L23:
mov edi, LC1
xor eax, eax
inc r13
call printf
cmp r13d, 5
je .L18
test r14d, r14d
jne .L17
mov eax, [N]
jmp .L16

.L17:
mov esi, ebp
mov edi, LC1
xor eax, eax
inc r13
call printf
cmp r13d, 5
je .L17

.L18:
mov eax, 10
call putchar
 jmp .L79

.L87:
mov eax, r12d
sub eax, ebx
cmp eax, r13d
je .L23
mov [Divider+r13*4], 0
xor esi, esi
jmp .L23

.L86:
mov [Divider+r13*4], edx
mov esi, edx
jmp .L23

.L85:
mov eax, 4
imul ebp, r9d
sub ebx, eax
cdq
imul eax, [Divider+rax*4], ebp
mov eax, [Divider+rdi*4]
imul eax, ebp
lea esi, [rax+r9]
add eax, esi
mov esi, 7
sub ebx, esi
cdq
mov eax, [Divider+rsi*4], ebp
add eax, esi
mov esi, 8
sub ebx, esi
cdq
mov eax, [Divider+r11*4], ebp
add eax, esi
mov esi, 9
sub ebx, esi
cdq
mov eax, [Divider+r11*4], ebp
add eax, esi
mov esi, 10
sub ebx, esi
cdq
mov eax, [Divider+r11*4], ebp
add eax, esi
mov esi, 11
sub ebx, esi
cdq
mov eax, [Divider+r
