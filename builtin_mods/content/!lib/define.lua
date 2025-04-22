-- should i have it as a global?
contentLib = {}


nk.main.grid = {
    info = {width = 5, height = 5, buildingZ = 0, ingredientZ = 10, gridRenderSize = 30, gridRenderOffset = {x=100, y=100}},
    building = {},
    ingredient = {},
}


function contentLib.trySpawnIngredient(entityName, gridPos, force)
    force = force or false

    local originalGridEnt = nk.main.gridPosToEnt(gridPos)

    print("trySpawnIngredient " .. entityName)
    if originalGridEnt == nil then
        nk.main.spawnEntity(entityName, {gridPos=gridPos})
    elseif force and originalGridEnt then
        originalGridEnt:delete()
        nk.main.spawnEntity(entityName, {gridPos=gridPos})
    end

end

