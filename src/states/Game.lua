--[[
    2025
                
    Author: Gregory Rodzewicz

    --game--

    A file that contains all of the definitions and methods for the gamestate 'game'
    used along with the gamestate library.
]]

game = {} -- previously: Gamestate.new()

local gWorld = love.physics.newWorld(0, 0)

function game:init()
    self.player = nil
    self.asteroid = {}
end

function game:enter(previous)
    self.from = previous
    self.player = Player(gWorld)
end
-- function game:resume()
-- function game:leave()
-- function game:quit()

function game:update(dt)
    gWorld:update(dt)
    self.player:update(dt)
end
-- function game:threaderror
-- function game:lowmemory
-- function game:filedropped
-- function game:directorydropped

function game:draw()
    love.graphics.setColor(2/255, 189/255, 89/255)
    love.graphics.print("The current framerate is: " .. tostring(love.timer.getFPS()))
    love.graphics.setColor(1,1,1)
    self.player:render()
end
-- function game:visible
-- function game:focus
-- function game:resize
-- function game:displayrotated

function game:keypressed(key)
    if key == "w" then
        self.player:move("up")
    elseif key == "s" then
        self.player:move("down")
    elseif key == "a" then
        self.player:move("left")
    elseif key == "d" then
        self.player:move("right")
    end
end
function game:keyreleased(key)
    if key == "w" then
        self.player:move("up")
    elseif key == "s" then
        self.player:move("down")
    elseif key == "a" then
        self.player:move("left")
    elseif key == "d" then
        self.player:move("right")
    end
end
-- function game:textinput
-- function game:textedited

-- function game:mousefocus
-- function game:mousemoved
-- function game:mousepressed
-- function game:mousereleased
-- function game:wheelmoved

-- function game:joystickadded
-- function game:joystickremoved
-- function game:joystickaxis
-- function game:joystickpressed
-- function game:joystickreleased
-- function game:joystickhat

-- function game:gamepadaxis
-- function game:gamepadpressed
-- function game:gamepadreleased

-- function game:touchmoved
-- function game:touchpressed
-- function game:touchreleased

