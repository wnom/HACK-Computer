//NAME AND UIN
//William Norman 428002797

// File name: gcd.asm

// This program calculates the greatest common divisor (gcd) of two given 
// non-negative integers, which are stored in RAM[0] (R0) and RAM[1] (R1). 
// The gcd is stored in RAM[2] (R2).



// Put your code below this line

@R0
D = M
@A
M = D

@R1
D = M
@B
M = D

@A
D = D - M

@SWITCH
D; JGT

@SAME
D; JEQ

@LOOP
0;JMP

(SWITCH)
	@A
	D = M
	@hold
	M = D
	@B
	D = M
	@A
	M = D
	@hold
	D = M
	@B
	M = D
	@LOOP
	0;JMP

(SAME)
	@A
	D = M
	@R2
	M = D
	@END
	0;JMP
	

(LOOP)
	@B
	D = M
	@EXIT
	D; JEQ
	@store
	M = D
	
	@A
	D = M
	@temp
	M = 0
	

	(LOOP2)
		@B
		D = D - M
		@REM
		D, JLT
		@temp
		M = M + 1
		@LOOP2
		0; JMP
	 
	(REM)
		@B
		MD = D + M
		
	
	
	@store
	D = M
	@A
	M = D
	
	@LOOP
	0;JMP

(EXIT)
@A
D = M
@R2
M = D	




(END)
@END
0; JMP