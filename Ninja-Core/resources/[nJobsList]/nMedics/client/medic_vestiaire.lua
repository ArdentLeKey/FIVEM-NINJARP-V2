
--------------||Mes Variable||----------------
local isGiletOrange = false
local isOnServiceMed = false

_menuPoolMedVestiaire = NativeUI.CreatePool()
mainMedicVestiaire = NativeUI.CreateMenu("Vestiaire","")
_menuPoolMedVestiaire:Add(mainMedicVestiaire)

local function AddVestiaireMenu(menu)
    --------------||SOUS MENU||----------------
    local subService = _menuPoolMedVestiaire:AddSubMenu(menu, "~h~Service", "")
    local subTenue = _menuPoolMedVestiaire:AddSubMenu(menu, "~h~Équipement", "")

    --------------||EVENT Service||----------------
    local onServiceItem = NativeUI.CreateCheckboxItem("Prise de service", isOnServiceMed, "")
    subService.SubMenu:AddItem(onServiceItem)

    --------------||EVENT Equipement||----------------
    local giletCadetItem = NativeUI.CreateCheckboxItem("Gilet orange", isGiletOrange, "")
    subTenue.SubMenu:AddItem(giletCadetItem)

    --------------||Selection Service||----------------
    subService.SubMenu.OnCheckboxChange = function(sender, item, checked_)
        if item == onServiceItem then
            isOnServiceMed = checked_
            _menuPoolMedVestiaire:CloseAllMenus(true)
            onServiceMedics()
        end
    end

    subTenue.SubMenu.OnCheckboxChange = function(sender, item, checked_)
        
        if item == giletCadetItem then
            isGiletOrange = checked_
            if isGiletOrange == true then
                if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then --Homme
                    _menuPoolMedVestiaire:CloseAllMenus(true)
                    SetPedComponentVariation(GetPlayerPed(-1), 8, 59, 1, 0)
                elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then --Femme
                    _menuPoolMedVestiaire:CloseAllMenus(true)
                    SetPedComponentVariation(GetPlayerPed(-1), 8, 36, 1, 0)
                end
            else
                _menuPoolMedVestiaire:CloseAllMenus(true)
                SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)
            end
        end
    end
end

---------------------||Thread||---------------------
Citizen.CreateThread(function ()
    while true do
      Wait(0)
      _menuPoolMedVestiaire:ProcessMenus()
      local coords = GetEntityCoords(GetPlayerPed(-1))
    
        for k,v in pairs(nConfig.Vestiaire) do
            if Myjob == "Ambulancier" then
                DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z -1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
                if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < nConfig.nDistancePlayer) then
                    if GetLastInputMethod(0) then
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_TALK~ pour accéder au ~b~Vestiaire")
                    else
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour accéder au ~b~Vestiaire")
                    end
                    
                    if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
                        TriggerServerEvent('nMedics:Check')
                        mainMedicVestiaire:Visible(not mainMedicVestiaire:Visible())
                    end
                end
            end
        end
    end
end)

AddVestiaireMenu(mainMedicVestiaire)
_menuPoolMedVestiaire:MouseEdgeEnabled (false);
_menuPoolMedVestiaire:RefreshIndex()