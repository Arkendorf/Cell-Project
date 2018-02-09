function mouse_load()
  mouse = {x = 0, y = 0, mapX = 0, mapY = 0, clickX = 0, clickY = 0}
end

function mouse_update(dt)
  mouse.x = love.mouse.getX()
  mouse.y = love.mouse.getY()
  mouse.tx = (mouse.x-screen.w/2)/camera.zoom+camera.x
  mouse.ty =  (mouse.y-screen.h/2)/camera.zoom+camera.y
end

function mouse_mousepressed(x, y, button)
  if button == 1 then
    mouse.clickX = x
    mouse.clickY = y
  end
end
