--||@SuperCoolNinja.||--

medicRank = 0
RegisterServerEvent('nMedics:OnJoin')
AddEventHandler('nMedics:OnJoin', function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll("SELECT * FROM `medics` WHERE `license` = @license", {["@license"] = license}, function(result)
		local myID = result[1]
		if myID == nil then
			MySQL.Async.execute("INSERT INTO medics (license, rank) VALUES (@license, @rank)", {["@license"] = license, ["@rank"] = 1})
		end
	end)
end)

RegisterServerEvent('nMedics:Check')
AddEventHandler('nMedics:Check', function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll("SELECT * FROM `medics` WHERE `license` = @license", {["@license"] = license}, function(result)
		local ismedic = result[1].rank
		TriggerClientEvent('nMedics:cRefresh', -1, ismedic)
		medicRank = ismedic
	end)
end)

RegisterServerEvent('nPolice:AddOfficier') --EXEMPLE
AddEventHandler('nPolice:AddOfficier', function(NearestPlayerSID)
	local license = GetPlayerIdentifiers(NearestPlayerSID)[1]
	if NearestPlayerSID ~= 0 then
		MySQL.Async.execute("UPDATE medics SET rank=@rank WHERE `license` = @license", {["@license"] = license, ["@rank"] = 2})
		TriggerClientEvent('vMenuNotif:showNotification', NearestPlayerSID, "Une personne vous à promu Officier.")
	end
end)



function removeCop() --EXEMPLE
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	MySQL.Async.execute("UPDATE medics SET rank=@rank WHERE `license` = @license", {["@license"] = license, ["@rank"] = 0})
end


--[[
################################################################
- Creator: Jyben
- Date: 02/05/2017
- Url: https://github.com/Jyben/emergency
- Licence: Apache 2.0
################################################################
--]]

RegisterServerEvent('es_em:sendEmergency')
AddEventHandler('es_em:sendEmergency', function(reason, playerIDInComa, x, y, z)
	TriggerClientEvent('es_em:sendEmergencyToDocs', -1, reason, playerIDInComa, x, y, z, source)
end)

RegisterServerEvent('es_em:getTheCall')
AddEventHandler('es_em:getTheCall', function(playerName, playerID, x, y, z, sourcePlayerInComa)
	TriggerClientEvent('es_em:callTaken', -1, playerName, playerID, x, y, z, sourcePlayerInComa)
end)

RegisterServerEvent('es_em:sv_resurectPlayer')
AddEventHandler('es_em:sv_resurectPlayer', function(sourcePlayerInComa)
	local player = GetPlayerIdentifiers(sourcePlayerInComa)[1]
	MySQL.Sync.execute("UPDATE users SET isDead = 0 WHERE license = @license", {['@license'] = player})
	TriggerClientEvent('es_em:cl_resurectPlayer', sourcePlayerInComa)
end)


RegisterServerEvent('nMedics:SetInComaON')
AddEventHandler('nMedics:SetInComaON', function()
	local player = GetPlayerIdentifiers(source)[1]
	MySQL.Sync.execute("UPDATE users SET isDead = 1 WHERE license = @license", {['@license'] = player})
end)

RegisterServerEvent('nMedics:SetInComaOFF')
AddEventHandler('nMedics:SetInComaOFF', function()
	local player = GetPlayerIdentifiers(source)[1]
	MySQL.Sync.execute("UPDATE users SET isDead = 0 WHERE license = @license", {['@license'] = player})
end)

RegisterServerEvent('es_em:sv_removeMoney')
AddEventHandler('es_em:sv_removeMoney', function()
	local player = GetPlayerIdentifiers(source)[1]
	TriggerEvent("es:getPlayerFromId", source, function(user)
		MySQL.Sync.execute("DELETE FROM user_weapons WHERE license = @username",{['@username'] = player})
		MySQL.Sync.execute("UPDATE users SET isDead = 0 WHERE license = @license", {['@license'] = player})
		if user.getMoney() > 0 then
			user.setMoney(0)
		end
		if user.getDirtyMoney() > 0 then
			user.setDirty_Money(0)
		end
	end)
end)

RegisterServerEvent('es_em:sv_sendMessageToPlayerInComa')
AddEventHandler('es_em:sv_sendMessageToPlayerInComa', function(sourcePlayerInComa)
	TriggerClientEvent('es_em:cl_sendMessageToPlayerInComa', sourcePlayerInComa)
end)