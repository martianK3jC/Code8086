;FILENAME: EXER30.ASM
;PROGRAMMER NAME: KESHA JANE L. CENIZA
;DATE: OCTOBER 8, 2025
;DESCRIPTION: This assembly language program will input 2 single digit numbers, minus 2 numbers, and display the difference of the 2 numbers.

.model small
.stack 100h
.data
    msg1 db 'Enter first number: $'
    msg2 db 0dh, 0ah, 'Enter second number: $'
    resultMsg db 0dh, 0ah, 'The result is: $'

    num1 db ?
    num2 db ?
    result db ?

.code
start:
    ;set up data segment
    mov ax, @data
    mov ds, ax

    ;PROMPTING AND READING-------------------------------------------------------------------------
    ;Prompt/Display for the inputting first number message--1--
    mov ah, 09h ;-> can be interchanged with lea
    lea dx, msg1
    int 21h

    ;Read first number--1--
    call read_number
    mov num1, al

    ;Prompt/Display for the inputting second number message--2--
    mov ah, 09h
    lea dx, msg2
    int 21h

    ;Read second number--2--
    call read_number
    mov num2, al

    ;SUBTRACTING 2 NUMBERS: NUM1 - NUM2------------------------------------------------------------
    ;Subtract the second number from the first
    mov al, num1
    sub al, num2
    mov result, al

    ;DISPLAYING THE RESULT-------------------------------------------------------------------------
    ;Display the result
    mov ah, 09h
    lea dx, resultMsg
    int 21h

    ;Convert result to ASCII and print
    call print_result
    
    ;EXIT PROGRAM----------------------------------------------------------------------------------
    mov ax, 4C00h
    int 21h

;Read a number from keyboard (assumes single digit input, so pick from 0-9)------------------------
read_number proc
    mov ah, 01h; function to read a character
    int 21h

    sub al, '0'; Convert ASCII to integer
    ret
read_number endp

;Print the result (single digit)
print_result proc
    add result, '0'; Convert result to ASCII
    mov ah, 0eh; BIOS teletype output function
    mov al, result
    int 10h
    ret
print_result endp

end start



