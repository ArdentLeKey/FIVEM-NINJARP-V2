_menuPoolMedGarageHeli = NativeUI.CreatePool()
mainMedGarageHeli = NativeUI.CreateMenu("Garage","")
_menuPoolMedGarageHeli:Add(mainMedGarageHeli)

local function AddMedicHeli(pVeh)
    local pVeh = GetHashKey(pVeh)

    RequestModel(pVeh)
    while not HasModelLoaded(pVeh) do
        RequestModel(pVeh)
        Citizen.Wait(0)
    end

    local veh = CreateVehicle(pVeh, 351.28, -587.669, 74.1657, 55.0, true, false)
    SetEntityAsMissionEntity(veh, true, true)
    SetVehicleNumberPlateText(veh, "MEDIC911")
    for i=1, #Config.Locations do
        local myPeds = Config.Locations[i]["myPedsLocation"]
        exports.nCoreStuff:Ninja_Core_StartAnim(myPeds["entity"], "gestures@f@standing@casual", "gesture_hello")
        exports.nCoreStuff:Ninja_Core_PedsText("~b~Garage Ambulancier ~w~: ~h~Votre hélico de service vous attend juste derrière vous !", 7000)  
    end
end

local function RemoveMedVeh(entity)
	SetEntityAsMissionEntity(entity,true,true)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end

local function AddMenuGarage(menu)
    for _, pVeh in pairs(nConfig.VehiclesHelico) do
        local vehicleItem = NativeUI.CreateItem(pVeh.Label, "")
        menu:AddItem(vehicleItem)

        menu.OnItemSelect = function(_, _, index)
            _menuPoolMedGarageHeli:CloseAllMenus(true)
            AddMedicHeli(nConfig.VehiclesHelico[index].Hash)
        end
    end
end

local rPoliceVeh = {
    {x = 351.28, y = -587.669, z = 74.1657},
}

---------------------||Thread||---------------------
Citizen.CreateThread(function ()
    while true do
      Wait(0)
      _menuPoolMedGarageHeli:ProcessMenus()
      _menuPoolMedGarageHeli:MouseEdgeEnabled (false);
      local coords = GetEntityCoords(GetPlayerPed(-1))
    
      for k,v in pairs(nConfig.GarageHeli) do
            if Myjob == "Ambulancier" and isInServiceMedic == true then
                DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z -1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
                if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < nConfig.nDistancePlayer) then
                    if GetLastInputMethod(0) then
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_TALK~ pour accéder sortir votre ~b~hélico Ambulancier")
                    else
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour sortir votre ~b~hélico Ambulancier")
                    end
                    
                    if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
                        for i=1, #Config.Locations do
                            local myPeds = Config.Locations[i]["myPedsLocation"]
                            exports.nCoreStuff:Ninja_Core_StartAnim(myPeds["entity"], "gestures@f@standing@casual", "gesture_hand_right")
                            exports.nCoreStuff:Ninja_Core_PedsText("~b~Garage Ambulancier ~w~: ~h~Que puis-je faire pour vous ?", 7000)
                        end
                        mainMedGarageHeli:Visible(not mainMedGarageHeli:Visible())
                    end
                end
            end
        end

        for k,v in pairs(nConfig.RemoveHeliPos) do
            local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false )
            if Myjob == "Ambulancier" and isInServiceMedic == true then
                DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z -1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
                if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < nConfig.nDistancePlayer) then
                    if GetLastInputMethod(0) then
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_TALK~ pour ~r~ranger ~w~ votre hélico de service")
                    else
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~r~ranger ~w~votre hélico de service")
                    end
                    
                    if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
                        if ( GetPedInVehicleSeat( vehicle, -1 ) == GetPlayerPed(-1) ) then 
                            SetEntityAsMissionEntity( vehicle, true, true )
                            RemoveMedVeh(vehicle)
                        end 
                    end
                end
            end
        end
    end
end)

AddMenuGarage(mainMedGarageHeli)
_menuPoolMedGarageHeli:MouseEdgeEnabled (false);
_menuPoolMedGarageHeli:RefreshIndex()