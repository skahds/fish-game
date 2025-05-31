unpack = table.unpack or unpack

nk.events = {}
nk.storage = {}

---calls all event
---@param event string
---@param ... any
function nk.call(event, ...)
    if nk.events[event] then
        for i, func in ipairs(nk.events[event]) do
            func(...)
        end
    end
end

---gets called by event
---@param event string
---@param func function
function nk.on(event, func)
    if not nk.events[event] then
        nk.events[event] = {}
    end
    table.insert(nk.events[event], func)
end

---gets from nk.storage; however where i get stuff i like
---@param name string
---@return unknown
function nk.getStorage(name)
    return nk.storage[name]
end

---updates nk.storage; however where i store stuff i like
---@param name string
---@param newVar any
function nk.updateStorage(name, newVar)
    nk.storage[name] = newVar
end