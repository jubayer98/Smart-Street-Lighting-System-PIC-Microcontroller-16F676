
 
		list p = PIC16F676
		#include <P16F676.inc>

 CNT1         EQU           0X20
 CNT2         EQU           0X21
 CNT3         EQU           0X22


         
SET_BANK0  		MACRO                               ; bank 0 selection macro routin
				bcf 		STATUS, RP0             ; cleraing STATUS,RP 0 bit (bit wise operation)
				ENDM                                ; end macro routine
SET_BANK1 		MACRO						        ; bank 1 selection macro routin
				bsf			STATUS, RP0             ; set STATUS,RP 0 bit (bit wise operation)
				ENDM                                ; end of macro   


; NEC REMOT LOOP START HEAR 

	        	ORG	       0x00                       ; page 0 bank0 PC(Program Counter)=0x00 locatio and proceed to PC+1          
            	NOP                                   ; 
	        	GOTO	   START                      ; got0 START sub location to execute next event
; NEC REMOT LOOP START HEAR 

 
       

	
START:
            	SET_BANK0                                ; page 0 bank 0 
				CLRF		 PORTA			             ; initialize PORTA
            	CLRF    	 PORTC                       ; initialize PORTB
				MOVLW		 0x07                        ; W= 0x07
				MOVWF		 CMCON		                 ; turn off the comparator for PORTA
	        	SET_BANK1                                ; page 0 bank 1
			    MOVLW	     0x00                        ; W=0x00
                MOVWF        ANSEL
			    MOVWF	     VRCON                       ; DISABLE VOLTAGE CONTROL MODULE  
				MOVLW		 b'000000'	                 ; RA1 = SDA  RA0= SCL 
				MOVWF		 TRISA			             ; set pins for input or output for I2C bas data line 
            	MOVLW   	 b'000001'                 ; set port b upper bit for spi control lower bit for button and a am/pm flag 
            	MOVWF   	 TRISC                       ; the input pin should be pull high to internal weak pull ups is active
	        	SET_BANK0                                ; page 0 bank 0 
                CLRF         PORTA
                CLRF         PORTC

                GOTO         MAIN    

MAIN 
               BTFSS         PORTC,0      ; BIT TEST FILE SKIP IF ZERO
               GOTO          BUZZER
               GOTO          MAIN

BUZZER
              BSF            PORTC,4      ; SET PORTB,4 PIN HIGH   LED
              BSF            PORTC,3      ; BUZZER
              CALL           delay_20ms   
              BCF            PORTC,3
              BTFSC          PORTC,0
              GOTO           MAIN  		
             


                    
; delay routins for basic purpose                          
DELAY1252: 		MOVLW	 .1					; 1
				MOVWF	 CNT1				; 1
REP_1:    		MOVLW	 .5
				MOVWF	 CNT2				; 1
REP_2:	    	MOVLW	 .81
				MOVWF	 CNT3				; 1
REP_3:	    	DECFSZ	 CNT3,F				; 1/2
				GOTO	 REP_3				; 2
				DECFSZ	 CNT2,F				; 1/2
				GOTO	 REP_2				; 2
				DECFSZ	 CNT1,F				; 1/2
				GOTO	 REP_1				; 2
				GOTO	 $+1	
				GOTO	 $+1	
				GOTO	 $+1	
				GOTO	 $+1	
				RETURN						; 2

delay_20ms      
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
  		 		call     DELAY1252 
  		 		call     DELAY1252 
  		 		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
  		 		call     DELAY1252 
  		 		call     DELAY1252 
  		 		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
  		 		call     DELAY1252 
  		 		call     DELAY1252 
  		 		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
  		 		call     DELAY1252 
  		 		call     DELAY1252 
  		 		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
         		call     DELAY1252 
  		 		call     DELAY1252 
  		 		call     DELAY1252 
  		 		call     DELAY1252 

         		return  




end

