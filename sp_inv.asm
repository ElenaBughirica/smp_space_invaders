BITS 16

cli
mov	ax, 0x0000
mov	ss, ax
mov	sp, 0xFFFF
sti

mov	ax, 2000h
mov	ds, ax
mov	es, ax
mov	fs, ax
mov	gs, ax

jmp start
len dw 0				;lungimea liniei
cdr dw 50
cdp dw 0
felicitari db 'Felicitari! ai castigat', 13, 10, 0
start:
    mov ax, cs          ; ma asigur ca DS = CS
    mov ds, ax
    
	call set_graphics_mode
	

	drw:
		mov cx,0
		mov dx,50
		loop:
			call set_graphics_mode
			call draw_porc
			push dx
			push cx
			mov word [cdp],cx
			call read_kbd
			call draw_space;nu lucreaza cu stiva curenta
			pop cx
			pop dx
			call delay
			inc cx
			cmp cx,290
			je drw
			jmp loop
		
	hlt



halt:
    cli
    hlt                 ; gata! de aici încolo sunt date

set_graphics_mode:
	push ax				;salvez registrul ax
	mov ah,00h			;setez mod grafic
	mov al,0x13			;setez rezolutia
	int 10h
	pop ax				;recuperez registrul ax
	ret
	
draw_h_line:			;cx coordonata x start (stanga) dx coodronata y start len lungimea liniei
	    mov bx,cx        
	    add bx,[len]
	u2: 
		mov al, 15      ; white
		mov ah, 0ch    ; put pixel
		int 10h
		;call delay
		inc cx
		cmp cx, bx
		jb u2
	ret
draw_pix:

	mov ah, 0ch
	int 10h
	ret
	
draw_porc:;cx coordonata x stanga sus dx, coordonata y stanga sus
	mov al,4
	push dx
	push cx
	;prima linie
	add cx,12
	call draw_pix
	inc cx ;13
	call draw_pix
	inc cx ;14
	call draw_pix
	inc cx ;15
	call draw_pix
	inc cx ;16
	call draw_pix
	inc cx ;17
	call draw_pix
	inc cx ;18
	call draw_pix
	;a doua linie
	inc dx
	pop cx
	push cx;salvare referinta
	add cx,9
	call draw_pix
	inc cx
	call draw_pix
	inc cx 
	call draw_pix
	add cx,8
	call draw_pix
	inc cx
	call draw_pix
	inc cx
	call draw_pix
	inc cx
	call draw_pix
	;linia 3
	inc dx
	pop cx
	push cx ; salvare referinta
	add cx,7
	call draw_pix
	inc cx
	call draw_pix
	add cx,15
	call draw_pix
	;linia 4
	inc dx
	pop cx
	push cx; salvare referinta
	add cx,5
	call draw_pix
	inc cx
	call draw_pix
	add cx,18
	call draw_pix
	inc cx
	call draw_pix
	;linia 5
	inc dx
	pop cx
	push cx ; salvare referinta
	add cx,4
	call draw_pix
	add cx,22
	call draw_pix
	;linia 6
	inc dx
	pop cx
	push cx;salvare referinta
	add cx,3
	call draw_pix
	add cx,24
	call draw_pix
	;linia 7
	inc dx
	pop cx
	push cx; salvare referinta
	add cx,2
	call draw_pix
	add cx,26
	call draw_pix
	;linia 8
	inc dx
	pop cx
	push cx;salvare referinta
	inc cx
	call draw_pix
	add cx,28
	call draw_pix
	;linia 9
	inc dx
	pop cx
	push cx;salvare referinta
	inc cx
	call draw_pix
	add cx,28
	call draw_pix
	;linia 10
	inc dx
	pop cx
	push cx;salvare referinta
	inc cx
	call draw_pix
	;ochi
	mov al,2
	add cx,6
	call draw_pix
	inc cx
	call draw_pix
	add cx,14
	call draw_pix
	inc cx
	call draw_pix
	mov al,4
	;endochi
	add cx,6
	call draw_pix
	;linia 11
	inc dx
	pop cx
	push cx;salvare referinta
	;verde
	mov al,2
	call draw_pix
	add cx,7
	call draw_pix
	inc cx
	call draw_pix
	add cx,14
	call draw_pix
	inc cx
	call draw_pix
	add cx,7
	call draw_pix
	;linia 12
	inc dx
	pop cx
	push cx;salvare referinta
	call draw_pix
	mov al,9 ;albastru-nas
	add cx,12
	call draw_pix
	inc cx
	call draw_pix
	inc cx
	call draw_pix
	inc cx
	call draw_pix
	inc cx
	call draw_pix
	inc cx
	call draw_pix
	inc cx
	call draw_pix
	mov al,2
	add cx,12
	call draw_pix
	;linia 13
	inc dx
	pop cx
	push cx;salvare referinta
	call draw_pix
	mov al,9 ;albastru
	add cx,12
	call draw_pix
	add cx,6
	call draw_pix
	mov al,2
	add cx,12
	call draw_pix
	;linia 14
	inc dx
	pop cx
	push cx;salvare referinta
	call draw_pix
	mov al,9
	add cx,12
	call draw_pix
	add cx,2
	call draw_pix
	add cx,2
	call draw_pix
	add cx,2
	call draw_pix
	mov al,2
	add cx,12
	call draw_pix
	;linia 15
	inc dx
	pop cx
	push cx;salvare referinta
	call draw_pix
	mov al,9
	add cx,12
	call draw_pix
	add cx,6
	call draw_pix
	mov al,2
	add cx,12
	call draw_pix
	;linia 16
	inc dx
	pop cx
	push cx;salvare referinta
	call draw_pix
	mov al,9
	add cx,12
	call draw_pix
	inc cx
	call draw_pix
	inc cx
	call draw_pix
	inc cx
	call draw_pix
	inc cx
	call draw_pix
	inc cx
	call draw_pix
	inc cx
	call draw_pix
	mov al,2
	add cx,12
	call draw_pix
	;linia 17
	inc dx
	pop cx
	push cx;salvare referinta
	mov al,4
	inc cx
	call draw_pix
	add cx,28
	call draw_pix
	;linia 18
	inc dx
	pop cx
	push cx;salvare referinta
	inc cx
	call draw_pix
	mov al,6
	add cx,12
	call draw_pix
	inc cx
	call draw_pix
	add cx,3
	call draw_pix
	inc cx
	call draw_pix
	mov al,4
	add cx,11
	call draw_pix
	;linia 19
	inc dx
	pop cx
	push cx;salvare referinta
	add cx,2
	call draw_pix
	mov al,6
	add cx,11
	call draw_pix
	inc cx
	call draw_pix
	add cx,3
	call draw_pix
	inc cx
	call draw_pix
	mov al,4
	add cx,11
	call draw_pix
	;linia 20
	inc dx
	pop cx
	push cx;salvare referinta
	add cx,3
	call draw_pix
	add cx,10
	mov al,6
	call draw_pix
	inc cx
	call draw_pix
	add cx,3
	call draw_pix
	inc cx
	call draw_pix
	mov al,4
	add cx,10
	call draw_pix
	;linia 21
	inc dx
	pop cx
	push cx;salvare referinta
	add cx,4
	call draw_pix
	mov al,6
	add cx,9
	call draw_pix
	add cx,5
	call draw_pix
	mov al,4
	add cx,9
	call draw_pix
	;linia 22
	inc dx
	pop cx
	push cx;salvare referinta
	add cx,5
	call draw_pix
	inc cx
	call draw_pix
	mov al,6
	add cx,7
	call draw_pix
	add cx,5
	call draw_pix
	mov al,4
	add cx,7
	call draw_pix
	inc cx
	call draw_pix
	;linia 23
	inc dx
	pop cx
	push cx;salvare referinta
	add cx,7
	call draw_pix
	inc cx
	call draw_pix
	add cx,15
	call draw_pix
	inc cx
	call draw_pix
	;linia 24
	inc dx
	pop cx
	push cx;salvare referinta
	add cx,9
	call draw_pix
	inc cx
	call draw_pix
	inc cx
	call draw_pix
	add cx,9
	call draw_pix
	inc cx
	call draw_pix
	inc cx
	call draw_pix
	;linia 25
	inc dx
	pop cx
	push cx;salvare referinta
	add cx,12
	call draw_pix
	inc cx ;13
	call draw_pix
	inc cx ;14
	call draw_pix
	inc cx ;15
	call draw_pix
	inc cx ;16
	call draw_pix
	inc cx ;17
	call draw_pix
	inc cx ;18
	call draw_pix
	inc cx
	call draw_pix
	pop cx
	pop dx
	ret
	
