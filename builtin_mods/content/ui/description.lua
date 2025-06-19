nk.main.defineDescription(1, function (ent)
    return "Name: " .. ent.name
end)

nk.main.defineDescription(50, function (ent)
    local heat = nk.components.heat.get(ent)
    if heat and heat > 0 then
        return "Temperature: " .. math.floor(heat * 10)/10
    end
end)

nk.main.defineDescription(51, function (ent)
    local value = nk.components.value.get(ent)
    if value then
        return "$" .. math.floor(value * 10)/10
    end
end)