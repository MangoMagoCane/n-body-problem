require 'src/Dependencies'

-- background = love.graphics.newImage('graphics/background.png')
background = love.graphics.newImage('graphics/black_background.png')


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('orbits')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    gSounds = {
        ['select'] = love.audio.newSource('sounds/select.wav', 'static'),
        ['no-select'] = love.audio.newSource('sounds/no-select.wav', 'static')
    }

    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end
    }
    gStateMachine:change('start', {})

    translation_x = 0
    translation_y = 0
    object_scale = 1

    love.keyboard.keysPressed = {}
end


function love.update(dt)
    -- if love.keyboard.wasPressed('space') then
        gStateMachine:update(dt)
    -- end
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    love.keyboard.keysPressed = {}
end


function love.draw()
    mousedrag()

    push:apply('start')
        local backgroundWidth = background:getWidth()
        local backgroundHeight = background:getHeight()
        love.graphics.draw(background, 0, 0, 0, VIRTUAL_WIDTH / (backgroundWidth - 1), VIRTUAL_HEIGHT / (backgroundHeight - 1))
        gStateMachine:render()
    push:apply('end')
end


function love.resize(w, h)
    push:resize(w, h)
end


function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end


function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end 


function love.wheelmoved(x, y)
    local scroll_scale = -0.1*y
    if object_scale - scroll_scale > 0.25 then
        object_scale = object_scale - scroll_scale 
    end
end


function mousedrag()
    mouse_x = love.mouse.getX()
    mouse_y = love.mouse.getY()
    if love.mouse.isDown(1) then
        if not mouse_pressed then
            mouse_pressed = true
            delta_x = translation_x - mouse_x 
            delta_y = translation_y - mouse_y 
        else
            translation_x = mouse_x + delta_x
            translation_y = mouse_y + delta_y
        end
    elseif mouse_pressed then
        mouse_pressed = false
    end
end
