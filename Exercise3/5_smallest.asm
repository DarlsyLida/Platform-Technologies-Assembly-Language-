.model small
.stack 100h

.data                            ; Data segment
num1 db 6                        ; First number
num2 db 8                        ; Second number
msg db 'Smallest number is: $'    ; Message to display ('$' terminates string)

.code                            ; Code segment
main proc

mov ax, @data                    ; Load data segment address into AX
mov ds, ax                       ; Initialize DS with data segment address

mov al, num1                     ; Move num1 into AL register
cmp al, num2                     ; Compare AL (num1) with num2
jc first                         ; Jump to label 'first' if Carry flag set (num1 < num2)

mov bl, num2                     ; If num1 >= num2, move num2 into BL (smallest)
jmp show                         ; Jump to display section

first:
mov bl, num1                     ; If num1 < num2, move num1 into BL (smallest)

show:
mov dx, offset msg               ; Load address of message into DX
mov ah, 09h                      ; DOS function 09h - Display string
int 21h                          ; Call DOS interrupt

mov dl, bl                       ; Move smallest number into DL for display
add dl, 30h                      ; Convert number to ASCII (0-9 -> '0'-'9')
mov ah, 02h                      ; DOS function 02h - Display single character
int 21h                          ; Call DOS interrupt

mov ah, 4ch                      ; DOS function 4Ch - Terminate program
int 21h                          ; Return control to DOS

main endp
end main