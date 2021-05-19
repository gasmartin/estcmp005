;nasm -felf64 fc_conversor.asm && gcc -o fc_conversor fc_conversor.o -no-pie && ./fc_conversor

section .data 
    message: db "Insira a temperatura em fahrenheit: ", 0
    messageLen: equ $-message
    formatin: db "%lf", 0
    formatout: db "Temperatura em Celsius: %.1lf°C", 10, 0
    value: dq 0.0
    _1: dq 32.0
    _2: dq 5.0
    _3: dq 9.0

section .text
    global main
    extern printf
    extern scanf

main:
    push rbx

    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, messageLen
    int 80h

    mov rdi, formatin
    mov rax, 1
    call scanf
    movsd [value], xmm0

    movsd xmm0, [value]
    subsd xmm0, [_1]
    movsd xmm1, [_2]
    mulsd xmm0, xmm1
    movsd xmm1, [_3]
    divsd xmm0, xmm1
    movsd [value], xmm0

    mov rdi, formatout
    movsd xmm0, [value]
    mov rax, 1
    call printf 

    call _exit

_exit:
    mov eax, 1
    mov ebx, 0
    int 80h
