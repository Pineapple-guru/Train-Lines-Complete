Object = require "libraries/classic"
Gamestate = require "libraries/gamestate"
require "button"
require "menu"
require 'levelOne'

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(menu)
end
