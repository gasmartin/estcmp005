;nasm -felf64 interval_between.asm && gcc -o interval_between interval_between.o -no-pie && ./interval_between
section .data
    message1: db "Enter the first number: ", 0
    message1Len: equ $-message1
    message2: db "Enter the second number: ", 0
    message2Len: equ $-message2
    formatin: db "%d", 0
    formatout: db "%d", 10, 0 ; newline, nul
    number1: times 4 db 0 ; 32-bits integer = 4 bytes
    number2: times 4 db 0

section .text
   global main
   extern scanf
   extern printf
main:
   push rbx           ; This fixes problems 3 and 4.

   mov eax, 4
   mov ebx, 1
   mov ecx, message1
   mov edx, message1Len
   int 80h

   mov rdi, formatin
   mov rsi, number1
   mov al, 0
   call scanf

   mov eax, 4
   mov ebx, 1
   mov ecx, message2
   mov edx, message2Len
   int 80h

   mov rdi, formatin
   mov rsi, number2
   mov al, 0
   call scanf

   mov eax, [number1]
   mov ebx, [number2] 

   cmp eax, ebx
   jle end_swap
   mov [number1], ebx
   mov [number2], eax
   end_swap:

   mov ebx, [number1]
   loop:
      inc ebx
      cmp ebx, [number2]
      jge end_loop
      mov rdi, formatout   ; fix problem 1
      mov esi, ebx
      xor eax, eax   ; fix problem 6
      call printf
      jmp loop
   end_loop:

   pop rbx            ; restore caller's value
   mov rax, 0

   mov eax, 1
   mov ebx, 0
   int 80h
