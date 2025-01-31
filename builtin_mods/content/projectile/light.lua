nk.main.defineEntity("light", {
    defaultWidth = 10,
    defaultHeight = 10,

    onUpdate = function (selfEnt)
        selfEnt.y = selfEnt.y + 10
    end
})