;=====================================================================
; Program Title : EXER44.ASM
; Description : Displays a greetings menu with 4 options:
;               1. Good Morning
;               2. Good Afternoon
;               3. Good Evening
;               4. Exit Program
;               Each option calls its own procedure.
; Programmer Name : KESHA JANE L. CENIZA
; Date : October 15, 2025
; Assembler : Turbo Assembler (TASM)
; Target : DOSBox (8086 real mode)
;=====================================================================

.model small            ; Small memory model (1 code + 1 data segment)
.stack 100h             ; 256 bytes for stack

.data                   ; ---- Start of data segment ----
;----------------------------------------------------------
; Menu text and messages
;----------------------------------------------------------
menuTitle db 0dh, 0ah, 'Greetings', 0dh, 0ah, \
             'Main Menu', 0dh, 0ah, \
             '1. Good Morning', 0dh, 0ah, \
             '2. Good Afternoon', 0dh, 0ah, \
             '3. Good Evening', 0dh, 0ah, \
             '4. Exit Program', 0dh, 0ah, \
             'Enter choice: $'

msgMorning db 0dh, 0ah, 0dh, 0ah, 'Good Morning!', 0dh, 0ah, '$'
msgAfternoon db 0dh, 0ah, 0dh, 0ah, 'Good Afternoon!', 0dh, 0ah, '$'
msgEvening db 0dh, 0ah, 0dh, 0ah, 'Good Evening!', 0dh, 0ah, '$'
msgInvalid db 0dh, 0ah, 0dh, 0ah, 'Invalid choice. Please try again.', 0dh, 0ah, '$'
msgExit db 0dh, 0ah, 0dh, 0ah, 'Thank you! Program will now exit.$'

.code                   ; ---- Start of code segment ----
;=====================================================================
; MAIN PROCEDURE
;=====================================================================
main proc
;----------------------------------------------------------
; Step 1: Initialize Data Segment
;----------------------------------------------------------
    mov ax, @data       ; Load address of data segment
    mov ds, ax          ; Copy to DS so we can access variables

main_menu:
;----------------------------------------------------------
; Step 2: Display Main Menu
;----------------------------------------------------------
    mov ah, 09h         ; DOS function: Display string
    lea dx, menuTitle   ; DX = address of menuTitle string
    int 21h             ; Display the menu text

;----------------------------------------------------------
; Step 3: Get user input (one character)
;----------------------------------------------------------
    mov ah, 01h         ; DOS function: Read character from keyboard
    int 21h             ; Wait for keypress
    mov bl, al          ; Store character input in BL

;----------------------------------------------------------
; Step 4: Print newline for spacing
;----------------------------------------------------------
    mov ah, 02h
    mov dl, 0dh         ; Carriage return
    int 21h
    mov dl, 0ah         ; Line feed
    int 21h

;----------------------------------------------------------
; Step 5: Determine which option was chosen
;----------------------------------------------------------
    cmp bl, '1'         ; Choice = 1?
    je call_morning
    
    cmp bl, '2'         ; Choice = 2?
    je call_afternoon
    
    cmp bl, '3'         ; Choice = 3?
    je call_evening
    
    cmp bl, '4'         ; Choice = 4?
    je call_exit
    
    jmp invalid_choice  ; If not 1-4, invalid

;----------------------------------------------------------
; Step 6: Call Procedures
;----------------------------------------------------------
call_morning:
    call good_morning
    jmp main_menu

call_afternoon:
    call good_afternoon
    jmp main_menu

call_evening:
    call good_evening
    jmp main_menu

call_exit:
    call exit_program   ; Terminate program

invalid_choice:
    call invalid_msg
    jmp main_menu

main endp

;=====================================================================
; PROCEDURE: good_morning
;=====================================================================
good_morning proc
    mov ah, 09h
    lea dx, msgMorning
    int 21h
    ret
good_morning endp

;=====================================================================
; PROCEDURE: good_afternoon
;=====================================================================
good_afternoon proc
    mov ah, 09h
    lea dx, msgAfternoon
    int 21h
    ret
good_afternoon endp

;=====================================================================
; PROCEDURE: good_evening
;=====================================================================
good_evening proc
    mov ah, 09h
    lea dx, msgEvening
    int 21h
    ret
good_evening endp

;=====================================================================
; PROCEDURE: invalid_msg
;=====================================================================
invalid_msg proc
    mov ah, 09h
    lea dx, msgInvalid
    int 21h
    ret
invalid_msg endp

;=====================================================================
; PROCEDURE: exit_program
; Description: Displays exit message and terminates execution.
;=====================================================================
exit_program proc
    mov ah, 09h         ; DOS print string function
    lea dx, msgExit     ; Display thank-you message
    int 21h
    
    mov ah, 4ch         ; DOS terminate program function
    mov al, 00h         ; Return code 0
    int 21h
exit_program endp

;=====================================================================
; End of Program
;=====================================================================
end main