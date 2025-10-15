;FILENAME: EXER42.ASM
;PROGRAMMER NAME: KESHA JANE L. CENIZA
;DATE: OCTOBER 15, 2025
;DESCRIPTION: This program inputs two 2-digit numbers and adds them together.
;             Displays the result.

.model small
.stack 100h
.data
    msg db 0dh, 0ah, 'Enter first number: $'
    msg1 db 0dh, 0ah, 'Enter second number: $'
    result db 0dh, 0ah, 'The Result is: $'

.code
start:
    mov ax, @data
    mov ds, ax
    
    ;Display first prompt
    mov dx, offset msg
    mov ah, 09h
    int 21h
    
    ;Accept first digit (10's place) of first number
    mov ah, 01h
    int 21h
    sub al, 30h             ;Convert ASCII to number
    mov bl, 10
    mul bl                  ;Multiply by 10 (AL = tens digit * 10)
    mov bl, al              ;Store in BL
    
    ;Accept second digit (unit's place) of first number
    mov ah, 01h
    int 21h
    sub al, 30h             ;Convert ASCII to number
    add bl, al              ;Add unit's place to get complete number
    
    ;Display second prompt
    mov dx, offset msg1
    mov ah, 09h
    int 21h
    
    ;Accept first digit (10's place) of second number
    mov ah, 01h
    int 21h
    sub al, 30h             ;Convert ASCII to number
    mov cl, 10
    mul cl                  ;Multiply by 10 (AL = tens digit * 10)
    mov cl, al              ;Store in CL
    
    ;Accept second digit (unit's place) of second number
    mov ah, 01h
    int 21h
    sub al, 30h             ;Convert ASCII to number
    add cl, al              ;Add unit's place to get complete number
    
    ;Add the two numbers
    add bl, cl              ;BL = first number + second number
    
    ;Display result message
    mov dx, offset result
    mov ah, 09h
    int 21h
    
    ;Convert result to decimal and display
    mov al, bl
    xor ah, ah              ;Clear AH for division
    mov bl, 10
    div bl                  ;AL = quotient (10's), AH = remainder (1's)
    
    ;Display 10's digit
    push ax                 ;Save AX
    add al, 30h             ;Convert to ASCII
    mov dl, al
    mov ah, 02h
    int 21h
    
    ;Display unit's digit
    pop ax                  ;Restore AX
    mov dl, ah              ;Get remainder (unit's place)
    add dl, 30h             ;Convert to ASCII
    mov ah, 02h
    int 21h
    
    ;Exit program
    mov ax, 4C00h
    int 21h

end start