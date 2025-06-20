nk.main.defineIngredient("cheese", {
    name = "cheese",
    image = "cheese",
    components = {heatLimit = 40},
}, {
    onCooked = {description = "Transform into Melted Cheese.\nTarget gains $2",
    shape = nk.target.adjacent,
    targetActivate = function (ent, targetEnt)
        local selfPos = nk.main.getGridPos(ent)
        nk.components.value.change(targetEnt, 2)
    end,
    activate = function (ent)
        local selfPos = nk.main.getGridPos(ent)
        local newEnt = nk.main.transformEntity(ent, "melted_cheese", true)
        nk.components.heat.change(newEnt, 40)
    end}
})

nk.main.defineIngredient("melted_cheese", {
    name = "Melted Cheese",
    image = "melted_cheese",
    components = {value=4},
}, {
    onFrozen = {
        description = "Transform into cheese",
        activate = function (ent)
            local newEnt = nk.main.transformEntity(ent, "cheese", true)
        end
    }
})
