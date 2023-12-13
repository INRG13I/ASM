ASSUME cs:text_,ds:data_

data_ SEGMENT
    A dw 55cah
    B dw 0f0fh
    C dw 0000h      
data_ ENDS

text_ SEGMENT

start:
    mov ax,data_
    mov ds,ax

    mov ax, A
    mov bx, B

    ; Rule 1: Set bits 0-2 and bit 10 of C to 0-already done because c=0

    ; Rule 2: Set bits 3-6 of C to bits 5-8 of A
    shr ax,2                      ; Shift bits 5-8 of A to 3-6
    and ax, 0000000001111000b     ; Mask bits 3-6
    or C, ax               ; Set bits 3-6 of C

    ; Rule 3: Set bits 7-9 of C to bits 0-2 of B
    and bx, 0000000000000111b     ; Mask bits 0-2 of B
    shl bx, 7                     ; Shift bits 0-2 of B to 7-9
    or C, bx               ; Set bits 7-9 of C

    ; Rule 4: Set bits 11-15 of C to bits 5-9 of B
    mov bx, B
    shl bx, 6                      ; Shift bits 5-9 of B to the rightmost positions
    and bx, 1111100000000000b      ; Mask bits 11-15
    or C, bx                ; Set bits 11-15 of C
    mov cx,c

    ;End of program
    mov ax, 4c00h
    int 21h
    text_ ENDS

END start 
;c3f0 - 1100001111110000
;fbb0 - 1111101110110000

;1111101110110000
;1110101000000000