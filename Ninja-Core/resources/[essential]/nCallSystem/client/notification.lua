
local notificationInProgress = false
local notifiInProgressCrew = false

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

RegisterNetEvent('callsystem:ReceiveDringAppart')
AddEventHandler('callsystem:ReceiveDringAppart', function(player_serverid, player_name, appart_name)
	Citizen.CreateThread(function()
		local controlPressed = false

		while notificationInProgress do
			Citizen.Wait(0)
		end

		local notifReceivedAt = GetGameTimer()
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