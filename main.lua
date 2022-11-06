love.graphics.setDefaultFilter('nearest','nearest')
font1 = love.graphics.newFont("fonts/monogram.ttf", 32)
font2 = love.graphics.newFont("fonts/monogram.ttf", 128)
font3 = love.graphics.newFont("fonts/monogram.ttf", 64)
font4 = love.graphics.newFont("fonts/monogram.ttf", 40)
love.graphics.setFont(font3)
Object = require "libraries/classic"
Gamestate = require "libraries/gamestate"
require "button"
require "menu"
require 'levelOne'

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(menu)
end
