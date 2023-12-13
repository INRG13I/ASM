;Se dau 2 siruri de octeti A si B. Sa se construiasca sirul R care sa contina elementele lui B in ordine inversa urmate de elementele negative ale lui A. 
;Exemplu:
;A: 2, 1, -3, 3, -4, 2, 6
;B: 4, 5, 7, 6, 2, 1
;R: 1, 2, 6, 7, 5, 4, -3, -4


assume cs:code,ds:data
data segment
    A db 2, 1, -3, 3, -4, 2, 6
    la equ $-A 
    B db 4, 5, 7, 6, 2, 1
    lb equ $-B
    R db la+lb dup(0)
data ends

code segment
    start:
    MOV AX, data
    MOV DS,AX
    MOV ES,AX

    MOV SI, offset B+lb-1
    MOV DI, offset R
    STD
    MOV CX,lb

    inv_b_to_r:
    LODSB
    CLD
    STOSB
    STD
    loop inv_b_to_r

    MOV SI, offset A
    MOV CX,la
    CLD
    
    neg_a_to_r:
    LODSB
    CMP al,0
    JL negative_found
    loop neg_a_to_r
    
    JMP end_neg_a_to_r

    negative_found:
    STOSB
    loop neg_a_to_r
    
    end_neg_a_to_r:

    mov ax, 4c00h
    int 21h

code ends
end start