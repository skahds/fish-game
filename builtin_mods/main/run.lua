nk.on("@keyreleased", function (key)
    if key == "escape" then
        love.event.quit()
    end
end)


-- what's a lazy update?
local lazyUpdateCount = 0


local layers = {"world", "grid"}
nk.on("@update", function (dt)
    for i, layers in ipairs(layers) do
        for index, entity in ipairs(nk.main[layers]) do
            if entity.update then
                entity:update()
                nk.call("nk:updateEntity", entity)
            end
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
    for i, layers in ipairs(layers) do
        for index, entity in ipairs(nk.main[layers]) do
            if entity.draw then
                entity:draw()
                nk.call("nk:drawEntity", entity)
            end
        end
    end
end)



nk.on("@update", function ()
    nk.updateStorage("mousePos", {x=love.mouse.getX(), y=love.mouse.getY()})
end)