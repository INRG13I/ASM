;Sa se citeasca de la intrarea standard doua numere naturale (a, b, pozitive, mai mici decat 65535, a mai mic decat b) 
;si sa se calculeze diferenta R= b - a (aceasta nu trebuie afisata pe ecran). 

assume cs:text,ds:data
data SEGMENT

a db 5,?,5 dup(0)
b db 5,?,5 dup(0)
val_a dw ?
val_b dw ?
temp db ?

data ENDS
text SEGMENT

    start:
    mov ax, data
    mov ds,ax
    mov es,ax

    MOV ah,0Ah
    MOV dx,offset a
    INT 21h

    MOV ah,0Ah
    MOV dx,offset b
    INT 21h

    MOV al,BYTE PTR a+1
    CBW
    MOV cx,ax
    MOV si,offset a+2
    MOV ax,0
    repeta1:
    MOV bl,BYTE PTR a+si
    ADD bl,'0'
    MOV temp,10
    MUL temp
    ADD al,bl
    LOOP repeta1

    MOV val_a,ax

    MOV al,BYTE PTR b+1
    CBW
    MOV cx,ax
    MOV si,offset b+2
    MOV ax,0
    repeta:
    MOV bl,BYTE PTR a+si
    ADD bl,'0'
    MOV temp,10
    MUL temp
    ADD al,bl
    LOOP repeta

    MOV val_b,ax

    MOV ax,val_b
    SUB ax,val_a


    mov ax, 4C00h;
    int 21h
text ENDS
END start