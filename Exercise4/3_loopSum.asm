.MODEL SMALL
.STACK 100H
.DATA
    SUM DW 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 10        ; Loop counter = 10
    MOV AX, 0         ; AX will store sum

SUM_LOOP:
    ADD AX, CX        ; Add counter value to AX
    LOOP SUM_LOOP     ; Decrement CX and repeat if CX ? 0

    MOV SUM, AX       ; Store result in SUM

    MOV AH, 4CH       ; Exit program
    INT 21H

MAIN ENDP
END MAIN
