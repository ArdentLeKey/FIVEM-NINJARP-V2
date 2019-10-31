 ----------------------||Inventaire||--------------------
 ITEMS = {}
 local playerdead = false -- Don't touch this !
 local maxCapacity = 101
 local WaterID = 1 -- Set this in your Data Base
 local FoodID = 2 -- Set this in your Data Base
 indexInv = 1
 RegisterNetEvent("item:reset")
 RegisterNetEvent("item:getItems")
 RegisterNetEvent("item:updateQuantity")
 RegisterNetEvent("item:sell")
 RegisterNetEvent("gui:getItems")
 RegisterNetEvent("player:sellItem")
 
 
 AddEventHandler("playerSpawned", function()
     RegisterNetEvent("item:getItems")
	 TriggerServerEvent("item:getItems")
 end)
 
 AddEventHandler("gui:getItems", function(THEITEMS)
     ITEMS = {}
     ITEMS = THEITEMS
 end)
 
 function getPods()
     local pods = 0
     for _, v in pairs(ITEMS) do
         pods = pods + v.quantity
     end
     return pods
 end
 
 function notFull()
     local pods = 0
     for _, v in pairs(ITEMS) do
         pods = pods + v.quantity
     end
     if (pods < (maxCapacity-1)) then return true end
 end
 
 
 RegisterNetEvent("player:receiveItem")
 AddEventHandler("player:receiveItem", function(item, quantity)
     if (getPods() + quantity < maxCapacity) then
         item = tonumber(item)
         if (ITEMS[item] == nil) then
             new(item, quantity)
         else
             add({ item, quantity })
         end
	 end
 end)
 
 RegisterNetEvent("player:looseItem")
 AddEventHandler("player:looseItem", function(item, quantity)
     item = tonumber(item)
     if (ITEMS[item].quantity >= quantity) then
         delete({ item, quantity })
	 end
 end)
 
 
 AddEventHandler("player:sellItem", function(item, price)
     item = tonumber(item)
     if (ITEMS[item].quantity > 0) then
         sell(item, price)
	 end
 end)
 
 RegisterNetEvent("farm:updateQuantity")
 AddEventHandler("farm:updateQuantity", function(qty, id)
     ITEMS[id].quantity = qty
 end)
 
 AddEventHandler("player:resetItem", function(item)
     item = tonumber(item)
	 delete({ item, ITEMS[item].quantity })
 end)
 
 LoadInventaire = function()
	_menuPool:CloseAllMenus(true)
	mainMenu:Clear()
	itemMenu:Clear()
	Citizen.Wait(100)
	TriggerServerEvent("item:getItems")
	Citizen.Wait(400)
	_menuPool:RefreshIndex()
 end

  
 RefreshInventoryDeadBody = function()
	_menuPool:CloseAllMenus(true)
	mainMenu:Clear()
	itemMenu:Clear()
	Citizen.Wait(100)
	TriggerServerEvent("item:getItems")
	Citizen.Wait(300)
	_menuPool:RefreshIndex()
 end
 
 function sell(itemId, price)
     local item = ITEMS[itemId]
     item.quantity = item.quantity - 1
	 TriggerServerEvent("item:sell", itemId, item.quantity, price)
	 LoadInventaire()
 end
 
 function delete(arg)
     local itemId = tonumber(arg[1])
     local qty = arg[2]
     local item = ITEMS[itemId]
     item.quantity = item.quantity - qty
     TriggerServerEvent("item:updateQuantity", item.quantity, itemId)
	 TriggerEvent("farm:updateQuantity", item.quantity, itemId)
	 LoadInventaire()
 end
 
 function add(arg)
     local itemId = tonumber(arg[1])
     local qty = arg[2]
     local item = ITEMS[itemId]
     item.quantity = item.quantity + qty
     TriggerServerEvent("item:updateQuantity", item.quantity, itemId)
	 TriggerEvent("farm:updateQuantity", item.quantity, itemId)
	 LoadInventaire()
 end
 
 function new(item, quantity)
     RegisterNetEvent("item:setItem")
     TriggerServerEvent("item:setItem", item, quantity)
	 TriggerServerEvent("item:getItems")
	 LoadInventaire()
 end
 
 function getQuantity(itemId)
     return ITEMS[tonumber(itemId)].quantity
 end
 
 AddEventHandler("player:getQuantity", function(item, call)
      call({count=getQuantity(item)})
 end)


 function use(itemId, quantity)
 
	TriggerEvent('player:looseItem', itemId, quantity)

	if ITEMS[tonumber(itemId)].type == 2 then
       -- SOON
    elseif ITEMS[tonumber(itemId)].type == 1 then
        --SOON
    end
 end
 
 function PlayerIsDead()
     if playerdead then
         return
     end
	 TriggerServerEvent("item:reset")
 end

 RegisterNetEvent("nInventaire:ClearDeadBody")
 AddEventHandler("nInventaire:ClearDeadBody", function()
	RefreshInventoryDeadBody()
end)


 __AddMenuInventaire = function(menu)
	local inventorymenu = _menuPool:AddSubMenu(menu, "Menu Inventaire", "")
	local itemNombre = {}
	
	for ind,value in pairs(ITEMS) do

		if (value.quantity > 0) then
			itemNombre = {}

			for i = 1, value.quantity, 1 do
				table.insert(itemNombre, i)
			end

			table.insert(invItem, ind)

			invItem[ind] = NativeUI.CreateListItem(value.libelle .. " " ..value.quantity, itemNombre, 1)
			inventorymenu.SubMenu:AddItem(invItem[ind])
		end
	end

	local useItem = NativeUI.CreateItem("Utiliser", '')
	itemMenu:AddItem(useItem)

	local giveItem = NativeUI.CreateItem("Donner", '')
	itemMenu:AddItem(giveItem)

	local dropItem = NativeUI.CreateItem("Jeter", '')
	dropItem:SetRightBadge(4)
	itemMenu:AddItem(dropItem)

	inventorymenu.SubMenu.OnListSelect = function(sender, item, index)
	_menuPool:CloseAllMenus(true)
	itemMenu:Visible(true)
	for ind,value in pairs(ITEMS) do
		if item == invItem[ind] then
			indexInv = item:IndexToItem(index)
				itemMenu.OnItemSelect = function(sender, item, index)
					local item_usable = ITEMS[tonumber(ind)].isUsable
					if item == useItem then
						if item_usable > 0 then
							use(ind,indexInv)
							exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Inventaire", "~h~Vous avez utilisé x"..indexInv.. " "..value.libelle, "")
							_menuPool:CloseAllMenus(true)
						else
							exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Inventaire", "", "~h~Cette objet n'est pas utilisable !")
						end
					elseif item == giveItem then
						player, distance = GetClosestPlayer()
						if(distance ~= -1 and distance < 3) then
							_menuPool:CloseAllMenus(true)
							item_name = ITEMS[tonumber(ind)].libelle
							TriggerServerEvent('player:giveItem',GetPlayerServerId(player),ind,item_name,indexInv)
						else
							exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Inventaire", "~y~ Aucune personne devant vous !", "")
						end
					elseif item == dropItem then
						_menuPool:CloseAllMenus(true)
						TriggerEvent('player:looseItem',ind,indexInv)
						exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Inventaire", "~h~Vous avez jeter ~b~x"..indexInv .." "..value.libelle, "")
					end
				end
			end
		end
	end
end