nk.main.defineBuilding("stove", {
    name = "basic stove",
    image = "stove",
}, {
    onUpdateActivate = function (ent, ingredientEnt)
        if ingredientEnt then
            nk.components.heat.change(ingredientEnt, 1)
        end
    end
})