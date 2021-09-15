//NAME AND UIN
//William Norman 428002797


// File name: palin.asm

// The program develops a Palindrome checker application. 
// The input to the program is a 5 digit integer A and is stored in RAM[0] (R0).
// A helper value of 10 is stored in RAM[8] (R8) by virtue of the tst file command.
// Number A is a positive integer.
// A has exactly 5 digits and no more no less.

// Program functions as follows: 
// Extract the individual digits from number A and store them in R2-R6 registers in that order.
// Result of 1 is stored in R1 if the number A is a Palindrome else result of 0 is stored in R1

// Put your code below this line

@R0
D = M
@temp
M = 0

(LOOP)
	@R8
	D = D - M
	@REM
	D, JLT
	@temp
	M = M + 1
	@LOOP
	0; JMP
 
(REM)
	@R8
	D = D + M
	@R2
	M = D


@temp
D = M
@temp2
M = 0	

(LOOP2)
	@R8
	D = D - M
	@REM2
	D, JLT
	@temp2
	M = M + 1
	@LOOP2
	0; JMP
 
(REM2)
	@R8
	D = D + M
	@R3
	M = D
	
@temp2
D = M	
@temp3
M = 0	

(LOOP3)
	@R8
	D = D - M
	@REM3
	D, JLT
	@temp3
	M = M + 1
	@LOOP3
	0; JMP
 
(REM3)
	@R8
	D = D + M
	@R4
	M = D
	
@temp3
D = M	
@temp4
M = 0	

(LOOP4)
	@R8
	D = D - M
	@REM4
	D, JLT
	@temp4
	M = M + 1
	@LOOP4
	0; JMP
 
(REM4)
	@R8
	D = D + M
	@R5
	M = D
	
@temp4
D = M
@temp5
M = 0	

(LOOP5)
	@R8
	D = D - M
	@REM5
	D, JLT
	@temp5
	M = M + 1
	@LOOP5
	0; JMP
 
(REM5)
	@R8
	D = D + M
	@R6
	M = D
	
	
	
@R1
M = 1

@R2
D = M
@R6
D = D - M
@ISNT_PAL
D; JNE

@R3
D = M
@R5
D = D - M
@ISNT_PAL
D; JNE
@END
0;JMP


(ISNT_PAL)
	@R1
	M = 0
	


(END)
@END
0;JMP