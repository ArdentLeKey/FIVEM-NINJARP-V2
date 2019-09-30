--||@SuperCoolNinja.||--
local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Liste d'emplois:", "")
_menuPool:Add(mainMenu)

function AddMenuJobMenu(menu)

		--------------||SOUS MENU||----------------
		local submenu = _menuPool:AddSubMenu(menu, "~h~Liste des emplois", "")

		--------------||EVENT AUTRES||----------------
		local chome = NativeUI.CreateItem("Chômage", "")
		local testJob = NativeUI.CreateItem("Test", "")
		
		submenu.SubMenu:AddItem(chome)
		submenu.SubMenu:AddItem(testJob)

		--------------||Selection LISTE JOBS||----------------
		submenu.SubMenu.OnItemSelect = function(menu, item)

		if item == chome then
			TriggerServerEvent("vMenu:UpdateServerjobs", 1)
		elseif item == testJob then
			TriggerServerEvent("vMenu:UpdateServerjobs", 2)
		end
	end
end

AddMenuJobMenu(mainMenu)
_menuPool:MouseEdgeEnabled (false);
_menuPool:RefreshIndex()