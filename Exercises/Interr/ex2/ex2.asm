;Sa se citeasca cate un caracter de la tastatura, fara ecou. Daca este cifra, sa se tipareasca pe ecran, daca este caracterul '$', se termina programul, in orice alta situatie se adauga caracterul intr-un buffer care se va tipari in final pe ecran.

assume cs:text,ds:data
data SEGMENT

data ENDS
text SEGMENT

	start:

	MOV AX, data
	MOV DS, AX

	JMP begin_program
	
	non_digit:
	PUSH AX
	INC CX
	JMP continue
	
	begin_program:
	XOR CX, CX
	read_while:
	MOV AH, 08h
	INT 21h
	;al<-caracter citit
	
	CMP AL, '$'
	JE skip
	
	CMP AL,'0'
	JL non_digit
	CMP AL, '9'
	JG non_digit
	
	MOV AH, 02h
	MOV DL, AL
	INT 21h
	continue:
	JMP read_while
	
	skip:
	MOV AH, 02h

	loop_non_digit:
	POP DX
	INT 21h
	loop loop_non_digit
	
	
	


	mov ax, 4C00h;
	int 21h
text ENDS
END start
