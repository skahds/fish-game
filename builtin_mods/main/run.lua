nk.on("@keyreleased", function (key)
    if key == "escape" then
        love.event.quit()
    end
end)

nk.on("@update", function (dt)
    for index, fish in ipairs(nk.main.world) do
        if fish.update then
            fish:update()
        end
    end
end)

nk.on("@renderer:render", function (dt)
    for index, fish in ipairs(nk.main.world) do
        if fish.draw then
            fish:draw()
        end
    end
end)