;Se da un sir de cuvinte s. Sa se construiasca sirul de octeti d, astfel incat d sa contina pentru fiecare pozitie din s:
;- numarul de biti de 0, daca numarul este negativ
;- numarul de biti de 1, daca numarul este pozitiv
;Exemplu:
;s: -22, 145, -48, 127
;in binary: 
;1111111111101010, 10010001, 1111111111010000, 1111111
;d: 3, 3, 5, 7

assume cs:text,ds:data
data SEGMENT

s dw -22, 145, -48, 127

ls equ ($-s)/2

d db ls dup(?) 

data ENDS
text SEGMENT

	start:

	MOV AX, data
	MOV DS, AX

	;-32768 <-> 32767

	XOR SI, SI
	XOR DI,DI
	MOV CX, ls

	for:
	MOV AX,WORD PTR [s + SI]
	
	CMP AX, 0

	JNS positive
	JS negative
	continue:
	
	MOV [d+DI], BL
	ADD SI, 2
	ADD DI, 1 
	loop for

	JMP program_end

	negative:
	XOR BX, BX
	while_neg:
	SHR AX, 1
	CMC	
	ADC BL, 0
	CMP AX, 0
	JNE while_neg
	JMP continue

	positive:
	XOR BX,BX
	while_pos:
	SHR AX,1
	ADC BL, 0
	CMP AX, 0
	JNE while_pos
	JMP continue

	program_end:
	
	mov ax, 4C00h;
	int 21h
text ENDS
END start
