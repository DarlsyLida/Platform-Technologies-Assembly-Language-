.model small                  ; Use small memory model (one code and one data segment)
.stack 100h                   ; Allocate 256 bytes of stack

.data
;================== Exercise 1 ==================
msg1 db 'Exercise 1: Hello World$' ; Message to print "Hello World"

;================== Exercise 2 ==================
num1_2 db 3                   ; First single digit number (<10)
num2_2 db 5                   ; Second single digit number (<10)
msg2 db 0dh,0ah,'Exercise 2: Sum of two single digits: $'
result2 db ?                  ; Store result

;================== Exercise 3 ==================
msg3 db 0dh,0ah,'Exercise 3: Digits 1 to 9:$'

;================== Exercise 4 ==================
data4 db 41,42,43,44,45,46,0dh,0ah,'$' ; ASCII codes A,B,C,D,E,F

;================== Exercise 5 ==================
msg5 db 0dh,0ah,'Exercise 5: Print "hello world" with newline$'

;================== Exercise 6 ==================
num1_sub db 8                 ; First single digit (<10)
num2_sub db 3                 ; Second single digit (<10)
msg6 db 0dh,0ah,'Exercise 6: Subtraction result: $'
result_sub db ?

;================== Exercise 7 ==================
msg7 db 0dh,0ah,'Exercise 7: Star Pattern:$'

;================== Exercise 8 ==================
num1_8 db 23                  ; First two-digit number
num2_8 db 45                  ; Second two-digit number
msg8 db 0dh,0ah,'Exercise 8: Sum of two two-digit numbers: $'
result8 db ?                  ; Store result

.code
main proc

mov ax,@data                  ; Load data segment address
mov ds,ax                     ; Initialize DS register

;================== Exercise 1 ==================
mov dx, offset msg1           ; Load message address
mov ah, 09h                   ; DOS function 09h ? print string
int 21h                       ; Print "Hello World"

;================== Exercise 2 ==================
mov al, num1_2                ; Load first number
add al, num2_2                ; Add second number
mov result2, al               ; Store result
mov dx, offset msg2           ; Print message
mov ah, 09h
int 21h
mov dl, result2               ; Move sum to DL
add dl, 30h                   ; Convert to ASCII
mov ah, 02h                   ; DOS print char
int 21h

;================== Exercise 3 ==================
mov dx, offset msg3           ; Print message
mov ah, 09h
int 21h
mov cl, 1                     ; Counter from 1 to 9
ex3_loop:
mov dl, cl
add dl, 30h                   ; Convert number to ASCII
mov ah, 02h                   ; Print character
int 21h
mov dl, ' '                   ; Space after number
int 21h
inc cl
cmp cl, 10                    ; Loop until 9
jne ex3_loop

;================== Exercise 4 ==================
mov dx, offset data4           ; Print ASCII data
mov ah, 09h
int 21h

;================== Exercise 5 ==================
mov dx, offset msg5           ; Print message "hello world" with newline
mov ah, 09h
int 21h

;================== Exercise 6 ==================
mov al, num1_sub              ; Load first number
sub al, num2_sub              ; Subtract second number
mov result_sub, al            ; Store result
mov dx, offset msg6           ; Print message
mov ah, 09h
int 21h
mov dl, result_sub            ; Print result
add dl, 30h                   ; Convert to ASCII
mov ah, 02h
int 21h

;================== Exercise 7 ==================
mov dx, offset msg7           ; Print message
mov ah, 09h
int 21h
mov cx, 1                     ; Start with 1 star
ex7_outer:
mov bx, cx                    ; Counter for stars in this row
ex7_inner:
mov dl,'*'                    ; Print star
mov ah, 02h
int 21h
dec bx
jnz ex7_inner
mov dl,0dh                    ; Carriage return
mov ah,02h
int 21h
mov dl,0ah                    ; Line feed
mov ah,02h
int 21h
inc cx
cmp cx,6                       ; Rows from 1 to 5
jne ex7_outer

;================== Exercise 8 ==================
mov al, num1_8                ; Load first two-digit number
add al, num2_8                ; Add second number
mov result8, al               ; Store result
mov dx, offset msg8           ; Print message
mov ah, 09h
int 21h
mov dl, result8
add dl, 30h                   ; Convert to ASCII (simplified for one byte)
mov ah, 02h
int 21h

; Exit program
mov ah, 4ch
int 21h

main endp
end main
