.model small
.stack 100h

.data
num db 5                         ; Number to check
msg1 db 'Number is Even$'        ; Even message
msg2 db 'Number is Odd$'         ; Odd message

.code
main proc

mov ax,@data                     ; Load data segment
mov ds,ax                        ; Initialize DS

mov al,num                       ; Move value to AL
and al,1                         ; Mask all but Least Significant Bit
                                 ; Result 0 = Even, Result 1 = Odd

jz even                          ; Jump if result is Zero (Even)

; Logic if number is odd
mov dx,offset msg2               ; Load "Odd" message
jmp print                        ; Skip even section

even:
mov dx,offset msg1               ; Load "Even" message

print:
mov ah,09h                       ; Display string
int 21h                          ; Call DOS interrupt

mov ah,4ch                       ; Exit
int 21h

main endp
end main