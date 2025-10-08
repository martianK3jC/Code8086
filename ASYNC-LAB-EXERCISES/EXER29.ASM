;FILENAME: EXER29.ASM
;PROGRAMMER NAME: KESHA JANE L. CENIZA
;DATE: OCTOBER 8, 2025
;DESCRIPTION: This assembly language program will input 2 single digit numbers, add 2 numbers, and display the sum of the 2 numbers.

;to start the program------------------------------------------------------------------------------
.model small
.stack 100h
.data
    num1 DB ?
    num2 DB ?
    sum DB ?

    msg1 DB 'Enter first number (0-9): $'
    msg2 DB 0dh, 0ah, 'Enter second number (0-9): $'
    msg3 DB 0DH, 0AH, 'The sum is: $'
.code
main proc
    ;initialize data segment
    mov ax, @DATA; check later, if it does not work -> change to @data
    mov ds, ax

    ;INPUTTING AND READING NUMBER------------------------------------------------------------------
    ;Display msg1--1--
    lea dx, msg1
    mov ah, 09h
    int 21h

    ;Read character input--1--
    mov ah, 01h
    int 21h

    sub al, '0'; Convert ASCII to number
    mov num1, al

    ;Display msg2--2--
    lea dx, msg2
    mov ah, 09h
    int 21h

    ;Read character input--2--
    mov ah, 01h
    int 21h

    sub al, '0'; Convert ASCII to number
    mov num2, al

    ;Calculate sum
    mov al, num1
    add al, num2
    mov sum, al

    ;Display result--------------------------------------------------------------------------------
    lea dx, msg3
    mov ah, 09h
    int 21h

    ;Convert sum to ASCII
    add sum, '0'
    mov dl, sum
    mov ah, 02h
    int 21h

    ;Exit program------------------------------------------------------------------------------------
    mov ax, 4C00h
    int 21h

main endp
end main



