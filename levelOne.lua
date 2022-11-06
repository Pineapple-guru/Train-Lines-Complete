levelOne = {}
require "tile"

function levelOne:init ()
  x = 64
  y = 64
  gridw = 64
  gridh = 64
  mousex = 0
  mousey = 0
  mouse_floor_x = 0
  mouse_floor_y = 0
  track_limit = 16
  success = false
  bg = love.graphics.newImage("images/bg.png")
  object_tracker = {}
  for i = 0,15 do
      table.insert(object_tracker, {})
      for j = 0,8 do
          local empty_tile = Tile(i * x, j * y, "empty", "images/empty_tile.png")
          table.insert(object_tracker[i + 1], empty_tile)
      end
  end
  local start_tile = Tile(2 * x, 5 * y, "start", "images/TrainStation3.png")
  object_tracker[3][6] = start_tile
  local end_tile = Tile(12 * x, 1 * y, "end", "images/end_tile.png")
  object_tracker[13][2] = end_tile
  end_position = {12, 1}
  current_tile_stack = {}
  table.insert(current_tile_stack, {2, 5})
  local mountain_tile = Tile(6 * x, 3 * y, "mountain", "images/mountain_tile.png")
  object_tracker[7][4] = mountain_tile
  local mountain_tile = Tile(1 * x, 8 * y, "mountain", "images/mountain_tile.png")
  object_tracker[2][9] = mountain_tile
  local mountain_tile = Tile(6 * x, 4 * y, "mountain", "images/mountain_tile.png")
  object_tracker[7][5] = mountain_tile
end

function levelOne:update (dt)
  mousex, mousey = love.mouse.getPosition()
  mouse_floor_x = math.floor(mousex / 64)
  mouse_floor_y = math.floor(mousey / 64)
  if (current_tile_stack[table.maxn(current_tile_stack)][1] - 1 == end_position[1] and current_tile_stack[table.maxn(current_tile_stack)][2] == end_position[2]) or (current_tile_stack[table.maxn(current_tile_stack)][1] + 1 == end_position[1] and current_tile_stack[table.maxn(current_tile_stack)][2] == end_position[2]) or (current_tile_stack[table.maxn(current_tile_stack)][1] == end_position[1] and current_tile_stack[table.maxn(current_tile_stack)][2] - 1 == end_position[2]) or (current_tile_stack[table.maxn(current_tile_stack)][1] == end_position[1] and current_tile_stack[table.maxn(current_tile_stack)][2] == end_position[2] + 1) then
      success = true
  end
  if love.mouse.isDown(1) and track_limit > 0 then
      if ((mouse_floor_x == current_tile_stack[table.maxn(current_tile_stack)][1] - 1 and mouse_floor_y == current_tile_stack[table.maxn(current_tile_stack)][2]) or (mouse_floor_x == current_tile_stack[table.maxn(current_tile_stack)][1] + 1 and mouse_floor_y == current_tile_stack[table.maxn(current_tile_stack)][2]) or (mouse_floor_x == current_tile_stack[table.maxn(current_tile_stack)][1] and mouse_floor_y == current_tile_stack[table.maxn(current_tile_stack)][2] - 1) or (mouse_floor_x == current_tile_stack[table.maxn(current_tile_stack)][1] and mouse_floor_y == current_tile_stack[table.maxn(current_tile_stack)][2] + 1)) and check_square(mouse_floor_x, mouse_floor_y) then
          local track = Tile(mouse_floor_x * x, mouse_floor_y * y, "track", "images/trackHorizontal.png")
          object_tracker[mouse_floor_x + 1][mouse_floor_y + 1] = track
          table.insert(current_tile_stack, {mouse_floor_x, mouse_floor_y})
          track_limit = track_limit - 1
      end
  end
  if love.mouse.isDown(2) then
      if mouse_floor_x == current_tile_stack[table.maxn(current_tile_stack)][1] and mouse_floor_y == current_tile_stack[table.maxn(current_tile_stack)][2] and object_tracker[mouse_floor_x + 1][mouse_floor_y + 1].name == "track" then
          local empty_tile = Tile(mouse_floor_x * x, mouse_floor_y * y, "empty", "images/empty_tile.png")
          object_tracker[mouse_floor_x + 1][mouse_floor_y + 1] = empty_tile
          table.remove(current_tile_stack, table.maxn(current_tile_stack))
          track_limit = track_limit + 1
      end
  end
end

function levelOne:draw ()
  love.graphics.draw(bg, 0, 0)
  for i, column in ipairs(object_tracker) do
      for j, tile in ipairs(column) do
          tile:draw()
      end
  end
  love.graphics.setFont(font4)
  love.graphics.print("Number of tracks left: " .. track_limit, 16, 10)
  if success then
    -- love.graphics.draw()
    love.graphics.setFont(font2)
    love.graphics.print("Good Job!", love.graphics.getWidth()/4 + 64, love.graphics.getHeight()/2 + 96)
  end
end

function check_square(x, y)
    if x >= 0 and x <= 15 and y >= 0 and y <= 8 then
        return object_tracker[x + 1][y + 1].name == "empty"
    end
end
