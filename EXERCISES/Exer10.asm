; Filename: Exer10.asm
; Description: Create your own multicolored character with blinking parts.
; Create the yellow duck with blinking eye
; Name: Kesha Jane L. Ceniza
; Date: August 22, 2025

.model small
.code
.stack 100h
start:

    ; line 1
    mov ah, 02h
    mov dl, 0ah  ;newline
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 4
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
    ; line 2
    mov ah, 02h
    mov dl, 0ah  ;newline
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 6
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    ; line 3
    mov ah, 02h
    mov dl, 0ah  ;newline
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 44h ; beak green
    mov cx, 1
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 1
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 87h ; blink
    mov cx, 1
    int 10h
   
    mov ah, 02h
    mov dl, 30h ; eye 9
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 3
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    ; line 4
    mov ah, 02h
    mov dl, 0ah  ;newline
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 44h ; beak green
    mov cx, 3
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 5
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    ; line 5
    mov ah, 02h
    mov dl, 0ah  ;newline
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 44h ; beak green
    mov cx, 3
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 3
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    ; line 6
    mov ah, 02h
    mov dl, 0ah  ;newline
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 3
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 3
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h


    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 1
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h


    ; line 7
    mov ah, 02h
    mov dl, 0ah  ;newline
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 8
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 70h ; line white
    mov cx, 1
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 1
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    ; line 8
    mov ah, 02h
    mov dl, 0ah  ;newline
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 4
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 7Fh ; line white
    mov cx, 1
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 3
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 7Fh ; line white
    mov cx, 1
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 2
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h


    ; line 9
    mov ah, 02h
    mov dl, 0ah  ;newline
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 5
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 77h ; line white
    mov cx, 3
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 3
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    ; line 10
    mov ah, 02h
    mov dl, 0ah  ;newline
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 11
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    ; line 11
    mov ah, 02h
    mov dl, 0ah  ;newline
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 9
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    ; line 12
    mov ah, 02h
    mov dl, 0ah  ;newline
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 09h
    mov bl, 66h ; color yellow
    mov cx, 7
    int 10h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    mov ah, 02h
    mov dl, 20h
    int 21h
   
    ; line 13
    mov ah, 02h
    mov dl, 0ah  ;newline
    int 21h
   
int 27h
end start