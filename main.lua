require('src/dependencies')

_G.debugging = true


function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(menu)
end

function love.update(dt)

end

function love.draw()

end

