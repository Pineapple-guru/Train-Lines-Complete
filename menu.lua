menu = {}

buttons = {}
cloudTable= {}
cloudTable.x1 = 0
cloudTable.x2 = 0 - love.graphics.getWidth()
cloudTable.x3 = 0


function menu:init()
  ww = love.graphics.getWidth()
  wh = love.graphics.getHeight()
  button = love.graphics.newImage('images/button1.png')
  bg = love.graphics.newImage('images/bg.png')
  cloud1 = love.graphics.newImage('images/clouds2.png')
  cloud2 = love.graphics.newImage('images/clouds2.png')
  logo = love.graphics.newImage('images/logo.png')
  button_1 = Button(ww/2 - button:getWidth()/2, 300, "Play")
  table.insert(buttons, button_1)
  button_2 = Button(ww/2 - button:getWidth()/2, 400, "Quit")
  table.insert(buttons, button_2)
end

function menu:draw()
  -- love.graphics.draw(drawable, x, y, r, sx, sy, ox, oy, kx, ky)
  love.graphics.draw(cloud1, cloudTable.x3,0)
  love.graphics.draw(cloud1, cloudTable.x1,0)
  love.graphics.draw(cloud2, cloudTable.x2,0)
  -- love.graphics.draw(logo, ww/2 - logo:getWidth()/2, 100)
  love.graphics.setFont(font2)
  love.graphics.print("Train Lines", ww/2 - logo:getWidth()/2, 100)
  love.graphics.setFont(font3)
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
  cloudTable.x1 = cloudTable.x1 + 1
  cloudTable.x2 = cloudTable.x2 + 1

  if cloudTable.x1 > love.graphics.getWidth() then
    cloudTable.x1 = 0 - love.graphics.getWidth()
  end

  if cloudTable.x2 > love.graphics.getWidth() then
    cloudTable.x2 = 0 - love.graphics.getWidth()
  end

  for i, button in ipairs(buttons) do
    button:update(dt)
  end
  if love.keyboard.isDown('return') then
    Gamestate.switch(levelOne)
  end
end
