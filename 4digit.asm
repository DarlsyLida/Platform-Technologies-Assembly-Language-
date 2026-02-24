.MODEL SMALL              ; Define memory model
.STACK 100H               ; Allocate stack size

.DATA
    ; ----- Messages -----
    msg1 DB "Enter first digit: $" 
    msg2 DB 0DH,0AH,"Enter second digit: $"
    msg3 DB 0DH,0AH,"Enter third digit: $"
    msg4 DB 0DH,0AH,"Enter fourth digit: $"
    
    displayMsg DB 0DH,0AH,"The digits entered are: $"
    resultMsg  DB 0DH,0AH,"The greatest digit is: $"
    
    ; ----- Variables to store digits -----
    num1 DB ?
    num2 DB ?
    num3 DB ?
    num4 DB ?

.CODE
MAIN PROC

    MOV AX, @DATA          ; Load data segment address
    MOV DS, AX             ; Initialize DS register

    ; ---------------- INPUT FIRST DIGIT ----------------
    LEA DX, msg1           ; Load address of first message
    MOV AH, 09H            ; Function 09H ? Display string
    INT 21H                ; Call DOS interrupt

    MOV AH, 01H            ; Function 01H ? Read character
    INT 21H                ; Input stored in AL (ASCII)
    SUB AL, 30H            ; Convert ASCII to numeric
    MOV num1, AL           ; Store value in num1

    ; ---------------- INPUT SECOND DIGIT ----------------
    LEA DX, msg2
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV num2, AL

    ; ---------------- INPUT THIRD DIGIT ----------------
    LEA DX, msg3
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV num3, AL

    ; ---------------- INPUT FOURTH DIGIT ----------------
    LEA DX, msg4
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV num4, AL

    ; ---------------- DISPLAY ENTERED DIGITS ----------------
    LEA DX, displayMsg     ; Display heading
    MOV AH, 09H
    INT 21H

    ; Display num1
    MOV DL, num1
    ADD DL, 30H            ; Convert numeric to ASCII
    MOV AH, 02H            ; Function 02H ? Display character
    INT 21H

    MOV DL, ' '            ; Print space
    INT 21H

    ; Display num2
    MOV DL, num2
    ADD DL, 30H
    INT 21H

    MOV DL, ' '
    INT 21H

    ; Display num3
    MOV DL, num3
    ADD DL, 30H
    INT 21H

    MOV DL, ' '
    INT 21H

    ; Display num4
    MOV DL, num4
    ADD DL, 30H
    INT 21H

    ; ---------------- FIND GREATEST NUMBER ----------------
    MOV AL, num1           ; Assume num1 is greatest initially

    CMP AL, num2           ; Compare with num2
    JAE CHECK3             ; If AL = num2, skip update
    MOV AL, num2           ; Else update AL

CHECK3:
    CMP AL, num3           ; Compare with num3
    JAE CHECK4
    MOV AL, num3

CHECK4:
    CMP AL, num4           ; Compare with num4
    JAE DISPLAY_RESULT
    MOV AL, num4

    ; ---------------- DISPLAY RESULT ----------------
DISPLAY_RESULT:
    LEA DX, resultMsg
    MOV AH, 09H
    INT 21H

    ADD AL, 30H            ; Convert result to ASCII
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; ---------------- EXIT PROGRAM ----------------
    MOV AH, 4CH            ; Function 4CH ? Terminate program
    INT 21H

MAIN ENDP
END MAIN