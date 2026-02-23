.model small                     ; Use small memory model
.stack 100h                      ; Allocate 256 bytes for stack

.data
msg db 'Multiplication Table of 2',0dh,0ah,'$' ; Message with Carriage Return/Line Feed

.code
main proc

mov ax,@data                     ; Load data segment address
mov ds,ax                        ; Initialize DS register

; Display the message
mov dx,offset msg                ; Load message address
mov ah,09h                       ; Display string
int 21h

mov cl,1                         ; Initialize counter (CL = 1)

table:
mov al,2                         ; Load number 2 into AL
mul cl                           ; Multiply AL * CL
                                 ; Result stored in AX (AL = low byte)

add al,30h                       ; Convert result to ASCII (single digit only)
mov dl,al                        ; Move result into DL for display
mov ah,02h                       ; Display character
int 21h

; Print new line
mov dl,0dh                       ; Carriage return
int 21h
mov dl,0ah                       ; Line feed
int 21h

inc cl                           ; Increment counter (CL = CL + 1)
cmp cl,11                        ; Compare CL with 11
jne table                        ; Repeat loop until CL = 11

mov ah,4ch                       ; Terminate program
int 21h

main endp
end main