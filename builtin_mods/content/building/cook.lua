nk.main.defineBuilding("stove", {
    name = "basic stove",
    image = "stove",
}, {
    onUpdateActivate = function (ent, ingredientEnt)
        if ingredientEnt then
            nk.components.heat.change(ingredientEnt, 10 * (nk.getStorage("dt") or 0))
        end
    end
})