--||@SuperCoolNinja.||--
itemMenu = nil
invItem = {}
_menuPool = NativeUI.CreatePool()
itemMenu = NativeUI.CreateMenu("Menu Personnel", "Inventaire")
mainMenu = NativeUI.CreateMenu("Menu Personnel","~b~MENU INTERACTION")
_menuPool:Add(mainMenu)
_menuPool:Add(itemMenu)

function PersonalMenu()
    --[[ 
     local ped = PlayerPedId()
     local aaabag = "move_m@hiking" --A CHANGER
     RequestAnimDict(aaabag)
     while not HasAnimDictLoaded(aaabag) do
         Citizen.Wait(100)
     end
 
     TaskPlayAnim(ped, aaabag, "idle_intro", 8.0, 8.0, -1, 50, 0, false, false, false)]]
     AddMainMenu(mainMenu)
     _menuPool:RefreshIndex()
 end
 
 Citizen.CreateThread(function()
     while true do
         if IsControlJustReleased(0, 168) or IsControlJustReleased(0, 212) and not isDead then
             if mainMenu ~= nil and not mainMenu:Visible() then
                 mainMenu:Visible(not mainMenu:Visible())
                 PersonalMenu()
                 Citizen.Wait(10)
             else 
                 isValidGlare = false
                 mainMenu:Visible(false)
             end
         end
         Citizen.Wait(0)
     end
 end)
 
 Citizen.CreateThread(function()
     while true do
         while _menuPool ~= nil and _menuPool:IsAnyMenuOpen() do
             Citizen.Wait(0)
             _menuPool:ProcessMenus()
             DisableControlAction(0, 140,true) --DESACTIVE CONTROLL B
             DisableControlAction(0, 172,true) --DESACTIVE CONTROLL HAUT
             DisableControlAction(0, 0,true) --DESACTIVE CONTROLL VIEW
             DisableControlAction(0, 24, true) -- Desative Controll Attack
             DisableControlAction(0, 2, true) -- Look Up and Down
             DisableControlAction(0, 1, true) --Look Left and Right
 
             isValidGlare = true
             if not _menuPool:IsAnyMenuOpen() then
 
                 --local ped = PlayerPedId()
                 --ClearPedTasks(ped)
                 isValidGlare = false
                 mainMenu:Clear()
                 itemMenu:Clear()
 
                 _menuPool:Clear()
                 _menuPool:Remove()

                 invItem = {}
 
                 _menuPool = NativeUI.CreatePool()

                
 
                  mainMenu = NativeUI.CreateMenu("Menu Personnel", "~b~MENU INTERACTION")
                  itemMenu = NativeUI.CreateMenu("Menu Personnel", "Inventaire")
                 _menuPool:Add(mainMenu)
                 _menuPool:Add(itemMenu)
             end
         end
         Citizen.Wait(0)
     end
 end)