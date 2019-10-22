_menuPoolMedGarage = NativeUI.CreatePool()
mainMedGarage = NativeUI.CreateMenu("Garage","")
_menuPoolMedGarage:Add(mainMedGarage)

local function AddMedicVeh(pVeh)
    local pVeh = GetHashKey(pVeh)

    RequestModel(pVeh)
    while not HasModelLoaded(pVeh) do
        RequestModel(pVeh)
        Citizen.Wait(0)
    end

    local veh = CreateVehicle(pVeh, 328.046, -548.879, 28.7435, -90.0, true, false)
    SetEntityAsMissionEntity(veh, true, true)
    SetVehicleNumberPlateText(veh, "MEDIC911")
    for i=1, #Config.Locations do
        local myPeds = Config.Locations[i]["myPedsLocation"]
        exports.nCoreStuff:Ninja_Core_StartAnim(myPeds["entity"], "gestures@f@standing@casual", "gesture_hello")
        exports.nCoreStuff:Ninja_Core_PedsText("~b~Garage Ambulancier ~w~: ~h~Votre véhicule de service vous attend juste derrière vous !", 7000)  
    end
end

local function RemoveMedVeh(entity)
	SetEntityAsMissionEntity(entity,true,true)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end

local function AddMenuGarage(menu)
    local pVehSubMenu = _menuPoolMedGarage:AddSubMenu(menu,"~b~Vehicules","~w~Liste des vehicules")

    for _, pVeh in pairs(nConfig.Vehicles) do
        local vehicleItem = NativeUI.CreateItem(pVeh.Label, "")
        pVehSubMenu.SubMenu:AddItem(vehicleItem)

        pVehSubMenu.SubMenu.OnItemSelect = function(_, _, index)
            _menuPoolMedGarage:CloseAllMenus(true)
            AddMedicVeh(nConfig.Vehicles[index].Hash)
        end
    end
end

local rPoliceVeh = {
	{x = -55.7898, y = 6525.02, z = 31.4908},
}

---------------------||Thread||---------------------
Citizen.CreateThread(function ()
    while true do
      Wait(0)
      _menuPoolMedGarage:ProcessMenus()
      _menuPoolMedGarage:MouseEdgeEnabled (false);
      local coords = GetEntityCoords(GetPlayerPed(-1))
    
      for k,v in pairs(nConfig.Garage) do
            if Myjob == "Ambulancier" and isInServiceMedic == true then
                DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z -1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
                if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < nConfig.nDistancePlayer) then
                    if GetLastInputMethod(0) then
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_TALK~ pour accéder au ~b~Garage Ambulancier")
                    else
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour accéder au ~b~Garage Ambulancier")
                    end
                    
                    if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
                        for i=1, #Config.Locations do
                            local myPeds = Config.Locations[i]["myPedsLocation"]
                            exports.nCoreStuff:Ninja_Core_StartAnim(myPeds["entity"], "gestures@f@standing@casual", "gesture_hand_right")
                            exports.nCoreStuff:Ninja_Core_PedsText("~b~Garage Ambulancier ~w~: ~h~Que puis-je faire pour vous ?", 7000)
                        end
                        mainMedGarage:Visible(not mainMedGarage:Visible())
                    end
                end
            end
        end

        for k,v in pairs(nConfig.RemoveCarPos) do
            local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false )
            if Myjob == "Ambulancier" and isInServiceMedic == true then
                DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z -1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
                if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < nConfig.nDistancePlayer) then
                    if GetLastInputMethod(0) then
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_TALK~ pour ~r~ranger ~w~ votre véhicule de service")
                    else
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~r~ranger ~w~votre véhicule de service")
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

AddMenuGarage(mainMedGarage)
_menuPoolMedGarage:MouseEdgeEnabled (false);
_menuPoolMedGarage:RefreshIndex()