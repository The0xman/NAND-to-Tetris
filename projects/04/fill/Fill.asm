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
@i
M=0
D=M
@R1
M=D //begin with 0 pixels colored 
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
D=M+1
M=D //increment R1
@8162 //number of pixels on the screen
D=D-A
@INCR
D;JLT// continue to increment so long as the counter is less than the number of pixels on the screen
@LOOP
0;JMP//ensures that this is an infinite loop
