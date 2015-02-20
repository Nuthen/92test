game = {}

function game:enter()
	self.world = love.physics.newWorld(0, 0)
	
	local x, y = love.graphics.getWidth()/2, love.graphics.getHeight()/2
	self.body = love.physics.newBody(self.world, x, y, 'dynamic')
	--self.body:setPosition(x, y)
	self.shape = love.physics.newRectangleShape(100, 40)
	self.fixture = love.physics.newFixture(self.body, self.shape, 1)
	self.joint = love.physics.newMouseJoint(self.body, x, y)
	
	self.ballBody =  love.physics.newBody(self.world, x+20, y-100, 'dynamic')
	self.ballShape = love.physics.newCircleShape(20)
	self.ballFixture = love.physics.newFixture(self.ballBody, self.ballShape, 1)
end

function game:update(dt)
	--self.joint:setTarget(love.mouse.getPosition())
	--self.ballBody:setLinearVelocity(50, 50)
    self.world:update(dt)
end

function game:keypressed(key, isrepeat)
    if console.keypressed(key) then
        return
    end
end

function game:mousepressed(x, y, mbutton)
    if console.mousepressed(x, y, mbutton) then
        return
    end
end

function game:draw()
	love.graphics.setColor(255, 255, 255, 255)
	local x1, y1, x2, y2, x3, y3, x4, y4 = self.body:getWorldPoints(-50, -20, 50, -20, 50, 20, -50, 20)
    love.graphics.polygon('line', x1, y1, x2, y2, x3, y3, x4, y4)
	
	local x, y = self.ballBody:getPosition()
	love.graphics.circle('fill', x, y, 20)
end