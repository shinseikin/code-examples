[bits 16]

SEGMENT code

GLOBAL convert

convert:
	cmp ax,0x30
	jne taga
	mov ax,0x00
	ret
taga:	cmp ax,0x31
	jne tagb
	mov ax,0x01
	ret
tagb:	cmp ax,0x32
	jne tagc
	mov ax,0x02
	ret
tagc:	cmp ax,0x33
	jne tagd
	mov ax,0x03
	ret
tagd:	cmp ax,0x34
	jne tage
	mov ax,0x04
	ret
tage:	cmp ax,0x35
	jne tagf
	mov ax,0x05
	ret
tagf:	cmp ax,0x36
	jne tagg
	mov ax,0x06
	ret
tagg:	cmp ax,0x37
	jne tagh
	mov ax,0x07
	ret
tagh:	cmp ax,0x38
	jne tagi
	mov ax,0x08
	ret
tagi:	cmp ax,0x39
	jne tagj
	mov ax,0x09
	ret
tagj:	cmp ax,0x41
	jne tagk
	mov ax,0x0A
	ret
tagk:	cmp ax,0x42
	jne tagl
	mov ax,0x0B
	ret
tagl:	cmp ax,0x43
	jne tagm
	mov ax,0x0C
	ret
tagm:	cmp ax,0x44
	jne tagn
	mov ax,0x0D
	ret
tagn:	cmp ax,0x45
	jne tago
	mov ax,0x0E
	ret
tago:	cmp ax,0x46
	jne end
	mov ax,0x0F
	ret
end:	
	ret
SEGMENT data

SEGMENT bss
