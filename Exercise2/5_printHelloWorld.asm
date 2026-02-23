                                                                                      .model small             ; Define the memory model
.stack 100h              ; Reserve stack space

.data                    ; Data segment starts here
msg db 'hello world$'    ; Store lowercase string (terminated with $)

.code                    ; Code segment starts here
main proc
    mov ax, @data        ; Initialize data segment: move address to AX
    mov ds, ax           ; Move AX into DS (Data Segment register)

    mov dx, offset msg   ; Load memory address (offset) of the string into DX
    mov ah, 09h          ; DOS function 09h: print string
    int 21h              ; Display the string on the emulator screen

    mov ah, 4Ch          ; DOS function 4Ch: exit program
    int 21h              ; Call interrupt to return to DOS
main endp
end main