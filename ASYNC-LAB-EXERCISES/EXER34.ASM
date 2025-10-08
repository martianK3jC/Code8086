;FILENAME: EXER34.ASM
;PROGRAMMER NAME: KESHA JANE L. CENIZA
;DATE: OCTOBER 8, 2025
;DESCRIPTION: Create a program that inputs a number. Display the following messages depending on the value of the number entered:
; "The number is equal to 5."
; "The number is less than 5."
; "The number is greater than 5."

.model small
.stack 100h
.data
    ;Initializing/defining string variables
    msg1 db 0dh, 0ah, 'Enter a number (0-9): $'
    msgEqual db 0dh, 0ah, 'The number is equal to 5.$'
    msgLess db 0dh, 0ah, 'The number is less than 5.$'
    msgGreater db 0dh, 0ah, 'The number is greater than 5.$'

    ;Declare single-byte variable for user input (uninitialized)
    inputNum db ?

.code
start:
    ;Set up data segment
    ;This initializes the DS register to point to our data segment
    mov ax, @data       ; Load address of data segment into AX
    mov ds, ax          ; Move AX into DS (can't load DS directly)

    ;PROMPTING AND READING INPUT-------------------------------------------------------
    ;Display prompt message asking user to enter a number
    mov ah, 09h         ; DOS function 09h - Display string
    lea dx, msg1        ; Load effective address of msg1 into DX
    int 21h             ; Call DOS interrupt to display the string

    ;Read single character (digit) from keyboard
    mov ah, 01h         ; DOS function 01h - Read character with echo
    int 21h             ; Call DOS interrupt, character stored in AL
    
    ;Convert ASCII to actual number value
    sub al, '0'         ; Subtract ASCII '0' (30h) to get numeric value
    mov inputNum, al    ; Store the numeric value in our variable

    ;COMPARING NUMBER WITH 5-----------------------------------------------------------
    ;Compare the input number with 5
    cmp inputNum, 5     ; Subtract 5 from inputNum and set flags
    je is_equal         ; Jump to is_equal if ZF=1 (inputNum == 5)
    jl is_less          ; Jump to is_less if SF≠OF (inputNum < 5)
    jg is_greater       ; Jump to is_greater if ZF=0 and SF=OF (inputNum > 5)

is_equal:
    ;This section executes only if user entered 5
    ;Display "The number is equal to 5." message
    mov ah, 09h         ; DOS function 09h - Display string
    lea dx, msgEqual    ; Load address of msgEqual into DX
    int 21h             ; Call DOS interrupt to display the string
    jmp exit_program    ; Jump to exit (skip other conditions)

is_less:
    ;This section executes only if user entered a number less than 5 (0-4)
    ;Display "The number is less than 5." message
    mov ah, 09h         ; DOS function 09h - Display string
    lea dx, msgLess     ; Load address of msgLess into DX
    int 21h             ; Call DOS interrupt to display the string
    jmp exit_program    ; Jump to exit (skip other conditions)

is_greater:
    ;This section executes only if user entered a number greater than 5 (6-9)
    ;Display "The number is greater than 5." message
    mov ah, 09h         ; DOS function 09h - Display string
    lea dx, msgGreater  ; Load address of msgGreater into DX
    int 21h             ; Call DOS interrupt to display the string
    ;No jump needed here since exit_program follows immediately

exit_program:
    ;EXIT PROGRAM----------------------------------------------------------------------
    ;Terminate program and return control to DOS
    mov ax, 4C00h       ; DOS function 4Ch - Terminate program with return code 0
    int 21h             ; Call DOS interrupt to exit

end start