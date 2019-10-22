
--------------||Mes Variable||----------------
local isCasquetteOn = false
local isGiletOn = false
local isGiletOrange = false
local isOnServiceCops = false

_menuPoolVestiaire = NativeUI.CreatePool()
mainPoliceVestiaire = NativeUI.CreateMenu("Vestiaire Police","")
_menuPoolVestiaire:Add(mainPoliceVestiaire)

local function AddVestiaireMenu(menu)
    --------------||SOUS MENU||----------------
    local subService = _menuPoolVestiaire:AddSubMenu(menu, "~h~Service", "")
    local subTenue = _menuPoolVestiaire:AddSubMenu(menu, "~h~Équipement", "")

    --------------||EVENT Service||----------------
    local onServiceItem = NativeUI.CreateCheckboxItem("Prise de service", isOnServiceCops, "")
    subService.SubMenu:AddItem(onServiceItem)

    --------------||EVENT Equipement||----------------
    local casquetItem = NativeUI.CreateCheckboxItem("Casquette police", isCasquetteOn, "")
    local giletItem = NativeUI.CreateCheckboxItem("Gilet par balle", isGiletOn, "")
    local giletCadetItem = NativeUI.CreateCheckboxItem("Gilet orange", isGiletOrange, "")
    subTenue.SubMenu:AddItem(casquetItem)
    subTenue.SubMenu:AddItem(giletItem)
    subTenue.SubMenu:AddItem(giletCadetItem)

    --------------||Selection Service||----------------
    subService.SubMenu.OnCheckboxChange = function(sender, item, checked_)
        if item == onServiceItem then
            isOnServiceCops = checked_
            onServicePolice()
        end
    end

    subTenue.SubMenu.OnCheckboxChange = function(sender, item, checked_)
        if item == casquetItem then
            isCasquetteOn = checked_
            if isCasquetteOn == true then
                if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then --Homme
                    SetPedPropIndex(GetPlayerPed(-1), 0, 46, 0, 1)
                elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then --Femme
                    SetPedPropIndex(GetPlayerPed(-1), 0, 45, 0, 1)
                end
            else
                if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then --Homme
                    SetPedPropIndex(GetPlayerPed(-1), 0, 11, 0, 1)
                elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then --Femme
                    SetPedPropIndex(GetPlayerPed(-1), 0, 57, 0, 1)
                end
            end
        elseif item == giletItem then
            isGiletOn = checked_
            if isGiletOn == true then
                if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then --Homme
                    SetPedComponentVariation(GetPlayerPed(-1), 9, 10, 1, 2)
                elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then --Femme
                    SetPedComponentVariation(GetPlayerPed(-1), 9, 9, 1, 2)
                end
            else
                SetPedComponentVariation(GetPlayerPed(-1), 9, 14, 1, 2)	
            end
        elseif item == giletCadetItem then
            isGiletOrange = checked_
            if isGiletOrange == true then
                if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then --Homme
                    SetPedComponentVariation(GetPlayerPed(-1), 8, 59, 1, 0)
                elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then --Femme
                    SetPedComponentVariation(GetPlayerPed(-1), 8, 36, 1, 0)
                end
            else
                SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)
            end
        end
    end
end

---------------------||Thread||---------------------
Citizen.CreateThread(function ()
    while true do
      Wait(0)
      _menuPoolVestiaire:ProcessMenus()
      _menuPoolVestiaire:MouseEdgeEnabled (false);
      local coords = GetEntityCoords(GetPlayerPed(-1))
    
        for k,v in pairs(nConfig.Vestiaire) do
            if Myjob == "Police" then
                DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z -1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
                if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < nConfig.nDistancePlayer) then
                    if GetLastInputMethod(0) then
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_TALK~ pour accéder au ~b~Vestiaire")
                    else
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour accéder au ~b~Vestiaire")
                    end
                    
                    if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
                        TriggerServerEvent('vPolice:Check')
                        mainPoliceVestiaire:Visible(not mainPoliceVestiaire:Visible())
                    end
                end
            end
        end
    end
end)

AddVestiaireMenu(mainPoliceVestiaire)
_menuPoolVestiaire:MouseEdgeEnabled (false);
_menuPoolVestiaire:RefreshIndex()