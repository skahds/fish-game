function nk.main.defineIngredient(id, eType)
    eType.isIngredient = true
    eType.onUpdate = function (ent)
        if ent.gridPos then
            ent.x = nk.main.grid.info.gridRenderOffset.x
            ent.y = nk.main.grid.info.gridRenderOffset.y
            ent.width = nk.main.grid.info.gridRenderSize
            ent.height = nk.main.grid.info.gridRenderSize
        end
    end
    nk.main.defineEntity(id, eType)
end