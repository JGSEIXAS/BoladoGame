-- Import necessary modules
local love = require "love"
local Enemy = require "Bolado/components/Enemy"
local Button = require "Bolado/components/Button"

-- Seed the random number generator
math.randomseed(os.time())

-- Initialize wins counter
local wins = 0

--increase and deacrese step
local currentMusicVolume = 0.1
local volumeStep = 0.05

-- Initialize musicVolumes
local musicVolumes = {
    menu = 0.1,
    game = 0.1,
    lost = 0.1,
    win = 0.1
}

-- Create audio sources for different game states
local menuMusic = love.audio.newSource("Bolado/sounds/menu.mp3", "stream")
menuMusic:setVolume(musicVolumes.menu)

local gameMusic = love.audio.newSource("Bolado/sounds/game.mp3", "stream")
gameMusic:setVolume(musicVolumes.game)

local lostMusic = love.audio.newSource("Bolado/sounds/lost.mp3", "stream")
lostMusic:setVolume(musicVolumes.lost)

local winMusic = love.audio.newSource("Bolado/sounds/win.mp3", "stream")
winMusic:setVolume(musicVolumes.win)

-- Initialize player color
local playerColor = {1, 1, 1} -- Cor branca (valor padrão)

-- Initialize game state and data
local game = {
    difficulty = 1,
    state = {
        menu = true,
        paused = false,
        running = false,
        ended = false,
        credits = false
    },
    points = 0,
    levels = {5, 10, 15, 20}
}

local fonts = {
    medium = {
        font = love.graphics.newFont(16),
        size = 16
    },
    large = {
        font = love.graphics.newFont(24),
        size = 24
    },
    massive = {
        font = love.graphics.newFont(60),
        size = 60
    }
}

-- Initialize player properties
local player = {
    radius = 20,
    x = 30,
    y = 30
}

-- Initialize buttons for different game states
local buttons = {
    menu_state = {},
    ended_state = {},
    settings_state = {},
    win_state = {},
    credits_state = {}
}

local enemies = {}

-- Define a function to change the game state
local function changeGameState(state)
    game.state.menu = state == "menu"
    game.state.settings = state == "settings"
    game.state.running = state == "running"
    game.state.ended = state == "ended"
    game.state.win = state == "win"
    game.state.credits = state == "credits"
end

-- new game
local function startNewGame()
    changeGameState("running")
    game.points = 0
    enemies = {
        Enemy(1)
    }
end

local function toggleFullscreen()
    local isFullscreen = love.window.getFullscreen()
    love.window.setFullscreen(not isFullscreen)
    
    if isFullscreen then
        love.window.setMode(800, 600) -- Volta para as dimensões padrão (ajuste conforme necessário)
    else
        local screenWidth, screenHeight = love.graphics.getDimensions()
        love.window.setMode(screenWidth, screenHeight, {fullscreen = true})
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    if not game.state.running then
        if button == 1 then
            if game.state.menu then
                for _, btn in pairs(buttons.menu_state) do
                    btn:checkPressed(x, y, player.radius)
                end
            elseif game.state.ended then
                for _, btn in pairs(buttons.ended_state) do
                    btn:checkPressed(x, y, player.radius)
                end
            elseif game.state.settings then
                for _, btn in pairs(buttons.settings_state) do
                    btn:checkPressed(x, y, player.radius)
                end
            elseif game.state.win then
                for _, btn in pairs(buttons.win_state) do
                    btn:checkPressed(x, y, player.radius)
                end
            elseif game.state.credits then
                for _, btn in pairs(buttons.credits_state) do
                    btn:checkPressed(x, y, player.radius)
                end
            end
        end
    elseif game.state.running and button == 1 then
        if game.state.settings then
            for _, btn in pairs(buttons.settings_state) do
                if btn.text == "Skin" then
                    playerColor = {math.random(), math.random(), math.random()}
                end
            end
        end
    end
end

