;Se da un sir de octeti S de lungime l. Sa se construiasca sirul D de lungime l-1 astfel incat elementele din D sa reprezinte produsul dintre fiecare 2 elemente consecutive S(i) si S(i+1) din S. 
;Exemplu:
;S: 1, 2, 3, 4
;D: 2, 6, 12
assume cs:text,ds:data
data SEGMENT

s db 1,2,3,4
ls equ $-s
d dw ls-1 dup(?)

data ENDS
text SEGMENT

	start:

	MOV AX, data
	MOV DS, AX

	MOV CX, ls 
	XOR SI,SI
	XOR DI,DI

	repeta:
	MOV AL, [s+SI]
	MUL [s+SI+1]
	MOV [d+DI], AX
	INC SI
	ADD DI, 2
	loop repeta
	
	
	mov ax, 4C00h;
	int 21h
text ENDS
END start
