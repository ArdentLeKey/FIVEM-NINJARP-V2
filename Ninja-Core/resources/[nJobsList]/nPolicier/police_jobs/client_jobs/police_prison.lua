_menuPoolPrison = NativeUI.CreatePool()
mainPolicePrison = NativeUI.CreateMenu("Prison Police","")
_menuPoolPrison:Add(mainPolicePrison)


local function KeyboardInput(TextEntry, ExampleText, MaxStringLength)

	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end

local function AddPrisonMenu(menu)
    local prisonItem = NativeUI.CreateItem("Mettre un civil en prison", "")
    menu:AddItem(prisonItem)

    menu.OnItemSelect = function(sender, item, index)
        local pPlayerID = PlayerPedId()
        if item == prisonItem then
            player, distance = GetClosestPlayer()
            if(distance ~= -1 and distance < 3) then
                _menuPoolPrison:CloseAllMenus(true)
				TriggerServerEvent('nPolice:SPrison', GetPlayerServerId(player), KeyboardInput("Temps de prison:", "", 3))
            else
                _menuPoolPrison:CloseAllMenus(true)
                exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "Aucune personne devant vous", "")
			end
        end
    end
end

---------------------||Thread||---------------------
Citizen.CreateThread(function ()
    while true do
      Wait(0)
      _menuPoolPrison:ProcessMenus()
      _menuPoolPrison:MouseEdgeEnabled (false);
      local coords = GetEntityCoords(GetPlayerPed(-1))
    
        for k,v in pairs(nConfig.Prison) do
            if Myjob == "Police" then
                DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z -1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
                if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < nConfig.nDistancePlayer) then
                    if GetLastInputMethod(0) then
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_TALK~ pour intéragir")
                    else
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour intéragir")
                    end
                    
                    if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
                        TriggerServerEvent('vPolice:Check')
                        mainPolicePrison:Visible(not mainPolicePrison:Visible())
                    end
                end
            end
        end
    end
end)

local injail = false
local outjail = true
RegisterNetEvent('nPolice:CPrison')
AddEventHandler('nPolice:CPrison', function(time)
    local ped = GetPlayerPed(-1)
    if DoesEntityExist(ped) then
        Citizen.CreateThread(function()
            local playerOldLoc = GetEntityCoords(ped, true)
            SetEntityCoords(ped, 1677.233, 2658.618, 45.216)
            injail = true
            outjail = false
            while time > 0 and not outjail do
                RemoveAllPedWeapons(ped, true)
                Citizen.Wait(500)
                if time % 30 == 0 then -- Half
                    exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Prison: ", "plus que :" ..time .." restante avant votre libération.", "")
                end
                local p = GetEntityCoords(ped, true)
                local d = Vdist(1677.233, 2658.618, 45.216, p['x'], p['y'], p['z'])
                if d > 90 then
                    SetEntityCoords(ped, 1677.233, 2658.618, 45.216)
                    if d > 100 then
                        time = time + 30
                        if time > 1000 then
                            time = 1000
                        end
                        exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Prison: ", "plus que :" ..time .." Votre peine d’emprisonnement a été prolongée pour une tentative d’évasion.", "")
                    end
                end
                time = time - 0.5
            end
            exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Prison: ", "Vous êtes libre.", "")
            SetEntityCoords(ped, 1855.807, 2601.949, 45.323)
            injail = false
            isCuffed = false
        end)
    end
end)

AddPrisonMenu(mainPolicePrison)
_menuPoolPrison:MouseEdgeEnabled (false);
_menuPoolPrison:RefreshIndex()

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	return closestPlayer, closestDistance
end

function GetPlayers()
    local players = {}

    for i = 1, 32 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end