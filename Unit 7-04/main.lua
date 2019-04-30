display.setDefault ( "background", 53/255, 235/255, 242/255)


local physics = require( "physics" )


physics.start()
physics.setGravity( 0, 25 ) 
physics.setDrawMode( "hybrid" ) 


local leftWall = display.newRect( 0, display.contentHeight / 2, 1, display.contentHeight )
-- myRectangle.strokeWidth = 3
-- myRectangle:setFillColor( 0.5 )
-- myRectangle:setStrokeColor( 1, 0, 0 )
leftWall.alpha = 0.0
physics.addBody( leftWall, "static", { 
    friction = 1 , 
    bounce = 0.2 
    } )


local rightWall = display.newRect( 320, display.contentHeight / 2, 1, display.contentHeight )
-- myRectangle.strokeWidth = 3
-- myRectangle:setFillColor( 0.5 )
-- myRectangle:setStrokeColor( 1, 0, 0 )
rightWall.alpha = 0.0
physics.addBody( rightWall, "static", { 
    friction = 1 , 
    bounce = 0.2 
    } )
	


local theGround = display.newImage( "./assets/sprites/land.png" )
theGround.x = display.contentCenterX
theGround.y = 500
theGround.id = "the ground"
physics.addBody( theGround, "static", { 
    friction = 0.5, 
    bounce = 0.4 } ) 


local dpad = display.newImageRect ("assets/sprites/d-pad.png", 150, 150 )
dpad.x = 160
dpad.y = 150
dpad.id = "d-pad"


local UpArrow = display.newImageRect ("assets/sprites/upArrow.png", 35, 29)
UpArrow.x = 160
UpArrow.y = 97
UpArrow.id = "Up Arrow"


local DownArrow = display.newImageRect ("assets/sprites/downArrow.png", 35, 29)
DownArrow.x = 160
DownArrow.y = 203
DownArrow.id = "Down Arrow"


local RightArrow = display.newImageRect ("assets/sprites/rightArrow.png", 25, 34 )
RightArrow.x = 215
RightArrow.y = 150 
RightArrow.id = "Right Arrow"


local LeftArrow = display.newImageRect ("assets/sprites/leftArrow.png", 25, 34)
LeftArrow.x = 105
LeftArrow.y = 150
LeftArrow.id = "Left Arrow"

local TheCharacter = display.newImageRect ("assets/sprites/character.png", 150, 175)
TheCharacter.x = 160
TheCharacter.y = 150
TheCharacter.id = "The Character"
physics.addBody( TheCharacter, "dynamic", { 
    density = 0.1, 
    friction = 0.5, 
    bounce = 0.03 
    } )

TheCharacter.isFixedRotation = true


local jumpButton = display.newImage ( "assets/sprites/jumpButton.jpg", 25, 50)
jumpButton.x = 250
jumpButton.y = 80
jumpButton.id = "jump button"
jumpButton.alpha = 0.5


function UpArrowTouch( event )
	 if ( event.phase == "ended" ) then
         transition.moveBy( TheCharacter, { 
         x = 0, 
         y = -50, 
         time = 100 } )        	

  end
return true

end

 

 function DownArrowTouch( event )
 	 if ( event.phase == "ended" ) then
 	     transition.moveBy ( TheCharacter ,  { 
         x = 0, 
         y = 50, 
         time = 100 } )
 	      
 end

return true

end 


function RightArrowTouch( event )
	if (event.phase == "ended" ) then
	     transition.moveBy (TheCharacter ,  {
         x = 50,
         y = 0, 
          time = 100 } )
           
end

return true 

end

function LeftArrowTouch( event )
	if (event.phase == "ended" ) then
	     transition.moveBy (TheCharacter ,  {
	     x = -50,
	     y = 0, 
	     time = 100 } )
	      

end

return true 

end

function jumpButton:touch( event )
  if ( event.phase == "ended" ) then
  TheCharacter:setLinearVelocity( 0, -750 )

  end

  return true

 end

 function checkCharacterPosition( event )
if TheCharacter.y > display.contentHeight + 500 then

        TheCharacter.x = display.contentCenterX - 200

        TheCharacter.y = display.contentCenterY

    end
 end


UpArrow:addEventListener ("touch" , UpArrowTouch)

DownArrow:addEventListener ("touch", DownArrowTouch)

RightArrow:addEventListener ("touch", RightArrowTouch)

LeftArrow: addEventListener ("touch", LeftArrowTouch)

jumpButton:addEventListener ("touch", jumpButtonTouch)

Runtime:addEventListener ("enterFrame", checkCharacterPosition)





