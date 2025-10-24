
; Filename: HandsOnExam.asm
; Programmer Name: Kesha Jane L. Ceniza
; Date: September 19, 2025
; Description: Hands on Exam


.MODEL SMALL
.STACK 1000h
.DATA
    FISHBOOKSTRING DB 'FISHBOOK ACCOUNT REGISTRATION', 13, 10, '$'
    PROGRAMMERSMSG DB 'Programmer Name: KESHA JANE L. CENIZA', 13, 10, '$'
    DESCRIPTIONMSG DB 'Description: Hands on exam', 13, 10, '$'
    DATEMSG DB 'Date Created: September , 2024', 13, 10, 13, 10, '$'
 fullName DB 50 DUP('$') ; Reserve 50 bytes for input string
 birthday DB 50 DUP('$')
 gender DB 50 DUP('$')

email DB 50 DUP('$')
password DB 50 DUP('$')

 promptFullName DB ' Enter Full Name: $'
 promptBirthday DB ' Enter Birthday: $'
 promptGender DB ' Enter Gender: $'

;;;;;;;;;;;;;;;
promptEmail DB ' Enter Email Address: $'
promptPassword DB ' Enter Password: $'

outputMessage DB " Please review account registration details below:",13,10,'$'

; Table structure with proper borders
tableTop DB ' +------------------+---------------------------------------------------------+', 13, 10, '$'
tableMid DB ' +------------------+---------------------------------------------------------+', 13, 10, '$'
tableBot DB ' +------------------+---------------------------------------------------------+', 13, 10, '$'

outputName DB ' | Full Name:       | $'
outputBirthday DB ' | Birthday:        | $'
outputGender DB ' | Gender:          | $'
outputEmail DB ' | Email Address:   | $'
outputPassword DB ' | Password:        | $'

    submitBtn DB " SUBMIT $"
    cancelBtn DB " CANCEL $"
    editBtn DB " EDIT $"
    
    ; For closing table rows
    tableRowEnd DB ' |', 13, 10, '$'

.CODE

MAIN PROC
 ; Initialize data segment
   mov ax, 0003h  
    int 10h

    ; Set up data segment
    mov ax, @data
    mov ds, ax

    ; Display the header information
    lea dx, FISHBOOKSTRING
    mov ah, 09h
    int 21h

    mov ah,02h
    mov cl,0Ah ; 0Ah is new line
    mov dl,cl
    int 21h

 ; Prompt the user for input first string
 LEA DX, promptFullName
 MOV AH, 09h ; DOS function to display a string
 INT 21h

 ; Read input first string
 LEA DX, fullName
 MOV AH, 0Ah ; DOS function to read a string
 INT 21h

 ; this is for displaying new line
mov ah,02h
mov cl,0Ah ; 0Ah is new line
mov dl,cl
int 21h

 ; Prompt the user for input second string
 LEA DX, promptBirthday
 MOV AH, 09h ; DOS function to display a string
 INT 21h

 ; Read input second string
 LEA DX, birthday
 MOV AH, 0Ah ; DOS function to read a string
 INT 21h
 ; this is for displaying new line
mov ah,02h
mov cl,0Ah ; 0Ah is new line
mov dl,cl
int 21h

 ; Prompt the user for input third string
 LEA DX, promptGender
 MOV AH, 09h ; DOS function to display a string
 INT 21h

 ; Read input third string
 LEA DX, gender
 MOV AH, 0Ah ; DOS function to read a string
 INT 21h

; this is for displaying new line
mov ah,02h
mov cl,0Ah ; 0Ah is new line
mov dl,cl
int 21h

 ; Prompt the user for input email address string
 LEA DX, promptEmail
 MOV AH, 09h ; DOS function to display a string
 INT 21h

 ; Read input email string
 LEA DX, email
 MOV AH, 0Ah ; DOS function to read a string
 INT 21h

; this is for displaying new line
mov ah,02h
mov cl,0Ah ; 0Ah is new line
mov dl,cl
int 21h

 ; Prompt the user for input password string
 LEA DX, promptPassword
 MOV AH, 09h ; DOS function to display a string
 INT 21h

 ; Read input password string
 LEA DX, password
 MOV AH, 0Ah ; DOS function to read a string
 INT 21h

