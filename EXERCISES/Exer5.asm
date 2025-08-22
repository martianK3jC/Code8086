; Filename: Exer5.asm
; Displaying:
; abcdefghijklmnopqrstuvwxyz
; A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
; Name: Kesha Jane L. Ceniza
; Date: August 22, 2025

.model small
.code
.stack 100
start:

; alphabet small letters

mov ah, 02h
mov dl, 'a'
int 21h

mov ah, 02h
mov dl, 'b'
int 21h

mov ah, 02h
mov dl, 'c'
int 21h

mov ah, 02h
mov dl, 'd'
int 21h

mov ah, 02h
mov dl, 'e'
int 21h

mov ah, 02h
mov dl, 'f'
int 21h

mov ah, 02h
mov dl, 'g'
int 21h

mov ah, 02h
mov dl, 'h'
int 21h

mov ah, 02h
mov dl, 'i'
int 21h

mov ah, 02h
mov dl, 'j'
int 21h

mov ah, 02h
mov dl, 'k'
int 21h

mov ah, 02h
mov dl, 'l'
int 21h

mov ah, 02h
mov dl, 'm'
int 21h

mov ah, 02h
mov dl, 'n'
int 21h

mov ah, 02h
mov dl, 'o'
int 21h

mov ah, 02h
mov dl, 'p'
int 21h

mov ah, 02h
mov dl, 'q'
int 21h

mov ah, 02h
mov dl, 'r'
int 21h

mov ah, 02h
mov dl, 's'
int 21h

mov ah, 02h
mov dl, 't'
int 21h

mov ah, 02h
mov dl, 'u'
int 21h

mov ah, 02h
mov dl, 'v'
int 21h

mov ah, 02h
mov dl, 'w'
int 21h

mov ah, 02h
mov dl, 'x'
int 21h

mov ah, 02h
mov dl, 'y'
int 21h

mov ah, 02h
mov dl, 'z'
int 21h

mov ah, 02h
mov dl, 0ah
int 21h

; alphabet big letters with space

mov ah, 02h
mov dl, 'A'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'B'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'C'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'D'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'E'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'F'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'G'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'H'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'I'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'J'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'K'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'L'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'M'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'N'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'O'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'P'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'Q'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'R'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'S'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'T'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'U'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'V'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'W'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'X'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'Y'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 'Z'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, ' '
int 21h

int 27h
end start






























