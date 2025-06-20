utils = {}

function utils.copy(t)
    local copy = {}

    for k, v in pairs(t) do
        copy[k] = v
    end

    local mt = getmetatable(t)
    if mt then
        setmetatable(copy, mt)
    end

    return copy
end

function utils.deepCopy(original)
    local copied_tables = {} -- To handle circular references and avoid infinite loops

    local function _copy(obj)
        if type(obj) ~= "table" then
            return obj -- Primitive types are copied by value
        end

        -- If this table has already been copied, return the existing copy
        if copied_tables[obj] then
            return copied_tables[obj]
        end

        local new_table = {}
        copied_tables[obj] = new_table -- Store the new table immediately to handle circular references

        -- Copy values
        for k, v in pairs(obj) do
            new_table[_copy(k)] = _copy(v) -- Recursively copy keys and values
        end

        -- Optionally, copy metatable if desired
        local mt = getmetatable(obj)
        if mt then
            setmetatable(new_table, mt)
        end

        return new_table
    end

    return _copy(original)
end