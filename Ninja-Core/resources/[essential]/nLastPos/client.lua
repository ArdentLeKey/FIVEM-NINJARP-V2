local AutoSaveEnabled = true
local TimerAutoSave = 35000 

function RequestToSave()
	LastPosX, LastPosY, LastPosZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	TriggerServerEvent("vMenuPosition:SavePos", LastPosX , LastPosY , LastPosZ)
end

--Fonction sauvegarde automatique de la position du joueur
function Saver()
	Citizen.CreateThread(function ()
		while true do
			Citizen.Wait(TimerAutoSave)
			RequestToSave()
		end
	end)
end

--Event pour le spawn du joueur vers la dernière position connue
RegisterNetEvent("vMenuPosition:LastPostClient")
AddEventHandler("vMenuPosition:LastPostClient", function(PosX, PosY, PosZ)
	SetEntityCoords(GetPlayerPed(-1), PosX, PosY, PosZ, 1, 0, 0, 1)
	if not origin then
		TriggerEvent("nMenuNotif:welcomeNotification")
    end
	Saver()
end)