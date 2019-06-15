---------------------------------------------------------------------------
----------------        Basic Variable       -----------------------------
----------------         Do not edit                 ---------------------
--------------------------------------------------------------------------
local current_weapon = "none"

--------------------------------------------------------------------------
----------------        Basic Setting       ------------------------------
--------------------------------------------------------------------------

---- key bind ----

local ump9_key = 4
local akm_key = 6
local m16a4_key = nil
local m16a4_key_pressed = false
local m416_key = 7
local scarl_key = nil
local uzi_key = 5

local trigger_key = 7

local set_off_key = 6

local functional = -1


---- fire key ----

local aim_key = 3
local fire_key = "pause"
local mode_switch_key = "scrolllock"
local auto_ads_key = "capslock"


---- ignore key ----
---- can use "lalt", "ralt", "alt"  "lshift", "rshift", "shift"  "lctrl", "rctrl", "ctrl"

local ignore_key = "lshift"

--- Sensitivity in Game
--- default is 50.0

local target_sensitivity = 50
local scope_sensitivity = 47
local scope4x_sensitivity = 44

---- Obfs setting
---- Two firing time intervals = weapon_speed * interval_ratio * ( 1 + random_seed * ( 0 ~ 1))
local weapon_speed_mode = false
-- local obfs_mode = false
local obfs_mode = true
local interval_ratio = 0.75
local random_seed = 1

--------------------------------------------------------------------------
----------------        Recoil Table        ------------------------------
---------------- You can fix the value here ------------------------------
--------------------------------------------------------------------------

local recoil_table = {}

recoil_table["ump9"] = {
    basic={18,19,18,19,18,19,19,21,23,24,23,24,23,24,23,24,23,24,23,24,23,24,24,25,24,25,24,25,24,25,24,25,25,26,25,26,25,26,25,26,25,26,25,26,25,26},
    quadruple={83.3,83.3,83.3,83.3,83.3,83.3,83.3,116.7,116.7,116.7,116.7,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3},
    speed = 92
}

-- recoil_table["akm"] = {
--     basic={23.7,23.7,23.7,23.7,23.7,23.7,23.7,23.7,23.7,23.7,23.7,28,28,28,28,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7},
--     quadruple={66.7,66.7,66.7,66.7,66.7,66.7,66.7,66.7,66.7,66.7,66.7,123.3,123.3,123.3,123.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3},
--     speed = 100
-- }

recoil_table["akm"] = {
    basic={25,25,25,29,33,33,32,33,32,32,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30},
    quadruple={86.7,86.7,86.7,86.7,86.7,86.7,86.7,150,150,150,150,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120},
    speed = 100
}

-- recoil_table["m16a4"] = {
--     basic={25,25,25,29,33,33,32,33,32,32,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30},
--     quadruple={86.7,86.7,86.7,86.7,86.7,86.7,86.7,150,150,150,150,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120},
--     speed = 75
-- }

recoil_table["m416"] = {
    basic={21,21,21,21,21,21,21,21,21,23,23,24,23,24,25,25,26,27,27,32,31,31,31,31,31,31,31,32,32,32,35,35,35,35,35,35,35,35,35,35,35},
    quadruple={86.7,86.7,86.7,86.7,86.7,86.7,86.7,150,150,150,150,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7},
    speed = 86
}

recoil_table["scarl"] = {
    basic={20,21,22,21,22,22,23,22,23,23,24,24,25,25,25,25,26,27,28,29,30,32,34,34,35,34,35,34,35,34,35,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35},
    quadruple={86.7,86.7,86.7,86.7,86.7,86.7,86.7,150,150,150,150,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7},
    speed = 96
}

recoil_table["uzi"] = {
    basic={16,17,18,20,21,22,23,24,25,26,28,30,32,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34},
    quadruple={13.3,13.3,13.3,13.3,13.3,21.7,21.7,21.7,21.7,21.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7},
    speed = 48
}

recoil_table["none"] = {
    basic={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    quadruple={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    speed = 60
}


--------------------------------------------------------------------------
----------------          Function          ------------------------------
--------------------------------------------------------------------------


function convert_sens(unconvertedSens) 
    return 0.002 * math.pow(10, unconvertedSens / 50)
end

function calc_sens_scale(sensitivity)
    return convert_sens(sensitivity)/convert_sens(50)
end

local target_scale = calc_sens_scale(target_sensitivity)
local scope_scale = calc_sens_scale(scope_sensitivity)
local scope4x_scale = calc_sens_scale(scope4x_sensitivity)

function recoil_mode()
    if IsKeyLockOn(mode_switch_key) then
        return "quadruple";
    else
        return "basic";
    end
end


function recoil_value(_factor,_duration)
    local v=factor*math.pow(_duration/1000.0, 0.2)
    if v<factor*0.5 then
        v=factor*0.5
        return v*0.4;
    end
    if IsKeyLockOn(mode_switch_key) then
        return v*1.6;
    else
        return v*0.4;
    end
end

-- function recoil_value(_factor,_duration)
--     _factor=3
--     local v=3.0+(1.4*_duration)/86.0, 8.0
--     if (v>8.0) then
--         v=8.0
--     end
--     return v*50.0/86.0/4.0
-- end


function OnEvent(event, arg)
    
    local fire_key_pressed = -1
    OutputLogMessage("event = %s, arg = %d\n", event, arg)
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true)
    elseif event == "PROFILE_DEACTIVATED" then
        current_weapon = "none"
        shoot_duration = 0.0
        ReleaseKey(fire_key)
        ReleaseMouseButton(9)
    end

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then
        factor=1.5
        fire_key_pressed = 1
    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 5) then
        factor=1.8
        fire_key_pressed = 1
    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 6) then
        factor=2.3
        fire_key_pressed = 1
    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 7) then
        factor=3.0
        fire_key_pressed = 1
    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 12) then
        PressAndReleaseKey(mode_switch_key)
    end
    
    if fire_key_pressed == 1 then 
        functional = -functional
        OutputLogMessage("Functional = %d\n", functional )
    end
    
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 10) then
        PressMouseButton(1);
        -- PressKey(fire_key)
    end
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 10) then
        ReleaseMouseButton(1);
        -- ReleaseKey(fire_key)
    end
    
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and functional == 1) then
        if (recoil_mode() == "basic" and IsKeyLockOn(auto_ads_key))  then
            PressAndReleaseMouseButton(aim_key)
        end
        local shoot_duration = 0.0
        intervals=1.0
        havent_moved=0.0
        repeat
            local recovery = recoil_value(factor,shoot_duration)
            Sleep(intervals)
            OutputLogMessage( "Fix = %f\n", recovery )
            havent_moved=havent_moved+recovery
            while(havent_moved>1.0)
            do
                MoveMouseRelative(0, 1)
                -- OutputLogMessage( "MOV\n", recovery )
                havent_moved=havent_moved-1.0
            end 
            shoot_duration = shoot_duration + intervals
        until not IsMouseButtonPressed(1)
    elseif (event == "MOUSE_BUTTON_RELEASED" and arg == 1 and functional == 1) then
        -- ReleaseKey(fire_key)
        if (recoil_mode() == "basic" and IsKeyLockOn(auto_ads_key)) then
            PressAndReleaseMouseButton(aim_key)
        end
    end
    
    
    
    fire_key_pressed = -1
end 