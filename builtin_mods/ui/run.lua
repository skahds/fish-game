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
        nk.call("ui:noUIPressed")
    end
end)

nk.on("@renderer:renderOutsideCamera", function ()
    for i, ui in ipairs(nk.ui.world) do
        if type(ui.draw) == "function" then
            ui:draw()
        end
    end
end)

