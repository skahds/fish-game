nk.newComponent("value")

nk.on("nk:entitySpawned", function (ent)
    ent.components.value = 0
end)

---change the heat of an ent
---@param ent any
---@param val any
function nk.components.value.change(ent, val)
    ent.components.value = ent.components.value + val * (nk.getStorage("dt") or 0)
end

function nk.components.value.get(ent)
    return ent.components.value
end