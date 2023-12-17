.MODEL SMALL
.386
.STACK 100H

.DATA
    ARR_SIZE DB ?
    ARR_ONE DB 9 dup(?)
    ARR_TWO DB 9 dup(?)
    MSG1 DB "Please enter a number between 0 and 9 " , "$"
    MSG2 DB "Please enter a number ", "$"

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        LEA DX, MSG1
        MOV AH, 09H
        INT 21H

        MOV AH, 01H
        INT 21H
        ; Something is in AL
        AND AL, 0FH
        SUB AL, 01H
        LEA BX, ARR_SIZE
        MOV [BX], AL
        
        MOV DL, 0AH
        MOV AH, 06H
        INT 21H 

        MOV DL, 0DH
        MOV AH, 06H
        INT 21H 
        
        LEA SI, ARR_SIZE
        MOV BX, [SI]
        MOV CX, 00H
        LEA DI, ARR_ONE

        LOOPONE:
            LEA DX, MSG2
            MOV AH, 09H
            INT 21H 
            
            MOV AH, 01H
            INT 21H
            AND AL, 0FH
            
            PUSH BX
            MOV BX, CX
            MOV [DI + BX], AL
            POP BX
            
            MOV DL, 0AH
            MOV AH, 06H
            INT 21H 

            MOV DL, 0DH
            MOV AH, 06H
            INT 21H 

            ADD CX, 01H
            CMP CX, BX
            JBE LOOPONE
            JMP EXIT
        
        EXIT:
            MOV AH, 4CH
            INT 21H
    ENDP MAIN
END
MAIN