function love.load()
    love.mouse.setVisible(false)
    love.window.setTitle("Bolado")
    love.window.setIcon(love.image.newImageData("Bolado/components/icone.png"))
    
    
    buttons.menu_state.play_game = Button("Play Game", startNewGame, nil, 200, 40)
    buttons.menu_state.settings = Button("Settings", function() changeGameState("settings") end, nil, 200, 40)
    buttons.menu_state.exit_game = Button("Exit Game", love.event.quit, nil, 200, 40)
    buttons.menu_state.credits = Button("Credits", function() changeGameState("credits") end, nil, 200, 40)

    buttons.settings_state.Skin = Button("Skin", function()
        -- Muda a cor do jogador para uma cor aleatória
        playerColor = {math.random(), math.random(), math.random()}
    end, nil, 200, 40)
    buttons.settings_state.Play = Button("Play", startNewGame, nil, 200, 40)
    buttons.settings_state.QuitGame = Button("Quit Game", love.event.quit, nil, 200, 40)
    buttons.settings_state.Fullscreen = Button("Fullscreen (ON/OFF)", toggleFullscreen, nil, 200, 40)
    buttons.settings_state.Menu = Button("Menu", function() changeGameState("menu") end, nil, 200, 40)
    buttons.settings_state.IncreaseVolume = Button("Increase Volume", function()
        currentMusicVolume = math.min(currentMusicVolume + volumeStep, 1)
        gameMusic:setVolume(currentMusicVolume)
        lostMusic:setVolume(currentMusicVolume)
        winMusic:setVolume(currentMusicVolume)
        menuMusic:setVolume(currentMusicVolume)
    end, nil, 200, 40)
    
    buttons.settings_state.DecreaseVolume = Button("Decrease Volume", function()
        currentMusicVolume = math.max(currentMusicVolume - volumeStep, 0)
        gameMusic:setVolume(currentMusicVolume)
        lostMusic:setVolume(currentMusicVolume)
        winMusic:setVolume(currentMusicVolume)
        menuMusic:setVolume(currentMusicVolume)
    end, nil, 200, 40)
    

    buttons.ended_state.replay_game = Button("Replay", startNewGame, nil, 100, 40)
    buttons.ended_state.menu = Button("Menu", function() changeGameState("menu") end, nil, 100, 40)
    buttons.ended_state.exit_game = Button("Quit", love.event.quit, nil, 100, 40)

    buttons.win_state.replay_game = Button("Replay", startNewGame, nil, 100, 40)
    buttons.win_state.menu = Button("Menu", function() changeGameState("menu") end, nil, 100, 40)
    buttons.win_state.exit_game = Button("Quit", love.event.quit, nil, 100, 40)

    buttons.credits_state.menu = Button("Menu", function() changeGameState("menu") end, nil, 100, 40)
end

function love.update(dt)
    player.x, player.y = love.mouse.getPosition()

    love.graphics.setColor(playerColor)

    if game.state.running then
        for i = 1, #enemies do
            if not enemies[i]:checkTouched(player.x, player.y, player.radius) then
                enemies[i]:move(player.x, player.y)

                for j = 1, #game.levels do
                    if math.floor(game.points) == game.levels[j] then
                        table.insert(enemies, 1, Enemy(game.difficulty * (j + 1)))
                        game.points = game.points + 1
                    end
                end

                if math.floor(game.points) >= 20 then
                    wins = wins + 1
                    changeGameState("win")
                end
            else
                changeGameState("ended")
            end
        end
        if game.state.running then
            -- ...
            gameMusic:setVolume(currentMusicVolume)
        elseif game.state.ended then
            -- ...
            lostMusic:setVolume(currentMusicVolume)
        elseif game.state.win then
            -- ...
            winMusic:setVolume(currentMusicVolume)
        end        


        game.points = game.points + dt
        
        if game.state.running then
            gameMusic:setLooping(true)
            love.audio.play(gameMusic)
        else
            love.audio.stop(gameMusic)
        end
    end
end



