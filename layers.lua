function layers_load()
  level = 3
  layers = {{txt = text[3]}, {a = 255, txt = text[2]}, {a = 255, txt = text[1]}}
end

function layers_update(dt)
  for i = 2, #layers do
    if layers[i].a > 0 and level < i then
      layers[i].a = layers[i].a - dt * 60 * 12
    end
  end
end

function layers_draw()
  -- draw cell membrane
  love.graphics.setColor(255, 255, 255, layers[2].a)
  love.graphics.draw(img.membrane)

  -- draw cell wall
  love.graphics.setColor(255, 255, 255, layers[3].a)
  love.graphics.draw(img.wall)
end

function layers_mousepressed(x, y, button)
  -- get to the center
  if button == 1 then
      -- pre organelle work
    if level > 1 then
      level = level - 1
    end
  end
end

function layers_printinfo()
  love.graphics.print(layers[level].txt)
end
