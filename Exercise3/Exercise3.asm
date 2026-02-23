.model small                  ; Use small memory model (one code segment, one data segment)
.stack 100h                   ; Allocate 256 bytes of stack

.data                         ; Beginning of data segment

;================== Exercise 1 ==================
num1_8  db 25                 ; First 8-bit number for addition
num2_8  db 17                 ; Second 8-bit number for addition
msg1    db 'Exercise 1: Sum of two 8-bit numbers: $' ; Message for output
result1 db ?                  ; Variable to store result

;================== Exercise 2 ==================
num1_16 dw 1234h              ; First 16-bit number
num2_16 dw 1111h              ; Second 16-bit number
msg2    db 0dh,0ah,'Exercise 2: Sum of two 16-bit numbers: $' ; Message
result2 dw ?                  ; Store result

;================== Exercise 3 ==================
num1_sub db 9                 ; First number for subtraction
num2_sub db 4                 ; Second number for subtraction
msg3    db 0dh,0ah,'Exercise 3: Subtraction result: $' ; Message
result_sub db ?               ; Store subtraction result

;================== Exercise 4 ==================
num1_largest db 6             ; First number to find largest
num2_largest db 8             ; Second number
msg4    db 0dh,0ah,'Exercise 4: Largest number is: $' ; Message

;================== Exercise 5 ==================
num1_smallest db 6            ; First number to find smallest
num2_smallest db 8            ; Second number
msg5    db 0dh,0ah,'Exercise 5: Smallest number is: $' ; Message

;================== Exercise 6 ==================
num1_swap db 3                ; First number to swap
num2_swap db 7                ; Second number
msg6a   db 0dh,0ah,'Exercise 6: Before swapping: $' ; Message
msg6b   db 0dh,0ah,'After swapping: $' ; Message

;================== Exercise 7 ==================
msg7    db 0dh,0ah,'Exercise 7: Multiplication Table of 2$' ; Message

;================== Exercise 8 ==================
num_even db 5                 ; Number to check even/odd
msg8_even db 0dh,0ah,'Exercise 8: Number is Even$' ; Message
msg8_odd  db 0dh,0ah,'Exercise 8: Number is Odd$' ; Message

;================== Exercise 9 ==================
msg9   db 0dh,0ah,'Exercise 9: Enter 3 digits: $' ; Message to prompt input
result9Msg db 0dh,0ah,'Sum is: $' ; Message for sum output

;================== Exercise 10 ==================
num1_mul db 4                 ; First number for multiplication
num2_mul db 3                 ; Second number
msg10   db 0dh,0ah,'Exercise 10: Multiplication result: $' ; Message

.code
main proc

mov ax,@data                  ; Load data segment address into AX
mov ds,ax                     ; Initialize DS register with data segment

;================== Exercise 1 ==================
mov al, num1_8                ; Load first 8-bit number into AL
add al, num2_8                ; Add second 8-bit number
mov result1, al               ; Store result in variable
mov dx, offset msg1           ; Load message address into DX
mov ah, 09h                   ; DOS function 09h ? print string
int 21h                       ; Call DOS to display message
mov dl, result1               ; Move result to DL for display
add dl, 30h                   ; Convert number to ASCII
mov ah, 02h                   ; DOS function 02h ? print single character
int 21h                       ; Display result

;================== Exercise 2 ==================
mov ax, num1_16               ; Load first 16-bit number into AX
add ax, num2_16               ; Add second 16-bit number
mov result2, ax               ; Store result
mov dx, offset msg2           ; Load message address
mov ah, 09h                   ; DOS print string
int 21h                       ; Display message
mov dl, al                    ; Take lower byte of result (simplified display)
add dl, 30h                   ; Convert to ASCII
mov ah, 02h                   ; DOS print character
int 21h                       ; Display lower byte

;================== Exercise 3 ==================
mov al, num1_sub              ; Load first number for subtraction
sub al, num2_sub              ; Subtract second number
mov result_sub, al            ; Store result
mov dx, offset msg3           ; Load message
mov ah, 09h                   ; DOS print string
int 21h                       ; Display message
mov dl, result_sub            ; Move result to DL
add dl, 30h                   ; Convert to ASCII
mov ah, 02h                   ; DOS print char
int 21h                       ; Display result

