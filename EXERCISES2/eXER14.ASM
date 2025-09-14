; Filename: Exer14.asm
; Description: Form Fields
; Name: Kesha Jane L. Ceniza
; Date: August 22, 2025

.model small
.code
.stack 100
start:

MOV AH, 09h
MOV BL, 20h
MOV CL, 100
INT 10H

mov ah, 02H
mov dl, ' '
int 21h
mov dl, '_'
int 21h
mov dl, '_'
int 21h
mov dl, '_'
int 21h
mov dl, '_'
int 21h
mov dl, '_'
int 21h
mov dl, '_'
int 21h
mov dl, '_'
int 21h
mov dl, 03h
int 21h
mov dl, 03h
int 21h
mov dl, '_'
int 21h
mov dl, '_'
int 21h
mov dl, '_'
int 21h
mov dl, '_'
int 21h
mov dl, '_'
int 21h
mov dl, '_'
int 21h
mov dl, '_'
int 21h
mov dl, 0ah
int 21h


;HIGH SCHOOL BAND     Band Camp Registration

mov ah, 02h
mov dl, ' '
int 21h
mov dl, 'H'
int 21h
mov dl, 'I'
int 21h
mov dl, 'G'
int 21h
mov dl, 'H'
int 21h
mov dl, ' '
int 21h
mov dl, 'S'
int 21h
mov dl, 'C'
int 21h
mov dl, 'H'
int 21h
mov dl, 'O'
int 21h
mov dl, 'O'
int 21h
mov dl, 'L'
int 21h
mov dl, ' '
int 21h
mov dl, 'B'
int 21h
mov dl, 'A'
int 21h
mov dl, 'N'
int 21h
mov dl, 'D'
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
mov dl, ' '
int 21h
mov dl, 'B'
int 21h
mov dl, 'A'
int 21h
mov dl, 'N'
int 21h
mov dl, 'D'
int 21h
mov dl, ' '
int 21h
mov dl, 'C'
int 21h
mov dl, 'A'
int 21h
mov dl, 'M'
int 21h
mov dl, 'P'
int 21h
mov dl, ' '
int 21h
mov dl, 'R'
int 21h
mov dl, 'E'
int 21h
mov dl, 'G'
int 21h
mov dl, 'I'
int 21h
mov dl, 'S'
int 21h
mov dl, 'T'
int 21h
mov dl, 'R'
int 21h
mov dl, 'A'
int 21h
mov dl, 'T'
int 21h
mov dl, 'I'
int 21h
mov dl, 'O'
int 21h
mov dl, 'N'
int 21h
mov ah, 02h
mov dl, ' '
int 21h

;
mov ah, 02H
mov dl, 0ah
int 21h
mov dl, ' '
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

;Student Information
mov ah, 02h
mov dl, 0Ah
int 21H

MOV AH, 09h
MOV BL, 20h
MOV CL, 45
INT 10H

mov ah, 02h
mov dl, ' '
int 21h
mov dl, 'S'
int 21h
mov dl, 't'
int 21h
mov dl, 'u'
int 21h
mov dl, 'd'
int 21h
mov dl, 'e'
int 21h
mov dl, 'n'
int 21h
mov dl, 't'
int 21h
mov dl, ' '
int 21h
mov dl, 'I'
int 21h
mov dl, 'n'
int 21h
mov dl, 'f'
int 21h
mov dl, 'o'
int 21h
mov dl, 'r'
int 21h
mov dl, 'm'
int 21h
mov dl, 'a'
int 21h
mov dl, 't'
int 21h
mov dl, 'i'
int 21h
mov dl, 'o'
int 21h
mov dl, 'n'
int 21h
mov dl, ' '
int 21h


;Name* ; with red star
MOV AH, 09h
MOV BL, 20h
MOV cl, 45
INT 10H

MOV AH, 02H
mov dl, 0ah
int 21h
mov dl, ' '
int 21h
mov dl, 'N'
int 21h
mov dl, 'a'
int 21h
mov dl, 'm'
int 21h
mov dl, 'e'
int 21h

