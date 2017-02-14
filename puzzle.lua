

local composer = require( "composer" )
local slideView = require("slideView")
local ads= require("ads")
local bannerAppID="ca-app-pub-7802290325140609/2970235175"
local interstetialAppID="ca-app-pub-7802290325140609/2665208374"
local adProvider="admob"
local unusedWidth     = display.actualContentWidth - display.contentWidth
local unusedHeight    = display.actualContentHeight - display.contentHeight
local left            = 0 - unusedWidth/2
local top             = 0 - unusedHeight/2
local right           = display.contentWidth + unusedWidth/2
local bottom          = display.contentHeight + unusedHeight/2
local num
local background
local leftTouched=false
local scene = composer.newScene()

-------------------------------------------------------
--Initializing ads
local ads = require( "ads" )
local bannerAppID = "ca-app-pub-7802290325140609/2970235175"  --for your iOS banner
if ( system.getInfo( "platformName" ) == "Android" ) then
    bannerAppID = "ca-app-pub-nnnnnnnnnnn/nnnnnnnnn"  --for your Android banner
end
 
local adProvider = "admob"
local function adListener( event )
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

 
local widget = require( "widget" );
local isAndroid = "Android" == system.getInfo("platformName")
--local soundID=media.newEventSound("CLUCK.wav")


--system.activate( "multitouch" )



local ctrVar=0;
local total_images = 0;
local img_table = {};
local create_puzzle




img_table[total_images] =
	
	{name="images/img01.png",
	 arguments={
		{ x=200, y=380,   targetX=436, targetY=371, img="images/img01_p01.png" },
		{ x=420, y=260,   targetX=377, targetY=584, img="images/img01_p02.png" },
		{ x=650, y=250,   targetX=554, targetY=473, img="images/img01_p03.png" },
	    { x=200, y=930,  targetX=201, targetY=590, img="images/img01_p04.png" },
	    { x=600, y=900,  targetX=478, targetY=413, img="images/img01_p05.png" }
    	}
	};
total_images = total_images + 1;


img_table[total_images] = 
{name="images/cow/cow_canvas.png",
arguments={
{x=300, y=150, targetX=184, targetY=337, img="images/cow/cow_p1.png"},
{x=500, y=250, targetX=349, targetY=385, img="images/cow/cow_p2.png"},
{x=650, y=475, targetX=550, targetY=325, img="images/cow/cow_p3.png"},
{x=150, y=780, targetX=438, targetY=541, img="images/cow/cow_p4.png"},
{x=150, y=720, targetX=229, targetY=540, img="images/cow/cow_p5.png"},
{x=350, y=1020, targetX=202, targetY=237, img="images/cow/cow_p6.png"},
{x=550, y=1080, targetX=263, targetY=145, img="images/cow/cow_p7.png"},
{x=700, y=1080, targetX=116, targetY=139, img="images/cow/cow_p8.png"},
{x=650, y=1020, targetX=105, targetY=216, img="images/cow/cow_p9.png"},
}
};
total_images = total_images + 1


img_table[total_images] = 
{name="images/chicken/chicken_canvas.png",
arguments={
{x=600, y=1020, targetX=319, targetY=519, img="images/chicken/chicken_p1.png"},
{x=650, y=240, targetX=284, targetY=515, img="images/chicken/chicken_p2.png"},
{x=250, y=240, targetX=351, targetY=367, img="images/chicken/chicken_p3.png"},
{x=220, y=1020, targetX=313, targetY=371, img="images/chicken/chicken_p4.png"},
{x=475, y=1020, targetX=527, targetY=249, img="images/chicken/chicken_p5.png"},
{x=702, y=1020, targetX=162, targetY=126, img="images/chicken/chicken_p6.png"},
{x=120, y=440, targetX=98, targetY=317, img="images/chicken/chicken_p7.png"},
{x=470, y=240, targetX=185, targetY=260, img="images/chicken/chicken_p8.png"},
{x=90, y=900, targetX=57, targetY=242, img="images/chicken/chicken_p9.png"},
}
};
total_images = total_images + 1

