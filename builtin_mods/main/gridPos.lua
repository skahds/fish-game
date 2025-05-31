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

function gridPos:setPos(gridPos)
    self = gridPos
end

function gridPos:getZLayerName()
    if self.z then
        if self.z == 0 then
            return "building"
        elseif self.z == 10 then
            return "ingredient"
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
    gridPos.y > 0 and gridPos.y <= nk.main.grid.info.height then
        local entity = nk.main.grid[gridPos:getZLayerName()][gridPos.index]
        print("check", entity)
        
        if entity then
            return entity
        else
            return nil
        end
    end
end

---returns position of X and Y to an entity
---@param pos table
---@return entity
function nk.main.realPosToEnt(pos)
    for index, entity in ipairs(nk.main.world) do
        if entity.x and entity.y then
            if nk.collision.AABB_check(pos, entity) then
                return entity
            end
        end
    end
end

-- what is this naming
function nk.main.realPosToGridPos(x, y, z)
    local info = nk.main.grid.info
    if info then
        z = z or info.ingredientZ
        x = math.floor((x - info.gridRenderOffset.x) / info.gridRenderSize)+1
        y = math.floor((y - info.gridRenderOffset.y) / info.gridRenderSize)+1
        local pos = nk.main.posToGridPos(x, y, z)
        return pos
    end
end

function nk.main.getGridPos(ent)
    if ent.getGridPos then
        return ent:getGridPos()
    end
end

--be extremely careful, make sure target gridPos is empty!
function nk.main.forceSetEntGridPos(ent, gridPos)
    local entPos = ent.gridPos
    if entPos.z == gridPos.z then
        ent.gridPos = gridPos
        nk.main.grid[gridPos:getZLayerName()][entPos.index] = nil
        nk.main.grid[gridPos:getZLayerName()][gridPos.index] = ent

        if ent.setRealPosToGridPos then
            ent:setRealPosToGridPos()
        end
    end
end

--swaps 2 entities gridPos
function nk.main.trySwapEntGridPos(ent, ent2)
    local pos1 = nk.main.getGridPos(ent)
    local pos2 = nk.main.getGridPos(ent2)
    if pos1.z == pos2.z then
        ent.gridPos = pos2
        ent2.gridPos = pos1
        nk.main.grid[pos1:getZLayerName()][pos1.index] = ent2
        nk.main.grid[pos2:getZLayerName()][pos2.index] = ent
    end
end