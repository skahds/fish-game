nk.components = {}

function nk.newComponent(id)
    nk.components[id] = {}
end

nk.on("nk:entitySpawned", function (ent)
    ent.components = {}
end)