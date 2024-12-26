nk.main = {
    entities = {},
    world = {}
} -- contains all "main" function for the content
local nkm = nk.main

nkm.basic_entity = class()

function nkm.basic_entity:draw()
    if self.x and self.y and self.height and self.width then
        if self.image then
            love.graphics.draw(nk.getImage(self.image), self.x, self.y, self.direction or 0, 1, 1)
        else
            love.graphics.setColor(0.4, 0.4, 1)
            love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
            love.graphics.setColor(1, 1, 1)
        end
    end
end


-- name, image, onUpdate (contains ai to go to bait)

function nkm.defineFish(id, eType)
    local fishClass = class(nkm.basic_entity)
    function fishClass:init(args)
        for k, v in pairs(eType) do
            self[k] = v
        end
        for k, v in pairs(args) do
            self[k] = v
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
    end

    function fishClass:update()
        if self.onUpdate then
            self:onUpdate()
        end
    end


    nkm.entities[id] = fishClass
end

function nkm.spawnFish(id, args)
    print("spawning" .. id .. " at " .. args.x .. ", " .. args.y)
    table.insert(nkm.world, nkm.entities[id]:new(args))
end