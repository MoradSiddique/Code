DATA SEGMENT
NUM1 DW 1500
NUM2 DW 2500
HCF DW ?
DATA ENDS
CODE SEGMENT
ASSUME DS:DATA CS:CODE
START:
    MOV AX,DATA
    MOV DS,AX
    MOV AX,NUM1
    MOV BX,NUM2
WHILE:MOV DX,0
    MOV CX,BX
    DIV BX
    MOV BX,DX
    MOV AX,CX
    CMP BX,0
    JNE WHILE
    MOV HCF,AX
    MOV AH,4CH
    INT 21H
CODE ENDS
END START