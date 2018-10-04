-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- make the rounded rectangle
local newRoundedRect = display.newRoundedRect(100,250, 100,100, 20)

display.setStatusBar(display.HiddenStatusBar)
 display.setDefault("background", 250/255, 67/255, 190/255)
 local textObject
 textObject = display.newText( "Rounded " , 100, 450, nil, 75)
  textObject = display.newText( "rectangle " , 100, 550, nil, 75)
  texObject = display.newText ( "Triangle " , 950, 400, nil, 75 )
local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5
 
local vertices = { 0,-110, 27,-35, 105,-35, 43,16, 65,90, 0,45, -65,90, -43,15, -105,-35, -27,-35, }
 -- make the polygon
 

local o = display.newPolygon( halfW, halfH, vertices )
o.strokeWidth = 0
-- set the stroke colour
o:setFillColor( 70/255, 67/255, 200/255 )
newRoundedRect:setFillColor(70/255, 67/255, 200/255)
textObject = display.newText( "Star " , 520, 575, nil, 75)

-- Making the triangle
local halfW = display.contentWidth * 0.90
local halfH = display.contentHeight * 0.35
 
local vertices = { 100,-210, 127,-135, 205,-135,}
 
local o = display.newPolygon( halfW, halfH, vertices )
o:setFillColor(70/255,67/255,200/255)
o.strokeWidth = 10
o:setStrokeColor( 70/255, 67/255, 200/255 )

