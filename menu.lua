menu = {}

buttons = {}

function menu:init()
  ww = love.graphics.getWidth()
  wh = love.graphics.getHeight()
  button = love.graphics.newImage('images/button1.png')
  bg = love.graphics.newImage('images/bg.png')
  logo = love.graphics.newImage('images/logo.png')
  button_1 = Button(ww/2 - button:getWidth()/2, 300, "Play")
  table.insert(buttons, button_1)
  button_2 = Button(ww/2 - button:getWidth()/2, 400, "Quit")
  table.insert(buttons, button_2)
end

function menu:draw()
  love.graphics.draw(bg, 0, 0)
  love.graphics.draw(logo, ww/2 - logo:getWidth()/2, 100)
  for i, button in ipairs(buttons) do
    button:draw()
  end
end

function menu:mousepressed(x, y, button, isTouch)
  for i, button in ipairs(buttons) do
    button:mousepressed(x, y, button, isTouch)
  end
end

function menu:update(dt)
  for i, button in ipairs(buttons) do
    button:update(dt)
  end
  if love.keyboard.isDown('return') then
    Gamestate.switch(levelOne)
  end
end
