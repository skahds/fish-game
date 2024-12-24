--[[
Have table UI, each table inside will contain x, y, w, h (no circular button)
ui.add(ui), does table.insert UI, so the order goes on top
]]

nk.ui = {}
nk.ui.world = {}

function nk.ui.addUI(ui)
    table.insert(nk.ui.world, ui)
end

