--||@SuperCoolNinja.||--

function DisplayHelpAlert(help)
    BeginTextCommandDisplayHelp("STRING");  
    AddTextComponentSubstringPlayerName(help);  
    EndTextCommandDisplayHelp(0, 0, 1, -1);  
end

local jobss = {
	{x = -55.7898, y = 6525.02, z = 31.4908},
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()

        for k in pairs(jobss) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, jobss[k].x, jobss[k].y, jobss[k].z)

            if dist <= 3 then
                if GetLastInputMethod(0) then
                    DisplayHelpAlert("~INPUT_TALK~ pour accéder a la recherche ~b~d'emplois")
                else
                    DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour accéder a la recherche ~b~d'emplois")
                end
                
				if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
					mainMenu:Visible(not mainMenu:Visible())
				end
            end
        end
    end
end)
