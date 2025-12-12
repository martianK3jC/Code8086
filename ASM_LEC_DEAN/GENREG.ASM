;==========================================================
; FILENAME: GENREG.ASM
; COMPATIBILITY: TASM / MASM
; DESCRIPTION: General Register-based Architecture
;              Uses multiple registers for operations
;==========================================================

.MODEL SMALL
.STACK 100H
.DATA
    msg_i    DB 13,10,'Enter i: $'
    msg_n    DB 13,10,'Enter n: $'
    msg_prod DB 13,10,'Enter prod: $'
    msg_res  DB 13,10,13,10,'Result: $'
    var_i    DW ?
    var_n    DW ?
    var_prod DW ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA DX,msg_i
    MOV AH,09H
    INT 21H
    CALL GET_NUM
    MOV var_i,AX

    LEA DX,msg_n
    MOV AH,09H
    INT 21H
    CALL GET_NUM
    MOV var_n,AX

    LEA DX,msg_prod
    MOV AH,09H
    INT 21H
    CALL GET_NUM
    MOV var_prod,AX

    MOV AX,var_prod
    MOV CX,var_i
    MOV BX,var_n

REG_LOOP:
    CMP CX,BX
    JG LOOP_DONE
    MUL CX
    INC CX
    JMP REG_LOOP

LOOP_DONE:
    MOV var_prod,AX

    LEA DX,msg_res
    MOV AH,09H
    INT 21H
    
    MOV AX,var_prod
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