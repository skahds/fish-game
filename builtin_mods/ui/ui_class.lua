function nk.ui.defineUI(id, eType)
    local nkui = class(nk.main.basic_entity)

    function nkui:init(args)
        for k, v in pairs(eType) do
            self[k] = v
        end
        for k, v in pairs(args) do
            self[k] = v
        end
        self.width = self.width or self.defaultWidth
        self.height = self.height or self.defaultHeight
        self.renderLayer = self.renderLayer or 100
    end

    function nkui:draw()
        if self.x and self.y and self.width and self.height then
            if self.image == nil then
                nk.render(self.renderLayer, function ()
                    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
                end)
            end
        end
    end
    table.insert(nk.main.uiClasses[id], nkui)
end

--[[
    local entityClass = class(nk.main.basic_entity)
    function entityClass:init(args)
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

        if self.onLoad then
            self:onLoad()
        end

        -- if eType.collisionTag == nil then
        --     eType.collisionTag = {env=true}
        -- end
    end

    function entityClass:update()
        if self.onUpdate then
            self:onUpdate()
        end
    end
]]
