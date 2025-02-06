function love.load()
    ALVO = {}
    ALVO.x = 300
    ALVO.y = 300
    ALVO.rad = 50

    alive = {}
    dead = {}

    for i=1, 10 do
        createCircle()
    end

    PONTOS = 0
    TIMER = 0
    gamefont = love.graphics.newFont(40)
    r = 1
    g = 1
    b = 1
end

createCircle = function()
    circle = {}
    circle.rad = 50
    circle.x = math.random(circle.rad, love.graphics.getWidth() - circle.rad)
    circle.y = math.random(circle.rad, love.graphics.getHeight() - circle.rad)

    table.insert(alive, circle)
end

function love.update(dt)

end

function love.draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("line", ALVO.x, ALVO.y, ALVO.rad)

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(gamefont)
    love.graphics.print(PONTOS, 1, 1)

    love.graphics.setColor(r, g, b)
    for i, v in ipairs(alive) do
        love.graphics.circle("line", v.x, v.y, v.rad)
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        if distance(ALVO.x, ALVO.y, x, y) < ALVO.rad then
            PONTOS = PONTOS + 1
            ALVO.x = math.random(ALVO.rad, love.graphics.getWidth() - ALVO.rad)
            ALVO.y = math.random(ALVO.rad, love.graphics.getHeight() - ALVO.rad)
        end
    end
end

distance = function(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end
