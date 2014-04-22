// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

@8192
D=A
@max
M=D

@0
D=A
@i
M=D

(LOOP)

  // start clearing screen if no key is being pressed
  @KBD
  D=M
  @CLEAR
  D;JEQ

  // fill screen
  (FILL)
    @max
    D=M
    @i
    D=D-M
    @LOOP
    D;JLE

    @i
    D=M
    @SCREEN
    A=A+D
    M=-1

    @i
    D=M
    D=D+1
    @i
    M=D

    // jump back
    @LOOP
    0;JMP

  (CLEAR) // clear screen

    @i
    D=M
    @SCREEN
    A=A+D
    M=0

    // jump back if i == 0
    @i
    D=M
    @LOOP
    D;JLE

    // decrement i
    D=D-1
    @i
    M=D

    // jump back
    @LOOP
    0;JMP
