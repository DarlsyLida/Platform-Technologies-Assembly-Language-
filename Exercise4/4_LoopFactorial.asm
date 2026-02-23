.MODEL SMALL              ; Use small memory model (1 code + 1 data segment)
.STACK 100H               ; Allocate 256 bytes for stack

.DATA
    NUM DW 5              ; Define variable NUM = 5 (number to find factorial)
    RESULT DW ?           ; Variable to store factorial result

.CODE
MAIN PROC

    MOV AX, @DATA         ; Load data segment address
    MOV DS, AX            ; Initialize DS register

    MOV CX, NUM           ; CX = number (loop counter for factorial)
    MOV AX, 1             ; AX = 1 (initial factorial value)

FACT_LOOP:
    MUL CX                ; AX = AX × CX (unsigned multiplication)
                          ; Result stored in DX:AX (AX holds lower 16 bits)
    LOOP FACT_LOOP        ; CX = CX - 1, repeat until CX = 0

    MOV RESULT, AX        ; Store final factorial result in RESULT

    ; Print Result 
    MOV AX, RESULT        ; Move result into AX for printing
    CALL PRINT_NUM        ; Call procedure to print number

    MOV AH, 4CH           ; DOS terminate function
    INT 21H               ; Exit program

MAIN ENDP


;  Procedure to Print Number 
PRINT_NUM PROC

    MOV BX, 10            ; Divisor = 10 (decimal base)
    XOR CX, CX            ; Clear CX (digit counter = 0)

NEXT_DIGIT:
    XOR DX, DX            ; Clear DX before division
    DIV BX                ; AX ÷ 10 ? Quotient in AX, Remainder in DX
    PUSH DX               ; Push remainder (digit) onto stack
    INC CX                ; Increase digit count
    CMP AX, 0             ; Check if quotient is 0
    JNE NEXT_DIGIT        ; If not zero, continue dividing

PRINT_LOOP:
    POP DX                ; Pop digit from stack
    ADD DL, 30H           ; Convert digit to ASCII ('0' = 30H)
    MOV AH, 02H           ; DOS function to print character
    INT 21H               ; Display digit
    LOOP PRINT_LOOP       ; Repeat until all digits printed

    RET                   ; Return to main program

PRINT_NUM ENDP

END MAIN                  ; Program entry point
