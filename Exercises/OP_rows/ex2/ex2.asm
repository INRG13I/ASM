assume cs:text, ds:data
data SEGMENT

s1 db 1,2,3,4
ls equ $-s1
s2 db 5,6,7,8

d db ls dup(?)

data ENDS
text SEGMENT

start:
    MOV AX, data
    MOV DS, AX

    MOV CX, ls
    XOR SI, SI
    XOR DI, DI

repeta:
    MOV AX, SI
    AND AX, 1     
    CMP AL, 0
    JNE impar

par:
    MOV AL, [s1+SI]   
    ADD AL, [s2+SI]   
    MOV [d+DI], AL   
    JMP continue

impar:
    MOV AL, [s1+SI]    
    SUB AL, [s2+SI]     
    MOV [d+DI], AL     

continue:
    INC SI
    INC DI
    LOOP repeta         

program_end:
    mov ax, 4C00h
    int 21h

text ENDS
END start
