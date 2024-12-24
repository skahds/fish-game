nk.on("@keyreleased", function (key)
    if key == "escape" then
        love.event.quit()
    end
end)