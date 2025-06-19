nk.components = {}

function nk.newComponent(id)
    nk.components[id] = {}
end

-- nk.on("nk:entitySpawned", function (ent)
--     ent.components = ent.components or {}
--     print("newEntComp: " .. (ent.components.heat or "nil"))
-- end)