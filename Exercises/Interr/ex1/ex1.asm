;Se da un sir de octeti in segmentul de date. Sa se afiseze elementele acestui sir la iesirea standard (ecran) in baza 2.

assume cs:text,ds:data
data SEGMENT

s db 1, 2, 3, 4
ls equ $-s




data ENDS
text SEGMENT

	start:

	MOV AX, data
	MOV DS, AX

	MOV CX, ls
	XOR SI, SI

	for:
	MOV BL, byte ptr [s + SI]
	PUSH CX
	MOV CX, 8
	for_loop:
	XOR DL, DL
	SHL BL,1
	ADC DL, '0' 
	MOV AH,02h
	INT 21h
	loop for_loop

	MOV DL, ' '
	MOV AH, 02h
	int 21h 
	
	POP CX
	INC SI	
	loop for

	
	mov ax, 4C00h;
	int 21h
text ENDS
END start
