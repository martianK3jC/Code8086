; Filename: EXER18.ASM
; Programmer Name: YOUR FULLNAME HERE
; Date: DATE TODAY
; Description: This assembly language program will get character input and 
; and determine if input is 'y' or 'Y' to display good morning message
; else display good afternoon message.

.model small
.stack 100h
.DATA
    TIMEPROMPT DB 'Is it after 12 noon (Y/N)?', '$'
        GOODMORNINGMSG LABEL BYTE 
            DB 13,10,'Good morning, world!', 13, 10, '$'
        GOODAFTERNOONMSG LABEL BYTE 
            DB 13, 10,'Good afternoon, world!', 13, 10, '$'

.CODE
Exer18CodeStart:
    mov ax, @data
    mov ds, ax                  ; set DS to point to data segment
    mov dx, OFFSET TIMEPROMPT   ; point to the time prompt
    mov ah, 9                   ; DOS print string function
    int 21h                     ; display time prompt 

    mov ah, 1                   ; DOS get character function
    int 21h

    cmp al, 'y'                 ; typed lowercase 'y'for afternoon?
    jz IsAfternoon              ; jz = jump if zero. Yes, it's afternoon
    cmp al, 'Y'                 ; typed uppercase 'Y' for afternoon?
    jnz IsMorning               ; no, it's before noon

IsAfternoon:
    mov dx, OFFSET GOODAFTERNOONMSG ; point to the afternoon greeting
    jmp DisplayGreeting             ; point to the afternoon greeting

IsMorning:
    mov dx, OFFSET GOODMORNINGMSG   ; point to before afternoon greeting
    
DisplayGreeting:
    mov ah, 9                       ; DOS print string function
    int 21h                         ; display the greeting

    mov ah, 4ch                 ; DOS terminate program function 
    int 21h                     ; terminate program
END Exer18CodeStart