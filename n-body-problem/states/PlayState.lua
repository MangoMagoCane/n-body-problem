PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.gravity = 10

    self.points = {}
end


function PlayState:enter(params) 
    self.satellites = params.satellites
end


function PlayState:update(dt)
    -- if love.keyboard.wasPressed('space') then

    for i, satellite in ipairs(self.satellites) do
        satellite:update(dt)
        table.insert(self.points, Point(satellite.center_x, satellite.center_y, satellite.point_color))
    end

    for i, firstbody in ipairs(self.satellites) do
        firstbody.sumAccel_x = 0
        firstbody.sumAccel_y = 0
        for j, secondbody in ipairs(self.satellites) do
            if i ~= j then
                local distance_x = firstbody.center_x - secondbody.center_x
                local distance_y = firstbody.center_y - secondbody.center_y
                local hypotenuse = math.sqrt(distance_x^2 + distance_y^2)
                
                local gravitational_F = (self.gravity * secondbody.mass) / hypotenuse^2
                local angle = -math.atan(distance_y/distance_x)
                
                local accel_x = gravitational_F * math.cos(angle)
                local accel_y = -gravitational_F * math.sin(angle)
                
                if distance_x > 0 then
                    accel_x = -accel_x
                    accel_y = -accel_y
                end
                
                firstbody.sumAccel_x = firstbody.sumAccel_x + accel_x
                firstbody.sumAccel_y = firstbody.sumAccel_y + accel_y
            end
        end
    end

-- end
end


function PlayState:render()
    local translate_x = translation_x-WINDOW_WIDTH*(object_scale-1)
    local translate_y = translation_y-WINDOW_HEIGHT*(object_scale-1)

    -- translation_x = translation_x + self.satellites[1].vel_x
    -- translation_y = translation_y + self.satellites[1].vel_x


    for i, satellite in ipairs(self.satellites) do
        love.graphics.push()
            love.graphics.translate(translate_x, translate_y)
            love.graphics.scale(object_scale, object_scale)
            satellite:render()
        love.graphics.pop()

        love.graphics.push()
            love.graphics.scale(SCALE_FACTOR/2, SCALE_FACTOR/2)
            love.graphics.setColor(1, 1, 1)
            love.graphics.print(satellite.skin.."_sumx:"..string.format("%.4f", satellite.sumAccel_x), 0, 32*(i-1))
            love.graphics.print(satellite.skin.."_sumy:"..string.format("%.4f", satellite.sumAccel_y), 0, 32*(i-1)+16)
        love.graphics.pop()
    end

    for i, point in ipairs(self.points) do
        love.graphics.push()
            love.graphics.translate(translate_x, translate_y)
            love.graphics.scale(object_scale, object_scale)
            point:render()
        love.graphics.pop()
    end
end

