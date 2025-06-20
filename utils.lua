utils = {}

function utils.copy(t)
  local copy = {}

  for k, v in pairs(t) do
    copy[k] = v
  end

  local mt = getmetatable(t)
  if mt then
    setmetatable(copy, mt)
  end

  return copy
end

function utils.deepCopy(t)
  local copy = {}

  for k, v in pairs(t) do
    if type(v) == "table" then
      copy[k] = utils.deepCopy(v)
    else
      copy[k] = v
    end
  end

  local mt = getmetatable(t)
  if mt then
    setmetatable(copy, mt)
  end

  return copy
end