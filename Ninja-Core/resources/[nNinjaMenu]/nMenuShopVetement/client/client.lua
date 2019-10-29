--||@SuperCoolNinja.||--
local buyVetementPos = {
    {name="Achat", x = -163.987, y = -309.924, z = 39.7333},
}


_menuPool = NativeUI.CreatePool()
choiceMenu = NativeUI.CreateMenu("Valider", "Boutique de vêtement")
mainMenu = NativeUI.CreateMenu("Boutique de vêtement","")
_menuPool:Add(mainMenu)
_menuPool:Add(choiceMenu)

function BoutiqueVetement()
    AddMainClothMenu(mainMenu)
    _menuPool:RefreshIndex()
end
 
Citizen.CreateThread(function()
     while true do
         Citizen.Wait(0)

         for k in pairs(buyVetementPos) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, buyVetementPos[k].x, buyVetementPos[k].y, buyVetementPos[k].z)

            if dist <= 3 then
                if GetLastInputMethod(0) then
                    exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_TALK~ pour ~b~intéragir")
                else
                    exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~b~intéragir")
                end
                
                if IsControlJustPressed(1,51) then 
                    if mainMenu ~= nil and not mainMenu:Visible() then
                        mainMenu:Visible(not mainMenu:Visible())
                        BoutiqueVetement()
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
				TriggerServerEvent("vCharacter:SpawnCharacter")
                mainMenu:Clear()
                choiceMenu:Clear()

                _menuPool:Clear()
                _menuPool:Remove()

                _menuPool = NativeUI.CreatePool()

            

            mainMenu = NativeUI.CreateMenu("Boutique de vêtement", "")
            choiceMenu = NativeUI.CreateMenu("Valider", "Boutique de vêtement")
            _menuPool:Add(mainMenu)
            _menuPool:Add(choiceMenu)
            end
        end
        Citizen.Wait(0)
    end
end)


RegisterNetEvent("nVetement:LoadOldVetement")
AddEventHandler("nVetement:LoadOldVetement", function()
	TriggerServerEvent("vCharacter:SpawnCharacter")
end)