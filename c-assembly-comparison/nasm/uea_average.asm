;nasm -felf64 uea_average.asm && gcc -o uea_average uea_average.o -no-pie && ./uea_average

section .data
    ap1: dq 0.0
    ap2: dq 0.0
    pf: dq 0.0
    msg1: db "Insira a primeira nota: ", 0
    msg1Len: equ $-msg1
    msg2: db "Insira a segunda nota: ", 0
    msg2Len: equ $-msg2
    msg3: db "Voce esta de PF. Insira a nota tirada: ", 0
    msg3Len: equ $-msg3
    input: db "%lf", 0
    formatin: db "%lf", 0
    msgFinal: db "Media: %.1lf", 10, 0
    _2: dq 2.0
    _3: dq 3.0
    _6: dq 6.0
    _8: dq 8.0

section .text
    global main
    extern printf
    extern scanf

main:
    push rbx

    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, msg1Len
    int 80h

    mov rdi, formatin
    mov rax, 1
    call scanf
    movsd [ap1], xmm0

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, msg2Len
    int 80h

    mov rdi, input
    mov rax, 1
    call scanf
    movsd [ap2], xmm0

    movsd xmm0, [ap1]
    addsd xmm0, [ap2]
    movsd xmm1, [_2]
    divsd xmm0, xmm1
    movsd [ap1], xmm0

    mov rax, [ap1]
    cmp rax, [_8]
    jge fim

    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, msg3Len
    int 80h

    mov rdi, input
    mov rax, 1
    call scanf
    movsd [pf], xmm0

    movsd xmm0, [ap1]
    addsd xmm0, [pf]
    movsd xmm1, [_3]
    divsd xmm0, xmm1
    movsd [ap1], xmm0

    jmp fim

fim:
    mov rdi, msgFinal
    movsd xmm0, [ap1]
    mov rax, 1
    call printf 
    
    call _exit

_exit:
    mov eax, 1
    mov ebx, 0
    int 80h
