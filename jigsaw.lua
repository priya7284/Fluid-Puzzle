local composer = require( "composer" )
local scene = composer.newScene()

local num
 local leftTouched=false
local widget = require( "widget" );
local isAndroid = "Android" == system.getInfo("platformName")
--local soundID=media.newEventSound("CLUCK.wav")
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

--system.activate( "multitouch" )
local ctrVar=0;
local total_images = 0;
local img_table = {};
local imagepath
local create_puzzle
local isPressed = false
local preventFiringEventTwice=0

img_table[total_images] = 
{name="images/pig_canvas.png",
OrigImg="images/pig_resize.png",
arguments={
{x=650, y=150, targetX=100, targetY=73, img="images/pig_p1.png"},
{x=650, y=150, targetX=260, targetY=73, img="images/pig_p2.png"},
{x=650, y=150, targetX=400, targetY=91, img="images/pig_p3.png"},
{x=650, y=150, targetX=540, targetY=91, img="images/pig_p4.png"},
{x=650, y=150, targetX=100, targetY=219, img="images/pig_p5.png"},
{x=650, y=150, targetX=260, targetY=200, img="images/pig_p6.png"},
{x=650, y=150, targetX=400, targetY=237, img="images/pig_p7.png"},
{x=650, y=150, targetX=540, targetY=237, img="images/pig_p8.png"},
{x=650, y=150, targetX=80, targetY=363, img="images/pig_p9.png"},
{x=650, y=150, targetX=220, targetY=345, img="images/pig_p10.png"},
{x=650, y=150, targetX=380, targetY=363, img="images/pig_p11.png"},
{x=650, y=150, targetX=540, targetY=363, img="images/pig_p12.png"},
{x=650, y=150, targetX=100, targetY=490, img="images/pig_p13.png"},
{x=650, y=150, targetX=240, targetY=490, img="images/pig_p14.png"},
{x=650, y=150, targetX=400, targetY=490, img="images/pig_p15.png"},
{x=650, y=150, targetX=560, targetY=490, img="images/pig_p16.png"}
}
};
total_images = total_images + 1;

img_table[total_images] = 
{name="images/dolphin_canvas.png",
OrigImg="images/dolphin_resize.png",
arguments={
{x=650, y=150, targetX=100, targetY=80, img="images/dolphin_p1.png"},
{x=650, y=150, targetX=260, targetY=80, img="images/dolphin_p2.png"},
{x=650, y=150, targetX=400, targetY=100, img="images/dolphin_p3.png"},
{x=650, y=150, targetX=540, targetY=100, img="images/dolphin_p4.png"},
{x=650, y=150, targetX=100, targetY=240, img="images/dolphin_p5.png"},
{x=650, y=150, targetX=260, targetY=220, img="images/dolphin_p6.png"},
{x=650, y=150, targetX=400, targetY=260, img="images/dolphin_p7.png"},
{x=650, y=150, targetX=540, targetY=260, img="images/dolphin_p8.png"},
{x=650, y=150, targetX=80, targetY=400, img="images/dolphin_p9.png"},
{x=650, y=150, targetX=220, targetY=380, img="images/dolphin_p10.png"},
{x=650, y=150, targetX=380, targetY=400, img="images/dolphin_p11.png"},
{x=650, y=150, targetX=540, targetY=400, img="images/dolphin_p12.png"},
{x=650, y=150, targetX=100, targetY=540, img="images/dolphin_p13.png"},
{x=650, y=150, targetX=240, targetY=540, img="images/dolphin_p14.png"},
{x=650, y=150, targetX=400, targetY=540, img="images/dolphin_p15.png"},
{x=650, y=150, targetX=560, targetY=540, img="images/dolphin_p16.png"}
}
};
total_images = total_images + 1;