MOV AH, 09h
MOV BL, 24H
MOV CL, 1
INT 10H

mov ah, 02h
mov dl, '*'
int 21h


;|First                     |      |Last                     |

mov ah, 02H
mov dl, 0ah
int 21h

mov ah, 09H
mov bl, 20h
mov cl, 1
int 10h

mov ah, 02H
mov dl, ' '
int 21h

mov ah, 09H
mov bl, 78h
mov cl, 38
int 10h

mov ah, 02H
mov dl, '|'
int 21h
mov dl, ' '
int 21h
mov dl, 'F'
int 21h
mov dl, 'i'
int 21h
mov dl, 'r'
int 21h
mov dl, 's'
int 21h
mov dl, 't'
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
mov dl, '|'
int 21h


mov ah, 02H
mov dl, ' '
int 21h
mov dl, ' '
int 21h

mov ah, 09H
mov bl, 78h
mov cl, 38
int 10h

mov ah, 02H
mov dl, '|'
int 21h
mov dl, ' '
int 21h
mov dl, 'L'
int 21h
mov dl, 'a'
int 21h
mov dl, 's'
int 21h
mov dl, 't'
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
mov dl, '|'
int 21h

mov ah, 02H
mov dl, 0ah
int 21h
;Date of Birth*            Email*             Grade*
mov ah, 02H
mov dl, ' '
int 21h
mov dl, 'D'
int 21h
mov dl, 'a'
int 21h
mov dl, 't'
int 21h
mov dl, 'e'
int 21h
mov dl, ' '
int 21h
mov dl, 'o'
int 21h
mov dl, 'f'
int 21h
mov dl, ' '
int 21h
mov dl, 'B'
int 21h
mov dl, 'i'
int 21h
mov dl, 'r'
int 21h
mov dl, 't'
int 21h
mov dl, 'h'
int 21h

mov ah, 09H
mov bl, 24H
mov cl, 1
int 10h

mov ah, 02h
mov dl, '*'
int 21h
mov dl, ' '
int 21h
mov dl, ' '
int 21h
mov dl, ' '
int 21h
mov dl, ' '
int 21h

mov ah, 02H
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
mov dl, ' '
int 21h
mov dl, ' '
int 21h
mov dl, ' '
int 21h
mov dl, 'E'
int 21h
mov dl, 'm'
int 21h
mov dl, 'a'
int 21h
mov dl, 'i'
int 21h
mov dl, 'l'
int 21h

mov ah, 09H
mov bl, 24H
mov cl, 1
int 10h

mov ah, 02h
mov dl, '*'
int 21h

mov ah, 02H
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
mov dl, 'G'
int 21h
mov dl, 'r'
int 21h
mov dl, 'a'
int 21h
mov dl, 'd'
int 21h
mov dl, 'e'
int 21h

mov ah, 09H
mov bl, 24H
mov cl, 1
int 10h

mov ah, 02h
mov dl, '*'
int 21h
mov dl, 0ah
int 21h
;|               |        |               |  |               |

mov ah, 02H
mov dl, ' '
int 21h 

mov ah, 09H
mov bl, 78h
mov cl, 30
int 10h

mov ah, 02H
mov dl, '|'
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
mov dl, '|'
int 21h
mov dl, ' '
int 21h
mov dl, ' '
int 21h
mov dl, ' '
int 21h


mov ah, 09H
mov bl, 78h
mov cl, 19
int 10h
mov ah, 02H
mov dl, '|'
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
mov dl, '|'
int 21h
mov dl, ' '
int 21h
mov dl, ' '
int 21h
mov dl, ' '
int 21h

mov ah, 09H
mov bl, 78h
mov cl, 23
int 10h

mov ah, 02H
mov dl, '|'
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
mov dl, '|'
int 21h




;Address*
mov ah, 02H
mov dl, 0ah
int 21h 

