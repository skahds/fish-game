local descriptionKey = {}
local descriptions = {}

-- do NOT occupy the same order, else it will get OVERWRITTEN
---@param order integer
---@param desc function
function nk.main.defineDescription(order, desc)
    table.insert(descriptionKey, order)
    descriptions[order] = desc

    table.sort(descriptionKey)
end

local function drawBackBox(ent)
    local count = 0
    local sizeX = 0
    local sizeY = 0
    local lineCount = 0

    for _, descriptionKey in ipairs(descriptionKey) do
        local descriptionFunc = descriptions[descriptionKey]
        local text = descriptionFunc(ent)
        if text then
            count = count + 1
            local font = nk.getStorage("defaultFont")
            local newSizeX = font:getWidth(text)
            if sizeX < newSizeX then
                sizeX = newSizeX
            end
            sizeY = font:getHeight(text)
            lineCount = lineCount + select(2, string.gsub(text, "\n", "")) + 1
        end
    end
    
    --draw nice backbox
    local xOffset = nk.main.grid.info.gridRenderSize
    love.graphics.setColor(0.2, 0.2, 0.2, 0.5)
    love.graphics.rectangle("fill", ent.x+xOffset, ent.y, sizeX, sizeY*lineCount)
    love.graphics.setColor(1, 1, 1)
end


local function drawDescription(ent)
    if ent.x and ent.y then
        nk.render(70, function ()
            drawBackBox(ent)

            --draw the actual text
            local lineCount = 0
            local count = 0
            for _, descriptionKey in ipairs(descriptionKey) do
                local descriptionFunc = descriptions[descriptionKey]
                local text = descriptionFunc(ent)
                if text then
                    local xOffset = nk.main.grid.info.gridRenderSize
                    local font = nk.getStorage("defaultFont")
                    
                    local yOffset = lineCount*font:getHeight(text)
                    lineCount = lineCount + select(2, string.gsub(text, "\n", "")) + 1
                    
                    love.graphics.print(text, ent.x+xOffset, ent.y+yOffset)
                    count = count + 1
                end
            end


        end)
    end
end

nk.on("@renderer:render", function ()
    local mouse = nk.getStorage("mousePos")

    local gridInfo = nk.main.grid.info
    local gridPosZ = gridInfo.ingredientZ
    
    local chosenGridPos = nk.main.realPosToGridPos(mouse.x, mouse.y, gridPosZ)
    local chosenEntity = nk.main.gridPosToEnt(chosenGridPos)
    if chosenEntity == nil then
        gridPosZ = gridInfo.buildingZ
        chosenGridPos = nk.main.realPosToGridPos(mouse.x, mouse.y, gridPosZ)
        chosenEntity = nk.main.gridPosToEnt(chosenGridPos)
    end

    if chosenEntity ~= nil then
        drawDescription(chosenEntity)
    end
end)