;FILENAME: EXER28.ASM
;PROGRAMMER NAME: KESHA JANE L. CENIZA
;DATE: OCTOBER 8, 2025
;DESCRIPTION: This assembly language program will get 3 string inputs and display back the 3 strings on separate lines
;DOS -> Disk Operating System

;to start the program------------------------------------------------------------------------------
.MODEL SMALL
.STACK 100h
.DATA
    inputString1 DB 50 DUP('$'); Reserve 50 bytes for input string
    inputString2 DB 50 DUP('$')
    inputString3 DB 50 DUP('$')

    promptString1 DB 'Enter first string: $'
    promptString2 DB 'Enter second string: $'
    promptString3 DB 'Enter third string: $'

    outputString1 DB 'You entered first string: $'
    outputString2 DB 'You entered second string: $'
    outputString3 DB 'You entered third string: $'
.CODE
MAIN PROC
    ;Initialize ".DATA" segment--------------------------------------------------------------------
    mov ax, @DATA
    mov ds, ax

    ;PROMPTING AND READING INPUT STRINGS-----------------------------------------------------------
    ;Prompt the user for input first string---1---
    lea dx, promptString1
    mov ah, 09h
    int 21h

    ;Read input first string---1---
    lea dx, inputString1
    mov ah, 0Ah; DOS function to read a string
    int 21h

    ;display new line---1---
    mov ah, 02h
    mov dl, 0Ah
    int 21h

    ;Prompt the user for input second string---2---
    lea dx, promptString2
    mov ah, 09h; DOS function to display a string
    int 21h

    ;Read input second string---2---
    lea dx, inputString2
    mov ah, 0Ah; DOS function to read a string
    int 21h

    ;display new line---2---
    mov ah, 02h
    mov dl, 0Ah
    int 21h

    ;Prompt the user for input third string---3---
    LEA DX, promptString3
    MOV AH, 09h; DOS function to display a string
    INT 21h

    ;Read input third string---3---
    lea dx, inputString3
    mov ah, 0Ah; DOS function to read a string
    int 21h

    ;display new line---3---
    mov ah, 02h
    mov dl, 0Ah
    int 21h

    ;DISPLAYING THE MESSAGES-----------------------------------------------------------------------
    ;Display the output message for the first string---1---
    lea dx, outputString1
    mov ah, 09h; DOS function to display a string
    int 21h

    ;Display the entered first string---1---
    lea dx, inputString1 + 2; Skip the first 2 bytes (length and max length)
    mov ah, 09h; DOS function to display a string
    int 21h

    ;Display new line---1---
    mov ah, 02h
    mov dl, 0ah
    int 21h

    ;Display the output message for the second string---2---
    lea dx, outputString2
    mov ah, 09h; DOS function to display a string
    int 21h

    ;Display the entered second string---2---
    lea dx, inputString2 + 2; Skip the first 2 bytes (length and max length)
    mov ah, 09h; DOS function to display a string
    int 21h

    ;Display new line---2---
    mov ah, 02h
    mov dl, 0ah
    int 21h

    ;Display the output message for the third string---3---
    lea dx, outputString2
    mov ah, 09h; DOS function to display a string
    int 21h

    ;Display the entered third string---3---
    lea dx, inputString3 + 2; Skip the first 2 bytes (length and max length)
    mov ah, 09h; DOS function to display a string
    int 21h

    ;Display new line---3---
    mov ah, 02h
    mov dl, 0ah
    int 21h

;EXIT THE PROGRAM----------------------------------------------------------------------------------
mov ax, 4C00h; DOS function to terminate program
int 21h
MAIN ENDP
END MAIN