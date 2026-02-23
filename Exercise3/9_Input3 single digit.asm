.model small                    ; Use small memory model
.stack 100h                     ; Allocate stack

.data
msg db 'Enter 3 digits: $'      ; Prompt message
resultMsg db 0dh,0ah,'Sum is: $' ; Result message

.code
main proc

mov ax,@data
mov ds,ax

mov dx,offset msg               ; Display prompt
mov ah,09h
int 21h

; Input first digit
mov ah,01h                      ; Read character
int 21h
sub al,30h                      ; Convert ASCII to numeric
mov bl,al                       ; Store in BL

; Input second digit
mov ah,01h                      ; Read character
int 21h
sub al,30h                      ; Convert to numeric
add bl,al                       ; Add to running sum

; Input third digit
mov ah,01h                      ; Read character
int 21h
sub al,30h                      ; Convert to numeric
add bl,al                       ; Add to final sum

mov dx,offset resultMsg         ; Display result message
mov ah,09h
int 21h

; Display sum
add bl,30h                      ; Convert sum back to ASCII
mov dl,bl                       ; Move to DL
mov ah,02h                      ; Display character
int 21h

mov ah,4ch                      ; Terminate
int 21h

main endp
end main