img_table[total_images] = 
{name="images/crocodile/crocodile_canvas.png",
arguments={
{x=600, y=1020, targetX=117, targetY=555, img="images/crocodile/crocodile_p1.png"},
{x=650, y=240, targetX=405, targetY=453, img="images/crocodile/crocodile_p2.png"},
{x=250, y=240, targetX=484, targetY=333, img="images/crocodile/crocodile_p3.png"},
{x=220, y=1020, targetX=306, targetY=527, img="images/crocodile/crocodile_p4.png"},
{x=400, y=1020, targetX=223, targetY=538, img="images/crocodile/crocodile_p5.png"},
}
};
total_images = total_images + 1

img_table[total_images] = 
{name="images/dog/dog_canvas.png",
arguments={
{x=600, y=1020, targetX=384, targetY=383, img="images/dog/dog_p1.png"},
{x=650, y=240, targetX=341, targetY=495, img="images/dog/dog_p2.png"},
{x=250, y=240, targetX=298, targetY=613, img="images/dog/dog_p3.png"},
{x=220, y=1020, targetX=364, targetY=623, img="images/dog/dog_p4.png"},
{x=400, y=1020, targetX=180, targetY=608, img="images/dog/dog_p5.png"},
}
};
total_images = total_images + 1

img_table[total_images] = 
{name="images/fish/fish_canvas.png",
arguments={
{x=600, y=900, targetX=255, targetY=425, img="images/fish/fish_p1.png"},
{x=550, y=240, targetX=446, targetY=223, img="images/fish/fish_p2.png"},
{x=250, y=240, targetX=145, targetY=482, img="images/fish/fish_p3.png"},
{x=175, y=900, targetX=463, targetY=337, img="images/fish/fish_p4.png"},
{x=400, y=900, targetX=339, targetY=345, img="images/fish/fish_p5.png"},
}
};
total_images = total_images + 1

img_table[total_images] = 
{name="images/sheep/sheep_canvas.png",
arguments={
{x=575, y=1020, targetX=358, targetY=346, img="images/sheep/sheep_p1.png"},
{x=650, y=240, targetX=456, targetY=526, img="images/sheep/sheep_p2.png"},
{x=250, y=240, targetX=420, targetY=531, img="images/sheep/sheep_p3.png"},
{x=220, y=1020, targetX=295, targetY=520, img="images/sheep/sheep_p4.png"},
{x=320, y=1020, targetX=261, targetY=523, img="images/sheep/sheep_p5.png"},
{x=602, y=375, targetX=166, targetY=279, img="images/sheep/sheep_p6.png"},
{x=120, y=340, targetX=288, targetY=212, img="images/sheep/sheep_p7.png"},
{x=470, y=240, targetX=65, targetY=179, img="images/sheep/sheep_p8.png"},
{x=120, y=900, targetX=184, targetY=164, img="images/sheep/sheep_p9.png"},
}
};
total_images = total_images + 1

img_table[total_images] = 
{name="images/hippo/hippo_canvas.png",
arguments={
{x=602, y=1020, targetX=531, targetY=364, img="images/hippo/hippo_p1.png"},
{x=650, y=240, targetX=301, targetY=517, img="images/hippo/hippo_p2.png"},
{x=340, y=240, targetX=239, targetY=529, img="images/hippo/hippo_p3.png"},
{x=220, y=1020, targetX=415, targetY=413, img="images/hippo/hippo_p4.png"},
{x=470, y=1020, targetX=203, targetY=490, img="images/hippo/hippo_p5.png"},
{x=602, y=375, targetX=193, targetY=397, img="images/hippo/hippo_p6.png"},
{x=120, y=340, targetX=203, targetY=278, img="images/hippo/hippo_p7.png"},
{x=470, y=240, targetX=282, targetY=229, img="images/hippo/hippo_p8.png"},
{x=750, y=1020, targetX=129, targetY=225, img="images/hippo/hippo_p9.png"},
}
};
total_images = total_images + 1

