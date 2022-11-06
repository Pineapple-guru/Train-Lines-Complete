credits = {}

function credits:init ()
end

function credits:update (dt)
  cloudTable.x1 = cloudTable.x1 + 1
  cloudTable.x2 = cloudTable.x2 + 1

  if cloudTable.x1 > love.graphics.getWidth() then
    cloudTable.x1 = 0 - love.graphics.getWidth()
  end

  if cloudTable.x2 > love.graphics.getWidth() then
    cloudTable.x2 = 0 - love.graphics.getWidth()
  end
end

function credits:draw ()
  love.graphics.draw(cloud1, cloudTable.x3,0)
  love.graphics.draw(cloud1, cloudTable.x1,0)
  love.graphics.draw(cloud2, cloudTable.x2,0)
  love.graphics.setColor(0,0,0,0.7)
  love.graphics.rectangle('fill', 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
  love.graphics.setColor(1,1,1)
  love.graphics.setFont(font3)
  love.graphics.print("Thanks for playing!", love.graphics.getWidth()/4 + 32, love.graphics.getHeight()/4 - 64)
  love.graphics.print("Made by:", love.graphics.getWidth()/2 - 64, love.graphics.getHeight()/4)
  love.graphics.print("Noah-Eben Mwasanje", love.graphics.getWidth()/4 + 64, love.graphics.getHeight()/4 + 64)
  love.graphics.print("James Ferguson", love.graphics.getWidth()/4 + 100, love.graphics.getHeight()/4 + 128)
  love.graphics.print("Keaton Terry", love.graphics.getWidth()/4 + 124, love.graphics.getHeight()/4 + 192)
  love.graphics.print("Caleb Illif", love.graphics.getWidth()/4 + 136, love.graphics.getHeight()/4 + 256)
  love.graphics.setFont(font1)
end
