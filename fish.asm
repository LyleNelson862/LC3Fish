;*****************************************************************************
; Author: Lyle Nelson
; Date: 05/05/2023
; Revision: 1.0
;
; Description:
; This routine writes an LC-3 trap handler that inputs and echoes a string of characters from the keyboard until it finds a newline character
; Notes:
; This program needs a few subroutines and many JSR calls to those subroutines. There are literally a thousand JSR calls, but this is necessary in order for me to load every fish position without exceeding a 9-bit offset limit.
; I can only declare a handful of string characters or subroutine instructions before I exceed the offset limit, but I can declare a lot more JSR calls without exceeding any offset limit. There is a comment for every fish position,
; and each line of code underneath that comment is used for drawing the fish in the given position. The Pause subroutine is called at the end of every position drawing, and the Pause subroutine works by setting the Time label to a 
; given number and then decrementing that number in a loop. The subroutine labels include row1regular, row2regular, row3regular, row4regular, row1bubble, row2bubble, justBubble, enter1line, enter5lines,
; enter10lines, leave1space, leave5spaces, and leave20spaces.

; R0 is used for all of the LEA instructions in the subroutines.
; R1 contains the characters to be echoed.
; R2 is used for decrementing the Time value in the Pause subroutine.
;****************************************************************************/
.ORIG x3000
;Position 1
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR enter5lines
JSR row1regular
JSR row2regular
JSR row3regular
JSR row4regular
JSR Pause

;Position 2
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR enter5lines
JSR row1regular
JSR row2bubble ;first bubble begins here
JSR row3regular
JSR row4regular
JSR Pause

;Position 3
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR row1bubble ;first bubble aligned with top row of fish
JSR row2regular
JSR row3regular
JSR row4regular
JSR enter1line
JSR Pause

;Positoin 4
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces  ;first bubble is 27 spaces right
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR justBubble
JSR row1regular
JSR row2regular
JSR row3regular
JSR row4regular
JSR enter1line
JSR Pause

;Position 5
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces  ;first bubble is 27 spaces right
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR justBubble
JSR leave1space ;fish located 1 space right
JSR row1regular
JSR leave1space
JSR row2bubble ;second bubble begins here
JSR leave1space
JSR row3regular
JSR leave1space
JSR row4regular
JSR enter1line
JSR enter1line
JSR Pause

;Position 6
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces  ;first bubble is 27 spaces right
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR justBubble ;first bubble drawn here
JSR enter1line ;one line between first bubble and fish
JSR leave1space ;fish located 2 spaces right
JSR leave1space
JSR row1bubble ;second bubble aligned with top row of fish 
JSR leave1space ;two lines between first bubble and fish
JSR leave1space
JSR row2regular
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave1space
JSR leave1space
JSR row4regular
JSR enter1line
JSR enter1line
JSR Pause

;Position 7
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces ;first bubble is 27 spaces right
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR justBubble ;first bubble drawn here
JSR enter1line ;one line between first bubble and fish
JSR leave1space  ;fish located 3 spaces right
JSR leave1space
JSR leave1space
JSR row1bubble ; 2nd bubble still aligned with top row since fish moved up
JSR leave1space
JSR leave1space
JSR row2regular
JSR leave1space
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave1space
JSR leave1space
JSR leave1space
JSR row4regular
JSR enter1line
JSR enter1line
JSR enter1line
JSR Pause

;Position 8
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces  ;first bubble is 27 spaces right
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR justBubble ;first bubble drawn here
JSR enter1line ; one line between first bubble and second bubble
JSR leave20spaces
JSR leave5spaces
JSR leave5spaces ;second bubble is 30 spaces right
JSR justBubble ; second bubble drawn here
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space ;fish located 4 spaces right
JSR row1regular
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row2bubble  ;third bubble begins here
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row4regular
JSR enter1line
JSR enter1line
JSR enter1line
JSR Pause

