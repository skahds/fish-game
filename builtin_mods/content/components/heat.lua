-- HEAT IS IN CELSIUS

nk.newComponent("heat")

nk.on("nk:entitySpawned", function (ent)
    ent.components.heat = ent.components.heat or 0
    ent.components.heatLimit = ent.components.heatLimit or 100
    ent.components.freezingPoint = ent.components.freezingPoint or 0
end)

---change the heat of an ent
---@param ent any
---@param val any
function nk.components.heat.change(ent, val)
    ent.components.heat = ent.components.heat + val
end

function nk.components.heat.get(ent)
    if ent.components then
        return ent.components.heat
    end
end

nk.on("nk:updateEntity", function (ent)
    if ent.components and ent.components.heat then

        local heat = nk.components.heat.get(ent)
        if ent.actionTable then
            if heat > ent.components.heatLimit and ent.actionTable.onCooked then
                nk.main.activateEntity(ent.actionTable.onCooked, ent)
            end
            if heat < ent.components.freezingPoint and ent.actionTable.onFrozen then
                nk.main.activateEntity(ent.actionTable.onFrozen, ent)
            end
        end

        if heat ~= 0 then
            local dt = nk.getStorage("dt")
            local change = -heat/100 * dt
            nk.components.heat.change(ent, change)
        end
        
    end

end)