                 .MODEL SMALL
.STACK 100H
.DATA
STRING DB ?
EXT DB '$'
MSG DB 10,13,'ENTER STRING $' 
.CODE
MAIN PROC

MOV AX,@DATA
MOV DS,AX

LEA DX,MSG
MOV AH,9
INT 21H

LEA SI,STRING

INP:
MOV AH,1
INT 21H
MOV [SI],AL
INC SI

CMP AL,0DH
JNZ INP

MOV [SI],'$'
LEA DX,STRING
MOV AH,9
INT 21H 

MOV AH,4CH
INT 21H 

MAIN ENDP
END MAIN