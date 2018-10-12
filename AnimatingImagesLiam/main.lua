-----------------------------------------------------------------------------------------
-- Title: Animating images
-- Name: Liam H
-- Course: ICS20
-- This program animates 3 images at once
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--  global variables
scrollSpeed = 2

-- background image with width and height
local backgroundImage = display.newImageRect("Images/space2.jpg", 2400, 1600) 

-- character image with width and height
local spaceship = display.newImageRect("Images/spaceship2.png",500,400)

-- set the intial x and y postion of the spaceship
spaceship.x = -1
spaceship.y = display.contentHeight/3
spaceship.alpha = -0.001
-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the spaceship
local function MoveSpaceShip(event)
	-- add the scroll speed to the x-value of the ship
	spaceship.x = spaceship.x + scrollSpeed
	-- change the transparency of the spaceship every time it moves so it fades out
	spaceship.alpha = spaceship.alpha + 0.01
end

-- Moveship will be called over and over again
Runtime:addEventListener("enterFrame", MoveSpaceShip)

local alien = display.newImageRect("Images/alien.png", 300, 200)
alien.x = 1048
alien.y = display.contentHeight/2  
--local function ScaleAlien(event)

local function MoveShip(event)	
	alien.x = alien.x - scrollSpeed
	alien.y = alien.y - scrollSpeed
end
Runtime:addEventListener("enterFrame", MoveShip)

local rocketShip = display.newImageRect("Images/rocket2.png",300, 200)
rocketShip.x = 0
rocketShip.y = display.contentHeight/-4

transition.to( rocketShip, { rotation = rocketShip.rotation-360, time=4000, onComplete=spinImage})
transition.to(rocketShip, {x= 1024, y=384, time=4000})


