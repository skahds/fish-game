local testUI = nkui:new({
    defaultWidth = 100,
    defaultHeight = 100,

    -- shouldn't be defining the position here.. or should we?, probably have a variable relativeToMouse bool
    x=200,
    y=100,
    
    onClick = function (ui, button)
        nk.main.spawnEntity("light", {x=ui.x+100, y=ui.y})
    end
})

nk.ui.addUI(testUI)