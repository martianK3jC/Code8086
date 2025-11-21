;=====================================================================
; FILENAME: PREFINAL_CENIZA.ASM
; PROGRAMMER NAME: KESHA JANE L. CENIZA
; DATE: NOVEMBER 21, 2025
; DESCRIPTION: CIT-U Air Condition Unit Control System
;=====================================================================

.MODEL SMALL
.STACK 100h

.DATA
    ; Title and header strings
    title1      DB ' CIT-U AIR CONDITION UNIT', 13, 10, '$'
    programmer  DB ' Programmer: KESHA JANE L. CENIZA', 13, 10, '$'
    welcome     DB ' WELCOME!', 13, 10, '$'
    menuHeader  DB ' MAIN MENU STATUS', 13, 10, '$'
    
    ; Menu options with spacing for alignment
    menu1       DB ' 1 Power: $'
    menu2       DB '     4 Eco Mode: $'
    menu3       DB '     7 Turbo: $'
    menu4       DB '      0 Exit$'
    menu5       DB ' 2 Swing: $'
    menu6       DB '     5 Fan: $'
    menu7       DB '          8 Timer: $'
    menu8       DB ' 3 Quiet: $'
    menu9       DB '     6 Cool: $'
    menu10      DB '         9 Sleep: $'
    
    ; Status strings
    statusOn    DB 'On $'
    statusOff   DB 'Off$'
    
    ; Input prompt and error
    prompt      DB ' Enter choice: $'
    errorMsg    DB ' INPUT ERROR!', 13, 10, '$'
    acOffMsg    DB ' AIRCON IS STILL OFF!', 13, 10, '$'
    exitMsg     DB ' Thank you. Be cool always!', 13, 10,13, 10, '$'
    
    ; Feature status variables (0 = Off, 1 = On)
    powerStatus    DB 0
    swingStatus    DB 0
    quietStatus    DB 0
    ecoStatus      DB 0
    fanStatus      DB 0
    coolStatus     DB 0
    turboStatus    DB 0
    timerStatus    DB 0
    sleepStatus    DB 0
    
    ; Input buffer
    userInput   DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Set initial color and clear screen
    CALL SET_CYAN_YELLOW_SCREEN
    
MAIN_LOOP:
    ; Display the menu
    CALL DISPLAY_MENU
    
    ; Get user input
    CALL GET_INPUT
    
    ; Process input
    CMP AL, '0'
    JNE CHECK_1
    JMP EXIT_PROGRAM
    
CHECK_1:
    CMP AL, '1'
    JNE CHECK_2
    JMP TOGGLE_POWER
    
CHECK_2:
    CMP AL, '2'
    JNE CHECK_3
    JMP TOGGLE_SWING
    
CHECK_3:
    CMP AL, '3'
    JNE CHECK_4
    JMP TOGGLE_QUIET
    
CHECK_4:
    CMP AL, '4'
    JNE CHECK_5
    JMP TOGGLE_ECO
    
CHECK_5:
    CMP AL, '5'
    JNE CHECK_6
    JMP TOGGLE_FAN
    
CHECK_6:
    CMP AL, '6'
    JNE CHECK_7
    JMP TOGGLE_COOL
    
CHECK_7:
    CMP AL, '7'
    JNE CHECK_8
    JMP TOGGLE_TURBO
    
CHECK_8:
    CMP AL, '8'
    JNE CHECK_9
    JMP TOGGLE_TIMER
    
CHECK_9:
    CMP AL, '9'
    JNE INVALID_INPUT
    JMP TOGGLE_SLEEP
    
INVALID_INPUT:
    JMP SHOW_ERROR

TOGGLE_POWER:
    ; Power can always be toggled
    XOR powerStatus, 1
    
    ; If power is turned off, turn off all other features
    CMP powerStatus, 0
    JNE POWER_DONE
    
    ; Turn off all features
    MOV swingStatus, 0
    MOV quietStatus, 0
    MOV ecoStatus, 0
    MOV fanStatus, 0
    MOV coolStatus, 0
    MOV turboStatus, 0
    MOV timerStatus, 0
    MOV sleepStatus, 0
    
POWER_DONE:
    CALL CLEAR_SCREEN
    JMP MAIN_LOOP

TOGGLE_SWING:
    ; Check if power is on first
    CMP powerStatus, 0
    JNE SWING_ON
    JMP SHOW_AC_OFF