mov ah, 02h
mov dl, ' '
int 21h
mov dl, 'A'
int 21h
mov dl, 'd'
int 21h
mov dl, 'd'
int 21h
mov dl, 'r'
int 21h
mov dl, 'e'
int 21h
mov dl, 's'
int 21h
mov dl, 's'
int 21h

mov ah, 09H
mov bl, 24H
mov cl, 1
int 10h

mov ah, 02H
mov dl, '*'
int 21h

;|Address Line 1                                             | 

mov ah, 02H
mov dl, 0ah
int 21h
mov dl, ' '
int 21h 

mov ah, 09H
mov bl, 78h
mov cl, 78
int 10h

mov ah, 02H
mov dl, '|'
int 21h
mov dl, ' '
int 21h
mov dl, 'A'
int 21h
mov dl, 'd'
int 21h
mov dl, 'd'
int 21h
mov dl, 'r'
int 21h
mov dl, 'e'
int 21h
mov dl, 's'
int 21h
mov dl, 's'
int 21h
mov dl, ' '
int 21h
mov dl, 'L'
int 21h
mov dl, 'i'
int 21h
mov dl, 'n'
int 21h
mov dl, 'e'
int 21h
mov dl, ' '
int 21h
mov dl, '1'
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
mov dl, ' '
int 21h
mov dl, ' '
int 21h
mov dl, '|'
int 21h

;|City               |  |State               |  |Zip Code    |

mov ah, 02H
mov dl, 0ah
int 21h
mov dl, ' '
int 21h 

mov ah, 09H
mov bl, 78h
mov cl, 25
int 10h

mov ah, 02H
mov dl, '|'
int 21h
mov dl, ' '
int 21h
mov dl, 'C'
int 21h
mov dl, 'i'
int 21h
mov dl, 't'
int 21h
mov dl, 'y'
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
mov dl, '|'
int 21h
mov dl, ' '
int 21h
mov dl, ' '
int 21h
mov dl, ' '
int 21h


mov ah, 09H
mov bl, 78h
mov cl, 24
int 10h
mov ah, 02H
mov dl, '|'
int 21h
mov dl, ' '
int 21h
mov dl, 'S'
int 21h
mov dl, 't'
int 21h
mov dl, 'a'
int 21h
mov dl, 't'
int 21h
mov dl, 'e'
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
mov dl, '|'
int 21h
mov dl, ' '
int 21h
mov dl, ' '
int 21h
mov dl, ' '
int 21h

mov ah, 09H
mov bl, 78h
mov cl, 23
int 10h

mov ah, 02H
mov dl, '|'
int 21h
mov dl, ' '
int 21h
mov dl, 'Z'
int 21h
mov dl, 'i'
int 21h
mov dl, 'p'
int 21h
mov dl, ' '
int 21h
mov dl, 'C'
int 21h
mov dl, 'o'
int 21h
mov dl, 'd'
int 21h
mov dl, 'e'
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
mov dl, ' '
int 21h
mov dl, '|'
int 21h

;T-shirt Size*                        Instrument

mov ah, 02H
mov dl, 0ah
int 21h
mov dl, ' '
int 21h
mov dl, 'T'
int 21h
mov dl, '-'
int 21h
mov dl, 's'
int 21h
mov dl, 'h'
int 21h
mov dl, 'i'
int 21h
mov dl, 'r'
int 21h
mov dl, 't'
int 21h
mov dl, ' '
int 21h
mov dl, 'S'
int 21h
mov dl, 'i'
int 21h
mov dl, 'z'
int 21h
mov dl, 'e'
int 21h

mov ah, 09h
mov bl, 24H
mov cl, 1
int 10h

mov ah, 02H
mov dl, '*'
int 21h

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
mov dl, ' '
int 21h
mov dl, ' '
int 21h
mov dl, ' '
int 21h
mov dl, 'I'
int 21h
mov dl, 'n'
int 21h
mov dl, 's'
int 21h
mov dl, 't'
int 21h
mov dl, 'r'
int 21h
mov dl, 'u'
int 21h
mov dl, 'm'
int 21h
mov dl, 'e'
int 21h
mov dl, 'n'
int 21h
mov dl, 't'
int 21h

