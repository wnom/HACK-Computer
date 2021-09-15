//NAME AND UIN
//William Norman 428002797

// File name: calc.asm

// The program develops a calculator application. 
// The operands a and b are integer numbers stored in RAM[0] (R0) and RAM[1] (R1), respectively.
// The operation choice c is stored in RAM[2] (R2), respectively
// if c == 1, do a + b
// if c == 2, do a - b
// if c == 3, do a * b
// if c == 4, do a / b
// For Addition and Subtraction operations the operands a and b can be positive or negative.
// For Multiplication operation only ONE operand can be negative.
// For Division operation BOTH operands must be positive and must be greater than 0.
// Store the final result (quotient for Division) in RAM[3] (R3). Only the Division operation 
// stores the remainder in RAM[4] (R4).


// Put your code below this line

@R2
D = M

@ADD
D-1; JEQ
D = D-1

@SUB
D-1; JEQ
D = D-1

@MULT
D-1; JEQ
D = D-1

@DIV
D-1; JEQ

@Err
0; JMP


//Addition Function
(ADD)
	@R0
	D = M
	@R1
	D = D + M
	@R3
	M = D

	@END
	0;JMP


//Subtraction Function
(SUB)
	@R0
	D = M
	@R1
	D = D - M
	@R3
	M = D

	@END
	0;JMP



//Multiplication Function
(MULT)
	@R0
	D = M
	@a 
	M = D
	@R1
	D = M
	@b
	M = D
	@R0
	D = M

	@A_NEG
	D; JLT
	@ZERO
	D; JEQ

	@R1
	D = M

	@B_NEG
	D; JLT
	@ZERO
	D; JEQ

	@CALC
	0;JMP

	(A_NEG)//A is negative
		@a
		M = -D
		@R1
		D = M
		@Err
		D; JLT
		@isNeg
		M = 1
		@CALC
		0;JMP

	(B_NEG)//B is negative
		@b
		M = -D
		@R0
		D = M
		@Err
		D; JLT
		@isNeg
		M = 1


	(CALC)
		@b
		D = M
		@count
		M = D
		@sum
		M = 0

	(LOOP)
		@a
		D = M
		@sum
		M = M+D

		@count 
		M = M-1
		D = M

		@Done
		D; JLE
		@LOOP
		0;JMP

	(Done)
		@sum
		D = M
		@R3
		M = D
		D = M
		@isNeg
		D = M
		@NEGA
		D; JGT
		@END
		0;JMP

	(NEGA)
		@R3
		M = -M
		@isNeg
		M = 0
		@END
		0;JMP

	(ZERO)
		@R3
		M = 0
		@END
		0;JMP




//Division Function
(DIV)
	@R3
	M = 0
	@R4
	M = 0
	
	@R0
	D = M
	@Err
	D; JLE
	
	@R1
	D = M
	@Err
	D; JLE
	
	@R0
	D = M

(LOOP2)
	@R1
	D = D - M
	@REM
	D; JLT
	@R3
	M = M + 1
	@LOOP2
	0; JMP
 
(REM)
	@R1
	D = D + M
	@R4
	M = D

	
@END
0;JMP



(Err)
	@1024
	M = -1
	@END
	0;JMP


(END)
	@END
	0;JMP