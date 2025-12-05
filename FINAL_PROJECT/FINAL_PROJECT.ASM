.MODEL SMALL
.STACK 100H

; =============================================================
; MACROS
; =============================================================

; Macro to print a string
PRINT MACRO msg
    LEA DX, msg
    MOV AH, 09H
    INT 21H
ENDM

; Macro to print a newline
NEWLINE MACRO
    MOV AH, 02H
    MOV DL, 0DH ; Carriage Return
    INT 21H
    MOV DL, 0AH ; Line Feed
    INT 21H
ENDM

; Macro to get string input
GET_STRING MACRO buffer
    LEA DX, buffer
    MOV AH, 0AH
    INT 21H
ENDM

; Macro to clear screen and set blue background
CLEAR_SCREEN MACRO
    MOV AX, 0600H   ; Scroll up function
    MOV BH, 17H     ; Attribute: Blue Background (1), White Text (7)
    MOV CX, 0000H   ; Upper left corner (0,0)
    MOV DX, 184FH   ; Lower right corner (24,79)
    INT 10H
    
    ; Reset cursor to top left
    MOV AH, 02H
    MOV BH, 00H
    MOV DX, 0000H
    INT 10H
ENDM

.DATA
    ; =========================================================
    ; SYSTEM MESSAGES
    ; =========================================================
    app_title       DB '==========================================', 13, 10
                    DB '      ONLINE FOOD ORDERING SYSTEM         ', 13, 10
                    DB '==========================================', 13, 10, '$'
    
    programmer      DB 'Programmer: Kesha Jane L. Ceniza', 13, 10, '$'
    
    ; Menu Messages
    menu_login_title DB '--- LOGIN MENU ---', 13, 10, '$'
    menu_opt1        DB '1. Login', 13, 10, '$'
    menu_opt2        DB '2. Register', 13, 10, '$'
    menu_opt3        DB '3. Exit', 13, 10, '$'
    
    menu_main_title  DB '--- MAIN MENU ---', 13, 10, '$'
    menu_main_1      DB '1. Create New Order', 13, 10, '$'
    menu_main_2      DB '2. View All Orders', 13, 10, '$'
    menu_main_3      DB '3. Update Order', 13, 10, '$'
    menu_main_4      DB '4. Delete Order', 13, 10, '$'
    menu_main_5      DB '5. Logout', 13, 10, '$'
    menu_main_6      DB '6. Exit Program', 13, 10, '$'
    
    prompt_choice    DB 'Enter your choice: $'
    
    ; Auth Prompts
    msg_reg_title    DB '--- REGISTRATION ---', 13, 10, '$'
    msg_login_title  DB '--- LOGIN ---', 13, 10, '$'
    msg_user         DB 'Username: $'
    msg_pass         DB 'Password: $'
    msg_name         DB 'Full Name: $'
    msg_success_reg  DB 'Registration Successful!', 13, 10, '$'
    msg_success_log  DB 'Login Successful! Welcome.', 13, 10, '$'
    msg_fail_log     DB 'Invalid Username or Password.', 13, 10, '$'
    
    ; Create Order Prompts
    msg_create_title DB '--- CREATE NEW ORDER ---', 13, 10, '$'
    msg_food         DB 'Food Name: $'
    msg_qty          DB 'Quantity: $'
    msg_price        DB 'Price: $'
    msg_addr         DB 'Address: $'
    msg_order_succ   DB 'Order Created Successfully!', 13, 10, '$'
    
    ; View Order Prompts
    msg_view_title   DB '--- VIEW ALL ORDERS ---', 13, 10, '$'
    msg_no_orders    DB 'No orders found.', 13, 10, '$'

    ; Delete Order Prompts
    msg_del_title    DB '--- DELETE ORDER ---', 13, 10, '$'
    msg_del_id       DB 'Enter Order ID to Delete: $'
    msg_del_succ     DB 'Order Deleted Successfully!', 13, 10, '$'
    msg_del_err      DB 'Order ID not found!', 13, 10, '$'
    
    ; Table Headers (Basic spacing)
    ; ID(3) Food(15) Qty(5) Price(8) Total(8)
    table_header     DB 'ID   Food Name       Qty   Price   Total', 13, 10
                     DB '----------------------------------------', 13, 10, '$'
    
    spacer           DB '   $' ; Space between columns
    
    msg_wait         DB 13, 10, 'Press any key to continue...', '$'
    msg_error        DB 'Invalid Input! Press any key...', '$'
    msg_full         DB 'Order limit reached (10)!', 13, 10, '$'

    ; =========================================================
    ; USER DATA
    ; =========================================================
    reg_username    DB 21, ?, 21 DUP('$') 
    reg_password    DB 21, ?, 21 DUP('$')
    reg_fullname    DB 31, ?, 31 DUP('$')
    
    login_user_buff DB 21, ?, 21 DUP('$') 
    login_pass_buff DB 21, ?, 21 DUP('$')
    
    ; Temp buffer for general input (Food, Address, etc.)
    input_temp      DB 51, ?, 51 DUP('$') 

    ; =========================================================
    ; ORDER DATA (Parallel Arrays for 10 items)
    ; =========================================================
    MAX_ORDERS      EQU 10
    order_count     DB 0            ; Current number of orders
    
    ; 1. IDs (Numeric 0-255)
    order_ids       DB 10 DUP(0)
    
    ; 2. Food Names (10 items * 30 chars each = 300 bytes)
    order_foods     DB 300 DUP('$') 
    
    ; 3. Quantities (Numeric Byte)
    order_qtys      DB 10 DUP(0)
    
    ; 4. Prices (Numeric Word/2 bytes)
    order_prices    DW 10 DUP(0)
    
    ; 5. Addresses (10 items * 50 chars = 500 bytes)
    order_addresses DB 500 DUP('$')

