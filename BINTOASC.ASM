.MODEL SMALL
.386
.STACK 100H

.DATA
  
.CODE
    MAIN PROC FAR
        ; Setting the value of the DS reigster 
        MOV AX, @DATA   ; Getting the value
        MOV DS, AX      ; Setting the value of DS
        ;assuming the input is 01100001
        ;explanation
        ; actually binary me 0 aur 1 hi ha aur hme uska pta chl sakhta sirf last bit dekh 
        ;kar so we tooK input into al ,then rotate bl by 1 to make space for next bit then 
        ;add al to it this way by adding 1 or 0 to the end of bl we will get our full 8 ;
        ;bit number
        MOV CX, 0008H
        INPUT:
            ; To input value
            MOV AH, 01H
            INT 21H
            ;al - 
            ; Value is in ASCII (31 for 1, 30 for 0)
            SUB AL,30H 
            SHL BL,01H
            ;bl 
            ADD BL, AL   

            LOOP INPUT
        ; Printing newline character

        MOV DL, 0AH
        MOV AH, 06H
        INT 21H
      

        MOV AH, 02H
        MOV DL, BL
        INT 21H
        
        MOV AH, 4CH
        INT 21H
            
    MAIN ENDP
END 
