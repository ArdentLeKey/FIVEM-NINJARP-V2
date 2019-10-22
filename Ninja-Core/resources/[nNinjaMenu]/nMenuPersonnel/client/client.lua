--||@SuperCoolNinja.||--
itemMenu = nil
invItem = {}
_menuPool = NativeUI.CreatePool()
itemMenu = NativeUI.CreateMenu("Menu Personnel", "Inventaire")
mainMenu = NativeUI.CreateMenu("Menu Personnel","~b~MENU INTERACTION")
_menuPool:Add(mainMenu)
_menuPool:Add(itemMenu)


--------||ANIMATIONS||--------
function playAnim(dict, name)
    local ped = GetPlayerPed(-1)
    loadanimdict(dict)
    TaskPlayAnim(ped, dict, name, 8.0, 1.0, -1, 2, 0, 0, 0, 0)
end

function loadanimdict(dictname)
	if not HasAnimDictLoaded(dictname) then
		RequestAnimDict(dictname) 
		while not HasAnimDictLoaded(dictname) do 
			Citizen.Wait(1)
		end
	end
end
----------------------||FUNCTION||------------------------
function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result --Returns the result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end

function DrawAdvancedText2(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end
----------------------||MENU PRINCIPALE||------------------------
function PersonalMenu()
    AddMainMenu(mainMenu)
    _menuPool:RefreshIndex()
end
 
Citizen.CreateThread(function()
     while true do
         if IsControlJustReleased(0, 244) and not isDead then
             if mainMenu ~= nil and not mainMenu:Visible() then
                mainMenu:Visible(not mainMenu:Visible())
                PersonalMenu()
                Citizen.Wait(10)
             else 
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
             
             if not _menuPool:IsAnyMenuOpen() then
 
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