.CODE
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX      ; FIXED: Initialize Extra Segment for String Operations
    
    CALL SHOW_OPENING

LOGIN_LOOP:
    CALL SHOW_LOGIN_MENU
    
    MOV AH, 01H
    INT 21H
    
    CMP AL, '1'
    JE DO_LOGIN
    CMP AL, '2'
    JE DO_REGISTER
    CMP AL, '3'
    JE EXIT_PROG
    JMP LOGIN_LOOP

DO_LOGIN:
    CALL LOGIN_PROC
    ; Check login status flag in BX
    CMP BX, 1
    JE MAIN_MENU_LOOP
    JMP LOGIN_LOOP

DO_REGISTER:
    CALL REGISTER_PROC
    JMP LOGIN_LOOP

MAIN_MENU_LOOP:
    CALL SHOW_MAIN_MENU
    
    MOV AH, 01H
    INT 21H
    
    CMP AL, '1'
    JE GO_CREATE
    CMP AL, '2'
    JE GO_VIEW
    CMP AL, '3'
    JE GO_UPDATE
    CMP AL, '4'
    JE GO_DELETE
    CMP AL, '5'
    JE DO_LOGOUT
    CMP AL, '6'
    JE EXIT_PROG
    JMP MAIN_MENU_LOOP

GO_CREATE:
    CALL CREATE_ORDER_PROC
    JMP MAIN_MENU_LOOP
GO_VIEW:
    CALL VIEW_ORDERS_PROC
    JMP MAIN_MENU_LOOP
GO_UPDATE:
    ; CALL UPDATE_ORDER_PROC
    JMP MAIN_MENU_LOOP
GO_DELETE:
    CALL DELETE_ORDER_PROC
    JMP MAIN_MENU_LOOP
DO_LOGOUT:
    JMP LOGIN_LOOP

EXIT_PROG:
    MOV AH, 4CH
    INT 21H
MAIN ENDP

; =============================================================
; PROCEDURES
; =============================================================

SHOW_OPENING PROC
    CLEAR_SCREEN
    MOV AH, 02H
    MOV BH, 00H
    MOV DX, 0510H 
    INT 10H
    PRINT app_title
    NEWLINE
    PRINT programmer
    
    ; Added instruction to tell user to press a key
    PRINT msg_wait
    
    MOV AH, 07H
    INT 21H
    RET
SHOW_OPENING ENDP

SHOW_LOGIN_MENU PROC
    CLEAR_SCREEN
    PRINT menu_login_title
    NEWLINE
    PRINT menu_opt1
    PRINT menu_opt2
    PRINT menu_opt3
    NEWLINE
    PRINT prompt_choice
    RET
SHOW_LOGIN_MENU ENDP

