function inner_load()
  type = {nucleus = {img = "nucleus", cut = true, w = 1024, h = 1024, txt = text[4]}, rougher = {img = "rougher", w = 1282, h = 806, txt = text[5]}, smoother = {img = "smoother", w = 1106, h = 656, txt = text[6]}, golgi = {img = "golgi", w = 982, h = 822, txt = text[7]},
  cvacuole = {img = "cvacuole", w = 1564, h = 1086, txt = text[8]}, vacuole = {img = "vacuole", w = 714, h =542, txt = text[9]}, chloroplast = {img = "chloroplast", cut = true, w = 596, h = 474, txt = text[10]}, mitochondrion = {img = "mitochondrion", cut = true, w = 346, h = 522, txt = text[11]}}

  organelles = {{x = 800, y = 600, a = 255, type = "nucleus"}, {x = 760, y = 850, type = "rougher"}, {x = 750, y = 1050, type = "smoother"}, {x = 1340, y = 1040, a = 255, type = "chloroplast"}, {x = 1160, y = 1280, type = "golgi"}, {x = 300, y = 800, a = 255, type = "chloroplast"},
  {x = 220, y = 1020, a = 255, type = "mitochondrion"}, {x = 520, y = 1280, type = "cvacuole"}, {x = 1240, y = 780, type = "vacuole"}, {x = 1100, y = 1000, a = 255, type = "mitochondrion"}}

  target = 0
end

function inner_update(dt)
  for i, v in ipairs(organelles) do
    if v.a and target == i and v.a > 0 then
      v.a = v.a - dt * 60 * 12
    elseif v.a and target ~= i and v.a < 255 then
      v.a = v.a + dt * 60 * 12
    end
  end
end

function inner_draw()
  -- draw organelles
  for i, v in ipairs(organelles) do
    if type[v.type].cut then
      -- draw inner layer of organelle
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.draw(img[type[v.type].img.."2"], v.x, v.y, 0, .5, .5, type[v.type].w/2, type[v.type].h/2)

      -- draw outer layer
      love.graphics.setColor(255, 255, 255, v.a)
      love.graphics.draw(img[type[v.type].img.."1"], v.x, v.y, 0, .5, .5, type[v.type].w/2, type[v.type].h/2)
    else
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.draw(img[type[v.type].img], v.x, v.y, 0, .5, .5, type[v.type].w/2, type[v.type].h/2)
    end
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

function inner_printinfo()
  love.graphics.print(type[organelles[target].type].txt)
end
