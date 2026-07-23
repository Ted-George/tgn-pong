push = require 'push'

-- virtual resolution
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

-- actual window size
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

--Scroll speeds
BACKGROUND_SCROLL_SPEED = 30
GROUND_SCROLL_SPEED = 60

-- Looping points
BACKGROUND_LOOPING_POINT = VIRTUAL_WIDTH

--scroll values
local backgroundScroll = 0
local groundScroll = 0

-- images
local background
local ground

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setMode(VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    love.window.setTitle('Flappy Bird')

    background = love.graphics.newImage('background.png')
    ground = love.graphics.newImage('ground.png')

end

function love.update(dt)
    backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
    groundScroll = (groundScroll + GROUND_SCROLL_SPEED * dt) % VIRTUAL_WIDTH
end

function love.draw()
    love.graphics.draw(background, -backgroundScroll, 0, 0, 
        VIRTUAL_WIDTH / background:getWidth(), 
        VIRTUAL_HEIGHT / background:getHeight())
    love.graphics.draw(background, -backgroundScroll + VIRTUAL_WIDTH, 0, 0,
        VIRTUAL_WIDTH / background:getWidth(),
        VIRTUAL_HEIGHT / background:getHeight())
    love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 16)
end
