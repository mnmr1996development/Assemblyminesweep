JUMPS
.model tiny


.code
	org 100h
start:
	jmp realstart
	meta dw 64 dup(?)
	temp dw 64 dup(?)
	moves dw 1 dup(?)
clearscreen:
    mov ax,0b800h
    mov es,ax
    mov ax,0720h; default color (Black/White)
    mov cx,80*25
	sub di,di
l1:	
	mov es:[di],ax
	add di,2
	loop l1

	mov cx, 64
	mov bx, 0
	mov word[moves],0
initializer:
	mov word [meta+bx], 00h
	mov word [temp+bx], 00h
	mov di, 160
	add bx, 2
	loop initializer
	mov word [meta + 4], 0BDh
	mov word [meta + 44], 0BDh
	mov word [meta + 22], 0BDh
	mov word [meta + 12], 0BDh
	mov word [meta + 94], 0BDh
	mov word [meta + 112], 0BDh
	mov word [meta + 68], 0BDh
	mov word [meta + 18], 0BDh
	ret

	
hello proc 
	push bx
	cmp bx,16
	jl rm0
	cmp bx,32
	jl rm1
	cmp bx,48
	jl rm2
	cmp bx,64
	jl rm3
	cmp bx,80
	jl rm4
	cmp bx,96
	jl rm5
	cmp bx,112
	jl rm6
	jmp rm7
rm0:
	mov di, 704
	cmp bx,0
	je ch0
	cmp bx,2
	je ch1
	cmp bx,4
	je ch2
	cmp bx,6
	je ch3
	cmp bx,8
	je ch4
	cmp bx,10
	je ch5
	cmp bx,12
	je ch6
	cmp bx,14
	je ch7
rm1: 
	mov di,1024
	sub bx,16
	cmp bx,0
	je ch0
	cmp bx,2
	je ch1
	cmp bx,4
	je ch2
	cmp bx,6
	je ch3
	cmp bx,8
	je ch4
	cmp bx,10
	je ch5
	cmp bx,12
	je ch6
	cmp bx,14
	je ch7
rm2: 
	mov di,1344
	sub bx,32
	cmp bx,0
	je ch0
	cmp bx,2
	je ch1
	cmp bx,4
	je ch2
	cmp bx,6
	je ch3
	cmp bx,8
	je ch4
	cmp bx,10
	je ch5
	cmp bx,12
	je ch6
	cmp bx,14
	je ch7
rm3:
	mov di,1664
	sub bx,48
	cmp bx,0
	je ch0
	cmp bx,2
	je ch1
	cmp bx,4
	je ch2
	cmp bx,6
	je ch3
	cmp bx,8
	je ch4
	cmp bx,10
	je ch5
	cmp bx,12
	je ch6
	cmp bx,14
	je ch7
rm4: 
	mov di, 1984
	sub bx,64
	cmp bx,0
	je ch0
	cmp bx,2
	je ch1
	cmp bx,4
	je ch2
	cmp bx,6
	je ch3
	cmp bx,8
	je ch4
	cmp bx,10
	je ch5
	cmp bx,12
	je ch6
	cmp bx,14
	je ch7
rm5:
	mov di, 2304
	sub bx,80
	cmp bx,0
	je ch0
	cmp bx,2
	je ch1
	cmp bx,4
	je ch2
	cmp bx,6
	je ch3
	cmp bx,8
	je ch4
	cmp bx,10
	je ch5
	cmp bx,12
	je ch6
	cmp bx,14
	je ch7
rm6:
	mov di,2624
	sub bx,96
	cmp bx,0
	je ch0
	cmp bx,2
	je ch1
	cmp bx,4
	je ch2
	cmp bx,6
	je ch3
	cmp bx,8
	je ch4
	cmp bx,10
	je ch5
	cmp bx,12
	je ch6
	cmp bx,14
	je ch7
rm7:
	mov di,2944
	sub bx,112
	cmp bx,0
	je ch0
	cmp bx,2
	je ch1
	cmp bx,4
	je ch2
	cmp bx,6
	je ch3
	cmp bx,8
	je ch4
	cmp bx,10
	je ch5
	cmp bx,12
	je ch6
	jmp ch7
