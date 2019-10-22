function missionText(text, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(time, 1)
end

function DisplayHelpAlert(help)
    BeginTextCommandDisplayHelp("STRING");  
    AddTextComponentSubstringPlayerName(help);  
    EndTextCommandDisplayHelp(0, 0, 1, -1);  
end