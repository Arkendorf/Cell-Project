require "camera"
require "mouse"
require "graphics"
require "layers"
require "inner"
require "gui"

function love.load()
  -- set up window
  love.graphics.setBackgroundColor(238, 238, 238)
  -- love.window.setFullscreen(true)

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
  gui_load()
end

function love.update(dt)
  mouse_update(dt)
  camera_update(dt)
  layers_update(dt)
  inner_update(dt)
  gui_update(dt)
end

function love.draw()
  -- apply camera transformations
  love.graphics.push()
  love.graphics.translate(screen.w/2, screen.h/2)
  love.graphics.scale(camera.zoom, camera.zoom)
  love.graphics.translate(-camera.x, -camera.y)

  -- draw base / cytoplasm
  love.graphics.setColor(255, 255, 255, layers[1].a)
  love.graphics.draw(img.cytoplasm)

  inner_draw()

  layers_draw()

  -- stop camera transformations
  love.graphics.pop()

  -- print info
  love.graphics.setColor(255, 255, 255)
  gui_draw()
end

function love.mousepressed(x, y, button)
  camera_mousepressed(x, y, button)
  gui_mousepressed(x, y, button)
  if level <= 1 then
    inner_mousepressed(x, y, button)
  end
end

function love.wheelmoved(x, y)
  camera_wheelmoved(x, y)
end
