-----------||Inventaire||-----------
local items = {}
RegisterServerEvent("item:getItems")
AddEventHandler("item:getItems", function()
	items = {}
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM user_inventory JOIN items ON `user_inventory`.`item_id` = `items`.`id` WHERE license=@username", {['@username'] = player})
	if (result) then
		for k,v in ipairs(result) do
			t = { ["quantity"] = v.quantity, ["libelle"] = v.libelle, ["isUsable"] = v.isUsable, ["type"] = v.type }
			items[v.item_id] = t
		end
	end
	TriggerClientEvent("gui:getItems", source, items)
end)

RegisterServerEvent("item:setItem")
AddEventHandler("item:setItem", function(item, quantity)
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll("SELECT * FROM user_inventory WHERE license = @username AND item_id = @item", {['@username'] = player, ['@item'] = item}, function(result)
		if(result[1] ~= nil) then
			MySQL.Async.execute("UPDATE user_inventory SET `quantity` = @quantity WHERE `license` = @username AND `item_id` = @item", { ['@username'] = player, ['@item'] = item, ['@quantity'] = quantity})
		else
			MySQL.Async.execute("INSERT INTO user_inventory (`license`, `item_id`, `quantity`) VALUES (@player, @item, @quantity)", { ['@player'] = player, ['@item'] = item, ['@quantity'] = quantity })
		end
	end)
end)

RegisterServerEvent("item:reset")
AddEventHandler("item:reset", function()
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
	MySQL.Sync.execute("UPDATE user_inventory SET quantity=@quantity WHERE license=@username", {['@username'] = player, ['@quantity'] = 0})
	TriggerClientEvent("nInventaire:ClearDeadBody", source)
end)

RegisterServerEvent("item:updateQuantity")
AddEventHandler("item:updateQuantity", function(quantity, id)
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
	MySQL.Sync.execute("UPDATE user_inventory SET quantity=@quantity WHERE license=@username AND item_id=@id", {['@username'] = player, ['@quantity'] = tonumber(quantity), ['@id'] = tonumber(id)})
end)


RegisterServerEvent("item:sell")
AddEventHandler("item:sell", function(id, quantity, price)
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
	MySQL.Sync.execute("UPDATE user_inventory SET quantity=@quantity WHERE license=@username AND item_id=@id", {['@username'] = player, ['@quantity'] = tonumber(quantity), ['@id'] = tonumber(id)})
	player.addMoney(tonumber(price))
end)


RegisterServerEvent("player:giveItem")
AddEventHandler("player:giveItem", function(NearestPlayerSID, item, item_name, quantity)
    local mysource = source
    local player = getPlayerID(mysource)
    local targetid = getPlayerID(NearestPlayerSID)
    local quantity = math.floor(tonumber(quantity))
    MySQL.Async.fetchScalar("SELECT SUM(quantity) FROM user_inventory WHERE license = @username", { ['@username'] = targetid }, function(result)
        if (result + quantity < 101) then --Limit item max pour l'inventaire'
			TriggerClientEvent("player:looseItem", mysource, item, quantity)
			TriggerClientEvent("player:receiveItem", NearestPlayerSID, item, quantity)
			TriggerClientEvent('nMenuNotif:player', mysource, "Vous avez donné ~b~" .. quantity .. "~s~ ~g~" .. item_name .. "~s~ à " .. GetPlayerName(NearestPlayerSID))
			TriggerClientEvent('nMenuNotif:player', NearestPlayerSID, "Vous avez reçu ~b~" .. quantity .. "~s~ ~g~" .. item_name .. "~s~ de " .. GetPlayerName(mysource))
		else
			TriggerClientEvent('nMenuNotif:player', mysource, "Cette Personne ne peut pas transporter plus d'item.")
            TriggerClientEvent('nMenuNotif:player', NearestPlayerSID, "Vous ne pouvez pas porter plus d'item sur vous ! ~b~")
        end
    end)
end)