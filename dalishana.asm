		LDR		R0, 0X00 	;0X3000 	Pirmā bitu daļa (LSB)
		LDR		R1, 0X01 	;0X3101 	Otrā bitu daļa (MSB)
		LDR		R2, 0X04	;0X3204		Dalītāja četri biti #1
		LDR 	R3, 0X05	;0X3305 	Dalītāja četri biti #2
		LDI		R4			;0X2400		Ielādē datus
		LDI		R5			;0X2500		Ielādē datus
		LDI		R6			;0X2600		Ielādē datus
		OR		R2			;0X2090		Pārbauda ar sevi, vai vienāds ar nulli
		OR		R3			;0X3090		Pārbauda ar sevi, vai vienāds ar nulli
		BREQ	NULLE		;0X6518 	Ja dalītājs 0, ejam uz beigām.
LOOP	CMP		R0, R2		;0X1250 	Pārbauda, vai dalītājs nav lielāks par dalāmo
		CPC		R1, R3		;0X1163 	Tas pats ar carry
		BRCS	SAVE		;0X6413		Ja dalītājs ir lielāks, saglabājam līdzšinējo rezultātu
		SUB		R0, R2		;0X0052 	No dalāmā atņem dalītāju
		SBC		R1, R3		;0X0163		No dalāmā atņem dalītāju no carry
		INC		R4			;0X0420		Palielina R4 vērtību
		ADC		R5, R6		;0X0516		Palielina R5 vērtību, ja ir carry
		JMP		LOOP		;0X500B		Ejam uz dalīšanas cikla sākumu
SAVE	STR		R4, 0X08	;0X4408 	Saglabā RAM info no R4, kā minēts uzdevumā - no 08
		STR		R5, 0X09	;0X4509 	Un no R5
		STR		R0, 0X0C	;0X400C 	Un no R0
		STR		R1, 0X0D	;0X410D 	Un no R1
END		JMP		END			;0X5018		Beigas
NULLE	LDI		R4, 0X00	;0X2400	
		LDI		R5, 0X00	;0X2500	
		LDI		R0,	0X00	;0X2000	
		LDI		R1, 0X00	;0X2100	
		STR		R4	0X08	;0X4408	
		STR		R5	0X09	;0X4509	
		STR		R0	0X0C	;0X400C	
		STR		R1	0X0D	;0X410D	
		JMP		END			;0X5021

		
		