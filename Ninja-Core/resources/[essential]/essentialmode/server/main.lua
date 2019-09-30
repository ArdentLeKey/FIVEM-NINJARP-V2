AddEventHandler('playerDropped', function()
	local Source = source

	if(Users[Source])then
		TriggerEvent("es:playerDropped", Users[Source])
		db.updateUser(Users[Source].get('license'), {money = Users[Source].getMoney(), bank = Users[Source].getBank()})
		Users[Source] = nil
	end
end)

local justJoined = {}

RegisterServerEvent('playerConnecting')
AddEventHandler('playerConnecting', function(name, setKickReason)
	local id
	for k,v in ipairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			id = v
			break
		end
	end

	for k,v in ipairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			setKickReason("Veuillez fermer votre steam: (Gestionnaire de tâches)")
			CancelEvent()
			break
		end
	end

	if not id then
		setKickReason("Veuillez fermer votre steam: (Gestionnaire de tâches)")
		CancelEvent()
	end
end)

RegisterServerEvent('es:firstJoinProper')
AddEventHandler('es:firstJoinProper', function()
	local Source = source
	Citizen.CreateThread(function()
		local id
		for k,v in ipairs(GetPlayerIdentifiers(Source))do
			if string.sub(v, 1, string.len("license:")) == "license:" then
				id = v
				break
			end
		end

		if not id then
			setKickReason("Veuillez fermer votre steam: (Gestionnaire de tâches)")
		else
			registerUser(id, Source)
			justJoined[Source] = true

			if(settings.defaultSettings.pvpEnabled)then
				TriggerClientEvent("es:enablePvp", Source)
			end
		end
		return
	end)
end)

AddEventHandler('es:setSessionSetting', function(k, v)
	settings.sessionSettings[k] = v
end)

AddEventHandler('es:getSessionSetting', function(k, cb)
	cb(settings.sessionSettings[k])
end)

local firstSpawn = {}

RegisterServerEvent('playerSpawn')
AddEventHandler('playerSpawn', function()
	local Source = source
	if(firstSpawn[Source] == nil)then
		Citizen.CreateThread(function()
			while Users[Source] == nil do Wait(0) end
			TriggerEvent("es:firstSpawn", Source, Users[Source])

			if settings.defaultSettings.pvpEnabled ~= "false" then
				TriggerClientEvent("es:enablePvp", Source)
			end

			return
		end)
	end
end)

AddEventHandler("es:setDefaultSettings", function(tbl)
	for k,v in pairs(tbl) do
		if(settings.defaultSettings[k] ~= nil)then
			settings.defaultSettings[k] = v
		end
	end

	debugMsg("Default settings edited.")
end)