local notificationInProgress = false
local notifiInProgressCrew = false

RegisterNetEvent('callsystem:ReceiveDringAppart')
AddEventHandler('callsystem:ReceiveDringAppart', function(player_serverid, player_name, appart_name)
	Citizen.CreateThread(function()
		local controlPressed = false

		while notificationInProgress do
			Citizen.Wait(0)
		end

		local notifReceivedAt = GetGameTimer()
		---||Simple Interact Sound pour la sonnerie ("DRIIING")||---
		TriggerServerEvent('InteractSound_SV:PlayOnSource','door', 0.3)
		
		exports.nCoreStuff:nNotificationMain({
			text = player_name.." sonne a votre porte !", --Surement a changer
			type = 'basGauche',
			nTimeNotif = 60000,
		})

		if GetLastInputMethod(0) then
			exports.nCoreStuff:nNotificationMain({
				text = "~b~E ~w~pour ~b~ouvrir ~w~la porte.", --Surement a changer
				type = 'basGauche',
				nTimeNotif = 60000,
			})
		else
			exports.nCoreStuff:nNotificationMain({
				text = "~b~DROIT ~w~pour ~b~ouvrir ~w~la porte", --Surement a changer
				type = 'basGauche',
				nTimeNotif = 60000,
			})
		end

		while not controlPressed do
			Citizen.Wait(0)
			notificationInProgress = true

			if (GetTimeDifference(GetGameTimer(), notifReceivedAt) > 15000) then
				notificationInProgress = false
				controlPressed = true
			end

			if IsControlPressed(1, 38) then
				controlPressed = true
				TriggerServerEvent('callsystem:getTheCallDring', player_serverid)
			end

			if controlPressed then
				notificationInProgress = false
			end
		end
	end)
end)