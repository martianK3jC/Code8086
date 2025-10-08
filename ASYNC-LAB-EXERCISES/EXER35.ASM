;FILENAME: EXER35.ASM
;PROGRAMMER NAME: KESHA JANE L. CENIZA
;DATE: OCTOBER 8, 2025
;DESCRIPTION: Make a program to input 2 integers. Compare the 2 integers. Display which one is smaller and bigger of the 2 integers.


.model small
.stack 100h
.data
    ;Initializing/defining string variables
    msg1 db 0dh, 0ah, 'Enter first number (0-9): $'
    msg2 db 0dh, 0ah, 'Enter second number (0-9): $'

    ;Result messages
    resultMsg1 db 0dh, 0ah, 'First number ($'
    resultMsg2 db ') is $'
    resultMsg3 db 0dh, 0ah, 'Second number ($'

    smallerMsg db 'smaller$'
    biggerMsg db 'bigger$'
    equalMsg db 0dh, 0ah, 'Both numbers are equal!$'
    
    ;Declare single-byte variable for user input (uninitialized)
    num1 db ?
    num2 db ?

.code
start:
    ;Set up data segment
    ;This initializes the DS register to point to our data segment
    mov ax, @data       ; Load address of data segment into AX
    mov ds, ax          ; Move AX into DS (can't load DS directly)

    ;PROMPTING AND READING INPUT-------------------------------------------------------
    ;Display prompt message asking user to enter first number               --1--
    mov ah, 09h         ; DOS function 09h - Display string
    lea dx, msg1        ; Load effective address of msg1 into DX
    int 21h             ; Call DOS interrupt to display the string

    ;Read single character (digit) from keyboard                            --2--
    call read_number    ; Call procedure to read and convert number
    mov num1, al        ; Store first number in num1

    ;Display prompt message asking user to enter second number              --2--
    mov ah, 09h         ; DOS function 09h - Display string
    lea dx, msg2        ; Load effective address of msg2 into DX
    int 21h             ; Call DOS interrupt to display the string

    ;Read single character (digit) from keyboard                            --2--
    call read_number    ; Call procedure to read and convert number
    mov num2, al        ; Store first number in num1

    
    ;COMPARING num1 WITH num2-----------------------------------------------------------
    ;Compare the first number with second number
    mov al, num1    ; Load first number into AL
    cmp al, num2    ; Compare al (num1) with num2, sets flags

    je numbers_equal    ; Jump if equal (ZF=1) - both numbers are the same
    jl first_smaller    ; Jump if less (num1 < num2)
    jg first_bigger     ; Jump if bigger (num1 > num2)

;IF NUM1 IS LESS THAN NUM2-----------------------------------------------------------------------------------------------
first_smaller:
    ;This executes when num1 < num2

    ;Display "First number (X) is smaller"-------------------------------------------------
    mov ah, 09h         
    lea dx, resultMsg1; "First number ("  
    int 21h             

    ;Display first number
    call print_num1; X

    mov ah, 09h
    lea dx, resultMsg2; ") is "
    int 21h

    mov ah, 09h
    lea dx, smallerMsg; "smaller" 
    int 21h

    ;Display "Second number (X) is bigger"-------------------------------------------------
    mov ah, 09h         
    lea dx, resultMsg3; "Second number ("  
    int 21h             

    ;Display first number
    call print_num2; X

    mov ah, 09h
    lea dx, resultMsg2; ") is "
    int 21h

    mov ah, 09h
    lea dx, biggerMsg; "bigger" 
    int 21h

    jmp exit_program    

;IF NUM1 IS GREATER THAN NUM2-----------------------------------------------------------------------------------------------
first_bigger:
    ;This executes when num1 > num2
    ;Display "First number (X) is bigger"-------------------------------------------------
    mov ah, 09h         
    lea dx, resultMsg1; "First number ("  
    int 21h             

    ;Display first number
    call print_num1; X

    mov ah, 09h
    lea dx, resultMsg2; ") is "
    int 21h

    mov ah, 09h
    lea dx, biggerMsg; "bigger" 
    int 21h

    ;Display "Second number (X) is smaller"-------------------------------------------------
    mov ah, 09h         
    lea dx, resultMsg3; "Second number ("  
    int 21h             

    ;Display first number
    call print_num2; X

    mov ah, 09h
    lea dx, resultMsg2; ") is "
    int 21h

    mov ah, 09h
    lea dx, smallerMsg; "smaller" 
    int 21h

    jmp exit_program

numbers_equal:
    ;This executes when num1 == num2
    ;Display "Both numbers are equal!" message
    mov ah, 09h         ; DOS function 09h - Display string
    lea dx, equalMsg
    int 21h             ; Call DOS interrupt to display the string
    ;No jump needed here since exit_program follows immediately

exit_program:
    ;EXIT PROGRAM----------------------------------------------------------------------
    ;Terminate program and return control to DOS
    mov ax, 4C00h       ; DOS function 4Ch - Terminate program with return code 0
    int 21h             ; Call DOS interrupt to exit

;PROCEDURES-----------------------------------------------------------------------------------------------------------------------------------------
;Read a number from keyboard (assumes single digit input 0-9)
read_number proc
    mov ah, 01h     ;DOS function 01h - Read character with echo
    int 21h         ; Call DOS to interrupt to exit

    sub al, '0'     ;Convert ASCII to integer (subtract 30h)
    ret             ;Return to caller with result in al
read_number endp

;Print num1 as ASCII character
print_num1 proc
mov al, num1        ;Load num1 into al
add al, '0'         ;Convert intager to ASCII
mov dl, al          ;Move to dl for output
mov ah, 02h         ;DOS function 02h - Display character
int 21h             ;Call DOS interrupt
ret                 
print_num1 endp

;Print num2 as ASCII character
print_num2 proc
mov al, num2        ;Load num2 into al
add al, '0'         ;Convert intager to ASCII
mov dl, al          ;Move to dl for output
mov ah, 02h         ;DOS function 02h - Display character
int 21h             ;Call DOS interrupt
ret                 
print_num2 endp

end start