img_table[total_images] = 
{name="images/kids_canvas.png",
OrigImg="images/kids_resize.png",
arguments={
{x=650, y=150, targetX=100, targetY=61, img="images/kids_p1.png"},
{x=650, y=150, targetX=260, targetY=61, img="images/kids_p2.png"},
{x=650, y=150, targetX=400, targetY=76, img="images/kids_p3.png"},
{x=650, y=150, targetX=540, targetY=76, img="images/kids_p4.png"},
{x=650, y=150, targetX=100, targetY=180, img="images/kids_p5.png"},
{x=650, y=150, targetX=260, targetY=165, img="images/kids_p6.png"},
{x=650, y=150, targetX=400, targetY=196, img="images/kids_p7.png"},
{x=650, y=150, targetX=540, targetY=196, img="images/kids_p8.png"},
{x=650, y=150, targetX=80, targetY=301, img="images/kids_p9.png"},
{x=650, y=150, targetX=220, targetY=286, img="images/kids_p10.png"},
{x=650, y=150, targetX=380, targetY=301, img="images/kids_p11.png"},
{x=650, y=150, targetX=540, targetY=301, img="images/kids_p12.png"},
{x=650, y=150, targetX=100, targetY=405, img="images/kids_p13.png"},
{x=650, y=150, targetX=240, targetY=405, img="images/kids_p14.png"},
{x=650, y=150, targetX=400, targetY=405, img="images/kids_p15.png"},
{x=650, y=150, targetX=560, targetY=405, img="images/kids_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images]=
{name="images/icecream_canvas.png",
OrigImg="images/icecream_resize.png",
arguments={
{x=650, y=150, targetX=100, targetY=71, img="images/icecream_p1.png"},
{x=650, y=150, targetX=260, targetY=71, img="images/icecream_p2.png"},
{x=650, y=150, targetX=400, targetY=88, img="images/icecream_p3.png"},
{x=650, y=150, targetX=540, targetY=88, img="images/icecream_p4.png"},
{x=650, y=150, targetX=100, targetY=210, img="images/icecream_p5.png"},
{x=650, y=150, targetX=260, targetY=193, img="images/icecream_p6.png"},
{x=650, y=150, targetX=400, targetY=228, img="images/icecream_p7.png"},
{x=650, y=150, targetX=540, targetY=228, img="images/icecream_p8.png"},
{x=650, y=150, targetX=80, targetY=351, img="images/icecream_p9.png"},
{x=650, y=150, targetX=220, targetY=333, img="images/icecream_p10.png"},
{x=650, y=150, targetX=380, targetY=351, img="images/icecream_p11.png"},
{x=650, y=150, targetX=540, targetY=351, img="images/icecream_p12.png"},
{x=650, y=150, targetX=100, targetY=473, img="images/icecream_p13.png"},
{x=650, y=150, targetX=240, targetY=473, img="images/icecream_p14.png"},
{x=650, y=150, targetX=400, targetY=473, img="images/icecream_p15.png"},
{x=650, y=150, targetX=560, targetY=473, img="images/icecream_p16.png"},
}

};

total_images = total_images + 1;

img_table[total_images]=
{name="images/squirrels_canvas.png",
OrigImg="images/squirrels_resize.png",
arguments={
{x=650, y=150, targetX=100, targetY=69, img="images/squirrels_p1.png"},
{x=650, y=150, targetX=260, targetY=69, img="images/squirrels_p2.png"},
{x=650, y=150, targetX=400, targetY=87, img="images/squirrels_p3.png"},
{x=650, y=150, targetX=540, targetY=87, img="images/squirrels_p4.png"},
{x=650, y=150, targetX=100, targetY=208, img="images/squirrels_p5.png"},
{x=650, y=150, targetX=260, targetY=190, img="images/squirrels_p6.png"},
{x=650, y=150, targetX=400, targetY=225, img="images/squirrels_p7.png"},
{x=650, y=150, targetX=540, targetY=225, img="images/squirrels_p8.png"},
{x=650, y=150, targetX=80, targetY=346, img="images/squirrels_p9.png"},
{x=650, y=150, targetX=220, targetY=329, img="images/squirrels_p10.png"},
{x=650, y=150, targetX=380, targetY=346, img="images/squirrels_p11.png"},
{x=650, y=150, targetX=540, targetY=346, img="images/squirrels_p12.png"},
{x=650, y=150, targetX=100, targetY=466, img="images/squirrels_p13.png"},
{x=650, y=150, targetX=240, targetY=466, img="images/squirrels_p14.png"},
{x=650, y=150, targetX=400, targetY=466, img="images/squirrels_p15.png"},
{x=650, y=150, targetX=560, targetY=466, img="images/squirrels_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images]=
{name="images/camping_canvas.png",
OrigImg="images/camping_resize.png",
 arguments={
{x=650, y=150, targetX=100, targetY=49, img="images/camping_p1.png"},
{x=650, y=150, targetX=260, targetY=49, img="images/camping_p2.png"},
{x=650, y=150, targetX=400, targetY=62, img="images/camping_p3.png"},
{x=650, y=150, targetX=540, targetY=62, img="images/camping_p4.png"},
{x=650, y=150, targetX=100, targetY=148, img="images/camping_p5.png"},
{x=650, y=150, targetX=260, targetY=136, img="images/camping_p6.png"},
{x=650, y=150, targetX=400, targetY=160, img="images/camping_p7.png"},
{x=650, y=150, targetX=540, targetY=160, img="images/camping_p8.png"},
{x=650, y=150, targetX=80, targetY=245, img="images/camping_p9.png"},
{x=650, y=150, targetX=220, targetY=234, img="images/camping_p10.png"},
{x=650, y=150, targetX=380, targetY=245, img="images/camping_p11.png"},
{x=650, y=150, targetX=540, targetY=245, img="images/camping_p12.png"},
{x=650, y=150, targetX=100, targetY=331, img="images/camping_p13.png"},
{x=650, y=150, targetX=240, targetY=331, img="images/camping_p14.png"},
{x=650, y=150, targetX=400, targetY=331, img="images/camping_p15.png"},
{x=650, y=150, targetX=560, targetY=331, img="images/camping_p16.png"},
}
};

total_images = total_images + 1;


img_table[total_images]=
{name="images/kidsplaying_canvas.png",
OrigImg="images/kidsplaying_resize.png",
 arguments={
{x=650, y=150, targetX=100, targetY=56, img="images/kidsplaying_p1.png"},
{x=650, y=150, targetX=260, targetY=56, img="images/kidsplaying_p2.png"},
{x=650, y=150, targetX=400, targetY=69, img="images/kidsplaying_p3.png"},
{x=650, y=150, targetX=540, targetY=69, img="images/kidsplaying_p4.png"},
{x=650, y=150, targetX=100, targetY=166, img="images/kidsplaying_p5.png"},
{x=650, y=150, targetX=260, targetY=152, img="images/kidsplaying_p6.png"},
{x=650, y=150, targetX=400, targetY=180, img="images/kidsplaying_p7.png"},
{x=650, y=150, targetX=540, targetY=180, img="images/kidsplaying_p8.png"},
{x=650, y=150, targetX=80, targetY=276, img="images/kidsplaying_p9.png"},
{x=650, y=150, targetX=220, targetY=262, img="images/kidsplaying_p10.png"},
{x=650, y=150, targetX=380, targetY=276, img="images/kidsplaying_p11.png"},
{x=650, y=150, targetX=540, targetY=276, img="images/kidsplaying_p12.png"},
{x=650, y=150, targetX=100, targetY=372, img="images/kidsplaying_p13.png"},
{x=650, y=150, targetX=240, targetY=372, img="images/kidsplaying_p14.png"},
{x=650, y=150, targetX=400, targetY=372, img="images/kidsplaying_p15.png"},
{x=650, y=150, targetX=560, targetY=372, img="images/kidsplaying_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images]=
{name="images/rainbow_canvas.png",
OrigImg="images/rainbow_resize.png",
arguments={
{x=650, y=150, targetX=100, targetY=83, img="images/rainbow_p1.png"},
{x=650, y=150, targetX=260, targetY=83, img="images/rainbow_p2.png"},
{x=650, y=150, targetX=400, targetY=104, img="images/rainbow_p3.png"},
{x=650, y=150, targetX=540, targetY=104, img="images/rainbow_p4.png"},
{x=650, y=150, targetX=100, targetY=249, img="images/rainbow_p5.png"},
{x=650, y=150, targetX=260, targetY=229, img="images/rainbow_p6.png"},
{x=650, y=150, targetX=400, targetY=270, img="images/rainbow_p7.png"},
{x=650, y=150, targetX=540, targetY=270, img="images/rainbow_p8.png"},
{x=650, y=150, targetX=80, targetY=415, img="images/rainbow_p9.png"},
{x=650, y=150, targetX=220, targetY=395, img="images/rainbow_p10.png"},
{x=650, y=150, targetX=380, targetY=415, img="images/rainbow_p11.png"},
{x=650, y=150, targetX=540, targetY=415, img="images/rainbow_p12.png"},
{x=650, y=150, targetX=100, targetY=560, img="images/rainbow_p13.png"},
{x=650, y=150, targetX=240, targetY=560, img="images/rainbow_p14.png"},
{x=650, y=150, targetX=400, targetY=560, img="images/rainbow_p15.png"},
{x=650, y=150, targetX=560, targetY=560, img="images/rainbow_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/kidsrunning_canvas.png",
OrigImg="images/kidsrunning_resize.png",
arguments={
{x=650, y=150, targetX=100, targetY=49, img="images/kidsrunning_p1.png"},
{x=650, y=150, targetX=260, targetY=49, img="images/kidsrunning_p2.png"},
{x=650, y=150, targetX=400, targetY=61, img="images/kidsrunning_p3.png"},
{x=650, y=150, targetX=540, targetY=61, img="images/kidsrunning_p4.png"},
{x=650, y=150, targetX=100, targetY=145, img="images/kidsrunning_p5.png"},
{x=650, y=150, targetX=260, targetY=133, img="images/kidsrunning_p6.png"},
{x=650, y=150, targetX=400, targetY=157, img="images/kidsrunning_p7.png"},
{x=650, y=150, targetX=540, targetY=157, img="images/kidsrunning_p8.png"},
{x=650, y=150, targetX=80, targetY=241, img="images/kidsrunning_p9.png"},
{x=650, y=150, targetX=220, targetY=229, img="images/kidsrunning_p10.png"},
{x=650, y=150, targetX=380, targetY=241, img="images/kidsrunning_p11.png"},
{x=650, y=150, targetX=540, targetY=241, img="images/kidsrunning_p12.png"},
{x=650, y=150, targetX=100, targetY=324, img="images/kidsrunning_p13.png"},
{x=650, y=150, targetX=240, targetY=324, img="images/kidsrunning_p14.png"},
{x=650, y=150, targetX=400, targetY=324, img="images/kidsrunning_p15.png"},
{x=650, y=150, targetX=560, targetY=324, img="images/kidsrunning_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/threeboys_canvas.png",
OrigImg="images/threeboys_resize.png",
arguments={
{x=650, y=150, targetX=100, targetY=57, img="images/threeboys_p1.png"},
{x=650, y=150, targetX=260, targetY=57, img="images/threeboys_p2.png"},
{x=650, y=150, targetX=400, targetY=71, img="images/threeboys_p3.png"},
{x=650, y=150, targetX=540, targetY=71, img="images/threeboys_p4.png"},
{x=650, y=150, targetX=100, targetY=170, img="images/threeboys_p5.png"},
{x=650, y=150, targetX=260, targetY=156, img="images/threeboys_p6.png"},
{x=650, y=150, targetX=400, targetY=184, img="images/threeboys_p7.png"},
{x=650, y=150, targetX=540, targetY=184, img="images/threeboys_p8.png"},
{x=650, y=150, targetX=80, targetY=283, img="images/threeboys_p9.png"},
{x=650, y=150, targetX=220, targetY=269, img="images/threeboys_p10.png"},
{x=650, y=150, targetX=380, targetY=283, img="images/threeboys_p11.png"},
{x=650, y=150, targetX=540, targetY=283, img="images/threeboys_p12.png"},
{x=650, y=150, targetX=100, targetY=382, img="images/threeboys_p13.png"},
{x=650, y=150, targetX=240, targetY=382, img="images/threeboys_p14.png"},
{x=650, y=150, targetX=400, targetY=382, img="images/threeboys_p15.png"},
{x=650, y=150, targetX=560, targetY=382, img="images/threeboys_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/manrunning_canvas.png",
OrigImg="images/manrunning_resize.png",
arguments={
{x=650, y=150, targetX=100, targetY=58, img="images/manrunning_p1.png"},
{x=650, y=150, targetX=260, targetY=58, img="images/manrunning_p2.png"},
{x=650, y=150, targetX=400, targetY=73, img="images/manrunning_p3.png"},
{x=650, y=150, targetX=540, targetY=73, img="images/manrunning_p4.png"},
{x=650, y=150, targetX=100, targetY=174, img="images/manrunning_p5.png"},
{x=650, y=150, targetX=260, targetY=160, img="images/manrunning_p6.png"},
{x=650, y=150, targetX=400, targetY=189, img="images/manrunning_p7.png"},
{x=650, y=150, targetX=540, targetY=189, img="images/manrunning_p8.png"},
{x=650, y=150, targetX=80, targetY=290, img="images/manrunning_p9.png"},
{x=650, y=150, targetX=220, targetY=276, img="images/manrunning_p10.png"},
{x=650, y=150, targetX=380, targetY=290, img="images/manrunning_p11.png"},
{x=650, y=150, targetX=540, targetY=290, img="images/manrunning_p12.png"},
{x=650, y=150, targetX=100, targetY=391, img="images/manrunning_p13.png"},
{x=650, y=150, targetX=240, targetY=391, img="images/manrunning_p14.png"},
{x=650, y=150, targetX=400, targetY=391, img="images/manrunning_p15.png"},
{x=650, y=150, targetX=560, targetY=391, img="images/manrunning_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/kidsandschool_canvas.png",
OrigImg="images/kidsandschool_resize.png",
arguments={
{x=650, y=150, targetX=100, targetY=78, img="images/kidsandschool_p1.png"},
{x=650, y=150, targetX=260, targetY=78, img="images/kidsandschool_p2.png"},
{x=650, y=150, targetX=400, targetY=97, img="images/kidsandschool_p3.png"},
{x=650, y=150, targetX=540, targetY=97, img="images/kidsandschool_p4.png"},
{x=650, y=150, targetX=100, targetY=234, img="images/kidsandschool_p5.png"},
{x=650, y=150, targetX=260, targetY=214, img="images/kidsandschool_p6.png"},
{x=650, y=150, targetX=400, targetY=253, img="images/kidsandschool_p7.png"},
{x=650, y=150, targetX=540, targetY=253, img="images/kidsandschool_p8.png"},
{x=650, y=150, targetX=80, targetY=388, img="images/kidsandschool_p9.png"},
{x=650, y=150, targetX=220, targetY=369, img="images/kidsandschool_p10.png"},
{x=650, y=150, targetX=380, targetY=388, img="images/kidsandschool_p11.png"},
{x=650, y=150, targetX=540, targetY=388, img="images/kidsandschool_p12.png"},
{x=650, y=150, targetX=100, targetY=524, img="images/kidsandschool_p13.png"},
{x=650, y=150, targetX=240, targetY=524, img="images/kidsandschool_p14.png"},
{x=650, y=150, targetX=400, targetY=524, img="images/kidsandschool_p15.png"},
{x=650, y=150, targetX=560, targetY=524, img="images/kidsandschool_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/kidsstudy_canvas.png",
OrigImg="images/kidsstudy_resize.png",
arguments={
{x=650, y=150, targetX=100, targetY=69, img="images/kidsstudy_p1.png"},
{x=650, y=150, targetX=260, targetY=69, img="images/kidsstudy_p2.png"},
{x=650, y=150, targetX=400, targetY=86, img="images/kidsstudy_p3.png"},
{x=650, y=150, targetX=540, targetY=86, img="images/kidsstudy_p4.png"},
{x=650, y=150, targetX=100, targetY=206, img="images/kidsstudy_p5.png"},
{x=650, y=150, targetX=260, targetY=189, img="images/kidsstudy_p6.png"},
{x=650, y=150, targetX=400, targetY=223, img="images/kidsstudy_p7.png"},
{x=650, y=150, targetX=540, targetY=223, img="images/kidsstudy_p8.png"},
{x=650, y=150, targetX=80, targetY=343, img="images/kidsstudy_p9.png"},
{x=650, y=150, targetX=220, targetY=326, img="images/kidsstudy_p10.png"},
{x=650, y=150, targetX=380, targetY=343, img="images/kidsstudy_p11.png"},
{x=650, y=150, targetX=540, targetY=343, img="images/kidsstudy_p12.png"},
{x=650, y=150, targetX=100, targetY=462, img="images/kidsstudy_p13.png"},
{x=650, y=150, targetX=240, targetY=462, img="images/kidsstudy_p14.png"},
{x=650, y=150, targetX=400, targetY=462, img="images/kidsstudy_p15.png"},
{x=650, y=150, targetX=560, targetY=462, img="images/kidsstudy_p16.png"},
}
};

total_images = total_images + 1;


img_table[total_images] = 
{name="images/tree_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=53, img="images/tree_p1.png"},
{x=650, y=150, targetX=260, targetY=53, img="images/tree_p2.png"},
{x=650, y=150, targetX=400, targetY=67, img="images/tree_p3.png"},
{x=650, y=150, targetX=540, targetY=67, img="images/tree_p4.png"},
{x=650, y=150, targetX=100, targetY=160, img="images/tree_p5.png"},
{x=650, y=150, targetX=260, targetY=147, img="images/tree_p6.png"},
{x=650, y=150, targetX=400, targetY=173, img="images/tree_p7.png"},
{x=650, y=150, targetX=540, targetY=173, img="images/tree_p8.png"},
{x=650, y=150, targetX=80, targetY=265, img="images/tree_p9.png"},
{x=650, y=150, targetX=220, targetY=253, img="images/tree_p10.png"},
{x=650, y=150, targetX=380, targetY=265, img="images/tree_p11.png"},
{x=650, y=150, targetX=540, targetY=265, img="images/tree_p12.png"},
{x=650, y=150, targetX=100, targetY=358, img="images/tree_p13.png"},
{x=650, y=150, targetX=240, targetY=358, img="images/tree_p14.png"},
{x=650, y=150, targetX=400, targetY=358, img="images/tree_p15.png"},
{x=650, y=150, targetX=560, targetY=358, img="images/tree_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/zebra_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=75, img="images/zebra_p1.png"},
{x=650, y=150, targetX=260, targetY=75, img="images/zebra_p2.png"},
{x=650, y=150, targetX=400, targetY=94, img="images/zebra_p3.png"},
{x=650, y=150, targetX=540, targetY=94, img="images/zebra_p4.png"},
{x=650, y=150, targetX=100, targetY=225, img="images/zebra_p5.png"},
{x=650, y=150, targetX=260, targetY=207, img="images/zebra_p6.png"},
{x=650, y=150, targetX=400, targetY=244, img="images/zebra_p7.png"},
{x=650, y=150, targetX=540, targetY=244, img="images/zebra_p8.png"},
{x=650, y=150, targetX=80, targetY=375, img="images/zebra_p9.png"},
{x=650, y=150, targetX=220, targetY=357, img="images/zebra_p10.png"},
{x=650, y=150, targetX=380, targetY=375, img="images/zebra_p11.png"},
{x=650, y=150, targetX=540, targetY=375, img="images/zebra_p12.png"},
{x=650, y=150, targetX=100, targetY=506, img="images/zebra_p13.png"},
{x=650, y=150, targetX=240, targetY=506, img="images/zebra_p14.png"},
{x=650, y=150, targetX=400, targetY=506, img="images/zebra_p15.png"},
{x=650, y=150, targetX=560, targetY=506, img="images/zebra_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/spider_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=70, img="images/spider_p1.png"},
{x=650, y=150, targetX=260, targetY=70, img="images/spider_p2.png"},
{x=650, y=150, targetX=400, targetY=88, img="images/spider_p3.png"},
{x=650, y=150, targetX=540, targetY=88, img="images/spider_p4.png"},
{x=650, y=150, targetX=100, targetY=210, img="images/spider_p5.png"},
{x=650, y=150, targetX=260, targetY=193, img="images/spider_p6.png"},
{x=650, y=150, targetX=400, targetY=228, img="images/spider_p7.png"},
{x=650, y=150, targetX=540, targetY=228, img="images/spider_p8.png"},
{x=650, y=150, targetX=80, targetY=350, img="images/spider_p9.png"},
{x=650, y=150, targetX=220, targetY=333, img="images/spider_p10.png"},
{x=650, y=150, targetX=380, targetY=350, img="images/spider_p11.png"},
{x=650, y=150, targetX=540, targetY=350, img="images/spider_p12.png"},
{x=650, y=150, targetX=100, targetY=472, img="images/spider_p13.png"},
{x=650, y=150, targetX=240, targetY=472, img="images/spider_p14.png"},
{x=650, y=150, targetX=400, targetY=472, img="images/spider_p15.png"},
{x=650, y=150, targetX=560, targetY=472, img="images/spider_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/owl_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=62, img="images/owl_p1.png"},
{x=650, y=150, targetX=260, targetY=62, img="images/owl_p2.png"},
{x=650, y=150, targetX=400, targetY=77, img="images/owl_p3.png"},
{x=650, y=150, targetX=540, targetY=77, img="images/owl_p4.png"},
{x=650, y=150, targetX=100, targetY=186, img="images/owl_p5.png"},
{x=650, y=150, targetX=260, targetY=170, img="images/owl_p6.png"},
{x=650, y=150, targetX=400, targetY=200, img="images/owl_p7.png"},
{x=650, y=150, targetX=540, targetY=200, img="images/owl_p8.png"},
{x=650, y=150, targetX=80, targetY=308, img="images/owl_p9.png"},
{x=650, y=150, targetX=220, targetY=293, img="images/owl_p10.png"},
{x=650, y=150, targetX=380, targetY=308, img="images/owl_p11.png"},
{x=650, y=150, targetX=540, targetY=308, img="images/owl_p12.png"},
{x=650, y=150, targetX=100, targetY=416, img="images/owl_p13.png"},
{x=650, y=150, targetX=240, targetY=416, img="images/owl_p14.png"},
{x=650, y=150, targetX=400, targetY=416, img="images/owl_p15.png"},
{x=650, y=150, targetX=560, targetY=416, img="images/owl_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/happylion_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=54, img="images/happylion_p1.png"},
{x=650, y=150, targetX=260, targetY=54, img="images/happylion_p2.png"},
{x=650, y=150, targetX=400, targetY=68, img="images/happylion_p3.png"},
{x=650, y=150, targetX=540, targetY=68, img="images/happylion_p4.png"},
{x=650, y=150, targetX=100, targetY=162, img="images/happylion_p5.png"},
{x=650, y=150, targetX=260, targetY=148, img="images/happylion_p6.png"},
{x=650, y=150, targetX=400, targetY=175, img="images/happylion_p7.png"},
{x=650, y=150, targetX=540, targetY=175, img="images/happylion_p8.png"},
{x=650, y=150, targetX=80, targetY=268, img="images/happylion_p9.png"},
{x=650, y=150, targetX=220, targetY=256, img="images/happylion_p10.png"},
{x=650, y=150, targetX=380, targetY=268, img="images/happylion_p11.png"},
{x=650, y=150, targetX=540, targetY=268, img="images/happylion_p12.png"},
{x=650, y=150, targetX=100, targetY=362, img="images/happylion_p13.png"},
{x=650, y=150, targetX=240, targetY=362, img="images/happylion_p14.png"},
{x=650, y=150, targetX=400, targetY=362, img="images/happylion_p15.png"},
{x=650, y=150, targetX=560, targetY=362, img="images/happylion_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/frog_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=91, img="images/frog_p1.png"},
{x=650, y=150, targetX=260, targetY=91, img="images/frog_p2.png"},
{x=650, y=150, targetX=400, targetY=114, img="images/frog_p3.png"},
{x=650, y=150, targetX=540, targetY=114, img="images/frog_p4.png"},
{x=650, y=150, targetX=100, targetY=272, img="images/frog_p5.png"},
{x=650, y=150, targetX=260, targetY=249, img="images/frog_p6.png"},
{x=650, y=150, targetX=400, targetY=295, img="images/frog_p7.png"},
{x=650, y=150, targetX=540, targetY=295, img="images/frog_p8.png"},
{x=650, y=150, targetX=80, targetY=453, img="images/frog_p9.png"},
{x=650, y=150, targetX=220, targetY=430, img="images/frog_p10.png"},
{x=650, y=150, targetX=380, targetY=453, img="images/frog_p11.png"},
{x=650, y=150, targetX=540, targetY=453, img="images/frog_p12.png"},
{x=650, y=150, targetX=100, targetY=611, img="images/frog_p13.png"},
{x=650, y=150, targetX=240, targetY=611, img="images/frog_p14.png"},
{x=650, y=150, targetX=400, targetY=611, img="images/frog_p15.png"},
{x=650, y=150, targetX=560, targetY=611, img="images/frog_p16.png"},
}
};


total_images = total_images + 1;

img_table[total_images] = 
{name="images/elephant_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=80, img="images/elephant_p1.png"},
{x=650, y=150, targetX=260, targetY=80, img="images/elephant_p2.png"},
{x=650, y=150, targetX=400, targetY=100, img="images/elephant_p3.png"},
{x=650, y=150, targetX=540, targetY=100, img="images/elephant_p4.png"},
{x=650, y=150, targetX=100, targetY=239, img="images/elephant_p5.png"},
{x=650, y=150, targetX=260, targetY=219, img="images/elephant_p6.png"},
{x=650, y=150, targetX=400, targetY=259, img="images/elephant_p7.png"},
{x=650, y=150, targetX=540, targetY=259, img="images/elephant_p8.png"},
{x=650, y=150, targetX=80, targetY=398, img="images/elephant_p9.png"},
{x=650, y=150, targetX=220, targetY=379, img="images/elephant_p10.png"},
{x=650, y=150, targetX=380, targetY=398, img="images/elephant_p11.png"},
{x=650, y=150, targetX=540, targetY=398, img="images/elephant_p12.png"},
{x=650, y=150, targetX=100, targetY=537, img="images/elephant_p13.png"},
{x=650, y=150, targetX=240, targetY=537, img="images/elephant_p14.png"},
{x=650, y=150, targetX=400, targetY=537, img="images/elephant_p15.png"},
{x=650, y=150, targetX=560, targetY=537, img="images/elephant_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/duck_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=57, img="images/duck_p1.png"},
{x=650, y=150, targetX=260, targetY=57, img="images/duck_p2.png"},
{x=650, y=150, targetX=400, targetY=71, img="images/duck_p3.png"},
{x=650, y=150, targetX=540, targetY=71, img="images/duck_p4.png"},
{x=650, y=150, targetX=100, targetY=170, img="images/duck_p5.png"},
{x=650, y=150, targetX=260, targetY=156, img="images/duck_p6.png"},
{x=650, y=150, targetX=400, targetY=184, img="images/duck_p7.png"},
{x=650, y=150, targetX=540, targetY=184, img="images/duck_p8.png"},
{x=650, y=150, targetX=80, targetY=283, img="images/duck_p9.png"},
{x=650, y=150, targetX=220, targetY=269, img="images/duck_p10.png"},
{x=650, y=150, targetX=380, targetY=283, img="images/duck_p11.png"},
{x=650, y=150, targetX=540, targetY=283, img="images/duck_p12.png"},
{x=650, y=150, targetX=100, targetY=382, img="images/duck_p13.png"},
{x=650, y=150, targetX=240, targetY=382, img="images/duck_p14.png"},
{x=650, y=150, targetX=400, targetY=382, img="images/duck_p15.png"},
{x=650, y=150, targetX=560, targetY=382, img="images/duck_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/dino_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=65, img="images/dino_p1.png"},
{x=650, y=150, targetX=260, targetY=65, img="images/dino_p2.png"},
{x=650, y=150, targetX=400, targetY=81, img="images/dino_p3.png"},
{x=650, y=150, targetX=540, targetY=81, img="images/dino_p4.png"},
{x=650, y=150, targetX=100, targetY=195, img="images/dino_p5.png"},
{x=650, y=150, targetX=260, targetY=179, img="images/dino_p6.png"},
{x=650, y=150, targetX=400, targetY=211, img="images/dino_p7.png"},
{x=650, y=150, targetX=540, targetY=211, img="images/dino_p8.png"},
{x=650, y=150, targetX=80, targetY=325, img="images/dino_p9.png"},
{x=650, y=150, targetX=220, targetY=309, img="images/dino_p10.png"},
{x=650, y=150, targetX=380, targetY=325, img="images/dino_p11.png"},
{x=650, y=150, targetX=540, targetY=325, img="images/dino_p12.png"},
{x=650, y=150, targetX=100, targetY=439, img="images/dino_p13.png"},
{x=650, y=150, targetX=240, targetY=439, img="images/dino_p14.png"},
{x=650, y=150, targetX=400, targetY=439, img="images/dino_p15.png"},
{x=650, y=150, targetX=560, targetY=439, img="images/dino_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/crab_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=85, img="images/crab_p1.png"},
{x=650, y=150, targetX=260, targetY=85, img="images/crab_p2.png"},
{x=650, y=150, targetX=400, targetY=106, img="images/crab_p3.png"},
{x=650, y=150, targetX=540, targetY=106, img="images/crab_p4.png"},
{x=650, y=150, targetX=100, targetY=254, img="images/crab_p5.png"},
{x=650, y=150, targetX=260, targetY=233, img="images/crab_p6.png"},
{x=650, y=150, targetX=400, targetY=275, img="images/crab_p7.png"},
{x=650, y=150, targetX=540, targetY=275, img="images/crab_p8.png"},
{x=650, y=150, targetX=80, targetY=423, img="images/crab_p9.png"},
{x=650, y=150, targetX=220, targetY=402, img="images/crab_p10.png"},
{x=650, y=150, targetX=380, targetY=423, img="images/crab_p11.png"},
{x=650, y=150, targetX=540, targetY=423, img="images/crab_p12.png"},
{x=650, y=150, targetX=100, targetY=570, img="images/crab_p13.png"},
{x=650, y=150, targetX=240, targetY=570, img="images/crab_p14.png"},
{x=650, y=150, targetX=400, targetY=570, img="images/crab_p15.png"},
{x=650, y=150, targetX=560, targetY=570, img="images/crab_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/chicken_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=80, img="images/chicken_p1.png"},
{x=650, y=150, targetX=260, targetY=80, img="images/chicken_p2.png"},
{x=650, y=150, targetX=400, targetY=100, img="images/chicken_p3.png"},
{x=650, y=150, targetX=540, targetY=100, img="images/chicken_p4.png"},
{x=650, y=150, targetX=100, targetY=240, img="images/chicken_p5.png"},
{x=650, y=150, targetX=260, targetY=220, img="images/chicken_p6.png"},
{x=650, y=150, targetX=400, targetY=260, img="images/chicken_p7.png"},
{x=650, y=150, targetX=540, targetY=260, img="images/chicken_p8.png"},
{x=650, y=150, targetX=80, targetY=400, img="images/chicken_p9.png"},
{x=650, y=150, targetX=220, targetY=380, img="images/chicken_p10.png"},
{x=650, y=150, targetX=380, targetY=400, img="images/chicken_p11.png"},
{x=650, y=150, targetX=540, targetY=400, img="images/chicken_p12.png"},
{x=650, y=150, targetX=100, targetY=540, img="images/chicken_p13.png"},
{x=650, y=150, targetX=240, targetY=540, img="images/chicken_p14.png"},
{x=650, y=150, targetX=400, targetY=540, img="images/chicken_p15.png"},
{x=650, y=150, targetX=560, targetY=540, img="images/chicken_p16.png"},
}
};

total_images = total_images + 1;
img_table[total_images] = 
{name="images/bear_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=53, img="images/bear_p1.png"},
{x=650, y=150, targetX=260, targetY=53, img="images/bear_p2.png"},
{x=650, y=150, targetX=400, targetY=66, img="images/bear_p3.png"},
{x=650, y=150, targetX=540, targetY=66, img="images/bear_p4.png"},
{x=650, y=150, targetX=100, targetY=158, img="images/bear_p5.png"},
{x=650, y=150, targetX=260, targetY=145, img="images/bear_p6.png"},
{x=650, y=150, targetX=400, targetY=171, img="images/bear_p7.png"},
{x=650, y=150, targetX=540, targetY=171, img="images/bear_p8.png"},
{x=650, y=150, targetX=80, targetY=263, img="images/bear_p9.png"},
{x=650, y=150, targetX=220, targetY=250, img="images/bear_p10.png"},
{x=650, y=150, targetX=380, targetY=263, img="images/bear_p11.png"},
{x=650, y=150, targetX=540, targetY=263, img="images/bear_p12.png"},
{x=650, y=150, targetX=100, targetY=355, img="images/bear_p13.png"},
{x=650, y=150, targetX=240, targetY=355, img="images/bear_p14.png"},
{x=650, y=150, targetX=400, targetY=355, img="images/bear_p15.png"},
{x=650, y=150, targetX=560, targetY=355, img="images/bear_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/lion_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=66, img="images/lion_p1.png"},
{x=650, y=150, targetX=260, targetY=66, img="images/lion_p2.png"},
{x=650, y=150, targetX=400, targetY=82, img="images/lion_p3.png"},
{x=650, y=150, targetX=540, targetY=82, img="images/lion_p4.png"},
{x=650, y=150, targetX=100, targetY=197, img="images/lion_p5.png"},
{x=650, y=150, targetX=260, targetY=181, img="images/lion_p6.png"},
{x=650, y=150, targetX=400, targetY=213, img="images/lion_p7.png"},
{x=650, y=150, targetX=540, targetY=213, img="images/lion_p8.png"},
{x=650, y=150, targetX=80, targetY=328, img="images/lion_p9.png"},
{x=650, y=150, targetX=220, targetY=312, img="images/lion_p10.png"},
{x=650, y=150, targetX=380, targetY=328, img="images/lion_p11.png"},
{x=650, y=150, targetX=540, targetY=328, img="images/lion_p12.png"},
{x=650, y=150, targetX=100, targetY=443, img="images/lion_p13.png"},
{x=650, y=150, targetX=240, targetY=443, img="images/lion_p14.png"},
{x=650, y=150, targetX=400, targetY=443, img="images/lion_p15.png"},
{x=650, y=150, targetX=560, targetY=443, img="images/lion_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/horse_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=68, img="images/horse_p1.png"},
{x=650, y=150, targetX=260, targetY=68, img="images/horse_p2.png"},
{x=650, y=150, targetX=400, targetY=85, img="images/horse_p3.png"},
{x=650, y=150, targetX=540, targetY=85, img="images/horse_p4.png"},
{x=650, y=150, targetX=100, targetY=204, img="images/horse_p5.png"},
{x=650, y=150, targetX=260, targetY=187, img="images/horse_p6.png"},
{x=650, y=150, targetX=400, targetY=220, img="images/horse_p7.png"},
{x=650, y=150, targetX=540, targetY=220, img="images/horse_p8.png"},
{x=650, y=150, targetX=80, targetY=338, img="images/horse_p9.png"},
{x=650, y=150, targetX=220, targetY=322, img="images/horse_p10.png"},
{x=650, y=150, targetX=380, targetY=338, img="images/horse_p11.png"},
{x=650, y=150, targetX=540, targetY=338, img="images/horse_p12.png"},
{x=650, y=150, targetX=100, targetY=456, img="images/horse_p13.png"},
{x=650, y=150, targetX=240, targetY=456, img="images/horse_p14.png"},
{x=650, y=150, targetX=400, targetY=456, img="images/horse_p15.png"},
{x=650, y=150, targetX=560, targetY=456, img="images/horse_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/hedgehog_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=85, img="images/hedgehog_p1.png"},
{x=650, y=150, targetX=260, targetY=85, img="images/hedgehog_p2.png"},
{x=650, y=150, targetX=400, targetY=106, img="images/hedgehog_p3.png"},
{x=650, y=150, targetX=540, targetY=106, img="images/hedgehog_p4.png"},
{x=650, y=150, targetX=100, targetY=252, img="images/hedgehog_p5.png"},
{x=650, y=150, targetX=260, targetY=231, img="images/hedgehog_p6.png"},
{x=650, y=150, targetX=400, targetY=273, img="images/hedgehog_p7.png"},
{x=650, y=150, targetX=540, targetY=273, img="images/hedgehog_p8.png"},
{x=650, y=150, targetX=80, targetY=421, img="images/hedgehog_p9.png"},
{x=650, y=150, targetX=220, targetY=399, img="images/hedgehog_p10.png"},
{x=650, y=150, targetX=380, targetY=421, img="images/hedgehog_p11.png"},
{x=650, y=150, targetX=540, targetY=421, img="images/hedgehog_p12.png"},
{x=650, y=150, targetX=100, targetY=567, img="images/hedgehog_p13.png"},
{x=650, y=150, targetX=240, targetY=567, img="images/hedgehog_p14.png"},
{x=650, y=150, targetX=400, targetY=567, img="images/hedgehog_p15.png"},
{x=650, y=150, targetX=560, targetY=567, img="images/hedgehog_p16.png"},
}
};

total_images = total_images + 1;

img_table[total_images] = 
{name="images/penguin_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=80, img="images/penguin_p1.png"},
{x=650, y=150, targetX=260, targetY=80, img="images/penguin_p2.png"},
{x=650, y=150, targetX=400, targetY=100, img="images/penguin_p3.png"},
{x=650, y=150, targetX=540, targetY=100, img="images/penguin_p4.png"},
{x=650, y=150, targetX=100, targetY=240, img="images/penguin_p5.png"},
{x=650, y=150, targetX=260, targetY=220, img="images/penguin_p6.png"},
{x=650, y=150, targetX=400, targetY=260, img="images/penguin_p7.png"},
{x=650, y=150, targetX=540, targetY=260, img="images/penguin_p8.png"},
{x=650, y=150, targetX=80, targetY=400, img="images/penguin_p9.png"},
{x=650, y=150, targetX=220, targetY=380, img="images/penguin_p10.png"},
{x=650, y=150, targetX=380, targetY=400, img="images/penguin_p11.png"},
{x=650, y=150, targetX=540, targetY=400, img="images/penguin_p12.png"},
{x=650, y=150, targetX=100, targetY=540, img="images/penguin_p13.png"},
{x=650, y=150, targetX=240, targetY=540, img="images/penguin_p14.png"},
{x=650, y=150, targetX=400, targetY=540, img="images/penguin_p15.png"},
{x=650, y=150, targetX=560, targetY=540, img="images/penguin_p16.png"},
}
};

total_images = total_images + 1;


local img_index=0
local myGroup;
local doneMsg;


local lock_target = 100;


local totalDone = 0;
local totalPieces = 0;
local isPuzzleDone = false;

local xOffset = 62;
local yOffset = 150;


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
		--store minimum and maximum points to stop objects from going offscreen

		

	elseif t.isFocus then
		if "moved" == phase then

			-- Make object move (we subtract t.x0,t.y0 so that moves are
			-- relative to initial grab point, rather than object "snapping").
				t.x = event.x - t.x0
				t.y = event.y - t.y0
				--print (t.x) 
				--print (t.y) 
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



local function onLeftTouch(event)

    
	img_index=0;
	

	--composer.gotoScene("menu")
    myGroup:removeSelf()   
    doneMsg:removeSelf()
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
s:jumpToImage(num)
leftTouched=true
end




--[[local function onPreviewTouch(event)
	local preview


	if (event.phase == "began") then
		
		preview=display.newImageRect(myGroup,imagepath,200,200)
		print("coming back")


	elseif (event.phase == "ended") or (event.phase == "cancelled")then

		--preview.alpha=0
		preview=display.newImageRect(myGroup,"images/preview.png",100,100)
		preview.alpha=0
		


	end

preview.x=350
preview.y=150
end--]]

	
	
	--[[print ("isPressed = " , isPressed)
	print ("preventFiringEventTwice = ", preventFiringEventTwice)
	if (preventFiringEventTwice ~= 1) then
		if(isPressed == true) then
			preview=display.newImageRect(myGroup,"images/preview.png",100,100)
			preventFiringEventTwice=preventFiringEventTwice +1
		else

 			preview=display.newImageRect(myGroup,imagepath,200,200)
 			preventFiringEventTwice=preventFiringEventTwice +1
 		end
    	isPressed = not isPressed
    	
    	preview.x=350
 		preview.y=150

	end

 print("after converting isPressed = ", isPressed)
 
end--]]

--[[local function onRightTouch(event)
	
	--img_index=img_index + 1;
	myGroup:removeSelf()
	--doneMsg:removeSelf()
	myGroup = display.newGroup( );
	doneMsg.text = ""

	img_index = (img_index + 1) % total_images;
	print("img_index on right = " , img_index)
	create_puzzle()


end--]]

function shuffle(theTable)
  local theTable = theTable
  local n = #theTable
  local j
  local random = math.random

   for i=n-1, 1, -1 do
     j = random(i)
    theTable[j],theTable[i] = theTable[i],theTable[j]
   end

   return theTable
end


 function create_puzzle()


	--display.setDefault( "background", 64/255, 0, 0 );
	 imagepath=img_table[img_index].OrigImg
	print("imagepath = " , imagepath)
	local arguments = img_table[img_index].arguments;
	local background = display.newImage(myGroup, img_table[img_index].name, display.contentCenterX, display.contentCenterY, true)
	xOffset = (display.contentWidth  - background.contentWidth) / 2;
	yOffset = (display.contentHeight - background.contentHeight) / 2;

     --[[local rightButton=display.newImageRect(myGroup,"images/right.png",100,100)
    rightButton.x=700
    rightButton.y=100
    rightButton:addEventListener("touch" , onRightTouch)--]]


    

 

    local leftButton=display.newImageRect(myGroup,"images/left.png",100,100)
    leftButton.x= 100
    leftButton.y=200
    leftButton:addEventListener( "touch" , onLeftTouch )

    --[[local previewButton=display.newImageRect(myGroup,"images/preview.png",100,100)
    previewButton.x=350
    previewButton.y=100
    previewButton:addEventListener( "touch", onPreviewTouch)--]]


	isPuzzleDone = false
	totalDone = 0;
	totalPieces = 0;
	local shuff=shuffle(arguments)
	print ("shuff " , shuff)

	-- Iterate through arguments array and create rounded rects (vector objects) for each item
	for _,item in ipairs(shuff) do
		local imgPiece = display.newImage(myGroup,item.img, item.x, item.y, true)
		imgPiece.targetX=item.targetX
		imgPiece.targetY=item.targetY
	    totalPieces = totalPieces + 1;
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


		if (isPuzzleDone) and (leftTouched==false) then
			myGroup:removeSelf( )
			myGroup = display.newGroup( );
			doneMsg.text = ""
			img_index = (img_index + 1) % total_images;
			create_puzzle();
		end	
	end
		


end



---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:create( event )
    local params=event.params
    print("in jigsaw params is ",params.sample_var)
    num=params.sample_var
    img_index=num-1
	local screenGroup = self.view

	Runtime:addEventListener( "touch", printTouch2 )

	print( "\n2: createScene event" )
end


-- Called immediately after scene has moved onscreen:
function scene:show( event )
	local screenGroup = self.view
	ctrVar=ctrVar+1
	print("ctrVar= ",ctrVar)
	
	
	-- remove previous scene's view
	--storyboard.purgeScene( "menu" )

	--storyboard.removeScene( "menu" )
	if (ctrVar ~= 2) then
        local params=event.params
        print("in jigsaw params scene show ",params.sample_var)
        num=params.sample_var
        img_index=num-1
		print( "2: enterScene event" )
		myGroup = display.newGroup( );
		doneMsg = display.newText("", display.contentCenterX, 1100, native.systemFontBold, 64 )
		--print ("img_index in enter scene = " , img_index)
		--print("total_images in eneter scene = " , total_images)
		--img_index = (img_index + 1) % total_images;
       -- print("img_index in enter scene after that formula is " , img_index)
		create_puzzle();
		ctrVar=1
	end
	ads.show( "banner", { x=0, y=100000, appId="ca-app-pub-7802290325140609/2970235175" } )
end


-- Called when scene is about to move offscreen:
function scene:hide()
	local screenGroup = self.view
	
	print( "2: exitScene event" )
	
	--myGroup:removeSelf()
	--doneMsg:removeSelf()
	-- remove touch listener for image
	--image:removeEventListener( "touch", image )
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroy( event )
	local screenGroup = self.view
	print( "((destroying scene 2's view))" )
    

end
---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene

