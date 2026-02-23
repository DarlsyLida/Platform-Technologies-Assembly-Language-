;program for using ascii chars to display data on screen
.MODEL SMALL 
.data

main2 PROC 
mov dl,10 
mov ah,2
int 21h
mov dl,10 
mov ah,2
int 21h
mov dl,10
mov ah,2
int 21h
mov dl,10
mov ah,2
int 21h
mov dl,13 
mov ah,2
int 21h
mov bl,02   
mov cl,03 ;regiser to register transfer
add bl,cl
add bl,48
mov dl,bl
mov ah,2
int 21h
main2 endp; end of procedure
end   ;end of file
