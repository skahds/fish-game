love.graphics.setBackgroundColor(0.4, 0.5, 0.7)

nk.on("@load", function ()
    nk.main.trySpawnIngredient("meat", nk.main.posToGridPos(1, 1, nk.main.grid.info.ingredientZ))
    nk.main.trySpawnIngredient("meat", nk.main.posToGridPos(2, 2, nk.main.grid.info.ingredientZ))
    nk.main.trySpawnIngredient("vegetable", nk.main.posToGridPos(3, 2, nk.main.grid.info.ingredientZ))
    nk.main.trySpawnIngredient("cheese", nk.main.posToGridPos(1, 2, nk.main.grid.info.ingredientZ))
    nk.main.trySpawnIngredient("cheese", nk.main.posToGridPos(1, 3, nk.main.grid.info.ingredientZ))

    nk.main.trySpawnBuilding("stove", nk.main.posToGridPos(3, 3, nk.main.grid.info.buildingZ))
    nk.main.trySpawnBuilding("freezer", nk.main.posToGridPos(4, 3, nk.main.grid.info.buildingZ))
end)