img_table[total_images] =
	{name="images/img03.png",
	 arguments={
	 	{ x=600, y=1020,  targetX=89,  targetY=276, img="images/img03_p01.png" },
		{ x=650, y=240,   targetX=210, targetY=247, img="images/img03_p02.png" },
		{ x=380, y=140,   targetX=385, targetY=415, img="images/img03_p03.png" },
	    { x=320, y=1020,  targetX=401, targetY=435, img="images/img03_p04.png" },
	    { x=525, y=1020,  targetX=87,  targetY=446, img="images/img03_p05.png" },
		{ x=702, y=1020,  targetX=129, targetY=464, img="images/img03_p06.png" },
	    { x=120, y=1020,  targetX=193, targetY=522, img="images/img03_p07.png" },
	    { x=470, y=1020,  targetX=199, targetY=528, img="images/img03_p08.png" }
    	}
	};
total_images = total_images + 1;





local img_index=0
local myGroup,g
local doneMsg;


local lock_target = 100;


local totalDone = 0;
local totalPieces = 0;
local isPuzzleDone = false;

local xOffset = 62;
local yOffset = 150;
--local bg = display.newImage("bg.jpg", true)

	
			

local function onTouch( event )
	local t = event.target
	local phase = event.phase

	if "began" == phase then
		-- Make target the top-most object
		local parent = t.parent
		parent:insert( t )
		display.getCurrentStage():setFocus( t, event.id )

		-- Spurious events can be sent to the target, e.g. the user presses 
		-- elsewhere on the screen and then moves the finger over the target.
		-- To prevent this, we add this flag. Only when it's true will "move"
		-- events be sent to the target.
		t.isFocus = true

		-- Store initial position
		t.x0 = event.x - t.x
		t.y0 = event.y - t.y
	elseif t.isFocus then
		if "moved" == phase then
			-- Make object move (we subtract t.x0,t.y0 so that moves are
			-- relative to initial grab point, rather than object "snapping").
			t.x = event.x - t.x0
			t.y = event.y - t.y0
			if (t.x <0) and (t.y > display.contentHeight) then
				t.x=0
				t.y=display.contentHeight

			elseif (t.x <0) and (t.y<0) then
				t.x=0
				t.y=0

			elseif(t.x > display.contentWidth) and (t.y <0) then
				t.x=display.contentWidth
				t.y=0
			elseif (t.x > display.contentWidth) and (t.y > display.contentHeight) then
				t.x=display.contentWidth
				t.y=display.contentHeight
			elseif (t.x < 0) then
				t.x=0
			elseif (t.y<0) then
				t.y=0
			elseif (t.x>display.contentWidth) then
				t.x =display.contentWidth
			elseif (t.y > display.contentHeight) then
				t.y=display.contentHeight
			
			end



		elseif "ended" == phase or "cancelled" == phase then
		targetX=t.targetX + xOffset
		targetY=t.targetY + yOffset
		Xcoord=math.pow( (targetX-t.x), 2 )
			Ycoord=math.pow((targetY-t.y),2)
			dist=math.sqrt(Xcoord + Ycoord)
			if dist < lock_target then 
				t.x=targetX
				t.y=targetY
				local soundID=media.newEventSound("beep_mp3.mp3")
				media.playEventSound( soundID )

				
				t:removeEventListener( "touch", onTouch )
				totalDone = totalDone + 1;
				if (totalDone == totalPieces) then
					isPuzzleDone = true;
					local soundComplete=media.newEventSound("tada.mp3")
					media.playEventSound( soundComplete)
					doneMsg.text = "Tap to continue"


				end
			end
			display.getCurrentStage():setFocus( t, nil )
			t.isFocus = false
		end
	end

	-- Important to return true. This tells the system that the event
	-- should not be propagated to listeners of any objects underneath.
	return true
end



