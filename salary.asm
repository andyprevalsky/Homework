
;Grading details for lab 4:

;The lab is worth 100 points total. 

;The test cases for lab 4 have been posted to the website:
;http://users.ece.utexas.edu/~patt/17f.306/LabAssignments/Project4/testcases.html

;Please review the test cases on your own before talking to a TA about your grade.

;========================================================================
;========================================================================
;Results:


;PartA: Test code on LC3 initialized to 0. 80 points.
;Test Name                          		:	Status		points
;testcase0_tree_empty               		:	PASS		2/2
;testcase1_tree_website             		:	PASS		2/2
;testcase2_tree_website             		:	PASS		2/2
;testcase3_tree_website             		:	PASS		2/2
;testcase4_tree_website             		:	PASS		2/2
;testcase5_tree_website             		:	PASS		2/2
;testcase6_tree_website             		:	PASS		6/6
;testcase7_tree_small_balanced      		:	PASS		3/3
;testcase8_tree_small_balanced      		:	PASS		3/3
;testcase9_tree_small_balanced      		:	PASS		3/3
;testcase10_tree_small_balanced     		:	PASS		3/3
;testcase11_tree_small_balanced     		:	PASS		3/3
;testcase12_tree_small_balanced     		:	PASS		6/6
;testcase13_tree_medium_balanced    		:	PASS		4/4
;testcase14_tree_medium_balanced    		:	PASS		8/8
;testcase15_tree_big_sparse         		:	PASS		7/7
;testcase16_tree_big_sparse         		:	PASS		7/7
;testcase17_tree_big_sparse         		:	PASS		7/7
;testcase18_tree_deep_left_links    		:	PASS		3/3
;testcase19_tree_deep_left_links    		:	PASS		3/3
;testcase20_tree_deep_left_links    		:	PASS		3/3
;testcase21_tree_deep_right_links   		:	PASS		3/3
;testcase22_tree_deep_right_links   		:	PASS		3/3
;testcase23_tree_deep_right_links   		:	PASS		3/3
;testcase24_tree_random_names       		:	PASS		4/4
;testcase25_tree_random_names       		:	PASS		6/6
;--------------------------------------------------------------Part A: 100/100

;PartB: Test code on LC3 randomized. 20 points.
;Test Name                          		:	Status		points
;testcase0_tree_empty               		:	PASS		2/2
;testcase1_tree_website             		:	PASS		2/2
;testcase2_tree_website             		:	PASS		2/2
;testcase3_tree_website             		:	PASS		2/2
;testcase4_tree_website             		:	PASS		2/2
;testcase5_tree_website             		:	PASS		2/2
;testcase6_tree_website             		:	PASS		6/6
;testcase7_tree_small_balanced      		:	PASS		3/3
;testcase8_tree_small_balanced      		:	PASS		3/3
;testcase9_tree_small_balanced      		:	PASS		3/3
;testcase10_tree_small_balanced     		:	PASS		3/3
;testcase11_tree_small_balanced     		:	PASS		3/3
;testcase12_tree_small_balanced     		:	PASS		6/6
;testcase13_tree_medium_balanced    		:	PASS		4/4
;testcase14_tree_medium_balanced    		:	PASS		8/8
;testcase15_tree_big_sparse         		:	PASS		7/7
;testcase16_tree_big_sparse         		:	PASS		7/7
;testcase17_tree_big_sparse         		:	PASS		7/7
;testcase18_tree_deep_left_links    		:	PASS		3/3
;testcase19_tree_deep_left_links    		:	PASS		3/3
;testcase20_tree_deep_left_links    		:	PASS		3/3
;testcase21_tree_deep_right_links   		:	PASS		3/3
;testcase22_tree_deep_right_links   		:	PASS		3/3
;testcase23_tree_deep_right_links   		:	PASS		3/3
;testcase24_tree_random_names       		:	PASS		4/4
;testcase25_tree_random_names       		:	PASS		6/6
;--------------------------------------------------------------Part B: 100/100

