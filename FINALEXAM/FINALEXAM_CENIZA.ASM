; FILENAME: FINALEXAM_CENIZA.ASM
; CS243 Lab Hands-on Final Exam
; First Semester SY 2025-2026
; Student Name: KESHA JANE L. CENIZA
; Date Finished: December 12, 2025
; =================================================================

.MODEL SMALL
.STACK 100H

.DATA
    ; --- CONSTANTS ---
    MAX_VOTES       EQU 10
    NAME_LEN        EQU 30
    
    ; --- HEADER STRINGS ---
    LINE1           DB ' Cebu Institute of Technology - University$'
    LINE2           DB ' College of Computer Studies$'
    LINE3           DB ' FAVORITE CLASSMATE VOTING SYSTEM$'
    LINE4           DB ' Programmer: KESHA JANE L. CENIZA$'
    
    ; --- MENU STRINGS ---
    MENU_TITLE      DB ' MAIN MENU$'
    MENU_OPT1       DB ' 1. Vote$'
    MENU_OPT2       DB ' 2. View$'
    MENU_OPT3       DB ' 3. Update$'
    MENU_OPT4       DB ' 4. Delete$'
    MENU_OPT5       DB ' 5. Exit$'
    PROMPT_CHOICE   DB ' Enter choice: $'
    
    ; --- OPERATION TITLES ---
    TITLE_VOTE      DB ' Vote$'
    TITLE_VIEW      DB ' View$'
    TITLE_UPDATE    DB ' Update$'
    TITLE_DELETE    DB ' Delete$'
    
    ; --- PROMPTS ---
    MSG_ENTER_NAME  DB ' Enter candidate name: $'
    MSG_ENTER_RATING DB ' Enter vote rating (0-100): $'
    MSG_ENTER_REC   DB ' Enter record number to update: $'
    MSG_ENTER_DEL   DB ' Enter record number to delete: $'
    MSG_NEW_NAME    DB ' Enter new candidate name: $'
    MSG_NEW_RATING  DB ' Enter new vote rating (0-100): $'
    
    ; --- MESSAGES ---
    MSG_DELETED     DB ' Record deleted.$'
    MSG_NO_RECORD   DB ' No record found.$'
    MSG_PAUSE       DB ' Press any key to go back to Main Menu...$'
    MSG_EXITING     DB ' Exiting...$'
    MSG_THANK       DB ' Thank you for using Favorite Classmate Voting System.$'
    
    NEWLINE         DB 13, 10, '$'
    DASH            DB ' - $'
    DOT_SPACE       DB '. $'
    
    ; --- DATA STORAGE ---
    ; Names: 10 slots * 31 bytes each
    VOTE_NAMES      DB MAX_VOTES * (NAME_LEN + 1) DUP('$')
    
    ; Ratings: 10 slots * 1 byte each (0-100)
    VOTE_RATINGS    DB MAX_VOTES DUP(0)
    
    ; Status: 0=Empty, 1=Occupied
    SLOT_STATUS     DB MAX_VOTES DUP(0)
    
    ; --- INPUT BUFFERS ---
    NAME_BUF        DB NAME_LEN
                    DB ?
                    DB NAME_LEN DUP(?)
    
    RATING_BUF      DB 4
                    DB ?
                    DB 4 DUP(?)
    
    REC_BUF         DB 3
                    DB ?
                    DB 3 DUP(?)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

MENU_LOOP:
    CALL SHOW_MAIN_MENU
    
    ; Read choice
    MOV AH, 01H
    INT 21H
    
    CMP AL, '1'
    JE  OP_VOTE
    CMP AL, '2'
    JE  OP_VIEW
    CMP AL, '3'
    JE  OP_UPDATE
    CMP AL, '4'
    JE  OP_DELETE
    CMP AL, '5'
    JE  OP_EXIT
    JMP MENU_LOOP

OP_VOTE:
    CALL FUNC_VOTE
    JMP MENU_LOOP
    
OP_VIEW:
    CALL FUNC_VIEW
    JMP MENU_LOOP
    
OP_UPDATE:
    CALL FUNC_UPDATE
    JMP MENU_LOOP
    
OP_DELETE:
    CALL FUNC_DELETE
    JMP MENU_LOOP

OP_EXIT:
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
    LEA DX, MSG_EXITING
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    LEA DX, MSG_THANK
    INT 21H
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP

