nk.on("@keyreleased", function (key)
    if key == "escape" then
        love.event.quit()
    end
end)

nk.on("@update", function (dt)
    for index, entity in ipairs(nk.main.world) do
        if entity.update then
            entity:update()
        end
    end
end)

nk.on("@renderer:render", function (dt)
    for index, entity in ipairs(nk.main.world) do
        if entity.draw then
            entity:draw()
        end
    end
end)



nk.on("@update", function ()
    nk.updateStorage("mousePos", {x=love.mouse.getX(), y=love.mouse.getY()})
end)