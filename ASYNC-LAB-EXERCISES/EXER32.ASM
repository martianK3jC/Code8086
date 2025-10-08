;FILENAME: EXER32.ASM
;PROGRAMMER NAME: KESHA JANE L. CENIZA
;DATE: OCTOBER 8, 2025
;DESCRIPTION: This assembly language program will input 2 single digit numbers, divide the 2 numbers, and display the quotient of the 2 numbers.

.model small
.stack 100h
.data
    ;Initializing/defining string variables
    msg1 db 0dh, 0ah, 'Enter first number(0-9): $'
    msg2 db 0dh, 0ah, 'Enter second number(1-9): $';Second number cannot be zero
    resultMsg db 0dh, 0ah, 'The result is: $'
    divByZeroMsg db 0dh, 0ah, 'Cannot divide by 0$'

    ;Declare single-byte variables for user inputs and result (uninitialized)
    num1 db ?
    num2 db ?
    result db ?
.code
start:
    ;Set up data segment
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

    ; Check for division by zero
    cmp num2, 0
    je div_by_zero

    ;DIVIDE 2 NUMBERS: NUM1 / NUM2------------------------------------------------------------
    ;Divide the second number from the first
    mov al, num1
    xor ah, ah; Clear ah for the division
    mov bl, num2
    div bl; AL = AL / BL, quotient in AL, remainder in AH
    mov result, al; Store the quotient

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

;Handling division by 0----------------------------------------------------------------------------
div_by_zero:
    ;Handle division by zero (optional: you can display a message)
    mov ah, 09h
    lea dx, divByZeroMsg
    int 21h

    ;Exit program
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
