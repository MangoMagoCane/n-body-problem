StartState = Class{__includes = BaseState}

function StartState:init()
    self.satellites = {}
    self.current_table = 1
    self.table = SC_tables[self.current_table]
    self.table_count = 0

    for i, table in ipairs(SC_tables) do
        self.table_count = self.table_count + 1
    end
end


function StartState:update(dt)
    if love.keyboard.wasPressed('up') then
        if self.current_table == 1 then
            gSounds['no-select']:play()
            self.current_table = self.table_count
        else 
            gSounds['select']:play()
            self.current_table = self.current_table - 1
        end
    end

    if love.keyboard.wasPressed('down') then
        if self.current_table == self.table_count then
            gSounds['no-select']:play()
            self.current_table = 1
        else
            gSounds['select']:play()
            self.current_table = self.current_table + 1
        end
    end

    self.table = SC_tables[self.current_table]

    if love.keyboard.wasPressed('space') then
        for i, params in ipairs(self.table) do
            table.insert(self.satellites, Satellite(params))
        end
        gStateMachine:change('play', {
            satellites = self.satellites
        })
    end
end


function StartState:render()
    love.graphics.push()
    love.graphics.scale(SCALE_FACTOR/2, SCALE_FACTOR/2)
        for i, params in ipairs(self.table) do
            love.graphics.print(params.skin, 0, 16*(i))
        end
    love.graphics.pop()
end