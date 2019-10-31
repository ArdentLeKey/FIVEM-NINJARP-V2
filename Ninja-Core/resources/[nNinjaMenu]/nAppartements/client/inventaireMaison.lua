--||@SuperCoolNinja.||--


---||TODO AJOUTER POSSIBILITE DE VOIR L'ARGENT DANS LE COFFRE 
---||TODO AJOUTER POSSIBILITE DE RETIRER L'ARGENT DANS LE COFFRE


---||PAS FINI ET NE SERA PAS FINI PAR MANQUE DE TEMPS||---
local money = 0

RegisterNetEvent("apart:CgetCash")
AddEventHandler("apart:CgetCash", function(aMoney)
    money = aMoney
end)

_menuPoolMaisonCoffre = NativeUI.CreatePool()
menuCoffre = NativeUI.CreateMenu("Coffre","")
_menuPoolMaisonCoffre:Add(menuCoffre)

function AddCoffreMenu(menu)
    for i=1, #nInventoryLocation do
        TriggerServerEvent("apart:SgetCash", nInventoryLocation[i].nom)

        local rMoneyItem = NativeUI.CreateItem("Retirer Argent","Argent dans le coffre : ~y~"..money .."~g~$")
        menu:AddItem(rMoneyItem)

        local dMoneyItem = NativeUI.CreateItem("Deposer Argent","Argent dans le coffre : ~y~"..money .."~g~$")
        menu:AddItem(dMoneyItem)

        menu.OnItemSelect = function(menu, item)
            if item == rMoneyItem then
                _menuPoolMaisonCoffre:CloseAllMenus(true)

                exports.nCoreStuff:nNotificationMain({
                    text = "ARGENT RETIRER",
                    type = 'basGauche',
                    nTimeNotif = 6000,
                })
            elseif item == dMoneyItem then
                _menuPoolMaisonCoffre:CloseAllMenus(true)
                deposerargent(nInventoryLocation[i].nom)
                exports.nCoreStuff:nNotificationMain({
                    text = "ARGENT DEPOSER",
                    type = 'basGauche',
                    nTimeNotif = 6000,
                })
            end
        end
    end
end

function deposerargent(apart)
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
       	Wait(0);
    end
	if (GetOnscreenKeyboardResult()) then
		local txt = GetOnscreenKeyboardResult()
		if (string.len(txt) > 0) then
			TriggerServerEvent("apart:depositcash", txt, apart)
		end
	end
end

AddCoffreMenu(menuCoffre)
_menuPoolMaisonCoffre:MouseEdgeEnabled(false);
_menuPoolMaisonCoffre:RefreshIndex()

--------------||Thread||----------------
Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        _menuPoolMaisonAchat:ProcessMenus()
        _menuPoolMaisonAction:ProcessMenus()
        _menuPoolMaisonCoffre:ProcessMenus()
		local inrange = false
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
        for k, v in ipairs(nInventoryLocation) do

            DrawMarker(0,v.x,v.y,v.z-1,0,0,0,0,0,0,2.001,2.0001,0.7001,0,155,255,200,0,0,0,0)

            if Vdist(v.x,v.y,v.z, pos.x, pos.y, pos.z) < 2 then
                if GetLastInputMethod(0) then
                    exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_TALK~ pour ~b~intéragir")
                else
                    exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~b~intéragir")
                end
                if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
                    for i=1, #nInventoryLocation do
                        Wait(1000)
                        TriggerServerEvent("apart:SgetCash", nInventoryLocation[i].nom)
                        print(money)
                        menuCoffre:Visible(not menuCoffre:Visible())
                    end
				end 
            end
		end
	end
end)