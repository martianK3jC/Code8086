; Filename: Exer23.asm
; Programmer name: Kesha Jane L. Ceniza
; Description: Create a program that asks user to input a character. Determine of characater is letter A and display message "Yes, you have entered letter A." If not, display "No, you have not entered letter A. You entered character _."
; Date: Spetember 14, 2025


.model small
.STACK 100h
.DATA
    FILENAMEMSG DB 'Filename: Exer23.asm', 13, 10, '$'
    NAMEMSG DB 'Programmer name: Kesha Jane L. Ceniza', 13, 10, '$'
    DESCRIPTIONMSG DB 'Description: Create a program that asks user to input a character. Determine of characater is letter A and display message "Yes, you have entered letter A." If not, display "No, you have not entered letter A. You entered character _.', 13, 10, '$'
    DATEMSG DB 'Date: September 14, 2025', 13, 10, '$'

    prompt DB 'Enter a character: $'
    yesMsg DB 13,10, 'Yes, you have entered letter A.', 13, 10, '$'
    noMsg DB 13,10, 'No, you have not entered letter A. You entered character ', '$'

    newline DB 13,10, '$'
    inputChar DB ?

.CODE
Exer23Start:
    mov ax, 0003h
    int 10h

    ; set up data segment
    mov ax, @data
    mov ds, ax

    ; display the header information
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

    mov dx, offset newline
    mov ah, 09h
    int 21h

    mov dx, offset newline
    mov ah, 09h
    int 21h

    mov ah, 01h         ; DOS input character function
    int 21h
    mov inputChar, al   ; Store the input character

    cmp inputChar, 'A'
    je IsLetterA        ; If equal to 'A', jump to IsLetterA

    ; Display "No, you have not entered letter A"
    mov dx, offset noMsg
    mov ah, 09h
    int 21h

    ; Display the input character
    mov dl, inputChar
    mov ah, 02h
    int 21h

    ; Jump to end of the program
    jmp EndProgram

IsLetterA:
    ; Display "Yes, you have entered letter A."
    mov dx, offset yesMsg
    mov ah, 09h
    int 21h

EndProgram:
    ; Exit
    mov ax, 4C00h
    int 21h

END Exer23Start