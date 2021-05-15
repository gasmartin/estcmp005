section .data
    L1: times 4 dw 0
    L2: times 4 dw 0
    L3: times 4 dw 0

section .text
    global _start

_start:
    ; Reading value of a
    mov eax, 3 ; system call read
    mov ebx, 1 ; file descriptor
    mov ecx, L1
    mov edx, 4
    int 0x80

    ; Reading value of b
    mov eax, 3 ; system call read
    mov ebx, 1 ; file descriptor
    mov ecx, L2
    mov edx, 4
    int 0x80

    mov eax, [L1]
    mov ebx, [L2]

    mov [L3], ebx

    cmp eax, ebx
    jle _print
    mov [L3], eax
    jmp _print

_print:
    mov eax, 4 ; system call write
    mov ebx, 1 ; file descriptor
    mov ecx, L3 ; buffer
    mov edx, 4 ; size 
    int 0x80
_exit:
    mov ebx, 0
    mov eax, 1
    int 0x80
