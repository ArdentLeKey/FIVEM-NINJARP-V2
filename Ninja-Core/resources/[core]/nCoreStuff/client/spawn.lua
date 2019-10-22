firstTick = false
local spawnMe = generateSpawn()

AddEventHandler('playerSpawned', function(spawn)
	while not NetworkIsGameInProgress() and IsPlayerPlaying(PlayerId()) do
		Wait(200)
	end

	while not IsScreenFadedIn() do
		Wait(200)
	end
end)

--[[
-- AFK Kick Time Limit (in seconds)
secondsUntilKick = 6000

-- Warn players if 3/4 of the Time Limit ran up
kickWarning = true
Citizen.CreateThread(function()
	while true do
		Wait(1000)
		
		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					time = time - 1
				else
					TriggerServerEvent("kickForBeingAnAFKDouchebag")
				end
			else
				time = secondsUntilKick
			end
			prevPos = currentPos
		end
	end
end)]]


---------||CORE SPAWN PLAYER|----------
Citizen.CreateThread(function()
	if not firstTick then	
		exports.spawnmanager:setAutoSpawn(false)
		exports.spawnmanager:forceRespawn()
		exports.spawnmanager:setAutoSpawnCallback(function()
			exports.spawnmanager:spawnPlayer({x = spawnMe.x, y = spawnMe.y, z = spawnMe.z-1.0, model = 'mp_m_freemode_01'})
		end)

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

		TriggerServerEvent("vCharacter:SpawnCharacter")
		exports.spawnmanager:setAutoSpawn(false)
		Wait(2000)		
		firstTick = true
		TriggerServerEvent("vMenuPosition:SpawnPlayerLastPosition")
		playerPed = PlayerPedId()
	end
end)