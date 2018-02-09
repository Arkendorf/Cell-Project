function inner_load()
  type = {nucleus = {cut = true, w = 1024, h = 1024, txt = text[4]}, rougher = {w = 1282, h = 806, txt = text[5]}, smoother = {w = 1106, h = 656, txt = text[6]}, golgi = {w = 982, h = 822, txt = text[7]},
  cvacuole = {w = 1564, h = 1086, txt = text[8]}, vacuole = {w = 714, h =542, txt = text[9]}, chloroplast = {cut = true, w = 596, h = 474, txt = text[10]}, mitochondrion = {cut = true, w = 346, h = 522, txt = text[11]},
  ribosome = {w = 42, h = 42, txt = text[12]}, skeleton = {w = 256, h = 42, txt = text[13]}, vesicle = {w = 80, h = 80, txt = text[14]}, peroxisome = {w = 200, h = 186, txt = text[15]},
  lysosome = {w = 200, h = 186, txt = text[16]}}

  organelles = {{x = 800, y = 600, a = 255, a2 = 255, type = "nucleus"}, {x = 760, y = 850, a = 255, type = "rougher"}, {x = 750, y = 1050, a = 255, type = "smoother"}, {x = 1340, y = 1040, a = 255, a2 = 255, type = "chloroplast"},
  {x = 1160, y = 1280, a = 255, type = "golgi"}, {x = 300, y = 800, a = 255, a2 = 255, type = "chloroplast"}, {x = 220, y = 1020, a = 255, a2 = 255, type = "mitochondrion"}, {x = 520, y = 1280, a = 255, type = "cvacuole"},
  {x = 1240, y = 780, a = 255, type = "vacuole"}, {x = 1100, y = 1000, a = 255, a2 = 255, type = "mitochondrion"}, {x = 1084, y = 614, a = 255, type = "ribosome"}, {x = 1220, y = 918, a = 255, type = "ribosome"},
  {x = 1084, y = 614, a = 255, type = "ribosome"}, {x = 440, y = 896, a = 255, type = "ribosome"}, {x = 1434, y = 1282, a = 255, type = "ribosome"}, {x = 146, y = 1280, a = 255, type = "ribosome"}, {x = 376, y = 946, a = 255, r = -30, type = "skeleton"},
  {x = 396, y = 1006, a = 255, r = -15, type = "skeleton"}, {x = 1118, y = 812, a = 255, r = 45, type = "skeleton"}, {x = 444, y = 670, a = 255, r = 0, type = "skeleton"}, {x = 1384, y = 1192, a = 255, type = "vesicle"},
  {x = 1436, y = 898, a = 255, type = "vesicle"}, {x = 970, y = 1508, a = 255, type = "vesicle"}, {x = 800, y = 1600, a = 255, type = "lysosome"}, {x = 886, y = 1214, a = 255, type = "peroxisome"}}

  target = 0
end

function inner_update(dt)
  for i, v in ipairs(organelles) do
    if (target == i or target <= 0) and v.a < 255 then
      v.a = v.a + dt * 60 * 12
    elseif target > 0 and target ~= i and v.a > 0 then
      v.a = v.a - dt * 60 * 12
    end
    if v.a2 then
      if target <= 0 and v.a2 < 255 then
        v.a2 = v.a2 + dt * 60 * 12
      elseif v.a2 > 0 then
        v.a2 = v.a2 - dt * 60 * 12
      end
    end
  end
end

function inner_draw()
  -- draw organelles
  for i, v in ipairs(organelles) do
    draw_organelle(i, v)
  end
end

function inner_mousepressed(x, y, button)
  if button == 1 then
    for i, v in ipairs(organelles) do
      local w = type[v.type].w/4
      local h = type[v.type].h/4
      if mouse.tx > v.x - w and mouse.tx < v.x + w and mouse.ty > v.y - h and mouse.ty < v.y + h then
        target = i
        break
      else
        target = 0
      end
    end
  end
end

function draw_organelle(i, v)
  if type[v.type].cut then
    -- draw inner layer of organelle
    love.graphics.setColor(255, 255, 255, v.a)
    love.graphics.draw(img[v.type.."2"], v.x, v.y, 0, .5, .5, type[v.type].w/2, type[v.type].h/2)

    -- draw outer layer
    love.graphics.setColor(255, 255, 255, v.a2)
    love.graphics.draw(img[v.type.."1"], v.x, v.y, 0, .5, .5, type[v.type].w/2, type[v.type].h/2)
  else
    love.graphics.setColor(255, 255, 255, v.a)
    if v.r then
      love.graphics.draw(img[v.type], v.x, v.y, math.rad(v.r), .5, .5, type[v.type].w/2, type[v.type].h/2)
    else
      love.graphics.draw(img[v.type], v.x, v.y, 0, .5, .5, type[v.type].w/2, type[v.type].h/2)
    end
  end
end


function inner_info()
  return type[organelles[target].type].txt
end
