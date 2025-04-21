nk.main.defineEntity("player", {
    defaultHeight = 50,
    defaultWidth = 50,

})



nk.on("ui:noUIPressed", function ()
    local playerEnt = nk.getStorage("playerEnt")
    local mouse = nk.getStorage("mousePos")
    
    local entityChosen = nk.main.posToEnt(mouse)
    if entityChosen then
        print("entityChosen")
    end
end)


nk.on("@load", nk.main.spawnEntity("player", {x=10, y=10}))
nk.updateStorage("playerEnt", nk.main.world[#nk.main.world])