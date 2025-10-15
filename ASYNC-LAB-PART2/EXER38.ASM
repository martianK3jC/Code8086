;FILENAME: EXER38.ASM
;PROGRAMMER NAME: KESHA JANE L. CENIZA
;DATE: OCTOBER 15, 2025
;DESCRIPTION: This program uses a loop to horizontally display numbers 1 to 20
;             with space between each number.

.model small
.stack 100h
.data
    counter db 1        ;Counter variable starting at 1

.code
start:
    mov ax, @data
    mov ds, ax

    ; Initialize counter
    mov cl, counter     ;cl will hold our counter (1 to 20)

display_loop:
    ;Check if counter > 20
    cmp cl, 21
    je end_program      ;if counter = 21, exit loop

    ;Check if number is >= 10 (two digits)
    cmp cl, 10
    jge display_two_digit
    
    ;Display single digit (1-9)
    mov al, cl          ;Move counter to al
    add al, '0'         ;Convert to ASCII
    mov ah, 0eh         ;Teletype output
    int 10h
    jmp display_space
    
display_two_digit:
    ;For numbers 10-20, we need to display tens digit then ones digit
    mov al, cl          ;Get the number
    mov ah, 0           ;Clear ah for division
    mov bl, 10
    div bl              ;Divide by 10: AL = quotient (tens), AH = remainder (ones)
    
    ;Display tens digit
    push ax             ;Save ax (we need the remainder)
    add al, '0'         ;Convert tens to ASCII
    mov ah, 0eh
    int 10h
    
    ;Display ones digit
    pop ax              ;Restore ax
    mov al, ah          ;Move remainder (ones) to al
    add al, '0'         ;Convert ones to ASCII
    mov ah, 0eh
    int 10h

display_space:
    ;Display space between numbers
    mov ah, 0eh
    mov al, ' '         ;Space character
    int 10h

    ;Increment counter
    inc cl

    ;Loop back
    jmp display_loop

end_program:
    ;Exit program
    mov ax, 4C00h
    int 21h

end start