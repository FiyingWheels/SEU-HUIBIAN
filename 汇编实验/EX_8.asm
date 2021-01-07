.8086           ;使用8086/8088处理器
.MODEL SMALL    ;内存模型
.DATA
CR DB 0AH,0DH,'$'
BUF DW 8
    DW ?
    DW 8 DUP(?)
STRING1 DB 'You must input 0-9,or q or Q','$'
.STACK
;定义堆栈段
.CODE
;定义代码段
START:
    MOV AX,@DATA
    MOV DS,AX
 LOOP1:   
    MOV AH,01H
    INT 21H 
    CALL PRO_B
    MOV AH,0   
    CMP AL,39H
    JBE NEXT
    CMP AL,51H
    JE EXIT
   
    ;不满足条件则打印这句话继续输入
    MOV CX,10
    MOV DX,OFFSET STRING1
    MOV AH,09H
    INT 21H
    CALL PRO_B
    LOOP LOOP1

NEXT:SUB AL,30H
    LEA BP,BUF
    MOV DI,0
    CALL PRO_A
    JMP EXIT

;输出回车换行
PRO_B PROC NEAR
    MOV DX,OFFSET CR
    MOV AH,09H
    INT 21H
    RET
PRO_B ENDP  
;将十进制数转化为二进制
PRO_A PROC NEAR
    MOV CX,4
    MOV BX,2
LOOP2:    
      DIV BL
      MOV [DI+BP],AH
      ADD DI,2
      MOV AH,0
      LOOP LOOP2
      ;将高四位填充0E
      MOV CX,4
LOOP3:      
      MOV [BP+DI],0
      ADD DI,2
      LOOP LOOP3
      ;从后往前输出二进制数,将数字转化为字符
      MOV CX,8
      MOV DI,14
LOOP4:      
      MOV DX,[BP+DI] 
      ADD DL,30H
      SUB DI,2
      MOV AH, 02H
      INT 21H
      LOOP LOOP4
      CALL PRO_B
      JMP LOOP1
    RET
PRO_A ENDP
EXIT:
MOV AH,4CH
INT 21H
END START