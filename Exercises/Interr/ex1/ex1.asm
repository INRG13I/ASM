assume cs:text,ds:data
data SEGMENT


data ENDS
text SEGMENT

	start:

	MOV AX, data
	MOV DS, AX

	

	
	mov ax, 4C00h;
	int 21h
text ENDS
END start
