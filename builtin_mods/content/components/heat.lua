-- HEAT IS IN CELSIUS

nk.newComponent("heat")

nk.on("nk:entitySpawned", function (ent)
    ent.components.heat = ent.components.heat or 0
    ent.components.heatLimit = ent.components.heatLimit or 100
end)

---change the heat of an ent
---@param ent any
---@param val any
function nk.components.heat.change(ent, val)
    ent.components.heat = ent.components.heat + val
end

function nk.components.heat.get(ent)
    return ent.components.heat
end

nk.on("nk:updateEntity", function (ent)
    if ent.components and ent.components.heat and ent.actionTable and ent.actionTable.onCooked then
        local heat = nk.components.heat.get(ent)
        if heat > ent.components.heatLimit then
            ent.actionTable.onCooked(ent)
        end
    end
end)