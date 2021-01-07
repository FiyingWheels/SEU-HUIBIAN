.8086           ;使用8086/8088处理器
.MODEL SMALL    ;内存模型
.DATA
TABLE DW ROUTINE_0
      DW ROUTINE_1
      DW ROUTINE_2
      DW ROUTINE_3
      DW ROUTINE_4
      DW ROUTINE_5
      DW ROUTINE_6

STRING1 DB 'MONDAY','$'
STRING2 DB 'TUESDAY','$'
STRING3 DB 'WEDNESDAY','$'
STRING4 DB 'THURSDAY','$'
STRING5 DB 'FRIDAY','$'
STRING6 DB 'SATURDAY','$'
STRING7 DB 'SUNDAY','$'
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

    MOV BH,AH
    MOV DX,OFFSET CR
    MOV AH,09H
    INT 21H
      
    MOV AH,BH
    SUB AL,30H
    CMP AL,1
    JB EXIT
    CMP AL,7
    JA EXIT
    MOV AH,0
    SHL AL,1
    SUB AX,2                            
    MOV SI,AX
    JMP TABLE[SI]
ROUTINE_0:
    LEA DX,OFFSET STRING1
    JMP RESULT
ROUTINE_1:
    LEA DX,OFFSET STRING2
    JMP RESULT
ROUTINE_2:
    LEA DX,OFFSET STRING3
    JMP RESULT
ROUTINE_3:
    LEA DX,OFFSET STRING4
    JMP RESULT
ROUTINE_4:
    LEA DX,OFFSET STRING5
    JMP RESULT
ROUTINE_5:
    LEA DX,OFFSET STRING6
    JMP RESULT
ROUTINE_6:
    LEA DX,OFFSET STRING7
    JMP RESULT

    
RESULT:
    MOV AH,09H
    INT 21H

EXIT:
    MOV AX,4C00H
    INT 21H


END START