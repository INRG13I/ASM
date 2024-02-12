;z=1/(a*a+b*b-5)+2/(a*a-b*b+4)
assume cs:text,ds:data
data SEGMENT

a db 2
b db 3

z dw ?


data ENDS
text SEGMENT

	start:

	MOV AX, data
	MOV DS, AX

	MOV AL, a
	MUL a
	MOV BX, AX
	MOV AL, b
	MUL b
	ADD AX, BX
	SUB AX, 5
	MOV BX, AX
	MOV AX, 1
	CWD
	DIV BX
	MOV z, AX
	MOV AL, a
	MUL a
	MOV BX, AX
	MOV AL, b
	MUL b
	SUB BX, AX
	ADD BX, 4
	MOV AX, 2
	CWD
	DIV BX
	ADD AX, z
	MOV z, AX	
	
	mov ax, 4C00h;
	int 21h
text ENDS
END start
