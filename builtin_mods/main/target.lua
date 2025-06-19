nk.target = {}

function nk.target.newTarget(id, coords)
    nk.target[id] = {
        name = id,
        relativeCoords = {x=coords[1], y=coords[2]}
    }
end

function nk.target.forEntInTarget(relativeCoords, z, fun)
    for _, coord in pairs(relativeCoords) do
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