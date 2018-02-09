function camera_load()
  screen = {w = love.graphics.getWidth(), h = love.graphics.getHeight()}
  camera = {x = 0, y = 0, zoom = 1, zoomV = 0}
  camera_pan = {x = 0, y = 0, w = 0, h = 0}
end

function camera_update(dt)
  if love.mouse.isDown(2) then
    camera_pan.w = camera_pan.x - mouse.x
    camera_pan.h = camera_pan.y - mouse.y
    camera.x = camera.x + camera_pan.w/camera.zoom
    camera.y = camera.y + camera_pan.h/camera.zoom
    camera_pan.x = mouse.x
    camera_pan.y = mouse.y
  elseif camera_pan.w ~= 0 or camera_pan.h ~= 0 then
    camera_pan.w = 0
    camera_pan.h = 0
  end

  camera.zoom = camera.zoom + camera.zoomV
  camera.zoomV = camera.zoomV * 0.6
  if camera.zoom < 0.1 then
    camera.zoom = 0.1
    camera.zoomV = 0
  end
end

function camera_mousepressed(x, y, button)
  if button == 2 then
    camera_pan.x = x
    camera_pan.y = y
  end
end

function camera_wheelmoved(x, y)
  camera.zoomV = y * 0.1 * camera.zoom
end
