; Filename: Exer6.asm
; Displaying:
; 0 1 2 3 4 5 6 7 8 9
; ! * # $ % ^ & * ( )
; - _ + = { } [ ] < ?
; ANY 20 SPECIAL SYMBOLS WITH SPACE IN BETWEEN
; Name: Kesha Jane L. Ceniza
; Date: August 22, 2025



.model small
.code
.stack 100
start:

; numbers
mov ah, 02h
mov dl, '0'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '1'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '2'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '3'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '4'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '5'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '6'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '7'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '8'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '9'
int 21h

mov ah, 02h
mov dl, 0ah
int 21h

; ! * # $ % ^ & * ( )

mov ah, 02h
mov dl, '!'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '*'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '#'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '$'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '%'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '^'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '&'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '*'
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, '('
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, ')'
int 21h

mov ah, 02h
mov dl, 0ah
int 21h

;- _ + = { } [ ] < ?
    mov ah, 02h
    mov dl, '-'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '_'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '+'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '='
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '{'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '}'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '['
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ']'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '<'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '?'
    int 21h
    mov dl, 0Ah
    int 21h

; ANY 20 SPECIAL SYMBOLS WITH SPACE IN BETWEEN : 

mov ah, 02h
mov dl, 01h
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 02h
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 03h
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 04h
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 05h
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 06h
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 0Eh
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 0Fh
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 10h
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 1Eh
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 11h
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 12h
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 13h
int 21h


mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 14h
int 21h


mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 15h
int 21h


mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 16h
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 17h
int 21h

mov ah, 02h
mov dl, ' '
int 21h
 
mov ah, 02h
mov dl, 1Fh
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 0Bh
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 1Bh
int 21h

mov ah, 02h
mov dl, ' '
int 21h

mov ah, 02h
mov dl, 0Ch
int 21h


int 27h
end start
















































































