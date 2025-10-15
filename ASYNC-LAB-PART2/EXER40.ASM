;FILENAME: EXER40.ASM
;PROGRAMMER NAME: KESHA JANE L. CENIZA
;DATE: OCTOBER 15, 2025
;DESCRIPTION: This program repeatedly asks user to input a single digit number
;             until the number entered is zero. Displays "Thank you." when zero is entered.

.model small
.stack 100h
.data
    promptMsg db 'Enter a single digit number: $'
    thankMsg db 'Thank you.$'
    newline db 0dh, 0ah, '$'
    userInput db ?

.code
start:
    mov ax, @data
    mov ds, ax

input_loop:
    ;Display prompt
    mov ah, 09h
    lea dx, promptMsg
    int 21h
    
    ;Get user input
    mov ah, 01h
    int 21h
    mov userInput, al
    
    ;Display newline
    mov ah, 09h
    lea dx, newline
    int 21h
    
    ;Check if input is '0'
    cmp userInput, '0'
    je display_thank        ;if input is '0', exit loop
    
    ;Otherwise, loop back for another input
    jmp input_loop

display_thank:
    ;Display "Thank you."
    mov ah, 09h
    lea dx, thankMsg
    int 21h
    
    ;Exit program
    mov ax, 4C00h
    int 21h

end start