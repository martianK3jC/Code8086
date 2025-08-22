; Filename: Exer5.asm
; Description: 
; Name: Kesha Jane L. Ceniza
; Date: August 22, 2025

.model small
.stack 100
.data
;this is where you put some data
    ;heart db 0FEh, '♥', '$' ; "♥" symbol, '$' ends the string for AH=09h
.code
start:
; Initialize data segment
    mov ax, @data
    mov ds, ax


int 27h
end start




