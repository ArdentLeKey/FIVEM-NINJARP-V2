_menuPoolArmurerie = NativeUI.CreatePool()
mainPoliceArmurerie = NativeUI.CreateMenu("Armurerie Police","")
_menuPoolArmurerie:Add(mainPoliceArmurerie)

local function AddPoliceArmes(pWep)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(pWep), 2000, false)
    PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    for i=1, #Config.Locations do
        local myPeds = Config.Locations[i]["myPedsLocation"]
        exports.nCoreStuff:Ninja_Core_StartAnim(myPeds["entity"], "anim@mp_player_intupperthumbs_up", "enter")
        exports.nCoreStuff:Ninja_Core_PedsText("~r~Armurerie Police ~w~ ~h~: Et voila chef !", 7000)
    end
end

local __AddMenuArmurerie = function(menu)
    local pArmesSubMenu = _menuPoolArmurerie:AddSubMenu(menu,"~b~Armurerie Police","~w~Liste des armes")

    for _, pWep in pairs(nConfig.Armes) do
        local armeItems = NativeUI.CreateItem(pWep.Label, "")
        pArmesSubMenu.SubMenu:AddItem(armeItems)

        pArmesSubMenu.SubMenu.OnItemSelect = function(_, _, index)
            AddPoliceArmes(nConfig.Armes[index].Hash)
        end
    end
end
---------------------||Thread||---------------------
Citizen.CreateThread(function ()
    while true do
      Wait(0)
      _menuPoolArmurerie:ProcessMenus()
      _menuPoolArmurerie:MouseEdgeEnabled (false);
      local coords = GetEntityCoords(GetPlayerPed(-1))
    
        for k,v in pairs(nConfig.Armurie) do
            if Myjob == "Police" and isInServiceCops == true then
                DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z -1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
                if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < nConfig.nDistancePlayer) then
                    if GetLastInputMethod(0) then
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_TALK~ pour accéder à ~b~L'armurerie")
                    else
                        exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour accéder à ~b~L'armurerie")
                    end
                    
                    if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
                        exports.nCoreStuff:Ninja_Core_PedsText("~r~Armurerie Police ~w~ ~h~: Hey !", 7000)
                        mainPoliceArmurerie:Visible(not mainPoliceArmurerie:Visible())
                    end
                end
            end
        end
    end
end)

__AddMenuArmurerie(mainPoliceArmurerie)
_menuPoolArmurerie:MouseEdgeEnabled (false);
_menuPoolArmurerie:RefreshIndex()