require "hump.vector"
require "hump.camera"

-- convenience
local vector = hump.vector
local camera = hump.camera

function love.load()
	-- convenience
	local gfx = love.graphics
	local phys = love.physics

end

function love.update(dt)

end

function drawSimpleRect(obj)
	local x1, y1, x2, y2, x3, y3, x4, y4 = obj.shape:getBoundingBox()
	local w = x3 - x2
	local h = y2 - y1
	love.graphics.rectangle("fill", obj.body:getX() - (w / 2), obj.body:getY() - (h / 2), w, h)
end

function love.draw()
	-- convenience
	local gfx = love.graphics

end
