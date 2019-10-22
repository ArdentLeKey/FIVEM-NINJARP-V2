--||@SuperCoolNinja.||--
RegisterServerEvent("nInventaire:SEau")
AddEventHandler("nInventaire:SEau", function()
	local source = source
	local prixEau = 5
	TriggerEvent("es:getPlayerFromId", source, function(user)
		if (tonumber(user.getMoney()) >= prixEau) then
			TriggerClientEvent("nInventaire:CEau", source)
			user.removeMoney(prixEau)
		else
			TriggerClientEvent('nMenuNotif:showNotification', source, "~r~Tu n'as pas suffisamment d'argent !")
		end
	end)
end)

RegisterServerEvent("nInventaire:SPain")
AddEventHandler("nInventaire:SPain", function()
	local source = source
	local prixPain = 5
	TriggerEvent("es:getPlayerFromId", source, function(user)
		if (tonumber(user.getMoney()) >= prixPain) then
			TriggerClientEvent("nInventaire:CPain", source)
			user.removeMoney(prixPain)
		else
			TriggerClientEvent('nMenuNotif:showNotification', source, "~r~Tu n'as pas suffisamment d'argent !")
		end
	end)
end)