;Position 9
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces  ;first bubble is 27 spaces right
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR justBubble ;first bubble drawn here
JSR enter1line ; one line between first bubble and second bubble
JSR leave20spaces
JSR leave5spaces
JSR leave5spaces ;second bubble is 30 spaces right
JSR justBubble ;second bubble drawn here
JSR leave5spaces ;fish located 5 spaces right
JSR row1bubble ;third bubble starts ascending
JSR leave5spaces
JSR row2regular
JSR leave5spaces
JSR row3regular
JSR leave5spaces
JSR row4regular
JSR enter1line
JSR enter1line
JSR enter1line
JSR enter1line
JSR Pause

;Position 10
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces ;second bubble is 30 spaces right
JSR leave5spaces
JSR leave5spaces
JSR justBubble ;second bubble drawn here
JSR enter1line ;one line between second bubble and third bubble
JSR leave20spaces ;third bubble is 32 spaces right
JSR leave5spaces 
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR justBubble ;third bubble drawn here
JSR leave5spaces ;fish located 6 spaces right
JSR leave1space
JSR row1regular
JSR leave5spaces
JSR leave1space
JSR row2bubble ;4th bubble begins here
JSR leave5spaces
JSR leave1space
JSR row3regular
JSR leave5spaces
JSR leave1space
JSR row4regular
JSR enter1line
JSR enter1line
JSR enter1line
JSR enter1line
JSR Pause

;Position 11
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces ;second bubble is 30 spaces right
JSR leave5spaces
JSR leave5spaces
JSR justBubble ;second bubble drawn here
JSR enter1line ;two lines between second bubble and third bubble
JSR enter1line 
JSR leave20spaces ;third bubble is 32 spaces right
JSR leave5spaces 
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR justBubble ;third bubble drawn here
JSR enter1line ;1 line between third bubble and fish
JSR leave5spaces ;;fish located 7 spaces right
JSR leave1space
JSR leave1space
JSR row1bubble ;4th bubble starts ascending
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR row2regular
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR row4regular
JSR enter5lines
JSR Pause

; Position 12
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces ;third bubble is 32 spaces right
JSR leave5spaces 
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR justBubble ;third bubble drawn here
JSR enter1line ;1 line between third bubble and fourth bubble
JSR leave20spaces ;4th bubble is 34 spaces right
JSR leave5spaces 
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR justBubble ;Fourth bubble drawn here
JSR leave5spaces ;fish located 8 spaces right
JSR leave1space
JSR leave1space
JSR leave1space
JSR row1regular
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR row2regular
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR row4regular
JSR enter5lines
JSR Pause

; Position 13
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces ;third bubble is 32 spaces right
JSR leave5spaces 
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR justBubble ;third bubble drawn here
JSR enter1line ;1 line between third bubble and fourth bubble
JSR leave20spaces ;4th bubble is 34 spaces right
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR justBubble ;4th bubble drawn here
JSR enter1line ; One line between 4th bubble and fish
JSR leave5spaces ;fish located 9 spaces right
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row1regular
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row2bubble ;5th bubble begins
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row4regular
JSR enter5lines
JSR Pause

; Position 14
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces ;third bubble is 32 spaces right
JSR leave5spaces 
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR justBubble ;third bubble drawn here
JSR enter1line ;1 line between third bubble and fourth bubble
JSR leave20spaces ;4th bubble is 34 spaces right
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR justBubble ;4th bubble drawn here
JSR enter1line ; Two lines between 4th bubble and fish
JSR enter1line
JSR leave5spaces ;fish located 10 spaces right
JSR leave5spaces
JSR row1bubble ;5th bubble aligned with top row of fish
JSR leave5spaces
JSR leave5spaces
JSR row2regular ;
JSR leave5spaces
JSR leave5spaces
JSR row3regular
JSR leave5spaces
JSR leave5spaces
JSR row4regular
JSR enter5lines
JSR Pause

