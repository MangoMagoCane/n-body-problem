Point = Class {}

function Point:init(x, y, color)
    self.color = color
    self.radius = 2
    self.x = x
    self.y = y
end

function Point:render()
    love.graphics.setColor(self.color)
    love.graphics.circle('fill', self.x, self.y, self.radius)
end
