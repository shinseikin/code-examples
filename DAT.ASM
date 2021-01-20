[bits 16] 

GLOBAL dat

SEGMENT code

dat: 
	mov [mybyte], byte 0x00
drop:
	mov dl,0xFF
	mov ah,0x06
	int 0x21
	jz drop
	mov [mybyte], byte al
	mov cx,1
	mov dx,mybyte
	mov ah,0x40
	int 0x21
	mov dl,[mybyte]
	mov ah,0x02
	int 0x21
	cmp dl,0x3B
	je end
	cmp dl,0x1B
	je exit
	cmp dl,0x0D
	jne drop
	mov dl,0x0A
	mov ah,0x06
	int 0x21
	mov [mybyte], byte 0x0D
	mov dx,mybyte
	mov ah,0x40
	int 0x21
	mov [mybyte], byte 0x0A
	mov dx,mybyte
	mov ah,0x40
	int 0x21
	jmp drop

end:
	mov ax,0
	ret
exit:
	mov ax,0x01
	ret

SEGMENT data


SEGMENT bss

mybyte resb 1

	SEGMENT stack stack
	resb 64
	stacktop:
