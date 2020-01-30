firstTick = false
local ShowLoadingScreen = false

AddEventHandler('playerSpawned', function(spawn)
	while not NetworkIsGameInProgress() and IsPlayerPlaying(PlayerId()) do
		Wait(200)
	end

	while not IsScreenFadedIn() do
		Wait(200)
	end
end)

Citizen.CreateThread(function()
	if not firstTick then		
		if not IsPlayerSwitchInProgress() then
			SetEntityVisible(PlayerPedId(), false, 0)
			SwitchOutPlayer(PlayerPedId(), 32, 1)
			Wait(3000)

			showLoadingPromt("PCARD_JOIN_GAME", 8000)
			Wait(1000)		
		end

		SwitchInPlayer(PlayerPedId())
		SetEntityVisible(PlayerPedId(), true, 0)
		Wait(5000)		

		TriggerServerEvent('vMenuPosition:SpawnPlayerLastPosition')
		exports.spawnmanager:setAutoSpawn(false)
		Wait(2000)
		firstTick = true
		playerPed = PlayerPedId()
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(300)
		if firstTick then
			playerPed = PlayerPedId()
			if GetEntityHealth(playerPed) <= 0 then
				IsPedDead = true
			else
				IsPedDead = false
			end
		end
	end
end)