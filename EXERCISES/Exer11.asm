; Filename: Exer11.asm
; Description: Choose and create your own multi-colored cartoon character.
; Name: Kesha Jane L. Ceniza
; Date: August 22, 2025



; FROG IN LOVE
.model small
.stack 100
.code
start:
    ;line 1
    mov ah, 02h
    mov dl, 0ah ; newline
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

    mov ah, 09h
    mov bl, 66h ; yellow color
    mov cx, 2 ; 2 spaces
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

    mov ah, 09h
    mov bl, 66h ; yellow color
    mov cx, 2 ; 2 spaces
    int 10h
    
    ; 2nd line

    mov ah, 02h
    mov dl, 0Ah
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

    mov ah, 09h
    mov bl, 66h ; brown color
    mov cx, 1 ; 1 space
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 22h ; green color
    mov cx, 2 ; 2 spaces
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 66h ; yellow color
    mov cx, 1 ; 1 space
    int 10h
    
    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
  
    mov ah, 09h
    mov bl, 66h ; yellow color
    mov cx, 1 ; 1 space
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 22h ; yellow color
    mov cx, 2 ;1 space
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 66h ; yellow color
    mov cx, 1 ; 1 space
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h

    ; 3rd line

    mov ah, 02h
    mov dl, 0Ah
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

    mov ah, 09h
    mov bl, 66h ; brown color
    mov cx, 1 ; 1 space
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 22h ; green color
    mov cx, 1 ;1 space
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 8Fh ; eye color
    mov cx, 1 ; 1 space
    int 10h

    mov ah, 02h
    mov dl, 03h
    int 21h
    
    mov ah, 09h
    mov bl, 22h ; greem color
    mov cx, 1 ; 1 space
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 66h ; yellow color
    mov cx, 2; 1 space
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 22h ; yellow color
    mov cx, 1; 1 space
    int 10h

     mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 8Fh ; eye color
    mov cx, 1 ; 1 space
    int 10h

    mov ah, 02h
    mov dl, 03h
    int 21h
    
    mov ah, 09h
    mov bl, 22h ; greem color
    mov cx, 1 ; 1 space
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 66h ; yellow color
    mov cx, 1; 1 space
    int 10h

    ; 4th line

    mov ah, 02h
    mov dl, 0Ah
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

    mov ah, 09h
    mov bl, 66h ; yellow color
    mov cx, 1; 1 space
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h


    mov ah, 09h
    mov bl, 22h ; yellow color
    mov cx, 10; 10 spaces
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

    mov ah, 09h
    mov bl, 66h ; yellow color
    mov cx, 1; 1 space
    int 10h

    ;5th line

    mov ah, 02h
    mov dl, 0Ah
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

    mov ah, 09h
    mov bl, 66h ; yellow color
    mov cx, 1
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 22h; green line
    mov cx, 10
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h


    mov ah, 09h
    mov bl, 55h ; BLUSH
    mov cx, 2
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 22h
    mov cx, 1
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h


    mov ah, 09h
    mov bl, 55h ; BLUSH
    mov cx, 2
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 66h ; yellow color
    mov cx, 1
    int 10h

    ; 6th line
    mov ah, 02h
    mov dl, 0Ah
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

    mov ah, 09h
    mov bl, 66h ; yellow color
    mov cx, 12
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 22h; green line
    mov cx, 10
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 84h; black line
    mov cx, 4
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h
    mov dl, 03h
    int 21h
    mov dl, ' '
    int 21h

    ; 7th line

    mov ah, 02h
    mov dl, 0Ah
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

    mov ah, 09h
    mov bl, 66h ; yellow color
    mov cx, 12
    int 10h

    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 09h
    mov bl, 22h; green line
    mov cx, 10
    int 10h

    ; 8th line
    mov ah, 02h
    mov dl, 0Ah
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

    mov ah, 09h
    mov bl, 66h ; yellow color
    mov cx, 10
    int 10h

int 27h
end start