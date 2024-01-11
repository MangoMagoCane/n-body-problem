Celestial = Class{}

function Celestial:init()
    self.image = love.graphics.newImage('graphics/object_larger.png')

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.x = (VIRTUAL_WIDTH - self.width) / 2 + 300
    self.y = (VIRTUAL_HEIGHT - self.height) / 2 + self.height/4

    self.center_x = self.x + self.width/2
    self.center_y = self.y + self.height/2
    
    self.mass = 50
end

function Celestial:update(dt)
    self.y = self.y + 0.1
end



function Celestial:render()
    love.graphics.draw(self.image, self.x, self.y, 0)
end