[bits 16]

SEGMENT code

EXTERN convert

..start: 

	mov ax,data
	mov ds,ax
	mov ax,stack
	mov ss,ax
	mov ax,stacktop
	mov sp,ax
	; boiler plate above

	push fouth
	push third
	push secnd
	push first

numone:	mov dl,0xFF
	mov ah,0x06
	int 0x21
	jz numone
	mov [mybyte], byte al
	mov dl,[mybyte]
	mov ah,0x02
	int 0x21
	cmp [mybyte], byte 0x0D
	jne next
	mov dl, byte 0x0A
	mov ah,0x02
	int 0x21
next:
	pop cx
	mov ax,[mybyte]
	call convert
	mov bx,ax
mult:	add dx,cx
	dec bx
	cmp bx,0x00
	jnz mult
	cmp cx,0x001
	jne numone
	mov [inputone], word dx

	push fouth
	push third
	push secnd
	push first

numtwo:	mov dl,0xFF
	mov ah,0x06
	int 0x21
	jz numtwo
	mov [mybyte], byte al
	mov dl,[mybyte]
	mov ah,0x02
	int 0x21
	cmp [mybyte], byte 0x0D
	jne nxt
	mov dl, byte 0x0A
	mov ah,0x02
	int 0x21
nxt:
	pop cx
	mov ax,[mybyte]
	call convert
	mov bx,ax
mlt:	add dx,cx
	dec bx
	cmp bx,0x00
	jnz mlt
	cmp cx,0x0001
	jne numtwo
	mov [inputtwo], word dx

	; here is the addition
	mov ax, word [inputone]
	add ax, word [inputtwo]

	; print output
	mov cx,0x00
	push fouth
	push third
	push secnd
	push first
column: 
	pop bx
mod:	sub ax,bx
	inc cx
	cmp ax,bx
	ja mod
	push ax
	mov bx,hexdgt
	add bx,cx
	mov dl,byte [bx]
	mov ah,0x02
	int 0x21
	pop ax
	cmp ax,0x00
	jnz column
	
	; boiler plate below
	mov ax,04C00H
	int 21H

SEGMENT data
hexdgt db "0123456789ABCDEF",'$'
inputone dw 1
inputtwo dw 1
first dw 0x1000
secnd dw 0x0100
third dw 0x0010
fouth dw 0x0001
SEGMENT bss
mybyte resb 1
	SEGMENT stack stack
	resb 64
	stacktop:
