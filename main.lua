require "hump.vector"
require "hump.camera"

-- convenience
local vector = hump.vector
local camera = hump.camera

-- "constants"
SCREEN_WIDTH  =  800
SCREEN_HEIGHT = 600
ARENA_WIDTH   = 2400
ARENA_HEIGHT  = 400

walls = {
   left   = {},
   right  = {},
   top    = {},
   bottom = {}
}

ball = { RADIUS = 50 }
boxes = {}

function love.load()
	-- convenience
	local gfx = love.graphics
	local phys = love.physics

   -- bg
   gfx.setBackgroundColor(220, 220, 220)

   -- create physics
   world = phys.newWorld(0, 0, ARENA_WIDTH, ARENA_HEIGHT)
   world:setGravity(0, 350)

   walls.left.body = phys.newBody(world, 2, ARENA_HEIGHT / 2, 0, 0)
   walls.left.shape = phys.newRectangleShape(walls.left.body, 0, 0, 5, ARENA_HEIGHT, 0)

   walls.right.body = phys.newBody(world, ARENA_WIDTH - 2, ARENA_HEIGHT / 2, 0, 0)
   walls.right.shape = phys.newRectangleShape(walls.right.body, 0, 0, 5, ARENA_HEIGHT, 0)

   walls.top.body = phys.newBody(world, ARENA_WIDTH / 2, 2, 0, 0)
   walls.top.shape = phys.newRectangleShape(walls.top.body, 0, 0, ARENA_WIDTH, 5, 0)

   walls.bottom.body = phys.newBody(world, ARENA_WIDTH / 2, ARENA_HEIGHT - 2, 0, 0)
   walls.bottom.shape = phys.newRectangleShape(walls.bottom.body, 0, 0, ARENA_WIDTH, 5, 0)

   -- ball
   ball.img = gfx.newImage("ball.png")
   ball.body = phys.newBody(world, 2 * ball.RADIUS, ARENA_HEIGHT / 2, 10, 15)
   ball.shape = phys.newCircleShape(ball.body, 0, 0, ball.RADIUS)
   ball.shape:setRestitution(0.5)

   -- boxes
   boxes[1] = {}
   boxes[1].body = phys.newBody(world, ARENA_WIDTH / 5, ARENA_HEIGHT / 2, 5, 0)
   boxes[1].shape = phys.newRectangleShape(boxes[1].body, 0, 0, 75, 75)
   boxes[2] = {}
   boxes[2].body = phys.newBody(world, 2 * ARENA_WIDTH / 5, ARENA_HEIGHT / 2, 5, 0)
   boxes[2].shape = phys.newRectangleShape(boxes[2].body, 0, 0, 25, 200)
   boxes[3] = {}
   boxes[3].body = phys.newBody(world, 3 * ARENA_WIDTH / 5, ARENA_HEIGHT / 2, 5, 0)
   boxes[3].shape = phys.newRectangleShape(boxes[3].body, 0, 0, 75, 75)
   boxes[4] = {}
   boxes[4].body = phys.newBody(world, 4 * ARENA_WIDTH / 5, ARENA_HEIGHT / 2, 5, 0)
   boxes[4].shape = phys.newRectangleShape(boxes[4].body, 0, 0, 25, 200)
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

   gfx.setColor(255, 255, 255)
   gfx.rectangle("fill", 0, 0, ARENA_WIDTH, ARENA_HEIGHT)

   gfx.setColor(0, 250, 0, 100)
   gfx.rectangle("fill", ARENA_WIDTH - 150, 0, 150, ARENA_HEIGHT)


   gfx.setColor(0, 0, 0)
   for k, v in pairs(walls) do
      drawSimpleRect(v)
   end
end
