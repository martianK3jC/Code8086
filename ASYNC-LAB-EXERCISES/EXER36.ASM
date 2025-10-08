;FILENAME: EXER36.ASM
;PROGRAMMER NAME: KESHA JANE L. CENIZA
;DATE: OCTOBER 8, 2025
;DESCRIPTION: A calculator program that performs addition, subtraction, multiplication, 
;             and division on single-digit numbers with a menu-driven interface.

.model small
.stack 100h
.data
    ;Title and header messages
    title_msg db 'THE CALCULATOR', 0dh, 0ah, '$'
    created_msg db 'Created by: KESHA JANE L. CENIZA', 0dh, 0ah, '$'
    date_msg db 'Date: October 9, 2025', 0dh, 0ah, 0ah, '$'
    
    ;Menu messages
    menu_header db 'Main menu', 0dh, 0ah, '$'
    menu_add db 'a - Addition$'
    menu_sub db 's - Subtraction$'
    menu_mul db 'm - Multiplication$'
    menu_div db 'd - Division$'
    menu_exit db 'e - Exit$'
    choice_prompt db 'Enter your choice: $'
    
    ;Operation headers
    add_header db 0dh, 0ah, 0ah, ' Addition$'
    sub_header db 0dh, 0ah, 0ah, ' Subtraction$'
    mul_header db 0dh, 0ah, 0ah, ' Multiplication$'
    div_header db 0dh, 0ah, 0ah, ' Division$'
    exit_header db 0dh, 0ah, 0ah, ' Exit Program$'
    
    ;Addition prompts
    add_prompt1 db 0dh, 0ah, 'Enter first addened: $'
    add_prompt2 db 0dh, 0ah, 'Enter second addened: $'
    add_echo1 db 0dh, 0ah, 'First addened is: $'
    add_echo2 db 0dh, 0ah, 'Second addened is: $'
    add_result db 0dh, 0ah, 'Sum: $'
    
    ;Subtraction prompts
    sub_prompt1 db 0dh, 0ah, 'Enter minuend: $'
    sub_prompt2 db 0dh, 0ah, 'Enter subtrahend: $'
    sub_echo1 db 0dh, 0ah, 'Minuend is: $'
    sub_echo2 db 0dh, 0ah, 'Subtrahend is: $'
    sub_result db 0dh, 0ah, 'Difference: $'
    
    ;Multiplication prompts
    mul_prompt1 db 0dh, 0ah, 'Enter multiplicand: $'
    mul_prompt2 db 0dh, 0ah, 'Enter multiplier: $'
    mul_echo1 db 0dh, 0ah, 'Multiplicand is: $'
    mul_echo2 db 0dh, 0ah, 'Multiplier is: $'
    mul_result db 0dh, 0ah, 'Product: $'
    
    ;Division prompts
    div_prompt1 db 0dh, 0ah, 'Enter dividend: $'
    div_prompt2 db 0dh, 0ah, 'Enter divisor: $'
    div_echo1 db 0dh, 0ah, 'Dividend is: $'
    div_echo2 db 0dh, 0ah, 'Divisor is: $'
    div_result db 0dh, 0ah, 'Quotient: $'
    
    ;Continue prompts
    continue_msg db 0dh, 0ah, 0ah, 'Press Enter to continue.$'
    
    ;Variables
    num1 db ?
    num2 db ?
    result db ?
    choice db ?

.code
main proc
    ;Initialize data segment
    mov ax, @data
    mov ds, ax

main_loop:
    ;Clear screen
    call clear_screen
    
    ;Display title and header
    lea dx, title_msg
    mov ah, 09h
    int 21h
    
    lea dx, created_msg
    mov ah, 09h
    int 21h
    
    lea dx, date_msg
    mov ah, 09h
    int 21h
    
    ;Display menu
    lea dx, menu_header
    mov ah, 09h
    int 21h
    
    ;Display menu options with colored background
    call display_menu
    
    ;Get user choice
    lea dx, choice_prompt
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    mov choice, al
    
    ;Process choice
    cmp choice, 'a'
    je do_addition
    
    cmp choice, 's'
    je do_subtraction
    
    cmp choice, 'm'
    je do_multiplication
    
    cmp choice, 'd'
    je do_division
    
    cmp choice, 'e'
    je do_exit
    
    ;Invalid choice, loop back
    jmp main_loop

