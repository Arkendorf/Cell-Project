function load_imgs()
  img = {}
  local files = love.filesystem.getDirectoryItems("img")
  for i, v in ipairs(files) do
    img[string.sub(v, 1, -5)] = love.graphics.newImage("img/"..v)
  end
end
