;FILENAME: EXER41.ASM
;PROGRAMMER NAME: KESHA JANE L. CENIZA
;DATE: OCTOBER 15, 2025
;DESCRIPTION: This program repeatedly displays an ATM main menu until the user
;             presses "e" for Exit. Displays operation name for valid choices
;             and error message for invalid choices.

.model small
.stack 100h
.data
    ;Menu messages
    menuTitle db 'CIT-U ATM', 0dh, 0ah, '$'
    menuA db 0dh, 0ah, 'a. Balance Inquiry', 0dh, 0ah, '$'
    menuB db 'b. Deposit', 0dh, 0ah, '$'
    menuC db 'c. Withdrawal', 0dh, 0ah, '$'
    menuD db 'd. Bills Payment', 0dh, 0ah, '$'
    menuE db 'e. Exit', 0dh, 0ah, '$'
    promptMsg db 0dh, 0ah, 'Enter choice: $'
    
    ;Operation messages
    balanceMsg db 0dh, 0ah, 'Balance Inquiry', 0dh, 0ah, 0dh, 0ah, 0dh, 0ah, '$'
    depositMsg db  0dh, 0ah, 'Deposit', 0dh, 0ah, 0dh, 0ah, 0dh, 0ah, '$'
    withdrawalMsg db  0dh, 0ah, 'Withdrawal', 0dh, 0ah, 0dh, 0ah, 0dh, 0ah, '$'
    billsMsg db  0dh, 0ah, 'Bills Payment', 0dh, 0ah, 0dh, 0ah, 0dh, 0ah, '$'
    exitMsg db 'Exit. Thank you.$'
    invalidMsg db  0dh, 0ah, 'INVALID INPUT!', 0dh, 0ah, 0dh, 0ah, 0dh, 0ah, '$'
    
    choice db ?

.code
start:
    mov ax, @data
    mov ds, ax

main_loop:
    ;Display menu
    mov ah, 09h
    lea dx, menuTitle
    int 21h
    
    lea dx, menuA
    int 21h
    
    lea dx, menuB
    int 21h
    
    lea dx, menuC
    int 21h
    
    lea dx, menuD
    int 21h
    
    lea dx, menuE
    int 21h
    
    ;Display prompt
    lea dx, promptMsg
    int 21h
    
    ;Get user choice
    mov ah, 01h
    int 21h
    mov choice, al
    
    ;Display newline
    mov ah, 0eh
    mov al, 0dh
    int 10h
    mov al, 0ah
    int 10h
    
    ;Process choice
    cmp choice, 'a'
    je choice_balance
    
    cmp choice, 'b'
    je choice_deposit
    
    cmp choice, 'c'
    je choice_withdrawal
    
    cmp choice, 'd'
    je choice_bills
    
    cmp choice, 'e'
    je choice_exit
    
    ;Invalid choice
    mov ah, 09h
    lea dx, invalidMsg
    int 21h
    jmp main_loop

choice_balance:
    mov ah, 09h
    lea dx, balanceMsg
    int 21h
    jmp main_loop

choice_deposit:
    mov ah, 09h
    lea dx, depositMsg
    int 21h
    jmp main_loop

choice_withdrawal:
    mov ah, 09h
    lea dx, withdrawalMsg
    int 21h
    jmp main_loop

choice_bills:
    mov ah, 09h
    lea dx, billsMsg
    int 21h
    jmp main_loop

choice_exit:
    mov ah, 09h
    lea dx, exitMsg
    int 21h
    
    ;Exit program
    mov ax, 4C00h
    int 21h

end start