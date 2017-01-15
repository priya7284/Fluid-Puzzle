local composer = require( "composer" )
local scene = composer.newScene()


 
local widget = require( "widget" );
local isAndroid = "Android" == system.getInfo("platformName")
--local soundID=media.newEventSound("CLUCK.wav")


--system.activate( "multitouch" )
local ctrVar=0;
local total_images = -14;
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
{name="images/cycling_canvas.png",
arguments={
{x=650, y=150, targetX=100, targetY=57, img="images/cycling_p1.png"},
{x=650, y=150, targetX=260, targetY=57, img="images/cycling_p2.png"},
{x=650, y=150, targetX=400, targetY=71, img="images/cycling_p3.png"},
{x=650, y=150, targetX=540, targetY=71, img="images/cycling_p4.png"},
{x=650, y=150, targetX=100, targetY=172, img="images/cycling_p5.png"},
{x=650, y=150, targetX=260, targetY=158, img="images/cycling_p6.png"},
{x=650, y=150, targetX=400, targetY=185, img="images/cycling_p7.png"},
{x=650, y=150, targetX=540, targetY=185, img="images/cycling_p8.png"},
{x=650, y=150, targetX=80, targetY=285, img="images/cycling_p9.png"},
{x=650, y=150, targetX=220, targetY=272, img="images/cycling_p10.png"},
{x=650, y=150, targetX=380, targetY=285, img="images/cycling_p11.png"},
{x=650, y=150, targetX=540, targetY=285, img="images/cycling_p12.png"},
{x=650, y=150, targetX=100, targetY=385, img="images/cycling_p13.png"},
{x=650, y=150, targetX=240, targetY=385, img="images/cycling_p14.png"},
{x=650, y=150, targetX=400, targetY=385, img="images/cycling_p15.png"},
{x=650, y=150, targetX=560, targetY=385, img="images/cycling_p16.png"},
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
			print (t.x) 
			print (t.y) 



			

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

local function wrapit(theObject)
	local obj = theObject
     if obj.x < 10 then
       obj.x = 10
     elseif obj.x > 738 then
       obj.x = 738
     elseif obj.y < 10 then
       obj.y = 10
     elseif obj.y > 994 then
       obj.y = 994
     end
end

local function onHomeTouch(event)

    myGroup:removeSelf()   
	doneMsg:removeSelf()
	img_index=0;
	print("img_index = ",img_index)
	print("total_images = ", total_images)
	

	composer.gotoScene("menu")

end




local function onPreviewTouch(event)
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
end

	
	
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


    

 

    local homeButton=display.newImageRect(myGroup,"images/home.png",100,100)
    homeButton.x= 100
    homeButton.y=100
    homeButton:addEventListener( "touch" , onHomeTouch )

    local previewButton=display.newImageRect(myGroup,"images/preview.png",100,100)
    previewButton.x=350
    previewButton.y=100
    previewButton:addEventListener( "touch", onPreviewTouch)


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


		if (isPuzzleDone) then
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
		print( "2: enterScene event" )
		myGroup = display.newGroup( );
		doneMsg = display.newText("", display.contentCenterX, 1000, native.systemFontBold, 64 )
		print ("img_index in enter scene = " , img_index)
		print("total_images in eneter scene = " , total_images)
		img_index = (img_index + 1) % total_images;
		create_puzzle();
		ctrVar=1
	end
	
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

