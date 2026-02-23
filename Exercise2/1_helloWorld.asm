.model small             ; Define memory model
.stack 100h              ; Define stack size

.data
msg db 'Hello World$'    ; Store string with $ termination

.code
main proc
    mov ax, @data        ; Load address of data segment
    mov ds, ax           ; Initialize data segment
    
    mov dx, offset msg   ; Load address of string
    mov ah, 09h          ; DOS function to display string
    int 21h              ; Call DOS interrupt
    
    mov ah, 4Ch          ; DOS function to terminate program
    int 21h              ; Exit to DOS
main endp
end main