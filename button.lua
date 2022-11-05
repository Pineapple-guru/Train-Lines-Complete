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
    print(self.text)
  end
end
