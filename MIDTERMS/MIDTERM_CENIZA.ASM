;=====================================================================
; FILENAME: MIDTERM.ASM
; PROGRAMMER NAME: KESHA JANE L. CENIZA
; DATE: OCTOBER 24, 2025
; DESCRIPTION: CIT-U BANK ATM System with PIN validation and menu operations
;              Red background with yellow text
;=====================================================================

.model small
.stack 100h

.data
    ;----- Header messages -----
    header1 db ' CIT-U BANK', '$'
    header2 db ' Automatic Teller Machine', '$'
    header3 db ' Copyright 2025', '$'
    header4 db ' Programmer: KESHA JANE L. CENIZA', '$'
    header5 db ' Welcome!', '$'
    
    ;----- PIN screen messages -----
    cardMsg db ' Please insert your card.', '$'
    pinPrompt db ' Enter your PIN: $'
    wrongPinMsg db ' WRONG PIN!', '$'
    
    ;----- Main menu messages -----
    menuTitle db ' MAIN MENU', '$'
    menu1 db ' 1 Balance Inquiry', '$'
    menu2 db ' 2 Deposit', '$'
    menu3 db ' 3 Withdraw', '$'
    menu4 db ' 4 Pay Bills', '$'
    menu5 db ' 5 Exit', '$'
    menuPrompt db ' Please enter number of your choice: $'
    wrongChoiceMsg db ' WRONG CHOICE!', '$'
    
    ;----- Operation messages -----
    balanceMsg db ' BALANCE INQUIRY', '$'
    depositMsg db ' DEPOSIT', '$'
    withdrawMsg db ' WITHDRAW', '$'
    payBillsMsg db ' PAY BILLS', '$'
    exitMsg db ' EXIT', '$'
    continueMsg db ' Continue? Y/N: $'
    thankYouMsg db ' Please get your card. Thank you.$'
    
    ;----- Variables -----
    pinInput db 5 dup(?)    ; Store 4-digit PIN + Enter
    pinCount db 0
    choice db ?
    continueChoice db ?

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;----- Set red background with yellow text for entire screen -----
    call set_red_yellow_screen
    
pin_screen:
    call clear_screen
    call set_red_yellow_screen
    call display_header
    
    ;----- Position cursor for "Please insert your card." -----
    mov ah, 02h
    mov bh, 0
    mov dh, 9               ; Row 9
    mov dl, 5               ; Column 5
    int 10h
    
    mov ah, 09h
    lea dx, cardMsg
    int 21h
    
    ;----- Position cursor for "Enter your PIN:" -----
    mov ah, 02h
    mov bh, 0
    mov dh, 10              ; Row 10
    mov dl, 5               ; Column 5
    int 10h
    
    mov ah, 09h
    lea dx, pinPrompt
    int 21h
    
    ;----- Get PIN input -----
    mov si, 0
    mov pinCount, 0
    
get_pin:
    mov ah, 01h             ; Read character
    int 21h
    
    cmp al, 0dh             ; Check if Enter key
    je validate_pin
    
    mov pinInput[si], al
    inc si
    inc pinCount
    
    cmp pinCount, 4         ; Read max 4 digits
    jl get_pin
    
    ;----- Wait for Enter after 4 digits -----
wait_enter:
    mov ah, 01h
    int 21h
    cmp al, 0dh
    jne wait_enter
    
validate_pin:
    ;----- Check if PIN is 1234 -----
    cmp pinCount, 4
    jne wrong_pin
    
    cmp pinInput[0], '1'
    jne wrong_pin
    cmp pinInput[1], '2'
    jne wrong_pin
    cmp pinInput[2], '3'
    jne wrong_pin
    cmp pinInput[3], '4'
    jne wrong_pin
    
    ;----- Correct PIN, go to main menu -----
    jmp main_menu
    
wrong_pin:
    ;----- Display WRONG PIN with blinking -----
    mov ah, 02h
    mov bh, 0
    mov dh, 11              ; Row 12
    mov dl, 5               ; Column 5
    int 10h
    
    ;----- Set blinking attribute (red bg, yellow text, blink bit) -----
    mov ah, 09h
    mov bl, 0EFh            ; 1100 1110 = blink + red bg + yellow text
    mov cx, 10              ; Length of "WRONG PIN!"
    int 10h
    
    lea dx, wrongPinMsg
    mov ah, 09h
    int 21h
    
    ;----- Wait for key press -----
    mov ah, 01h
    int 21h
    
    ;----- Return to PIN screen -----
    jmp pin_screen

