nk.on("@renderer:render", function ()
    local gridOutline = nk.sprites.grid_outline
    local info = nk.main.grid.info
    for x=1, info.width do
        for y=1, info.height do
            nk.render(-100, function ()        
                love.graphics.draw(gridOutline,
                (x-1)*info.gridRenderSize + info.gridRenderOffset.x,
                (y-1)*info.gridRenderSize + info.gridRenderOffset.y)
            end)
        end
    end
end)