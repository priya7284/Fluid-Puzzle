-- slideView.lua
-- 
-- Version 1.0 
--
-- Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of 
-- this software and associated documentation files (the "Software"), to deal in the 
-- Software without restriction, including without limitation the rights to use, copy, 
-- modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
-- and to permit persons to whom the Software is furnished to do so, subject to the 
-- following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in all copies 
-- or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
-- PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
-- FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
-- OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
-- DEALINGS IN THE SOFTWARE.

module(..., package.seeall)
local composer = require( "composer" )
local screenW, screenH = display.contentWidth, display.contentHeight
local viewableScreenW, viewableScreenH = display.viewableContentWidth, display.viewableContentHeight
local screenOffsetW, screenOffsetH = display.contentWidth -  display.viewableContentWidth, display.contentHeight - display.viewableContentHeight

local imgNum = nil
local images = nil
local touchListener, nextImage, prevImage, cancelMove, initImage, tapListener,homeTouchListener 
local background,left,homeButton
local imageNumberText, imageNumberTextShadow, instructionText
-------------------------------------------------------
--Initializing ads
local ads = require( "ads" )
local bannerAppID = "ca-app-pub-7802290325140609/2970235175"  --for your iOS banner
if ( system.getInfo( "platformName" ) == "Android" ) then
    bannerAppID = "ca-app-pub-nnnnnnnnnnn/nnnnnnnnn"  --for your Android banner
end
 
local adProvider = "admob"
local function adListener( event )
    -- The 'event' table includes:
    -- event.name: string value of "adsRequest"
    -- event.response: message from the ad provider about the status of this request
    -- event.phase: string value of "loaded", "shown", or "refresh"
    -- event.type: string value of "banner" or "interstitial"
    -- event.isError: boolean true or false
 
    local msg = event.response
    -- Quick debug message regarding the response from the library
    print( "Message from the ads library: ", msg )
 
    if ( event.isError ) then
        print( "Error, no ad received", msg )
    else
        print( "Ah ha! Got one!" )
    end
end
 
ads.init( adProvider, appID, adListener )
------------------------------------------------------

