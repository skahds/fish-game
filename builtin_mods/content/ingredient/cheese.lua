nk.main.defineIngredient("cheese", {
    name = "cheese",
    image = "cheese",
    components = {heatLimit = 40},
}, {
    onCookedDescription = "Adjacent food gains $1 value",
    onCooked = function (ent)
        local selfPos = nk.main.getGridPos(ent)
        local newEnt = nk.main.transformEntity(ent, "melted_cheese", true)
        nk.components.heat.change(newEnt, 40)
    end
})

nk.main.defineIngredient("melted_cheese", {
    name = "Melted Cheese",
    image = "melted_cheese",
    components = {value=4},
})
