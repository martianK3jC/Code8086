; Filename: EXER19.ASM
; Programmer Name: YOUR FULLNAME HERE
; Date: DATE TODAY
; Description: This assembly language program will get string input and
; display back string.

.model small
.stack 100h
.DATA
MAX_STRING_LENGTH EQU 1000
string_input DB MAX_STRING_LENGTH DUP (?)
InputPrompt DB 'Enter text: $'

.CODE
Exer19CodeStart:
    mov ax, @data
    mov ds, ax          ;set DS to point to the data segment
    mov dx, OFFSET InputPrompt
    mov ah, 9
    int 21h

    mov ah, 3fh         ; DOS read from handle function
    mov bx, 0           ; standard input handle
    mov cx, MAX_STRING_LENGTH   ; read up to maximum number of characters
    mov dx, OFFSET string_input ; store the string here
    int 21h             ; get the string    

    and ax, ax          ; were any character read?
    jz Done             ; no, so you're done
    mov cx, ax          ; put string length in CX where you can use it as a counter

    push cx             ; save the string length
    mov bx, OFFSET string_input 

    pop cx ; get back the string length
    mov ah,40h ; DOS write form handle function
    mov bx,1 ; standard output handle
    mov dx,OFFSET StringInput ; prepare to print the string
    int 21h ; print the string     

Done:
    mov ah, 4ch
    int 21h
END Exer19CodeStart