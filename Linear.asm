.MODEL SMALL
.stack 100H
DATA SEGMENT
    ARRAY DB 15H, 07H, 1AH, 09H, 05H 
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA 
    START:
    MOV AX, DATA
    MOV DS, AX 
    
    MOV SI, 0000h
    MOV CX, 5H
    
  NEXT: 
    MOV AL, ARRAY[SI]
    
    CMP AL,05H
    JE RESULT
    
    ADD SI,2   
    LOOP NEXT 
    
    MOV BL, 00H 
  
    
    MOV AX, 4C00H
    INT 21H 
    
  RESULT:
    MOV BL, 01H  
        
    MOV AX, 4C00H
    INT 21H    
CODE ENDS

END START