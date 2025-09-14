; Filename: Exer15.asm
; Name: KESHA JANE L. CENIZA
; Date: September 12, 2025
;  This assembly language program will display multiple string variables on a single line.

.MODEL small
.STACK 200h
.DATA
String1 DB 'Line1', '$' ;DB = Define Byte String1 variable and assign 'Line1' value
; Line1 = value


String2 DB 'Line2','$'
String3 DB 'Line3', '$' ;$ is a string terminator or end of string

.CODE
ProgramStart:
    mov ax, @data
    mov ds, ax
    ; DOS print string function
    mov ah, 9
    ; 1st string to print
    mov dx, OFFSET String1
    ; invoke DOS to print string
    int 21h
    ; OFFSET means put address of String1 into register dx
    mov dx, OFFSET String2
    int 21h
    mov dx, OFFSET String3
    int 21h

    mov ah, 4ch
    int 21h
END ProgramStart