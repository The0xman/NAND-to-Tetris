//HACK ASSEMBLY CODE
//The inputs of this program are the values stored in R0
//and R1 (RAM[0] and RAM[1]). The program computes the product R0 * R1 and stores the result in
//R2 (RAM[2]). Assume that R0 ≥ 0, R1 ≥ 0, and R0 * R1 < 32768 (your program need not test these
//conditions). Your code should not change the values of R0 and R1.

@R2 //initialize R2 (not sure if I had to do this lol)
M=0 // R2 = 0   
(LOOP)	
@R1
D=M //D=R1
@END
D;JEQ //Exit loop in R1 == 0
@R0 
D=M //R0=RAM[0]
@R2
M=D+M //R2=R0+R2
@R1
M=M-1 //R1=R1-1
D=M // D=R1
@LOOP
D;JGE //if R1 >= 0, execute loop
(END)
@END
0;JMP //necessary Infinite loop that signals to terminate the execution of a Hack progam

