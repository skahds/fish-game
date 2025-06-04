local renderTable = {}
local renderKeys = {}

nk.render =  function (layer, func)
    if renderTable[layer] == nil then
        renderTable[layer] = {}
        table.insert(renderKeys, layer)
    end
    table.insert(renderTable[layer], func)
end

nk.on("@renderer:render", function ()
    table.sort(renderKeys)

    for i, layer in ipairs(renderKeys) do
        for _, func in ipairs(renderTable[layer]) do
            func()
        end
    end

    renderTable = {}
    renderKeys = {}
end)