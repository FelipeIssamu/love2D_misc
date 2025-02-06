function love.load()
    image = love.graphics.newImage("spritesheet.png")
    local width = image:getWidth()
    local height = image:getHeight()

    local frame_width = 123
    local frame_height = 141

    frames = {}

    for i = 0, 8 do
        table.insert(frames, love.graphics.newQuad(i * frame_width, 0, frame_width, frame_height, width, height))
    end

    currentFrame = 1
    x_axis = 200
    speed = 260
    left = false
    right = true
    y_axis = 350
    gravity = 0
    weight = 400
    canJump = false
end

function love.update(dt)

    gravity = gravity + weight * dt
    y_axis = y_axis + gravity * dt


    if y_axis >= 350 then
        gravity = 0
        weight = 0
    else
        weight = 400
    end


    if not idle then
        currentFrame = currentFrame + 12 * dt
    end
    if currentFrame >= 10 then
        currentFrame = 1
    end

    if love.keyboard.isDown("d") then
        if x_axis <= love.graphics.getWidth() - 100 then
            x_axis = x_axis + speed * dt
        end
        right = true
        left = false
        idle = false
    end

    if love.keyboard.isDown("a") then
        if x_axis > 0 then
            x_axis = x_axis - speed * dt
        end
        left = true
        right = false
        idle = false
    end

    if not love.keyboard.isDown("a", "d") then
        currentFrame = 1
        idle = true
    end
end

function jump()
    gravity = -300
end

function love.draw()
    love.graphics.setBackgroundColor(0.8, 0.8, 0.8)

    if left then
        love.graphics.draw(image, frames[math.floor(currentFrame)], x_axis, y_axis, 0, -1, 1, 66)
    end
    if right then
        love.graphics.draw(image, frames[math.floor(currentFrame)], x_axis, y_axis)
    end

end

function love.keypressed(key)
    if key == "space" then
        jump()
    end
end


