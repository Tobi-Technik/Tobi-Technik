--	<===============~~Recoil Presets~~===============>

local recoilPresets = {
    {strength = 4, horizontalStrength = 0, description = "low"},
    {strength = 6, horizontalStrength = 0, description = "medium"},
    {strength = 8, horizontalStrength = 0, description = "medium+"},
    {strength = 10, horizontalStrength = 0, description = "high"}
}

local selectedPresetIndex = 1
local noRecoilEnabled = true


--	<===============~~Functions~~===============>
function OnEvent(event, arg)
    OutputLogMessage("event = %s, arg = %s\n", event, arg)
    
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true)
    end
    

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 5) then
        noRecoilEnabled = not noRecoilEnabled
        if (noRecoilEnabled) then
            OutputLogMessage("[+] No recoil is on\n")
        else
            OutputLogMessage("[-] No recoil is off\n")
        end
    end
    

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then
        selectedPresetIndex = (selectedPresetIndex % #recoilPresets) + 1
        OutputLogMessage("[+] Selected recoil preset: %s\n", recoilPresets[selectedPresetIndex].description)
    end
    

if (noRecoilEnabled and event == "MOUSE_BUTTON_PRESSED" and arg == 1 and IsMouseButtonPressed(1) and IsMouseButtonPressed(3)) then
    local recoil = recoilPresets[selectedPresetIndex]
    repeat
        MoveMouseRelative(recoil.horizontalStrength, recoil.strength)
        Sleep(14)
    until not (IsMouseButtonPressed(1) and IsMouseButtonPressed(3))
end
end