main_menu:
    call clear_screen
    call set_red_yellow_screen
    call display_header_menu      ; Use different header for menu (no blank line)
    
    ;----- Display MAIN MENU -----
    mov ah, 02h
    mov bh, 0
    mov dh, 8               ; Row 7
    mov dl, 5               ; Column 5
    int 10h
    
    mov ah, 09h
    lea dx, menuTitle
    int 21h
    
    ;----- Display menu options -----
    mov ah, 02h
    mov dh, 9               
    mov dl, 5
    int 10h
    lea dx, menu1
    mov ah, 09h
    int 21h
    
    mov ah, 02h
    mov dh, 10               
    mov dl, 5
    int 10h
    lea dx, menu2
    mov ah, 09h
    int 21h
    
    mov ah, 02h
    mov dh, 11              
    mov dl, 5
    int 10h
    lea dx, menu3
    mov ah, 09h
    int 21h
    
    mov ah, 02h
    mov dh, 12              
    mov dl, 5
    int 10h
    lea dx, menu4
    mov ah, 09h
    int 21h
    
    mov ah, 02h
    mov dh, 13              
    mov dl, 5
    int 10h
    lea dx, menu5
    mov ah, 09h
    int 21h
    
    ;----- Display prompt -----
    mov ah, 02h
    mov dh, 14              
    mov dl, 5
    int 10h
    lea dx, menuPrompt
    mov ah, 09h
    int 21h
    
    ;----- Get choice -----
    mov ah, 01h
    int 21h
    mov choice, al
    
    ;----- Process choice -----
    cmp choice, '1'
    je option_balance
    cmp choice, '2'
    je option_deposit
    cmp choice, '3'
    je option_withdraw
    cmp choice, '4'
    je option_pay_bills
    cmp choice, '5'
    je option_exit
    
    ;----- Wrong choice -----
    jmp wrong_choice

wrong_choice:
    mov ah, 02h
    mov bh, 0
    mov dh, 15              
    mov dl, 5               ; Column 5
    int 10h
    
    ;----- Set blinking attribute -----
    mov ah, 09h
    mov bl, 0EFh             
    mov cx, 13              ; Length of "WRONG CHOICE!"
    int 10h
    
    lea dx, wrongChoiceMsg
    mov ah, 09h
    int 21h
    
    ;----- Wait for key press -----
    mov ah, 01h
    int 21h
    
    jmp main_menu

option_balance:
    call display_operation
    lea dx, balanceMsg
    mov ah, 09h
    int 21h
    call ask_continue
    jmp main_menu

option_deposit:
    call display_operation
    lea dx, depositMsg
    mov ah, 09h
    int 21h
    call ask_continue
    jmp main_menu

option_withdraw:
    call display_operation
    lea dx, withdrawMsg
    mov ah, 09h
    int 21h
    call ask_continue
    jmp main_menu

option_pay_bills:
    call display_operation
    lea dx, payBillsMsg
    mov ah, 09h
    int 21h
    call ask_continue
    jmp main_menu

option_exit:
    ;----- Display EXIT message at row 15 -----
    mov ah, 02h
    mov bh, 0
    mov dh, 16              
    mov dl, 5               ; Column 5
    int 10h
    
    lea dx, exitMsg
    mov ah, 09h
    int 21h
    
    ;----- Display thank you message at row 16 -----
    mov ah, 02h
    mov dh, 17              
    mov dl, 5               ; Column 5
    int 10h
    
    lea dx, thankYouMsg
    mov ah, 09h
    int 21h
    
    ;----- Exit program -----
    mov ax, 4C00h
    int 21h

main endp

;=====================================================================
; PROCEDURE: set_red_yellow_screen
; Sets entire screen to black, then creates red content area with borders
;=====================================================================
set_red_yellow_screen proc
    ;----- First, set entire screen to black -----
    mov ah, 06h             ; Scroll window up
    mov al, 0               ; Clear entire screen
    mov bh, 00h             ; Black background + Black text
    mov ch, 0               ; Top row
    mov cl, 0               ; Left column
    mov dh, 24              ; Bottom row
    mov dl, 79              ; Right column
    int 10h
    
    ;----- Then set content area to red background with yellow text -----
    ;----- Leave black borders on all sides -----
    mov ah, 06h             ; Scroll window up
    mov al, 0               ; Clear content area
    mov bh, 4Eh             ; Red background (4) + Yellow text (E)
    mov ch, 1               ; Top row (leave 1 row black at top)
    mov cl, 5               ; Left column (leave 5 columns black on left)
    mov dh, 20              ; Bottom row (leave black at bottom)
    mov dl, 60              ; Right column (leave black on right)
    int 10h
    
    ;----- Set cursor to top-left of content area -----
    mov ah, 02h
    mov bh, 0
    mov dh, 1               ; Start at row 1
    mov dl, 5               ; Start at column 5 (inside red area)
    int 10h
    
    ret
