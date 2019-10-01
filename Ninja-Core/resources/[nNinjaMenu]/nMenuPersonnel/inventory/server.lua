
-----------||Inventaire||-----------
RegisterServerEvent("item:getItems")
RegisterServerEvent("item:updateQuantity")
RegisterServerEvent("item:setItem")
RegisterServerEvent("item:reset")
RegisterServerEvent("item:sell")
RegisterServerEvent("player:giveItem")

local items = {}

AddEventHandler("item:getItems", function()
	items = {}
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM user_inventory JOIN items ON `user_inventory`.`item_id` = `items`.`id` WHERE license=@username", {['@username'] = player})
	if (result) then
		for k,v in ipairs(result) do
			t = { ["quantity"] = v.quantity, ["libelle"] = v.libelle }
			items[v.item_id] = t
		end
	end
	TriggerClientEvent("gui:getItems", source, items)
end)

AddEventHandler("item:setItem", function(item, quantity)
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll("SELECT * FROM user_inventory WHERE license = @username AND item_id = @item", {['@username'] = player, ['@item'] = item}, function(result)
		if(result[1] ~= nil) then
			MySQL.Async.execute("UPDATE user_inventory SET `quantity` = @qty WHERE `license` = @username AND `item_id` = @item", { ['@username'] = player, ['@item'] = item, ['@qty'] = quantity})
		else
			MySQL.Async.execute("INSERT INTO user_inventory (`license`, `item_id`, `quantity`) VALUES (@player, @item, @qty)", { ['@player'] = player, ['@item'] = item, ['@qty'] = quantity })
		end
	end)
end)


AddEventHandler("item:updateQuantity", function(qty, id)
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
	MySQL.Sync.execute("UPDATE user_inventory SET quantity=@qty WHERE license=@username AND item_id=@id", {['@username'] = player, ['@qty'] = tonumber(qty), ['@id'] = tonumber(id)})
end)


AddEventHandler("item:reset", function()
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
	MySQL.Sync.execute("UPDATE user_inventory SET quantity=@qty WHERE license=@username", {['@username'] = player, ['@qty'] = 0})
end)


AddEventHandler("item:sell", function(id, qty, price)
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
	MySQL.Sync.execute("UPDATE user_inventory SET quantity=@qty WHERE license=@username AND item_id=@id", {['@username'] = player, ['@qty'] = tonumber(qty), ['@id'] = tonumber(id)})
	player.addMoney(tonumber(price))
end)


AddEventHandler("player:swapMoney", function(amount, target)
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
	if player.money - amount >= 0 then
		player.removeMoney(amount)
		TriggerEvent('es:getPlayerFromId', target, function(player) player.addMoney(amount) end)
	end
end)

AddEventHandler("player:giveItem", function(item, name, qty, target)
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
	local total = MySQL.Sync.fetchScalar("SELECT SUM(quantity) as total FROM user_inventory WHERE license=@username", { ['@username'] = player })
	if (total + qty <= 64) then
		TriggerClientEvent("player:looseItem", source, item, qty)
		TriggerClientEvent("player:receiveItem", target, item, qty)
	end
end)