SWING_ON:
    XOR swingStatus, 1
    CALL CLEAR_SCREEN
    JMP MAIN_LOOP

TOGGLE_QUIET:
    ; Check if power is on first
    CMP powerStatus, 0
    JNE QUIET_ON
    JMP SHOW_AC_OFF
QUIET_ON:
    XOR quietStatus, 1
    CALL CLEAR_SCREEN
    JMP MAIN_LOOP

TOGGLE_ECO:
    ; Check if power is on first
    CMP powerStatus, 0
    JNE ECO_ON
    JMP SHOW_AC_OFF
ECO_ON:
    XOR ecoStatus, 1
    CALL CLEAR_SCREEN
    JMP MAIN_LOOP

TOGGLE_FAN:
    ; Check if power is on first
    CMP powerStatus, 0
    JNE FAN_ON
    JMP SHOW_AC_OFF
FAN_ON:
    XOR fanStatus, 1
    CALL CLEAR_SCREEN
    JMP MAIN_LOOP

TOGGLE_COOL:
    ; Check if power is on first
    CMP powerStatus, 0
    JNE COOL_ON
    JMP SHOW_AC_OFF
COOL_ON:
    XOR coolStatus, 1
    CALL CLEAR_SCREEN
    JMP MAIN_LOOP

TOGGLE_TURBO:
    ; Check if power is on first
    CMP powerStatus, 0
    JNE TURBO_ON
    JMP SHOW_AC_OFF
TURBO_ON:
    XOR turboStatus, 1
    CALL CLEAR_SCREEN
    JMP MAIN_LOOP

TOGGLE_TIMER:
    ; Check if power is on first
    CMP powerStatus, 0
    JNE TIMER_ON
    JMP SHOW_AC_OFF
TIMER_ON:
    XOR timerStatus, 1
    CALL CLEAR_SCREEN
    JMP MAIN_LOOP

TOGGLE_SLEEP:
    ; Check if power is on first
    CMP powerStatus, 0
    JNE SLEEP_ON
    JMP SHOW_AC_OFF
SLEEP_ON:
    XOR sleepStatus, 1
    CALL CLEAR_SCREEN
    JMP MAIN_LOOP

SHOW_AC_OFF:
    ; Display AIRCON IS STILL OFF message with blinking in red
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 12
    MOV DL, 5
    INT 10h
    
    ; Blink the message in bright red
    MOV CX, 5              ; Blink 5 times
    
BLINK_AC_OFF:
    PUSH CX
    
    ; Set red color for error
    MOV AH, 09h
    MOV BL, 1Ch            ; Blue bg + Bright red text
    MOV CX, 21             ; Length of message
    INT 10h
    
    ; Display message
    MOV AH, 09h
    LEA DX, acOffMsg
    INT 21h
    
    ; Delay
    CALL DELAY
    
    ; Clear message line
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 12
    MOV DL, 5
    INT 10h
    
    MOV BH, 30
CLEAR_AC_OFF:
    MOV AH, 02h
    MOV DL, ' '
    INT 21h
    DEC BH
    JNZ CLEAR_AC_OFF
    
    ; Reposition cursor
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 12
    MOV DL, 5
    INT 10h
    
    ; Delay
    CALL DELAY
    
    POP CX
    LOOP BLINK_AC_OFF
    
    ; Display message one final time in red
    MOV AH, 09h
    MOV BL, 1Ch            ; Blue bg + Bright red text
    MOV CX, 21
    INT 10h
    
    MOV AH, 09h
    LEA DX, acOffMsg
    INT 21h
    
    ; Wait for Enter key
    MOV AH, 01h
    INT 21h
    
    ; Clear screen and return to menu
    CALL CLEAR_SCREEN
    JMP MAIN_LOOP

SHOW_ERROR:
    ; Display INPUT ERROR message in bright red with blinking
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 12
    MOV DL, 5
    INT 10h
    
    ; Display blinking error message
    CALL DISPLAY_ERROR
    
    ; Wait for Enter key
    MOV AH, 01h
    INT 21h
    
    ; Clear screen and return to menu
    CALL CLEAR_SCREEN
    JMP MAIN_LOOP

