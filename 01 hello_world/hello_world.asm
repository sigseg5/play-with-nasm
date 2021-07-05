; code
section .text
global _start
_start:
    mov edx, msglen
    mov ecx, msg
    mov ebx, 1 ; STDOUT file descriptor
    mov eax, 4 ; sys_write syscall number
    
    ; interrupt and call for Linux kernel.
    ; The kernel is notified about which system call the program wants to make, by examining the value in the register %eax
    ; Each system call have different requirements about the use of the other registers.
    
    ; https://www.tutorialspoint.com/assembly_programming/assembly_system_calls.htm
    ; %eax    Name         %ebx           %ecx            %edx        %esx   %edi
    ; 4       sys_write    unsigned int   const char *    size_t      -      -
    int 0x80 
    
    ; Value of 1 in %eax means a system call of exit(), and the value in %ebx holds the value of the status code for exit().
    mov eax, 1
    int 0x80
    

; initialized data and constants
section.data:
; db — allocate 8 bits (BYTE[ptr]), register 'al'
; 0xa — 0xd=10, also known as line feed (LF)
; 0xa — 0xd=13, also known as carriage return (CR)
msg db 'Hello, nasm!', 0xA

; EQU defines a symbol to a given constant value:
; when EQU is used, the source line must contain a label.
; The action of EQU is to define the given label name to the value of its (only) operand.
; This definition is absolute, and cannot change later.

; defines 'msglen' to be the constant 12
; $ is the address of the current position before emitting the bytes (if any) for the line it appears on.
; '$ - msglen' is like doing here - msg,
; i.e. the distance in bytes between the current position (at the end of the string)
; and the start of the string.
msglen equ $ - msg
