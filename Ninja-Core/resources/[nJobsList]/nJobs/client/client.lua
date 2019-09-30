--||@SuperCoolNinja.||--


isInService = false

AddEventHandler('onClientMapStart', function()
    TriggerServerEvent('vPolice:OnJoin')
end)

Myjob = ""
RegisterNetEvent("vMenu:UpdateClientjobs")
AddEventHandler("vMenu:UpdateClientjobs", function(nameJob)
	Myjob = nameJob
end)

copRank = 0
RegisterNetEvent('cl-cop')
AddEventHandler('cl-cop', function(iscop)
    copRank = iscop
end)

function DisplayHelpAlert(help)
    BeginTextCommandDisplayHelp("STRING");  
    AddTextComponentSubstringPlayerName(help);  
    EndTextCommandDisplayHelp(0, 0, 1, -1);  
end

function drawNotification(text)
    SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, true)
end

local vestiarePolice = {
	{x = 450.174, y = -992.276, z = 30.6896},
}

function onServicePolice()
    local ped = GetPlayerPed(-1)
    if Myjob ~= "Police" then
        return
    end
	if isInService then
		TriggerServerEvent("vCharacter:SpawnCharacter")
		drawNotification("~h~Fin de ~r~service.")
	else
		drawNotification("~h~Prise de ~g~service.")
	end

	isInService = not isInService
	if copRank == 1 then --Cadet
		if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
			SetPedComponentVariation(GetPlayerPed(-1), 3, 30, 0, 0)--Gants
			SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 0)--Jean
			SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(GetPlayerPed(-1), 8, 59, 0, 0) --Gilet Cadet
			SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0, 0)--Veste
			SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)--Montre
			SetPedPropIndex(GetPlayerPed(-1), 1, 7, 0, 1)--Lunette
		elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then
			SetPedComponentVariation(GetPlayerPed(-1), 4, 34, 0, 0)--Pantalon
			SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(GetPlayerPed(-1), 8, 36, 0, 0) --Gilet Cadet
			SetPedComponentVariation(GetPlayerPed(-1), 11, 48, 0, 0)--Veste
			SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)--Montre
			SetPedPropIndex(GetPlayerPed(-1), 1, 7, 0, 1)--Lunette
		end
	elseif copRank == 2 then --Officier
		if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
			SetPedComponentVariation(GetPlayerPed(-1), 3, 30, 0, 0)--Gants
			SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 0)--Jean
			SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(GetPlayerPed(-1), 8, 58, 0, 0)--mattraque
			SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0, 0)--Veste
			SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)--Montre
			SetPedPropIndex(GetPlayerPed(-1), 1, 7, 0, 1)--Lunette
		elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then
			SetPedComponentVariation(GetPlayerPed(-1), 4, 34, 0, 0)--Pantalon
			SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(GetPlayerPed(-1), 8, 35, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 11, 48, 0, 0)--Veste
			SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)--Montre
			SetPedPropIndex(GetPlayerPed(-1), 1, 7, 0, 1)--Lunette
        end
    elseif copRank == 3 then --Sergent
        if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
			SetPedComponentVariation(GetPlayerPed(-1), 3, 30, 0, 0)--Gants
			SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 0)--Jean
			SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(GetPlayerPed(-1), 8, 58, 0, 0)--mattraque
			SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0, 0)--Veste
			SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 2, 0)--Grade
			SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)--Montre
			SetPedPropIndex(GetPlayerPed(-1), 1, 7, 0, 1)--Lunette
		elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then
			SetPedComponentVariation(GetPlayerPed(-1), 4, 34, 0, 0)--Pantalon
			SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(GetPlayerPed(-1), 8, 35, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 11, 48, 0, 0)--Veste
			SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)--Montre
			SetPedPropIndex(GetPlayerPed(-1), 1, 7, 0, 1)--Lunette
        end
    elseif copRank == 4 then --Lieutenant
        if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
			SetPedComponentVariation(GetPlayerPed(-1), 3, 30, 0, 0)--Gants
			SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 0)--Jean
			SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(GetPlayerPed(-1), 8, 58, 0, 0)--mattraque
			SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0, 0)--Veste
			SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 2, 0)--Grade
			SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)--Montre
			SetPedPropIndex(GetPlayerPed(-1), 1, 7, 0, 1)--Lunette
		elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then
			SetPedComponentVariation(GetPlayerPed(-1), 4, 34, 0, 0)--Pantalon
			SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(GetPlayerPed(-1), 8, 35, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 11, 48, 0, 0)--Veste
			SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)--Montre
			SetPedPropIndex(GetPlayerPed(-1), 1, 7, 0, 1)--Lunette
        end
    elseif copRank == 5 then --Capitaine
        if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
			SetPedComponentVariation(GetPlayerPed(-1), 3, 30, 0, 0)--Gants
			SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 0)--Jean
			SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(GetPlayerPed(-1), 8, 58, 0, 0)--mattraque
			SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0, 0)--Veste
			SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 3, 0)--Grade
			SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)--Montre
			SetPedPropIndex(GetPlayerPed(-1), 1, 18, 2, 1)--Lunette
		elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then
			SetPedComponentVariation(GetPlayerPed(-1), 4, 34, 0, 0)--Pantalon
			SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(GetPlayerPed(-1), 8, 35, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 11, 48, 0, 0)--Veste
			SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)--Montre
			SetPedPropIndex(GetPlayerPed(-1), 1, 7, 0, 1)--Lunette
        end
	end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()

        for k in pairs(vestiarePolice) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, vestiarePolice[k].x, vestiarePolice[k].y, vestiarePolice[k].z)

            if dist <= 3 then
                if Myjob == "Police" then
                    TriggerServerEvent('vPolice:Check')
                    if GetLastInputMethod(0) then
                        DisplayHelpAlert("~INPUT_TALK~ pour accéder au ~b~vestiare")
                    else
                        DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour accéder au ~b~vestiare")
                    end
                    
                    if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
                        mainMenu:Visible(not mainMenu:Visible())
                    end
                end
            end
        end
    end
end)
