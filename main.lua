nk = {}

require('broadcast')
require('class')
require('utils')

function love.load()
    require('modLoading')

    nk.call("@load")

end

function love.update(dt)
    nk.call("@update")
    nk.updateStorage("dt", dt)
end

function love.draw()
    nk.call("@renderer:render")
    --later on will be used:
    nk.call("@renderer:renderOutsideCamera")
end

function love.keyreleased(key)
    nk.call("@keyreleased", key)
end

function love.mousereleased(x, y, button)
    nk.call("@mouse:released", button)
end