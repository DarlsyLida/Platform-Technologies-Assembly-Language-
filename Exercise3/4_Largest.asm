.model small
.stack 100h

.data                          ; Beginning of data segment
num1 db 6                      ; Define first single digit number (6)
num2 db 8                      ; Define second single digit number (8)
msg db 'Largest number is: $'  ; Define output message ending with '$' for DOS display

.code                          ; Beginning of code segment
main proc                      ; Start of main procedure

mov ax, @data                  ; Load address of data segment into AX
mov ds, ax                     ; Initialize DS register with data segment address

mov al, num1                   ; Move value of num1 (6) into AL register
cmp al, num2                   ; Compare AL with num2 (6 - 8) ? sets flags
jc second                      ; Jump to label 'second' if Carry flag = 1 (means num1 < num2)

mov bl, num1                   ; If no carry (num1 >= num2), move num1 into BL (largest)
jmp display                    ; Jump to display section

second:                        ; Label executed if num1 < num2
mov bl, num2                   ; Move num2 into BL (largest number)

display:                       ; Label to display result
mov dx, offset msg             ; Load address of message into DX
mov ah, 09h                    ; DOS function 09h ? Print string
int 21h                        ; Call DOS interrupt to display message

mov dl, bl                     ; Move largest number from BL into DL
add dl, 30h                    ; Convert number to ASCII (e.g., 8 -> '8')
mov ah, 02h                    ; DOS function 02h ? Print single character
int 21h                        ; Call DOS interrupt to display the digit

mov ah, 4ch                    ; DOS function 4Ch ? Terminate program
int 21h                        ; Return control to DOS

main endp                      ; End of main procedure
end main                       ; End of program and specify entry point