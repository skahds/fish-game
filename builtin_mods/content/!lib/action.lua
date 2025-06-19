--used with action table
function nk.main.activateEntity(t, ent)
    if t.shape and t.targetActivate then
        local gridPos = nk.main.getGridPos(ent)
        nk.target.forEntInTarget(t.shape.relativeCoords, gridPos, function (targetEnt)
            t.targetActivate(ent, targetEnt)
        end)
    end

    if t.activate then
        t.activate(ent)
    end
end