.MODEL  SMALL
    .DATA
            TABLE   DB      9,8,6,3,5,1
           VAL1    DB      5
            NL      DB     '$'
    .CODE
    MAIN    PROC
         MOV AX,@DATA
            MOV DS,AX
            LEA BX,TABLE
                MOV DL,VAL1
    LBL1:
            LEA BX,TABLE
                      MOV CL,5
    LBL2:
            MOV AL,[BX]
           MOV DL,[BX+1]
          CMP AL,DL
          JB LBL3
          MOV [BX],DL
          MOV [BX+1],AL
    LBL3:
            INC BX
               LOOP LBL2
            MOV DL,VAL1
               DEC DL
            MOV VAL1,DL
              CMP DL,00
              JNE LBL1
                     MOV CL,6
            LEA BX,TABLE
    DISPLAY:
            LEA DX,NL
               MOV AH,09H
            INT 21H
            MOV DL,[BX]
              ADD DL,30H
              MOV AH,02H
            INT 21H
               INC BX
            LOOP DISPLAY
                        MOV AH,4CH
            INT 21H
    MAIN    ENDP
            END     MAIN