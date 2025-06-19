nk.target = {}

function nk.target.newTarget(id, coords)
    nk.target[id] = {
        name = id,
        relativeCoords = {}
    }
    for i, coords in ipairs(coords) do
        nk.target[id].relativeCoords[i] = {x=coords[1], y=coords[2]}
    end
end

function nk.target.forEntInTarget(relativeCoords, gridPos, fun)
    local z = gridPos.z
    for _, relativeCoord in pairs(relativeCoords) do
        local coord = {x=relativeCoord.x+gridPos.x, y=relativeCoord.y+gridPos.y}

        if coord.x > 0 and coord.x <= nk.main.grid.info.width and
        coord.y > 0 and coord.y <= nk.main.grid.info.height then
            local gridPos = nk.main.posToGridPos(coord.x, coord.y, z)
            local targetEnt = nk.main.gridPosToEnt(gridPos)
            if targetEnt then
                fun(targetEnt)
            end
        end
    end
end