function new( imageSet, slideBackground, top, bottom, btnIndex )	
	local pad = 20
	local top = top or 0 
	local bottom = bottom or 0

	local g = display.newGroup()
	
	if slideBackground then
		background = display.newImage(slideBackground, 0, 0, true)
		local screen_adjustment = 2

		background.xScale = (screen_adjustment  * background.contentWidth)/background.contentWidth
		background.yScale = background.xScale
		background.x = display.contentWidth / 2
		background.y = display.contentHeight / 2
	else
		background = display.newRect( 0, 0, screenW, screenH-(top+bottom) )

		-- set anchors on the background
		background.anchorX = 0
		background.anchorY = 0

		background:setFillColor(0, 0, 0)
	end
	g:insert(background)
	
	images = {}
	for i = 1,#imageSet do
		local p = display.newImage(imageSet[i])
		
		local h = viewableScreenH-(top+bottom)
		if p.width > viewableScreenW or p.height > h then
			if p.width/viewableScreenW > p.height/h then 
					p.xScale = viewableScreenW/p.width
					p.yScale = viewableScreenW/p.width
			else
					p.xScale = h/p.height
					p.yScale = h/p.height
			end		 
		end
		p:setStrokeColor(gray)
		p.strokeWidth=20
		g:insert(p)
	    
		if (i > 1) then
			p.x = screenW*1.5 +pad-- all images offscreen except the first one
		else 
			p.x = screenW*.5
		end

		
		p.y = h*.5

		images[i] = p
		

	end

	print("inserted images")
	
	local instructionString="Swipe to select a picture.."
	instructionText= display.newText(instructionString,display.contentCenterX+50,display.contentCenterY-515,native.systemFontBold,40)
	instructionText:setFillColor( 0,0,0 )
	g:insert(instructionText)

   -- homeButton=display.newImageRect("images/home.png",100,100)
   -- homeButton.x= display.contentCenterX
    --homeButton.y=display.contentCenterY-515
    --homeButton:addEventListener( "touch",onHomeTouch)
   -- g:insert( homeButton)

    left=display.newImageRect("images/left.png",100,100)
    left.x=100
    left.y=80
	g:insert(left)
	local defaultString = "1 of " .. #images

	local navBar = display.newGroup()
	g:insert(navBar)
	
	local navBarGraphic = display.newImage("navBar.png", 0, 0, false)
	navBar:insert(navBarGraphic)
	navBarGraphic.x = viewableScreenW*.5
	navBarGraphic.y = 0
			
	imageNumberText = display.newText(defaultString, 0, 0, native.systemFontBold, 28)
	imageNumberText:setFillColor(0,0,0)
	imageNumberTextShadow = display.newText(defaultString, 0, 0, native.systemFontBold, 28)
	imageNumberTextShadow:setFillColor(0, 0, 0)
	navBar:insert(imageNumberTextShadow)
	navBar:insert(imageNumberText)
	imageNumberText.x = navBar.width*.5
	imageNumberText.y = navBarGraphic.y
	imageNumberTextShadow.x = imageNumberText.x - 1
	imageNumberTextShadow.y = imageNumberText.y - 1
	
	navBar.y = math.floor(navBar.height*0.5)

	imgNum = 1
	
	g.x = 0
	g.y = top + display.screenOriginY
		
	--[[function homeTouchListener(self,touch)
		print"im in homeTouchListener"
		composer.gotoScene("menu")
    	g:removeSelf() 
	end--]]

	function leftTouchListener(self,touch)
		g:removeSelf( )
		
		composer.gotoScene( "menu" )
		
	end
 
	function touchListener (self, touch) 
		local phase = touch.phase
		print("slides", phase)
		if ( phase == "began" ) then
            -- Subsequent touch events will target button even if they are outside the contentBounds of button
            display.getCurrentStage():setFocus( self )
            self.isFocus = true

			startPos = touch.x
			prevPos = touch.x
			print ("beganphase")
			transition.to( navBar,  { time=200, alpha=math.abs(navBar.alpha-1) } )
			--[[if(startPos == prevPos) then
				g:removeSelf( )
				composer.gotoScene( "jigsaw" )
			end--]]

        elseif( self.isFocus ) then
        
			if ( phase == "moved" ) then
			print("self.isFocusmoved")
				transition.to(navBar,  { time=400, alpha=0 } )
						
				if tween then transition.cancel(tween) end
	
				print(imgNum)
				
				local delta = touch.x - prevPos
				prevPos = touch.x
				
				images[imgNum].x = images[imgNum].x + delta
				
				if (images[imgNum-1]) then
					images[imgNum-1].x = images[imgNum-1].x + delta
				end
				
				if (images[imgNum+1]) then
					images[imgNum+1].x = images[imgNum+1].x + delta
				end

			elseif ( phase == "ended" or phase == "cancelled" ) then
				print("in ended or cancelled")
				dragDistance = touch.x - startPos
				print("dragDistance: " .. dragDistance)
				--[[local options =
					{
						effect = "zoomOutInFadeRotate",
						time = 400,
						params =
							{
								
								sample_var = imgNum
							}
					}--]]
					local customParams={
						sample_var = imgNum
					}
				if(dragDistance == 0 ) then
					print("imagenum is ",imgNum )
					g:removeSelf( )
					
					if (btnIndex == 1) then
						composer.gotoScene( "puzzle", {effect="zoomOutInFadeRotate", time=400,params=customParams})
					else
						composer.gotoScene( "jigsaw",{effect="zoomOutInFadeRotate", time=400,params=customParams})
					end
				end
				if (dragDistance < -40 and imgNum < #images) then
					nextImage()
				elseif (dragDistance > 40 and imgNum > 1) then
					prevImage()
				else
					cancelMove()
				end
									
				if ( phase == "cancelled" ) then		
					cancelMove()
				end

                -- Allow touch events to be sent normally to the objects they "hit"
                display.getCurrentStage():setFocus( nil )
                self.isFocus = false

														
			end
		end
					
		return true
		
	end
	
	function setSlideNumber()
		print("setSlideNumber", imgNum .. " of " .. #images)
		imageNumberText.text = imgNum .. " of " .. #images
		imageNumberTextShadow.text = imgNum .. " of " .. #images

	end
	
	function cancelTween()
		if prevTween then 
			transition.cancel(prevTween)
		end
		prevTween = tween 
	end
	
	function nextImage()
		tween = transition.to( images[imgNum], {time=400, x=(screenW*.5 + pad)*-1, transition=easing.outExpo } )
		tween = transition.to( images[imgNum+1], {time=400, x=screenW*.5, transition=easing.outExpo } )
		imgNum = imgNum + 1
		initImage(imgNum)
	end
	
	function prevImage()
		tween = transition.to( images[imgNum], {time=400, x=screenW*1.5+pad, transition=easing.outExpo } )
		tween = transition.to( images[imgNum-1], {time=400, x=screenW*.5, transition=easing.outExpo } )
		imgNum = imgNum - 1
		initImage(imgNum)
	end
	
	function cancelMove()
		tween = transition.to( images[imgNum], {time=400, x=screenW*.5, transition=easing.outExpo } )
		tween = transition.to( images[imgNum-1], {time=400, x=(screenW*.5 + pad)*-1, transition=easing.outExpo } )
		tween = transition.to( images[imgNum+1], {time=400, x=screenW*1.5+pad, transition=easing.outExpo } )
	end
	
	function initImage(num)
		if (num < #images) then
			images[num+1].x = screenW*1.5 + pad			
		end
		if (num > 1) then
			images[num-1].x = (screenW*.5 + pad)*-1
		end
		setSlideNumber()
	end

	background.touch = touchListener
	background:addEventListener( "touch", background )

--	homeButton.touch=homeTouchListener
--	homeButton:addEventListener( "touch", homeButton )
	left.touch=leftTouchListener
	left:addEventListener( "touch", left )
	
	--images.tap=taplistener
	--images.touch=touchListener
	--images:addEventListener( "tap", images )

	------------------------
	-- Define public methods
	
	function g:jumpToImage(num)
		local i
		print ("num " , num)
		print("jumpToImage")
		print("#images", #images)
		for i = 1, #images do

			if i < num then
				images[i].x = -screenW*.5;
			elseif i > num then
				images[i].x = screenW*1.5 + pad
			else
				images[i].x = screenW*.5 - pad
			end
		end
		imgNum = num
		initImage(imgNum)
	end

	function g:cleanUp()
		print("slides cleanUp")

		
		background:removeEventListener("touch", touchListener)
		instructionText:removeSelf( )
		instructionString:removeSelf( )
		background:removeSelf( )
	end

		ads.show( "banner", { x=0, y=100000, appId="ca-app-pub-7802290325140609/2970235175" } )


	return g	
end

