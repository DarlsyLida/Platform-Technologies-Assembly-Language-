.model small                  
.stack 100h                   

.data
myVar db 7                    ; Initialize variable 'myVar' with value 7
msg   db 'The value of variable is: $' ; Message to display

.code
main proc

mov ax,@data                  ; Load data segment address into AX
mov ds,ax                     ; Initialize DS register

; Display message
mov dx, offset msg            ; Load address of message into DX
mov ah, 09h                   ; DOS function 09h ? print string
int 21h                       ; Display message

; Display variable value
mov al, myVar                 ; Move variable value into AL
add al, 30h                   ; Convert number to ASCII ('0' -> 30h)
mov dl, al                    ; Move ASCII value into DL for printing
mov ah, 02h                   ; DOS function 02h ? print single character
int 21h                       ; Display variable value

; Exit program
mov ah, 4ch                   ; DOS terminate program
int 21h

main endp
end main
