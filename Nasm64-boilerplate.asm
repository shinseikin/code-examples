; nasm -f elf64 Nasm64-boilerplate.asm -o test.o
; ld test.o -e _main -o test
; BSD 2 clause license 

[bits 64]

.GLOBAL:
extern _main

SECTION code
_main:
    mov rax, dat
    mov rax, dat
    mov ds, rax
    mov rax, stack
    mov ss, rax
    mov rax, stacktop
    mov rsp, rax
    ; boilerplate above do not edit.

    ; boilerplate below do not edit
    push 127
    mov ah,1
    int 0x80

SECTION data
dat:

SECTION dummy
stack:     RESB 160
     stacktop:
