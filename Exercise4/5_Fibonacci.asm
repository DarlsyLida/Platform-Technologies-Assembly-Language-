.MODEL SMALL              ; Use small memory model (1 code, 1 data segment)
.STACK 100H               ; Allocate 256 bytes for stack
.DATA                     ; Begin data segment (no variables declared)

.CODE                     ; Begin code segment
MAIN PROC                 ; Start of main procedure

    MOV AX, @DATA         ; Load address of data segment
    MOV DS, AX            ; Initialize DS register

    MOV CX, 20            ; Set loop counter to print 20 Fibonacci terms

    MOV AX, 0             ; AX = first Fibonacci number (0)
    MOV BX, 1             ; BX = second Fibonacci number (1)

FIB_LOOP:                 ; Start Fibonacci loop

    PUSH AX               ; Save current Fibonacci number on stack
    CALL PRINT_NUM        ; Call procedure to print number in AX

    MOV DL, ' '           ; Load space character into DL
    MOV AH, 02H           ; DOS function 02H (print single character)
    INT 21H               ; Call DOS interrupt

    POP AX                ; Restore original Fibonacci value

    MOV DX, AX            ; Store current value in DX (temporary)
    ADD AX, BX            ; AX = AX + BX (next Fibonacci number)
    MOV BX, DX            ; BX = previous value

    LOOP FIB_LOOP         ; Decrease CX and repeat if CX ? 0

    MOV AH, 4CH           ; DOS terminate program function
    INT 21H               ; Exit program

MAIN ENDP                 ; End of main procedure


; -------- PRINT_NUM PROCEDURE --------
PRINT_NUM PROC

    PUSH AX               ; Save AX
    PUSH BX               ; Save BX
    PUSH CX               ; Save CX
    PUSH DX               ; Save DX

    MOV CX, 0             ; Clear digit counter
    MOV BX, 10            ; Divisor = 10 (decimal base)

PRINT_LOOP:
    MOV DX, 0             ; Clear DX before division
    DIV BX                ; AX ÷ 10 ? Quotient in AX, Remainder in DX
    PUSH DX               ; Push remainder (digit) onto stack
    INC CX                ; Increase digit counter
    CMP AX, 0             ; Check if quotient = 0
    JNE PRINT_LOOP        ; If not zero, continue dividing

DISPLAY_LOOP:
    POP DX                ; Pop digit from stack
    ADD DL, 30H           ; Convert digit to ASCII ('0' = 30H)
    MOV AH, 02H           ; DOS print character function
    INT 21H               ; Display digit
    LOOP DISPLAY_LOOP     ; Repeat for all digits

    POP DX                ; Restore DX
    POP CX                ; Restore CX
    POP BX                ; Restore BX
    POP AX                ; Restore AX

    RET                   ; Return to main program

PRINT_NUM ENDP            ; End of PRINT_NUM procedure

END MAIN                  ; Program entry point