mov ah, 09h
mov bl, 24H
mov cl, 1
int 10h

mov ah, 02H
mov dl, '*'
int 21h
;|                          |     |                          |

mov ah, 02H
mov dl, 0ah
int 21h

mov ah, 09H
mov bl, 20h
mov cl, 1
int 10h

mov ah, 02H
mov dl, ' '
int 21h

mov ah, 09H
mov bl, 78h
mov cl, 38
int 10h

mov ah, 02H
mov dl, '|'
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
mov dl, 'v'
int 21h
mov dl, '|'
int 21h


mov ah, 02H
mov dl, ' '
int 21h
mov dl, ' '
int 21h

mov ah, 09H
mov bl, 78h
mov cl, 38
int 10h

mov ah, 02H
mov dl, '|'
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
mov dl, ''
int 21h
mov dl, 'v'
int 21h
mov dl, '|'
int 21h



; Does your student have any food allergies that program staff should consider?*
mov ah, 02H
mov dl, 0ah
int 21h
mov dl, ' '
int 21h
mov dl, 'D'
int 21h
mov dl, 'o'
int 21h
mov dl, 'e'
int 21h
mov dl, 's'
int 21h
mov dl, ' '
int 21h
mov dl, 'y'
int 21h
mov dl, 'o'
int 21h
mov dl, 'u'
int 21h
mov dl, 'r'
int 21h
mov dl, ' '
int 21h
mov dl, 'S'
int 21h
mov dl, 't'
int 21h
mov dl, 'u'
int 21h
mov dl, 'd'
int 21h
mov dl, 'e'
int 21h
mov dl, 'n'
int 21h
mov dl, 't'
int 21h
mov dl, ' '
int 21h
mov dl, 'h'
int 21h
mov dl, 'a'
int 21h
mov dl, 'v'
int 21h
mov dl, 'e'
int 21h
mov dl, ' '
int 21h
mov dl, 'a'
int 21h
mov dl, 'n'
int 21h
mov dl, 'y'
int 21h
mov dl, ' '
int 21h
mov dl, 'f'
int 21h
mov dl, 'o'
int 21h
mov dl, 'o'
int 21h
mov dl, 'd'
int 21h
mov dl, ' '
int 21h
mov dl, 'A'
int 21h
mov dl, 'l'
int 21h
mov dl, 'l'
int 21h
mov dl, 'e'
int 21h
mov dl, 'r'
int 21h
mov dl, 'g'
int 21h
mov dl, 'i'
int 21h
mov dl, 'e'
int 21h
mov dl, 's'
int 21h
mov dl, ' '
int 21h
mov dl, 't'
int 21h
mov dl, 'h'
int 21h
mov dl, 'a'
int 21h
mov dl, 't'
int 21h
mov dl, ' '
int 21h
mov dl, 'p'
int 21h
mov dl, 'r'
int 21h
mov dl, 'o'
int 21h
mov dl, 'g'
int 21h
mov dl, 'r'
int 21h
mov dl, 'a'
int 21h
mov dl, 'm'
int 21h
mov dl, ' '
int 21h
mov dl, 's'
int 21h
mov dl, 't'
int 21h
mov dl, 'a'
int 21h
mov dl, 'f'
int 21h
mov dl, 'f'
int 21h
mov dl, ' '
int 21h
mov dl, 's'
int 21h
mov dl, 'h'
int 21h
mov dl, 'o'
int 21h
mov dl, 'u'
int 21h
mov dl, 'l'
int 21h
mov dl, 'd'
int 21h
mov dl, ' '
int 21h
mov dl, 'c'
int 21h
mov dl, 'o'
int 21h
mov dl, 'n'
int 21h
mov dl, 's'
int 21h
mov dl, 'i'
int 21h
mov dl, 'd'
int 21h
mov dl, 'e'
int 21h
mov dl, 'r'
int 21h
mov dl, '?'
int 21h

