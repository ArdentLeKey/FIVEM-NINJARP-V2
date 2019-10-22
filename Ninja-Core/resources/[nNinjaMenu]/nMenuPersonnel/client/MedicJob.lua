
RegisterNetEvent('nMedics:CHealPlayer')
AddEventHandler('nMedics:CHealPlayer',function()
    local ped = GetPlayerPed(-1)
    SetEntityHealth(ped, 200)
    exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Ambulancier: ", "~h~Et voila chef !", "")
end)

__AddMenuMedicJob = function(menu)
    local submenu = _menuPool:AddSubMenu(menu.SubMenu, "Intéraction Citoyen", "")

    -----------------||Intéraction Citoyen||-----------------
	local reviveItem = NativeUI.CreateItem("Réanimer", "")
	submenu.SubMenu:AddItem(reviveItem)

	local soinItem = NativeUI.CreateItem("Soigner", "")
	submenu.SubMenu:AddItem(soinItem)

	local soonItem = NativeUI.CreateItem("Mettre dans le véhicule ~p~[SOON]", "")
    submenu.SubMenu:AddItem(soonItem)
    
    -----------------||Intéraction Citoyen||-----------------
	submenu.SubMenu.OnItemSelect = function(sender, item, index)
		if item == reviveItem then
			player, distance = GetClosestPlayer()
            if(distance ~= -1 and distance < 3) then
                
			else
                exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Ambulancier: ", "~y~Aucune personne devant vous.", "")
            end
        elseif item == soinItem then
            player, distance = GetClosestPlayer()
            if(distance ~= -1 and distance < 3) then
                TaskStartScenarioInPlace(GetPlayerPed(-1), 'CODE_HUMAN_MEDIC_KNEEL', 0, true)
                Citizen.Wait(8000)
                ClearPedTasks(GetPlayerPed(-1));
                TriggerServerEvent('nMedics:ShealHim',GetPlayerServerId(player))
                exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Ambulancier: ", "~h~Vous avez soigné une personne.", "")
			else
                exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Ambulancier: ", "~y~Aucune personne devant vous.", "")
            end
		end
    end
end