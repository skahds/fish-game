nk.main.defineDescription(1, function (ent)
    return "Name: " .. ent.name
end)

nk.main.defineDescription(2, function (ent)
    local heat = nk.components.heat.getHeat(ent)
    if heat and heat > 0 then
        return "Heat: " .. math.floor(heat * 10)/10
    end
end)