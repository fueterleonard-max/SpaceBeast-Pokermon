local utils = {}

function utils.map_list(list, func)
  local out = {}
  for _, v in ipairs(list) do out[#out + 1] = func(v) end
  return out
end

return { key = "utils", value = utils }