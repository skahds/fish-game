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


local function drawDescription(ent)
    if ent.x and ent.y then
        nk.render(70, function ()
            -- love.graphics.print(ent.name, ent.x+32, ent.y)
            local count = 0

            for _, descriptionKey in ipairs(descriptionKey) do
                local descriptionFunc = descriptions[descriptionKey]
                local text = descriptionFunc(ent)
                if text then
                    local xOffset = nk.main.grid.info.gridRenderSize
                    local yOffset = count*12

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