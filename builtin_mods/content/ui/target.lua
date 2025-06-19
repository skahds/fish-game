-- this is very closely related to player!

local function drawEntTargetShape(ent)
    local mouse = nk.getStorage("mousePos")
    local entPos = nk.main.getGridPos(ent)
    for _, t in pairs(ent.actionTable) do
        if t.shape then
            for _, coord in ipairs(t.shape.relativeCoords) do
                local gridSize = nk.main.grid.info.gridRenderSize
                local gridOffset = nk.main.grid.info.gridRenderOffset

                -- the floor is to make it snap into grids
                local originalEntOffsetX = math.floor((mouse.x - gridOffset.x)/gridSize)*gridSize
                local originalEntOffsetY = math.floor((mouse.y - gridOffset.y)/gridSize)*gridSize
                local x = originalEntOffsetX + coord.x * gridSize + gridOffset.x
                local y = originalEntOffsetY + coord.y * gridSize + gridOffset.y

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