; Filename: EXER43.ASM
; Programmer Name: YOUR FULL NAME HERE
; Date: October 25, 2025
; Description: 2025 Calendar Display Program with Menu Selection

.MODEL SMALL
.STACK 100h
.DATA
    ; Header strings
    HEADER1 DB '2025 Calendar', 13, 10, '$'
    HEADER2 DB 'Programmer: YOUR FULL NAME HERE', 13, 10, '$'
    HEADER3 DB 'Date Finished: ACTUAL DATE FINISHED', 13, 10, '$'
    HEADER4 DB 'Main Menu', 13, 10, '$'
    
    ; Menu display
    MENU1 DB '1 January       5 May           9 September', 13, 10, '$'
    MENU2 DB '2 February      6 June          10 October', 13, 10, '$'
    MENU3 DB '3 March         7 July          11 November', 13, 10, '$'
    MENU4 DB '4 April         8 August        12 December', 13, 10, '$'
    
    PROMPT DB 'Enter choice: $'
    AGAIN_PROMPT DB 'Again? Y/N: $'
    INVALID_MSG DB 'INVALID ENTRY!', 13, 10, '$'
    THANK_MSG DB 'Thank you. Come back soon.$'
    
    ; Month names
    JAN_STR DB 'January 2025', 13, 10, '$'
    FEB_STR DB 'February 2025', 13, 10, '$'
    MAR_STR DB 'March 2025', 13, 10, '$'
    APR_STR DB 'April 2025', 13, 10, '$'
    MAY_STR DB 'May 2025', 13, 10, '$'
    JUN_STR DB 'June 2025', 13, 10, '$'
    JUL_STR DB 'July 2025', 13, 10, '$'
    AUG_STR DB 'August 2025', 13, 10, '$'
    SEP_STR DB 'September 2025', 13, 10, '$'
    OCT_STR DB 'October 2025', 13, 10, '$'
    NOV_STR DB 'November 2025', 13, 10, '$'
    DEC_STR DB 'December 2025', 13, 10, '$'
    
    ; Day headers
    DAY_HEADER DB 'S   M   T   W   T   F   S', 13, 10, '$'
    
    ; Calendar data: start_day (0=Sun), days_in_month
    CAL_DATA DB 3, 31    ; January
             DB 6, 28    ; February
             DB 6, 31    ; March
             DB 2, 30    ; April
             DB 4, 31    ; May
             DB 0, 30    ; June
             DB 2, 31    ; July
             DB 5, 31    ; August
             DB 1, 30    ; September
             DB 3, 31    ; October
             DB 6, 30    ; November
             DB 1, 31    ; December
    
    ; Color codes for each month
    MONTH_COLORS DB 1Fh, 3Fh, 2Fh, 5Fh, 6Fh, 1Eh, 4Fh, 5Eh, 3Eh, 2Eh, 6Eh, 4Eh
    
    CHOICE DB ?
    START_DAY DB ?
    DAYS_IN_MONTH DB ?
    CURRENT_COLOR DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
MAIN_LOOP:
    CALL CLEAR_SCREEN
    
    ; Display header
    LEA DX, HEADER1
    MOV AH, 09h
    INT 21h
    
    LEA DX, HEADER2
    MOV AH, 09h
    INT 21h
    
    LEA DX, HEADER3
    MOV AH, 09h
    INT 21h
    
    MOV AH, 02h
    MOV DL, 13
    INT 21h
    MOV DL, 10
    INT 21h
    
    ; Display menu
    LEA DX, HEADER4
    MOV AH, 09h
    INT 21h
    
    LEA DX, MENU1
    MOV AH, 09h
    INT 21h
    
    LEA DX, MENU2
    MOV AH, 09h
    INT 21h
    
    LEA DX, MENU3
    MOV AH, 09h
    INT 21h
    
    LEA DX, MENU4
    MOV AH, 09h
    INT 21h
    
    ; Get choice
    LEA DX, PROMPT
    MOV AH, 09h
    INT 21h
    
    CALL GET_CHOICE
    CMP AL, 0FFh
    JNE VALID_CHOICE
    
    ; Invalid input
    MOV AH, 02h
    MOV DL, 13
    INT 21h
    MOV DL, 10
    INT 21h
    
    MOV AH, 09h
    MOV BH, 0
    MOV BL, 0CEh
    MOV CX, 14
    INT 10h
    
    LEA DX, INVALID_MSG
    MOV AH, 09h
    INT 21h
    
    JMP ASK_AGAIN
    