; -----------------------------------------------------------------
; FUNCTION: VOTE (Add candidate with rating)
; -----------------------------------------------------------------
FUNC_VOTE PROC
    CALL CLS_VOTE
    CALL PRINT_HEADER
    
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    LEA DX, TITLE_VOTE
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
    ; Find free slot
    MOV CX, MAX_VOTES
    MOV SI, 0
VOTE_FIND:
    CMP SLOT_STATUS[SI], 0
    JE VOTE_FOUND
    INC SI
    LOOP VOTE_FIND
    JMP VOTE_RET ; Full

VOTE_FOUND:
    ; Get name
    LEA DX, MSG_ENTER_NAME
    MOV AH, 09H
    INT 21H
    
    LEA DX, NAME_BUF
    MOV AH, 0AH
    INT 21H
    
    MOV AL, NAME_BUF+1
    CMP AL, 0
    JE VOTE_RET
    
    ; Copy name
    MOV AX, SI
    MOV CL, NAME_LEN + 1
    MUL CL
    MOV DI, AX
    
    LEA BX, NAME_BUF+2
    MOV CL, NAME_BUF+1
    MOV CH, 0
VOTE_COPY:
    MOV AL, [BX]
    MOV VOTE_NAMES[DI], AL
    INC BX
    INC DI
    LOOP VOTE_COPY
    MOV VOTE_NAMES[DI], '$'
    
    ; Get rating
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    LEA DX, MSG_ENTER_RATING
    INT 21H
    
    LEA DX, RATING_BUF
    MOV AH, 0AH
    INT 21H
    
    CALL PARSE_RATING
    MOV VOTE_RATINGS[SI], AL
    
    MOV SLOT_STATUS[SI], 1
    
VOTE_RET:
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    LEA DX, MSG_PAUSE
    INT 21H
    MOV AH, 07H
    INT 21H
    RET
FUNC_VOTE ENDP

; -----------------------------------------------------------------
; FUNCTION: VIEW (Display all records)
; -----------------------------------------------------------------
FUNC_VIEW PROC
    CALL CLS_VIEW
    CALL PRINT_HEADER
    
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    LEA DX, TITLE_VIEW
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
    MOV CX, MAX_VOTES
    MOV SI, 0
    MOV BP, 1 ; Display counter (sequential numbering)
    
VIEW_LOOP:
    CMP SLOT_STATUS[SI], 0
    JE VIEW_SKIP
    
    ; Print number
    MOV AX, BP
    CALL PRINT_NUMBER
    
    LEA DX, DOT_SPACE
    MOV AH, 09H
    INT 21H
    
    ; Print name
    MOV AX, SI
    MOV BX, NAME_LEN + 1
    MUL BX
    MOV DI, AX
    LEA DX, VOTE_NAMES[DI]
    MOV AH, 09H
    INT 21H
    
    LEA DX, DASH
    INT 21H
    
    ; Print rating
    MOV AL, VOTE_RATINGS[SI]
    MOV AH, 0
    CALL PRINT_NUMBER
    
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    
    INC BP
    
VIEW_SKIP:
    INC SI
    LOOP VIEW_LOOP
    
    CMP BP, 1
    JNE VIEW_DONE
    
    LEA DX, MSG_NO_RECORD
    MOV AH, 09H
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
VIEW_DONE:
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    LEA DX, MSG_PAUSE
    INT 21H
    MOV AH, 07H
    INT 21H
    RET
FUNC_VIEW ENDP

; -----------------------------------------------------------------
; FUNCTION: UPDATE
; -----------------------------------------------------------------
FUNC_UPDATE PROC
    CALL CLS_UPDATE
    CALL PRINT_HEADER
    
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    LEA DX, TITLE_UPDATE
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
    ; Show current records
    CALL SHOW_RECORDS
    
    ; Get record number
    LEA DX, MSG_ENTER_REC
    MOV AH, 09H
    INT 21H
    
    LEA DX, REC_BUF
    MOV AH, 0AH
    INT 21H
    
    CALL PARSE_RECORD_NUM
    CMP SI, -1
    JE UPD_RET
    
    ; Get new name
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    LEA DX, MSG_NEW_NAME
    INT 21H
    
    LEA DX, NAME_BUF
    MOV AH, 0AH
    INT 21H
    
    MOV AL, NAME_BUF+1
    CMP AL, 0
    JE UPD_RET
    
    ; Copy name
    MOV AX, SI
    MOV CL, NAME_LEN + 1
    MUL CL
    MOV DI, AX
    
    LEA BX, NAME_BUF+2
    MOV CL, NAME_BUF+1
    MOV CH, 0
