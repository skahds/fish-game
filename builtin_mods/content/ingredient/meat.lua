nk.main.defineIngredient("meat", {
    name = "Raw Meat",
    image = "meat",
    components = {heatLimit=70},
}, {
    onCooked = {
        activate = function (ent)
            local newEnt = nk.main.transformEntity(ent, "cooked_meat", true)
            nk.components.heat.change(newEnt, 70)
        end,
        description = "Transform into Cooked Meat."
    }
})

nk.main.defineIngredient("cooked_meat", {
    name = "Cooked Meat",
    image = "cooked_meat",
    components = {value=5},
})

nk.main.defineIngredient("vegetable", {
    name = "Vegetable",
    image = "vegetable",
})