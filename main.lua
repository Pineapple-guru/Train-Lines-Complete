love.graphics.setDefaultFilter('nearest','nearest')
font1 = love.graphics.newFont("fonts/monogram.ttf", 32)
font2 = love.graphics.newFont("fonts/monogram.ttf", 128)
font3 = love.graphics.newFont("fonts/monogram.ttf", 64)
font4 = love.graphics.newFont("fonts/monogram.ttf", 40)
button = love.graphics.newImage('images/button1.png')
bg = love.graphics.newImage('images/bg.png')
cloud1 = love.graphics.newImage('images/clouds2.png')
cloud2 = love.graphics.newImage('images/clouds2.png')
logo = love.graphics.newImage('images/logo.png')

love.graphics.setFont(font3)
Object = require "libraries/classic"
Gamestate = require "libraries/gamestate"
require "button"
require "menu"
require 'levelOne'
require 'credits'

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(menu)
end
