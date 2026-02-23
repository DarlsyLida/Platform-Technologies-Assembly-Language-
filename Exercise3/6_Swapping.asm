.model small
.stack 100h

.data
num1 db 3                        ; First number
num2 db 7                        ; Second number
msg1 db 'Before Swapping: $'      ; Message before swapping
msg2 db 0dh,0ah,'After Swapping: $' ; New line + message after swapping

.code
main proc

mov ax,@data                     ; Load data segment address into AX
mov ds,ax                        ; Initialize DS register

; Display "Before Swapping" message
mov dx,offset msg1               ; Load address of msg1 into DX
mov ah,09h                       ; DOS function 09h - display string
int 21h                          ; Call DOS interrupt

; Display num1
mov dl,num1                      ; Move num1 into DL
add dl,30h                       ; Convert number to ASCII
mov ah,02h                       ; DOS function 02h - display character
int 21h                          ; Call DOS interrupt

; Display space
mov dl,' '                       ; Load space character into DL
int 21h                          ; Display space

; Display num2
mov dl,num2                      ; Move num2 into DL
add dl,30h                       ; Convert number to ASCII
int 21h                          ; Display character

; Swap num1 and num2
mov al,num1                      ; Store num1 in AL
mov bl,num2                      ; Store num2 in BL
mov num1,bl                      ; Copy original num2 into num1
mov num2,al                      ; Copy original num1 into num2

; Display "After Swapping" message
mov dx,offset msg2               ; Load address of msg2
mov ah,09h                       ; DOS function 09h - display string
int 21h                          ; Call DOS interrupt

; Display new num1
mov dl,num1                      ; Move swapped num1 into DL
add dl,30h                       ; Convert to ASCII
mov ah,02h                       ; DOS function 02h
int 21h                          ; Display character

; Display space
mov dl,' '                       ; Load space
int 21h                          ; Display space

; Display new num2
mov dl,num2                      ; Move swapped num2 into DL
add dl,30h                       ; Convert to ASCII
int 21h                          ; Display character

; Exit program
mov ah,4ch                       ; DOS function 4Ch - terminate program
int 21h                          ; Return control to DOS

main endp
end main