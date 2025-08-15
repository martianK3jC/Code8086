; Filename: Exer4.asm

; Display:
; ABOUT ME: 
; Id Number: 23-2335-330 
; First Name: Kesha Jane
; Middle Name: Lepiten
; Last Name: Ceniza
; Course and Year: Bachelor of Computer Science 2
; School: Cebu Institute of Technology - University

; Name: Kesha Jane L. Ceniza
; Date: August 15, 2025

.model small
.code
.stack 100
start:

    ;print  ABOUT ME
    mov ah, 02h
    mov dl, 'A'
    int 21h
    mov ah, 02h
    mov dl, 'B'
    int 21h
    mov ah, 02h
    mov dl, 'O'
    int 21h
    mov ah, 02h
    mov dl, 'U'
    int 21h
    mov ah, 02h
    mov dl, 'T'
    int 21h

    mov ah, 02h
    mov dl, 20h ; space
    int 21h

    mov ah, 02h
    mov dl, 'M'
    int 21h
    mov ah, 02h
    mov dl, 'E'
    int 21h

    mov ah, 02h
    mov dl, 0ah ; new line
    int 21h


    ;print ID Number: 23-2335-330
    mov ah, 02h
    mov dl, 'I'
    int 21h
    mov ah, 02h
    mov dl, 'D'
    int 21h

    mov ah, 02h
    mov dl, 20h
    int 21h

    mov ah, 02h
    mov dl, 'N'
    int 21h
    mov ah, 02h
    mov dl, 'u' 
    int 21h
    mov ah, 02h
    mov dl, 'm'
    int 21h
    mov ah, 02h
    mov dl, 'b'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h
    mov ah, 02h
    mov dl, 'r'
    int 21h
    mov ah, 02h
    mov dl, ':'
    int 21h

    mov ah, 02h
    mov dl, 20h
    int 21h

    mov ah, 02h
    mov dl, '2'
    int 21h
    mov ah, 02h
    mov dl, '3'
    int 21h
    mov ah, 02h
    mov dl, '-'
    int 21h
    mov ah, 02h
    mov dl, '2'
    int 21h
    mov ah, 02h
    mov dl, '3'
    int 21h
    mov ah, 02h
    mov dl, '3'
    int 21h
    mov ah, 02h
    mov dl, '5'
    int 21h
    mov ah, 02h
    mov dl, '-'
    int 21h  
    mov ah, 02h
    mov dl, '3'
    int 21h  
    mov ah, 02h
    mov dl, '3'
    int 21h
    mov ah, 02h 
    mov dl, '0'
    int 21h

    mov ah, 02h
    mov dl, 0ah
    int 21h


    ; print First Name: Kesha Jane
    mov ah, 02h
    mov dl, 'F'
    int 21h
    mov ah, 02h
    mov dl, 'i'
    int 21h
    mov ah, 02h
    mov dl, 'r'
    int 21h        
    mov ah, 02h
    mov dl, 's'
    int 21h
    mov ah, 02h
    mov dl, 't'
    int 21h

    mov ah, 02h
    mov dl, 20h
    int 21h

    mov ah, 02h
    mov dl, 'N'
    int 21h
    mov ah, 02h
    mov dl, 'a'
    int 21h
    mov ah, 02h
    mov dl, 'm'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h
    mov ah, 02h
    mov dl, ':'
    int 21h

    mov ah, 02h
    mov dl, 20h
    int 21h

    mov ah, 02h
    mov dl, 'K'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h
    mov ah, 02h
    mov dl, 's'
    int 21h
    mov ah, 02h
    mov dl, 'h'
    int 21h
    mov ah, 02h
    mov dl, 'a'
    int 21h

    mov ah, 02h
    mov dl, 20h
    int 21h

    mov ah, 02h
    mov dl, 'J'
    int 21h
    mov ah, 02h
    mov dl, 'a'
    int 21h
    mov ah, 02h
    mov dl, 'n'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h


    ; print Middle Name: Lepiten
    mov ah, 02h
    mov dl, 'M'
    int 21h
    mov ah, 02h
    mov dl, 'i'
    int 21h
    mov ah, 02h
    mov dl, 'd'
    int 21h
    mov ah, 02h
    mov dl, 'd'
    int 21h
    mov ah, 02h
    mov dl, 'l'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h

    mov ah, 02h
    mov dl, 20h
    int 21h

    mov ah, 02h
    mov dl, 'N'
    int 21h
    mov ah, 02h
    mov dl, 'a'
    int 21h
    mov ah, 02h
    mov dl, 'm'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h
    mov ah, 02h
    mov dl, ':'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, 'L'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h
    mov ah, 02h
    mov dl, 'p'
    int 21h
    mov ah, 02h
    mov dl, 'i'
    int 21h
    mov ah, 02h
    mov dl, 't'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h
    mov ah, 02h
    mov dl, 'n'
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h


    ;print Last Name: Ceniza
    mov ah, 02h
    mov dl, 'L'
    int 21h
    mov ah, 02h
    mov dl, 'a'
    int 21h
    mov ah, 02h
    mov dl, 's'
    int 21h
    mov ah, 02h
    mov dl, 't'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, 'N'
    int 21h
    mov ah, 02h
    mov dl, 'a'
    int 21h
    mov ah, 02h
    mov dl, 'm'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h
    mov ah, 02h
    mov dl, ':'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, 'C'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h
    mov ah, 02h
    mov dl, 'n'
    int 21h
    mov ah, 02h
    mov dl, 'i'
    int 21h
    mov ah, 02h
    mov dl, 'z'
    int 21h
    mov ah, 02h
    mov dl, 'a'
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h


    ;print: Course and Year: Bachelor of Computer Science 2
    mov ah, 02h
    mov dl, 'C'
    int 21h
    mov ah, 02h
    mov dl, 'o'
    int 21h
    mov ah, 02h
    mov dl, 'u'
    int 21h
    mov ah, 02h
    mov dl, 'r'
    int 21h
    mov ah, 02h
    mov dl, 's'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, 'A'
    int 21h
    mov ah, 02h
    mov dl, 'n'
    int 21h
    mov ah, 02h
    mov dl, 'd'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, 'Y'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h
    mov ah, 02h
    mov dl, 'a'
    int 21h
    mov ah, 02h
    mov dl, 'r'
    int 21h
    mov ah, 02h
    mov dl, ':'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, 'B'
    int 21h
    mov ah, 02h
    mov dl, 'a'
    int 21h
    mov ah, 02h
    mov dl, 'c'
    int 21h
    mov ah, 02h
    mov dl, 'h'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h
    mov ah, 02h
    mov dl, 'l'
    int 21h
    mov ah, 02h
    mov dl, 'o'
    int 21h
    mov ah, 02h
    mov dl, 'r'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, 'o'
    int 21h
    mov ah, 02h
    mov dl, 'f'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, 'C'
    int 21h
    mov ah, 02h
    mov dl, 'o'
    int 21h
    mov ah, 02h
    mov dl, 'm'
    int 21h
    mov ah, 02h
    mov dl, 'p'
    int 21h
    mov ah, 02h
    mov dl, 'u'
    int 21h
    mov ah, 02h
    mov dl, 't'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h
    mov ah, 02h
    mov dl, 'r'
    int 21h

    mov ah, 02h
    mov dl, ''
    int 21h

    mov ah, 02h
    mov dl, 'S'
    int 21h
    mov ah, 02h
    mov dl, 'c'
    int 21h
    mov ah, 02h
    mov dl, 'i'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h
    mov ah, 02h
    mov dl, 'n'
    int 21h
    mov ah, 02h
    mov dl, 'c'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, '2'
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h

    ;print: School: Cebu Institute of Technology - University
    mov ah, 02h
    mov dl, 'S'
    int 21h
    mov ah, 02h
    mov dl, 'c'
    int 21h
    mov ah, 02h
    mov dl, 'h'
    int 21h
    mov ah, 02h
    mov dl, 'o'
    int 21h
    mov ah, 02h
    mov dl, 'o'
    int 21h
    mov ah, 02h
    mov dl, 'l'
    int 21h
    mov ah, 02h
    mov dl, ':'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, 'C'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h
    mov ah, 02h
    mov dl, 'b'
    int 21h
    mov ah, 02h
    mov dl, 'u'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, 'I'
    int 21h
    mov ah, 02h
    mov dl, 'n'
    int 21h
    mov ah, 02h
    mov dl, 's'
    int 21h
    mov ah, 02h
    mov dl, 't'
    int 21h
    mov ah, 02h
    mov dl, 'i'
    int 21h
    mov ah, 02h
    mov dl, 't'
    int 21h
    mov ah, 02h
    mov dl, 'u'
    int 21h
    mov ah, 02h
    mov dl, 't'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, 'o'
    int 21h
    mov ah, 02h
    mov dl, 'f'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, 'T'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h
    mov ah, 02h
    mov dl, 'c'
    int 21h
    mov ah, 02h
    mov dl, 'h'
    int 21h
    mov ah, 02h
    mov dl, 'n'
    int 21h
    mov ah, 02h
    mov dl, 'o'
    int 21h
    mov ah, 02h
    mov dl, 'l'
    int 21h
    mov ah, 02h
    mov dl, 'o'
    int 21h
    mov ah, 02h
    mov dl, 'g'
    int 21h
    mov ah, 02h
    mov dl, 'y'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, '-'
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, 'U'
    int 21h
    mov ah, 02h
    mov dl, 'n'
    int 21h
    mov ah, 02h
    mov dl, 'i'
    int 21h
    mov ah, 02h
    mov dl, 'v'
    int 21h
    mov ah, 02h
    mov dl, 'e'
    int 21h
    mov ah, 02h
    mov dl, 'r'
    int 21h
    mov ah, 02h
    mov dl, 's'
    int 21h
    mov ah, 02h
    mov dl, 'i'
    int 21h
    mov ah, 02h
    mov dl, 't'
    int 21h
    mov ah, 02h
    mov dl, 'y'
    int 21h

int 27h
end start