	.ORIG X1500
	ST	R0, SAVER0
	ST	R1, SAVER1
	ST	R2, SAVER2
	ST	R7, SAVER7

	LD	R0, LA
LOOP	LDI	R2, DSR
	BRZP	LOOP
	STI	R0, DDR

	LDI	R1, KBDR
	LD	R2, BOUND1
	ADD	R2, R1, R2
	BRN	BAD
	LD	R2, BOUND2
	ADD	R2, R1, R2
	BRP	BAD
	
GOOD	LEA	R0, IS
	LEA	R2, OUTPUT
	JSRR	R2
	LDI	R0, KBDR
LOOP3	LDI	R2, DSR
	BRZP	LOOP3
	STI	R0, DDR
	LEA	R0, IS2
	LEA 	R2, OUTPUT
	JSRR	R2
	LDI	R0, KBDR
	LD	R1, ADDING
	ADD	R0, R0, R1
	LDI	R2, KBDR
LOOP4	LDI	R1, DSR
	BRZP	LOOP4
	STI	R0, DDR
	LD	R0, PERIOD
	LDI	R2, KBDR
LOOP5	LDI	R1, DSR
	BRZP	LOOP5
	STI	R0,DDR
	BR	FINISH

BAD	LDI	R2, DSR
	BRZP	BAD
	STI	R1, DDR
	LEA	R0, NOTT
	LEA	R2, OUTPUT
	JSRR	R2
	BR	FINISH



OUTPUT	LDR	R1, R0, #0
	BRZ	DONE
	LDI	R2, DSR
	BRZP	OUTPUT
	STI	R1, DDR
	ADD	R0, R0, #1
	BR 	OUTPUT
DONE	RET
	



FINISH	LD	R0, LA
LOOP2	LDI	R2, DSR
	BRZP	LOOP2
	STI	R0, DDR	
	LD	R0, SAVER0
	LD	R1, SAVER1
	LD	R2, SAVER2
	LD	R7, SAVER7
	RTI


ADDING	.FILL X0020
PERIOD	.FILL X002E
BOUND1	.FILL X-0041
BOUND2	.FILL X-005A
LA	.FILL X000A
DSR	.FILL XFE04
DDR	.FILL XFE06
KBDR	.FILL XFE02
SAVER0	.BLKW	1
SAVER1	.BLKW	1
SAVER2	.BLKW	1
SAVER7	.BLKW	1
NOTT	.STRINGZ " is not a capital letter in the English alphabet."
IS	.STRINGZ "The lower case character of "
IS2	.STRINGZ " is "
	.END