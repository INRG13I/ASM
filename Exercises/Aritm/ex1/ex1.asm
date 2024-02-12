; Sa se calculeze expresia aritmetica :
; e=((a+b*c-d)/f+g*h)/i

; Am considerat a,d,f - cuvant
; b,c,g,h,i -byte
; ca sa putem executa impartirea cu f convertim impartitorul la dublucuvant
; ne vor interesa doar caturile impartirilor
; rezultatul va fi de tip octet

assume cs:text,ds:data
data SEGMENT

a dw 5
b db 6
c db 10
d dw 5
f dw 6
g db 10
h db 11
i db 10

e db ?

data ENDS
text SEGMENT

	start:

	MOV AX, data
	MOV DS, AX

	MOV AL, b
    	MUL c
	ADD AX, a
	SUB AX, d
	CWD
	DIV f
	MOV BX, AX
	MOV AL, g
	MUL h
	ADD AX,BX
	DIV i
	MOV e,AL

	
	mov ax, 4C00h;
	int 21h
text ENDS
END start
