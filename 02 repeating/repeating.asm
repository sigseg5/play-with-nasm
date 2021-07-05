section .text
global _start
_start:    
    ; %eax (syscall num)    Name         %ebx (file descriptor)    %ecx (str)        %edx        %esx   %edi
    ; 4                     sys_write    unsigned int              const char *      size_t      -      -
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_len
    int 0x80
    
    ; reassign values to registers after interrupt
    mov eax, 4
    mov ebx, 1
    mov ecx, star_symbols
    mov edx, stars_len
    int 0x80
    
    ; or just use 'ret' to correct exit
    mov eax, 1
    int 0x80
    
section.data:
msg db "Displaying some '*' symbol", 0xA
msg_len equ $ - msg
; 'times' docs https://nasm.us/doc/nasmdoc3.html
star_symbols times 27 db "*"
stars_len equ $ - star_symbols
