nk.on("@load", function ()
    nk.main.trySpawnIngredient("chicken_meat", nk.main.posToGridPos(1, 1, nk.main.grid.info.ingredientZ))
    nk.main.trySpawnIngredient("vegetable", nk.main.posToGridPos(2, 2, nk.main.grid.info.ingredientZ))
    nk.main.trySpawnIngredient("vegetable", nk.main.posToGridPos(3, 2, nk.main.grid.info.ingredientZ))

    nk.main.trySpawnBuilding("stove", nk.main.posToGridPos(3, 2, nk.main.grid.info.buildingZ))
end)