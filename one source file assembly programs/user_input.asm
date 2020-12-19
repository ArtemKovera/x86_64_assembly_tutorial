section .data
    SYS_WRITE    equ  1
    SYS_READ     equ  0
    SYS_EXIT     equ  60
    STDOUT       equ  1
    STDIN        equ  0
    EXIT_SUCCESS equ  0
    LENGTH1      equ  20
    LENGTH2      equ  12 
    INPUTLENGTH  equ  25

    text1         db  "Please enter a word "
    text2         db  "You entered "

section .bss
    wordEntered resb INPUTLENGTH

section .text
    global _start

_start:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, text1
    mov rdx, LENGTH1
    syscall

    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, wordEntered
    mov rdx, INPUTLENGTH
    syscall

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, text2
    mov rdx, LENGTH2
    syscall

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, wordEntered
    mov rdx, INPUTLENGTH
    syscall

    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall


   ;nasm -f elf64 -o input.o user_input2.asm
   ;ld -o input input.o