-----------------------------------------------------------------------------------------
-- Title: Animating images
-- Name: Liam H
-- Course: ICS20
-- This program animates 3 images at once
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--  global variables
scrollSpeed = 5

-- background image with width and height
local backgroundImage = display.newImageRect("Images/space2.jpg", 2400, 1600) 

-- character image with width and height
local spaceship = display.newImageRect("Images/spaceship2.png",500,400)

-- set the intial x and y postion of the spaceship
spaceship.x = 0
spaceship.y = display.contentHeight/3
spaceship.alpha = 1
-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the spaceship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	spaceship.x = spaceship.x + scrollSpeed
	-- change the transparency of the spaceship every time it moves so it fades out
	spaceship.alpha = spaceship.alpha + 0.01
end

-- Moveship will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)
