;Sa se implementeze un program de autentificare. Programul are definit in segmentul de date un sir de caractere numit 'parola'. Programul va cere utilizatorului sa introduca parola de la tastatura si va verifica daca aceasta este identica cu sirul 'parola' din segmentul de date si va afisa un mesaj corespunzator. Programul tot cere utilizatorului parola, pana cand acesta o ghiceste.

assume cs:text,ds:data
data SEGMENT

password db 100, 6,'p', 'a', 'r', 'o', 'l', 'a'
user db 100, ? ,100 dup(?)

data ENDS
text SEGMENT

	start:

	MOV AX, data
	MOV DS, AX
	
	MOV SI, 1
	JMP program_start

	same_length:
	MOV DI, 2
	MOV CL, user[SI]
	
	for:
	MOV AL, byte ptr user[DI]
	MOV BL, byte ptr password[DI]
	CMP AL, BL
	JNE dogshit
	loop for

	JMP good_stuff

	program_start:

	password_read:	
	MOV AH, 0Ah
	MOV DX, offset user
	int 21h
	MOV AL, byte ptr user[SI]
	MOV BL, byte ptr password[SI]
	CMP AL, BL
	JE same_length
	dogshit:
	JMP password_read

	good_stuff:
	MOV AH, 02h
	MOV DL, 'G'
	int 21h
	MOV AH, 02h
	MOV DL, 'G'
	int 21h

	mov ax, 4C00h;
	int 21h
text ENDS
END start
