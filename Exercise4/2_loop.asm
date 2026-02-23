.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5        ; Loop 5 times
    MOV DL, '1'      ; Starting character

PRINT:
    MOV AH, 02H      ; DOS print character function
    INT 21H

    INC DL           ; Next character
    LOOP PRINT

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
