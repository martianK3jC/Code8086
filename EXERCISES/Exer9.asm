; Filename: Exer9.asm
; Displaying emojis and blinking characters (blinking red heart)
; Name: Kesha Jane L. Ceniza
; Date: August 22, 2025


.model small
.stack 100
.data
    heart db 0FEh, '♥', '$' ; "♥" symbol, '$' ends the string for AH=09h
.code
start:

    ; I
    mov ah, 09h 
	mov bl, 4Fh 
	mov cx, 1 ;num of characters to apply color 
	int 10h

    mov ah, 02h
    mov dl, 'I'    ; I
    int 21h

    ; space
    mov ah,02h 
	mov cl,20h ;space
	mov dl,cl	
	int 21h	

    mov ah,09h
	mov bl,84h ;8=blink, 5=purple foreground
	mov cx,1
	int 10h

    mov ah,02h 
	mov cl,03h ;heart
	mov dl,cl	
	int 21h	

    ; space
    mov ah,02h 
	mov cl,20h ;space
	mov dl,cl	
	int 21h	

    mov ah, 09h 
	mov bl, 4Fh 
	mov cx, 1 ;num of characters to apply color 
	int 10h

    mov ah, 02h
    mov dl, 'U'    ; heart
    int 21h

    mov ah, 00h
    int 16h

int 27h
end start




