io.stdout:setvbuf("no")

function love.load()
    player = {}
    player.health = 100
    player.attack = 10
    player.defense = 10
    player.speed = 17

    player2 = {}
    player2.health = 100
    player2.attack = 10
    player2.defense = 10
    player2.speed = 13

    enemy = {}
    enemy.health = 100
    enemy.attack = 10
    enemy.defense = 10
    enemy.speed = 15

    player_party = {}

    enemy_list = {}

    action_turn = {}

    table.insert(player_party, player)
    table.insert(player_party, player2)
    table.insert(enemy, enemy_list)

    battle = false

end

function love.update(dt)

    if not battle then


        for k, v in ipairs(action_turn) do
            print(v.speed)
        end

    end

    battle = true

end

function love.draw()
    love.graphics.setColor(0.3, 0.3, 0.3)
    love.graphics.rectangle("fill", 100, 100, 100, 100)

    love.graphics.setColor(0.7, 0.7, 0.7)
    love.graphics.rectangle("fill", 400, 100, 100, 100)

end

decide_turn = function (table)
    for k, v in pairs(table) do


end

