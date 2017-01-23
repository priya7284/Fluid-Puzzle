
local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
--local utility = require( "utility" )

local params

--local myData = require( "mydata" )

local centerX = display.contentCenterX
local centerY = display.contentCenterY

local function handlePieceButtonEvent( event )
    if ( "ended" == event.phase ) then
        composer.removeScene( "puzzle", false )
        composer.gotoScene("puzzle", { effect = "crossFade", time = 333 })
    end
end

local function handleJigsawButtonEvent( event )
    if ( "ended" == event.phase ) then
    composer.removeScene( "jigsaw", false )
        composer.gotoScene("jigsaw", { effect = "crossFade", time = 333, isModal = true })
    end
end



--
-- Start the composer event handlers
--
function scene:create( event )
    local sceneGroup = self.view

    params = event.params
        
    --
    -- setup a page background, really not that important though composer
    -- crashes out if there isn't a display object in the view.
    --
    

    local background = display.newImage( "images/bg.jpg",centerX,centerY,true )
    --background.x = display.contentCenterX
    --background.y = display.contentCenterY
    sceneGroup:insert( background )

    --[[local title = display.newText("Game Title", 100, 32, native.systemFontBold, 32 )
    title.x = display.contentCenterX
    title.y = 40
    title:setFillColor( 0 )
    sceneGroup:insert( title )]]

    

    -- Create the widget
    local pieceButton = display.newImage("images/piece.png",centerX,centerY+70)
    pieceButton:scale(2,2)
    sceneGroup:insert( pieceButton )
    pieceButton:addEventListener( "touch", handlePieceButtonEvent )
    -- Create the widget
    local jigsawButton = display.newImage("images/jigsaw.png",centerX,centerY+200)
    jigsawButton:scale(2,2)
    sceneGroup:insert(jigsawButton)
    jigsawButton:addEventListener( "touch", handleJigsawButtonEvent )
    

end

function scene:show( event )
    local sceneGroup = self.view

    params = event.params
    --utility.print_r(event)

    if params then
        print(params.someKey)
        print(params.someOtherKey)
    end

    if event.phase == "did" then
        --composer.removeScene( "game" ) 
    end
end

function scene:hide( event )
    local sceneGroup = self.view
    
    if event.phase == "will" then
    end

end

function scene:destroy( event )
    local sceneGroup = self.view
    
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene
