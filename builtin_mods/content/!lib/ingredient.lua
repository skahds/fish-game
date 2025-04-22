function nk.main.defineIngredient(id, eType)
    eType.isIngredient = true
    eType.onUpdate = function (ent)
        if ent.gridPos then
            local gridInfo = nk.main.grid.info
            ent.x = gridInfo.gridRenderOffset.x + ent.gridPos.x*gridInfo.gridRenderSize
            ent.y = gridInfo.gridRenderOffset.y + ent.gridPos.y*gridInfo.gridRenderSize
            ent.width = gridInfo.gridRenderSize
            ent.height = gridInfo.gridRenderSize
        end
    end
    nk.main.defineEntity(id, eType)
end