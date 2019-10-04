--||@SuperCoolNinja.||--

RegisterServerEvent("nMenuBanque:RetirerArgent")
AddEventHandler("nMenuBanque:RetirerArgent", function(amount)
	local source = source	
	local license = GetPlayerIdentifiers(source)[1]
	local rounded = tonumber(amount)

	TriggerEvent('es:getPlayerFromId', source, function(user)
		if(string.len(rounded) >= 9) then
			--TODO MESSAGE NEGATIFE
			TriggerClientEvent('nMenuNotif:showNotification', source, "Cette somme est trop grande !")
		else
			if(tonumber(rounded) <= tonumber(user.getBank())) then
				user.removeBank(rounded)
				user.addMoney(rounded)
				--local new_balance = user.getBank() TODO
				TriggerClientEvent('nMenuNotif:showNotification', source, "Vous avez retirer : ~g~$:" ..rounded)
			else
				TriggerClientEvent('nMenuNotif:showNotification', source, "~r~Vous n'avez pas cette somme d'argent sur vous !")
			end
		end
	end)
end)

RegisterServerEvent("nMenuBanque:DeposerArgent")
AddEventHandler("nMenuBanque:DeposerArgent", function(amount)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	local rounded = tonumber(amount)

	TriggerEvent('es:getPlayerFromId', source, function(user)
		if(string.len(rounded) >= 9) then
			--TODO MESSAGE NEGATIFE
			TriggerClientEvent('nMenuNotif:showNotification', source, "Cette somme est trop grande !")
		else
			if(tonumber(rounded) <= tonumber(user.getMoney())) then
				user.removeMoney(rounded)
				user.addBank(rounded)
				--local new_balance = user.getBank() TODO
				TriggerClientEvent('nMenuNotif:showNotification', source, "Vous avez déposer : ~g~$:" ..rounded)
			else
				TriggerClientEvent('nMenuNotif:showNotification', source, "~r~Vous n'avez pas cette somme d'argent sur vous !")
			end
		end
	end)
end)