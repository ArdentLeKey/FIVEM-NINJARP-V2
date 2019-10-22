
---------------------||Variable||---------------------
isInServiceMedic = false
local ped = nil
Myjob = ""
medicRank = 0

---------------------||Event||---------------------
RegisterNetEvent("vMenu:UpdateClientjobs")
AddEventHandler("vMenu:UpdateClientjobs", function(nameJob)
	Myjob = nameJob
end)

RegisterNetEvent('nMedics:cRefresh')
AddEventHandler('nMedics:cRefresh', function(ismedic)
    medicRank = ismedic
end)

---------------------||Function||---------------------
function onServiceMedics()
    local ped = GetPlayerPed(-1)
    if Myjob ~= "Ambulancier" then
        return
    end
	if isInServiceMedic then
		TriggerServerEvent("vCharacter:SpawnCharacter")
		exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Ambulancier: ", "~h~Fin de ~r~service.", "")
		TriggerServerEvent("player:serviceOff", "medic") 
	else
		exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Ambulancier: ", "~h~Prise de ~g~service.", "")
		TriggerServerEvent("player:serviceOn", "medic") 
	end

	isInServiceMedic = not isInServiceMedic
	if medicRank == 1 then --Cadet
		if GetEntityModel(ped) == 1885233650 then --GOOD
			SetPedComponentVariation(GetPlayerPed(-1), 3, 92, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 11, 13, 3, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 7, 23, 1, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 1, 0)
		elseif GetEntityModel(ped) == -1667301416 then
			SetPedComponentVariation(GetPlayerPed(-1), 11, 9, 2, 2)
			SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2)
			SetPedComponentVariation(GetPlayerPed(-1), 4, 3, 3, 2)
			SetPedComponentVariation(GetPlayerPed(-1), 3, 98, 0, 2)
			SetPedComponentVariation(GetPlayerPed(-1), 6, 27, 0, 2)
		end
	end
end