; this is for displaying new line
mov ah,02h
mov cl,0Ah ; 0Ah is new line
mov dl,cl
int 21h

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; this is for displaying new line
mov ah,02h
mov cl,0Ah ; 0Ah is new line
mov dl,cl
int 21h

 LEA DX, outputMessage
 MOV AH, 09h ; DOS function to display a string
 INT 21h

; Set blue background for table area (next 11 rows)
mov ah, 06h         ; Scroll window up (clear area)
mov al, 0           ; Clear entire area
mov bh, 1Fh         ; Blue background (1) + White text (F)
mov ch, 9           ; Start row (current position)
mov cl, 0           ; Start column
mov dh, 19          ; End row (allow for 11 rows of table)
mov dl, 79          ; End column (full width)
int 10h

; Position cursor to start of table area
mov ah, 02h
mov bh, 0
mov dh, 9           ; Row 9
mov dl, 0           ; Column 0
int 10h

; Display table top border
LEA DX, tableTop
MOV AH, 09h
INT 21h

; Row 1: Full Name
LEA DX, outputName
MOV AH, 09h
INT 21h

LEA DX, fullName + 2
MOV AH, 09h
INT 21h

LEA DX, tableRowEnd
MOV AH, 09h
INT 21h

; Middle border
LEA DX, tableMid
MOV AH, 09h
INT 21h

; Row 2: Birthday
LEA DX, outputBirthday
MOV AH, 09h
INT 21h

LEA DX, birthday + 2
MOV AH, 09h
INT 21h

LEA DX, tableRowEnd
MOV AH, 09h
INT 21h

; Middle border
LEA DX, tableMid
MOV AH, 09h
INT 21h

; Row 3: Gender
LEA DX, outputGender
MOV AH, 09h
INT 21h

LEA DX, gender + 2
MOV AH, 09h
INT 21h

LEA DX, tableRowEnd
MOV AH, 09h
INT 21h

; Middle border
LEA DX, tableMid
MOV AH, 09h
INT 21h

; Row 4: Email Address
LEA DX, outputEmail
MOV AH, 09h
INT 21h

LEA DX, email + 2
MOV AH, 09h
INT 21h

LEA DX, tableRowEnd
MOV AH, 09h
INT 21h

; Middle border
LEA DX, tableMid
MOV AH, 09h
INT 21h

; Row 5: Password
LEA DX, outputPassword
MOV AH, 09h
INT 21h

LEA DX, password + 2
MOV AH, 09h
INT 21h

LEA DX, tableRowEnd
MOV AH, 09h
INT 21h

; Bottom border
LEA DX, tableBot
MOV AH, 09h
INT 21h

; Reset to normal colors for area below table
mov ah, 06h
mov al, 0
mov bh, 07h         ; Normal colors (light gray on black)
mov ch, 20          ; Start after table
mov cl, 0
mov dh, 24          ; Bottom of screen
mov dl, 79
int 10h

; Position cursor after table for buttons
mov ah, 02h
mov bh, 0
mov dh, 20
mov dl, 0
int 10h

;;;;BUUTTTOOONNSS
; this is for displaying new line
mov ah,02h
mov cl,0Ah ; 0Ah is new line
mov dl,cl
int 21h

; SUBMIT button with red background
mov ah, 09h
mov bl, 4Fh    ; Red background + White text
mov cx, 8      ; Length of " SUBMIT " (including spaces)
int 10h

LEA DX, submitBtn
MOV AH, 09h
INT 21h

; Add spaces between buttons
mov ah, 02h
mov dl, ' '
int 21h
mov dl, ' '
int 21h

; CANCEL button with red background  
mov ah, 09h
mov bl, 4Fh    ; Red background + White text
mov cx, 8      ; Length of " CANCEL " (including spaces)
int 10h

LEA DX, cancelBtn
MOV AH, 09h
INT 21h

; Add spaces between buttons
mov ah, 02h
mov dl, ' '
int 21h
mov dl, ' '
int 21h

; EDIT button with red background
mov ah, 09h
mov bl, 4Fh    ; Red background + White text  
mov cx, 6      ; Length of " EDIT " (including spaces)
int 10h

LEA DX, editBtn
MOV AH, 09h
INT 21h

; this is for displaying new line
mov ah,02h
mov cl,0Ah ; 0Ah is new line
mov dl,cl
int 21h

; Exit program
MOV AX, 4C00h ; DOS function to terminate program
INT 21h

MAIN ENDP
END MAIN