UPD_COPY:
    MOV AL, [BX]
    MOV VOTE_NAMES[DI], AL
    INC BX
    INC DI
    LOOP UPD_COPY
    MOV VOTE_NAMES[DI], '$'
    
    ; Get new rating
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    LEA DX, MSG_NEW_RATING
    INT 21H
    
    LEA DX, RATING_BUF
    MOV AH, 0AH
    INT 21H
    
    CALL PARSE_RATING
    MOV VOTE_RATINGS[SI], AL
    
UPD_RET:
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    LEA DX, MSG_PAUSE
    INT 21H
    MOV AH, 07H
    INT 21H
    RET
FUNC_UPDATE ENDP

; -----------------------------------------------------------------
; FUNCTION: DELETE
; -----------------------------------------------------------------
FUNC_DELETE PROC
    CALL CLS_DELETE
    CALL PRINT_HEADER
    
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    LEA DX, TITLE_DELETE
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
    ; Show current records
    CALL SHOW_RECORDS
    
    ; Get record number
    LEA DX, MSG_ENTER_DEL
    MOV AH, 09H
    INT 21H
    
    LEA DX, REC_BUF
    MOV AH, 0AH
    INT 21H
    
    CALL PARSE_RECORD_NUM
    CMP SI, -1
    JE DEL_RET
    
    MOV SLOT_STATUS[SI], 0
    
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    LEA DX, MSG_DELETED
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
DEL_RET:
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    LEA DX, MSG_PAUSE
    INT 21H
    MOV AH, 07H
    INT 21H
    RET
FUNC_DELETE ENDP

; -----------------------------------------------------------------
; HELPER: SHOW_RECORDS (for Update/Delete screens)
; -----------------------------------------------------------------
SHOW_RECORDS PROC
    PUSH CX
    PUSH SI
    PUSH BP
    
    MOV CX, MAX_VOTES
    MOV SI, 0
    MOV BP, 1
    
SR_LOOP:
    CMP SLOT_STATUS[SI], 0
    JE SR_SKIP
    
    MOV AX, BP
    CALL PRINT_NUMBER
    
    LEA DX, DOT_SPACE
    MOV AH, 09H
    INT 21H
    
    MOV AX, SI
    MOV BX, NAME_LEN + 1
    MUL BX
    MOV DI, AX
    LEA DX, VOTE_NAMES[DI]
    MOV AH, 09H
    INT 21H
    
    LEA DX, DASH
    INT 21H
    
    MOV AL, VOTE_RATINGS[SI]
    MOV AH, 0
    CALL PRINT_NUMBER
    
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    
    INC BP
    
SR_SKIP:
    INC SI
    LOOP SR_LOOP
    
    POP BP
    POP SI
    POP CX
    RET
SHOW_RECORDS ENDP

; -----------------------------------------------------------------
; HELPER: PARSE_RECORD_NUM
; Returns: SI = slot index or -1 if invalid
; -----------------------------------------------------------------
PARSE_RECORD_NUM PROC
    MOV SI, -1
    
    MOV AL, REC_BUF+1
    CMP AL, 0
    JE PRN_RET
    
    ; Parse number from buffer
    LEA BX, REC_BUF+2
    MOV CL, AL
    MOV CH, 0
    MOV AX, 0
    
PRN_LOOP:
    MOV DL, [BX]
    CMP DL, '0'
    JB PRN_RET
    CMP DL, '9'
    JA PRN_RET
    
    SUB DL, '0'
    MOV DH, 0
    
    PUSH DX
    MOV DX, 10
    MUL DX
    POP DX
    
    ADD AX, DX
    INC BX
    LOOP PRN_LOOP
    
    ; AX now has the display number (1-based)
    ; Convert to 0-based slot considering only occupied slots
    CMP AX, 0
    JE PRN_RET
    
    MOV CX, MAX_VOTES
    MOV SI, 0
    MOV BP, 0
    
PRN_FIND:
    CMP SLOT_STATUS[SI], 1
    JNE PRN_NEXT
    INC BP
    CMP BP, AX
    JE PRN_FOUND
PRN_NEXT:
    INC SI
    LOOP PRN_FIND
    
    MOV SI, -1
    JMP PRN_RET
    
PRN_FOUND:
    ; SI already has correct value
    
PRN_RET:
    RET
PARSE_RECORD_NUM ENDP

