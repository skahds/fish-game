--heat
nk.on("nk:drawEntity", function (ent)
    nk.render(40, function ()
        local heat = nk.components.heat.get(ent)
        if heat then
            local size = 1
            if heat > 0 then
                love.graphics.setColor(0.8+heat/100, 0.5, 0.5)
            else
                love.graphics.setColor(0.8, 0.8, 0.9-heat/100)
            end
            love.graphics.rectangle("fill", ent.x+16-heat*(size/2), ent.y+32, heat*size, 10)
        end
    end)
end)

-- nk.ui.defineUI("heatBar", {
--     defaultWidth = 20,
--     defaultHeight = 20,

--     x=200,
--     y=100,
    
--     onClick = function (ui, button)

--     end
-- })

-- local ent = nk.ui.spawnUI("heatBar", {}, true)