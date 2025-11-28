;==========================================================
; FILENAME: STACK.ASM
; COMPATIBILITY: TASM / MASM
; DESCRIPTION: Stack Machine Architecture
;              Conditional operation using stack
;==========================================================

.MODEL SMALL
.STACK 100H
.DATA
    msg_x   DB 13,10,'Enter X: $'
    msg_y   DB 13,10,'Enter Y: $'
    msg_res DB 13,10,13,10,'Result: $'
    var_x   DW ?
    var_y   DW ?
    res     DW ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA DX,msg_x
    MOV AH,09H
    INT 21H
    CALL GET_NUM
    MOV var_x,AX

    LEA DX,msg_y
    MOV AH,09H
    INT 21H
    CALL GET_NUM
    MOV var_y,AX

    PUSH var_x
    PUSH var_y
    POP BX
    POP AX
    CMP AX,BX
    JLE DO_ELSE

    PUSH var_x
    PUSH var_y
    POP BX
    POP AX
    SUB AX,BX
    PUSH AX
    JMP SAVE_DONE

DO_ELSE:
    PUSH var_x
    PUSH var_y
    POP BX
    POP AX
    ADD AX,BX
    PUSH AX

SAVE_DONE:
    POP res

    LEA DX,msg_res
    MOV AH,09H
    INT 21H

    MOV AX,res
    CALL SHOW_NUM

    MOV AH,4CH
    INT 21H
MAIN ENDP

GET_NUM PROC
    PUSH BX
    PUSH CX
    PUSH DX
    XOR BX,BX
READ_CHAR:
    MOV AH,01H
    INT 21H
    CMP AL,13
    JE DONE_READ
    SUB AL,30H
    MOV AH,0
    MOV CX,AX
    MOV AX,BX
    MOV DX,10
    MUL DX
    ADD AX,CX
    MOV BX,AX
    JMP READ_CHAR
DONE_READ:
    MOV AX,BX
    POP DX
    POP CX
    POP BX
    RET
GET_NUM ENDP

SHOW_NUM PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    MOV CX,0
    MOV BX,10
DIVIDE_LOOP:
    XOR DX,DX
    DIV BX
    PUSH DX
    INC CX
    CMP AX,0
    JNE DIVIDE_LOOP
PRINT_LOOP:
    POP DX
    ADD DL,30H
    MOV AH,02H
    INT 21H
    LOOP PRINT_LOOP
    POP DX
    POP CX
    POP BX
    POP AX
    RET
SHOW_NUM ENDP

END MAIN