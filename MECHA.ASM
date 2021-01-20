[bits 16] 

GLOBAL ..start

EXTERN dat

SEGMENT code

..start: 

	mov ax,data
	mov ds,ax
	mov ax,stack
	mov ss,ax
	mov ax,stacktop
	mov sp,ax
	; boiler plate above
	
	mov cx,2
	mov dx,filename
	mov ah,0x3C
	int 0x21

	mov al,2
	mov dx,filename
	mov ah,0x3D
	int 0x21

	
	mov bx,ax
shoe:	mov cx,2
	mov dx, numerals
	mov ah,9
	int 0x21
	mov dx,newline
	mov ah,9
	int 0x21 
	call dat
	cmp ax,0x00
	jz shoe

	mov ah,3Eh
	int 21h

        ; boiler plate below
	mov ax,04C00H
	int 21H
SEGMENT data

filename db "DAT.TXT",13,10,'$'
numerals db "DAT-1234",13,10,'$'
newline db 13,10,'$'

SEGMENT bss

handle resw 1
iter resw 1

	SEGMENT stack stack
	resb 64
	stacktop:
