function love.load()
    circle = {}
    circle.speed = 70
    circle.x = 100
    circle.y = 100
    circle.radius = 50
    angle = 0
    mouse_x = circle.x
    mouxe_y = circle.y
end

function love.update(dt)

    if mouse_x ~= math.floor(circle.x) then
        local cos = math.cos(angle)
        local sin = math.sin(angle)
        circle.x = circle.x + circle.speed * cos * dt
        circle.y = circle.y + circle.speed * sin * dt
    end
end

function love.draw()

    love.graphics.print(tostring(mouse_x) .. ' ' .. tostring(circle.x))
    love.graphics.setColor(0.3, 0.6, 0.6)
    love.graphics.circle("line", circle.x, circle.y, circle.radius)

end

function love.mousepressed(x, y)
    angle = math.atan2(y - circle.y, x - circle.x)
    mouse_x = x
    mouxe_y = y
end
