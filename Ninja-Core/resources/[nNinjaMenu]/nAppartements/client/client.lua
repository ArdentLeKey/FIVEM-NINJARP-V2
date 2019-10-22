------------||EVENT||-------------
local appart_license = ""
RegisterNetEvent("apart:isBuy")
AddEventHandler("apart:isBuy", function(license)
  isBuy = 1
  menuSonnerMaison:Visible(true)
  appart_license = license
end)
 
RegisterNetEvent("apart:isNotBuy")
AddEventHandler("apart:isNotBuy", function()
  isBuy = 0
  menuAchatMaison:Visible(true)
end)

RegisterNetEvent("apart:isMine")
AddEventHandler("apart:isMine", function(license)
  isBuy = 2
  menuActionMaison:Visible(true)
  appart_license = license
end)

RegisterNetEvent("apart:CanEnterDring")
AddEventHandler("apart:CanEnterDring", function()
	MyHome()
end)

------------||Function||-------------
function Acheter()
	TriggerServerEvent("apart:buyAppart", nLocation[mmenunumber].nom, nLocation[mmenunumber].price)
end

function MyHome(i)
    for i=1, #nLocation do
		if i == mmenunumber then
			DoScreenFadeOut(1000)
			while IsScreenFadingOut() do Citizen.Wait(0) end
			NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
			Wait(1000)
			SetEntityCoords(GetPlayerPed(-1), nLocation[mmenunumber].xo,nLocation[mmenunumber].yo,nLocation[mmenunumber].zo)
			SetEntityHeading(GetPlayerPed(-1), nLocation[mmenunumber].ho)
			NetworkFadeInEntity(GetPlayerPed(-1), 0)
			Wait(1000)
			mmenunumber = i
			SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
			DoScreenFadeIn(1000)
			while IsScreenFadingIn() do Citizen.Wait(0) end
		end
    end
end

function Vendre()
	TriggerServerEvent("apart:sellAppart", nLocation[mmenunumber].nom, nLocation[mmenunumber].price)
end

function Sonner()
	TriggerServerEvent("apart:getPlayerisInside", appart_license, nLocation[mmenunumber].nom)
end
--------------||MENU Achat Maison||----------------

_menuPoolMaisonAchat = NativeUI.CreatePool()
menuAchatMaison = NativeUI.CreateMenu("Achat de maison","")
_menuPoolMaisonAchat:Add(menuAchatMaison)

function AddBuyMaisonMenu(menu)
    local submenu = _menuPoolMaisonAchat:AddSubMenu(menu, "Appartement","")

    local buyItem = NativeUI.CreateItem("Acheter l'appartement", "")
    submenu.SubMenu:AddItem(buyItem)

    submenu.SubMenu.OnItemSelect = function(menu, item)

        if item == buyItem then
            _menuPoolMaisonAchat:CloseAllMenus(true)
            Acheter()
        end
    end    
end

AddBuyMaisonMenu(menuAchatMaison)
_menuPoolMaisonAchat:MouseEdgeEnabled (false);
_menuPoolMaisonAchat:RefreshIndex()

--------------||MENU Action Maison||----------------

_menuPoolMaisonAction = NativeUI.CreatePool()
menuActionMaison = NativeUI.CreateMenu("Ma maison","")
_menuPoolMaisonAction:Add(menuActionMaison)

function AddActionMaisonMenu(menu)
    local submenu = _menuPoolMaisonAction:AddSubMenu(menu, "Action","")

    local enterItem = NativeUI.CreateItem("Entrer dans votre maison", "")
    submenu.SubMenu:AddItem(enterItem)

    local sellItem = NativeUI.CreateItem("Revendre votre maison", "")
    submenu.SubMenu:AddItem(sellItem)

    submenu.SubMenu.OnItemSelect = function(menu, item)
        if item == enterItem then
            _menuPoolMaisonAction:CloseAllMenus(true)
            TriggerServerEvent("apart:updateIsInside")
            MyHome()
        elseif item == sellItem then
            _menuPoolMaisonAction:CloseAllMenus(true)
            Vendre()
        end
    end
end

AddActionMaisonMenu(menuActionMaison)
_menuPoolMaisonAction:MouseEdgeEnabled(false);
_menuPoolMaisonAction:RefreshIndex()
--------------||MENU Sonner Maison||----------------

_menuPoolMaisonSonner = NativeUI.CreatePool()
menuSonnerMaison = NativeUI.CreateMenu("Appartement","")
_menuPoolMaisonSonner:Add(menuSonnerMaison)


function AddSonnerMaisonMenu(menu)
    local submenu = _menuPoolMaisonSonner:AddSubMenu(menu, "Appartement","")

    local sonnerItem = NativeUI.CreateItem("Sonner", "")
    submenu.SubMenu:AddItem(sonnerItem)

    submenu.SubMenu.OnItemSelect = function(menu, item)
        if item == sonnerItem then
            _menuPoolMaisonSonner:CloseAllMenus(true)
            Sonner()
        end
    end
end

AddSonnerMaisonMenu(menuSonnerMaison)
_menuPoolMaisonSonner:MouseEdgeEnabled(false);
_menuPoolMaisonSonner:RefreshIndex()

--------------||Thread||----------------
Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        _menuPoolMaisonAchat:ProcessMenus()
        _menuPoolMaisonAction:ProcessMenus()
        _menuPoolMaisonSonner:ProcessMenus()
		local inrange = false
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
        for k, v in ipairs(nLocation) do

            DrawMarker(0,v.xe,v.ye,v.ze-1,0,0,0,0,0,0,2.001,2.0001,0.7001,0,155,255,200,0,0,0,0)
            DrawMarker(0,v.xo,v.yo,v.zo-1,0,0,0,0,0,0,2.001,2.0001,0.7001,0,155,255,200,0,0,0,0)
           
            if Vdist(v.xe,v.ye,v.ze, pos.x, pos.y, pos.z) < 2 then
                if GetLastInputMethod(0) then
                    mmenunumber = k
                    exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_TALK~ pour ~b~intéragir")
                else
                    mmenunumber = k
                    exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~b~intéragir")
                end
                if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
                    TriggerServerEvent("apart:getAppart", nLocation[k].nom)
				end
            end
            if Vdist(v.xo,v.yo,v.zo, pos.x, pos.y, pos.z) < 2 then
                if GetLastInputMethod(0) then
                    exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_TALK~ pour ~b~sortir")
                else
                    exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~b~sortir")
                end
                if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
                    TriggerServerEvent("apart:updateIsInside")
                    DoScreenFadeOut(500)
					while IsScreenFadingOut() do Citizen.Wait(0) end
					NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
					Wait(500)
					SetEntityCoords(GetPlayerPed(-1), nLocation[k].xe,nLocation[k].ye,nLocation[k].ze)
					SetEntityHeading(GetPlayerPed(-1), nLocation[k].ho)
					NetworkFadeInEntity(GetPlayerPed(-1), 0)
					Wait(500)
					SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
					DoScreenFadeIn(500)
					while IsScreenFadingIn() do Citizen.Wait(0) end
				end 
            end
		end
	end
end)