--||@SuperCoolNinja.||--
RegisterServerEvent('vMenuIdentity:ShowServerMeID')
AddEventHandler('vMenuIdentity:ShowServerMeID', function()
	local player = GetPlayerIdentifiers(source)[1]
	local source = source	
	local result = MySQL.Sync.fetchAll("SELECT job, nom, prenom FROM users WHERE license = @license", {['@license'] = player})
	TriggerClientEvent('vMenuIdentity:ShowClientIDCard', source, result)
end)

RegisterServerEvent('vMenuIdentity:ShowServerPeopleID')
AddEventHandler('vMenuIdentity:ShowServerPeopleID', function(NearestPlayerSID)
	local player = GetPlayerIdentifiers(source)[1]
	local source = source	
	local result = MySQL.Sync.fetchAll("SELECT job, nom, prenom FROM users WHERE license = @license", {['@license'] = player})
	if NearestPlayerSID ~= 0 then
		TriggerClientEvent('vMenuIdentity:ShowClientIDCard', NearestPlayerSID, result)
		TriggerClientEvent('vMenuNotif:showNotification', NearestPlayerSID, "Une personne vous montre son identité.")
	else
		TriggerClientEvent('vMenuNotif:showNotification', source, "Aucune personne devant vous")
	end
end)