function load_txts()
  txt = {}
  local files = love.filesystem.getDirectoryItems("txt")
  for i, v in ipairs(files) do
    txt[string.sub(v, 1, -5)] = love.filesystem.read("txt/"..v)
  end
end
