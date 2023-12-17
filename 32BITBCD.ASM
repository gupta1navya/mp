.MODEL SMALL
.386
.STACK 100H
.DATA
    NUM1 DD ?
    NUM2 DD ?
.CODE
    MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX 
        
        ; Inputting the first number 
         MOV EDX,12121212
        MOV EBX, 23232323
        ; One operand is in EDX, another in EBX
        ; Actual addition
        CLC 
        MOV AL, BL
        ADC AL, DL
        DAA 
        MOV CL, AL
        MOV AL, BH
        ADC AL, DH
        DAA 
        MOV CH, AL
        
        JC SET_FLAG
        JMP NO_SET

        SET_FLAG:
            MOV AL, 01H
            JMP ROTATE

        NO_SET:
            MOV AL, 00H

        ROTATE:
        ROL EBX, 10H
        ROL ECX, 10H
        ROL EDX, 10H
        RCR AL, 01H

        MOV AL, BL
        ADC AL, DL
        DAA 
        MOV CL, AL
        MOV AL, BH
        ADC AL, DH
        DAA 
        MOV CH, AL
        
        MOV NUM1, EBX
        MOV NUM2, EDX

         ; Printing newline character
        MOV DL, 0DH
        MOV AH, 06H
        INT 21H
        
        MOV DL, 0AH
        MOV AH, 06H
        INT 21H

        JC SET_ONE
        JMP SET_ZERO
        SET_ONE:
            MOV DL, '1'
            MOV AH, 06H
            INT 21H 
            JMP ROTATE2
        SET_ZERO:
            MOV AL, 00H

        ROTATE2:
        
        ROL ECX, 10H
        MOV EBX, ECX
        
        
        
        PRINTING:
        MOV ECX, 0008H
        LOOP3:
            ROL EBX, 4

            MOV AL, BL
            AND AL, 0FH
            ADD AL, '0'
            MOV DL, AL
            MOV AH, 06H
            INT 21H 
            
            LOOP LOOP3

        MOV AH, 4CH
        INT 21H
    MAIN ENDP
END MAIN