; Position 15
;Fish just moves up
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR enter1line ;1 line between third bubble and fourth bubble
JSR leave20spaces ;4th bubble is 34 spaces right
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR justBubble ;4th bubble drawn here
JSR enter1line ; Two lines between 4th bubble and fish
JSR enter1line
JSR leave5spaces ;fish located 10 spaces right
JSR leave5spaces
JSR row1bubble ;5th bubble remains aligned with top row of fish
JSR leave5spaces
JSR leave5spaces
JSR row2regular
JSR leave5spaces
JSR leave5spaces
JSR row3regular
JSR leave5spaces
JSR leave5spaces
JSR row4regular
JSR enter5lines
JSR enter1line
JSR Pause
JSR Pause

; Position 16
;Fish just floats up
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR enter1line ;1 line between third bubble and fourth bubble
JSR leave20spaces ;4th bubble is 34 spaces right
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR justBubble ;4th bubble drawn here
JSR enter1line ; Two lines between 4th bubble and fish
JSR enter1line
JSR leave5spaces ;fish located 10 spaces right
JSR leave5spaces
JSR row1bubble
JSR leave5spaces
JSR leave5spaces
JSR row2regular
JSR leave5spaces
JSR leave5spaces
JSR row3regular
JSR leave5spaces
JSR leave5spaces
JSR row4regular
JSR enter5lines
JSR enter1line
JSR enter1line
JSR Pause
JSR Pause

; Position 17
;Fish just floats up
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR enter1line ;1 line between third bubble and fourth bubble
JSR leave20spaces ;4th bubble is 34 spaces right
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR justBubble ;4th bubble drawn here
JSR enter1line ; Two lines between 4th bubble and fish
JSR enter1line
JSR leave5spaces ;fish located 10 spaces right
JSR leave5spaces
JSR row1bubble
JSR leave5spaces
JSR leave5spaces
JSR row2regular
JSR leave5spaces
JSR leave5spaces
JSR row3regular
JSR leave5spaces
JSR leave5spaces
JSR row4regular
JSR enter5lines
JSR enter1line
JSR enter1line
JSR enter1line
JSR Pause
JSR Pause

; Position 18
;Fish just floats up
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR enter1line ;1 line between third bubble and fourth bubble
JSR leave20spaces ;4th bubble is 34 spaces right
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR justBubble ;4th bubble drawn here
JSR enter1line ; Two lines between 4th bubble and fish
JSR enter1line
JSR leave5spaces ;fish located 10 spaces right
JSR leave5spaces
JSR row1bubble ;5th bubble remains aligned with top row of fish
JSR leave5spaces
JSR leave5spaces
JSR row2regular
JSR leave5spaces
JSR leave5spaces
JSR row3regular
JSR leave5spaces
JSR leave5spaces
JSR row4regular
JSR enter5lines
JSR enter1line
JSR enter1line
JSR enter1line
JSR enter1line
JSR Pause
JSR Pause

;Position 19
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR enter1line ;1 line between third bubble and fourth bubble
JSR leave20spaces ;4th bubble is 34 spaces right
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR justBubble ;4th bubble drawn here
JSR enter1line ; Two lines between 4th bubble and fish
JSR enter1line
JSR leave5spaces ;fish located 11 spaces right
JSR leave5spaces
JSR leave1space
JSR row1regular
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR row2regular
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR row3regular
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR row4regular
JSR enter5lines
JSR enter5lines
JSR Pause

;Position 20
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR enter1line ;1 line between third bubble and fourth bubble
JSR leave20spaces ;4th bubble is 34 spaces right
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR justBubble ;4th bubble drawn here
JSR enter1line ; Two lines between 4th bubble and fish
JSR enter1line
JSR leave5spaces ;fish located 12 spaces right
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR row1regular
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR row2bubble ;6th bubble begins here
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR row4regular
JSR enter5lines
JSR enter5lines
JSR Pause

