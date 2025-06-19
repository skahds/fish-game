nk.main.defineIngredient("cheese", {
    name = "cheese",
    image = "cheese",
    components = {heatLimit = 40},
}, {
    onCookedDescription = "Adjacent food gains $1 value",
    onCooked = function (ent)
        local selfPos = nk.main.getGridPos(ent)
        nk.main.trySpawnIngredient("melted_cheese", selfPos, true)
    end
})

nk.main.defineIngredient("melted_cheese", {
    name = "Melted Cheese",
    image = "melted_cheese",
})
