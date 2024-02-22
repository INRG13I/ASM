;Sa se citeasca de la tastatura un sir de caractere S si sa se inlocuiasca toate caracterele speciale cu simbolul '%'. Sa se afiseze sirul pe ecran.

assume cs:text,ds:data
data SEGMENT

s db 100 dup(?)
ls db $-s

data ENDS
text SEGMENT

	start:

	MOV AX, data
	MOV DS, AX


	MOV CL, ls
	XOR DI,DI
	JMP program_begin	


	non_digit:

	CMP AL,'A'
	JB not_gud
		
	CMP AL, 'Z'
	JA non_big_char
	JBE just_print
	JMP continue


	non_big_char:
	CMP AL,'a'
        JB not_gud

        CMP AL, 'z'
        JBE just_print
        JMP continue

	just_print:
	MOV AH,02h
	MOV DL,AL
	INT 21h
	JMP continue

	not_gud:
	MOV AL,'%'
	JMP just_print




	program_begin:
	repeta:
	
	MOV AH, 08h
	INT 21h


	CMP AL,'z'
	JA not_gud
	CMP AL,'0'
	JB not_gud



	CMP AL,'9'
	JB just_print
	JA non_digit




	continue:
	INC SI

	loop repeta

	
	mov ax, 4C00h;
	int 21h
text ENDS
END start
