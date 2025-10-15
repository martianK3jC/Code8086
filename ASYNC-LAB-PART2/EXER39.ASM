;FILENAME: EXER39.ASM
;PROGRAMMER NAME: KESHA JANE L. CENIZA
;DATE: OCTOBER 15, 2025
;DESCRIPTION: This program asks user to input a number from 1 to 8.
;             Displays error if out of range. If valid, displays numbers
;             from 1 to the entered number horizontally with spaces.

.model small
.stack 100h
.data
    promptMsg db 'Enter a number from 1 to 8: $'
    errorMsg db 'Error: Number out of range!', 0dh, 0ah, '$'
    newline db 0dh, 0ah, '$'
    userInput db ?
    maxNum db ?

.code
start:
    mov ax, @data
    mov ds, ax

get_input:
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
    
    ;Convert ASCII to number
    mov al, userInput
    sub al, '0'
    
    ;Validate input (must be >= 1 and <= 8)
    cmp al, 1
    jl input_error          ;if less than 1, error
    cmp al, 8
    jg input_error          ;if greater than 8, error
    
    ;Input is valid, save it
    mov maxNum, al
    jmp display_numbers
    
input_error:
    ;Display error message
    mov ah, 09h
    lea dx, errorMsg
    int 21h
    
    ;Ask for input again
    jmp get_input

display_numbers:
    ;Initialize counter to 1
    mov cl, 1
    
display_loop:
    ;Check if counter > maxNum
    mov al, maxNum
    cmp cl, al
    jg end_program          ;if counter > maxNum, exit
    
    ;Display current number
    mov al, cl
    add al, '0'             ;Convert to ASCII
    mov ah, 0eh
    int 10h
    
    ;Display space after number
    mov ah, 0eh
    mov al, ' '
    int 10h
    
    ;Increment counter
    inc cl
    
    ;Loop back
    jmp display_loop

end_program:
    ;Display final newline
    mov ah, 09h
    lea dx, newline
    int 21h
    
    ;Exit program
    mov ax, 4C00h
    int 21h

end start