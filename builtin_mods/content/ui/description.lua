nk.main.defineDescription(1, function (ent)
    return "Name: " .. ent.name
    .. "\n----------"
end)

nk.main.defineDescription(5, function (ent)
    if ent.actionTable then
        if ent.actionTable.onCooked then
            return "When temperature reaches " .. ent.components.heatLimit .. ":\n"
            ..ent.actionTable.onCooked.description
        end
    end
end)

nk.main.defineDescription(6, function (ent)
    if ent.actionTable then
        if ent.actionTable.onFrozen then
            return "When temperature reaches " .. ent.components.freezingPoint .. ":\n"
            ..ent.actionTable.onFrozen.description
        end
    end
end)

nk.main.defineDescription(50, function (ent)
    local heat = nk.components.heat.get(ent)
    if heat and heat ~= 0 then
        return "Temperature: " .. math.floor(heat * 10)/10
    end
end)

nk.main.defineDescription(51, function (ent)
    local value = nk.components.value.get(ent)
    if value then
        return "$" .. math.floor(value * 10)/10
    end
end)