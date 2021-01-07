.8086           ;使用8086/8088处理器
.MODEL SMALL    ;内存模型
.DATA
    NUM1 DB 0100B
    NUM2 DB 0011B
    NUM3 DB 1000B
    NUM4 DB 0110B
    NUM5 DB ?
    NUM6 DB ?
.STACK
;定义堆栈段
.CODE
;定义代码段
START:
    MOV AX,@DATA
    MOV DS,AX
    MOV BL,NUM4 ;将num4放入最低位BL
    MOV BH,NUM3 ;将num3放入次高位BH
    MOV CL,NUM2 ;将num2放入第三高位CL
    MOV CH,NUM1 ;将num1放入最高CH
    MOV DX,0
    MOV DL,BL
    MOV DI,DX

    MOV AX,1010B
    MUL BH
    ADD AX,DI
    MOV DI,AX

    MOV AX,1100100B
    MUL CL
    ADD AX,DI
    MOV DI,AX
     
    MOV AX,1111101000B
    MOV DX,0
    MOV DL,CH
    MOV CX,DX
    MUL CX
    ADD AX,DI
    MOV DI,AX
END START