; Filename: Exer7.asm
; Display with different foreground and background colors
; Name: Kesha Jane L. Ceniza
; Date: August 22, 2025


.model small
.code
.stack 100
start:


mov ah, 09h
mov bl, 60h
mov cx, 7
int 10h

mov ah, 02h
mov dl, 'C'
int 21h

mov ah, 02h
mov dl, 'o'
int 21h

mov ah, 02h
mov dl, 'l'
int 21h

mov ah, 02h
mov dl, 'l'
int 21h

mov ah, 02h
mov dl, 'e'
int 21h

mov ah, 02h
mov dl, 'g'
int 21h

mov ah, 02h
mov dl, 'e'
int 21h

mov ah, 09h
mov bl, 00h
mov cx, 100
int 10h

mov ah, 02h
mov dl, 0ah
int 21h

mov ah, 09h
mov bl, 46h
mov cx, 2
int 10h

mov ah, 02h
mov dl, 'o'
int 21h

mov ah, 02h
mov dl, 'f'
int 21h

mov ah, 09h
mov bl, 00h
mov cx, 1000
int 10h

mov ah, 02h
mov dl, 0ah
int 21h

mov ah, 09h
mov bl, 15h
mov cx, 8
int 10h

mov ah, 02h
mov dl, 'C'
int 21h

mov ah, 02h
mov dl, 'o'
int 21h

mov ah, 02h
mov dl, 'm'
int 21h

mov ah, 02h
mov dl, 'p'
int 21h

mov ah, 02h
mov dl, 'u'
int 21h

mov ah, 02h
mov dl, 't'
int 21h

mov ah, 02h
mov dl, 'e'
int 21h

mov ah, 02h
mov dl, 'r'
int 21h


mov ah, 09h
mov bl, 00h
mov cx, 100
int 10h


mov ah, 02h
mov dl, 0ah
int 21h


mov ah, 09h
mov bl, 7Fh
mov cx, 7
int 10h

mov ah, 02h
mov dl, 'S'
int 21h

mov ah, 02h
mov dl, 't'
int 21h

mov ah, 02h
mov dl, 'u'
int 21h

mov ah, 02h
mov dl, 'd'
int 21h

mov ah, 02h
mov dl, 'i'
int 21h

mov ah, 02h
mov dl, 'e'
int 21h

mov ah, 02h
mov dl, 's'
int 21h

mov ah, 09h
mov bl, 00h
mov cx, 100
int 10h

int 27h
end start

