--||@SuperCoolNinja.||--
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
                    exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_TALK~ pour accéder a la recherche ~b~d'emplois")
                else
                    exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour accéder a la recherche ~b~d'emplois")
                end
                
				if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
					mainMenu:Visible(not mainMenu:Visible())
				end
            end
        end
    end
end)
