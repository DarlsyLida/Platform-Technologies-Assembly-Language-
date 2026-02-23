                                                                      .model small                ; Define memory model
.stack 100h                 ; Define stack size

.data                       ; Data segment begins
num1 db 25                  ; First 8-bit number
num2 db 17                  ; Second 8-bit number
msg db 'Sum of two 8-bit numbers: $' ; Output message
result db ?                 ; Variable to store result

.code                       ; Code segment begins
main proc                   ; Main procedure

mov ax, @data               ; Load data segment address
mov ds, ax                  ; Initialize DS register

mov al, num1                ; Move first number to AL
add al, num2                ; Add second number to AL
mov result, al              ; Store result

mov dx, offset msg          ; Load address of message
mov ah, 09h                 ; DOS print string function
int 21h                     ; Call interrupt

mov dl, result              ; Move result to DL
add dl, 30h                 ; Convert to ASCII
mov ah, 02h                 ; Print character function
int 21h                     ; Display result

mov ah, 4ch                 ; Exit program
int 21h                     ; Return to DOS

main endp                   ; End procedure
end main                    ; End program