function nk.main.transformEntity(ent, newEntId, ret)
    local ret = ret or false
    local newEnt
    local gridPos = nk.main.getGridPos(ent)
    if ent.isIngredient then
        newEnt = nk.main.trySpawnIngredient(newEntId, gridPos, true, true)
    end
    if ent.isBuilding then
        newEnt = nk.main.trySpawnBuilding(newEntId, gridPos, true, true)
    end
    if ret then
        return newEnt
    end
end