Satellite = Class{}

function Satellite:init(params)
    self.skin = params.skin ~= nil and params.skin or 'object_larger'
    self.image = love.graphics.newImage('graphics/'..self.skin..'.png')

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    local middle_x = (VIRTUAL_WIDTH - self.width)/2
    local middle_y = (VIRTUAL_HEIGHT - self.height)/2

    self.x = params.x ~= nil and middle_x + params.x or middle_x
    self.y = params.y ~= nil and middle_y + params.y or middle_y

    self.mass = params.mass ~= nil and params.mass or 10 
    self.scale = (3*self.mass/12.56)^(1/3)/4 + 0.2

    self.vel_x = params.vel_x ~= nil and params.vel_x or 0
    self.vel_y = params.vel_y ~= nil and params.vel_y or 0

    self.center_x = self.x + (self.width*self.scale)/2
    self.center_y = self.y + (self.height*self.scale)/2

    self.sumAccel_x = 0
    self.sumAccel_y = 0



    self.point_color = params.point_color ~= nil and params.point_color or {0, 0, 0}
end


function Satellite:update(dt)
    self.vel_x = self.vel_x + self.sumAccel_x
    self.vel_y = self.vel_y + self.sumAccel_y

    self.x = self.x + self.vel_x 
    self.y = self.y + self.vel_y 

    self.center_x = self.x + (self.width*self.scale)/2
    self.center_y = self.y + (self.height*self.scale)/2
end


function Satellite:render()
    love.graphics.draw(self.image, self.x, self.y, 0, self.scale, self.scale)

    love.graphics.setLineWidth(3)
    love.graphics.setColor(1, 1, 1)
    love.graphics.line(self.center_x, self.center_y, self.center_x+self.vel_x*1000/self.mass, self.center_y+self.vel_y*1000/self.mass)
    love.graphics.setColor(1, 0, 1)
    love.graphics.line(self.center_x, self.center_y, self.center_x+self.sumAccel_x*100*self.mass, self.center_y+self.sumAccel_y*100*self.mass)
end