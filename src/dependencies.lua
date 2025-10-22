--[[
    2025
                
    Author: Gregory Rodzewicz

    --Dependencies--

    A file to organize all of the global dependencies for the project, as
    well as the assets needed. This will keep main.lua less polluted.
]]


-- 
-- Game environment
--

-- http://love2d.org
-- Love is a framework you can use to make 2D games using LUA code
love = require('love') -- Thsi call is not required. Including it for readabilty

-- 
-- Libraries
-- 

-- https://github.com/vrld/hump.git
-- hump is a small collection of tools for developing games with LÖVE.
-- hump.class is a small, fast class/prototype implementation with multiple inheritance.
-- hump.timer offers a simple interface to schedule the execution of functions.
-- hump.gamestate is a state engine encapsulates independent data and behaviour in a single table.
Class = require('lib/hump/class')
Timer = require('lib/hump/timer')
Gamestate = require('lib/hump/gamestate')

-- 
-- Project code
-- 

-- Game states --
require('src/states/Menu')

