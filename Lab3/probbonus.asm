ASSUME cs:text_,ds:data_

data_ SEGMENT
a dd  00111000001110000011100000111000b; 00111000001110000011100000111000b
b dw 0

data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax


MOV bx,0
MOV ax,WORD PTR a
AND ax,0000000000111000b
SHR ax,3
ADD bx,ax
MOV ax,WORD PTR a
AND ax,0011100000000000b
SHR ax,11
ADD bx,ax
MOV ax,WORD PTR a+2
AND ax,0000000000111000b
SHR ax,3
ADD bx,ax
MOV ax,WORD PTR a+2
AND ax,0011100000000000b
SHR ax,11
ADD bx,ax
MOV b,bx


mov ax, 4c00h
int 21h
text_ ENDS

END start