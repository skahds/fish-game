local function distanceFrom(x1,y1,x2,y2) return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2) end

nk.on("@update:lazy", function (dt)
    for index, entity in ipairs(nk.main.world) do
        local playerEnt = nk.getStorage("playerEnt")
        if distanceFrom(playerEnt.x, playerEnt.y, entity.x, entity.y) > 5000 then
            entity:delete()
        end
    end
end)