ch0: 
	add di,0
	mov ax, 01430h
	pop bx
	call aroundchecker
	mov ax, 01430h
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2
	jmp klen
ch1:
	add di,8
	mov ax, 01430h
	pop bx
	call aroundchecker
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2
	jmp klen
ch2:
	add di,16
	mov ax, 01430h
	pop bx
	call aroundchecker
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2
	jmp klen
ch3:
	add di,24
	mov ax, 01430h
	pop bx
	call aroundchecker
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2
	jmp klen
ch4:
	add di,32
	mov ax, 01430h
	pop bx
	call aroundchecker
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2
	jmp klen
ch5:
	add di,40
	mov ax, 01430h
	pop bx
	call aroundchecker
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2
	jmp klen
ch6:
	add di,48
	mov ax, 01430h
	pop bx
	call aroundchecker
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2
	jmp klen
ch7:
	add di,56
	mov ax, 01430h
	pop bx
	call aroundchecker
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2
	jmp klen
klen:	
;	cmp word[temp+bx],0
;	je killa 
	ret
;killa:
;	call recurser
	hello endp	
	
recurser proc
	cmp bx, 1
	jl pos02
	cmp bx,13
	jl topmids2
	cmp bx,15
	jl pos72
	cmp bx,17
	jl leftmids2
	cmp bx,29
	jl posnorms2
	cmp bx,31
	jl rightmids2
	cmp bx,33
	jl leftmids2
	cmp bx,45
	jl posnorms2
	cmp bx,47
	jl rightmids2
	cmp bx,49
	jl leftmids2
	cmp bx,61
	jl posnorms2
	cmp bx,63
	jl rightmids2
	cmp bx,65
	jl leftmids2
	cmp bx,77
	jl posnorms2
	cmp bx,79
	jl rightmids2
	cmp bx,81
	jl leftmids2
	cmp bx,93
	jl posnorms2
	cmp bx,95
	jl rightmids2
	cmp bx,97
	jl leftmids2
	cmp bx,109
	jl posnorms2
	cmp bx,111
	jl rightmids2
	cmp bx,113
	jl pos562
	cmp bx, 125
	jl bottommid2
	jmp pos632
	jmp finadjcheck
pos02:
	mov bx,2
	call hello
	mov bx, 16
	call hello
	mov bx, 18
	call hello
	mov bx,0	
	jmp finadjcheck2
pos562:
	mov bx,96
	call hello
	mov bx, 98
	call hello
	mov bx, 114
	call hello
	mov bx, 112
	jmp finadjcheck
pos632:
	mov bx,110
	call hello
	mov bx, 108
	call hello
	mov bx, 124
	call hello
	mov bx,126
	jmp finadjcheck
topmids2:
	sub bx,2
	call hello
	add bx, 4
	call hello
	add bx, 16
	call hello
	sub bx, 2
	call hello
	sub bx, 2
	call hello
	sub bx, 14
	jmp finadjcheck
bottommid2:
	sub bx,2
	call hello
	sub bx, 16
	call hello
	add bx, 2
	call hello
	add bx, 2
	call hello
	add bx, 16
	call hello
	sub bx, 2
	jmp finadjcheck2
pos72:
	mov bx,12
	call hello
	mov bx, 28
	call hello
	mov bx, 30
	call hello
	mov bx,14
	jmp finadjcheck2
leftmids2:
	sub bx,16
	call hello
	add bx, 2
	call hello
	add bx, 16
	call hello
	add bx, 14
	call hello
	add bx, 2
	call hello
	sub bx,18
	jmp finadjcheck2
posnorms2:
	sub bx,18
	call hello
	add bx, 2
	call hello
	add bx, 2
	call hello
	add bx, 12
	call hello
	add bx, 4
	call hello
	add bx, 12
	call hello
	add bx, 2
	call hello
	add bx, 2
	call hello
	sub bx, 18
	jmp finadjcheck2
rightmids2:
	sub bx,16
	call hello
	sub bx, 2
	call hello
	add bx, 16
	call hello
	add bx, 16
	call hello
	add bx, 2
	call hello
	sub bx,16
	jmp finadjcheck2
