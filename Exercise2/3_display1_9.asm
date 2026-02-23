
.model small
.stack 100h


.code
main proc
    mov cx, 9 ;Loop counter for 9 digit
    mov dl, '1' ;Start with ASCII '1'
    
print: 
      mov ah, 02h  ;DOS function to print character
      int 21h ; print digit
      inc dl ;Move to next digit
      loop print ; Repeat loop
      
      mov ah, 4Ch ; Exit program
      int 21h
main endp
end main