EXIT_PROGRAM:
    ; Move to next line before displaying exit message
    MOV AH, 02h
    MOV DL, 0Dh            ; Carriage return
    INT 21h
    MOV DL, 0Ah            ; Line feed
    INT 21h
    
    ; Position cursor for exit message
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 12
    MOV DL, 5
    INT 10h
    
    ; Set bright green color for exit message
    MOV AH, 09h
    MOV BL, 1Ah            ; Blue bg + Light green text
    MOV CX, 27             ; Length of message
    INT 10h
    
    MOV AH, 09h
    LEA DX, exitMsg
    INT 21h
    
    ; Return to DOS
    MOV AH, 4Ch
    INT 21h

MAIN ENDP

;=====================================================================
; PROCEDURE: SET_CYAN_YELLOW_SCREEN
; Sets screen to black borders with cyan background content area
;=====================================================================
SET_CYAN_YELLOW_SCREEN PROC
    ; First, set entire screen to black
    MOV AH, 06h
    MOV AL, 0
    MOV BH, 00h
    MOV CH, 0
    MOV CL, 0
    MOV DH, 24
    MOV DL, 79
    INT 10h
    
    ; Then set content area to blue background with white text
    MOV AH, 06h
    MOV AL, 0
    MOV BH, 1Fh            ; Blue background (1) + White text (F)
    MOV CH, 1              ; Top row
    MOV CL, 5              ; Left column
    MOV DH, 20             ; Bottom row
    MOV DL, 70             ; Right column
    INT 10h
    
    ; Set cursor position
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 1
    MOV DL, 5
    INT 10h
    
    RET
SET_CYAN_YELLOW_SCREEN ENDP

;=====================================================================
; PROCEDURE: CLEAR_SCREEN
; Clears screen and resets colors
;=====================================================================
CLEAR_SCREEN PROC
    MOV AH, 00h
    MOV AL, 03h
    INT 10h
    
    CALL SET_CYAN_YELLOW_SCREEN
    RET
CLEAR_SCREEN ENDP

;=====================================================================
; PROCEDURE: DISPLAY_MENU
; Displays the complete menu with all status information
;=====================================================================
DISPLAY_MENU PROC
    ; Display title with yellow color
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 2
    MOV DL, 5
    INT 10h
    
    ; Set text color to bright yellow
    MOV AH, 09h
    MOV BL, 1Eh            ; Blue bg + Yellow text
    MOV CX, 24             ; Length of title
    INT 10h
    
    MOV AH, 09h
    LEA DX, title1
    INT 21h
    
    ; Display programmer name with cyan color
    MOV AH, 02h
    MOV DH, 3
    MOV DL, 5
    INT 10h
    
    MOV AH, 09h
    MOV BL, 1Bh            ; Blue bg + Cyan text
    MOV CX, 33             ; Length
    INT 10h
    
    MOV AH, 09h
    LEA DX, programmer
    INT 21h
    
    ; Display welcome with bright white
    MOV AH, 02h
    MOV DH, 4
    MOV DL, 5
    INT 10h
    
    MOV AH, 09h
    MOV BL, 1Fh            ; Blue bg + Bright white
    MOV CX, 8              ; Length
    INT 10h
    
    MOV AH, 09h
    LEA DX, welcome
    INT 21h
    
    ; Display menu header with light green
    MOV AH, 02h
    MOV DH, 6
    MOV DL, 5
    INT 10h
    
    MOV AH, 09h
    MOV BL, 1Ah            ; Blue bg + Light green
    MOV CX, 17             ; Length
    INT 10h
    
    MOV AH, 09h
    LEA DX, menuHeader
    INT 21h
    
    ; Display menu line 1: Power, Eco Mode, Turbo, Exit
    MOV AH, 02h
    MOV DH, 7
    MOV DL, 5
    INT 10h
    
    MOV AH, 09h
    LEA DX, menu1
    INT 21h
    
    MOV AL, powerStatus
    CALL PRINT_ON_OFF
    
    MOV AH, 09h
    LEA DX, menu2
    INT 21h
    
    MOV AL, ecoStatus
    CALL PRINT_ON_OFF
    
    MOV AH, 09h
    LEA DX, menu3
    INT 21h
    
    MOV AL, turboStatus
    CALL PRINT_ON_OFF
    
    MOV AH, 09h
    LEA DX, menu4
    INT 21h
    
    ; Display menu line 2: Swing, Fan, Timer
    MOV AH, 02h
    MOV DH, 8
    MOV DL, 5
    INT 10h
    
    MOV AH, 09h
    LEA DX, menu5
    INT 21h
    
    MOV AL, swingStatus
    CALL PRINT_ON_OFF
    
    MOV AH, 09h
    LEA DX, menu6
    INT 21h
    
    MOV AL, fanStatus
    CALL PRINT_ON_OFF
    
    MOV AH, 09h
    LEA DX, menu7
    INT 21h
    
    MOV AL, timerStatus
    CALL PRINT_ON_OFF
    
    ; Display menu line 3: Quiet, Cool, Sleep
    MOV AH, 02h
    MOV DH, 9
    MOV DL, 5
    INT 10h
    
    MOV AH, 09h
    LEA DX, menu8
    INT 21h
    
    MOV AL, quietStatus
    CALL PRINT_ON_OFF
    
    MOV AH, 09h
    LEA DX, menu9
    INT 21h
    
    MOV AL, coolStatus
    CALL PRINT_ON_OFF
    
    MOV AH, 09h
    LEA DX, menu10
    INT 21h
    
    MOV AL, sleepStatus
    CALL PRINT_ON_OFF
    
    ; Display prompt
    MOV AH, 02h
    MOV DH, 11
    MOV DL, 5
    INT 10h
    
    MOV AH, 09h
    LEA DX, prompt
    INT 21h
    
    RET
