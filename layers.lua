function layers_load()
  level = 3
  layers = {{a = 255}, {a = 255}, {a = 255}}
end

function layers_update(dt)
  for i = 2, #layers do
    if layers[i].a > 0 and level < i then
      layers[i].a = layers[i].a - dt * 60 * 12
    elseif layers[i].a < 255 and level >= i then
      layers[i].a = layers[i].a + dt * 60 * 12
    end
  end
  if target > 0 and layers[1].a > 0 then
    layers[1].a = layers[1].a - dt * 60 * 12
  elseif target <= 0 and layers[1].a < 255 then
    layers[1].a = layers[1].a + dt * 60 * 12
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

function layers_info()
  return txt[tostring(level)]
end
