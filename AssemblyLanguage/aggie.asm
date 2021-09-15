//NAME AND UIN
//William Norman 428002797

// File name: aggie.asm

// The program runs an infinite loop that listens to the keyboard input. As soon as a 
// key press is detected, the program exits the wait loop and proceeds to draw the 
// graphic as described in the project document. 
// You will need to draw the letters pixel by pixel because HACK asm has no 
// utilities for drawing text.
// State any assumptions made in your program 

// Assumptions (as applicable)

// Put your code below this line

@SCREEN
D = A
@TOP_START
M = D


(Check)
	@KBD
	D = M
	@GO
	D;JGT
	@Check
	0;JMP

	
	
(GO)
	@TOP_START
	D = M
	@curr
	M = D
	@15
	D = A
	@NumBlack
	M = D
	@17
	D = A
	@NumJump
	M = D
	
	(TOP)
		@index
		M = 1
		(LOOP)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@LOOP
			D; JGT
			
		@curr
		A = M
		M = -1
		
		@NumJump
		D = M
		@curr
		M = D + M
		@index
		M = 1
		(LOOP2)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@LOOP2
			D; JGT
		
		@16383
		D = A
		@curr
		A = M
		M = D
			
		@NumJump
		D = M
		@curr
		M = D + M
		@index
		M = 1
		(LOOP3)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@LOOP3
			D; JGT
		
		@4095
		D = A
		@curr
		A = M
		M = D
			
		@NumJump
		D = M
		@curr
		M = D + M
		@index
		M = 1
		(LOOP4)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@LOOP4
			D; JGT
		
		@1023
		D = A
		@curr
		A = M
		M = D
			
		@NumJump
		D = M
		@curr
		M = D + M
		@index
		M = 1
		(LOOP5)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@LOOP5
			D; JGT
		
		@255
		D = A
		@curr
		A = M
		M = D
			
		@NumJump
		D = M
		@curr
		M = D + M
		@index
		M = 1
		(LOOP6)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@LOOP6
			D; JGT
		
		@63
		D = A
		@curr
		A = M
		M = D
			
		@NumJump
		D = M
		@curr
		M = D + M
		@index
		M = 1
		(LOOP7)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@LOOP7
			D; JGT
		
		@15
		D = A
		@curr
		A = M
		M = D
			
		@NumJump
		D = M
		@curr
		M = D + M
		@index
		M = 1
		(LOOP8)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@LOOP8
			D; JGT
		
		@3
		D = A
		@curr
		A = M
		M = D
		
		@NumJump
		D = M
		@curr
		M = D + M
		
		@NumJump
		M = M + 1
		
		@NumBlack
		MD = M -1
		@TOP
		D; JGT
	
	
	@curr
	A = M
	M = -1
	
	@32
	D = A
	@curr
	M = M + D
	@16383
	D = A
	@curr
	A = M
	M = D
	
	@32
	D = A
	@curr
	M = M + D
	@4095
	D = A
	@curr
	A = M
	M = D
	
	@32
	D = A
	@curr
	M = M + D
	@1023
	D = A
	@curr
	A = M
	M = D
	
	@32
	D = A
	@curr
	M = M + D
	@255
	D = A
	@curr
	A = M
	M = D
	
	@32
	D = A
	@curr
	M = M + D
	@63
	D = A
	@curr
	A = M
	M = D
	
	@32
	D = A
	@curr
	M = M + D
	@15
	D = A
	@curr
	A = M
	M = D
	
	@32
	D = A
	@curr
	M = M + D
	@3
	D = A
	@curr
	A = M
	M = D
	
	//Now start at next side for bottom triangle
	@31
	D = A
	@curr
	M = M + D
	@16384
	D = A
	@curr
	A = M
	M = -D
	
	@32
	D = A
	@curr
	M = M + D
	@4096
	D = A
	@curr
	A = M
	M = -D
	
	@32
	D = A
	@curr
	M = M + D
	@1024
	D = A
	@curr
	A = M
	M = -D
	
	@32
	D = A
	@curr
	M = M + D
	@256
	D = A
	@curr
	A = M
	M = -D
	
	@32
	D = A
	@curr
	M = M + D
	@64
	D = A
	@curr
	A = M
	M = -D
	
	@32
	D = A
	@curr
	M = M + D
	@16
	D = A
	@curr
	A = M
	M = -D
	
	@32
	D = A
	@curr
	M = M + D
	@4
	D = A
	@curr
	A = M
	M = -D
	
	@32
	D = A
	@curr
	M = M + D
	@1
	D = A
	@curr
	A = M
	M = -D
	
	@30
	D = A
	@NumJump
	M = D
	@NumBlack
	M = 1
	@curr
	M = M + D
	M = M + 1
	(BOT)
		
		@16384
		D = A
		@curr
		A = M
		M = -D
		
		@curr
		M = M + 1
		@index
		M = 1
		(BOT_LOOP)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@BOT_LOOP
			D; JGT
			
		@NumJump
		D = M
		@curr
		M = M + D
		
		@4096
		D = A
		@curr
		A = M
		M = -D
		
		@curr
		M = M + 1
		@index
		M = 1
		(BOT_LOOP2)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@BOT_LOOP2
			D; JGT
			
		@NumJump
		D = M
		@curr
		M = M + D
		@1024
		D = A
		@curr
		A = M
		M = -D
		
		@curr
		M = M + 1
		@index
		M = 1
		(BOT_LOOP3)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@BOT_LOOP3
			D; JGT
			
		@NumJump
		D = M
		@curr
		M = M + D
		@256
		D = A
		@curr
		A = M
		M = -D
		
		@curr
		M = M + 1
		@index
		M = 1
		(BOT_LOOP4)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@BOT_LOOP4
			D; JGT
			
		@NumJump
		D = M
		@curr
		M = M + D
		@64
		D = A
		@curr
		A = M
		M = -D
		
		@curr
		M = M + 1
		@index
		M = 1
		(BOT_LOOP5)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@BOT_LOOP5
			D; JGT
			
		@NumJump
		D = M
		@curr
		M = M + D
		@16
		D = A
		@curr
		A = M
		M = -D
		
		@curr
		M = M + 1
		@index
		M = 1
		(BOT_LOOP6)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@BOT_LOOP6
			D; JGT
			
		@NumJump
		D = M
		@curr
		M = M + D
		@4
		D = A
		@curr
		A = M
		M = -D
		
		@curr
		M = M + 1
		@index
		M = 1
		(BOT_LOOP7)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@BOT_LOOP7
			D; JGT
			
		@NumJump
		D = M
		@curr
		M = M + D
		@1
		D = A
		@curr
		A = M
		M = -D
		
		@curr
		M = M + 1
		@index
		M = 1
		(BOT_LOOP8)
			@curr
			A = M
			M = -1
			@curr
			M = M + 1
			@NumBlack
			D = M
			@index
			D = D-M
			M = M + 1
			@BOT_LOOP8
			D; JGT
		
		
		@NumJump
		MD = M - 1
		@curr
		M = M + D
		
		@NumBlack
		MD = M + 1
		@15
		D = D - A
		@BOT
		D; JLE
		
		
	
	
	
	


(END)
@END
0;JMP