;================== Exercise 4 ==================
mov al, num1_largest          ; Load first number
cmp al, num2_largest          ; Compare with second number
jc ex4_num2                   ; Jump to label if num1 < num2
mov bl, num1_largest          ; num1 is largest
jmp ex4_display               ; Jump to display

ex4_num2:
mov bl, num2_largest          ; num2 is largest

ex4_display:
mov dx, offset msg4           ; Load message
mov ah, 09h                   ; DOS print string
int 21h
mov dl, bl                    ; Move largest number to DL
add dl, 30h                   ; Convert to ASCII
mov ah, 02h                   ; DOS print char
int 21h                       ; Display number

;================== Exercise 5 ==================
mov al, num1_smallest         ; Load first number
cmp al, num2_smallest         ; Compare with second number
jc ex5_num1                   ; Jump if num1 < num2
mov bl, num2_smallest         ; num2 is smallest
jmp ex5_display               ; Jump to display

ex5_num1:
mov bl, num1_smallest         ; num1 is smallest

ex5_display:
mov dx, offset msg5           ; Load message
mov ah, 09h                   ; DOS print string
int 21h
mov dl, bl                    ; Move smallest number to DL
add dl, 30h                   ; Convert to ASCII
mov ah, 02h                   ; DOS print char
int 21h                       ; Display number

;================== Exercise 6 ==================
mov dx, offset msg6a          ; Load message "Before swapping"
mov ah, 09h                   ; DOS print string
int 21h
mov dl, num1_swap             ; Print num1
add dl, 30h                   ; Convert to ASCII
mov ah, 02h                   ; DOS print char
int 21h
mov dl,' '                    ; Print space
int 21h
mov dl, num2_swap             ; Print num2
add dl, 30h                   ; Convert to ASCII
int 21h

mov al, num1_swap             ; Swap values
mov bl, num2_swap
mov num1_swap, bl
mov num2_swap, al

mov dx, offset msg6b          ; Load message "After swapping"
mov ah, 09h                   ; DOS print string
int 21h
mov dl, num1_swap             ; Print swapped num1
add dl, 30h
mov ah, 02h
int 21h
mov dl,' '
int 21h
mov dl, num2_swap             ; Print swapped num2
add dl, 30h
int 21h

;================== Exercise 7 ==================
mov dx, offset msg7           ; Load message
mov ah, 09h                   ; DOS print string
int 21h
mov cl, 1                     ; Counter for multiplication table
ex7_table:
mov al, 2                     ; Number to multiply
mul cl                         ; Multiply AL by CL
add al, 30h                   ; Convert to ASCII
mov dl, al                    ; Move result to DL
mov ah, 02h                   ; Print character
int 21h
mov dl,0dh                    ; Print carriage return
int 21h
mov dl,0ah                    ; Print line feed
int 21h
inc cl                         ; Increment counter
cmp cl, 11                     ; Loop until 10
jne ex7_table

;================== Exercise 8 ==================
mov al, num_even              ; Load number to check
and al,1                      ; Mask LSB to check even/odd
jz ex8_even                   ; Jump if zero ? even
mov dx, offset msg8_odd       ; Otherwise, odd
jmp ex8_print
ex8_even:
mov dx, offset msg8_even
ex8_print:
mov ah, 09h                   ; DOS print string
int 21h

;================== Exercise 9 ==================
mov dx, offset msg9           ; Prompt message
mov ah, 09h                   ; DOS print string
int 21h
mov ah, 01h                   ; DOS read character
int 21h
sub al, 30h                   ; Convert ASCII to number
mov bl, al                    ; Store first number
mov ah, 01h                   ; Read second digit
int 21h
sub al, 30h
add bl, al                    ; Add second number
mov ah, 01h                   ; Read third digit
int 21h
sub al, 30h
add bl, al                    ; Add third number

mov dx, offset result9Msg     ; Display sum message
mov ah, 09h
int 21h
add bl,30h                    ; Convert sum to ASCII
mov dl, bl
mov ah, 02h
int 21h

;================== Exercise 10 ==================
mov al, num1_mul              ; Load first number
mov bl, num2_mul              ; Load second number
mul bl                         ; Multiply AL * BL
mov dx, offset msg10          ; Display message
mov ah, 09h
int 21h
add al,30h                    ; Convert to ASCII
mov dl, al
mov ah, 02h
int 21h

; Exit program
mov ah,4ch                    ; DOS terminate program
int 21h

main endp
end main
