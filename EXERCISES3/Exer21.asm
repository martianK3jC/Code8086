; Filename: Exer21.asm
; Programmer Name: Kesha Jane L. Ceniza
; Date: September 14, 2025
; Description: This assembly language program will get string input and display the reverse of the string.

.MODEL small
.STACK 100h
.DATA
    FILENAMEMSG DB 'Filename: Exer21.asm', 13, 10, '$'
    NAMEMSG DB 'Programmer Name: Kesha Jane L. Ceniza', 13, 10, '$'
    DESCRIPTIONMSG DB 'Description: This assembly language program will get string input and display the reverse of the string.', 13, 10,'$'
    DATEMSG DB 'Date: September 14, 2025',13,10,13,10,'$'
MAX_STRING_LEN EQU 1000
stringToReverse DB MAX_STRING_LEN DUP(?)
reverseString DB MAX_STRING_LEN DUP(?)

.CODE
Exer21Start:
    mov ax, 0003h
    int 10h

    ;set up data segment
    mov ax, @data
    mov ds, ax

    ;display the header information
    lea dx, FILENAMEMSG
    mov ah, 09h
    int 21h

    lea dx, NAMEMSG
    mov ah, 09h
    int 21h

    lea dx, DESCRIPTIONMSG
    mov ah, 09h
    int 21h

    lea dx, DATEMSG
    mov ah, 09h
    int 21h

    ; Read string input
    mov ah, 3fh                     ; DOS read from handle function
    mov bx, 0                       ; standard input handle
    mov cx, MAX_STRING_LEN          ; read up to maximum number of characters
    mov dx, OFFSET stringToReverse  
    int 21h                         ; get the string

    and ax, ax
    jz Done

    mov cx, ax                      ; set cx to string length
    push cx                         ; save length
    mov bx, OFFSET stringToReverse  
    mov si, OFFSET reverseString    ; point to reverse string
    add si, cx                      ; move si to the end of reverse string
    dec si                          ; adjust to last character position

ReverseLoop:
    dec cx                          ; decrement counter before reading
    mov al, [bx]                    ; read character from original string
    mov [si], al                    ; store it in reverse position
    inc bx                          ; move to next character
    dec si                          ; move to previous position in reverse
    jnz ReverseLoop                 ; loop until all characters are reversed

    mov byte ptr [si], 0            ; null-terminate the reversed string

    ; Output the reversed string
    pop cx                          ; restore string length
    mov ah, 40h                     ; DOS write to file handle function
    mov bx, 1                       ; standard output handle
    mov dx, OFFSET reverseString    ; prepare to print the reversed string
    int 21h                         ; print the reversed string

Done:
    mov ah, 4ch                     ; DOS terminate program function
    int 21h                         ; terminate the program

END Exer21Start

