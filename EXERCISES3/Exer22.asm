; Filename: Exer22.asm
; Programmer name: Kesha Jane L. Ceniza
; Description: Create a program that asks the user to input 3 characters. Then display each character on its own line
; Date: Spetember 14, 2025

.MODEL small
.STACK 100h
.DATA
    FILENAMEMSG DB 'File name: Exer22.asm',13, 10, '$'
    NAMEMSG DB 'Programmer name: Kesha Jane L. Ceniza',13, 10, '$'
    DESCRIPTIONMSG DB 'Description: Create a program that asks the user to input 3 characters. Then display each character on its own line',13, 10, '$'
    DATEMSG DB 'Date: September 14, 2025',13, 10, 13, 10, '$'

    inputChar1 db ?                                         ; variable to store the first input character
    inputMsg1 db 'Enter first character: $'
    outputMsg1 db 'The first character is: $', 13, 10, '$'  ; add newline

    inputChar2 db ?
    inputMsg2 db 'Enter second character: $'
    outputMsg2 db 'The second character is: $', 13, 10, '$'

    inputChar3 db ?
    inputMsg3 db 'Enter third character: $'
    outputMsg3 db 'The third character is: $', 13, 10, '$'

    ; Add an extra newline for better formatting outputs
    newline db 13, 10, '$'

.CODE
Exer22Start:
    mov ax, 0003h
    int 10h

    ; Set up data segment
    mov ax, @data
    mov ds, ax

    ; Display the header information
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

    ; Display the input prompt message for the first character
    mov dx, offset inputMsg1
    mov ah, 09h
    int 21h

    ; Read the first character from the keyboard
    mov ah, 01h             ; Function to read a character
    int 21h                 ; Call DOS intperrupt
    mov inputChar1, al      ; Store the character in inputChar1

    ; Display a newline before prompting for the second character
    mov dx, offset newline
    mov ah, 09h
    int 21h

    ; Display the input prompt message for the second character
    mov dx, offset inputMsg2
    mov ah, 09h
    int 21h

    ; Read the second character from the keyboard
    mov ah, 01h
    int 21h
    mov inputChar2, al

    ; Display a newline before prompting for the third character
    mov dx, offset newline
    mov ah, 09h
    int 21h

    ; Display input prompt message for the third character
    mov dx, offset inputMsg3
    mov ah, 09h
    int 21h

    ; Read the third character from the keyboard
    mov ah, 01h
    int 21h
    mov inputChar3, al

    ; Display new line before outputting the characters
    mov dx, offset newline
    mov ah, 09h
    int 21h

    ; Display the output message for the 1st character
    mov dx, offset outputMsg1
    mov ah, 09h
    int 21h

    ; Display the first character back
    mov dl, inputChar1      ; Load the character to dl
    mov ah, 02h             ; function to display a character
    int 21h                 ; call dos interrupt

    ; add newline after first output
    mov dx, offset newline
    mov ah, 09h
    int 21h

    ; display 2nd output message
    mov dx, offset outputMsg2
    mov ah, 09h
    int 21h

    ; display the second character back
    mov dl, inputChar2
    mov ah, 02h
    int 21h

    ; add extra newlines
    mov dx, offset newline
    mov ah, 09h
    int 21h

    ; display 3rd output message
    mov dx, offset outputMsg3
    mov ah, 09h
    int 21h

    ; display the third character back
    mov dl, inputChar3
    mov ah, 02h
    int 21h

    ;Exit program
    mov ax, 4C00h  ; function to exit program
    int 21h

END Exer22Start