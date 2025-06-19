nk.main.defineBuilding("freezer", {
    name = "freezer",
    image = "freezer",
}, {
    onUpdateActivate = function (ent, ingredientEnt)
        if ingredientEnt then
            nk.components.heat.change(ingredientEnt, -10 * (nk.getStorage("dt") or 0))
        end
    end
})