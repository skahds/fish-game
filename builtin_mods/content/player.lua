nk.main.defineEntity("player", {
    defaultHeight = 10,
    defaultWidth = 10,

})



nk.on("ui:noUIPressed", function ()
    local playerEnt = nk.getStorage("playerEnt")
    local mouse = nk.getStorage("mousePos")
    
    local chosenGridPos = nk.main.realPosToGridPos(mouse.x, mouse.y)
    local entityChosen = nk.main.gridPosToEnt(chosenGridPos)    

    if playerEnt.selectedEntity then
        local playerSelectedPos = nk.main.getGridPos(playerEnt.selectedEntity)

        -- make sure chosen gridpos is within boundry
        if chosenGridPos.x > 0 and chosenGridPos.x <= nk.main.grid.info.width and
        chosenGridPos.y > 0 and chosenGridPos.y <= nk.main.grid.info.height then

            if playerSelectedPos ~= nil then
                if entityChosen == nil then
                    nk.main.forceSetEntGridPos(playerEnt.selectedEntity, chosenGridPos)
                    playerEnt.selectedEntity = nil

                    -- make sure they have a gridPos so you can't select a random ent
                elseif nk.main.getGridPos(entityChosen) and entityChosen.index ~= playerEnt.selectedEntity.index then
                    nk.main.trySwapEntGridPos(playerEnt.selectedEntity, entityChosen)
                    playerEnt.selectedEntity:setRealPosToGridPos()
                    
                    -- changes the player's selected ent
                    playerEnt.selectedEntity = entityChosen

                    -- make sure it can't swap with itself
                elseif entityChosen.index == playerEnt.selectedEntity.index then
                    playerEnt.selectedEntity:setRealPosToGridPos()
                    playerEnt.selectedEntity = nil
                end
            end

        else
            playerEnt.selectedEntity:setRealPosToGridPos()
            playerEnt.selectedEntity = nil
        end

    elseif entityChosen then
        playerEnt.selectedEntity = entityChosen
    end
end)

nk.on("@renderer:renderOutsideCamera", function ()
    local ent = nk.getStorage("playerEnt").selectedEntity
    if ent then
        local mouse = nk.getStorage("mousePos")
        ent.x = mouse.x - ent.width/2
        ent.y = mouse.y - ent.height/2
    end
end)


nk.on("@load", nk.main.spawnEntity("player", {x=10, y=10}))
nk.updateStorage("playerEnt", nk.main.world[#nk.main.world])