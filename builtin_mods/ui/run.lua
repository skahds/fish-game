nk.on("@mouse:released", function (button)
    local mouse = {x=love.mouse.getX(), y=love.mouse.getY()}

    -- check if any UI is pressed
    local didPressed = false

    for i, ui in ipairs(nk.ui.world) do
        if ui.x and ui.y and nk.collision.AABB_check(ui, mouse) then
            if ui.onClick then
                ui:onClick(button)
                didPressed = true
            end
        end
    end

    if didPressed == false then
        nk.call("ui:noUIPressed", button)
    end
end)

nk.on("@renderer:renderOutsideCamera", function ()
    for i, ui in ipairs(nk.ui.world) do
        if type(ui.draw) == "function" then
            ui:draw()
        end
    end
end)

nk.on("@update", function ()
    for index, entity in ipairs(nk.ui.world) do
        if entity.update then
            entity:update()
        end
    end

    for i=#nk.ui.deleteQueue, 1, -1 do
        local entity = nk.ui.deleteQueue[i]
        local nkw = nk.ui.world

        --swaps the about to delete ent and the last ent, then deletes it
        if entity.index ~= #nkw then
            print(entity.index)
            nkw[entity.index], nkw[#nkw] = nkw[#nkw], nkw[entity.index]
            nkw[entity.index].index, nkw[#nkw].index = nkw[#nkw].index, nkw[entity.index].index
        end
        table.remove(nkw, #nkw)
    end

    nk.ui.deleteQueue = {}
end)