VALID_CHOICE:
    MOV CHOICE, AL
    
    MOV AH, 02h
    MOV DL, 13
    INT 21h
    MOV DL, 10
    INT 21h
    
    ; Setup calendar data
    MOV AL, CHOICE
    DEC AL
    MOV BL, 2
    MUL BL
    MOV BX, AX
    
    MOV AL, CAL_DATA[BX]
    MOV START_DAY, AL
    MOV AL, CAL_DATA[BX+1]
    MOV DAYS_IN_MONTH, AL
    
    MOV AL, CHOICE
    DEC AL
    MOV BX, AX
    MOV AL, MONTH_COLORS[BX]
    MOV CURRENT_COLOR, AL
    
    CALL DISPLAY_CALENDAR
    
ASK_AGAIN:
    LEA DX, AGAIN_PROMPT
    MOV AH, 09h
    INT 21h
    
    MOV AH, 01h
    INT 21h
    MOV BL, AL
    
    CMP BL, 'Y'
    JE GO_MENU
    CMP BL, 'y'
    JE GO_MENU
    CMP BL, 'N'
    JE EXIT_PROG
    CMP BL, 'n'
    JE EXIT_PROG
    
    ; Invalid again response
    MOV AH, 02h
    MOV DL, 13
    INT 21h
    MOV DL, 10
    INT 21h
    
    MOV AH, 09h
    MOV BH, 0
    MOV BL, 0CEh
    MOV CX, 14
    INT 10h
    
    LEA DX, INVALID_MSG
    MOV AH, 09h
    INT 21h
    
    JMP ASK_AGAIN

GO_MENU:
    JMP MAIN_LOOP
    
EXIT_PROG:
    MOV AH, 02h
    MOV DL, 13
    INT 21h
    MOV DL, 10
    INT 21h
    
    LEA DX, THANK_MSG
    MOV AH, 09h
    INT 21h
    
    MOV AH, 4Ch
    INT 21h
MAIN ENDP

GET_CHOICE PROC
    MOV AH, 01h
    INT 21h
    MOV BL, AL          ; Save first character
    
    ; Check if it's 1-9
    CMP AL, '1'
    JB GC_INV
    CMP AL, '9'
    JA GC_INV
    
    ; Check if it's '1' (might be 10, 11, 12)
    CMP AL, '1'
    JNE GC_SINGLE
    
    ; It's '1', peek at next character
    MOV AH, 01h
    INT 21h
    
    ; Check if Enter was pressed (just '1')
    CMP AL, 13          ; Enter key
    JE GC_ONE
    
    CMP AL, '0'
    JE GC_10
    CMP AL, '1'
    JE GC_11
    CMP AL, '2'
    JE GC_12
    
    ; Not 10/11/12 or Enter, invalid
    JMP GC_INV
    
GC_ONE:
    MOV AL, 1           ; Just '1' + Enter = January
    RET
    
GC_SINGLE:
    ; Single digit 2-9
    MOV AL, BL
    SUB AL, '0'
    RET
    
GC_10:
    MOV AL, 10
    RET
    
GC_11:
    MOV AL, 11
    RET
    
GC_12:
    MOV AL, 12
    RET
    
GC_INV:
    MOV AL, 0FFh
    RET
GET_CHOICE ENDP

