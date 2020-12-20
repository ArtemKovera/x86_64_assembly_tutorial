extern printf       ;external function printf

section .data
    
    SYS_EXIT      equ  60
    EXIT_SUCCESS  equ  0
    

    str1         db "STRING",0
    str2         db "The string is %s",10,0

section .bss

section .text
    
    global main

main:
    push rbp                    ; function prologue
    mov  rbp, rsp               ; function prologue
   

    mov rdi, str2               ; first argument for printf
    mov rsi, str1               ; second argument for printf
    mov rax, 0                  ; no xmm registers are involved
    call printf

    mov rsp,rbp                 ; function epilogue
    pop rbp                     ; function epilogue

    mov rax, SYS_EXIT
    mov rdi, EXIT_SUCCESS
    syscall



; nasm -f elf64 -o c_function_inside_assembly_code.o c_function_inside_assembly_code.asm
; gcc -o c_function_inside_assembly_code c_function_inside_assembly_code.o -no-pie 
; ./c_function_inside_assembly_code 
    

    