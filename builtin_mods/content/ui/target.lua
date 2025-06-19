-- this is very closely related to player!

local function drawEntTargetShape(ent)
    local mouse = nk.getStorage("mousePos")
    local entPos = nk.main.getGridPos(ent)
    for _, t in pairs(ent.actionTable) do
        if t.shape then
            for _, coord in ipairs(t.shape.relativeCoords) do
                local x = ent.x + coord.x * nk.main.grid.info.gridRenderSize
                local y = ent.y + coord.y * nk.main.grid.info.gridRenderSize
                nk.render(91, function ()
                    love.graphics.draw(nk.getImage("target_outline"), x, y)
                end)
            end
        end
    end
end

nk.on("@renderer:renderOutsideCamera", function ()
    local ent = nk.getStorage("playerEnt").selectedEntity
    if ent then
        drawEntTargetShape(ent)
    end
end)