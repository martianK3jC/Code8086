;FILENAME: EXER37.ASM
;PROGRAMMER NAME: KESHA JANE L. CENIZA
;DATE: OCTOBER 15, 2025
;DESCRIPTION: This program uses a loop to vertically display numbers 1 to 10.

.model small
.stack 100h
.data
    counter db 1        ;Counter variable starting at 1

.code
start:
    mov ax, @data
    mov ds, ax

    ; Initialize counter
    mov cl, counter     ;cl will hold our counter (1 to 10)

display_loop:
    ;Check if counter > 10
    cmp cl, 11
    je end_program      ;if counter = 11, exit loop

    ;Check if number is 10 (two digits)
    cmp cl, 10
    je display_ten
    
    ;Display single digit (1-9)
    mov al, cl          ;Move counter to al
    add al, '0'         ;Convert to ASCII
    mov ah, 0eh         ;Teletype output
    int 10h
    jmp display_newline
    
display_ten:
    ;Display '1' of '10'
    mov ah, 0eh
    mov al, '1'
    int 10h
    
    ;Display '0' of '10'
    mov al, '0'
    int 10h

display_newline:
    ;Display newline (carriage return + line feed)
    mov ah, 0eh
    mov al, 0dh         ;Carriage return
    int 10h
    mov al, 0ah         ;Line feed
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