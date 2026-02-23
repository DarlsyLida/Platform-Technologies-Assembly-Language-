.model small
.stack 100h

.data
num1 dw 1234h               ; First 16-bit number
num2 dw 1111h               ; Second 16-bit number
msg db 'Sum of two 16-bit numbers: $'
result dw ?                 ; Store result

.code
main proc

mov ax, @data
mov ds, ax

mov ax, num1                ; Load first number
add ax, num2                ; Add second number
mov result, ax              ; Store result

mov dx, offset msg
mov ah, 09h
int 21h

mov bx, result              ; Move result to BX
mov dl, bl                  ; Take lower byte
add dl, 30h
mov ah, 02h
int 21h

mov ah, 4ch
int 21h

main endp
end main