--[[local function onHomeTouch(event)



    myGroup:removeSelf()
     

	doneMsg:removeSelf()
	bg:removeSelf( )
	img_index=0;
	print("img_index = ",img_index)
	print("total_images = ", total_images)

	composer.gotoScene( "menu")

	--storyboard.gotoScene("menu")

	

end--]]

local function onLeftTouch(event)
	print("img_index on right = " , img_index)
	--img_index=0
	--img_index=img_index + 1;
	--composer.gotoScene( "slideView" )
	myGroup:removeSelf()
--myGroup:removeSelf( )
	doneMsg.text=""
	--bg:removeSelf()
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

  local s=slideView.new(pieceImages,"bg.jpg",0,0,1)
  s:jumpToImage(num)
  leftTouched=true
	--print("num value is ", num)
	
	--s:jumpToImage(num)
--	doneMsg:removeSelf()
	
	--myGroup = display.newGroup( );
	--doneMsg.text = ""

	--img_index = (img_index + 1) % total_images;h is 
	
	--img_index = (img_index + 1) ;
	
	--create_puzzle()


end

 function create_puzzle()

print("create_puzzle")
	--display.setDefault( "background", 64/255, 0, 0 );
	
	local arguments = img_table[img_index].arguments;
	 background = display.newImage(myGroup, img_table[img_index].name, display.contentCenterX, display.contentCenterY, true)
	myGroup:insert(background)
	xOffset = (display.contentWidth  - background.contentWidth) / 2;
	yOffset = (display.contentHeight - background.contentHeight) / 2;

     local leftButton=display.newImageRect(myGroup,"images/left.png",100,100)
    leftButton.x=80
    leftButton.y=200
    leftButton:addEventListener("touch" , onLeftTouch)
   myGroup:insert(leftButton)
    

 

    --[[local homeButton=display.newImageRect(myGroup,"images/home.png",100,100)
    homeButton.x= 100
    homeButton.y=100
    homeButton:addEventListener( "touch" , onHomeTouch )
    --myGroup:insert(homeButton)--]]


	isPuzzleDone = false
	totalDone = 0;
	totalPieces = 0;

	-- Iterate through arguments array and create rounded rects (vector objects) for each item
	for _,item in ipairs( arguments ) do
		local imgPiece = display.newImage(myGroup,item.img, item.x, item.y, true)
		imgPiece.targetX=item.targetX
		imgPiece.targetY=item.targetY
	    totalPieces = totalPieces + 1;
	   -- print ("totalPieces = " , totalPieces) 
	    

		-- Make the image instance respond to touch events
		imgPiece:addEventListener( "touch", onTouch )
	end



end




-- listener used by Runtime object. This gets called if no other display object
-- intercepts the event.
local function printTouch2( event )


	if event.phase == "ended" then
		--if event.xStart < event.x and (event.x - event.xStart) >= 200 then

			--print("Swipe Right")
			  -- storyboard.gotoScene( "menu" )
 
			--return true
		--end
		--[[if event.xStart > event.x and (event.xStart - event.x) >= 200 then
			myGroup:removeSelf( )
			myGroup = display.newGroup( );
			doneMsg.text = ""
			img_index = (img_index + 1) % total_images;
			create_puzzle();
		end--]]
	print("printTouch2")
print("myGroup is " , myGroup)
		if (isPuzzleDone) and (leftTouched == false) then
			print("puzzleDone")
			myGroup:removeSelf( )
			doneMsg.text=""
			myGroup = display.newGroup( );
			
			
			img_index = (img_index + 1) % total_images;
			--[[local bg = display.newImage("bg.jpg", true)

		local screen_adjustment = 2

bg.xScale = (screen_adjustment  * bg.contentWidth)/bg.contentWidth
bg.yScale = bg.xScale
bg.x = display.contentWidth / 2
bg.y = display.contentHeight / 2
myGroup:insert(bg)
doneMsg = display.newText("", display.contentCenterX, 100, native.systemFontBold, 64 )
		doneMsg:setFillColor( 0,0,0 )
		myGroup:insert(doneMsg)--]]
			create_puzzle();
		end	
	end
		


