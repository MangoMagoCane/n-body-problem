function PlayState:update_original(dt)
    self.distance_x = self.satellite.center_x - self.celestial.center_x
    self.distance_y = self.satellite.center_y - self.celestial.center_y
    self.hypotenuse = math.sqrt(self.distance_x^2 + self.distance_y^2)
    
    self.gravitational_F = (self.gravity * self.celestial.mass) / self.hypotenuse^2
    self.angle = -math.atan(self.distance_y/self.distance_x)

    self.accel_x = self.gravitational_F * math.cos(self.angle)
    self.accel_y = -self.gravitational_F * math.sin(self.angle)
    
    if self.distance_x > 0 then
        self.accel_x = -self.accel_x
        self.accel_y = -self.accel_y
    end
        
    self.satellite.accel_x = self.accel_x
    self.satellite.accel_y = self.accel_y
end