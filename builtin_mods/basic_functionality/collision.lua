nk.collision = {}
function nk.collision.AABB_check(a, b)
    local aWidth, aHeight, bWidth, bHeight = a.width or 0, a.height or 0, b.width or 0, b.height or 0

    if a.x < b.x + bWidth and
        a.x + aWidth > b.x and
        a.y < b.y + bHeight and
        a.y + aHeight > b.y then
            return true
    end
end