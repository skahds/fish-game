nk.on("@keyreleased", function (key)
    if key == "escape" then
        love.event.quit()
    end
end)


-- what's a lazy update?
local lazyUpdateCount = 0

nk.on("@update", function (dt)
    for index, entity in ipairs(nk.main.world) do
        if entity.update then
            entity:update()
        end
    end

    for i=#nk.main.deleteQueue, 1, -1 do
        local entity = nk.main.deleteQueue[i]
        local nkw = nk.main.world

        --swaps the about to delete ent and the last ent, then deletes it
        if entity.index ~= #nkw then
            nkw[entity.index], nkw[#nkw] = nkw[#nkw], nkw[entity.index]
            nkw[entity.index].index, nkw[#nkw].index = nkw[#nkw].index, nkw[entity.index].index
        end
        table.remove(nkw, #nkw)
    end

    nk.main.deleteQueue = {}


    if lazyUpdateCount > 30 then
        nk.call("@update:lazy")
        lazyUpdateCount = 0
    else
        lazyUpdateCount = lazyUpdateCount + 1
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