;PartC: Checking for formatting and Halt.

;========================================================================
;Final score		100/100

;If you believe your score is an error or that you were
;unfairly penalized for a *small* issue, please make your
;case to a TA. If the TA agrees, we will go from there.
;Only bring small mistakes to our attention. If this system
;is abused we will no longer be able to offer it.
  	.ORIG X3000
AGAIN	LD	R6, BASS
	BR SKIP
	BASS	.FILL	xFE00
SKIP	LEA	R0, PROMPT
	TRAP	X22
TAKE	ST	R1, SAVE1
	ST	R2, SAVE2
	LEA 	R2, NAME
LOOP	TRAP	X20
	TRAP	X21
	STR	R0, R2, #0
	ADD	R2, R2, #1
	LD	R1, ENTER
	ADD	R1, R0, R1
	BRNP	LOOP
	AND	R1, R1, #0
	STR	R1, R2, #-1
	LD	R1, NAME
	LD	R2, d
	ADD	R1, R2, R1
	BRNP	GOOD
	LEA 	R1, NAME
	LDR	R1, R1, #1 
	BRNP	GOOD
	HALT
GOOD	LD	R1, SAVE1
	LD	R2, SAVE2
	LD	R0, ROOT
	AND 	R4, R4, #0
	LDR	R1, R0, #0
	NOT	R2, R1
	ADD	R2, R2, #1
	ST	R2, ENDD
	BR	BOOM
	
SEARCH	AND 	R4, R4, #0
	LDR	R1, R0, #0
	LD	R2, ENDD
	ADD	R2, R1, R2
	BRZ	EXIT	
	ADD	R1, R1, #0
BOOM	BRZ	RIGHT
	LEA	R2, STACK
	JSRR	R2	
	ADD	R5, R5, #0
	BRP	RIGHT		;CHECK LEFT NODE FOR NULL
	BR 	USE
RIGHT	LDR	R1, R0, #1		;CHECK RIGHT NODE FOR NULL
	BRZ	BACK
	LEA	R2, STACK
	JSRR	R2	
	ADD	R5, R5, #0
	BRP 	BACK
	BR 	USE

STACK	ST 	R6, SAVEE6			;CHECK STACK FOR PREVIOUS MOVEMENT
GAIN	LDR	R5, R6, #0
	BRZ	NONE
	NOT 	R5, R5
	ADD	R5, R5, #1
	ADD	R5, R1, R5
	BRZ	ONE
	ADD	R6, R6, #1
	BR	GAIN
ONE	AND	R5, R5, #0
	ADD	R5, R5, #1
	ADD	R4, R4, #1
	LD	R6, SAVEE6
	RET
NONE	AND 	R5, R5, #0
	LD	R6, SAVEE6
	RET

BACK	LEA	R2, POP			;POP PREVIOUS LOCATION
	JSRR	R2
	ADD	R4, R4, #0
	BRZ	AOK
	ADD	R4, R4, #-1
	BR	BACK
AOK	ADD	R5, R5, #0
	BRZ	SEARCH
	BR	EXIT	

USE	ST	R0, SAVEE0
	ADD	R0, R1, #0
	LEA	R2, PUSH		;PUSH MOVEMENT TO STACK
	JSRR	R2
	LD	R0, SAVEE0		;PUSH LOCATION COMING FROM TO STACK
	JSRR	R2
	ADD	R0, R1, #0
	LDR	R5, R0, #2
	LEA 	R2, NAME		;R0 HAS PONITER TO NODE NAME
CROSS	LDR	R1, R5, #0		;R1 HAS FIRST CHAR OF NAME
	BRZ	NOM			;COMPARE TO NAME ENTERED
	LDR	R3, R2, #0		
	NOT	R3, R3
	ADD	R3, R3, #1
	ADD	R3, R1, R3
	BRNP	SEARCH
	ADD	R5, R5, #1
	ADD	R2, R2, #1
	BR	CROSS

