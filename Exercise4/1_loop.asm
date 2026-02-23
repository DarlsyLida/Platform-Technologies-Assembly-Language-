.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5        ; Set loop counter to 5

AGAIN:
    MOV DL, CL        ; Move counter value to DL
    ADD DL, 30H       ; Convert to ASCII
    MOV AH, 02H       ; Print character
    INT 21H

    LOOP AGAIN       ; Decrement CX and repeat

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