do_addition:
    call addition_operation
    jmp main_loop

do_subtraction:
    call subtraction_operation
    jmp main_loop

do_multiplication:
    call multiplication_operation
    jmp main_loop

do_division:
    call division_operation
    jmp main_loop

do_exit:
    ;Display exit header with newlines first
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    ;ADD COLOR CODE HERE for "Exit Program" (12 characters)
    mov ah, 09h
    mov bl, 4Eh
    mov cx, 12
    int 10h
    
    lea dx, exit_header
    add dx, 4; Skip the newlines
    mov ah, 09h
    int 21h
    
    ;Wait for Enter
    lea dx, continue_msg
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    
    ;Exit program
    mov ax, 4C00h
    int 21h

main endp

;Clear screen procedure
clear_screen proc
    mov ah, 00h
    mov al, 03h; 80x25 text mode
    int 10h
    ret
clear_screen endp

;Display menu with colored backgrounds
display_menu proc
    ;Display "a - Addition" with color
    ;ADD COLOR CODE HERE for "a - Addition" (12 characters)
    mov ah, 09h
    mov bl, 30h
    mov cx, 12
    int 10h
    
    lea dx, menu_add
    mov ah, 09h
    int 21h
    
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    
    ;Display "s - Subtraction" with color
    ;ADD COLOR CODE HERE for "s - Subtraction" (15 characters)
    mov ah, 09h
    mov bl, 5Fh
    mov cx, 15
    int 10h
    
    lea dx, menu_sub
    mov ah, 09h
    int 21h
    
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    
    ;Display "m - Multiplication" with color
    ;ADD COLOR CODE HERE for "m - Multiplication" (18 characters)
    mov ah, 09h
    mov bl, 20h
    mov cx, 18
    int 10h
    
    lea dx, menu_mul
    mov ah, 09h
    int 21h
    
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    
    ;Display "d - Division" with color
    ;ADD COLOR CODE HERE for "d - Division" (12 characters)
    mov ah, 09h
    mov bl, 6Eh
    mov cx, 12
    int 10h
    
    lea dx, menu_div
    mov ah, 09h
    int 21h
    
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    
    ;Display "e - Exit" with color
    ;ADD COLOR CODE HERE for "e - Exit" (8 characters)
    mov ah, 09h
    mov bl, 4Eh
    mov cx, 8
    int 10h
    
    lea dx, menu_exit
    mov ah, 09h
    int 21h
    
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    
    ret
display_menu endp

;Addition operation
addition_operation proc
    ;Display newlines
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    ;ADD COLOR CODE HERE for "Addition" (8 characters)
    mov ah, 09h
    mov bl, 30h
    mov cx, 8
    int 10h
    
    lea dx, add_header
    add dx, 4; Skip the newlines
    mov ah, 09h
    int 21h
    
    ;Prompt for first number
    lea dx, add_prompt1
    mov ah, 09h
    int 21h
    
    call read_number
    mov num1, al
    
    ;Prompt for second number
    lea dx, add_prompt2
    mov ah, 09h
    int 21h
    
    call read_number
    mov num2, al
    
    ;Echo first number
    lea dx, add_echo1
    mov ah, 09h
    int 21h
    
    mov dl, num1
    add dl, '0'
    mov ah, 02h
    int 21h
    
    ;Echo second number
    lea dx, add_echo2
    mov ah, 09h
    int 21h
    
    mov dl, num2
    add dl, '0'
    mov ah, 02h
    int 21h
    
    ;Calculate sum
    mov al, num1
    add al, num2
    mov result, al
    
    ;Display result
    lea dx, add_result
    mov ah, 09h
    int 21h
    
    mov dl, result
    add dl, '0'
    mov ah, 02h
    int 21h
    
    ;Wait for Enter
    lea dx, continue_msg
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    
    ret
addition_operation endp

