; Filename: Exer13.asm
; Description: Create AUGUST 2025 Calendar using ascii characters, with borders. Follow the text color
; Name: Kesha Jane L. Ceniza
; Date: August 22, 2025


.model small
.stack 100
.code
start:
;  black font alternative -> gray

; AUGUST 2025
    mov ah, 09h
    mov bl, 08h
    mov cx, 36
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, 'A'
    int 21h
    mov dl, 'U'
    int 21h
    mov dl, 'G'
    int 21h
    mov dl, 'U'
    int 21h
    mov dl, 'S'
    int 21h
    mov dl, 'T'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '2'
    int 21h
    mov dl, '0'
    int 21h
    mov dl, '2'
    int 21h
    mov dl, '5'
    int 21h 

; New Line
    mov ah, 02h
    mov dl, 0ah
    int 21h
    
; Border
    mov ah, 02h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h

; New Line
    mov ah, 02h
    mov dl, 0Ah
    int 21h

; DAYS ---------------------------------------------------------------------------------------------------------
; '| Su | Mo | Tu | We | Th | Fr | Sa |$'
    mov ah, 02h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, 'S'
    int 21h
    mov dl, 'u'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, 'M'
    int 21h
    mov dl, 'o'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, 'T'
    int 21h
    mov dl, 'u'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, 'W'
    int 21h
    mov dl, 'e'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, 'T'
    int 21h
    mov dl, 'h'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, 'F'
    int 21h
    mov dl, 'r'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, 'S'
    int 21h
    mov dl, 'a'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h

; New Line
    mov ah, 02h
    mov dl, 0ah
    int 21h
    
; Border 
    mov ah, 02h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h

; New line
    mov ah, 02h
    mov dl, 0Ah
    int 21h
    

; week 1 ---------------------------------------------------------------------------------------------------------
; |    |    |    |    |    |  1 |  2 |$', where 2 is blue

    mov ah, 02h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 04h
    mov cx, 2
    int 10h

    mov ah, 02h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, ' '; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, ' '; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, ' '; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, ' '; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, '1'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 01h
    mov cx, 2
    int 10h

    mov ah, 02h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, '2'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h

; New Line
    mov ah, 02h
    mov dl, 0ah
    int 21h
    
; Border
    mov ah, 02h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h

; New line
    mov ah, 02h
    mov dl, 0Ah
    int 21h

; week 2 ---------------------------------------------------------------------------
; |  3 |  4 |  5 |  6 |  7 |  8 |  9 |  
mov ah, 02h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 04h
    mov cx, 2
    int 10h

    mov ah, 02h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, '3'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, '4'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, '5'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, '6'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, '7'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, '8'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 01h
    mov cx, 2
    int 10h

    mov ah, 02h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, '9'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h

; New Line
    mov ah, 02h
    mov dl, 0ah
    int 21h
    
; Border
    mov ah, 02h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h

; New line
mov ah, 02h
mov dl, 0Ah
int 21h

; week 3 ---------------------------------------------------------------------------
; | 10 | 11 | 12 | 13 | 14 | 15 | 16 |
mov ah, 02h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 04h
    mov cx, 2
    int 10h

    mov ah, 02h
    mov dl, '1'; 1st digit
    int 21h
    mov dl, '0'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '1'; 1st digit
    int 21h
    mov dl, '1'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '1'; 1st digit
    int 21h
    mov dl, '2'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '1'; 1st digit
    int 21h
    mov dl, '3'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '1'; 1st digit
    int 21h
    mov dl, '4'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '1'; 1st digit
    int 21h
    mov dl, '5'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 01h
    mov cx, 2
    int 10h

    mov ah, 02h
    mov dl, '1'; 1st digit
    int 21h
    mov dl, '6'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h

; New Line
    mov ah, 02h
    mov dl, 0ah
    int 21h
    
; Border
    mov ah, 02h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h

; New line
mov ah, 02h
mov dl, 0Ah
int 21h


; week 4 ---------------------------------------------------------------------------
; week4 | 17 | 18 | 19 | 20 | 21 | 22 | 23 |
mov ah, 02h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 04h
    mov cx, 2
    int 10h

    mov ah, 02h
    mov dl, '1'; 1st digit
    int 21h
    mov dl, '7'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '1'; 1st digit
    int 21h
    mov dl, '8'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '1'; 1st digit
    int 21h
    mov dl, '9'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '2'; 1st digit
    int 21h
    mov dl, '0'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '2'; 1st digit
    int 21h
    mov dl, '1'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '2'; 1st digit
    int 21h
    mov dl, '2'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 01h
    mov cx, 2
    int 10h

    mov ah, 02h
    mov dl, '2'; 1st digit
    int 21h
    mov dl, '3'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h

; New Line
    mov ah, 02h
    mov dl, 0ah
    int 21h
    
; Border
    mov ah, 02h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h

; New line
mov ah, 02h
mov dl, 0Ah
int 21h


; week 5 ---------------------------------------------------------------------------
; week5 | 24 | 25 | 26 | 27 | 28 | 29 | 30 |

mov ah, 02h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 04h
    mov cx, 2
    int 10h

    mov ah, 02h
    mov dl, '2'; 1st digit
    int 21h
    mov dl, '4'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '2'; 1st digit
    int 21h
    mov dl, '5'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '2'; 1st digit
    int 21h
    mov dl, '6'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '2'; 1st digit
    int 21h
    mov dl, '7'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '2'; 1st digit
    int 21h
    mov dl, '8'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '2'; 1st digit
    int 21h
    mov dl, '9'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 01h
    mov cx, 2
    int 10h

    mov ah, 02h
    mov dl, '3'; 1st digit
    int 21h
    mov dl, '0'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h

; New Line
    mov ah, 02h
    mov dl, 0ah
    int 21h
    
; Border
    mov ah, 02h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h

; New line
mov ah, 02h
mov dl, 0Ah
int 21h

; week 6 ---------------------------------------------------------------------------
; week6 | 31 |    |    |    |    |    |    |

mov ah, 02h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 04h
    mov cx, 2
    int 10h

    mov ah, 02h
    mov dl, '3'; 1st digit
    int 21h
    mov dl, '1'; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, ' '; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, ' '; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, ' '; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, ' '; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, ' '; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 01h
    mov cx, 2
    int 10h

    mov ah, 02h
    mov dl, ' '; 1st digit
    int 21h
    mov dl, ' '; 2nd digit
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h

; New Line
    mov ah, 02h
    mov dl, 0ah
    int 21h
    
; Border
    mov ah, 02h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h
    mov dl, '-'
    int 21h

; New line
mov ah, 02h
mov dl, 0Ah
int 21h


int 27h
end start
