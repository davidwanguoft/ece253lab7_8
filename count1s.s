.text
.global	_start

_start: 
			LDR	R8, =TEST_NUM //load the first word in test num into R1
			MOV	R2, #0 //move the hex number 0 into R2
			MOV R5, #0

LOOP:		CMP	R2, #0xc //R2 is acting as our loop terminator, we are comparing it with the number of words
			BEQ	END //if R2 and 0xc are equal than end the program because you ran the loop 12 times 
			BL ONES //if not go to the subroutine
			CMP R5, R0 //compare R0 and R5
			MOV GE R5, R0 //if R0 is bigger put R0 into R5
			ADD R2, R2, #1 //increment the loop counter
			ADD R8, R8, #4 //increment to the next word
			B LOOP

END:		B	END

ONES:		LDR R1, [R8] //puts the contents of the R8 rights into R1
			MOV R0, #0 //moves number zero into R0
LOOPONES: 	CMP R1, #0 //loop until all data contains no more 1s
			BEQ ENDONES //go back to main program if no more 1s
			LSR R3, R1, #1 //perform SHIFT, followed by AND
			AND R1, R1, R3
			ADD R0, #1	//count the string lengths so far
			B LOOPONES //loop again

ENDONES:	BX	LR

/*

ZEROS:		LDR R1, [R8] //puts the contents of the R8 rights into R1
			MOV R0, #0 //moves number zero into R0
LOOPZEROS: 	CMP R1, #0 //loop until all data contains no more 1s
			BEQ ENDZEROS //go back to main program if no more 1s
			LSL R3, R1, #1 //perform SHIFT, followed by OR
			OR R1, R1, R3
			ADD R0, #1	//count the string lengths so far
			B LOOPZEROS //loop again

ENDZEROS:	BX LR

*/

TEST_NUM: .word	0x103fe00f, 0x05b404e3, 0x553e06f0, 0xacc6f78d, 0x51df2746, 0xa4b5c482, 0x8d8c0046, 0xb8298183, 0x7d7af842, 0xe18d16b4, 0x4d86ca69, 
0x6b83c9ed    


.end