;Position 21
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave5spaces ;fish located 13 spaces right
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR row1bubble ;6th bubble now aligned with top row of fish
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR row2regular
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR row4regular
JSR enter5lines
JSR enter5lines
JSR Pause

;Position 22
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces ;6th bubble is 40 spaces right
JSR leave20spaces
JSR justBubble ;6th bubble drawn here
JSR leave5spaces ;fish located 14 spaces right
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row1regular
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row2bubble ;7th bubble begins here
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row4regular
JSR enter5lines
JSR enter5lines
JSR Pause

;Position 23
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces ;6th bubble is 40 spaces right
JSR leave20spaces
JSR justBubble ;6th bubble drawn here
JSR leave5spaces ;fish located 15 spaces right
JSR leave5spaces
JSR leave5spaces
JSR row1bubble ;7th bubble now aligns with top row of fish
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR row2regular
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR row3regular
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR row4regular
JSR enter5lines
JSR enter5lines
JSR Pause

;Position 24
;Fish begins downward movement
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave5spaces ;fish located 16 spaces right
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR row1regular
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR row2bubble ;bubble 8 begins
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR row3regular
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR row4regular
JSR enter5lines
JSR enter1line
JSR enter1line
JSR enter1line
JSR enter1line
JSR Pause


;Position 25
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave5spaces ;fish located 17 spaces right
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR row1bubble; bubble 8 now aligned with top of fish
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR row2bubble ;bubble 9 begins
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR row4regular
JSR enter5lines
JSR enter1line
JSR enter1line
JSR enter1line
JSR Pause

;Position 26
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave5spaces ;fish located 18 spaces right
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR row1bubble; bubble 9 now aligned with top of fish
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR row2bubble ;bubble 10 begins
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR row4regular
JSR enter5lines
JSR enter1line
JSR enter1line
JSR Pause

;Position 27
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave5spaces ;fish located 19 spaces right
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row1bubble; bubble 10 now aligned with top of fish
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row2bubble ;bubble 11 begins
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row4regular
JSR enter5lines
JSR enter1line
JSR Pause

;Position 28
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave5spaces ;fish located 19 spaces right
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row1bubble; bubble 11 now aligned with top of fish
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row2bubble ;bubble 12 begins
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave5spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row4regular
JSR enter5lines
JSR Pause

;Position 29
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces ;fish located 20 spaces right
JSR row1bubble; bubble 12 now aligned with top of fish
JSR leave20spaces
JSR row2bubble ;bubble 13 begins
JSR leave20spaces
JSR row3regular
JSR leave20spaces
JSR row4regular
JSR enter1line
JSR enter1line
JSR enter1line
JSR enter1line
JSR Pause

;Position 30
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces ;fish located 21 spaces right
JSR leave1space
JSR row1bubble; bubble 13 now aligned with top of fish
JSR leave20spaces
JSR leave1space
JSR row2bubble ;bubble 14 begins
JSR leave20spaces
JSR leave1space
JSR row3regular
JSR leave20spaces
JSR leave1space
JSR row4regular
JSR enter1line
JSR enter1line
JSR enter1line
JSR Pause

;Position 31
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces ;fish located 22 spaces right
JSR leave1space
JSR leave1space
JSR row1bubble; bubble 14 now aligned with top of fish
JSR leave20spaces
JSR leave1space
JSR leave1space
JSR row2bubble ;bubble 15 begins
JSR leave20spaces
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave20spaces
JSR leave1space
JSR leave1space
JSR row4regular
JSR enter1line
JSR enter1line
JSR Pause

;Position 32
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces ;fish located 23 spaces right
JSR leave1space
JSR leave1space
JSR leave1space
JSR row1bubble; bubble 15 now aligned with top of fish
JSR leave20spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR row2bubble ;bubble 16 begins
JSR leave20spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave20spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR row4regular
JSR enter1line
JSR Pause

