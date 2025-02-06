local love = require 'love'
local mod = require('MOD')

function love.load()
    X, Y, W, H = 20, 20, 60, 20
end

-- -- Increase the size of the rectangle every frame.
function love.update(dt)
    -- W = W + 1
    -- H = H + 1
end

-- Draw a coloured rectangle.
function love.draw()
    -- In versions prior to 11.0, color component values are (0, 102, 102)
    love.graphics.setColor(0, 0.4, 0.4)
    love.graphics.rectangle("fill", X, Y, W, H)
    mod.print()
end
