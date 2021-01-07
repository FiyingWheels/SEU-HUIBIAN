.8086           ;使用8086/8088处理器
.MODEL SMALL    ;内存模型
.DATA
    NUM DW 570
    STRING DB 5 DUP(20H),'$';20H为空格的ASCLL码
.STACK
;定义堆栈段
.CODE
;定义代码段
START:
    MOV AX,@DATA
    MOV DS,AX 
    mov AX,NUM
    CALL SHOW
    MOV AH,7 ;暂停 
    INT 21h 
    MOV AX,4C00H ;退出程序
    INT 21H

SHOW:
    XOR CX,CX
    MOV BX,10
NX1:
    XOR DX,DX
    DIV BX
    OR DX,0E30H
    INC CX
    PUSH DX
    CMP AX,0
    JNZ NX1
NX2:
    POP AX
    INT 10H
LOOP NX2
RET
END START