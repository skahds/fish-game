--[[
gridPos contains:
x, y, z, index
index is x + y*gridWidth and also the index of the table too

higher Z means it's rendered higher
ingredients have a Z of 10
building have a Z of 0
]]

gridPos = class()

function gridPos:init(args)
    for k, v in pairs(args) do
        self[k] = v
    end

    self.index = self.x + self.y * nk.main.grid.info.width
end

function gridPos:move(dx, dy)
    self.x = self.x + dx
    self.y = self.y + dy
    self.index = self.x + self.y * nk.main.grid.info.width
end

function gridPos:getZLayerName()
    if self.z then
        if self.z == 0 then
            return "building"
        elseif self.z == 10 then
            return "ingredients"
        else
            return "other"
        end
    end
end
-- non gridPos class function

function nk.main.posToGridPos(x, y, z)
    return gridPos:new({x=x, y=y, z=z})
end


function nk.main.gridPosToEnt(gridPos)
    if gridPos.x > 0 and gridPos.x <= nk.main.grid.info.width and
    gridPos.y > nk.main.grid.info.height and gridPos.y <= 5 then
        local entity = nk.main.grid[gridPos:getZLayerName()][gridPos.index]

        if entity then
            return entity
        else
            return nil
        end
    end
end