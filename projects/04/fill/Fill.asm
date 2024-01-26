//HACK ASSEMBLY CODE
//This program runs an infinite loop that listens to the
//keyboard. When a key is pressed (any key), the program blackens the entire screen by writing
//"black" in every pixel. When no key is pressed, the program clears the screen by writing "white" in
//every pixel.
(LOOP)
@KBD
D=M //Get keyboard value
@ON
D;JGT//Turn on screen if KBD > 0.
@OFF
0;JMP//Else turn off the screen
(ON)
@R0
M=-1 // R0=-1, this is the set value for a black pixel in Hack
@LOOPER
0;JMP//Looping mechanism
(OFF)
@R0
M=0 // R0=0, this is the set value for a white pixel in Hack
@LOOPER
0;JMP//Looping mechanism
(LOOPER)// Set the screen to R0 and loop.
@8191
D=A
@R1
M=D //R1 = 8191, number of pixels we need to manipulate
(INCR) // increment over the pixels allocated for the screen and set the values to R0.
@R1
D=M
@pointer
M=D
@SCREEN
D=A
@pointer
M=M+D //pointer to the next pixel
@R0
D=M
@pointer
A=M
M=D //set value of this pixel to R0
@R1
D=M-1
M=D //Decrement R1
@INCR
D;JGE// Next if the counter is still >= 0.
@LOOP
0;JMP//necessary Infinite loop that signals to terminate the execution of a Hack progam
