ITEMS = {}
local playerdead = false -- Don't touch this !
local maxCapacity = 64 -- Max capacity
local OpenKey = 289 -- F2


local WaterID = 1 -- Set this in your Data Base
local FoodID = 2 -- Set this in your Data Base


RegisterNetEvent("item:reset")
RegisterNetEvent("item:getItems")
RegisterNetEvent("item:updateQuantity")
RegisterNetEvent("item:sell")
RegisterNetEvent("gui:getItems")
RegisterNetEvent("player:receiveItem")
RegisterNetEvent("player:looseItem")
RegisterNetEvent("player:sellItem")



AddEventHandler("playerSpawned", function()
    TriggerServerEvent("item:getItems")
    playerdead = false
end)



AddEventHandler("gui:getItems", function(THEITEMS)
    ITEMS = {}
    ITEMS = THEITEMS
end)



AddEventHandler("player:receiveItem", function(item, quantity)
    if (getPods() + quantity <= maxCapacity) then
        item = tonumber(item)
        if (ITEMS[item] == nil) then
            new(item, quantity)
        else
            add(item, quantity)
        end
    end
end)



AddEventHandler("player:looseItem", function(item, quantity)
    item = tonumber(item)
    if (ITEMS[item].quantity >= quantity) then
        delete(item, quantity)
    end
end)



AddEventHandler("player:sellItem", function(item, price)
    item = tonumber(item)
    if (ITEMS[item].quantity > 0) then
        sell(item, price)
    end
end)



function sell(itemId, price)
    local item = ITEMS[itemId]
    item.quantity = item.quantity - 1
    TriggerServerEvent("item:sell", itemId, item.quantity, price)
end

function delete(itemId, qty)
    local item = ITEMS[itemId]
    item.quantity = item.quantity - qty
    TriggerServerEvent("item:updateQuantity", item.quantity, itemId)
end

function add(itemId, qty)
    local item = ITEMS[itemId]
    item.quantity = item.quantity + qty
    TriggerServerEvent("item:updateQuantity", item.quantity, itemId)
end


function giveMoney()
    local playerNear = getNearPlayer()
    if playerNear then
        DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 30)
        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0);
            Wait(0);
        end
        if (GetOnscreenKeyboardResult()) then
            local res = tonumber(GetOnscreenKeyboardResult())
            if res > 0 then
                TriggerServerEvent("player:swapMoney", res, GetPlayerServerId(playerNear))
            end
        end
    end
end

function new(item, quantity)
    RegisterNetEvent("item:setItem")
    TriggerServerEvent("item:setItem", item, quantity)
    TriggerServerEvent("item:getItems")
end



function getQuantity(itemId)
    return ITEMS[tonumber(itemId)].quantity
end



AddEventHandler("player:getQuantity", function(item, call)
     call({count=getQuantity(item)})
end)



function getPods()
    local pods = 0
    for _, v in pairs(ITEMS) do
        pods = pods + v.quantity
    end
    return pods
end



function notFull()
    if (getPods() < maxCapacity) then return true end
end



exports("Main", function()
    Menu.SetupMenu("main", "Menu Inventaire")
    Menu.Switch(nil, "main")

	Menu.addOption("main", function() if (Menu.Option("Inventaire")) then InventoryMenu("Inventaire", nil) end end)
end)


function InventoryMenu()
	Menu.SetupMenu("inventorymenu", "Menu Inventaire")
    Menu.Switch("main", "inventorymenu")

	for ind,value in pairs(ITEMS) do
	    SelectedItem = 0
		Menu.addOption("inventorymenu", function()
			if (Menu.Inventory(tostring(value.libelle), tostring(value.quantity))) then
				if (value.quantity > 0) then
					ItemMenu("Item Menu", nil)
					SelectedItem = ind
				end
			end
		end)
	end
end



function ItemMenu(itemId)
    Menu.SetupMenu("itemsmenu", GetPlayerName(PlayerId()))
    Menu.Switch("inventorymenu", "itemsmenu")

	Menu.addOption("itemsmenu", function() if (Menu.Option("Utiliser")) then use(SelectedItem, 1) InventoryMenu("Inventaire", nil) end end)
	Menu.addOption("itemsmenu", function() if (Menu.Option("Jeter")) then
		DisplayOnscreenKeyboard(true, "", "", "", "", "", "", 30)
		while UpdateOnscreenKeyboard() == 0 do
		    Wait(0)
		end
		local quantityitems = GetOnscreenKeyboardResult()
		delete(SelectedItem, tonumber(quantityitems))
		InventoryMenu("Inventaire", nil)
	end end)
end



function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end



function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, true)
end



function give(item)
    local player = getNearPlayer()
    if (player ~= nil) then
        DisplayOnscreenKeyboard(1, "Quantité", "", "", "", "", "", 2)
        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0);
            Wait(0);
        end
        if (GetOnscreenKeyboardResult()) then
            local res = tonumber(GetOnscreenKeyboardResult())
            if (ITEMS[item].quantity - res >= 0) then
                TriggerServerEvent("player:giveItem", item, ITEMS[item].libelle, res, GetPlayerServerId(player))
            end
        end
    end
end



function use(itemId, qty)
    if itemId == FoodID then
	
        TriggerEvent("food:vdrink", 5) -- Change this with your drink script
		
    elseif itemId == WaterID then
	
        TriggerEvent("food:veat", 2) -- Change this with your food script
		
    end
    TriggerEvent('player:looseItem', itemId, qty)
end



function PlayerIsDead()
    if playerdead then
        return
    end
    TriggerServerEvent("item:reset")
end

function getPlayers()
    local playerList = {}
    for i = 0, 32 do
        local player = GetPlayerFromServerId(i)
        if NetworkIsPlayerActive(player) then
            table.insert(playerList, player)
        end
    end
    return playerList
end



function getNearPlayer()
    local players = getPlayers()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local pos2
    local distance
    local minDistance = 3
    local playerNear
    for _, player in pairs(players) do
        pos2 = GetEntityCoords(GetPlayerPed(player))
        distance = GetDistanceBetweenCoords(pos["x"], pos["y"], pos["z"], pos2["x"], pos2["y"], pos2["z"], true)
        if (pos ~= pos2 and distance < minDistance) then
            playerNear = player
            minDistance = distance
        end
    end
    if (minDistance < 3) then
        return playerNear
    end
end



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(1, OpenKey) then
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            clothing_menu = not clothing_menu
            exports["nMenuPersonnel"]:Main()
		end
        if clothing_menu then
			DisableControlAction(1, 22, true)
			DisableControlAction(1, 0, true)
			DisableControlAction(1, 27, true)
			DisableControlAction(1, 80, true)
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(1, 20, true)
			HideHelpTextThisFrame()
            Menu.DisplayCurMenu()
        end
    end
end)


