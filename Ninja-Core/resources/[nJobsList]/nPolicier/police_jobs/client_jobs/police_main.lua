
---------------------||Variable||---------------------
isInServiceCops = false
local ped = nil
Myjob = ""
copRank = 0

---------------------||Event||---------------------
RegisterNetEvent("vMenu:UpdateClientjobs")
AddEventHandler("vMenu:UpdateClientjobs", function(nameJob)
	Myjob = nameJob
end)

RegisterNetEvent('cl-cop')
AddEventHandler('cl-cop', function(iscop)
    copRank = iscop
end)

---------------------||Function||---------------------
function onServicePolice()
    local ped = GetPlayerPed(-1)
    if Myjob ~= "Police" then
        return
    end
	if isInServiceCops then
		TriggerServerEvent("vCharacter:SpawnCharacter")
		exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~h~Fin de ~r~service.", "")
		TriggerServerEvent("player:serviceOff", "police") 
	else
		exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~h~Prise de ~g~service.", "")
		TriggerServerEvent("player:serviceOn", "police") 
	end

	isInServiceCops = not isInServiceCops
	if copRank == 1 then --Cadet
		if GetEntityModel(ped) == 1885233650 then
			SetPedComponentVariation(ped, 3, 30, 0, 0)--Gants
			SetPedComponentVariation(ped, 4, 35, 0, 0)--Jean
			SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(ped, 8, 59, 0, 0) --Gilet Cadet
			SetPedComponentVariation(ped, 11, 55, 0, 0)--Veste
			SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
			SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
		elseif GetEntityModel(ped) == -1667301416 then
			SetPedComponentVariation(ped, 4, 34, 0, 0)--Pantalon
			SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(ped, 8, 36, 0, 0) --Gilet Cadet
			SetPedComponentVariation(ped, 11, 48, 0, 0)--Veste
			SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
			SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
		end
	elseif copRank == 2 then --Officier
		if GetEntityModel(ped) == 1885233650 then
			SetPedComponentVariation(ped, 3, 30, 0, 0)--Gants
			SetPedComponentVariation(ped, 4, 35, 0, 0)--Jean
			SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(ped, 8, 58, 0, 0)--mattraque
			SetPedComponentVariation(ped, 11, 55, 0, 0)--Veste
			SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
			SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
		elseif GetEntityModel(ped) == -1667301416 then
			SetPedComponentVariation(ped, 4, 34, 0, 0)--Pantalon
			SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(ped, 8, 35, 0, 0)
			SetPedComponentVariation(ped, 11, 48, 0, 0)--Veste
			SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
			SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
        end
    elseif copRank == 3 then --Sergent
        if GetEntityModel(ped) == 1885233650 then
			SetPedComponentVariation(ped, 3, 30, 0, 0)--Gants
			SetPedComponentVariation(ped, 4, 35, 0, 0)--Jean
			SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(ped, 8, 58, 0, 0)--mattraque
			SetPedComponentVariation(ped, 11, 55, 0, 0)--Veste
			SetPedComponentVariation(ped, 10, 8, 2, 0)--Grade
			SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
			SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
		elseif GetEntityModel(ped) == -1667301416 then
			SetPedComponentVariation(ped, 4, 34, 0, 0)--Pantalon
			SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(ped, 8, 35, 0, 0)
			SetPedComponentVariation(ped, 11, 48, 0, 0)--Veste
			SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
			SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
        end
    elseif copRank == 4 then --Lieutenant
        if GetEntityModel(ped) == 1885233650 then
			SetPedComponentVariation(ped, 3, 30, 0, 0)--Gants
			SetPedComponentVariation(ped, 4, 35, 0, 0)--Jean
			SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(ped, 8, 58, 0, 0)--mattraque
			SetPedComponentVariation(ped, 11, 55, 0, 0)--Veste
			SetPedComponentVariation(ped, 10, 8, 2, 0)--Grade
			SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
			SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
		elseif GetEntityModel(ped) == -1667301416 then
			SetPedComponentVariation(ped, 4, 34, 0, 0)--Pantalon
			SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(ped, 8, 35, 0, 0)
			SetPedComponentVariation(ped, 11, 48, 0, 0)--Veste
			SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
			SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
        end
    elseif copRank == 5 then --Capitaine
        if GetEntityModel(ped) == 1885233650 then
			SetPedComponentVariation(ped, 3, 30, 0, 0)--Gants
			SetPedComponentVariation(ped, 4, 35, 0, 0)--Jean
			SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(ped, 8, 58, 0, 0)--mattraque
			SetPedComponentVariation(ped, 11, 55, 0, 0)--Veste
			SetPedComponentVariation(ped, 10, 8, 3, 0)--Grade
			SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
			SetPedPropIndex(ped, 1, 18, 2, 1)--Lunette
		elseif GetEntityModel(ped) == -1667301416 then
			SetPedComponentVariation(ped, 4, 34, 0, 0)--Pantalon
			SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
			SetPedComponentVariation(ped, 8, 35, 0, 0)
			SetPedComponentVariation(ped, 11, 48, 0, 0)--Veste
			SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
			SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
			SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
        end
	end
end


