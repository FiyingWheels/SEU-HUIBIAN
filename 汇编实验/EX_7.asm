.8086           ;使用8086/8088处理器
.MODEL SMALL    ;内存模型
.DATA
       BUFF DB 0, 2, 4, 6, 8
       CR DB 0AH, 0DH, '$'
       STRING1 DB 'FIND IT!', 0AH, 0DH, '$'
       STRING2 DB 'DO NOT FIND IT', 0AH, 0DH, '$' 

.STACK
;定义堆栈段
.CODE
START:
       MOV AX, @DATA
       MOV DS, AX

       MOV AH, 01H;输入字符
       INT 21H

       MOV DX, OFFSET CR;换行
       MOV AH, 09H
       INT 21H

       SUB AL, 30H;ascll码转换
       MOV AH, 0
       LEA SI, BUFF
       MOV CX, 5

LOOP1:
       MOV BL, [SI]
       MOV BH, 0
       CMP AX, BX
       JE DONE;找到则进入删除程序
       INC SI
       LOOP LOOP1
       JMP EXIT

DONE:
       MOV DI, SI
       INC SI
       MOV AL, [SI]
       MOV AH, 0
       MOV [DI], AX
       LOOP DONE
       MOV [SI], 20H;末尾增加空格

       MOV DX, OFFSET STRING1
       MOV AH, 09H
       INT 21H

       LEA SI, BUFF
       MOV CX, 4  

PRINT:

       MOV DL, [SI]
       MOV DH, 0
       ADD DL, 30H
       INC SI
       MOV AH, 02H
       INT 21H
       LOOP PRINT

       MOV DX, OFFSET CR
       MOV AH, 09H
       INT 21H

       JMP FINAL
       
EXIT:
       MOV DX, OFFSET STRING2
       MOV AH, 09H
       INT 21H

       JMP FINAL 

FINAL:
       
       MOV AH, 4CH
       INT 21H          

END START