finadjcheck2:
	ret
	recurser endp
	
bombchecker2 proc
	cmp word [meta+bx], 0bdh
	je bombadjpos
	jmp endbombck2
bombadjpos:
	add dx,1
endbombck2:
	ret
	bombchecker2 endp

	
aroundchecker proc
	mov dx,0
	cmp bx, 2
	jl pos0
	cmp bx,14
	jl topmids
	cmp bx,16
	jl pos7
	cmp bx,18
	jl leftmids
	cmp bx,30
	jl posnorms
	cmp bx,32
	jl rightmids
	cmp bx,34
	jl leftmids
	cmp bx,46
	jl posnorms
	cmp bx,48
	jl rightmids
	cmp bx,50
	jl leftmids
	cmp bx,62
	jl posnorms
	cmp bx,64
	jl rightmids
	cmp bx,66
	jl leftmids
	cmp bx,78
	jl posnorms
	cmp bx,80
	jl rightmids
	cmp bx,82
	jl leftmids
	cmp bx,94
	jl posnorms
	cmp bx,96
	jl rightmids
	cmp bx,98
	jl leftmids
	cmp bx,110
	jl posnorms
	cmp bx,112
	jl rightmids
	cmp bx,114
	jl pos56
	cmp bx, 126
	jl bottommid
	jmp pos63
	jmp finadjcheck
pos0:
	mov bx,2
	call bombchecker2
	mov bx, 16
	call bombchecker2
	mov bx, 18
	call bombchecker2
	mov bx,0
	mov word[temp+bx],dx	
	jmp finadjcheck
pos56:
	mov bx,96
	call bombchecker2
	mov bx, 98
	call bombchecker2
	mov bx, 114
	call bombchecker2
	mov bx, 112
	mov word[temp+bx],dx
	jmp finadjcheck
pos63:
	mov bx,110
	call bombchecker2
	mov bx, 108
	call bombchecker2
	mov bx, 124
	call bombchecker2
	mov bx,126
	mov word[temp+bx],dx
	jmp finadjcheck
topmids:
	sub bx,2
	call bombchecker2
	add bx, 4
	call bombchecker2
	add bx, 16
	call bombchecker2
	sub bx, 2
	call bombchecker2
	sub bx, 2
	call bombchecker2
	sub bx, 14
	mov word[temp+bx],dx
	jmp finadjcheck
bottommid:
	sub bx,2
	call bombchecker2
	sub bx, 16
	call bombchecker2
	add bx, 2
	call bombchecker2
	add bx, 2
	call bombchecker2
	add bx, 16
	call bombchecker2
	sub bx, 2
	mov word[temp+bx],dx
	jmp finadjcheck
pos7:
	mov bx,12
	call bombchecker2
	mov bx, 28
	call bombchecker2
	mov bx, 30
	call bombchecker2
	mov bx,28
	mov word[temp+bx],dx
	jmp finadjcheck
leftmids:
	sub bx,16
	call bombchecker2
	add bx, 2
	call bombchecker2
	add bx, 16
	call bombchecker2
	add bx, 14
	call bombchecker2
	add bx, 2
	call bombchecker2
	sub bx,18
	mov word[temp+bx],dx
	jmp finadjcheck
posnorms:
	sub bx,18
	call bombchecker2
	add bx, 2
	call bombchecker2
	add bx, 2
	call bombchecker2
	add bx, 12
	call bombchecker2
	add bx, 4
	call bombchecker2
	add bx, 12
	call bombchecker2
	add bx, 2
	call bombchecker2
	add bx, 2
	call bombchecker2
	sub bx, 18
	mov word[temp+bx],dx
	jmp finadjcheck
rightmids:
	sub bx,16
	call bombchecker2
	sub bx, 2
	call bombchecker2
	add bx, 16
	call bombchecker2
	add bx, 16
	call bombchecker2
	add bx, 2
	call bombchecker2
	sub bx,16
	mov word[temp+bx],dx
	jmp finadjcheck
finadjcheck:
	ret
	aroundchecker endp

