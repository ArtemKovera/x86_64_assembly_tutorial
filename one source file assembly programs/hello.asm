section .data
    SYS_WRITE    equ  1
    SYS_EXIT     equ  60
    STDOUT       equ  1
    EXIT_SUCCESS equ  0
    LENGTH       equ  15
    

    text         db  "Hello, World!",10,0

section .bss

section .text
    
    global _start
    _start:

    mov  rax, SYS_WRITE                  
    mov  rdi, STDOUT
    mov  rsi, text
    mov  rdx, LENGTH
    syscall                               ;display the string

    mov  rax, SYS_EXIT
    mov  rdi, EXIT_SUCCESS
    syscall                               ;quit

    
    ; nasm -f elf64 -o hello.o hello.asm
    ; ld hello.o -o hello
    ; ./hello