function love.draw()
    love.graphics.setFont(fonts.medium.font)
    love.graphics.printf("FPS: " .. love.timer.getFPS(), 10, love.graphics.getHeight() - 30, love.graphics.getWidth())

    if wins == 2 then
        love.graphics.setBackgroundColor(127, 0, 0) -- Vermelho escuro
    elseif wins == 3 then 
        love.graphics.setBackgroundColor(0, 0, 127) -- Azul escuro
    elseif wins == 4 then 
        love.graphics.setBackgroundColor(0, 102, 0) -- Verde escuro
    end

    if game.state.menu or game.state.settings or game.state.credits then
        menuMusic:setLooping(true)
        love.audio.play(menuMusic)
    else
        love.audio.stop(menuMusic)
    end

    if game.state.win then
        winMusic:setLooping(true)
        love.audio.play(winMusic)
    else
        love.audio.stop(winMusic)
    end

    if game.state.ended then
        lostMusic:setLooping(true)
        love.audio.play(lostMusic)
    else
        love.audio.stop(lostMusic)
    end

    if game.state.running then
        love.graphics.printf(math.floor(game.points), 0, 10, love.graphics.getWidth(), "center")

        for i = 1, #enemies do
            enemies[i]:draw()
        end

        love.graphics.circle("fill", player.x, player.y, player.radius)
    elseif game.state.menu then
        local text = "In a black and white world, you arrive to make everything more colorful. \n           The self-denominated whities do not like that, TAKE CARE!  \n                               (Use your mouse to run from them)"
        love.graphics.print(text, love.graphics.getWidth() / 2 - 280 , love.graphics.getHeight() / 2 )
        buttons.menu_state.play_game:draw(30, 30, 17, 10)
        buttons.menu_state.settings:draw(30, 90, 17, 10)
        buttons.menu_state.exit_game:draw(30, 150, 17, 10)
        buttons.menu_state.credits:draw(30, 210, 17, 10)
    elseif game.state.settings then
        love.graphics.setFont(fonts.medium.font)
        buttons.settings_state.Skin:draw(30, 30, 17, 10)
        buttons.settings_state.Fullscreen:draw(30, 90, 17, 10)
        buttons.settings_state.IncreaseVolume:draw(30, 150, 17, 10) 
        buttons.settings_state.DecreaseVolume:draw(30, 210, 17, 10) 
        buttons.settings_state.Play:draw(30, 270, 17, 10)
        buttons.settings_state.Menu:draw(30, 330, 17, 10)
        buttons.settings_state.QuitGame:draw(30, 390, 17, 10)
    elseif game.state.win then
        love.graphics.setFont(fonts.large.font)
        love.graphics.setColor(255, 255, 0) -- Set text color to yellow
        local textwin = "       The prejudice is over; you turned the world into a better place. \n                                           Congrats!"
        love.graphics.print(textwin, love.graphics.getWidth() / 2 - 400 , love.graphics.getHeight() / 2 - 150)
        buttons.win_state.replay_game:draw(love.graphics.getWidth() / 2.1, love.graphics.getHeight() / 1.8, 10, 10)
        buttons.win_state.menu:draw(love.graphics.getWidth() / 2.1, love.graphics.getHeight() / 1.53, 17, 10)
        buttons.win_state.exit_game:draw(love.graphics.getWidth() / 2.1, love.graphics.getHeight() / 1.33, 22, 10)
        love.graphics.printf(math.floor(game.points), fonts.massive.font, 0, love.graphics.getHeight() / 2 - fonts.massive.size, love.graphics.getWidth(), "center")
    elseif game.state.ended then
        love.graphics.setFont(fonts.large.font)
        local textlost = "The prejudice won this time, but do not let this bother you"
        local textlost2 = "KEEP TRYING!"
        love.graphics.print(textlost, love.graphics.getWidth() / 2 - 325 , love.graphics.getHeight() / 2 - 150)
        love.graphics.print(textlost2, love.graphics.getWidth() / 2 - 75 , love.graphics.getHeight() / 2 - 100)
        buttons.ended_state.replay_game:draw(love.graphics.getWidth() / 2.1, love.graphics.getHeight() / 1.8, 10, 10)
        buttons.ended_state.menu:draw(love.graphics.getWidth() / 2.1, love.graphics.getHeight() / 1.53, 17, 10)
        buttons.ended_state.exit_game:draw(love.graphics.getWidth() / 2.1, love.graphics.getHeight() / 1.33, 22, 10)
        love.graphics.printf(math.floor(game.points), fonts.massive.font, 0, love.graphics.getHeight() / 2 - fonts.massive.size, love.graphics.getWidth(), "center")
    elseif game.state.credits then
        local textcredits = "Game made by Gabriel Seixas. Thank you for playing and bringing color to the world! :)"
        love.graphics.print(textcredits, love.graphics.getWidth() / 2 - 120 , love.graphics.getHeight() / 2 - 150)
        buttons.credits_state.menu:draw(love.graphics.getWidth() / 23, love.graphics.getHeight() / 9, 17, 10)
    end

    if not game.state.running then
        love.graphics.setColor(playerColor)
        love.graphics.circle("fill", player.x, player.y, player.radius / 2)
    end
end