SHOW_MAIN_MENU PROC
    CLEAR_SCREEN
    PRINT menu_main_title
    NEWLINE
    PRINT menu_main_1
    PRINT menu_main_2
    PRINT menu_main_3
    PRINT menu_main_4
    PRINT menu_main_5
    PRINT menu_main_6
    NEWLINE
    PRINT prompt_choice
    RET
SHOW_MAIN_MENU ENDP

REGISTER_PROC PROC
    CLEAR_SCREEN
    PRINT msg_reg_title
    NEWLINE
    PRINT msg_user
    GET_STRING reg_username
    NEWLINE
    PRINT msg_pass
    GET_STRING reg_password
    NEWLINE
    PRINT msg_name
    GET_STRING reg_fullname
    NEWLINE
    PRINT msg_success_reg
    PRINT msg_wait
    MOV AH, 07H
    INT 21H
    RET
REGISTER_PROC ENDP

LOGIN_PROC PROC
    CLEAR_SCREEN
    PRINT msg_login_title
    NEWLINE
    PRINT msg_user
    GET_STRING login_user_buff
    NEWLINE
    PRINT msg_pass
    GET_STRING login_pass_buff
    NEWLINE
    
    LEA SI, reg_username
    LEA DI, login_user_buff
    CALL STR_COMPARE
    CMP BX, 0
    JE LOGIN_FAIL
    
    LEA SI, reg_password
    LEA DI, login_pass_buff
    CALL STR_COMPARE
    CMP BX, 0
    JE LOGIN_FAIL
    
    ; Success
    PRINT msg_success_log
    PRINT msg_wait
    MOV AH, 07H
    INT 21H
    MOV BX, 1 ; Success Flag
    RET

LOGIN_FAIL:
    PRINT msg_fail_log
    PRINT msg_wait
    MOV AH, 07H
    INT 21H
    MOV BX, 0 ; Fail Flag
    RET
LOGIN_PROC ENDP

CREATE_ORDER_PROC PROC
    CLEAR_SCREEN
    PRINT msg_create_title
    NEWLINE
    
    ; 1. Check Limit
    MOV AL, order_count
    CMP AL, MAX_ORDERS
    JL PROCEED_CREATE
    JMP LIMIT_REACHED

PROCEED_CREATE:
    
    ; 2. Get Food Name
    PRINT msg_food
    GET_STRING input_temp
    NEWLINE
    ; Copy input_temp to order_foods[order_count]
    ; Calculate offset: order_count * 30
    MOV AL, order_count
    MOV BL, 30
    MUL BL          ; AX = AL * BL
    LEA DI, order_foods
    ADD DI, AX      ; DI points to correct slot
    LEA SI, input_temp
    CALL COPY_TO_STORAGE
    
    ; 3. Get Quantity
    PRINT msg_qty
    GET_STRING input_temp
    NEWLINE
    LEA SI, input_temp
    CALL STR_TO_NUM ; Returns AX
    ; Store AX (Quantity) into order_qtys[order_count]
    LEA DI, order_qtys
    MOV BL, order_count
    MOV BH, 0
    ADD DI, BX
    MOV [DI], AL    ; Store byte
    
    ; 4. Get Price
    PRINT msg_price
    GET_STRING input_temp
    NEWLINE
    LEA SI, input_temp
    CALL STR_TO_NUM ; Returns AX
    ; Store AX (Price) into order_prices[order_count]
    ; Word array, so index * 2
    MOV BL, order_count
    MOV BH, 0
    SHL BX, 1       ; Multiply by 2
    LEA DI, order_prices
    ADD DI, BX
    MOV [DI], AX
    
    ; 5. Get Address
    PRINT msg_addr
    GET_STRING input_temp
    NEWLINE
    ; Calculate offset: order_count * 50
    MOV AL, order_count
    MOV BL, 50
    MUL BL
    LEA DI, order_addresses
    ADD DI, AX
    LEA SI, input_temp
    CALL COPY_TO_STORAGE
    
    ; 6. Increment Count
    INC order_count
    PRINT msg_order_succ
    JMP CREATE_DONE

LIMIT_REACHED:
    PRINT msg_full

CREATE_DONE:
    PRINT msg_wait
    MOV AH, 07H
    INT 21H
    RET
CREATE_ORDER_PROC ENDP

