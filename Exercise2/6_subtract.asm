.model small
.stack 100h

.data
num1 db 7                ; First digit
num2 db 3                ; Second digit
result db ?              ; Variable to store result

.code
main proc
    mov ax, @data        ; Initialize data segment
    mov ds, ax
    
    mov al, num1         ; Load first number
    sub al, num2         ; Subtract second number (7 - 3 = 4)
    add al, 30h          ; Convert the raw number to ASCII ('4')
    mov result, al       ; Store result
    
    mov dl, result       ; Load result for display
    mov ah, 02h          ; DOS function to print character
    int 21h              ; Print result
    
    mov ah, 4Ch          ; Exit program
    int 21h
main endp
end main