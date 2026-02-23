.model small
.stack 100h

.data
star db '*'              ; Star character
newline db 0Dh,0Ah,'$'   ; Newline characters (Carriage Return + Line Feed)

.code
main proc
    mov ax, @data        ; Initialize data segment
    mov ds, ax
    
    mov cx, 5            ; Number of rows
    mov bl, 1            ; Stars per row (starting count)

outer:
    mov dl, '*'          ; Load star
    mov ah, 02h          ; Print function
    mov si, bx           ; Copy current star count to SI

inner:
    int 21h              ; Print star
    dec si               ; Reduce count
    jnz inner            ; Repeat until zero

    mov dx, offset newline ; Print new line
    mov ah, 09h
    int 21h

    inc bl               ; Increase stars count for next row
    loop outer           ; Next row (decrements CX)

    mov ah, 4Ch          ; Exit program
    int 21h
main endp
end main