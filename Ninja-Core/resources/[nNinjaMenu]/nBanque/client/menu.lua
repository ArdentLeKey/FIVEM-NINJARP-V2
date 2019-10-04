--||@SuperCoolNinja.||--
local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}
local id = PlayerId()
_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Bienvenue","")
_menuPool:Add(mainMenu)

function AddMainMoneySystem(menu)

		--------------||SOUS MENU||----------------
		local submenu = _menuPool:AddSubMenu(menu, "Mon Compte","")

		--------------||EVENT AUTRES||----------------
		local retirerItem = NativeUI.CreateItem("Retirer", "~h~Retirer de l'argent de votre compte bancaire.")
		local deposerItem = NativeUI.CreateItem("Deposer", "~h~Déposer de l'argent dans votre compte bancaire.")
		
		submenu.SubMenu:AddItem(retirerItem)
		submenu.SubMenu:AddItem(deposerItem)

		--------------||Selection LISTE JOBS||----------------
		submenu.SubMenu.OnItemSelect = function(menu, item)

		if item == retirerItem then
			_menuPool:CloseAllMenus(true)
			DisplayOnscreenKeyboard(true, "", "", "", "", "", "", 30)
			while UpdateOnscreenKeyboard() == 0 do
				Wait(0)
			end
			local quantityMoneyitems = tonumber(GetOnscreenKeyboardResult())
			if quantityMoneyitems <= 0 then
				return
			end
			
				TriggerServerEvent("nMenuBanque:RetirerArgent", quantityMoneyitems)
			
		elseif item == deposerItem then
			_menuPool:CloseAllMenus(true)
			DisplayOnscreenKeyboard(true, "", "", "", "", "", "", 30)
			while UpdateOnscreenKeyboard() == 0 do
				Wait(0)
			end
			local quantityMoneyBanqueitems = tonumber(GetOnscreenKeyboardResult())
			if quantityMoneyBanqueitems <= 0 then
				return
			end
			
			TriggerServerEvent("nMenuBanque:DeposerArgent", quantityMoneyBanqueitems)
		end
	end
end

AddMainMoneySystem(mainMenu)
_menuPool:MouseEdgeEnabled (false);
_menuPool:RefreshIndex()