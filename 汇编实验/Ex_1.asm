.8086           ;使用8086/8088处理器
.MODEL SMALL    ;内存模型
.DATA
;定义数据段
CR DB 0AH,0DH,'$'
.STACK
;定义堆栈段
.CODE
;定义代码段

START:
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,01H
    INT 21H
    
    MOV DX,OFFSET CR
    MOV AH,09H
    INT 21H
    
    MOV DL,AL 
    MOV AH,02H
    INT 21H
     MOV AH,4CH
    INT 21H
END START