NOM	LDR	R3, R2, #0
	BRZ 	MATCH
	BR	SEARCH	
SAVEE6	.BLKW	1
SAVEE0	.BLKW	1	
ENDD	.FILL	x0000
MATCH	LDR	R0, R0, #3 			;OUTPUT NAME AND THEN HALT
	LEA	R1, PRINT_NUM
	JSRR	R1
	BR	AGAIN

PRINT_NUM        ST   R0, PRINT_NUM_SAVER0
                 ST   R1, PRINT_NUM_SAVER1
                 ST   R6, PRINT_NUM_SAVER6
                 ST   R7, PRINT_NUM_SAVER7

                 LEA  R6, PRINT_NUM_LF ; initialize the local stack pointer
PRINT_NUM_AGAIN  JSR  DIV10            ; Extract next digit by dividing by 10
                 ADD  R6, R6, #-1
                 LD   R7, PRINT_NUM_HEX30
                 ADD  R0, R0, R7       ; Convert the single digit to ASCII
                 STR  R0, R6, #0       ; push the ASCII digit onto the stack
                 ADD  R1, R1, #0
                 BRz  PRINT_NUM_DONE   ; If the quotient is zero, we are ready to print
                 ADD  R0, R1, #0
                 BR   PRINT_NUM_AGAIN
PRINT_NUM_DONE   ADD  R0, R6, #0
                 TRAP x22              ; Print all the digits in the reverse order
                 LD   R0, PRINT_NUM_SAVER0
                 LD   R1, PRINT_NUM_SAVER1
                 LD   R6, PRINT_NUM_SAVER6
                 LD   R7, PRINT_NUM_SAVER7
                 RET

PRINT_NUM_STACK  .BLKW 5
PRINT_NUM_LF     .FILL x000A  
PRINT_NUM_NULL   .FILL x0000
PRINT_NUM_HEX30  .FILL x0030
PRINT_NUM_SAVER0 .BLKW 1
PRINT_NUM_SAVER1 .BLKW 1
PRINT_NUM_SAVER6 .BLKW 1
PRINT_NUM_SAVER7 .BLKW 1

DIV10            AND  R1, R1, #0
DIV10_AGAIN      ADD  R0, R0, #-10
                 BRn  DIV10_DONE
                 ADD  R1, R1, #1
                 BR   DIV10_AGAIN
DIV10_DONE       ADD  R0, R0, #10
                 RET

EXIT	LEA	R0, NIN
	TRAP 	X22
	LD	R0, LA
	TRAP	X21
	BR	AGAIN	
NIN	.STRINGZ "No Entry"
LA	.FILL	x000A
		
POP	ST 	R2, SAVER2
	ST 	R1, SAVER1
	LD	R1, BASE
	ADD	R1, R1, #-1
	ADD	R2, R6, R1
	BRZ	FAIL
	LDR	R0, R6, #0
	AND	R1, R1, #0
	STR	R1, R6, #0
	ADD	R6, R6, #1
	BR	SUCC
PUSH	ST	R2, SAVER2
	ST	R1, SAVER1
	LD	R1, MAX
	ADD	R2, R6, R1
	BRZ	FAIL
	ADD	R6, R6, #-1
	STR	R0, R6, #0
SUCC	LD	R1, SAVER1
	LD	R2, SAVER2
	AND	R5, R5, #0
	RET
FAIL	LD	R1, SAVER1
	LD	R2, SAVER2
	AND	R5, R5, #0
	ADD	R5, R5, #1
	RET
BASE	.FILL	x01FF
MAX	.FILL	X0000
SAVER1	.BLKW	1
SAVER2	.BLKW	1

	HALT
ROOT	.FILL	x4000
SAVE1	.BLKW	1
SAVE2	.BLKW	1	
PROMPT	.STRINGZ "Type a professor's name and then press Enter:"
d	.FILL x-0064
ENTER	.FILL x-000A
NAME	.BLKW 20
	.END