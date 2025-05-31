nk.on("@load", function ()
    contentLib.trySpawnIngredient("chicken_meat", nk.main.posToGridPos(1, 1, nk.main.grid.info.ingredientZ))
    contentLib.trySpawnIngredient("vegetable", nk.main.posToGridPos(2, 2, nk.main.grid.info.ingredientZ))
end)