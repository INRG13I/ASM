;sa ne afisam numele intreg pe ecran

;Nicolaescu Raoul-Gabriel

assume cs:text,ds:data
data SEGMENT

s db 'N','i','c','o','l','a','e','s','c','u',' ','R','a','o','u','l','-','G','a','b','r','i','e','l'
ls equ $-s

data ENDS
text SEGMENT

	start:

	MOV AX, data
	MOV DS, AX

	XOR SI,SI
	MOV CX,ls

	repeta:
	MOV AH, 02h
	MOV DL, byte ptr s+si
	int 21h
	INC SI
	loop repeta
	
	mov ax, 4C00h;
	int 21h
text ENDS
END start
