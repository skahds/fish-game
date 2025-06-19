function nk.main.defineIngredient(id, eType, actionTable)
    eType.isIngredient = true
    eType.actionTable = actionTable or {}

    eType.renderLayer = 10

    --[[ updateFunctions is a table that contains all the functions that is called on update with param ent
    , this is so it can add more functions ]]
    eType.updateFunctions = {}
    eType.loadFunctions = {nk.main.setRealPosToGridPos}
    eType.onUpdate = function (ent)
        for _, func in pairs(ent.updateFunctions) do
            func(ent)
        end
    end
    eType.onLoad = function (ent)
        for _, func in pairs(ent.loadFunctions) do
            func(ent)
        end
    end

    eType.setRealPosToGridPos = nk.main.setRealPosToGridPos

    eType.getGridPos = function (ent)
        if ent.gridPos then
            return ent.gridPos
        end
    end


    nk.main.defineEntity(id, eType)
end

function nk.main.trySpawnIngredient(entityName, gridPos, force)
    force = force or false

    local originalGridEnt = nk.main.gridPosToEnt(gridPos)

    print("trySpawnIngredient " .. entityName)
    local ent
    if originalGridEnt == nil then
        ent = nk.main.spawnEntity(entityName, {gridPos=gridPos}, true)
    elseif force and originalGridEnt then
        originalGridEnt:delete()
        ent = nk.main.spawnEntity(entityName, {gridPos=gridPos}, true)
    end
    
    if ent then
        nk.main.grid.ingredient[gridPos.index] = ent
    end

end