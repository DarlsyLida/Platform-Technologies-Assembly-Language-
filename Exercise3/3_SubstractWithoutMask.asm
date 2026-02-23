.model small                ; Use small memory model
.stack 100h                 ; Allocate 256 bytes for stack

.data                       ; Beginning of data segment
num1 db 9                   ; Define first single-digit number (9)
num2 db 4                   ; Define second single-digit number (4)
msg db 'Subtraction result: $' ; Define message string
result db ?                 ; Reserve 1 byte to store result

.code                       ; Beginning of code segment
main proc                   ; Start of main procedure

mov ax, @data               ; Load address of data segment into AX
mov ds, ax                  ; Initialize DS register

mov al, num1                ; Move value of num1 (9) into AL register
sub al, num2                ; Subtract num2 (4) from AL (9 - 4 = 5)
mov result, al              ; Store the subtraction result (5) into 'result'

mov dx, offset msg          ; Load address of message into DX
mov ah, 09h                 ; DOS function 09h: Display string
int 21h                     ; Call DOS interrupt

mov dl, result              ; Move result value (5) into DL for display
add dl, 30h                 ; Convert numeric value to ASCII (5 -> '5')
mov ah, 02h                 ; DOS function 02h: Display single character
int 21h                     ; Call DOS interrupt

mov ah, 4ch                 ; DOS function 4Ch: Terminate program
int 21h                     ; Return control back to DOS

main endp                   ; End of main procedure
end main                    ; End of program