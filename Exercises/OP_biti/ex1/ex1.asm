; c: |a7 a8 a9 b9 | b10 b11 b12 0 | 0 0 0 0 | 0 0 0 0 |

assume cs:text,ds:data
data SEGMENT

a dw 1111111111111111b
b dw 0000000000000000b
c dw 0


data ENDS
text SEGMENT

	start:

	MOV AX, data
	MOV DS, AX

	MOV AX,a
	MOV BX,b

	SHR AX, 7
	AND AX, 0000000000000111b
	OR C, AX

	SHR BX, 6
	AND BX, 0000000001111000b
	OR C, BX

	
	mov ax, 4C00h;
	int 21h
text ENDS
END start
