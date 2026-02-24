.MODEL SMALL
.STACK 100H

.DATA
    ; Each line of the pattern stored as a string
    line1 DB 0DH,0AH,"           # # #  #  #  #  #  #  #   #   $"
    line2 DB 0DH,0AH,"          #       O             O          #$"
    line3 DB 0DH,0AH,"         #                I                    #$"
    line4 DB 0DH,0AH,"         #                I                    #$"
    line5 DB 0DH,0AH,"         #             _____                        #$"
    line6 DB 0DH,0AH,"         #                                     #$"
    line7 DB 0DH,0AH,"            #     #     #     #     #     #     $"

.CODE
MAIN PROC

    MOV AX, @DATA      ; Load data segment address
    MOV DS, AX         ; Initialize DS

    ; -------- PRINT LINE 1 --------
    LEA DX, line1      ; Load address of line1
    MOV AH, 09H        ; Function 09H ? Display string
    INT 21H

    ; -------- PRINT LINE 2 --------
    LEA DX, line2
    MOV AH, 09H
    INT 21H

    ; -------- PRINT LINE 3 --------
    LEA DX, line3
    MOV AH, 09H
    INT 21H

    ; -------- PRINT LINE 4 --------
    LEA DX, line4
    MOV AH, 09H
    INT 21H

    ; -------- PRINT LINE 5 --------
    LEA DX, line5
    MOV AH, 09H
    INT 21H

    ; -------- PRINT LINE 6 --------
    LEA DX, line6
    MOV AH, 09H
    INT 21H

    ; -------- PRINT LINE 7 --------
    LEA DX, line7
    MOV AH, 09H
    INT 21H

    ; -------- EXIT PROGRAM --------
    MOV AH, 4CH        ; Terminate program
    INT 21H

MAIN ENDP
END MAIN