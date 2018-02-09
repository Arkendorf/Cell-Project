function gui_load()
  love.graphics.setLineWidth(4)
end

function gui_update(dt)
end

function gui_draw()
  -- draw info
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", 2, 2, 388, screen.h-136)
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("line", 2, 2, 388, screen.h-136)
  if target > 0 then
    love.graphics.printf(inner_info(), 6, 6, 380)
  else
    love.graphics.printf(layers_info(), 6, 6, 380)
  end

  -- draw buttons
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(img.buttons, 0, screen.h-128)
end

function gui_mousepressed(x, y, button)
  if x > 0 and x < 128 and y > screen.h-128 and y < screen.h then
    level = 3
  elseif x > 132 and x < 260 and y > screen.h-128 and y < screen.h then
    level = 2
  elseif x > 264 and x < 392 and y > screen.h-128 and y < screen.h then
    level = 1
  end
end
