;FILENAME: EXER33.ASM
;PROGRAMMER NAME: KESHA JANE L. CENIZA
;DATE: OCTOBER 8, 2025
;DESCRIPTION: Create a program that inputs a character. If the character is the capital letter A, display message "You entered A.", else display "You entered not A".

.model small
.stack 100h
.data
    ;Initializing/defining string variables
    msg1 db 0dh, 0ah, 'Enter a character: $'
    msgA db 0dh, 0ah, 'You entered A.$'
    msgNotA db 0dh, 0ah, 'You entered not A.$'

    ;Declare single-byte variable for user input (uninitialized)
    inputChar db ?

.code
start:
    ;Set up data segment
    ;This initializes the DS register to point to our data segment
    mov ax, @data       ; Load address of data segment into AX
    mov ds, ax          ; Move AX into DS (can't load DS directly)

    ;PROMPTING AND READING INPUT-------------------------------------------------------
    ;Display prompt message asking user to enter a character
    mov ah, 09h         ; DOS function 09h - Display string
    lea dx, msg1        ; Load effective address of msg1 into DX
    int 21h             ; Call DOS interrupt to display the string

    ;Read single character from keyboard
    mov ah, 01h         ; DOS function 01h - Read character with echo
    int 21h             ; Call DOS interrupt, character stored in AL
    mov inputChar, al   ; Store the input character in our variable

    ;COMPARING CHARACTER WITH 'A'------------------------------------------------------
    ;Compare the input character with capital letter 'A' (ASCII value 41h or 65 decimal)
    cmp inputChar, 'A'  ; Subtract 'A' from inputChar and set flags (ZF=1 if equal)
    je is_A             ; Jump to is_A label if ZF=1 (meaning inputChar == 'A')

    ;If we reach here, the character is NOT 'A'
    ;Display "You entered not A" message
    mov ah, 09h         ; DOS function 09h - Display string
    lea dx, msgNotA     ; Load address of msgNotA into DX
    int 21h             ; Call DOS interrupt to display the string
    jmp exit_program    ; Jump to exit (skip the is_A section)

is_A:
    ;This section executes only if user entered 'A'
    ;Display "You entered A." message
    mov ah, 09h         ; DOS function 09h - Display string
    lea dx, msgA        ; Load address of msgA into DX
    int 21h             ; Call DOS interrupt to display the string

exit_program:
    ;EXIT PROGRAM----------------------------------------------------------------------
    ;Terminate program and return control to DOS
    mov ax, 4C00h       ; DOS function 4Ch - Terminate program with return code 0
    int 21h             ; Call DOS interrupt to exit

end start