;Position 33
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces ;fish located 24 spaces right
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row1bubble; bubble 16 now aligned with top of fish
JSR leave20spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row2bubble ;bubble 17 begins
JSR leave20spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row3regular
JSR leave20spaces
JSR leave1space
JSR leave1space
JSR leave1space
JSR leave1space
JSR row4regular
JSR Pause

;Position 34
JSR enter10lines
JSR enter10lines
JSR enter10lines
JSR leave20spaces ;bubble 16 is 50 spaces right
JSR leave20spaces
JSR leave5spaces
JSR leave5spaces
JSR justBubble ;bubble 16 drawn here
JSR enter1line
JSR leave20spaces ;bubble 17 is 52 spaces right
JSR leave20spaces
JSR leave5spaces
JSR leave5spaces
JSR leave1space
JSR leave1space
JSR justBubble ;bubble 17 drawn here
JSR leave20spaces ;fish located 25 spaces right
JSR leave5spaces
JSR row1bubble ;bubble 17 now aligne with top of fish
JSR leave20spaces
JSR leave5spaces
JSR row2regular
JSR leave20spaces
JSR leave5spaces
JSR row3regular
JSR leave20spaces
JSR leave5spaces
JSR row4regular
JSR Pause

;Position 35
JSR enter10lines
JSR enter10lines
JSR enter10lines
; JSR leave20spaces ;bubble 17 is 52 spaces right
; JSR leave20spaces
; JSR leave5spaces
; JSR leave5spaces
; JSR leave1space
; JSR leave1space
; JSR justBubble ;bubble 17 drawn here
; JSR enter1line
JSR leave20spaces ;fish located 26 spaces right
JSR leave5spaces
JSR leave1space
JSR row1regular
JSR leave20spaces
JSR leave5spaces
JSR leave1space
JSR row2regular
JSR leave20spaces
JSR leave5spaces
JSR leave1space
JSR row3regular
JSR leave20spaces
JSR leave5spaces
JSR leave1space
JSR row4regular
JSR Pause

; Position 36
; JSR enter10lines
; JSR enter10lines
; JSR enter10lines
; JSR leave20spaces ;fish located 27 spaces right
; JSR leave5spaces
; JSR leave1space
; JSR leave1space
; JSR row1bubble ;bubble 18 now aligned with top of fish
; JSR leave20spaces
; JSR leave5spaces
; JSR leave1space
; JSR leave1space
; JSR row2regular
; JSR leave20spaces
; JSR leave5spaces
; JSR leave1space
; JSR leave1space
; JSR row3regular
; JSR leave20spaces
; JSR leave5spaces
; JSR leave1space
; JSR leave1space
; JSR row4regular
; JSR Pause
HALT

;************************************************************************************************************
; This subroutine draws the top row of the fish without a bubble, by loading the string in label FISHFRAME1
row1regular
	;STR R7, R1, #0
	LEA R0, FISHFRAME1
	PUTS
	;LDR R7, R1, #0
	RET

;**************************************************************************************************************
; This subroutine draws the second row of the fish without a bubble, by loading the string in label FISHFRAME2
row2regular
	;STR R7, R1, #0
	LEA R0, FISHFRAME2
	PUTS
	;LDR R7, R1, #0
	RET

;**************************************************************************************************************
; This subroutine draws the third row of the fish without a bubble, by loading the string in label FISHFRAME3
row3regular
	;STR R7, R1, #0
	LEA R0, FISHFRAME3
	PUTS
	;LDR R7, R1, #0
	RET

;**************************************************************************************************************
; This subroutine draws the bottom row of the fish without a bubble, by loading the string in label FISHFRAME4
row4regular
	;STR R7, R1, #0
	LEA R0, FISHFRAME4
	PUTS
	;LDR R7, R1, #0
	RET

;**************************************************************************************************************
;This subroutine draws the top row of the fish with a bubble, by loading the string in label FISHFRAME5
row1bubble
	LEA R0, FISHFRAME5
	PUTS
	RET

