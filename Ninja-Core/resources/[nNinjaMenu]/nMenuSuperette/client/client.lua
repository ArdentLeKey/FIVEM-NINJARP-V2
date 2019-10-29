--||@SuperCoolNinja.||--

_menuPool = NativeUI.CreatePool()
choiceMenu = NativeUI.CreateMenu("Valider", "Superette")
mainMenu = NativeUI.CreateMenu("Superette","")
_menuPool:Add(mainMenu)
_menuPool:Add(choiceMenu)


function SuperetteMenu()
    AddShopsMenu(mainMenu)
    _menuPool:RefreshIndex()
end
 
Citizen.CreateThread(function()
     while true do
         Citizen.Wait(0)
         for shop = 1, #Config.Locations do
            local sPed = Config.Locations[shop]["sPed"]
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), sPed["x"], sPed["y"], sPed["z"], true)

            if dist <= 2 then
                if GetLastInputMethod(0) then
                    exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_TALK~ pour ~b~intéragir ~w~ avec le ~g~vendeur")
                else
                    exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~b~intéragir ~w~ avec le ~g~vendeur")
                end
            
                if IsControlJustPressed(1,51) then 
                    if mainMenu ~= nil and not mainMenu:Visible() then
                        mainMenu:Visible(not mainMenu:Visible())
                        SuperetteMenu()
                        Citizen.Wait(10)
                     else 
                         mainMenu:Visible(false)
                     end
                end
            end
        end
    end
end)

 Citizen.CreateThread(function()
     while true do
         while _menuPool ~= nil and _menuPool:IsAnyMenuOpen() do
             Citizen.Wait(0)
             _menuPool:ProcessMenus()
             
             if not _menuPool:IsAnyMenuOpen() then
 
                mainMenu:Clear()
                choiceMenu:Clear()
                

                _menuPool:Clear()
                _menuPool:Remove()

                _menuPool = NativeUI.CreatePool()

            

            mainMenu = NativeUI.CreateMenu("Superette", "")
            choiceMenu = NativeUI.CreateMenu("Valider", "Superette")
            _menuPool:Add(mainMenu)
            _menuPool:Add(choiceMenu)
            end
        end
        Citizen.Wait(0)
    end
end)


_RequestModel = function(hash)
    if type(hash) == "string" then hash = GetHashKey(hash) end
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(0)
    end
end

DeleteCashier = function()
    for i=1, #Config.Locations do
        local sPed = Config.Locations[i]["sPed"]
        if DoesEntityExist(sPed["entity"]) then
            DeletePed(sPed["entity"])
            SetPedAsNoLongerNeeded(sPed["entity"])
        end
    end
end

Citizen.CreateThread(function()
    local defaultHash = 416176080
    for i=1, #Config.Locations do
        local sPed = Config.Locations[i]["sPed"]
        if sPed then
            sPed["hash"] = sPed["hash"] or defaultHash
            _RequestModel(sPed["hash"])
            if not DoesEntityExist(sPed["entity"]) then
                sPed["entity"] = CreatePed(4, sPed["hash"], sPed["x"], sPed["y"], sPed["z"], sPed["h"])
                SetEntityAsMissionEntity(sPed["entity"])
                SetBlockingOfNonTemporaryEvents(sPed["entity"], true)
                FreezeEntityPosition(sPed["entity"], true)
                SetEntityInvincible(sPed["entity"], true)
            end
            SetModelAsNoLongerNeeded(sPed["hash"])
        end
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        DeleteCashier()
    end
end)