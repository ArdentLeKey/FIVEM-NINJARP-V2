--||@SuperCoolNinja.||--

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Superette", " ")
_menuPool:Add(mainMenu)

RegisterNetEvent("nInventaire:CEau")
AddEventHandler("nInventaire:CEau",  function()
    TriggerEvent("player:receiveItem", 1, 1)
    exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Vendeur: ", "Merci de votre achat !", "~g~x ~b~1 ~w~Eau")
end)

RegisterNetEvent("nInventaire:CPain")
AddEventHandler("nInventaire:CPain",  function()
    TriggerEvent("player:receiveItem", 2, 1)
    exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Vendeur: ", "Merci de votre achat !", "~g~x ~b~1 ~w~Pain")
end)

function AddShopsMenu(menu)
    foodcat = _menuPool:AddSubMenu(menu, "Nourriture")

    -------------------||CATEGORIE FOOD||--------------------
	local proWater = NativeUI.CreateItem("Eau", "")
    foodcat.SubMenu:AddItem(proWater)
    proWater:RightLabel("~g~5$")

	local proPain = NativeUI.CreateItem("Pain", "")
    foodcat.SubMenu:AddItem(proPain)
    proPain:RightLabel("~g~5$")

    -------------------||CATEGORIE FOOD||--------------------
	foodcat.SubMenu.OnItemSelect = function(sender, item, index)
		if item == proWater then
            TriggerServerEvent("nInventaire:SEau")
        elseif item == proPain then
            TriggerServerEvent("nInventaire:SPain")
		end
    end
end

AddShopsMenu(mainMenu)
_menuPool:MouseEdgeEnabled (false);
_menuPool:RefreshIndex()
