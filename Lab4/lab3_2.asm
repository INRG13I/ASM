;Se da un sir de dublucuvinte. Sa se determine si sa se salveze in sirul D toti octetii care au numar impar de biti in reprezentarea binara.

assume cs:code,ds:data
data segment
    A dd 2, 1, -3, 3, -4, 2, 6
    la equ ($-A)/4
    D db la*4 dup(0)
    tempv db ?
    temp dw ?
data ends

code segment
    start:
    MOV AX, data
    MOV DS,AX
    MOV ES,AX

    MOV SI, offset A
    MOV DI, offset D
    MOV CX,la*4

    parc_source:
    MOV BL, BYTE ptr A[si]
    MOV DL,BL
    MOV temp,CX
    JMP verify_byte
    end_verify_byte:
    MOV CX,temp
    MOV AH,0
    MOV tempv,2
    DIV tempv
    CMP AH,0
    JA add_to_destination
    end_add_to_destination:
    ADD SI,4
    loop parc_source

    JMP program_end

    verify_byte:
    mov CX, 8
    xor AL, AL

    count_loop:
    shl DL, 1
    adc AL, 0
    loop count_loop

    JMP end_verify_byte

    add_to_destination:
    MOV AL,BL
    STOSB
    JMP end_add_to_destination

    program_end:

    mov ax, 4c00h
    int 21h

code ends
end start


