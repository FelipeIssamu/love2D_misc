io.stdout:setvbuf("no")

function love.load()
    circle = {}
    circle.x = 400
    circle.y = 300
    circle.speed = 200
    circle.rad = 50
    circle.life = { 1, 1, 1, 1, 1, 1 }
    listBullets = {}
    speed = 100
    offset = 50
    listCullets = {}
    golden_ratio = 1.61803398874989
    font = love.graphics.newFont("Fonts/OptimusPrinceps.ttf", 100)
    source = love.audio.newSource("Sounds/youdied.mp3", "static")
    alpha = 0
    addangle = 0
    offsetBullet = 1
end

function love.update(dt)

    mouse_x, mouse_y = love.mouse.getPosition()
    -- angle = math.atan2(mouse_y - circle.y, mouse_x - circle.x)
    --
    -- cos = math.cos(angle)
    -- sin = math.sin(angle)
    --
    -- circle.x = circle.x + circle.speed * cos * dt
    -- circle.y = circle.y + circle.speed * sin * dt
    for i, v in ipairs(listBullets) do
        if v.y <= 100 or v.x <= 100 or v.x >= love.graphics.getWidth() - 100 or v.y >= love.graphics.getHeight() - 100 then
            love.graphics.circle("line", v.x, v.y, v.rad)
            table.remove(listBullets, i)
        end
        if v.x <= mouse_x + offset and v.y <= mouse_y + offset and v.y >= mouse_y - offset and v.x >= mouse_x - offset then
            table.remove(listBullets, i)
        end
    end

    for _, v in ipairs(listBullets) do
        local cosb = math.cos(v.angle)
        local sinb = math.sin(v.angle)
        v.x = v.x + v.speed * cosb * dt
        v.y = v.y + v.speed * sinb * dt
    end

    for _, v in ipairs(listCullets) do
        local cosb = math.cos(v.angle)
        local sinb = math.sin(v.angle)
        v.x = v.x + v.speed * cosb * dt
        v.y = v.y + v.speed * sinb * dt
    end

    for i, v in ipairs(listCullets) do
        if distance(v.x, circle.x, v.y, circle.y) <= circle.rad then
            table.remove(circle.life)
            table.remove(listCullets, i)
        end
    end

    if love.keyboard.isDown("space") then
        bulletPatterns()
    end

    if love.keyboard.isDown("s") then
        circle.y = circle.y + speed * dt
    end
    if love.keyboard.isDown("d") then
        circle.x = circle.x + speed * dt
    end
    if love.keyboard.isDown("a") then
        circle.x = circle.x - speed * dt
    end
    if love.keyboard.isDown("w") then
        circle.y = circle.y - speed * dt
    end

end

function love.mousepressed(x, y, button, istouch, presses)
    -- bulletAngle = math.atan2(y - circle.y, x - circle.x)
    -- createBullet(bulletAngle)
    for i = 1, 6 do
        createCullet(1.047 * i)
    end
end

function love.draw()

    love.graphics.setFont(font)
    love.graphics.setColor(0, 0.8, 0.8)
    love.graphics.circle("fill", circle.x, circle.y, circle.rad)

    for _, v in ipairs(listBullets) do
        love.graphics.circle("fill", v.x, v.y, v.rad)
    end

    for _, v in ipairs(listCullets) do
        love.graphics.rectangle("fill", v.x, v.y, v.side, v.side)
    end

    for i, _ in ipairs(circle.life) do
        love.graphics.rectangle("fill", 35 * i, 20, 25, 25)
    end


    love.graphics.rectangle("fill", mouse_x - offset, mouse_y - offset, 100, 100)

    if circle.life[1] == nil then
        love.graphics.setColor(0.6, 0, 0, alpha)
        alpha = alpha + 0.01
        love.graphics.print("YOU DIED", 150, 240)
        love.audio.play(source)
    end
    -- love.graphics.print("angle: " .. angle, 10, 10)

    -- love.graphics.line(circle.x, circle.y, mouse_x, circle.y)
    -- love.graphics.line(circle.x, circle.y, circle.x, mouse_y)
    --
    -- love.graphics.line(circle.x, circle.y, mouse_x, mouse_y)
    -- love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 10, 10)
end

function createBullet(angle)
    local bullet = {}
    bullet.x = circle.x
    bullet.y = circle.y
    bullet.speed = 300
    bullet.rad = 10
    bullet.angle = angle

    table.insert(listBullets, bullet)
end

function createCullet(angle)
    local cullet = {}
    cullet.x = mouse_x
    cullet.y = mouse_y
    cullet.speed = 900
    cullet.side = 20
    cullet.angle = angle

    table.insert(listCullets, cullet)
end

function bulletPatterns()
    local angle = 3.14159 * 2
    createBullet(angle + addangle)
    addangle = addangle + angle / golden_ratio
end

function distance(x1, x2, y1, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end
