.MODEL SMALL
.STACK 100H

.DATA
    ; The '$' is a terminator telling DOS where the string ends
    msg DB 'Hello, World$' 

.CODE
main PROC
    ; Initialize the Data Segment (DS)
    ; This is required when using variables in the .DATA section
    MOV AX, @DATA
    MOV DS, AX

    ; Load the address of the string into DX
    LEA DX, msg      ; LEA = Load Effective Address
    
    ; Function 09h displays a string ending with '$'
    MOV AH, 09H
    INT 21H

    ; Standard exit
    MOV AH, 4CH
    INT 21H
main ENDP
END main