DISPLAY_CALENDAR PROC
    MOV AH, 06h
    MOV AL, 0
    MOV BH, CURRENT_COLOR
    MOV CH, 10
    MOV CL, 0
    MOV DH, 17
    MOV DL, 27          ; Limit to calendar width (28 columns = 7 days * 4 chars)
    INT 10h
    
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 10
    MOV DL, 0
    INT 10h
    
    CALL PRINT_MONTH
    
    LEA DX, DAY_HEADER
    MOV AH, 09h
    INT 21h
    
    CALL DRAW_GRID
    
    MOV AH, 06h
    MOV AL, 0
    MOV BH, 07h
    MOV CH, 18
    MOV CL, 0
    MOV DH, 24
    MOV DL, 79
    INT 10h
    
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 18
    MOV DL, 0
    INT 10h
    
    RET
DISPLAY_CALENDAR ENDP

PRINT_MONTH PROC
    MOV AL, CHOICE
    CMP AL, 1
    JNE PM2
    LEA DX, JAN_STR
    JMP PM_GO
PM2:
    CMP AL, 2
    JNE PM3
    LEA DX, FEB_STR
    JMP PM_GO
PM3:
    CMP AL, 3
    JNE PM4
    LEA DX, MAR_STR
    JMP PM_GO
PM4:
    CMP AL, 4
    JNE PM5
    LEA DX, APR_STR
    JMP PM_GO
PM5:
    CMP AL, 5
    JNE PM6
    LEA DX, MAY_STR
    JMP PM_GO
PM6:
    CMP AL, 6
    JNE PM7
    LEA DX, JUN_STR
    JMP PM_GO
PM7:
    CMP AL, 7
    JNE PM8
    LEA DX, JUL_STR
    JMP PM_GO
PM8:
    CMP AL, 8
    JNE PM9
    LEA DX, AUG_STR
    JMP PM_GO
PM9:
    CMP AL, 9
    JNE PM10
    LEA DX, SEP_STR
    JMP PM_GO
PM10:
    CMP AL, 10
    JNE PM11
    LEA DX, OCT_STR
    JMP PM_GO
PM11:
    CMP AL, 11
    JNE PM12
    LEA DX, NOV_STR
    JMP PM_GO
PM12:
    LEA DX, DEC_STR
PM_GO:
    MOV AH, 09h
    INT 21h
    RET
PRINT_MONTH ENDP

DRAW_GRID PROC
    MOV CL, START_DAY
    MOV CH, 1
    
    CMP CH, 1
    JNE DG_MAIN
    
    MOV DL, 0
DG_SPC:
    CMP DL, CL
    JGE DG_MAIN
    
    MOV AH, 02h
    PUSH DX
    MOV DL, ' '
    INT 21h
    INT 21h
    INT 21h
    INT 21h
    POP DX
    INC DL
    JMP DG_SPC
    
DG_MAIN:
    MOV AL, CH
    CMP AL, 10
    JL DG_1DIG
    
    MOV AH, 0
    PUSH BX
    MOV BL, 10
    DIV BL
    
    PUSH AX
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    POP AX
    
    MOV AL, AH
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    POP BX
    JMP DG_SPC2
    
DG_1DIG:
    MOV AH, 02h
    MOV DL, ' '
    INT 21h
    
    MOV AL, CH
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    
DG_SPC2:
    MOV AH, 02h
    MOV DL, ' '
    INT 21h
    INT 21h
    
    INC CL
    CMP CL, 7
    JL DG_NONL
    
    MOV AH, 02h
    MOV DL, 13
    INT 21h
    MOV DL, 10
    INT 21h
    MOV CL, 0
    
DG_NONL:
    INC CH
    MOV AL, CH
    CMP AL, DAYS_IN_MONTH
    JBE DG_MAIN
    
    CMP CL, 0
    JE DG_END
    MOV AH, 02h
    MOV DL, 13
    INT 21h
    MOV DL, 10
    INT 21h
    
DG_END:
    RET
DRAW_GRID ENDP

CLEAR_SCREEN PROC
    MOV AH, 00h
    MOV AL, 03h
    INT 10h
    RET
CLEAR_SCREEN ENDP

END MAIN