set_red_yellow_screen endp

;=====================================================================
; PROCEDURE: clear_screen
; Clears the screen
;=====================================================================
clear_screen proc
    mov ah, 00h
    mov al, 03h             ; 80x25 text mode
    int 10h
    ret
clear_screen endp

;=====================================================================
; PROCEDURE: display_header
; Displays the common header (5 lines)
;=====================================================================
display_header proc
    ;----- Line 1: CIT-U BANK -----
    mov ah, 02h
    mov bh, 0
    mov dh, 2               ; Row 1
    mov dl, 5               ; Column 5 (left margin)
    int 10h
    
    lea dx, header1
    mov ah, 09h
    int 21h
    
    ;----- Line 2: Automatic Teller Machine -----
    mov ah, 02h
    mov dh, 3
    mov dl, 5
    int 10h
    
    lea dx, header2
    mov ah, 09h
    int 21h
    
    ;----- Line 3: Copyright 2025 -----
    mov ah, 02h
    mov dh, 4
    mov dl, 5
    int 10h
    
    lea dx, header3
    mov ah, 09h
    int 21h
    
    ;----- Line 4: Programmer name -----
    mov ah, 02h
    mov dh, 5
    mov dl, 5
    int 10h
    
    lea dx, header4
    mov ah, 09h
    int 21h
    
    ;----- Line 5: Welcome! (with blank line before it for PIN screen) -----
    mov ah, 02h
    mov dh, 7
    mov dl, 5
    int 10h
    
    lea dx, header5
    mov ah, 09h
    int 21h
    
    ret
display_header endp

;=====================================================================
; PROCEDURE: display_header_menu
; Displays the header for main menu (Welcome! without blank line)
;=====================================================================
display_header_menu proc
    ;----- Line 1: CIT-U BANK -----
    mov ah, 02h
    mov bh, 0
    mov dh, 2
    mov dl, 5
    int 10h
    
    lea dx, header1
    mov ah, 09h
    int 21h
    
    ;----- Line 2: Automatic Teller Machine -----
    mov ah, 02h
    mov dh, 3
    mov dl, 5
    int 10h
    
    lea dx, header2
    mov ah, 09h
    int 21h
    
    ;----- Line 3: Copyright 2025 -----
    mov ah, 02h
    mov dh, 4
    mov dl, 5
    int 10h
    
    lea dx, header3
    mov ah, 09h
    int 21h
    
    ;----- Line 4: Programmer name -----
    mov ah, 02h
    mov dh, 5
    mov dl, 5
    int 10h
    
    lea dx, header4
    mov ah, 09h
    int 21h
    
    ;----- Line 5: Welcome! (NO blank line before) -----
    mov ah, 02h
    mov dh, 6
    mov dl, 5
    int 10h
    
    lea dx, header5
    mov ah, 09h
    int 21h
    
    ret
display_header_menu endp

;=====================================================================
; PROCEDURE: display_operation
; Displays operation screen (reuses main menu display then shows operation)
;=====================================================================
display_operation proc
    ;----- Position at row 15 for operation message -----
    mov ah, 02h
    mov bh, 0
    mov dh, 16              
    mov dl, 5               ; Column 5
    int 10h
    
    ret
display_operation endp

;=====================================================================
; PROCEDURE: ask_continue
; Asks "Continue? Y/N:" and processes response
;=====================================================================
ask_continue proc
    ;----- Display "Continue? Y/N:" -----
    mov ah, 02h
    mov bh, 0
    mov dh, 17              
    mov dl, 5               ; Column 5
    int 10h
    
    lea dx, continueMsg
    mov ah, 09h
    int 21h
    
    ;----- Get choice -----
    mov ah, 01h
    int 21h
    mov continueChoice, al
    
    ;----- Check if Y or y -----
    cmp continueChoice, 'Y'
    je continue_yes
    cmp continueChoice, 'y'
    je continue_yes
    
    ;----- Check if N or n -----
    cmp continueChoice, 'N'
    je continue_no
    cmp continueChoice, 'n'
    je continue_no
    
    ;----- Invalid input, ask again -----
    jmp ask_continue
    
continue_yes:
    ret
    
continue_no:
    ;----- Display thank you message at row 18 (below Continue prompt) -----
    mov ah, 02h
    mov bh, 0
    mov dh, 19
    mov dl, 5               ; Column 5
    int 10h
    
    lea dx, thankYouMsg
    mov ah, 09h
    int 21h
    
    ;----- Exit program -----
    mov ax, 4C00h
    int 21h
    
ask_continue endp

end main