draw_space:
	mov cx,[cdr];;coordonata x a navei la momentul curent
	mov dx,192
	mov al,0xF
	push dx ;coloana
	push cx ;linie
	;prima linie
	add cx,9
	call draw_pix
	inc cx
	call draw_pix
	;linia doi
	inc dx
	pop cx
	push cx
	add cx,8
	mov word [len],4
	call draw_h_line
	;linia 3
	inc dx
	pop cx
	push cx
	add cx,6
	mov word [len],8
	call draw_h_line
	;linia 4
	inc dx
	pop cx
	push cx
	add cx,4
	mov word [len],12
	call draw_h_line
	;linia 5
	inc dx
	pop cx
	push cx
	add cx,2
	mov word [len],16
	call draw_h_line
	;linia 6
	inc dx
	pop cx
	push cx
	mov word[len],20
	call draw_h_line
	pop cx
	pop dx
    ret	
	
delay:
	push cx ;save registers
	push dx
	push ax
	MOV     CX, 00h ;number of microseconds 186a0- 0.1 s
	MOV     DX, 86a0h
	MOV     AH, 86h ;wait  (interrupt 15)
	INT     15h		;interrupt 15
	pop ax ;restore registers
	pop dx
	pop cx
	ret	

inc_cdr: ;;incrementare coodronata nava 
	mov ah,0
	int 21h
	cmp word [cdr],300
	ja ic
	add word [cdr],3
	ic:
	ret

read_kbd:;citeste de la tastatura statusul bufferului de intrare
	mov ah,0x01
	int 16h
	jnz rd
	ret

rd:;;citeste din buffer tasta apasata, si compara cu tastele jocului
	mov ah,00h
	int 16h
	cmp ah,77
	je inc_cdr
	cmp ah,75
	je dec_cdr
	cmp ah,72
	je raycast
	ret

dec_cdr:;decrementare coordonata nava
	mov ah,0
	int 21h
	cmp word [cdr],3
	jb dc
	sub word [cdr],3
	dc:
	ret

raycast:;cx ultimul in stiva
	mov cx,word [cdp]
	mov ax,word [cdr]
	add ax,10 ;pozitionare varf nava
	cmp ax,cx
	ja rc1
	ret
	rc1:
		add cx,30
		cmp ax,cx
		jb prt_win
	ret
	
prt_win:
	MOV AH, 0x0E 
	MOV BH, 0x00 
	MOV BL, 0x02 
	MOV SI, felicitari 
	CALL PrintString
	hlt
	ret
	
PrintString:
.next_char:
MOV AL, [SI] 
OR AL, AL
JZ .exit_char
INT 0x10 
INC SI 
JMP .next_char
.exit_char:
hlt

	