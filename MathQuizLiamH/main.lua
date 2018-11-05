-----------------------------------------------------------------------------------------
-- This project is a math game that makes a spound when you get it wrong and a sound when yuou get it right.
-- 
--
-----------------------------------------------------------------------------------------


-- hie the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 150/255, 0/255, 30/255)

-----------------------------------------------------------
--Local variables
-----------------------------------------------------------

local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local randomNumber3
local randomNumber4
local randomNumber5
local randomNumber6
local userAnswer
local correctAnswer
local randomOperator
local incorrectAnswer

local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer
local gameOver
local win

local lives = 3
local heart1
local heart2
local heart3
local points = 0
local textObject
local pointsText


----------------------------------------------------------------------
--SOUNDS
----------------------------------------------------------------------
local winSound
local loseSound
local wrongSound
local wrongSoundChannel
local correctSound
local correctSoundChannel
wrongSound = audio.loadSound( "Sounds/buzzer.mp3")
correctSound = audio.loadSound( "Sounds/magical.mp3")
loseSound = audio.loadSound( "Sounds/lose.mp3")
winSound = audio.loadSound( " Sounds/winSound1.mp3")

-----------------------------------------------------
-- local functions
-----------------------------------------------------


local function AskQuestion()
	--generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(1,10)
	randomNumber2 = math.random(1,10)
	randomNumber3 = math.random(1,20)
	randomNumber4 = math.random(1,20)
	randomNumber5 = math.random(1,100)
	randomNumber6 = math.random(1,100)
	randomOperator = math.random(1,4)

	-- make addition
	if (randomOperator == 1) then
		correctAnswer = randomNumber1 + randomNumber2
		-- create question in text object
		--questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
 	-- make subtraction
   elseif (randomOperator == 2) then
   		correctAnswer = randomNumber3 - randomNumber4
   
   	if (randomNumber1 < randomNumber2) then 
   		correctAnswer = randomNumber3 - randomNumber4
   		questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
	else 
		correctAnswer = randomNumber3 - randomNumber4
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
	-- make multiplication
		end
    elseif (randomOperator == 3) then
    	correctAnswer = randomNumber1 * randomNumber2
    	questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
		-- make division
    elseif (randomOperator == 4 ) then 
    	correctAnswer = randomNumber5 / randomNumber6
    	questionObject.text = randomNumber5 .. " / " .. randomNumber6 .. " = "
    end
end


local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function Win()
	-- create the win screen if you get 5 points
	if ( points == 5 ) then 
		win.isVisible = true
        win.x = display.contentWidth/2
        win.y = display.contentHeight/2
		numericField.isVisible = false
		audio.play(winSound)
	end
end


local function DecreaseLives()
	
	if (lives == 3) then
		heart3.isVisible = true
		heart2.isVisible = true
		heart1.isVisible = true
		AskQuestion()
		secondsLeft = totalSeconds
	elseif (lives == 2) then
		heart3.isVisible = false
		heart2.isVisible = true
		heart1.isVisible = true
		AskQuestion()
		secondsLeft = totalSeconds
	elseif (lives == 1) then
		heart3.isVisible = false
		heart2.isVisible = false
		heart1.isVisible = true
		AskQuestion()
		secondsLeft = totalSeconds

	elseif (lives == 0) then
		heart3.isVisible = false
		heart2.isVisible = false
		heart1.isVisible = false
		gameOver.isVisible = true
        gameOver.x = display.contentWidth/2
        gameOver.y = display.contentHeight/2
        numericField.isVisible = false
        AskQuestion()
        secondsLeft = totalSeconds
        audio.play(loseSound)
	end
end


local function NumericFieldListener( event )

	-- user begins editing "numericField"
	if ( event.phase == "began" ) then
		event.target.text = ""

		-- clear text field
		

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			secondsLeft = totalSeconds
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)
			event.target.text = ""
			correctSoundChannel = audio.play(correctSound)
			points = points + 1 
			pointsText.text = " Points = " .. points
			Win()

		-- if they get the answer wrong
		else 
			incorrectObject.isVisible = true
			timer.performWithDelay(2000, HideIncorrect)
			event.target.text = ""
			wrongSoundChannel = audio.play(wrongSound)
			lives = lives - 1
			DecreaseLives()
		end
    end
end
	




local function UpdateTime()

	--decrement the number of seconds
	secondsLeft = secondsLeft - 1

	--displah the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1
		DecreaseLives()
	end
end



local function StartTimer()
	-- create countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

local function Win()
	-- create the win screen if you get 5 points
	if ( points == 5 ) then 
		win.isVisible = true
        win.x = display.contentWidth/2
        win.y = display.contentHeight/2
		numericField.isVisible = false
	end
end


	








-----------------------------------------------------------------------------
-- Object creation
-----------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2,nil,50)
questionObject:setTextColor(1/255, 1/255, 1/255)

--create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2,  display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(1/255, 1/255, 1/255)
correctObject.isVisible = false


-- create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

-- display the points text
pointsText = display.newText( "Points " .. points, 100, 25, nil, 50)

-- display the text for timer
clockText = display.newText( "Seconds left " .. totalSeconds, 200, 75, nil, 50)


incorrectObject = display.newText( "Incorrect!", display.contentWidth/2,  display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(50/255, 60/255, 70/255)
incorrectObject.isVisible = false

gameOver = display.newImageRect( "Images/gameOver.png", display.contentWidth, display.contentHeight )
gameOver.isVisible = false

heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7


-- if you win
win = display.newImageRect("Images/win.jpg", display.contentWidth, display.contentHeight )
win.isVisible = false
winSound = 
--------------------------------------------------------------------
--Call the functions
--------------------------------------------------------------------


AskQuestion()
HideIncorrect()
UpdateTime()
StartTimer()