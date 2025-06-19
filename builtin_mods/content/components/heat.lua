-- HEAT IS IN CELSIUS

nk.newComponent("heat")

nk.on("nk:entitySpawned", function (ent)
    ent.components.heat = 0
end)

---change the heat of an ent
---@param ent any
---@param val any
function nk.components.heat.change(ent, val)
    ent.components.heat = ent.components.heat + val * (nk.getStorage("dt") or 0)
end

function nk.components.heat.get(ent)
    return ent.components.heat
end