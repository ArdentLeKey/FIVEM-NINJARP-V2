
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		
		if NetworkIsSessionStarted() then
			TriggerServerEvent('es:firstJoinProper')
			TriggerEvent('es:allowedToSpawn')
			return
		end
		
	end
end)

local loaded = false
local oldPos
local pvpEnabled = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local pos = GetEntityCoords(PlayerPedId())

		if(oldPos ~= pos)then
			TriggerServerEvent('es:updatePositions', pos.x, pos.y, pos.z)

			if(loaded)then
				SendNUIMessage({
					setmoney = true,
					money = 0
				})

				loaded = false
			end
			oldPos = pos
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if pvpEnabled then
			for i = 0,32 do
				if NetworkIsPlayerActive(i) then
					SetCanAttackFriendly(GetPlayerPed(i), true, true)
					NetworkSetFriendlyFireOption(true)
					SetPlayerWantedLevel(GetPlayerPed(i), 0, false)
					SetPlayerWantedLevelNow(GetPlayerPed(i), false)
				end
			end
		end
	end
end)

local myDecorators = {}

RegisterNetEvent("es:setPlayerDecorator")
AddEventHandler("es:setPlayerDecorator", function(key, value, doNow)
	myDecorators[key] = value
	DecorRegister(key, 3)

	if(doNow)then
		DecorSetInt(PlayerPedId(), key, value)
	end
end)

local enableNative = {}

local firstSpawn = true
AddEventHandler("playerSpawned", function()
	for k,v in pairs(myDecorators)do
		DecorSetInt(PlayerPedId(), k, v)
	end

	TriggerServerEvent('playerSpawn')
end)

RegisterNetEvent('es:setMoneyIcon')
AddEventHandler('es:setMoneyIcon', function(i)
	SendNUIMessage({
		seticon = true,
		icon = i
	})
end)

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney', function(e)
	SendNUIMessage({
		setmoney = true,
		money = e
	})
end)

RegisterNetEvent('es:displayMoney')
AddEventHandler('es:displayMoney', function(a)
	enableNative[1] = true

    SetMultiplayerHudCash(a, 0)
    StatSetInt(GetHashKey("MP0_WALLET_BALANCE"), a)
end)

RegisterNetEvent('es:displayBank')
AddEventHandler('es:displayBank', function(a)
	enableNative[2] = true

	SetMultiplayerBankCash()
	SetPlayerCashChange(0, 1)
	Citizen.InvokeNative(0x170F541E1CADD1DE, true)
	SetPlayerCashChange(0, a)
end)

RegisterNetEvent("es:addedMoney")
AddEventHandler("es:addedMoney", function(m, native, current)

	if not native then
		SendNUIMessage({
			addcash = true,
			money = m
		})
	else
		SetMultiplayerHudCash(current, 0)
		StatSetInt(GetHashKey("MP0_WALLET_BALANCE"), current)
	end

end)

RegisterNetEvent("es:removedMoney")
AddEventHandler("es:removedMoney", function(m, native, current)
	if not native then
		SendNUIMessage({
			removecash = true,
			money = m
		})
	else
		SetMultiplayerHudCash(current, 0)
		StatSetInt(GetHashKey("MP0_WALLET_BALANCE"), current)
	end
end)

RegisterNetEvent('es:addedBank')
AddEventHandler('es:addedBank', function(m)
	Citizen.InvokeNative(0x170F541E1CADD1DE, true)
	SetPlayerCashChange(0, math.floor(m))
end)

RegisterNetEvent('es:removedBank')
AddEventHandler('es:removedBank', function(m)
	Citizen.InvokeNative(0x170F541E1CADD1DE, true)
	SetPlayerCashChange(0, -math.floor(m))
end)

RegisterNetEvent("es:setMoneyDisplay")
AddEventHandler("es:setMoneyDisplay", function(val)
	SendNUIMessage({
		setDisplay = true,
		display = val
	})
end)

RegisterNetEvent("es:enablePvp")
AddEventHandler("es:enablePvp", function()
	pvpEnabled = true
end)