; messages
minesweeper:	
	mov di,240
    mov ax,0420h
    mov es:[di],ax
    mov es:[di+2],ax
    mov es:[di+4],ax
    mov es:[di+6],ax
    mov es:[di+8],ax
    mov es:[di+10],ax
    mov es:[di+12],ax
    mov es:[di+14],ax
    mov es:[di+16],ax
    mov es:[di+18],ax
	mov es:[di+20],ax
    mov byte ptr es:[di],'M'
    mov byte ptr es:[di+2],'I'
    mov byte ptr es:[di+4],'N'
    mov byte ptr es:[di+6],'E'
    mov byte ptr es:[di+8],'S'
    mov byte ptr es:[di+10],'W'
    mov byte ptr es:[di+12],'E'
    mov byte ptr es:[di+14],'E'
    mov byte ptr es:[di+16],'P'
    mov byte ptr es:[di+18],'E'
	mov byte ptr es:[di+20],'R'
	

;***"PRESS enter to " message***
    mov di,970
    mov byte ptr es:[di],'C'
    mov byte ptr es:[di+2],'L'
    mov byte ptr es:[di+4],'I'
    mov byte ptr es:[di+6],'C'
    mov byte ptr es:[di+8],'K'
    mov byte ptr es:[di+10],' '
    mov byte ptr es:[di+12],'T'
    mov byte ptr es:[di+14],'O'
    mov byte ptr es:[di+16],' '
    mov byte ptr es:[di+18],'M'
    mov byte ptr es:[di+20],'O'
    mov byte ptr es:[di+22],'V'
    mov byte ptr es:[di+24],'E'
	
	mov di,1286
    mov byte ptr es:[di],'W'
    mov byte ptr es:[di+2],'I'
    mov byte ptr es:[di+4],'N'
    mov byte ptr es:[di+6],' '
    mov byte ptr es:[di+8],'O'
    mov byte ptr es:[di+10],'R'
    mov byte ptr es:[di+12],' '
    mov byte ptr es:[di+14],'L'
    mov byte ptr es:[di+16],'O'
    mov byte ptr es:[di+18],'S'
    mov byte ptr es:[di+20],'E'
    
	mov di,1446
    mov byte ptr es:[di],'T'
    mov byte ptr es:[di+2],'O'
    mov byte ptr es:[di+4],' '
    mov byte ptr es:[di+6],'R'
    mov byte ptr es:[di+8],'E'
    mov byte ptr es:[di+10],'S'
    mov byte ptr es:[di+12],'T'
    mov byte ptr es:[di+14],'A'
    mov byte ptr es:[di+16],'R'
    mov byte ptr es:[di+18],'T'
	mov byte ptr es:[di+20],' '
    mov byte ptr es:[di+22],'O'
    mov byte ptr es:[di+24],'R'
    mov byte ptr es:[di+26],' '
    mov byte ptr es:[di+28],'Q'
    mov byte ptr es:[di+30],'U'
    mov byte ptr es:[di+32],'I'
	mov byte ptr es:[di+34],'T'
	mov byte ptr es:[di+36],' '
    mov byte ptr es:[di+38],'G'
    mov byte ptr es:[di+40],'A'
    mov byte ptr es:[di+42],'M'
	mov byte ptr es:[di+44],'E'

    mov di, 3590
    mov byte ptr es:[di],'D'
    mov byte ptr es:[di+2],'O'
    mov byte ptr es:[di+4],'N'
    mov byte ptr es:[di+6],'T'
    mov byte ptr es:[di+8],' '
    mov byte ptr es:[di+10],'C'
    mov byte ptr es:[di+12],'L'
    mov byte ptr es:[di+14],'I'
    mov byte ptr es:[di+16],'C'
    mov byte ptr es:[di+18],'K'
    mov byte ptr es:[di+20],' '
    mov byte ptr es:[di+22],'C'
    mov byte ptr es:[di+24],'E'
	mov byte ptr es:[di+26],'N'
    mov byte ptr es:[di+28],'T'
    mov byte ptr es:[di+30],'E'
    mov byte ptr es:[di+32],'R'
	mov byte ptr es:[di+34],' '
    mov byte ptr es:[di+36],'O'
    mov byte ptr es:[di+38],'F'
    mov byte ptr es:[di+40],' '
    mov byte ptr es:[di+42],'B'
    mov byte ptr es:[di+44],'O'
    mov byte ptr es:[di+46],'X'

    mov di, 3750
    mov byte ptr es:[di],'O'
    mov byte ptr es:[di+2],'R'
    mov byte ptr es:[di+4],' '
    mov byte ptr es:[di+6],'M'
    mov byte ptr es:[di+8],'O'
    mov byte ptr es:[di+10],'U'
    mov byte ptr es:[di+12],'S'
    mov byte ptr es:[di+14],'E'
    mov byte ptr es:[di+16],' '
    mov byte ptr es:[di+18],'W'
    mov byte ptr es:[di+20],'I'
    mov byte ptr es:[di+22],'L'
    mov byte ptr es:[di+24],'L'
	mov byte ptr es:[di+26],' '
    mov byte ptr es:[di+28],'O'
    mov byte ptr es:[di+30],'V'
    mov byte ptr es:[di+32],'E'
	mov byte ptr es:[di+34],'R'
    mov byte ptr es:[di+36],'I'
    mov byte ptr es:[di+38],'T'
    mov byte ptr es:[di+40],'E'
    mov byte ptr es:[di+42],' '
	mov byte ptr es:[di+44],'#'


