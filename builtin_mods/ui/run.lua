nk.on("@mouse:released", function (button)
    local mouse = {x=love.mouse.getX(), y=love.mouse.getY()}
    for i, ui in ipairs(nk.ui.world) do
        if ui.x and ui.y and nk.collision.AABB_check(ui, mouse) then
            if ui.onClick then
                ui:onClick(button)
            end
        end
    end
end)

nk.on("@renderer:renderOutsideCamera", function ()
    for i, ui in ipairs(nk.ui.world) do
        if type(ui.draw) == "function" then
            ui:draw()
        end
    end
end)