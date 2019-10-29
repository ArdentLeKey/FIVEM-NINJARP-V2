--||@SuperCoolNinja.||--
RegisterServerEvent('vMenuIdentity:ShowServerMeID')
AddEventHandler('vMenuIdentity:ShowServerMeID', function()
	local player = GetPlayerIdentifiers(source)[1]
	local source = source	
	local result = MySQL.Sync.fetchAll("SELECT job, nom, prenom, age FROM users WHERE license = @license", {['@license'] = player})
	TriggerClientEvent('vMenuIdentity:ShowClientIDCard', source, result)
end)

RegisterServerEvent('vMenuIdentity:ShowServerPeopleID')
AddEventHandler('vMenuIdentity:ShowServerPeopleID', function(NearestPlayerSID)
	local player = GetPlayerIdentifiers(source)[1]
	local source = source	
	local result = MySQL.Sync.fetchAll("SELECT job, nom, prenom, age FROM users WHERE license = @license", {['@license'] = player})
	if NearestPlayerSID ~= 0 then
		TriggerClientEvent('vMenuIdentity:ShowClientIDCard', NearestPlayerSID, result)
		TriggerClientEvent('vMenuNotif:showNotification', NearestPlayerSID, "Une personne vous montre son identité.")
	else
		TriggerClientEvent('vMenuNotif:showNotification', source, "Aucune personne devant vous")
	end
end)

RegisterServerEvent("nPolice:Sfouille")
AddEventHandler('nPolice:Sfouille', function(NearestPlayerSID)
	local source = source
	items = {}
	local targetid = getPlayerID(NearestPlayerSID)
	local result = MySQL.Sync.fetchAll("SELECT quantity,libelle,item_id FROM user_inventory JOIN items ON `user_inventory`.`item_id` = `items`.`id` WHERE license = @username", { ['@username'] = targetid})
	if (result) then
		for _, v in ipairs(result) do
			items[tonumber(v.item_id)] = { ["quantity"] = v.quantity, ["libelle"] = v.libelle }
		end
	end
	TriggerClientEvent('nPolice:Cfouilleweapons', NearestPlayerSID, source)
	TriggerClientEvent('nPolice:Cfouille', source, NearestPlayerSID, items)
	TriggerClientEvent('vMenuNotif:showNotification', NearestPlayerSID, "Une personne vous fouille.")
end)


RegisterServerEvent("nPolice:sfouilleweapons")
AddEventHandler('nPolice:sfouilleweapons', function(NearestPlayerSID, weapons)
	TriggerClientEvent('vMenuNotif:showNotification', NearestPlayerSID,"Armes trouvé: " ..weapons)
end)


-----------------||CASH SYSTEM||-----------------
RegisterServerEvent('nArgent:sDonner')
AddEventHandler('nArgent:sDonner', function(toPlayer, amount)
	local warning = ""
	local source = source
	if (toPlayer ~= nil and tonumber(amount) > 0) then
		fromPlayer = tonumber(source)
		toPlayer = tonumber(toPlayer)
		amount = tonumber(amount)
		TriggerClientEvent('bank:givecash', source, toPlayer, amount)
	else
		TriggerClientEvent('nMenuNotif:player', source, "Veuillez entrer une valeur numérique !")
		return false
	end
end)

RegisterServerEvent('bank:givecash')
AddEventHandler('bank:givecash', function(toPlayer, amount)
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= tonumber(amount)) then
			user.removeMoney(amount)
			TriggerEvent('es:getPlayerFromId', toPlayer, function(recipient)
				recipient.addMoney(amount)
				TriggerClientEvent('nMenuNotif:player', source, "Vous avez donner "..amount.."~g~$ à "..toPlayer)
				TriggerClientEvent('nMenuNotif:player', toPlayer, "Vous avez reçu "..amount.."~g~$ de "..source)
			end)
		else
			if (tonumber(user.getMoney()) < tonumber(amount)) then
				TriggerClientEvent('nMenuNotif:player', source, "Pas assez d'argent!")
        		CancelEvent()
			end
		end
	end)
end)



-----------------||ANIMATION HOTAGE SYNCRHO||-----------------
RegisterServerEvent('cmg3_animations:sync')
AddEventHandler('cmg3_animations:sync', function(target, animations, attach)
	TriggerClientEvent('cmg3_animations:syncTarget', target, source, animations.target, attach)
	TriggerClientEvent('cmg3_animations:syncMe', source, animations.source)
end)

RegisterServerEvent('cmg3_animations:stop')
AddEventHandler('cmg3_animations:stop', function(targetSrc)
	TriggerClientEvent('cmg3_animations:cl_stop', targetSrc)
end)


-----------------||MEDICS||-----------------
RegisterServerEvent('nMedics:ShealHim')
AddEventHandler('nMedics:ShealHim', function(NearestPlayerSID)
	TriggerClientEvent('nMedics:CHealPlayer',NearestPlayerSID)
end)

function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end

function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end