toprow:	
	mov di, 540
	mov ax, 01420h
	mov cx, 8
	mov ax, 014DAh
	mov es:[di],ax
	mov ax, 014C4h
	mov bx, 014C2h
l2:
    mov es:[di+2],ax
	mov es:[di+4],ax
	mov es:[di+6],ax
	mov es:[di+8],bx
	add di, 8
	loop l2
	mov ax, 014BFh
	mov es:[di],ax
	add di,2

	
	mov cx,7
l3:
	push cx
	add di, 94
midrows2:
	
	mov ax, 014B3h
	mov bx, 01420h
	mov cx, 8
l32:
	mov es:[di],ax
	mov es:[di+2],bx
	mov es:[di+4],bx
	mov es:[di+6],bx
	add di, 8
	loop l32
	mov es:[di],ax
	add di, 2
	
midpart22:
	add di, 94
	mov ax, 014C3h 
	mov es:[di],ax
	add di,2
	mov ax, 014C4h ;horizontal pipe
	mov bx, 014C5h ; intersect pipe
	mov cx, 7

l42:
	mov es:[di],ax
	mov es:[di+2],ax
	mov es:[di+4],ax
	mov es:[di+6],bx
	add di, 8
	loop l42
	
	mov bx, 014b4h
	mov es:[di],ax
	mov es:[di+2],ax
	mov es:[di+4],ax
	mov es:[di+6],bx
	add di,8
	pop cx
	loop l3

	add di, 94
	mov cx, 8
lastrow:	
	mov ax, 014B3h
	mov bx, 01420h
	mov es:[di],ax
	mov es:[di+2],bx
	mov es:[di+4],bx
	mov es:[di+6],bx
	add di, 8
	loop lastrow
	mov es:[di],ax
	add di, 2
	
last2:
	add di, 94
	mov ax, 014C0h
	mov es:[di],ax
	add di,2
	
	mov cx, 7
	mov ax, 014c4h
	mov bx, 014c1h
lrw2:
	mov es:[di],ax
	mov es:[di+2],ax
	mov es:[di+4],ax
	mov es:[di+6],bx
	add di, 8
	loop lrw2
	mov bx, 014D9h
	mov es:[di],ax
	mov es:[di+2],ax
	mov es:[di+4],ax
	mov es:[di+6],bx
	jmp getmouse
	ret
	
	
	
	
getmouse:	
	
	mov ax,1
	int 33h
;gets where on the board was the mouse clicked and does something based off of that
MouseLP:
	;cmp word[moves], 0
	;je winner
	mov  ax, 0003h  ; get mouse position and buttonstatus
	int  33h        ; -> BX CX DX
	test bx, 1      ; check left mouse click
	jz   MouseLP    ; Loop until mouse click
