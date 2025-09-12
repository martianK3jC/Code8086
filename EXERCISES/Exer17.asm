; Filename: EXER17.ASM
; Programmer Name: Kesha Jane L. Ceniza
; Date: September 12, 2025
; Description: This assembly language program will continuously get 
; character input and display back input until Enter key is pressed.

.model small
.stack 200h
.DATA
; 9 -> tab, 10 -> new line, 13 -> go back cursor to beginning, 8 -> backspace
    FILENAMEMSG DB 'Filename: Exer17.asm', 13, 10, '$'
    PROGRAMMERMSG DB 'Programmer Name: Kesha Jane L. Ceniza', 13, 10, '$'
    DESCRIPTIONMSG DB 'Description: Continuously get character input and display back input untiln enter key is pressed.', 13, 10, '$'
    DATEMSG DB 'September 12, 2025', 13, 10, 13, 10, '$'
.CODE
Exer17Code:
    mov ax, 0003h
    int 10h

    ;Set up data segment
    mov ax, @data
    mov ds, ax

    ;Display the header information
    lea dx, FILENAMEMSG
    mov ah, 09h
    int 21h

    lea dx, PROGRAMMERMSG
    mov ah, 09h
    int 21h

    lea dx, DESCRIPTIONMSG
    mov ah, 09h
    int 21h

    lea dx, DATEMSG
    mov ah, 09h
    int 21h

EchoLoop:
    mov ah, 1           ; DOS keyboard input function
    int 21h             ; get the next key

    cmp al, 13          ; was the key the Enter key?
    jz EchoDone         ; yes, so we're done echoing

    mov dl, al          ; put the character into DL
    mov ah, 2           ; DOS display output function
    int 21h             ; display the character, then interrupt

    jmp EchoLoop        ; echo the next character

EchoDone:
;DOS terminate program function
mov ah, 4ch
int 21h
END Exer17Code
