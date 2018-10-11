-----------------------------------------------------------------------------------------
-- Title: Animating images
-- Name: Liam H
-- Course: ICS20
-- This program animates 3 images at once
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--  global variables
scrollspeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/space.png", 2048, 1536)