end

local function showAd( adPosition, isTestMode )
   local xPos, yPos
   local adPosition = "top" -- "top", "bottom"
   if adPosition == "top" then
      xPos, yPos = display.screenOriginX, top
   elseif adPosition == "bottom" then
      xPos, yPos = display.screenOriginX, bottom
   end
   ads:setCurrentProvider("admob")
   ads.show( "banner", { x = xPos, y = yPos, appId = bannerAppID, testMode = isTestMode } )
end



---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:create( event )
	print ("lefttouched is ", leftTouched)
		local screenGroup = self.view
		local params=event.params
    	print("in puzzle params is ",params.sample_var)
    	num=params.sample_var
    	img_index=num-1
		Runtime:addEventListener( "touch", printTouch2 )


		print( "\n2: createScene event" )

	end
	--[[g = display.newGroup( );
	local bg = display.newImage("bg.jpg", true)

		local screen_adjustment = 2

bg.xScale = (screen_adjustment  * bg.contentWidth)/bg.contentWidth
bg.yScale = bg.xScale
bg.x = display.contentWidth / 2
bg.y = display.contentHeight / 2
g:insert(bg)--]]
	--[[local screen_adjustment = 2

bg.xScale = (screen_adjustment  * bg.contentWidth)/bg.contentWidth
bg.yScale = bg.xScale
bg.x = display.contentWidth / 2
bg.y = display.contentHeight / 2--]]
--myGroup:insert(bg)





-- Called immediately after scene has moved onscreen:
function scene:show( event )
	local screenGroup = self.view

	ctrVar=ctrVar+1
	print("ctrVar= ",ctrVar)

	ads.show( "banner", { x=0, y=100000, appId="ca-app-pub-7802290325140609/2970235175" } )

	if (ctrVar ~= 2) then
		print( "2: enterScene event" )
		myGroup = display.newGroup( );
		--local bg = display.newImage("bg.jpg", true)

		--local screen_adjustment = 2

--bg.xScale = (screen_adjustment  * bg.contentWidth)/bg.contentWidth
--bg.yScale = bg.xScale
--bg.x = display.contentWidth / 2
--bg.y = display.contentHeight / 2
--myGroup:insert(bg)

		
		-- remove previous scene's view
		--storyboard.purgeScene( "menu" )

		--storyboard.removeScene( "menu" )
		local params=event.params
		num=params.sample_var
        img_index=num-1

		

		doneMsg = display.newText("", display.contentCenterX, 100, native.systemFontBold, 64 )
		doneMsg:setFillColor( 1,1,1 )

		--myGroup:insert(doneMsg);

		print ("img_index in enter scene = " , img_index)
		print("total_images in eneter scene = " , total_images)
		--img_index = (img_index + 1) % total_images;
		--img_index = (img_index + 1)
		create_puzzle();
		ctrVar=1
		--ads.show( "banner", { x=0, y=100000, appId=bannerAppID } )
		--ads.init("admob", bannerAppID, adListener )
		--ads:setCurrentProvider("admob")
		--ads.load("admob", { appId = bannerAppID, testMode = true } )
		--showAd("top",true)



	end	


end


-- Called when scene is about to move offscreen:
function scene:hide(event)
	local screenGroup = self.view

	
	print( "2: exitScene event" )

	--storyboard.purgeScene( "menu" )
	
	myGroup:removeSelf()
	--doneMsg.text=""
--	g:removeSelf( )

--	doneMsg:removeSelf()

	-- remove touch listener for image
	--image:removeEventListener( "touch", image )
	
	
end



-- Called prior to the removal of scene's "view" (display group)
function scene:destroy( event )
	local screenGroup = self.view

	print( "((destroying scene 2's view))" )

--storyboard.purgeScene( "menu" )

end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene
