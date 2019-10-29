--||@SuperCoolNinja.||--
RegisterServerEvent("nInventaire:SEau")
AddEventHandler("nInventaire:SEau", function(indexInv)
	local source = source
	local prixEau = 5
	TriggerEvent("es:getPlayerFromId", source, function(user)
		if (tonumber(user.getMoney()) >= prixEau) then
			TriggerClientEvent("nInventaire:CEau", source, indexInv)
			user.removeMoney(prixEau)
		else
			TriggerClientEvent('nMenuNotif:showNotification', source, "~r~Tu n'as pas suffisamment d'argent !")
		end
	end)
end)

RegisterServerEvent("nInventaire:SPain")
AddEventHandler("nInventaire:SPain", function(itemNombre)
	local source = source
	local prixPain = 5
	TriggerEvent("es:getPlayerFromId", source, function(user)
		if (tonumber(user.getMoney()) >= prixPain) then
			TriggerClientEvent("nInventaire:CPain", source, itemNombre)
			user.removeMoney(prixPain)
		else
			TriggerClientEvent('nMenuNotif:showNotification', source, "~r~Tu n'as pas suffisamment d'argent !")
		end
	end)
end)

RegisterServerEvent("nInventaire:SPhone")
AddEventHandler("nInventaire:SPhone", function(indexInv)
	local source = source
	local prixPhone = 5
	TriggerEvent("es:getPlayerFromId", source, function(user)
		if (tonumber(user.getMoney()) >= prixPhone) then
			TriggerClientEvent("nInventaire:CPhone", source, indexInv)
			user.removeMoney(prixPhone)
		else
			TriggerClientEvent('nMenuNotif:showNotification', source, "~r~Tu n'as pas suffisamment d'argent !")
		end
	end)
end)