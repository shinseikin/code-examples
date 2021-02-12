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

	mov ch,0x00
	mov bx,0x00
numone:	
	mov dl,0xFF
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
	mov ax,[mybyte]
	call convert
	mov cl,ch
	rol bx,cl
	rol bx,cl
	rol bx,cl
	rol bx,cl
	add bx,ax
	inc ch
	cmp ch,0x05
	jb numone
	mov [inputone], word bx

	mov bx,0x00
	mov ch,0x00
numtwo:	
	mov dl,0xFF
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
	mov ax,[mybyte]
	call convert
	mov cl,ch
	rol bx,cl
	rol bx,cl
	rol bx,cl
	rol bx,cl
	add bx,ax
	inc ch
	cmp ch,0x05
	jb numtwo
	mov [inputtwo], word bx

	; here is the addition
	mov ax, word [inputone]
	mov bx, word [inputtwo]
	add ax,bx
	mov [output], word ax

	mov cx,ax
	shr cx,12
	mov bx,hexdgt
	mov di,cx
	mov dl, byte [bx+di]
	mov ah,0x02
	int 0x21
	mov cx, word [output]
	rol cx,4
	shr cx,12
	mov di,cx
	mov dl, byte [bx+di]
	mov ah,0x02
	int 0x21
	mov cx, word [output]
	rol cx,8
	shr cx,12
	mov di,cx
	mov dl, byte [bx+di]
	mov ah,0x02
	int 0x21
	mov cx, word [output]
	rol cx,12
	shr cx,12
	mov di,cx
	mov dl, byte [bx+di]
	mov ah,0x02
	int 0x21
	


	; boiler plate below
	mov ax,04C00H
	int 21H

SEGMENT data

hexdgt db "0123456789ABCDEF",'$'
inputone dw 1
inputtwo dw 1

SEGMENT bss

mybyte resb 1
count resb 1
output resw 1

	SEGMENT stack stack
	resb 64
	stacktop:
