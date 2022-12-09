-- Library imports
local love = require('love')

-- Custom module imports
local Ball = require('class.ball')
local Enemy = require('class.enemy')
local closeGameWindow = require('gameWindow')

-- State object for whole game
local game = {
  state = {
    menu = false,
    paused = false,
    running = true,
    ended = false,
  }
}

local player = {
  radius = 20,
  x = 30,
  y = 30,
}

local enemies = {}

-- the below is so we can make it easier to add fonts to our buttons and text
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

function menuScreen()
  love.graphics.print('Menu screen')
end

function gameScreen()
  Ball(player.radius, player.x, player.y):draw()

  for i = 1, #enemies do
    enemies[i]:draw()
  end
end

-- Love2d -> game calls

function love.load()
  table.insert(enemies, 1, Enemy())

  for i = 1, #enemies do
    enemies[i]:draw()
  end
end

function love.update(dt)
  if game.state.menu then player.radius = 10
  else player.radius = 20
  end

  player.x, player.y = love.mouse.getPosition()

  for i = 1, #enemies do
    enemies[i]:moveTowardsPlayer(player)
  end
end

function love.draw()
  -- restore font to original size (default to medium)
  love.graphics.setFont(fonts.medium.font)

  love.graphics.printf('FPS: ' .. love.timer.getFPS(), fonts.medium.font, 10, love.graphics.getHeight() - 30, love.graphics.getWidth())

  if game.state.menu then
    menuScreen()
  else if game.state.running then
    gameScreen()
  end end
end
