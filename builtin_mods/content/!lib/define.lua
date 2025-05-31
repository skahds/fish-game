-- should i have it as a global?
contentLib = {}


nk.main.grid = {
    info = {width = 5, height = 5, buildingZ = 0, ingredientZ = 10, gridRenderSize = 32, gridRenderOffset = {x=50, y=50}},
    building = {},
    ingredient = {},
}

-- maybe ill make this handle spawning building too

function contentLib.trySpawnIngredient(entityName, gridPos, force)
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

