--||@SuperCoolNinja.||--
local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Vestiaire:", "")
_menuPool:Add(mainMenu)

--------------||Mes Variable||----------------
isCasquetteOn = false
isGiletOn = false
isGiletOrange = false
isOnServiceCops = false

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function AddMenuJobMenu(menu)
		--------------||SOUS MENU||----------------
		local subService = _menuPool:AddSubMenu(menu, "~h~Service", "")
		local subTenue = _menuPool:AddSubMenu(menu, "~h~Équipement", "")

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
				if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
					SetPedPropIndex(GetPlayerPed(-1), 0, 46, 0, 1)
				elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then
					SetPedPropIndex(GetPlayerPed(-1), 0, 45, 0, 1)
				end
			else
				if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
					SetPedPropIndex(GetPlayerPed(-1), 0, 11, 0, 1)
				elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then
					SetPedPropIndex(GetPlayerPed(-1), 0, 57, 0, 1)
				end
			end
		elseif item == giletItem then
			isGiletOn = checked_
			if isGiletOn == true then
				if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
					SetPedComponentVariation(GetPlayerPed(-1), 9, 10, 1, 2)
				elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then
					SetPedComponentVariation(GetPlayerPed(-1), 9, 9, 1, 2)
				end
			else
				SetPedComponentVariation(GetPlayerPed(-1), 9, 14, 1, 2)	
			end
		elseif item == giletCadetItem then
			isGiletOrange = checked_
			if isGiletOrange == true then
				if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
					SetPedComponentVariation(GetPlayerPed(-1), 8, 59, 1, 0)
				elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then
					SetPedComponentVariation(GetPlayerPed(-1), 8, 36, 1, 0)
				end
			else
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)
			end
		end
	end
end

AddMenuJobMenu(mainMenu)
_menuPool:MouseEdgeEnabled (false);
_menuPool:RefreshIndex()