;******************************************************************************************************************************************************************
;This subroutine draws the second row of the fish with a bubble, by loading the string in label FISHFRAME6. This is when the bubble is next to the fish's mouth.
row2bubble
	LEA R0, FISHFRAME6
	PUTS
	RET

;************************************************************************************
;This subroutine draws a bubble by itself, by loading the string in the BUBBLE label
justBubble
	LEA R0, BUBBLE
	PUTS
	RET

;**********************************************************************************************************
;This subroutine is used to skip one line. It loads the string in OneLine, which is just a \n character.
enter1line
	;STR R7, R1, #0
	LEA R0, OneLine
	PUTS
	;LDR R7, R1, #0
	RET

;****************************************************************************************************************
;This subroutine is used to skip 5 lines at once. It loads the string in FiveLines, which is five \n characters.
enter5lines
	LEA R0, FiveLines
	PUTS
	RET

;**************************************************************************************************************
;This subroutine is used to skip 10 lines at once. It loads the string in TenLines, which is ten \n characters.
enter10lines
	;STR R7, R1, #0
	LEA R0, TenLines
	PUTS
	;LDR R7, R1, #0
	RET

;**************************************************************************************************************************
;This subroutine leaves 1 space by loading the string in oneSpace, which is simply a space character with no \n at the end.
leave1Space
	;STR R7, R1, #0
	LEA R0, oneSpace
	PUTS
	;LDR R7, R1, #0
	RET

;***************************************************************************************************************************
;This subroutine leaves 5 spaces by loading the string in fiveSpaces, which is five space characters with no \n at the end.
leave5Spaces
	;STR R7, R1, #0
	LEA R0, fiveSpaces
	PUTS
	;LDR R7, R1, #0
	RET

;*******************************************************************************************************************************
;This subroutine leaves 20 spaces by loading the string in twentySpaces, which is twenty space characters with no \n at the end.
leave20spaces
	;STR R7, R1, #0
	LEA R0, twentySpaces
	PUTS
	;LDR R7, R1, #0
	RET

;******************************************************************************
;This subroutine controls how quickly or how slowly the fish changes positions. 
; It works my making the program decrement a number down to zero. 
; This stalls the program until the decrementing is finished. 

Pause
        ST R7, SaveR7
        LD R2, Time

Loop    ADD R2, R2, #-1
        BRp Loop
        
        LD R7, SaveR7
        RET

SaveR7 .BLKW #1
Time .FILL #7500

;ClearTerminal
;STR R7 R1, #0
;AND R0, R0, #0 ; clear R0
;ADD R0, R0, #2 ; set R0 to 2, 
;AND R7, R7, #0
;AND R1, R1, #0
;OUT ; output R0
;LDR R7, R1, #0
;RET

;ResetCursorPos
;STR R7 R1, #0
;AND R0, R0, #0 ; clear R0
;ADD R0, R0, #0 ; set R0 to 0
;OUT ; output R0
;LDR R7, R1, #0
;RET

oneSpace .STRINGZ " "
fiveSpaces .STRINGZ "     " 
twentySpaces .STRINGZ "                    "
OneLine .STRINGZ "\n"
FiveLines .STRINGZ "\n\n\n\n\n"
TenLines .STRINGZ "\n\n\n\n\n\n\n\n\n\n"                                                
FISHFRAME1 .STRINGZ "  :.       .^^^^^^^^^:... \n"    
FISHFRAME2 .STRINGZ "  : ':---:'         0    '. \n"                           
FISHFRAME3 .STRINGZ "  :  :---:.           .**/'' \n"                          
FISHFRAME4 .STRINGZ "  :.'      '^^^^^^^^^'' \n"                


FISHFRAME5 .STRINGZ "  :.       .^^^^^^^^^:...  o \n" 

FISHFRAME6 .STRINGZ "  : ':---:'         0    '.o \n"  
                         
BUBBLE .STRINGZ "o\n"

;SaveR7 .FILL x4000
.END 
