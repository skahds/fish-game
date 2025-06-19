nk.updateStorage("defaultFont", love.graphics.newFont(16))
love.graphics.setFont(nk.getStorage("defaultFont"))


--[[
Have table UI, each table inside will contain x, y, w, h (no circular button)
ui.add(ui), does table.insert UI, so the order goes on top
]]

nk.ui = {}
nk.ui.uiClasses = {}
nk.ui.world = {}
nk.ui.deleteQueue = {}

function nk.ui.spawnUI(id, args, ret)
    ret = ret or false

    table.insert(nk.ui.world, nk.ui.uiClasses[id]:new(args))
    print("createUI " .. id)

    local ent = nk.ui.world[#nk.ui.world]
    ent.index = #nk.ui.world

    if ret then
        return ent
    end
end