DISPLAY_MENU ENDP

;=====================================================================
; PROCEDURE: PRINT_ON_OFF
; Prints On or Off based on AL value (0=Off, 1=On)
;=====================================================================
PRINT_ON_OFF PROC
    PUSH AX
    MOV AH, 09h
    CMP AL, 0
    JE PRINT_OFF_STATUS
    
    LEA DX, statusOn
    INT 21h
    POP AX
    RET
    
PRINT_OFF_STATUS:
    LEA DX, statusOff
    INT 21h
    POP AX
    RET
PRINT_ON_OFF ENDP

;=====================================================================
; PROCEDURE: GET_INPUT
; Gets user input and waits for Enter key
;=====================================================================
GET_INPUT PROC
    MOV AH, 01h
    INT 21h
    MOV userInput, AL
    
    ; Check if already Enter
    CMP AL, 0Dh
    JE INPUT_DONE
    
WAIT_ENTER:
    MOV AH, 01h
    INT 21h
    CMP AL, 0Dh
    JNE WAIT_ENTER
    
INPUT_DONE:
    MOV AL, userInput
    RET
GET_INPUT ENDP

;=====================================================================
; PROCEDURE: DISPLAY_ERROR
; Displays blinking INPUT ERROR! message
;=====================================================================
DISPLAY_ERROR PROC
    MOV CX, 5              ; Blink 5 times
    
BLINK_LOOP:
    PUSH CX
    
    ; Set bright red color for error
    MOV AH, 09h
    MOV BL, 1Ch            ; Blue bg + Bright red text
    MOV CX, 13             ; Length of error message
    INT 10h
    
    ; Display error message
    MOV AH, 09h
    LEA DX, errorMsg
    INT 21h
    
    ; Delay
    CALL DELAY
    
    ; Clear error line by repositioning and printing spaces
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 12
    MOV DL, 5
    INT 10h
    
    MOV BH, 25
CLEAR_ERROR:
    MOV AH, 02h
    MOV DL, ' '
    INT 21h
    DEC BH
    JNZ CLEAR_ERROR
    
    ; Reposition cursor for next blink
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 12
    MOV DL, 5
    INT 10h
    
    ; Delay
    CALL DELAY
    
    POP CX
    LOOP BLINK_LOOP
    
    ; Display error one final time in red
    MOV AH, 09h
    MOV BL, 1Ch            ; Blue bg + Bright red text
    MOV CX, 13
    INT 10h
    
    MOV AH, 09h
    LEA DX, errorMsg
    INT 21h
    
    RET
DISPLAY_ERROR ENDP

;=====================================================================
; PROCEDURE: DELAY
; Simple delay procedure
;=====================================================================
DELAY PROC
    PUSH CX
    PUSH DX
    
    MOV CX, 02h
    MOV DX, 0FFFFh
    
DELAY_LOOP:
    DEC DX
    JNZ DELAY_LOOP
    DEC CX
    JNZ DELAY_LOOP
    
    POP DX
    POP CX
    RET
DELAY ENDP

END MAIN