;Subtraction operation
subtraction_operation proc
    ;Display newlines
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    ;ADD COLOR CODE HERE for "Subtraction" (11 characters)
    mov ah, 09h
    mov bl, 5Fh
    mov cx, 11
    int 10h
    
    lea dx, sub_header
    add dx, 4; Skip the newlines
    mov ah, 09h
    int 21h
    
    ;Prompt for minuend
    lea dx, sub_prompt1
    mov ah, 09h
    int 21h
    
    call read_number
    mov num1, al
    
    ;Prompt for subtrahend
    lea dx, sub_prompt2
    mov ah, 09h
    int 21h
    
    call read_number
    mov num2, al
    
    ;Echo minuend
    lea dx, sub_echo1
    mov ah, 09h
    int 21h
    
    mov dl, num1
    add dl, '0'
    mov ah, 02h
    int 21h
    
    ;Echo subtrahend
    lea dx, sub_echo2
    mov ah, 09h
    int 21h
    
    mov dl, num2
    add dl, '0'
    mov ah, 02h
    int 21h
    
    ;Calculate difference
    mov al, num1
    sub al, num2
    mov result, al
    
    ;Display result
    lea dx, sub_result
    mov ah, 09h
    int 21h
    
    mov dl, result
    add dl, '0'
    mov ah, 02h
    int 21h
    
    ;Wait for Enter
    lea dx, continue_msg
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    
    ret
subtraction_operation endp

;Multiplication operation
multiplication_operation proc
    ;Display newlines
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    ;ADD COLOR CODE HERE for "Multiplication" (14 characters)
    mov ah, 09h
    mov bl, 20h
    mov cx, 14
    int 10h
    
    lea dx, mul_header
    add dx, 4; Skip the newlines
    mov ah, 09h
    int 21h
    
    ;Prompt for multiplicand
    lea dx, mul_prompt1
    mov ah, 09h
    int 21h
    
    call read_number
    mov num1, al
    
    ;Prompt for multiplier
    lea dx, mul_prompt2
    mov ah, 09h
    int 21h
    
    call read_number
    mov num2, al
    
    ;Echo multiplicand
    lea dx, mul_echo1
    mov ah, 09h
    int 21h
    
    mov dl, num1
    add dl, '0'
    mov ah, 02h
    int 21h
    
    ;Echo multiplier
    lea dx, mul_echo2
    mov ah, 09h
    int 21h
    
    mov dl, num2
    add dl, '0'
    mov ah, 02h
    int 21h
    
    ;Calculate product
    mov al, num1
    mov bl, num2
    mul bl
    mov result, al
    
    ;Display result
    lea dx, mul_result
    mov ah, 09h
    int 21h
    
    mov dl, result
    add dl, '0'
    mov ah, 02h
    int 21h
    
    ;Wait for Enter
    lea dx, continue_msg
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    
    ret
multiplication_operation endp

;Division operation
division_operation proc
    ;Display newlines
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    ;ADD COLOR CODE HERE for "Division" (8 characters)
    mov ah, 09h
    mov bl, 6Eh
    mov cx, 8
    int 10h
    
    lea dx, div_header
    add dx, 4; Skip the newlines
    mov ah, 09h
    int 21h
    
    ;Prompt for dividend
    lea dx, div_prompt1
    mov ah, 09h
    int 21h
    
    call read_number
    mov num1, al
    
    ;Prompt for divisor
    lea dx, div_prompt2
    mov ah, 09h
    int 21h
    
    call read_number
    mov num2, al
    
    ;Echo dividend
    lea dx, div_echo1
    mov ah, 09h
    int 21h
    
    mov dl, num1
    add dl, '0'
    mov ah, 02h
    int 21h
    
    ;Echo divisor
    lea dx, div_echo2
    mov ah, 09h
    int 21h
    
    mov dl, num2
    add dl, '0'
    mov ah, 02h
    int 21h
    
    ;Calculate quotient
    mov al, num1
    xor ah, ah
    mov bl, num2
    div bl
    mov result, al
    
    ;Display result
    lea dx, div_result
    mov ah, 09h
    int 21h
    
    mov dl, result
    add dl, '0'
    mov ah, 02h
    int 21h
    
    ;Wait for Enter
    lea dx, continue_msg
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    
    ret
division_operation endp

;Read a number from keyboard (single digit)
read_number proc
    mov ah, 01h
    int 21h
    
    sub al, '0'
    ret
read_number endp

end main