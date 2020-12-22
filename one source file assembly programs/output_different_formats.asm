; this simple program demonstrates outputting numbers in different formats using printf 

extern printf

section .data

    
    str1          db "Signed integer  %d",10,0
    str2          dd -95

    str3          db "Floating-point number (hexadecimal notation) %a",10,0
    str4          dq 0x1234

    str5          db "Floating-point number (e-notation) %e",10,0
    str6          dq 10.005

    str7          db "Character %c",10,0
    str8          db "S"

    str9          db "Floating-point number (decimal notation) %f",10,0
    str10         dq 254.0579

    str11         db "Unsigned decimal integer %u",10,0 
    str12         dd 47

    str13         db "Unsigned decimal integer %u",10,0 
    str14         dd -1

    str15         db "Unsigned hexadecimal integer %x",10,0 
    str16         dd 16   

    str17         db "Unsigned hexadecimal integer %x",10,0 
    str18         dd 0xff 

    str19         db "Signed Long Long integer %lld",10,0
    str20         dq -78917912021552354

section .bss


section .text
    global main

main:
    push rbp                               ;function prologue
    mov  rbp, rsp                          ;function prologue
    
    mov rdi, str1                          
    mov rsi, [str2]                        
    mov rax, 0                             ; no xmm registers are involved
    call printf 

    mov rdi, str7                          
    mov rsi, [str8]                        
    mov rax, 0                             ; no xmm registers are involved
    call printf 


    mov rax, 1                             ; 1 xmm register involved
    movq xmm0, [str4]
    mov  rdi, str3
    call printf

    mov rax, 1                             ; 1 xmm register involved
    movq xmm0, [str6]
    mov  rdi, str5
    call printf

    mov rax, 1                             ; 1 xmm register involved
    movq xmm0, [str10]
    mov  rdi, str9
    call printf 

    mov rdi, str11                          
    mov rsi, [str12]                        
    mov rax, 0                             ; no xmm registers are involved
    call printf        

    mov rdi, str13                          
    mov rsi, [str14]                        
    mov rax, 0                             ; no xmm registers are involved
    call printf                

    mov rdi, str15                          
    mov rsi, [str16]                        
    mov rax, 0                             ; no xmm registers are involved
    call printf    

    mov rdi, str17                          
    mov rsi, [str18]                        
    mov rax, 0                             ; no xmm registers are involved
    call printf        
    
    mov rdi, str19                          
    mov rsi, [str20]                        
    mov rax, 0                             ; no xmm registers are involved
    call printf    

    mov rsp,rbp                            ; function epilogue
    pop rbp                                ; function epilogue
    ret

; nasm -f elf64 -o output_different_formats.o output_different_formats.asm 
; gcc -o output_different_formats output_different_formats.o -no-pie
; ./output_different_formats