here:
	cmp dx, 42 
	jle rw1
	cmp dx, 58
	jle rw2
	cmp dx, 74 
	jle rw3
	cmp dx, 90
	jle rw4
	cmp dx, 106 
	jle rw5
	cmp dx, 122
	jle rw6
	cmp dx, 138
	jle rw7
	cmp dx, 154
	jle rw8
	jmp MouseLP
rw1:
	mov bx,0
	mov di, 704	
	jmp lpend
rw2:
	mov bx,16
	mov di, 1024
	jmp lpend
rw3:
	mov bx,32
	mov di, 1344
	jmp lpend
rw4:
	mov bx,48
	mov di, 1664
	jmp lpend
rw5:
	mov bx,64
	mov di, 1984
	jmp lpend
rw6:
	mov bx,80
	mov di, 2304
	jmp lpend
rw7:
	mov bx,96
	mov di, 2624
	jmp lpend
rw8:
	mov bx,112
	mov di, 2944
	jmp lpend
lpend:
	cmp cx, 246
	jle MouseLP
	cmp cx, 278 
	jle cl1
	cmp cx, 310
	jle cl2
	cmp cx, 342
	jle cl3
	cmp cx, 374
	jle cl4
	cmp cx, 406 
	jle cl5
	cmp cx, 438
	jle cl6
	cmp cx, 470
	jle cl7
	cmp cx, 502
	jle cl8
	jmp MouseLP
cl1:
	cmp word [meta+bx],0BDh
	je loser
	call aroundchecker
	mov ax, 01430h
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2	
	cmp word[temp+bx],00h	
	jne lpend2
	call recurser
	jmp lpend2
cl2:
	add bx,2
	cmp word [meta+bx],0BDh
	je loser
	call aroundchecker
	add di, 8
	mov ax, 01430h
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2
	;add word[moves],1
	cmp word[temp+bx],00h	
	jne lpend2
	call recurser
	jmp lpend2
cl3:
	add bx,4
	cmp word [meta+bx],0BDh
	je loser
	call aroundchecker
	add di, 16
	mov ax, 01430h
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2
	;add word[moves],1
	cmp word[temp+bx],00h	
	jne lpend2
	call recurser
	jmp lpend2
cl4:
	add bx,6
	cmp word [meta+bx],0BDh
	je loser
	call aroundchecker
	add di, 24
	mov ax, 01430h
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2
	;add word[moves],1
	cmp word[temp+bx],00h	
	jne lpend2
	call recurser
	jmp lpend2
cl5:
	add bx,8
	cmp word [meta+bx],0BDh
	je loser
	call aroundchecker
	add di, 32
	mov ax, 01430h
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2
	;add word[moves],1
	cmp word[temp+bx],00h	
	jne lpend2
	call recurser
	jmp lpend2
cl6:
	add bx,10
	cmp word [meta+bx],0BDh
	je loser
	call aroundchecker
	add di, 40
	mov ax, 01430h
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2
	;add word[moves],1
	cmp word[temp+bx],00h	
	jne lpend2
	call recurser
	jmp lpend2
cl7:
	add bx,12
	cmp word [meta+bx],0BDh
	je loser
	call aroundchecker
	add di, 48
	mov ax, 01430h
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2
	;add word[moves],1
	cmp word[temp+bx],00h	
	jne lpend2
	call recurser
	jmp lpend2
cl8:
	add bx,14
	cmp word [meta+bx],0BDh
	je loser
	call aroundchecker
	add di, 56
	mov ax, 01430h
	add ax, word[temp+bx]
	mov es:[di],ax
	add di,2
	;add word[moves],1
	cmp word[temp+bx],00h	
	jne lpend2
	call recurser
	jmp lpend2
lpend2:
	;cmp word[moves], 10
	;je winner
	jmp MouseLP


	
