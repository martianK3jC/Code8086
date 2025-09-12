; Filename: EXER15.ASM
; Programmer Name: KESHA JANE L. CENIZA
; Date: September 12, 2025
; Description: This assembly language program will display multiple string variables on separate lines.

.model small
.STACK 200h
.DATA
; Initialize and declare strings here 
String1 DB 'Line1', 0dh, 0ah, '$'
String2 DB 'Line2', 0dh, 0ah, '$'
String3 DB 'Line3', 0dh, 0ah, '$'
; carriage return (ASCII code 0Dh) positions the cursor to the left side of the current line of characters
; line feed (ASCII code 0ah) moves the cursor down one line on the output device

.CODE
ProgramStart:
mov ax, @data
mov ds, ax
mov ah, 9 ; DOS print string function
mov dx, OFFSET String1 ; Prints String1
int 21h ; invole DOS to print string

mov dx, OFFSET String2
int 21h
mov dx, OFFSET String3
int 21h

mov ah,4ch ; DOS terminate program function
int 21h ; invoke DOS to end program
END ProgramStart