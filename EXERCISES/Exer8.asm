; ; Filename: Exer8.asm
; ; Display colored patterns (big cross)
; ; Name: Kesha Jane L. Ceniza
; ; Date: August 22, 2025

.model small
.stack 100
.code
start:
     ;line 1
    mov ah, 09h 
	mov bl, 11h 
	mov cx, 8 ;num of characters to apply color 
	int 10h

    ; line 2
    mov ah, 02h 
	mov dl, 0ah
	int 21h	

    mov ah, 09h 
	mov bl, 11h 
	mov cx, 8
	int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 44h
    mov cx, 2
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

    mov ah, 09h 
    mov bl, 00h
    mov cx, 100
    int 10h

    ; line 3

    mov ah, 02h
    mov dl, 0ah
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 44h
    mov cx, 6
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

    mov ah, 09h 
    mov bl, 00h
    mov cx, 100
    int 10h

    ; line 4
    mov ah, 02h
    mov dl, 0ah
    int 21h

    mov ah, 09h 
	mov bl, 11h 
	mov cx, 8
	int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 44h
    mov cx, 2
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

    mov ah, 09h 
    mov bl, 00h
    mov cx, 100
    int 10h


    

    ; line 5
    mov ah, 02h
    mov dl, 0ah
    int 21h

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

    mov ah, 09h 
    mov bl, 00h
    mov cx, 100
    int 10h

int 27h
end start
