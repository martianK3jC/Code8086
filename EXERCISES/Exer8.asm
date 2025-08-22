; ; Filename: Exer8.asm
; ; Display colored patterns (big cross)
; ; Name: Kesha Jane L. Ceniza
; ; Date: August 22, 2025

.model small
.stack 100
.data
    square db 0FEh,'$'     ; "■" symbol, '$' ends the string for AH=09h
.code
start:

    mov ax, @data       ; initialize data segment
    mov ds, ax
    mov ah, 02h         ; print character function
    
    
; Manually print the cross pattern using ASCII characters

    ; Line 1: "        "
    mov ah, 09h 
	mov bl, 10h 
	mov cx, 8 ;num of characters to apply color 
	int 10h


    mov ah, 02h
    mov dl, ' '    ; Space
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    ; New line
    mov ah,02h 
	mov cl,0Ah ;newline
	mov dl,cl	
	int 21h	

    mov ah, 09h 
	mov bl, 00h 
	mov cx, 100
	int 10h

    ; Line 2: "   XX   "
    mov ah, 09h 
	mov bl, 14h 
	mov cx, 8 ;num of characters to apply color 
	int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, square
    int 21h             ; 1st square
    mov dl, square
    int 21h             ; 2nd square
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    ; New line
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    mov ah, 09h 
	mov bl, 00h 
	mov cx, 100
	int 10h

    ; Line 3: "   XX   "
    mov ah, 09h 
	mov bl, 14h 
	mov cx, 8 ;num of characters to apply color 
	int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, square
    int 21h            
    mov dl, square
    int 21h             
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    ; New line
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    mov ah, 09h 
	mov bl, 00h 
	mov cx, 100
	int 10h

    ; Line 4: "XXXXXXXX"
    mov ah, 09h 
	mov bl, 14h 
	mov cx, 8 ;num of characters to apply color 
	int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h             
    mov dl, square
    int 21h             
    mov dl, square
    int 21h            
    mov dl, square
    int 21h          
    mov dl, square
    int 21h            
    mov dl, square
    int 21h          
    mov dl, square
    int 21h            
    mov dl, ' '
    int 21h          
    ; New line
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    mov ah, 09h 
	mov bl, 00h 
	mov cx, 100
	int 10h

    ; Line 5: "   XX   "
    mov ah, 09h 
	mov bl, 14h 
	mov cx, 8 ;num of characters to apply color 
	int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, square
    int 21h            
    mov dl, square
    int 21h          
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    ; New line
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    mov ah, 09h 
	mov bl, 00h 
	mov cx, 100
	int 10h

    ; Line 6: "   XX   "
    mov ah, 09h 
	mov bl, 14h 
	mov cx, 8 ;num of characters to apply color 
	int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, square
    int 21h            
    mov dl, square
    int 21h          
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    ; New line
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    mov ah, 09h 
	mov bl, 00h 
	mov cx, 100
	int 10h

    ; Line 7: "        "
    mov ah, 09h 
	mov bl, 11h 
	mov cx, 8 ;num of characters to apply color 
	int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    ; New line
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    mov ah, 09h 
	mov bl, 00h 
	mov cx, 100
	int 10h

    ; Wait for a key press
    mov ah, 00h
    int 16h

    ; Terminate the program
    mov ah, 4Ch
    int 21h



mov ah, 09h
mov al, ' '
mov bl, 11h; blue
mov cx, 3
int 10h 



mov ah, 09h
mov al, ' '
mov bl, 44h ; red
mov cx, 5
int 10h 



mov ah, 02h
mov dl , ' '
int 21h 

mov ah, 09h
mov al, ' '
mov bl, 11h ; blue
mov cx, 9
int 10h 

mov ah, 02h
mov dl , 0ah
int 21h 

mov ah, 09h
mov bl, 00h
mov cx, 1000
int 10h 

mov ah, 09h
mov bl, 11h
mov cx, 8
int 10h 

mov ah, 02h
mov dl , 0ah
int 21h 

mov ah, 09h
mov bl, 00h
mov cx, 1000
int 10h 


mov ah, 09h
mov bl, 11h
mov cx, 8
int 10h 

mov ah, 02h
mov dl , 0ah
int 21h 

mov ah, 09h
mov bl, 00h
mov cx, 1000
int 10h 


mov ah, 09h
mov bl, 11h
mov cx, 8
int 10h 

mov ah, 02h
mov dl , 0ah
int 21h 

mov ah, 09h
mov bl, 00h
mov cx, 1000
int 10h 


mov ah, 09h
mov bl, 11h
mov cx, 8
int 10h 

mov ah, 02h
mov dl , 0ah
int 21h 

mov ah, 09h
mov bl, 00h
mov cx, 1000
int 10h 



end start
