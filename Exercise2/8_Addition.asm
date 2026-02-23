.model small
.stack 100h

.data
num1 db 10               ; First two-digit number
num2 db 23               ; Second two-digit number
result db ?              ; Store sum

.code
main proc
    mov ax, @data        ; Initialize data segment
    mov ds, ax
    
    mov al, num1         ; Load first number
    add al, num2         ; Add second number
    mov result, al       ; Store result
    
    aam                  ; Convert to two ASCII digits
    add ah, 30h          ; Convert tens to ASCII
    add al, 30h          ; Convert ones to ASCII
    
    mov dl, ah           ; Print tens digit
    mov ah, 02h
    int 21h
    
    mov dl, al           ; Print ones digit
    mov ah, 02h
    int 21h
    
    mov ah, 4Ch          ; Exit program
    int 21h
main endp
end main