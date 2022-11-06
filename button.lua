Button = Object:extend()

function Button:new (x, y, text)
  self.x = x
  self.y = y
  self.text = text
  self.notHovered = love.graphics.newImage('images/button1.png')
  self.hovered = love.graphics.newImage('images/hovered.png')
  self.image = self.notHovered
end

function Button:update (dt)
  if self:checkButton() then
    self.image = self.hovered
  else
    self.image = self.notHovered
  end
end

function Button:draw ()
  love.graphics.draw(self.image, self.x, self.y)
  love.graphics.setFont(font3)
  if self.text == "Play" or self.text == "Quit" then
    love.graphics.print(self.text, self.x + 82, self.y)
  else
    love.graphics.print(self.text, self.x + 48, self.y + 4)
  end
  love.graphics.setFont(font1)
end

function Button:checkButton ()
  if self.x < love.mouse.getX() and
    self.x + button:getWidth() > love.mouse.getX() and
    self.y < love.mouse.getY() and
    self.y + button:getHeight() > love.mouse.getY() then
      return true
    end
    return false
end

function Button:mousepressed (x, y, button, isTouch)
  if self:checkButton() then
    if self.text == "Play" then
      Gamestate.switch(levelOne)
    elseif self.text == "Quit" then
      love.event.quit(exitstatus)
    elseif self.text == "Level 2" then
      Gamestate.switch(levelTwo)
    elseif self.text == "Level 3" then
      Gamestate.switch(levelThree)
    elseif self.text == "Level 4" then
      Gamestate.switch(levelFour)
    elseif self.text == "Credits" then
      Gamestate.switch(credits)
    else
    end
  end
end
