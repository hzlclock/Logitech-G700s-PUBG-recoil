local current_weapon = "none"

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

-- math.randomseed(os.time())

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
        return factor*0.5*0.4;
    else
        return v*0.4
    end
end

function bool2int(value)
    return value and 1 or 0
end


function OnEvent(event, arg)
    
    local fire_key_pressed = -1
    OutputLogMessage("event = %s, arg = %d\n", event, arg)
    OutputLogMessage("ran = %d\n", math.random(0,10))
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

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 1) then
        -- PressMouseButton(1);
        PressKey(fire_key)
    end
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 1) then
        -- ReleaseMouseButton(1);
        ReleaseKey(fire_key)
    end
    
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and functional == 1) then
        
        if (IsKeyLockOn(auto_ads_key))  then
            PressAndReleaseMouseButton(aim_key)
        end
        local shoot_duration = 0.0
        intervals=1.0
        havent_moved=0.0
        persist=0

        random_interval=50+math.random(0,20)
        random_interval_mid=20+math.random(0,20)

        val=0

        repeat
            local recovery = recoil_value(factor,shoot_duration)
            Sleep(intervals)

            if (IsKeyLockOn(mode_switch_key)) then
                val=val+1
                -- OutputLogMessage( "Val = %d\n", val )
                if(val==random_interval_mid) then
                    OutputLogMessage("RELEASE\n")
                    ReleaseKey(fire_key)
                    persist=random_interval
                end

                if(val==random_interval) then
                    OutputLogMessage("PRESS\n")
                    PressKey(fire_key)
                    persist=2
                    random_interval=50+math.random(0,20)
                    random_interval_mid=20+math.random(0,20)

                    val=0
                end
            end

            OutputLogMessage( "%d | %d | Fix = %f\n", bool2int(IsMouseButtonPressed(1)), persist,  recovery )
            havent_moved=havent_moved+recovery
            while(havent_moved>1.0)
            do
                MoveMouseRelative(0, 1)
                -- OutputLogMessage( "MOV\n", recovery )
                havent_moved=havent_moved-1.0
            end 
            shoot_duration = shoot_duration + intervals
            persist=persist-1
        until ((not IsMouseButtonPressed(1)) and (persist<=0))
        ReleaseKey(fire_key)
        OutputLogMessage("RELEASE\n")
        persist=0
    elseif (event == "MOUSE_BUTTON_RELEASED" and arg == 1 and functional == 1) then
        -- ReleaseKey(fire_key)
        if (IsKeyLockOn(auto_ads_key)) then
            PressAndReleaseMouseButton(aim_key)
        end
    end
    
    
    
    fire_key_pressed = -1
end