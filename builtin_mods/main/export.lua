nk.main = {
    entities = {},
    world = {},
    deleteQueue = {}
} -- contains all "main" function for the content

nk.main.basic_entity = class()

function nk.main.basic_entity:draw()
    if self.x and self.y and self.height and self.width then
        if self.image then
            local realImage = nk.getImage(self.image)
            nk.render(self.renderLayer or 0, function ()
                love.graphics.draw(
                realImage,
                self.x,
                self.y,
                self.direction or 0,
                1,
                1
                -- realImage:getWidth()/2,
                -- realImage:getHeight()/2
                )
            end)
        else
            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
            love.graphics.setColor(1, 1, 1)
        end
    end
end

function nk.main.basic_entity:delete()
    nk.call("nk:entityDeleted", self)
    local isEmpty = true
    for _, ent in pairs(nk.main.deleteQueue) do
        if ent.index == self.index then
            isEmpty = false
            break
        end
    end
    if isEmpty == true then
        table.insert(nk.main.deleteQueue, self)
    end
end

-- i'm sure 99% this is a bad idea:
local function copyTable(t)
    local newTable = {}
    for k, v in pairs(t) do
        if type(v) ~= "table" then
            newTable[k] = v
        else
            newTable[k] = copyTable(v)
        end
    end
    return newTable
end

-- name, image, onUpdate

---defines an entity at nk.main.entities
---@param id string
---@param eType table
function nk.main.defineEntity(id, eType)
    local entityClass = class(nk.main.basic_entity)
    function entityClass:init(args)
        for k, v in pairs(eType) do
            if type(v) == "table" then
                self[k] = copyTable(v)
            else
                self[k] = v
            end
        end

        for k, v in pairs(args) do
            if type(v) == "table" then
                self[k] = copyTable(v)
            else
                self[k] = v
            end
        end

        self.width = self.width or self.defaultWidth
        self.height = self.height or self.defaultHeight

        if self.width and self.height == nil and self.image then
            local img = nk.getImage(self.image)
            if img then
                self.width = img:getWidth()
                self.height = img:getHeight()
            end
        end

        if self.onLoad then
            self:onLoad()
        end
        self.components = self.components or {}

        -- if eType.collisionTag == nil then
        --     eType.collisionTag = {env=true}
        -- end
    end

    function entityClass:update()
        if self.onUpdate then
            self:onUpdate()
        end
    end

    -- -- collision system.. should it be here?
    -- function entityClass:checkCollision()
    --     if self.x and self.y then
    --         for i, ent in pairs(nk.main.world) do
    --             if ent.x and ent.y then
    --                 local tagCheck = false
        
    --                 for tag, bool in pairs(self.collisionTag) do
    --                     if ent.collisionTag[tag] == true then
    --                         tagCheck = true
    --                         break
    --                     end
    --                 end
        
    --                 if tagCheck then
    --                     if nk.collision.AABB_check(self, ent) then
    --                         if self.onCollided then self.onCollided(self, ent) end
    --                         if ent.onCollided then ent.onCollided(ent, self) end
    --                     end
    --                 end
    --             end
    --         end
    --     end
    -- end


    nk.main.entities[id] = entityClass
end

---spawns an entity in nk.main.world, ret is does it return the entity or not
---@param id string
---@param args eType
function nk.main.spawnEntity(id, args, ret)
    ret = ret or false

    local preEnt = nk.main.entities[id]
    local newEnt = preEnt:new(args)
    table.insert(nk.main.world, newEnt)
    nk.main.world[#nk.main.world].index = #nk.main.world
    local ent = nk.main.world[#nk.main.world]
    nk.call("nk:entitySpawned", ent)
    
    if ret == true then
        return ent
    end
end