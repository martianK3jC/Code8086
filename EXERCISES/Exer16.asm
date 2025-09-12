; Filename: EXER16.ASM
; Programmer Name: KESHA JAME L. CENIZA 
; Date: September 12, 2025
; Description: This assembly language program will get character input and 
; display back character input.

.MODEL small
.STACK 200h
.DATA
; db means define byte or reserve 1 byte of memory
; variable to store the input character
; ? means don's assign an initial value to inputChar
inputChar db ? 
inputMsg db 'Enter a character: $'
outputMsg db 'You entered: $'
.CODE
CanBeAnyName:
    ;initialize the data segment
    mov ax, @data
    mov ds, ax

    ;display the input prompt message
    mov dx, offset inputMsg
    mov ah, 09h
    int 21h

    ; read a character from the keyboard
    mov ah, 01h ; function to read a character
    int 21h ; call DOS interrupt
    mov inputChar, al ; store the character in inputChar

    ;display the output message
    mov dx, offset outputMsg
    mov ah, 09h
    int 21h

    ;display the character back
    mov dl, inputChar ; load the character to DL
    mov ah, 02h ; function to display a character
    int 21h ; call DOS interrupt

    ;exit program
    mov ax, 4C00h
    int 21h
END CanBeAnyName
