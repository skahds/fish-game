nk.main.defineEntity("player", {
    defaultHeight = 10,
    defaultWidth = 10,

})



nk.on("ui:noUIPressed", function ()
    local playerEnt = nk.getStorage("playerEnt")
    local mouse = nk.getStorage("mousePos")
    
    local entityChosen = nk.main.realPosToEnt(mouse)
    


    if playerEnt.selectedEntity then
        local pos = nk.main.getGridPos(playerEnt.selectedEntity)
        local newPos = nk.main.realPosToGridPos(mouse.x, mouse.y)

        if entityChosen == nil then
            nk.main.setEntGridPos(playerEnt.selectedEntity, newPos)

            playerEnt.selectedEntity = nil
        else
            nk.main.setEntGridPos(playerEnt.selectedEntity, newPos)
            nk.main.setEntGridPos(entityChosen, pos)
            playerEnt.selectedEntity = nil
        end
    elseif entityChosen then
        playerEnt.selectedEntity = entityChosen
        print("selectedEntity")
    end
end)


nk.on("@load", nk.main.spawnEntity("player", {x=10, y=10}))
nk.updateStorage("playerEnt", nk.main.world[#nk.main.world])