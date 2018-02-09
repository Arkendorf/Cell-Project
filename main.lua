require "camera"
require "mouse"
require "graphics"
require "layers"
require "inner"

function love.load()
  -- load text
  text = {}
  for line in love.filesystem.lines("text.txt") do
    text[#text+1] = line
  end

  load_imgs()
  mouse_load()
  camera_load()
  layers_load()
  inner_load()
end

function love.update(dt)
  mouse_update(dt)
  camera_update(dt)
  layers_update(dt)
  inner_update(dt)
end

function love.draw()
  -- apply camera transformations
  love.graphics.push()
  love.graphics.translate(screen.w/2, screen.h/2)
  love.graphics.scale(camera.zoom, camera.zoom)
  love.graphics.translate(-camera.x, -camera.y)

  -- draw base / cytoplasm
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(img.cytoplasm)

  inner_draw()

  layers_draw()

  -- stop camera transformations
  love.graphics.pop()

  -- print info
  love.graphics.setColor(255, 255, 255)
  if target > 0 then
    inner_printinfo()
  else
    layers_printinfo()
  end
  love.graphics.print(tostring(mouse.tx)..", "..tostring(mouse.ty), 0, 16)
end

function love.mousepressed(x, y, button)
  camera_mousepressed(x, y, button)
  layers_mousepressed(x, y, button)
  if level <= 1 then
    inner_mousepressed(x, y, button)
  end
end

function love.wheelmoved(x, y)
  camera_wheelmoved(x, y)
end
