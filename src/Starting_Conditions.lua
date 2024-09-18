-- This is the defualt template
-- {x = 0, y = 0, vel_x = 0, vel_y = 0, mass = 10, skin = 'object_larger', point_color = {0, 0, 0}}

SC_table_1_test = {
    { x = -30,   vel_y = 4,       mass = 6,               skin = 'Baren',      point_color = { 1, 0, 0 } },
    { vel_y = 2, skin = 'Terran', point_color = { 0, 1, 0 } },
    { x = 200,   vel_x = 0.6,     vel_y = 0.6,            mass = 80,           skin = 'Lava',          point_color = { 0, 0, 1 } },
    { x = -2000, y = 2000,        mass = 1000,            skin = 'black_hole', point_color = { 1, 0, 1 } }
}

SC_table_2_test = {
    { x = -100, y = 0, vel_x = 0, vel_y = 0.5,  mass = 10, skin = 'Baren',  point_color = { 1, 0, 0 } },
    { x = 0,    y = 0, vel_x = 0, vel_y = -0.5, mass = 10, skin = 'Terran', point_color = { 0, 1, 0 } }
}

SC_table_1 = {
    { x = -100,  y = 0,    vel_x = 0,  vel_y = 4,  mass = 20,    skin = 'Baren',      point_color = { 0.25, 1, 0.5 } },
    { x = 0,     y = 0,    vel_x = 0,  vel_y = 2,  mass = 10,    skin = 'Terran',     point_color = { 0, 0, 1 } },
    { x = 200,   y = 0,    vel_x = -3, vel_y = .2, mass = 80,    skin = 'lava',       point_color = { 1, 0, 0 } },
    { x = -2000, y = 5000, vel_x = 0,  vel_y = 0,  mass = 10000, skin = 'black_hole', point_color = { 0, 1, 1 } }
}

SC_table_2 = {
    { x = -100, vel_y = 1,  mass = 100, sumAccel_Y = 2,  skin = 'Baren',         point_color = { 1, 0, 0 } },
    { x = 100,  vel_y = -1, mass = 100, skin = 'Terran', point_color = { 0, 1, 0 } }
}

SC_tables = { SC_table_1, SC_table_2 }
