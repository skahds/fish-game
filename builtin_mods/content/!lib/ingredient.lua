local function setRealPosToGridPos(ent)
    if ent.gridPos then
        local gridInfo = nk.main.grid.info
        ent.x = gridInfo.gridRenderOffset.x + (ent.gridPos.x-1)*gridInfo.gridRenderSize
        ent.y = gridInfo.gridRenderOffset.y + (ent.gridPos.y-1)*gridInfo.gridRenderSize
        ent.width = gridInfo.gridRenderSize
        ent.height = gridInfo.gridRenderSize
    end
end

function nk.main.defineIngredient(id, eType)
    eType.isIngredient = true

    --[[ updateFunctions is a table that contains all the functions that is called on update with param ent
    , this is so it can add more functions ]]
    eType.updateFunctions = {}
    eType.loadFunctions = {setRealPosToGridPos}
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

    eType.setRealPosToGridPos = setRealPosToGridPos


    eType.getGridPos = function (ent)
        if ent.gridPos then
            return ent.gridPos
        end
    end
    nk.main.defineEntity(id, eType)
end