loser:	
	mov di,3052
    mov ax,0420h
    mov es:[di+12],ax
    mov byte ptr es:[di],'P'
    mov byte ptr es:[di+2],'R'
    mov byte ptr es:[di+4],'E'
    mov byte ptr es:[di+6],'S'
    mov byte ptr es:[di+8],'S'
    mov byte ptr es:[di+10],' '
    mov byte ptr es:[di+12],'R'
    mov byte ptr es:[di+14],' '
    mov byte ptr es:[di+16],'T'
    mov byte ptr es:[di+18],'O'
    mov byte ptr es:[di+20],' '
    mov byte ptr es:[di+22],'R'
    mov byte ptr es:[di+24],'E'
    mov byte ptr es:[di+26],'S'
    mov byte ptr es:[di+28],'T'
    mov byte ptr es:[di+30],'A'
    mov byte ptr es:[di+32],'R'
    mov byte ptr es:[di+34],'T'
		
	mov di,3212
	mov es:[di+12],ax
    mov byte ptr es:[di],'P'
    mov byte ptr es:[di+2],'R'
    mov byte ptr es:[di+4],'E'
    mov byte ptr es:[di+6],'S'
    mov byte ptr es:[di+8],'S'
    mov byte ptr es:[di+10],' '
    mov byte ptr es:[di+12],'Q'
    mov byte ptr es:[di+14],' '
    mov byte ptr es:[di+16],'T'
    mov byte ptr es:[di+18],'O'
    mov byte ptr es:[di+20],' '
    mov byte ptr es:[di+22],'Q'
    mov byte ptr es:[di+24],'U'
    mov byte ptr es:[di+26],'I'
    mov byte ptr es:[di+28],'T'
	
	mov di,1772
    mov byte ptr es:[di],'L'
    mov byte ptr es:[di+2],'O'
    mov byte ptr es:[di+4],'S'
    mov byte ptr es:[di+6],'E'
    mov byte ptr es:[di+8],'R'
    mov byte ptr es:[di+10],' '
what:	
	mov ah,00h
    int 16h
    cmp al,'q'
    je quitter
    cmp al,'r'
	je realstart
	jmp what

winner:
	mov di,3052
    mov ax,0420h
    mov es:[di+12],ax
    mov byte ptr es:[di],'P'
    mov byte ptr es:[di+2],'R'
    mov byte ptr es:[di+4],'E'
    mov byte ptr es:[di+6],'S'
    mov byte ptr es:[di+8],'S'
    mov byte ptr es:[di+10],' '
    mov byte ptr es:[di+12],'R'
    mov byte ptr es:[di+14],' '
    mov byte ptr es:[di+16],'T'
    mov byte ptr es:[di+18],'O'
    mov byte ptr es:[di+20],' '
    mov byte ptr es:[di+22],'R'
    mov byte ptr es:[di+24],'E'
    mov byte ptr es:[di+26],'S'
    mov byte ptr es:[di+28],'T'
    mov byte ptr es:[di+30],'A'
    mov byte ptr es:[di+32],'R'
    mov byte ptr es:[di+34],'T'
		
	mov di,3212
	mov ax,0420h
    mov es:[di+12],ax
    mov byte ptr es:[di],'P'
    mov byte ptr es:[di+2],'R'
    mov byte ptr es:[di+4],'E'
    mov byte ptr es:[di+6],'S'
    mov byte ptr es:[di+8],'S'
    mov byte ptr es:[di+10],' '
    mov byte ptr es:[di+12],'Q'
    mov byte ptr es:[di+14],' '
    mov byte ptr es:[di+16],'T'
    mov byte ptr es:[di+18],'O'
    mov byte ptr es:[di+20],' '
    mov byte ptr es:[di+22],'Q'
    mov byte ptr es:[di+24],'U'
    mov byte ptr es:[di+26],'I'
    mov byte ptr es:[di+28],'T'
	
	mov di,1772
    mov byte ptr es:[di],'W'
    mov byte ptr es:[di+2],'I'
    mov byte ptr es:[di+4],'N'
    mov byte ptr es:[di+6],'N'
    mov byte ptr es:[di+8],'E'
    mov byte ptr es:[di+10],'R'
	jmp what
	
realstart:
	call clearscreen
	call minesweeper
quitter:
	mov ax, 4c00h
	int 21h
end start