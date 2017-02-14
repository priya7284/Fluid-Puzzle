
local composer = require( "composer" )
 local slideView = require("slideView") 
local scene = composer.newScene()

local widget = require( "widget" )
--local utility = require( "utility" )
local slideView = require("slideView")
local params

--local myData = require( "mydata" )
local gameMusicChannel
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local myGlobalSoundToggle, gameMusic 
local musicButtonOn,musicButttonOff

local function handlePieceButtonEvent( event )
    if ( "ended" == event.phase ) then
        composer.removeScene( "puzzle", false )
        --composer.gotoScene("puzzle", { effect = "crossFade", time = 333 })
        local pieceImages = {
    "images/img01_org.png",
    "images/cow/cow_org.png",
    "images/chicken/chicken_org.png",
    "images/crocodile/crocodile_org.png",
    "images/dog/dog_org.png",
    "images/fish/fish_org.png",
    "images/sheep/sheep_org.png",
    "images/hippo/hippo_org.png",
    "images/img03_org.png"
    }       

local s=slideView.new( pieceImages,"bg.jpg",0,0, 1)

    end
end

local function handleJigsawButtonEvent( event )
    if ( "ended" == event.phase ) then
    composer.removeScene( "jigsaw", false )
   --local bg = display.newImage("bg.jpg", true)


    
local myImages = {
    "images/pig_resize.png",
    "images/dolphin_resize.png",
    "images/kids_resize.png",
    "images/icecream_resize.png",
    "images/squirrels_resize.png",
    "images/camping_resize.png",
    "images/kidsplaying_resize.png",
    "images/rainbow_resize.png",
    "images/kidsrunning_resize.png",
    "images/threeboys_resize.png",
    "images/manrunning_resize.png",
     "images/kidsandschool_resize.png",
     "images/kidsstudy_resize.png",
    "images/tree_resize.png",
    "images/zebra_resize.png",
    "images/spider_resize.png",
    "images/owl_resize.png",
    "images/happylion_resize.png",
     "images/frog_resize.png",
     "images/elephant_resize.png",
     "images/duck_resize.png",
     "images/dino_resize.png",
     "images/crab_resize.png",
     "images/chicken_resize.png",
     "images/bear_resize.png",
     "images/lion_resize.png",
     "images/horse_resize.png",
     "images/hedgehog_resize.png",
     "images/penguin_resize.png"
    
}   
    

local s=slideView.new( myImages,"bg.jpg",0,0, 2)



    --composer.removeScene( "jigsaw", false )
        --composer.gotoScene("jigsaw", { effect = "crossFade", time = 333, isModal = true })
    end
end

local function handlemusicButtonEvent(event)
    if ( "ended" == event.phase ) then
    


    musicButtonOn.isVisible =  not musicButtonOn.isVisible
    musicButtonOff.isVisible =  not musicButtonOff.isVisible
    myGlobalSoundToggle = musicButtonOn.isVisible
    if (not myGlobalSoundToggle) then
        audio.stop(gameMusicChannel)

    else
        audio.play( gameMusic, { loops = -1 } )
    end 
    --return true
end 



end

--
-- Start the composer event handlers
--
function scene:create( event )
    
    local sceneGroup = self.view

    params = event.params
        gameMusic = audio.loadStream( "backgroundMusic.wav" )
 
-- Play the music
 gameMusicChannel = audio.play( gameMusic, { loops = -1 } ) 
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

     musicButtonOn=display.newImage( "images/m.png",centerX-320,centerY+300 )
    musicButtonOn:scale(1,0.75)
    sceneGroup:insert(musicButtonOn)
    musicButtonOn:addEventListener( "touch", handlemusicButtonEvent )
    musicButtonOn.isVisible=true
     myGlobalSoundToggle=true
     musicButtonOff =display.newImage("images/m1.png",centerX-320,centerY+300)
     musicButtonOff:scale(1,0.75)
    sceneGroup:insert(musicButtonOff)
    musicButtonOff:addEventListener( "touch", handlemusicButtonEvent )
musicButtonOff.isVisible = false

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
