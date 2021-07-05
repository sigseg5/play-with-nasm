section .text
  global _start

_start: 
  mov eax, 4
  mov ebx, 1
  mov ecx, wlcm_msg
  mov edx, wlc_len
  int 0x80

  ; %eax  Name    %ebx            %ecx     %edx     %esx   %edi
  ; 3   sys_read  unsigned int    char *   size_t   -      -
  mov eax, 3
  mov ebx, 0 ; STDIN descriptor
  mov ecx, buff
  mov edx, 64 ; size for read
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, out_msg
  mov edx, out_len
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, buff
  mov edx, 64 ;size for write
  int 0x80

  ; ret
  mov eax, 1
  int 0x80

section .data
  wlcm_msg db "Please enter a msg:", 0xA
  wlc_len equ $ - wlcm_msg
  out_msg db "You entered this: "
  out_len equ $ - out_msg

; buffer: resb 64 ; reserve 64 bytes
; wordvar: resw 1 ; reserve a word
; realarray resq 10 ; array of ten reals
; ymmval: resy 1 ; one YMM register
; zmmvals: resz 32 ; 32 ZMM registers

section .bss ; buff mem for vars, initialized by zeros
  buff resb 64 ; request N-bytes
