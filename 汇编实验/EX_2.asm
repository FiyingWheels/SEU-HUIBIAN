.8086           ;使用8086/8088处理器
.MODEL SMALL    ;内存模型
.DATA
    TABLE DB 0D,1D,4D,9D,16D,25D,36D,49D,64D,81D
    NUM DB 5
    NUM2 DB ?
.STACK
;定义堆栈段
.CODE
;定义代码段
START:
    MOV AX, @DATA
    MOV DS,AX
    LEA BX,TABLE
    MOV AL,NUM
    XLAT TABLE
    MOV NUM2,AL
    MOV AH,4CH
    INT 21H
END START