mov ah, 09H
mov bl, 24H
mov cl, 1
int 10h

mov ah, 02h
mov dl, '*'
int 21h
mov dl, 0ah
int 21h

;o Yes o No -> white circle
mov ah, 09H
mov bl, 2fh
mov cl, 2
int 10h

mov ah, 02H
mov dl, ' '
int 21h
mov dl, 04h
int 21h
mov dl, 'Y'
int 21h
mov dl, 'e'
int 21h
mov dl, 's'
int 21h
mov dl, ' '
int 21h
mov dl, ' '
int 21h

mov ah, 09H
mov bl, 2fh
mov cl, 1
int 10h

mov ah, 02h
mov dl, 04h
int 21h
mov dl, 'N'
int 21h
mov dl, 'o'
int 21h
mov dl, ' '
int 21h


;Parent/Guardian Information

mov ah, 02H
mov dl, 0ah
int 21h
mov dl, ' '
int 21h
mov dl, 'P'
int 21h
mov dl, 'a'
int 21h
mov dl, 'r'
int 21h
mov dl, 'e'
int 21h
mov dl, 'n'
int 21h
mov dl, 't'
int 21h
mov dl, '/'
int 21h
mov dl, 'G'
int 21h
mov dl, 'u'
int 21h
mov dl, 'a'
int 21h
mov dl, 'r'
int 21h
mov dl, 'd'
int 21h
mov dl, 'i'
int 21h
mov dl, 'a'
int 21h
mov dl, 'n'
int 21h
mov dl, ' '
int 21h
mov dl, 'I'
int 21h
mov dl, 'n'
int 21h
mov dl, 'f'
int 21h
mov dl, 'o'
int 21h
mov dl, 'r'
int 21h
mov dl, 'm'
int 21h
mov dl, 'a'
int 21h
mov dl, 't'
int 21h
mov dl, 'i'
int 21h
mov dl, 'o'
int 21h
mov dl, 'n'
int 21h

;Name*
;Name* ; with red star
MOV AH, 09h
MOV BL, 20h
MOV cl, 45
INT 10H

MOV AH, 02H
mov dl, 0ah
int 21h
mov dl, ' '
int 21h
mov dl, 'N'
int 21h
mov dl, 'a'
int 21h
mov dl, 'm'
int 21h
mov dl, 'e'
int 21h

MOV AH, 09h
MOV BL, 24H
MOV CL, 1
INT 10H

mov ah, 02h
mov dl, '*'
int 21h
;|First                        | |Last                        |
;|First                     |      |Last                     |

mov ah, 02H
mov dl, 0ah
int 21h

mov ah, 09H
mov bl, 20h
mov cl, 1
int 10h

mov ah, 02H
mov dl, ' '
int 21h

mov ah, 09H
mov bl, 78h
mov cl, 38
int 10h

mov ah, 02H
mov dl, '|'
int 21h
mov dl, ' '
int 21h
mov dl, 'F'
int 21h
mov dl, 'i'
int 21h
mov dl, 'r'
int 21h
mov dl, 's'
int 21h
mov dl, 't'
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
mov dl, '|'
int 21h


mov ah, 02H
mov dl, ' '
int 21h
mov dl, ' '
int 21h

mov ah, 09H
mov bl, 78h
mov cl, 38
int 10h

mov ah, 02H
mov dl, '|'
int 21h
mov dl, ' '
int 21h
mov dl, 'L'
int 21h
mov dl, 'a'
int 21h
mov dl, 's'
int 21h
mov dl, 't'
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
mov dl, '|'
int 21h

mov ah, 02H
mov dl, 0ah
int 21h
;Phone*      Email*
;|                             ||                             |

;| Submit |; green bg and white fg

int 27h
end start