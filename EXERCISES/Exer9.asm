; Filename: Exer9.asm
; Displaying emojis and blinking characters (blinking red heart)
; Name: Kesha Jane L. Ceniza
; Date: August 22, 2025


.model small
.stack 100
.code
start:

    ; I
    mov ah, 09h 
	mov bl, 4Fh 
	mov cx, 1 ;num of characters to apply color 
	int 10h

    mov ah, 02h
    mov dl, 'I'
    int 21h

    ; space
    mov ah,02h 
	mov cl,20h ;space
	mov dl,cl	
	int 21h	

    mov ah,09h
	mov bl,84h 
	mov cx,1
	int 10h

    mov ah,02h 
	mov cl,03h 
	mov dl,cl	
	int 21h	

    ; space
    mov ah,02h 
	mov cl,20h 
	mov dl,cl	
	int 21h	

    mov ah, 09h 
	mov bl, 4Fh 
	mov cx, 1  
	int 10h

    mov ah, 02h
    mov dl, 'U'
    int 21h

    mov ah, 00h
    int 16h

int 27h
end start




