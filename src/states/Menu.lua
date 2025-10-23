--[[
    2025
                
    Author: Gregory Rodzewicz

    --Menu--

    A file that contains all of the definitions and methods for the gamestate 'Menu'
    used along with the gamestate library.
]]

menu = {} -- previously: Gamestate.new()


function menu:init()
end

function menu:enter(previous, world)
    self.from = previous
end
-- function menu:resume()
-- function menu:leave()
-- function menu:quit()

function menu:update(dt)

end
-- function menu:threaderror
-- function menu:lowmemory
-- function menu:filedropped
-- function menu:directorydropped

function menu:draw()
    love.graphics.print("The current game state is: " .. tostring(Gamestate.current()))
    love.graphics.print("Press 'Enter' to start new game", 100, 100)
end
-- function menu:visible
-- function menu:focus
-- function menu:resize
-- function menu:displayrotated

function menu:keypressed(key)
end
function menu:keyreleased(key)
    if key == "return" then
        Gamestate.switch(game)
    end
end
-- function menu:textinput
-- function menu:textedited

-- function menu:mousefocus
-- function menu:mousemoved
-- function menu:mousepressed
-- function menu:mousereleased
-- function menu:wheelmoved

-- function menu:joystickadded
-- function menu:joystickremoved
-- function menu:joystickaxis
-- function menu:joystickpressed
-- function menu:joystickreleased
-- function menu:joystickhat

-- function menu:gamepadaxis
-- function menu:gamepadpressed
-- function menu:gamepadreleased

-- function menu:touchmoved
-- function menu:touchpressed
-- function menu:touchreleased

