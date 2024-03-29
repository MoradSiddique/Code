.MODEL SMALL

.DATA ; DATA SEGMENT STARTS
NUM1 DB 19H ; INITIALIZE NUM1 TO 0019
SQRT DB 01 DUP (?) ; RESERVE 1 WORD OF UNINITIALISED DATA SPACE TO OFFSET SQRT

.CODE ; CODE SEGMENT STARTS
.STARTUP
MOV AL,NUM1 ;MOVE THE NUMBER(NUM1) TO AL
XOR BL,BL ;XOR IS PERFORMED AND RESULT IS STORED IN BL
MOV BL,01H ;INITIALIZE BL TO 01H
MOV CL,01H ;INITIALIZE CL TO 01H
LOOP1: SUB AL,BL ;AL=AL-BL
JZ LOOP2 ; IF ZERO FLAG IS ZERO JUMP TO LOOP2
INC CL ; INCREMENT CL BY 1
ADD BL,02H ;BL=BL+02H
JMP LOOP1 ; JUMP TO LOOP1

LOOP2: MOV SQRT,CL ; STORE RESULT
MOV DL,CL
ADD DL,30H
CMP DL,'9'
JBE L1
ADD DL,7H
L1:
MOV AH,02H
INT 21H
MOV AH,4CH
INT 21H
END