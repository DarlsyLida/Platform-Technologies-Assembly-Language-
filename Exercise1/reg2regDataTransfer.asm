;program showing register to register data transfer
.MODEL SMALL ; In the SMALL model all code is placed in one physical segment and all data in another physical segment.

.STACK 100H  ;  stack 100h reserves 100h bytes for stack. org 100h sets the current address to 100h, that is the address the assembler is assuming. 
.DATA   ;

.CODE
main1 PROC
    
mov dx,48
mov ah,2
int 21h
main1 endp; end of procedure

main2 PROC
mov bl,02   
mov cl,03 ;regiser to register transfer
add bl,cl
add bl,48
mov dl,bl
mov ah,2
int 21h
main2 endp; end of procedure
