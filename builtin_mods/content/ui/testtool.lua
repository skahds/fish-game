nk.on("@renderer:renderOutsideCamera", function ()
    nk.render(100, function ()
        love.graphics.print("Current FPS: "..tostring(love.timer.getFPS()))
    end)
end)