; -----------------------------------------------------------------
; HELPER: PARSE_RATING
; Returns: AL = rating (0-100)
; -----------------------------------------------------------------
PARSE_RATING PROC
    MOV AL, RATING_BUF+1
    CMP AL, 0
    JE PR_ZERO
    
    LEA BX, RATING_BUF+2
    MOV CL, AL
    MOV CH, 0
    MOV AX, 0
    
PR_LOOP:
    MOV DL, [BX]
    CMP DL, '0'
    JB PR_ZERO
    CMP DL, '9'
    JA PR_ZERO
    
    SUB DL, '0'
    MOV DH, 0
    
    PUSH DX
    MOV DX, 10
    MUL DX
    POP DX
    
    ADD AX, DX
    INC BX
    LOOP PR_LOOP
    
    CMP AX, 100
    JA PR_ZERO
    RET
    
PR_ZERO:
    MOV AX, 0
    RET
PARSE_RATING ENDP

; -----------------------------------------------------------------
; HELPER: PRINT_NUMBER (prints AX as decimal)
; -----------------------------------------------------------------
PRINT_NUMBER PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV CX, 0
    MOV BX, 10
    
PN_DIV:
    MOV DX, 0
    DIV BX
    PUSH DX
    INC CX
    CMP AX, 0
    JNE PN_DIV
    
PN_PRINT:
    POP DX
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
    LOOP PN_PRINT
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
PRINT_NUMBER ENDP

; -----------------------------------------------------------------
; HELPER: CLS_SCREEN
; BH = color attribute to use
; -----------------------------------------------------------------
CLS_SCREEN PROC
    MOV AX, 0600H
    MOV CX, 0000H
    MOV DX, 184FH
    INT 10H
    
    MOV AH, 02H
    MOV BH, 0
    MOV DX, 0
    INT 10H
    RET
CLS_SCREEN ENDP

; -----------------------------------------------------------------
; HELPER: CLS_MENU (Blue background)
; -----------------------------------------------------------------
CLS_MENU PROC
    MOV BH, 1FH  ; Blue background, White text
    CALL CLS_SCREEN
    RET
CLS_MENU ENDP

; -----------------------------------------------------------------
; HELPER: CLS_VOTE (Yellow background)
; -----------------------------------------------------------------
CLS_VOTE PROC
    MOV BH, 6EH  ; Yellow background, Yellow/Brown text
    CALL CLS_SCREEN
    RET
CLS_VOTE ENDP

; -----------------------------------------------------------------
; HELPER: CLS_VIEW (Red background)
; -----------------------------------------------------------------
CLS_VIEW PROC
    MOV BH, 4FH  ; Red background, White text
    CALL CLS_SCREEN
    RET
CLS_VIEW ENDP

; -----------------------------------------------------------------
; HELPER: CLS_UPDATE (Green background)
; -----------------------------------------------------------------
CLS_UPDATE PROC
    MOV BH, 2FH  ; Green background, White text
    CALL CLS_SCREEN
    RET
CLS_UPDATE ENDP

; -----------------------------------------------------------------
; HELPER: CLS_DELETE (Magenta background)
; -----------------------------------------------------------------
CLS_DELETE PROC
    MOV BH, 5FH  ; Magenta background, White text
    CALL CLS_SCREEN
    RET
CLS_DELETE ENDP

; -----------------------------------------------------------------
; HELPER: PRINT_HEADER
; -----------------------------------------------------------------
PRINT_HEADER PROC
    LEA DX, LINE1
    MOV AH, 09H
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
    LEA DX, LINE2
    MOV AH, 09H
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
    LEA DX, LINE3
    MOV AH, 09H
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
    LEA DX, LINE4
    MOV AH, 09H
    INT 21H
    RET
PRINT_HEADER ENDP

; -----------------------------------------------------------------
; HELPER: SHOW_MAIN_MENU
; -----------------------------------------------------------------
SHOW_MAIN_MENU PROC
    CALL CLS_MENU
    CALL PRINT_HEADER
    
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    LEA DX, MENU_TITLE
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
    LEA DX, MENU_OPT1
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
    LEA DX, MENU_OPT2
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
    LEA DX, MENU_OPT3
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
    LEA DX, MENU_OPT4
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
    LEA DX, MENU_OPT5
    INT 21H
    LEA DX, NEWLINE
    INT 21H
    
    LEA DX, PROMPT_CHOICE
    INT 21H
    RET
SHOW_MAIN_MENU ENDP

END MAIN