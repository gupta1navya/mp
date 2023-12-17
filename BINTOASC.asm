.MODEL SMALL
.386
.STACK 100H

.DATA

.CODE
    MAIN PROC
        ; Setting the value of the DS reigster 
        MOV AX, @DATA   ; Getting the value
        MOV DS, AX      ; Setting the value of DS
        
        MOV CX, 08H
        INPUT:
            ; To input value
            MOV AH, 01H
            INT 21H
            ; Value is in ASCII (31 for 1, 30 for 0)
            AND AL, 0FH
            MOV BL, AL
            PUSH CX 
            MOV CL, 01H
            ROR BX, CL 
            POP CX
            LOOP INPUT
            
        ; Printing newline character
        MOV DL, 0DH
        MOV AH, 06H
        INT 21H

        MOV DL, 0AH
        MOV AH, 06H
        INT 21H
        ; Value is in BH
        MOV BL, 00H
        MOV CL, 08H
        
        REVERSE:
            SHR BH, 01H;
            RCL BL, 01H
            LOOP REVERSE

        MOV AH, 02H
        MOV DL, BL
        INT 21H
        
        MOV AH, 4CH
        INT 21H
            
    MAIN ENDP
END MAIN