.model small
.stack 100h
.data
num1 db 3     ;First digit
num2 db 4     ; Second digit
result db ?   ; store sum

.code
main proc
    mov ax, @data ;Initialize data segment
    mov ds, ax   
    
    mov al, num1 ;Load first number
    add al, num2 ;Add second number
    add al, 30h   ; Convert number to ASCII
    mov result, al ;store result
    
    mov dl, result ;Load result for display
    mov ah, 02h ;DOS function to display character
    int 21h ;Print result
    
    
    mov ah, 4ch ; Exit program
    int 21h
    
 main endp
end main
    
    