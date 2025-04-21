-- should i have it as a global?
contentLib = {}


nk.main.grid = {
    info = {width = 5, height = 5, buildingZ = 0, ingredientZ = 10, gridRenderSize = 30, gridRenderOffset = {30, 30}},
    building = {},
    ingredient = {},
}


function contentLib.trySpawnIngredient(entityName, gridPos, force)
    force = force or false

    local originalGridEnt = nk.main.gridPosToEnt(gridPos)

    if originalGridEnt == false then
        nk.main.spawnEntity(entityName, {gridPos=gridPos})
    elseif force and originalGridEnt then
        originalGridEnt:delete()
    end

end