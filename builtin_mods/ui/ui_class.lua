nkui = class()

function nkui:init(args)
    for k, v in pairs(args) do
        self[k] = v
    end
    self.width = self.width or self.defaultWidth
    self.height = self.height or self.defaultHeight
end

function nkui:draw()
    if self.x and self.y and self.width and self.height then
        if self.image == nil then
            love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
        end
    end
end