VIEW_ORDERS_PROC PROC
    CLEAR_SCREEN
    PRINT msg_view_title
    NEWLINE
    
    ; Check if empty
    CMP order_count, 0
    JE NO_DATA
    
    PRINT table_header
    
    ; Initialize Loop Counter
    MOV CX, 0 ; Using CX as index
    MOV CL, order_count
    MOV CH, 0
    
    ; Using BX as current index
    MOV BX, 0 
    
VIEW_LOOP:
    PUSH CX ; Save outer loop count
    
    ; 1. Print ID (Index + 1)
    MOV AX, BX
    INC AX
    CALL NUM_TO_STR
    PRINT spacer
    
    ; 2. Print Food Name
    ; Offset = BX * 30
    PUSH BX
    MOV AX, BX
    MOV DX, 30
    MUL DX
    LEA DX, order_foods
    ADD DX, AX
    MOV AH, 09H
    INT 21H
    POP BX
    PRINT spacer
    
    ; 3. Print Quantity
    ; Offset = BX
    LEA SI, order_qtys
    ADD SI, BX
    MOV AL, [SI]
    MOV AH, 0
    PUSH AX         ; Save Qty for Total Calc
    CALL NUM_TO_STR
    PRINT spacer
    
    ; 4. Print Price
    ; Offset = BX * 2
    PUSH BX
    MOV AX, BX
    SHL AX, 1       ; * 2
    LEA SI, order_prices
    ADD SI, AX
    MOV AX, [SI]    ; Load Price
    MOV DX, AX      ; Save Price for Total Calc
    CALL NUM_TO_STR
    PRINT spacer
    POP BX
    
    ; 5. Calculate & Print Total (Price * Qty)
    POP AX          ; Restore Qty (was pushed in step 3)
    ; AX = Qty, DX = Price (Need to be careful, MUL uses AX)
    ; Price is in DX currently. Qty in AX.
    MUL DX          ; AX = AX * DX -> Total = Qty * Price
    CALL NUM_TO_STR
    
    NEWLINE
    
    INC BX
    POP CX          ; Restore outer loop count
    LOOP VIEW_LOOP
    
    JMP VIEW_EXIT

NO_DATA:
    PRINT msg_no_orders

VIEW_EXIT:
    PRINT msg_wait
    MOV AH, 07H
    INT 21H
    RET
VIEW_ORDERS_PROC ENDP

DELETE_ORDER_PROC PROC
    CLEAR_SCREEN
    PRINT msg_del_title
    NEWLINE
    
    ; Check if any orders exist
    CMP order_count, 0
    JNE DEL_CHECK_ID
    JMP DEL_NO_DATA  ; FIXED: Use JMP to reach far label

DEL_CHECK_ID:
    ; Get ID to delete
    PRINT msg_del_id
    GET_STRING input_temp
    NEWLINE
    
    LEA SI, input_temp
    CALL STR_TO_NUM ; AX = ID
    
    ; Validate ID (Must be > 0 and <= order_count)
    CMP AX, 0
    JG DEL_CHECK_UPPER
    JMP DEL_INVALID  ; FIXED: Use JMP to reach far label

DEL_CHECK_UPPER:
    MOV BL, order_count
    MOV BH, 0
    CMP AX, BX
    JLE DEL_START_SHIFT
    JMP DEL_INVALID  ; FIXED: Use JMP to reach far label

DEL_START_SHIFT:
    ; Logic: Shift all items DOWN from Index (ID-1)
    ; Target Index (to delete)
    DEC AX
    MOV BX, AX      ; BX = Index to delete
    
    ; Calculate loop count: order_count - 1 - index
    MOV CL, order_count
    DEC CL
    SUB CL, BL      ; CX = number of items to shift
    
    ; If deleting last item, no need to shift
    CMP CL, 0
    JG SHIFT_LOOP_START
    JMP DEL_DEC_COUNT ; FIXED: Use JMP to reach far label

    MOV CH, 0
    
