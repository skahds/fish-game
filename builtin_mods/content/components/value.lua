nk.newComponent("value")

nk.on("nk:entitySpawned", function (ent)
    ent.components.value = ent.components.value or 0
end)

---change the value of an ent
---@param ent any
---@param val any
function nk.components.value.change(ent, val)
    ent.components.value = ent.components.value + val
end

function nk.components.value.get(ent)
    return ent.components.value
end