.MODEL SMALL
.386
.STACK 100H
.DATA
  ARRAY DB 10H, 17H, 09H, 05H ,1AH
.CODE
  MAIN PROC FAR
  MOV AX,@DATA
  MOV DS,AX

  MOV SI,0000H
  MOV CX,05H
  
  SEARCH:
    MOV AL,ARRAY[SI]
    CMP AL,05H
    JE RESULT
    ADD SI ,2
    LOOP SEARCH
    
    MOV BL,00H
    
    MOV DL, BL
    MOV AH, 06H
    INT 21H 
    MOV AH, 4CH
    INT 21H
  
  RESULT:
    MOV BL,01H
    MOV DL, BL
    MOV AH, 06H
    INT 21H 
    MOV AH, 4CH
    INT 21H
  
  MAIN ENDP
END MAIN