.8086           ;使用8086/8088处理器
.MODEL SMALL    ;内存模型
.DATA
STRING2 DB 'It is NOT a palindrome','$'
STRING3 DB 'It is  a palindrome','$'
CR DB 0AH,0DH,'$'
STRINGLENMAX DB 50
             DB ?
             DB 50 DUP(?)
;定义一个缓冲区来存放字符 
STRING1 DB 50
        DB ?
        DB 50 DUP(?)
;定义缓冲区存放回文字符
.STACK
;定义堆栈段
.CODE
;定义代码段
START:
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,STRINGLENMAX
    MOV AH,0AH
    INT 21H

    LEA DX,CR ;输出换行
    MOV AH,09H
    INT 21H

    AND BX,0;BX清0
    MOV BL,STRINGLENMAX+1;字符串长度
    LEA SI,STRINGLENMAX+2;字符串开始首地址
    MOV BYTE PTR [SI+BX],'$'

    ;逆向存储输入的字符串
    MOV AX,0
    MOV CX,BX
    MOV BP,0   
    DEC BX
LP: 
    MOV AX,[SI+BX]
    MOV ES:[DI+BP],AX
    INC BP
    DEC BX
    LOOP LP
    MOV BX,0
    MOV BL,STRINGLENMAX+1
    MOV BYTE PTR [DI+BX],'$'
    MOV BP,BX
    DEC BP

    CLD
    MOV CX,BX   
    REPZ CMPSB
    JZ EQUAL

 NOTEQAL:   
    MOV DX,OFFSET STRING2
    MOV AH,09H
    INT 21H
    JMP DONE

EQUAL:
    MOV DX,OFFSET STRING3
    MOV AH,09H
    INT 21H
    JMP DONE
DONE:
     MOV AH,4CH
    INT 21H
    
END START