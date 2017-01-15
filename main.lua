-- 
-- Abstract: Drag Me Multitouch (drag multiple objects simultaneously)
-- 
-- Version: 1.3
-- 
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.

-- Demonstrates how to use create draggable objects with multitouch. Also shows how to move
-- an object to the front of the display hierarchy.
--
-- Supports Graphics 2.0

-- Require the widget library
display.setStatusBar( display.HiddenStatusBar )
local composer=require("composer")
--local storyboard=require("storyboard")
local widget = require( "widget" )
--storyboard.gotoScene("menu")
composer.gotoScene( "menu")



--local centerX = display.contentCenterX
--local centerY = display.contentCenterY
--local _W = display.contentWidth
--local _H = display.contentHeight

-- Determine the platform type
-- "iPhoneOS" or "Android" or "Mac OS X"
--