SHIFT_LOOP_START:
    PUSH CX
    PUSH BX ; Save Current Index
    
    ; Shift Food (30 bytes)
    ; Dest: BX * 30
    ; Src:  (BX+1) * 30
    
    ; Calculate Dest
    MOV AX, BX
    MOV DX, 30
    MUL DX
    LEA DI, order_foods
    ADD DI, AX
    
    ; Calculate Src
    MOV AX, BX
    INC AX
    MOV DX, 30
    MUL DX
    LEA SI, order_foods
    ADD SI, AX
    
    ; Move 30 bytes
    MOV CX, 30
    REP MOVSB
    
    ; Shift Quantity (1 byte)
    POP BX      ; Restore Index
    PUSH BX
    LEA DI, order_qtys
    ADD DI, BX
    MOV AL, [DI+1] ; Get next
    MOV [DI], AL   ; Move to current
    
    ; Shift Price (2 bytes)
    LEA DI, order_prices
    SHL BX, 1   ; Index * 2
    ADD DI, BX
    MOV AX, [DI+2] ; Get next word
    MOV [DI], AX   ; Move to current
    
    ; Shift Address (50 bytes)
    POP BX      ; Restore Index
    PUSH BX
    
    ; Dest: BX * 50
    MOV AX, BX
    MOV DX, 50
    MUL DX
    LEA DI, order_addresses
    ADD DI, AX
    
    ; Src: (BX+1) * 50
    MOV AX, BX
    INC AX
    MOV DX, 50
    MUL DX
    LEA SI, order_addresses
    ADD SI, AX
    
    MOV CX, 50
    REP MOVSB
    
    POP BX
    INC BX
    POP CX
    
    ; FIXED: Manual Loop to allow long jumps
    DEC CX
    CMP CX, 0
    JE DEL_DEC_COUNT
    JMP SHIFT_LOOP_START

DEL_DEC_COUNT:
    DEC order_count
    PRINT msg_del_succ
    JMP DEL_EXIT

DEL_NO_DATA:
    PRINT msg_no_orders
    JMP DEL_EXIT
    
DEL_INVALID:
    PRINT msg_del_err

DEL_EXIT:
    PRINT msg_wait
    MOV AH, 07H
    INT 21H
    RET
DELETE_ORDER_PROC ENDP

; --- HELPERS ---

STR_COMPARE PROC
    PUSH CX
    PUSH SI
    PUSH DI
    MOV AL, [SI+1]
    MOV AH, [DI+1]
    CMP AL, AH
    JNE NO_MATCH
    MOV CL, AL
    MOV CH, 0
    ADD SI, 2
    ADD DI, 2
COMPARE_LOOP:
    MOV AL, [SI]
    MOV AH, [DI]
    CMP AL, AH
    JNE NO_MATCH
    INC SI
    INC DI
    LOOP COMPARE_LOOP
MATCH:
    MOV BX, 1
    JMP DONE_CMP
NO_MATCH:
    MOV BX, 0
DONE_CMP:
    POP DI
    POP SI
    POP CX
    RET
STR_COMPARE ENDP

COPY_TO_STORAGE PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH SI
    PUSH DI
    MOV CL, [SI+1] ; Length
    MOV CH, 0
    ADD SI, 2
    CMP CX, 0
    JE COPY_END
COPY_LOOP:
    MOV AL, [SI]
    MOV [DI], AL
    INC SI
    INC DI
    LOOP COPY_LOOP
COPY_END:
    MOV BYTE PTR [DI], '$'
    POP DI
    POP SI
    POP CX
    POP BX
    POP AX
    RET
COPY_TO_STORAGE ENDP

STR_TO_NUM PROC
    PUSH BX
    PUSH CX
    PUSH SI
    MOV CL, [SI+1]
    MOV CH, 0
    ADD SI, 2
    MOV AX, 0
    MOV BX, 10
PARSE_LOOP:
    CMP CX, 0
    JE PARSE_DONE
    MOV DX, 0
    MOV DL, [SI]
    SUB DL, '0'
    PUSH DX
    MUL BX
    POP DX
    ADD AX, DX
    INC SI
    DEC CX
    JMP PARSE_LOOP
PARSE_DONE:
    POP SI
    POP CX
    POP BX
    RET
STR_TO_NUM ENDP

; NUM_TO_STR
; Converts AX to Decimal String and Prints it immediately
NUM_TO_STR PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV CX, 0   ; Counter
    MOV BX, 10
    
DIV_LOOP:
    MOV DX, 0
    DIV BX      ; AX / 10, Remainder in DX
    PUSH DX     ; Save Remainder
    INC CX
    CMP AX, 0
    JNE DIV_LOOP
    
PRINT_LOOP:
    POP DX
    ADD DL, '0' ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP PRINT_LOOP
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
NUM_TO_STR ENDP

END MAIN