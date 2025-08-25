; Filename: Exer12.asm
; Description: Print the following strings
; Firstname Middlename Lastname
; Bachelor of Science in Computer Science 2nd Year
; College of Computer Studies
; Cebu Institute of Technology - University
; Name: Kesha Jane L. Ceniza
; Date: August 22, 2025


.model small
.data 
    fullname db 'Kesha Jane Lepiten Ceniza$'
    courseAndYear db 'Bachelor of Science in Computer Science 2nd Year$'
    department db 'College of Computer Studies$'
    school db 'Cebu Institute of Technology - University$'
.code
.startup

main1:
; Fullname
    mov ah, 9
    mov dx, offset fullname
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h

    mov ah, 9
    mov dx, offset courseAndYear
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h

    mov ah, 9
    mov dx, offset department
    int 21h

    mov ah, 02h
    mov dl, 0Ah
    int 21h
    
    mov ah, 9
    mov dx, offset school
    int 21h
    
    mov ah, 09h
    mov bl, 11h 
    mov cx, 1 
    int 10h

.exit
end
