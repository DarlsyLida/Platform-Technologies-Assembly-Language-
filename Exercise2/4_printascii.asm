.model small
.stack 100h

.code
main proc
    mov dl, 41h          ; ASCII value of 'A'
    mov ah, 02h          ; DOS function to print character
    int 21h              ; Print ASCII character
    
    mov ah, 4Ch          ; Exit program
    int 21h
main endp
end main