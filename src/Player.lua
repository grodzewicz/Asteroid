--[[
    2025
                
    Author: Gregory Rodzewicz

    --Player--

    A file to define all of the attributes of the player class. This
    file also contains the definitions for all of the classes methods.
]]

Player = Class{}

local SHIP_SIZE = 30

function Player:init(world) -- Constructor takes players x & y position as well as a physics world
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.radius = SHIP_SIZE / 2
    self.angle = math.rad(90)
    self.body = love.physics.newBody(world, self.x, self.y, "dynamic")
    self.shape = love.physics.newPolygonShape(
        self.x + ((4 / 3) * self.radius) * math.cos(self.angle),
        self.y - ((4 / 3) * self.radius) * math.sin(self.angle),
        self.x - self.radius * ((2 / 3) * math.cos(self.angle) + math.sin(self.angle)),
        self.y + self.radius * ((2 / 3) * math.sin(self.angle) - math.cos(self.angle)),
        self.x - self.radius * ((2 / 3) * math.cos(self.angle) - math.sin(self.angle)),
        self.y + self.radius * ((2 / 3) * math.sin(self.angle) + math.cos(self.angle))
        )
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.body:setLinearDamping(0.4)
    self.body:setAngle(math.rad(90))
end

function Player:move(direction)
    local dx = math.cos(self.angle)
    local dy = math.sin(self.angle)
    print("delta x: " .. tostring(dx))
    print("delta y: " .. tostring(dy))
    local forwardForce = 500
    if direction == "up" then
        self.body:applyForce(dx * forwardForce, dy * -forwardForce)
    elseif direction == "down" then
        self.body:applyForce(dx * -forwardForce, dy * forwardForce)
    elseif direction == "left" then
        self.body:setAngle(self.angle + 15 * love.timer.getDelta())
    elseif direction == "right" then
        self.body:setAngle(self.angle - 15 * love.timer.getDelta())
    end
end


function Player:update(dt)
    self.x, self.y = self.body:getPosition()
    self.angle = self.body:getAngle()
end

function Player:render()
    if self.body:getX() < 0 then
        self.body:setX(love.graphics.getWidth())
    elseif self.body:getX() > love.graphics.getWidth() then
        self.body:setX(1)
    end
    if self.body:getY() < 0 then
        self.body:setY(love.graphics.getHeight())
    elseif self.body:getY() > love.graphics.getHeight() then
        self.body:setY(1)
    end

    love.graphics.polygon("line",
        self.x + ((4 / 3) * (self.radius + 2) * math.cos(self.angle)),
        self.y - ((4 / 3) * (self.radius + 2) * math.sin(self.angle)),
        self.x - (self.radius + 2) * ((2 / 3) * math.cos(self.angle) + math.sin(self.angle)),
        self.y + (self.radius + 2) * ((2 / 3) * math.sin(self.angle) - math.cos(self.angle)),
        self.x - (self.radius + 2) * ((2 / 3) * math.cos(self.angle) - math.sin(self.angle)),
        self.y + (self.radius + 2) * ((2 / 3) * math.sin(self.angle) + math.cos(self.angle))
        )
    if debugging then
        love.graphics.setColor(212/255,48/255,2/255)
        love.graphics.setPointSize(4)
        love.graphics.points(self.x, self.y)
        love.graphics.polygon("line",
        self.x + ((4 / 3) * self.radius) * math.cos(self.angle),
        self.y - ((4 / 3) * self.radius) * math.sin(self.angle),
        self.x - self.radius * ((2 / 3) * math.cos(self.angle) + math.sin(self.angle)),
        self.y + self.radius * ((2 / 3) * math.sin(self.angle) - math.cos(self.angle)),
        self.x - self.radius * ((2 / 3) * math.cos(self.angle) - math.sin(self.angle)),
        self.y + self.radius * ((2 / 3) * math.sin(self.angle) + math.cos(self.angle))
        )
        love.graphics.setColor(1,1,1)
    end
end


