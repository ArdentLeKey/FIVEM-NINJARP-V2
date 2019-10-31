--||@SuperCoolNinja.||--

----||↓↓↓↓||---- -> ID 3 -->Torso
Torso_Id = 3
Torso_Drawable = 0
Torso_Couleur = 0
Torso_Palette_Id = 2


----||↓↓↓↓||---- -> ID 4 --> Legs
Pantalon_Id = 4
Pantalon_Drawable = 0
Pantalon_Couleur = 0
Pantalon_Palette_Id = 2


----||↓↓↓↓||---- -> ID 6 --> Choose
Chaussure_Id = 6
Chaussure_Drawable = 0
Chaussure_Couleur = 0
Chaussure_Palette_Id = 2


----||↓↓↓↓||---- -> ID 8 -->Undershirt
Maillot_Id = 8
Maillot_Drawable = 0
Maillot_Couleur = 0
Maillot_Palette_Id = 2

----||↓↓↓↓||---- -> ID 11 -->Torso2
Haut_Id = 11
Haut_Drawable = 0
Haut_Couleur = 0
Haut_Palette_Id = 2

function AddMainClothMenu(menu)
	--------------||SOUS MENU||----------------

	if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then
		local subvetementHomme = _menuPool:AddSubMenu(menu, "T-shirts", "")
		local subPullHomme = _menuPool:AddSubMenu(menu, "Pull", "")
		local subVesteHomme = _menuPool:AddSubMenu(menu, "Veste", "")
		local subChemiseHomme = _menuPool:AddSubMenu(menu, "Chemise", "")
		local subPantalonHomme = _menuPool:AddSubMenu(menu, "Pantalon", "")
		local subChooseHomme = _menuPool:AddSubMenu(menu, "Chaussure", "")
		AddHautHommeMenu(subvetementHomme)
		AddPullHommeMenu(subPullHomme)
		AddVesteHommeMenu(subVesteHomme)
		AddChemiseHommeMenu(subChemiseHomme)
		AddPantalonHommeMenu(subPantalonHomme)
		AddChaussureHommeMenu(subChooseHomme)
	elseif  GetEntityModel(GetPlayerPed(-1)) == -1667301416 then
		local subvetementFemme = _menuPool:AddSubMenu(menu, "Haut", "") --SOUS MENU
		local subVesteFemme = _menuPool:AddSubMenu(menu, "Veste", "")
		local subPantalonFemme = _menuPool:AddSubMenu(menu, "Pantalon", "")
		local subChaussureFemme = _menuPool:AddSubMenu(menu, "Chaussure", "")
		AddHautFemmeMenu(subvetementFemme)
		AddVesteFemmeMenu(subVesteFemme)
		AddPantalonFemmeMenu(subPantalonFemme)
		AddChaussureFemmeMenu(subChaussureFemme)
	end
end

---------------------------------------------[[CATEGORIE HOMME]]------------------------------------

------------||HAUT HOMME||---------
AddHautHommeMenu = function(menu)
	for _, find in pairs(nConfig.HautHomme) do
        local hautHItem = NativeUI.CreateItem(find.Label, "")
		menu.SubMenu:AddItem(hautHItem)
		hautHItem:RightLabel("~g~$200")
		menu.SubMenu.OnIndexChange = function(sender, index)

				if index == 1 then
					local ped = GetPlayerPed(-1)
					Haut_Id = 11
					Haut_Drawable = 15
					Haut_Couleur = 0
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Torso_Id = 3
					Torso_Drawable = 15
					Torso_Couleur = 0
					Torso_Palette_Id = 2
					Maillot_Palette_Id = 2
					Haut_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)
				elseif index == 2 then

					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 0
					Haut_Couleur = 1
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 0
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2					--_menuPool:CloseAllMenus(true)

				elseif index == 3 then

					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 0
					Haut_Couleur = 7
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 0
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)

				elseif index == 4 then

					local ped = GetPlayerPed(-1)
					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 17
					Haut_Couleur = 1
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 5
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)

				elseif index == 5 then

					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 17
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 5
					Torso_Couleur = 0
					Torso_Palette_Id = 2

					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)

				elseif index == 6 then

					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 33
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)
				elseif index == 7 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 39
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 8 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 44
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 9 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 34
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 10 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 63
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 11 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 73
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 12 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 80
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 13 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 80
					Haut_Couleur = 1
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 14 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 82
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 15 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 82
					Haut_Couleur = 1
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 16 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 83
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 17 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 83
					Haut_Couleur = 1
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 18 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 83
					Haut_Couleur = 2
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 19 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 83
					Haut_Couleur = 3
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 20 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 84
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 21 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 128
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 22 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 131
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 23 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 193
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 24 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 208
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 25 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 206
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 5
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 26 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 205
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 5
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 27 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 223
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 5
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 28 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 226
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 29 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 237
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 5
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 30 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 241
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 31 then
					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 282
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				end
			end

		menu.SubMenu.OnItemSelect = function(sender, item, index)
			if index == 1 then
				local ped = GetPlayerPed(-1)
				Haut_Id = 11
				Haut_Drawable = 15
				Haut_Couleur = 0
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Torso_Id = 3
				Torso_Drawable = 15
				Torso_Couleur = 0
				Torso_Palette_Id = 2
				Maillot_Palette_Id = 2
				Haut_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 2 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 0
				Haut_Couleur = 1
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 0
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 3 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 0
				Haut_Couleur = 7
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 0
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id)
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id)
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 4 then
				local ped = GetPlayerPed(-1)
				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 17
				Haut_Couleur = 1
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 5
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 5 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 17
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 5
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 6 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 33
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 5
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 7 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 39
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 8 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 44
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 9 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 34
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 10 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 63
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 11 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 73
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 12 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 80
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 13 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 80
				Haut_Couleur = 1
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 14 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 82
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 15 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 82
				Haut_Couleur = 1
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 16 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 83
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 17 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 83
				Haut_Couleur = 1
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 18 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 83
				Haut_Couleur = 2
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 19 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 83
				Haut_Couleur = 3
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 20 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 84
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 21 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 128
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 22 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 131
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 23 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 193
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 24 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 208
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 25 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 206
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 5
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 26 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 205
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 5
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 27 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 223
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 5
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 28 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 226
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 29 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 237
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 5
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 30 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 241
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 31 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 282
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			end
		end
    end
end

-----||PULL HOMME||----------------
AddPullHommeMenu = function(menu)
	for _, find in pairs(nConfig.PullHomme) do
        local hautHItem = NativeUI.CreateItem(find.Label, "")
		menu.SubMenu:AddItem(hautHItem)
		hautHItem:RightLabel("~g~$200")
		menu.SubMenu.OnIndexChange = function(sender, index)

				if index == 1 then
					local ped = GetPlayerPed(-1)
					Haut_Id = 11
					Haut_Drawable = 15
					Haut_Couleur = 0
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Torso_Id = 3
					Torso_Drawable = 15
					Torso_Couleur = 0
					Torso_Palette_Id = 2
					Maillot_Palette_Id = 2
					Haut_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 2 then

					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 38
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2					--_menuPool:CloseAllMenus(true)

				elseif index == 3 then

					local ped = GetPlayerPed(-1)
					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 50
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)

				elseif index == 4 then

					local ped = GetPlayerPed(-1)
				----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 52
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)

				elseif index == 5 then

					local ped = GetPlayerPed(-1)


				----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 78
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)

				elseif index == 6 then

					local ped = GetPlayerPed(-1)


							----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 86
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)
				elseif index == 7 then
					local ped = GetPlayerPed(-1)


				----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 89
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 8 then
					local ped = GetPlayerPed(-1)


							----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 121
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 9 then
					local ped = GetPlayerPed(-1)


				----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 139
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 4
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 10 then
					local ped = GetPlayerPed(-1)

				----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 152
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 11 then
					local ped = GetPlayerPed(-1)


				----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 171
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 12 then
					local ped = GetPlayerPed(-1)


				----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 190
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 13 then
					local ped = GetPlayerPed(-1)


				----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 194
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 14 then
					local ped = GetPlayerPed(-1)

				----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 196
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 15 then
					local ped = GetPlayerPed(-1)


				----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 200
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 16 then
					local ped = GetPlayerPed(-1)


						----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 203
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 17 then
					local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 207
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 5
				Torso_Couleur = 0
				Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 18 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 245
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 19 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 253
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 20 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 262
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 21 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 279
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 22 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 280
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 23 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 281
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 8
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				end
			end

		menu.SubMenu.OnItemSelect = function(sender, item, index)
			if index == 1 then
				local ped = GetPlayerPed(-1)
				Haut_Id = 11
				Haut_Drawable = 15
				Haut_Couleur = 0
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Torso_Id = 3
				Torso_Drawable = 15
				Torso_Couleur = 0
				Torso_Palette_Id = 2
				Maillot_Palette_Id = 2
				Haut_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id)
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id)
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 2 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 38
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 8
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 3 then

				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 50
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 8
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 4 then

				local ped = GetPlayerPed(-1)
			----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 52
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 8
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
				elseif index == 5 then

				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 78
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 8
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 6 then

				local ped = GetPlayerPed(-1)


						----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 86
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 8
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 7 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 89
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 8 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 121
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 9 then
				local ped = GetPlayerPed(-1)


			----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 139
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 4
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 10 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 152
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 11 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 171
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 12 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 190
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 13 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 194
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 14 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 196
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 15 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 200
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 16 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 203
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 17 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 207
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 5
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 18 then
				local ped = GetPlayerPed(-1)


			----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 245
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 8
				Torso_Couleur = 0
				Torso_Palette_Id = 2

				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 19 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 253
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 20 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 262
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 8
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 21 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 279
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 8
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 22 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 280
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 23 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 281
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 8
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			end
		end
    end
end

-------||Veste HOMME||-------------
AddVesteHommeMenu = function(menu)
	for _, find in pairs(nConfig.VesteHomme) do
        local hautHItem = NativeUI.CreateItem(find.Label, "")
		menu.SubMenu:AddItem(hautHItem)
		hautHItem:RightLabel("~g~$200")
		menu.SubMenu.OnIndexChange = function(sender, index)

				if index == 1 then
					local ped = GetPlayerPed(-1)
					Haut_Id = 11
					Haut_Drawable = 15
					Haut_Couleur = 0
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Torso_Id = 3
					Torso_Drawable = 15
					Torso_Couleur = 0
					Torso_Palette_Id = 2
					Maillot_Palette_Id = 2
					Haut_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 2 then

					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 3
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2					--_menuPool:CloseAllMenus(true)

				elseif index == 3 then

					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 4
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)

				elseif index == 4 then

					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 6
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)

				elseif index == 5 then

					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 7
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)

				elseif index == 6 then

					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 10
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)
				elseif index == 7 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 11 
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 15
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 8 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 19 
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 9 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 20
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 10 then
					local ped = GetPlayerPed(-1)

				----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 23
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 11 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 24
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 12 then
					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 27
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 13 then
					local ped = GetPlayerPed(-1)


						----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 37
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 14 then
					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 46
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 15 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 57
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 16 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 61
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 6
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 17 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 62
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 18 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 64
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 19 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 68
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 20 then
					local ped = GetPlayerPed(-1)


				----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 69
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 21 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 70
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 22 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 72
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 23 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 75
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 24 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 76
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 25 then
					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 79
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2

					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 26 then
					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 126
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 12
					Torso_Couleur = 0
					Torso_Palette_Id = 2

					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 27 then
					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 125
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2

					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 28 then
					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 138 
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2

					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 29 then
					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 143
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2

					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 30 then
					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 168
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2

					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 31 then
					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 184
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2

					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				end
			end

		menu.SubMenu.OnItemSelect = function(sender, item, index)
			if index == 1 then
				local ped = GetPlayerPed(-1)
				Haut_Id = 11
				Haut_Drawable = 15
				Haut_Couleur = 0
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Torso_Id = 3
				Torso_Drawable = 15
				Torso_Couleur = 0
				Torso_Palette_Id = 2
				Maillot_Palette_Id = 2
				Haut_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id)
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id)
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 2 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 3
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 3 then

				local ped = GetPlayerPed(-1)

					----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 4
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 4 then

				local ped = GetPlayerPed(-1)

					Haut_Id = 11
					Haut_Drawable = 6
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
			elseif index == 5 then

			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 7
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 14
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 6 then

			local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 10
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 7 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 11 
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 15
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 8 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 19 
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 14
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 9 then
			local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 20
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 10 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 152
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 0
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 11 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 24
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 14
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 12 then
			local ped = GetPlayerPed(-1)

			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 27
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 14
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 13 then
			local ped = GetPlayerPed(-1)


				----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 37
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 14
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 14 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 46
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 14
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 15 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 57
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 0
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 16 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 61
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 6
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)

		elseif index == 17 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 62
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 14
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)

		elseif index == 18 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 64
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 14
			Torso_Couleur = 0
			Torso_Palette_Id = 2

			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)

		elseif index == 19 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 68
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 14
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 20 then
			local ped = GetPlayerPed(-1)

			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 69
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 14
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 21 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 70
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 14
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 22 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 72
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 14
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)

		elseif index == 23 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 75
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 8
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 24 then
			local ped = GetPlayerPed(-1)

			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 76
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 14
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)

		elseif index == 25 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 79
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2

				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
		elseif index == 26 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 126
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 12
				Torso_Couleur = 0
				Torso_Palette_Id = 2

				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 27 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 125
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2

				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 28 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 138 
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2

				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 29 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 143
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2

				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 30 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 168
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2

				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 31 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 184
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2

				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			end
		end
    end
end


--------||Chemise HOMME||-------------
AddChemiseHommeMenu = function(menu)
	for _, find in pairs(nConfig.ChemiseHomme) do
        local hautHItem = NativeUI.CreateItem(find.Label, "")
		menu.SubMenu:AddItem(hautHItem)
		hautHItem:RightLabel("~g~$200")
		menu.SubMenu.OnIndexChange = function(sender, index)

				if index == 1 then
					local ped = GetPlayerPed(-1)
					Haut_Id = 11
					Haut_Drawable = 15
					Haut_Couleur = 0
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Torso_Id = 3
					Torso_Drawable = 15
					Torso_Couleur = 0
					Torso_Palette_Id = 2
					Maillot_Palette_Id = 2
					Haut_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 2 then

					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 12
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 12
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2					--_menuPool:CloseAllMenus(true)

				elseif index == 3 then

					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 14
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 12
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)

				elseif index == 4 then

					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 26
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 150 
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 11
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)

				elseif index == 5 then

					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 41
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 12
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)

				elseif index == 6 then

					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 42
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 11
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)
				elseif index == 7 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 85
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 12
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 8 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 92
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 12
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				elseif index == 9 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 234
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 11
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				end
			end

		menu.SubMenu.OnItemSelect = function(sender, item, index)
			if index == 1 then
				local ped = GetPlayerPed(-1)
				Haut_Id = 11
				Haut_Drawable = 15
				Haut_Couleur = 0
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Torso_Id = 3
				Torso_Drawable = 15
				Torso_Couleur = 0
				Torso_Palette_Id = 2
				Maillot_Palette_Id = 2
				Haut_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id)
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id)
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 2 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 12
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 12
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 3 then

				local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 14
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 12
					Torso_Couleur = 0
					Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 4 then

				local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 26
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 150 
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 11
					Torso_Couleur = 0
					Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
			elseif index == 5 then

			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 41
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 12
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 6 then

			local ped = GetPlayerPed(-1)

			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 42
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 11
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 7 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 85
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 12
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 8 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 92
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 12
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 9 then
			local ped = GetPlayerPed(-1)


			----||11 TOP||----
			Haut_Id = 11
			Haut_Drawable = 234
			Haut_Couleur = 0
			Haut_Palette_Id = 2

			----||8 UNDERSHIRT||----
			Maillot_Id = 8
			Maillot_Drawable = 15
			Maillot_Couleur = 0
			Maillot_Palette_Id = 2

			----||3 TORSO||----
			Torso_Id = 3
			Torso_Drawable = 11
			Torso_Couleur = 0
			Torso_Palette_Id = 2


			SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
			SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
			SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
			end
		end
    end
end


----------||Pantalon HOMME||----------
AddPantalonHommeMenu = function(menu)
	for _, find in pairs(nConfig.PantalonHomme) do
        local pantalonItem = NativeUI.CreateItem(find.Label, "")
		menu.SubMenu:AddItem(pantalonItem)
		pantalonItem:RightLabel("~g~$200")

		menu.SubMenu.OnIndexChange = function(sender, index)

				if index == 1 then
					local ped = GetPlayerPed(-1)

				----||Legs ID 4||----
				Pantalon_Id = 4
				Pantalon_Drawable = 1
				Pantalon_Couleur = 0
				Pantalon_Palette_Id = 2
				SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon

				elseif index == 2 then
				local ped = GetPlayerPed(-1)

				----||Legs ID 4||----
				Pantalon_Id = 4
				Pantalon_Drawable = 0
				Pantalon_Couleur = 0
				Pantalon_Palette_Id = 2
				SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon

				elseif index == 3 then
					local ped = GetPlayerPed(-1)
				----||Legs ID 4||----
				Pantalon_Id = 4
				Pantalon_Drawable = 3
				Pantalon_Couleur = 0
				Pantalon_Palette_Id = 2
				SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon


				elseif index == 4 then
					local ped = GetPlayerPed(-1)
				----||Legs ID 4||----
				Pantalon_Id = 4
				Pantalon_Drawable = 4
				Pantalon_Couleur = 0
				Pantalon_Palette_Id = 2
				SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon


				elseif index == 5 then
					local ped = GetPlayerPed(-1)
				---||Legs ID 4||----
				Pantalon_Id = 4
				Pantalon_Drawable = 5
				Pantalon_Couleur = 0
				Pantalon_Palette_Id = 2
				SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon


				elseif index == 6 then
					local ped = GetPlayerPed(-1)
					---||Legs ID 4||----
					Pantalon_Id = 4
					Pantalon_Drawable = 7
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2
					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon

				elseif index == 7 then
					local ped = GetPlayerPed(-1)
					---||Legs ID 4||----
					Pantalon_Id = 4
					Pantalon_Drawable = 8
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2
					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon


				elseif index == 8 then
					local ped = GetPlayerPed(-1)
					---||Legs ID 4||----
					Pantalon_Id = 4
					Pantalon_Drawable = 9
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2
					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon

				elseif index == 9 then
					local ped = GetPlayerPed(-1)
					---||Legs ID 4||----
					Pantalon_Id = 4
					Pantalon_Drawable = 12
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2
					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon

				elseif index == 10 then
					local ped = GetPlayerPed(-1)

					---||Legs ID 4||----
					Pantalon_Id = 4
					Pantalon_Drawable = 15
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2
					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon
				end
			end

		menu.SubMenu.OnItemSelect = function(sender, item, index)
			if index == 1 then
				local ped = GetPlayerPed(-1)
				

				----||Legs ID 4||----
				Pantalon_Id = 4
				Pantalon_Drawable = 1
				Pantalon_Couleur = 0
				Pantalon_Palette_Id = 2
				SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon

				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 2 then
				local ped = GetPlayerPed(-1)
				----||Legs ID 4||----
				Pantalon_Id = 4
				Pantalon_Drawable = 0
				Pantalon_Couleur = 0
				Pantalon_Palette_Id = 2
				
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 3 then
				local ped = GetPlayerPed(-1)
				----||Legs ID 4||----
				Pantalon_Id = 4
				Pantalon_Drawable = 3
				Pantalon_Couleur = 0
				Pantalon_Palette_Id = 2

				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 4 then
				local ped = GetPlayerPed(-1)
				----||Legs ID 4||----
				Pantalon_Id = 4
				Pantalon_Drawable = 4
				Pantalon_Couleur = 0
				Pantalon_Palette_Id = 2
				SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon
					
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
			elseif index == 5 then
			local ped = GetPlayerPed(-1)
			---||Legs ID 4||----
				Pantalon_Id = 4
				Pantalon_Drawable = 5
				Pantalon_Couleur = 0
				Pantalon_Palette_Id = 2
				SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon

			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 6 then
			local ped = GetPlayerPed(-1)
			---||Legs ID 4||----
			Pantalon_Id = 4
			Pantalon_Drawable = 7
			Pantalon_Couleur = 0
			Pantalon_Palette_Id = 2
			SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon

			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 7 then
			local ped = GetPlayerPed(-1)
			---||Legs ID 4||----
			Pantalon_Id = 4
			Pantalon_Drawable = 8
			Pantalon_Couleur = 0
			Pantalon_Palette_Id = 2
			SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon

			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 8 then
			local ped = GetPlayerPed(-1)
			---||Legs ID 4||----
			Pantalon_Id = 4
			Pantalon_Drawable = 9
			Pantalon_Couleur = 0
			Pantalon_Palette_Id = 2
			SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon

			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 9 then
			local ped = GetPlayerPed(-1)
			---||Legs ID 4||----
			Pantalon_Id = 4
			Pantalon_Drawable = 12
			Pantalon_Couleur = 0
			Pantalon_Palette_Id = 2
			SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 10 then
			local ped = GetPlayerPed(-1)
			---||Legs ID 4||----
			Pantalon_Id = 4
			Pantalon_Drawable = 15
			Pantalon_Couleur = 0
			Pantalon_Palette_Id = 2
			SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id) --Pantalon
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
			end
		end
    end
end

--------||Chaussure HOMME||---
AddChaussureHommeMenu = function(menu)
	for _, find in pairs(nConfig.ChaussureHomme) do
        local pantalonItem = NativeUI.CreateItem(find.Label, "")
		menu.SubMenu:AddItem(pantalonItem)
		pantalonItem:RightLabel("~g~$200")

		menu.SubMenu.OnIndexChange = function(sender, index)

				if index == 1 then
					local ped = GetPlayerPed(-1)

					---||Choose ID 6||----
					Chaussure_Id = 6
					Chaussure_Drawable = 1
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2
		
					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon

				elseif index == 2 then
					local ped = GetPlayerPed(-1)

					----||Choose ID 6||----
					Chaussure_Id = 6
					Chaussure_Drawable = 4
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2
					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon

				elseif index == 3 then
					local ped = GetPlayerPed(-1)
					----||Choose ID 6||----
					Chaussure_Id = 6
					Chaussure_Drawable = 5
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2
			
					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon


				elseif index == 4 then
					local ped = GetPlayerPed(-1)
					----||Choose ID 6||----
					Chaussure_Id = 6
					Chaussure_Drawable = 6
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2
					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon

				elseif index == 5 then
					local ped = GetPlayerPed(-1)
					----||Choose ID 6||----
					Chaussure_Id = 6
					Chaussure_Drawable = 7
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2
					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon


				elseif index == 6 then
					local ped = GetPlayerPed(-1)
					----||Choose ID 6||----
					Chaussure_Id = 6
					Chaussure_Drawable = 10
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2


					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon

				elseif index == 7 then
					local ped = GetPlayerPed(-1)
					----||Choose ID 6||----
					Chaussure_Id = 6
					Chaussure_Drawable = 12
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2
					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon


				elseif index == 8 then
					local ped = GetPlayerPed(-1)
					----||Choose ID 6||----
					Chaussure_Id = 6
					Chaussure_Drawable = 14
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2
					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon

				elseif index == 9 then
					local ped = GetPlayerPed(-1)
					----||Choose ID 6||----
					Chaussure_Id = 6
					Chaussure_Drawable = 15
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2
					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon

				elseif index == 10 then
					local ped = GetPlayerPed(-1)
					----||Choose ID 6||----
					Chaussure_Id = 6
					Chaussure_Drawable = 20
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2
			
					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon
				end
			end

		menu.SubMenu.OnItemSelect = function(sender, item, index)
			if index == 1 then
				local ped = GetPlayerPed(-1)
				

				----||Choose ID 6||----
				Chaussure_Id = 6
				Chaussure_Drawable = 1
				Chaussure_Couleur = 0
				Chaussure_Palette_Id = 2
				
				SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 2 then
				local ped = GetPlayerPed(-1)
				----||Choose ID 6||----
				Chaussure_Id = 6
				Chaussure_Drawable = 4
				Chaussure_Couleur = 0
				Chaussure_Palette_Id = 2
		
				SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 3 then
				local ped = GetPlayerPed(-1)
				----||Choose ID 6||----
				Chaussure_Id = 6
				Chaussure_Drawable = 5
				Chaussure_Couleur = 0
				Chaussure_Palette_Id = 2

				SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			elseif index == 4 then
				local ped = GetPlayerPed(-1)
				----||Choose ID 6||----
				Chaussure_Id = 6
				Chaussure_Drawable = 6
				Chaussure_Couleur = 0
				Chaussure_Palette_Id = 2
				
				SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
			elseif index == 5 then
			local ped = GetPlayerPed(-1)

				----||Choose ID 6||----
				Chaussure_Id = 6
				Chaussure_Drawable = 7
				Chaussure_Couleur = 0
				Chaussure_Palette_Id = 2
				
				SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 6 then
			local ped = GetPlayerPed(-1)
				----||Choose ID 6||----
				Chaussure_Id = 6
				Chaussure_Drawable = 10
				Chaussure_Couleur = 0
				Chaussure_Palette_Id = 2
			
				SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 7 then
			local ped = GetPlayerPed(-1)
				----||Choose ID 6||----
				Chaussure_Id = 6
				Chaussure_Drawable = 12
				Chaussure_Couleur = 0
				Chaussure_Palette_Id = 2
			
				SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 8 then
			local ped = GetPlayerPed(-1)
				----||Choose ID 6||----
				Chaussure_Id = 6
				Chaussure_Drawable = 14
				Chaussure_Couleur = 0
				Chaussure_Palette_Id = 2
			
				SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 9 then
			local ped = GetPlayerPed(-1)
				----||Choose ID 6||----
				Chaussure_Id = 6
				Chaussure_Drawable = 15
				Chaussure_Couleur = 0
				Chaussure_Palette_Id = 2
			SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
		elseif index == 10 then
			local ped = GetPlayerPed(-1)
			----||Choose ID 6||----
			Chaussure_Id = 6
			Chaussure_Drawable = 20
			Chaussure_Couleur = 0
			Chaussure_Palette_Id = 2

			SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id) --Pantalon
			TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
			_menuPool:CloseAllMenus(true)
			end
		end
    end
end

---------------------------------------------[[CATEGORIE FEMME]]------------------------------------

------------||HAUT FEMME||---------
AddHautFemmeMenu = function(menu)
	for _, find in pairs(nConfig.HautFemme) do
        local hautHItem = NativeUI.CreateItem(find.Label, "")
		menu.SubMenu:AddItem(hautHItem)
		hautHItem:RightLabel("~g~$200")
		menu.SubMenu.OnIndexChange = function(sender, index)

				if index == 1 then
					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 2
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 2
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 2 then

					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 5
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 6
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 15
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2					--_menuPool:CloseAllMenus(true)


				elseif index == 3 then

					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 14
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)


				elseif index == 4 then

					local ped = GetPlayerPed(-1)
					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 14
					Haut_Couleur = 1
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)


				elseif index == 5 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 16
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 6
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 15
					Torso_Couleur = 0
					Torso_Palette_Id = 2

					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 6 then

					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 23
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 6
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 15
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 7 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 38
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 2
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 8 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 36
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 6
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 15
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 9 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 38
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 2
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 10 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 38
					Haut_Couleur = 1
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 2
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 11 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 40
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 2
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 12 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 45
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 0
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 13 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 49
					Haut_Couleur = 1
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 14 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 56
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 15 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 67
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 2
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 16 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 68
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 17 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 73
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 18 then           --> Sweet
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 75
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 1
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 19 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 76
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 14
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 9
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 20 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 88
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 14
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				end
			end

		menu.SubMenu.OnItemSelect = function(sender, item, index)
			if index == 1 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 2
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 2
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 2 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 5
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 6
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 15
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 3 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 14
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id)
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id)
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)



			elseif index == 4 then
				local ped = GetPlayerPed(-1)
				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 14
				Haut_Couleur = 1
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 5 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 16
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 6
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 15
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 6 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 23
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 6
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 15
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 7 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 23
				Haut_Couleur = 1
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 6
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 15
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 8 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 36
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 6
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 15
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 9 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 38
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 2
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 10 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 38
				Haut_Couleur = 1
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 2
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 11 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 40
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 2
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 12 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 45
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 0
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 13 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 49
				Haut_Couleur = 1
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 14 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 56
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 15 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 67
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 2
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 16 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 68
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 17 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 73
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 18 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 75
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 1
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			elseif index == 19 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 76
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 14
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 9
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 20 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 88
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 15
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 14
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)

			end
		end
    end
end

------------||Veste FEMME||---------
AddVesteFemmeMenu = function(menu)
	for _, find in pairs(nConfig.VesteFemme) do
        local hautHItem = NativeUI.CreateItem(find.Label, "")
		menu.SubMenu:AddItem(hautHItem)
		hautHItem:RightLabel("~g~$200")
		menu.SubMenu.OnIndexChange = function(sender, index)

				if index == 1 then
					local ped = GetPlayerPed(-1)
					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 3
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 14
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 3
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 2 then

					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 10
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 14
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 6
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2					--_menuPool:CloseAllMenus(true)

				elseif index == 3 then

					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 8
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 14
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 5 
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)

				elseif index == 4 then

					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 35
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 14
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 5 
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)

				elseif index == 5 then

					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 54
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 3
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 3
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)

				elseif index == 6 then

					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 50
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 14
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 3
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					--_menuPool:CloseAllMenus(true)


				elseif index == 7 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 24
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 16
					Maillot_Couleur = 1
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 5
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 8 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 24
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 16
					Maillot_Couleur = 5
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 5
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 9 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 25
					Haut_Couleur = 0
					Haut_Palette_Id = 2


					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 16
					Maillot_Couleur = 5
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 6
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 10 then
						local ped = GetPlayerPed(-1)

						----||11 TOP||----
						Haut_Id = 11
						Haut_Drawable = 31
						Haut_Couleur = 0
						Haut_Palette_Id = 2


						----||8 UNDERSHIRT||----
						Maillot_Id = 8
						Maillot_Drawable = 80
						Maillot_Couleur = 5
						Maillot_Palette_Id = 2

						----||3 TORSO||----
						Torso_Id = 3
						Torso_Drawable = 5
						Torso_Couleur = 0
						Torso_Palette_Id = 2


						SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
						SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
						SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 11 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 52
					Haut_Couleur = 0
					Haut_Palette_Id = 2


					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 40
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 3
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 12 then
					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 53
					Haut_Couleur = 0
					Haut_Palette_Id = 2


					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 40
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 9
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 13 then
						local ped = GetPlayerPed(-1)


						----||11 TOP||----
						Haut_Id = 11
						Haut_Drawable = 55
						Haut_Couleur = 0
						Haut_Palette_Id = 2

						----||8 UNDERSHIRT||----
						Maillot_Id = 8
						Maillot_Drawable = 15
						Maillot_Couleur = 0
						Maillot_Palette_Id = 2

						----||3 TORSO||----
						Torso_Id = 3
						Torso_Drawable = 6
						Torso_Couleur = 0
						Torso_Palette_Id = 2


						SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
						SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
						SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 14 then
					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 57
					Haut_Couleur = 0
					Haut_Palette_Id = 2


					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 40
					Maillot_Couleur = 2
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 3
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2


				elseif index == 15 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 64
					Haut_Couleur = 0
					Haut_Palette_Id = 2


					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 47
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 7
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 16 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 65
					Haut_Couleur = 0
					Haut_Palette_Id = 2


					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 181
					Maillot_Couleur = 1
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 7
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 17 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 65
					Haut_Couleur = 0
					Haut_Palette_Id = 2


					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 181
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 7
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 18 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 69
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 57
					Maillot_Couleur = 1
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 3
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 19 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 70
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 57
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 3
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				elseif index == 20 then
						local ped = GetPlayerPed(-1)


						----||11 TOP||----
						Haut_Id = 11
						Haut_Drawable = 80
						Haut_Couleur = 0
						Haut_Palette_Id = 2

						----||8 UNDERSHIRT||----
						Maillot_Id = 8
						Maillot_Drawable = 57
						Maillot_Couleur = 0
						Maillot_Palette_Id = 2

						----||3 TORSO||----
						Torso_Id = 3
						Torso_Drawable = 3
						Torso_Couleur = 0
						Torso_Palette_Id = 2


						SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
						SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
						SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2

				end
			end

		menu.SubMenu.OnItemSelect = function(sender, item, index)
			if index == 1 then
					local ped = GetPlayerPed(-1)
					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 3
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 14
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 3
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id)
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id)
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)

			elseif index == 2 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 10
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 14
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 6
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 3 then

				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 8
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 14
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 5 
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 4 then

					local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 35
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 14
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 5 
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)


					_menuPool:CloseAllMenus(true)


			elseif index == 5 then

					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 54
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 14
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 3
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)

			elseif index == 6 then

					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 50
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 14
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 3
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 7 then --A REPRENDRE ICI 
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 24
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 16
				Maillot_Couleur = 1
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 5
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 8 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 24
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 16
				Maillot_Couleur = 5
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 5
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 9 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 25
				Haut_Couleur = 0
				Haut_Palette_Id = 2


				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 16
				Maillot_Couleur = 5
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 6
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 10 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 31
				Haut_Couleur = 0
				Haut_Palette_Id = 2


				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 80
				Maillot_Couleur = 5
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 5
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 11 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 52
				Haut_Couleur = 0
				Haut_Palette_Id = 2


				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 40
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 3
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 12 then
				local ped = GetPlayerPed(-1)

				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 53
				Haut_Couleur = 0
				Haut_Palette_Id = 2


				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 40
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 9
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 13 then
					local ped = GetPlayerPed(-1)


					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 55
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 15
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 6
					Torso_Couleur = 0
					Torso_Palette_Id = 2


					SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
					SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
					SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 14 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 57
				Haut_Couleur = 0
				Haut_Palette_Id = 2


				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 40
				Maillot_Couleur = 2
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 3
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 15 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 64
				Haut_Couleur = 0
				Haut_Palette_Id = 2


				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 47
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 7
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 16 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 65
				Haut_Couleur = 0
				Haut_Palette_Id = 2


				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 181
				Maillot_Couleur = 1
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 7
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 17 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 65
				Haut_Couleur = 0
				Haut_Palette_Id = 2


				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 181
				Maillot_Couleur = 0
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 7
				Torso_Couleur = 0
				Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 18 then
				local ped = GetPlayerPed(-1)


				----||11 TOP||----
				Haut_Id = 11
				Haut_Drawable = 69
				Haut_Couleur = 0
				Haut_Palette_Id = 2

				----||8 UNDERSHIRT||----
				Maillot_Id = 8
				Maillot_Drawable = 57
				Maillot_Couleur = 1
				Maillot_Palette_Id = 2

				----||3 TORSO||----
				Torso_Id = 3
				Torso_Drawable = 3
				Torso_Couleur = 0
				Torso_Palette_Id = 2

				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 19 then
				local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 70
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 57
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 3
					Torso_Couleur = 0
					Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 20 then
				local ped = GetPlayerPed(-1)

					----||11 TOP||----
					Haut_Id = 11
					Haut_Drawable = 80
					Haut_Couleur = 0
					Haut_Palette_Id = 2

					----||8 UNDERSHIRT||----
					Maillot_Id = 8
					Maillot_Drawable = 57
					Maillot_Couleur = 0
					Maillot_Palette_Id = 2

					----||3 TORSO||----
					Torso_Id = 3
					Torso_Drawable = 3
					Torso_Couleur = 0
					Torso_Palette_Id = 2


				SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)		-- Torso
				SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id) 	-- Undershirt
				SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id) 	-- Torso 2
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			end

		end
    end
end

------------||Pantalon FEMME||---------
AddPantalonFemmeMenu = function(menu)
	for _, find in pairs(nConfig.PantalonFemme) do
        local pantalonFItem = NativeUI.CreateItem(find.Label, "")
		menu.SubMenu:AddItem(pantalonFItem)
		pantalonFItem:RightLabel("~g~$200")
		menu.SubMenu.OnIndexChange = function(sender, index)

				if index == 1 then
					local ped = GetPlayerPed(-1)

					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 1
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs

				elseif index == 2 then

					local ped = GetPlayerPed(-1)

					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 2
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs

				elseif index == 3 then

					local ped = GetPlayerPed(-1)




					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 3
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs

				elseif index == 4 then

					local ped = GetPlayerPed(-1)




					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 4
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs

				elseif index == 5 then

					local ped = GetPlayerPed(-1)



					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 7
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs

					

				elseif index == 6 then

					local ped = GetPlayerPed(-1)




					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 11
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs


				elseif index == 7 then
					local ped = GetPlayerPed(-1)





					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 18
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs


				elseif index == 8 then
					local ped = GetPlayerPed(-1)


	


					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 23
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs


				elseif index == 9 then
					local ped = GetPlayerPed(-1)





					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 11
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs


				elseif index == 10 then
						local ped = GetPlayerPed(-1)




						----||↓↓↓↓||---- -> ID 4 --> Legs
						Pantalon_Id = 4
						Pantalon_Drawable = 25
						Pantalon_Couleur = 0
						Pantalon_Palette_Id = 2

						SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs


				elseif index == 11 then
					local ped = GetPlayerPed(-1)





					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 32
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs


				elseif index == 12 then
					local ped = GetPlayerPed(-1)




					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 36
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs


				elseif index == 13 then
						local ped = GetPlayerPed(-1)




							----||↓↓↓↓||---- -> ID 4 --> Legs
						Pantalon_Id = 4
						Pantalon_Drawable = 43
						Pantalon_Couleur = 0
						Pantalon_Palette_Id = 2

						SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs

				elseif index == 14 then
					local ped = GetPlayerPed(-1)




					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 44
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs


				elseif index == 15 then
					local ped = GetPlayerPed(-1)





					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 73
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs

				elseif index == 16 then
					local ped = GetPlayerPed(-1)





					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 84
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs

				elseif index == 17 then
					local ped = GetPlayerPed(-1)





					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 102
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs

				elseif index == 18 then
					local ped = GetPlayerPed(-1)





					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 112
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs

				elseif index == 19 then
					local ped = GetPlayerPed(-1)





					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 103
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs

				elseif index == 20 then
						local ped = GetPlayerPed(-1)





							----||↓↓↓↓||---- -> ID 4 --> Legs
						Pantalon_Id = 4
						Pantalon_Drawable = 78
						Pantalon_Couleur = 0
						Pantalon_Palette_Id = 2

						SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs

				end
			end

		menu.SubMenu.OnItemSelect = function(sender, item, index)
			if index == 1 then
					local ped = GetPlayerPed(-1)



					Pantalon_Id = 4
					Pantalon_Drawable = 1
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)

			elseif index == 2 then
				local ped = GetPlayerPed(-1)




				----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 2
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 3 then

				local ped = GetPlayerPed(-1)




				----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 3
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 4 then

					local ped = GetPlayerPed(-1)




					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 4 
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)


					_menuPool:CloseAllMenus(true)


			elseif index == 5 then

					local ped = GetPlayerPed(-1)





					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 7
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)

			elseif index == 6 then

					local ped = GetPlayerPed(-1)





					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 11
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 7 then --A REPRENDRE ICI 
				local ped = GetPlayerPed(-1)





				----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 18
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 8 then
				local ped = GetPlayerPed(-1)





				----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 23
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 9 then
				local ped = GetPlayerPed(-1)





					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 11
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 10 then
				local ped = GetPlayerPed(-1)





					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 25
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 11 then
				local ped = GetPlayerPed(-1)



					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 32
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 12 then
				local ped = GetPlayerPed(-1)




					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 36
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 13 then
					local ped = GetPlayerPed(-1)




					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 43
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 14 then
				local ped = GetPlayerPed(-1)




					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 44
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 15 then
				local ped = GetPlayerPed(-1)




					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 73
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 16 then
				local ped = GetPlayerPed(-1)




					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 84
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 17 then
				local ped = GetPlayerPed(-1)





				----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 102
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 18 then
				local ped = GetPlayerPed(-1)




				----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 112
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 19 then
				local ped = GetPlayerPed(-1)




					----||↓↓↓↓||---- -> ID 4 --> Legs
					Pantalon_Id = 4
					Pantalon_Drawable = 103
					Pantalon_Couleur = 0
					Pantalon_Palette_Id = 2

					SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 20 then
				local ped = GetPlayerPed(-1)

				----||↓↓↓↓||---- -> ID 4 --> Legs
				Pantalon_Id = 4
				Pantalon_Drawable = 78
				Pantalon_Couleur = 0
				Pantalon_Palette_Id = 2

				SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)		-- Legs
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			end

		end
    end
end


------------||Chaussure FEMME||---------
AddChaussureFemmeMenu = function(menu)
	for _, find in pairs(nConfig.ChaussureFemme) do
        local pantalonFItem = NativeUI.CreateItem(find.Label, "")
		menu.SubMenu:AddItem(pantalonFItem)
		pantalonFItem:RightLabel("~g~$200")
		menu.SubMenu.OnIndexChange = function(sender, index)

				if index == 1 then
					local ped = GetPlayerPed(-1)

					Chaussure_Id = 6
					Chaussure_Drawable = 1 
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 2 then

					local ped = GetPlayerPed(-1)

					Chaussure_Id = 6
					Chaussure_Drawable = 2
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 3 then

					local ped = GetPlayerPed(-1)




					Chaussure_Id = 6
					Chaussure_Drawable = 3
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 4 then

					local ped = GetPlayerPed(-1)




					Chaussure_Id = 6
					Chaussure_Drawable = 4
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 5 then

					local ped = GetPlayerPed(-1)



					Chaussure_Id = 6
					Chaussure_Drawable = 5
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 6 then

					local ped = GetPlayerPed(-1)




					Chaussure_Id = 6
					Chaussure_Drawable = 6
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs


				elseif index == 7 then
					local ped = GetPlayerPed(-1)





					Chaussure_Id = 6
					Chaussure_Drawable = 7
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 8 then
					local ped = GetPlayerPed(-1)


	


					Chaussure_Id = 6
					Chaussure_Drawable = 9
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 9 then
					local ped = GetPlayerPed(-1)





					Chaussure_Id = 6
					Chaussure_Drawable = 13
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 10 then
						local ped = GetPlayerPed(-1)




						Chaussure_Id = 6
						Chaussure_Drawable = 14
						Chaussure_Couleur = 0
						Chaussure_Palette_Id = 2

						SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 11 then
					local ped = GetPlayerPed(-1)





					Chaussure_Id = 6
					Chaussure_Drawable = 15
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 12 then
					local ped = GetPlayerPed(-1)




						Chaussure_Id = 6
					Chaussure_Drawable = 18
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 13 then
						local ped = GetPlayerPed(-1)




							Chaussure_Id = 6
						Chaussure_Drawable = 19
						Chaussure_Couleur = 0
						Chaussure_Palette_Id = 2

						SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 14 then
					local ped = GetPlayerPed(-1)




						Chaussure_Id = 6
					Chaussure_Drawable = 20
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 15 then
					local ped = GetPlayerPed(-1)





					Chaussure_Id = 6
					Chaussure_Drawable = 21
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 16 then
					local ped = GetPlayerPed(-1)





					Chaussure_Id = 6
					Chaussure_Drawable = 24
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 17 then
					local ped = GetPlayerPed(-1)





					Chaussure_Id = 6
					Chaussure_Drawable = 25
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 18 then
					local ped = GetPlayerPed(-1)





					Chaussure_Id = 6
					Chaussure_Drawable = 26
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 19 then
					local ped = GetPlayerPed(-1)





						Chaussure_Id = 27
					Chaussure_Drawable = 0
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				elseif index == 20 then
						local ped = GetPlayerPed(-1)





						Chaussure_Id = 6
						Chaussure_Drawable = 36
						Chaussure_Couleur = 0
						Chaussure_Palette_Id = 2

						SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs

				end
			end

		menu.SubMenu.OnItemSelect = function(sender, item, index)
			if index == 1 then
					local ped = GetPlayerPed(-1)



					Chaussure_Id = 6
					Chaussure_Drawable = 1 
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)

			elseif index == 2 then
				local ped = GetPlayerPed(-1)




					Chaussure_Id = 6
					Chaussure_Drawable = 2
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 3 then

				local ped = GetPlayerPed(-1)




					Chaussure_Id = 6
					Chaussure_Drawable =  3
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 4 then

					local ped = GetPlayerPed(-1)




					Chaussure_Id = 6
					Chaussure_Drawable = 4
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)


					_menuPool:CloseAllMenus(true)


			elseif index == 5 then

					local ped = GetPlayerPed(-1)





					Chaussure_Id = 6
					Chaussure_Drawable = 5
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)

			elseif index == 6 then

					local ped = GetPlayerPed(-1)





					Chaussure_Id = 6
					Chaussure_Drawable = 6
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 7 then --A REPRENDRE ICI 
				local ped = GetPlayerPed(-1)





					Chaussure_Id = 6
					Chaussure_Drawable = 7
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)


			elseif index == 8 then
				local ped = GetPlayerPed(-1)





					Chaussure_Id = 6
					Chaussure_Drawable = 9
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 9 then
				local ped = GetPlayerPed(-1)





					Chaussure_Id = 6
					Chaussure_Drawable = 13
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 10 then
				local ped = GetPlayerPed(-1)





					Chaussure_Id = 6
					Chaussure_Drawable = 14
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 11 then
				local ped = GetPlayerPed(-1)



					Chaussure_Id = 6
					Chaussure_Drawable = 15
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 12 then
				local ped = GetPlayerPed(-1)




					Chaussure_Id = 6
					Chaussure_Drawable = 18
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 13 then
					local ped = GetPlayerPed(-1)




					Chaussure_Id = 6
					Chaussure_Drawable = 19
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 14 then
				local ped = GetPlayerPed(-1)



					
						Chaussure_Id = 6
						Chaussure_Drawable = 20
						Chaussure_Couleur = 0
						Chaussure_Palette_Id = 2

						SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
						TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
						_menuPool:CloseAllMenus(true)


			elseif index == 15 then
				local ped = GetPlayerPed(-1)




					Chaussure_Id = 6
					Chaussure_Drawable = 21
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 16 then
				local ped = GetPlayerPed(-1)




					Chaussure_Id = 6
					Chaussure_Drawable = 24
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 17 then
				local ped = GetPlayerPed(-1)





					Chaussure_Id = 6
					Chaussure_Drawable = 25
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 18 then
				local ped = GetPlayerPed(-1)




					Chaussure_Id = 6
					Chaussure_Drawable = 26
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 19 then
				local ped = GetPlayerPed(-1)




					Chaussure_Id = 6
					Chaussure_Drawable = 27
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
					TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
					_menuPool:CloseAllMenus(true)


			elseif index == 20 then
				local ped = GetPlayerPed(-1)

					Chaussure_Id = 6
					Chaussure_Drawable = 36
					Chaussure_Couleur = 0
					Chaussure_Palette_Id = 2

					SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)		-- Legs
				TriggerServerEvent("nShopVetement:UpdateVetement", Haut_Id,Haut_Drawable,Haut_Couleur,Haut_Palette_Id,Maillot_Id,Maillot_Drawable,Maillot_Couleur,Maillot_Palette_Id,Chaussure_Id,Chaussure_Drawable,Chaussure_Couleur,Chaussure_Palette_Id,Pantalon_Id,Pantalon_Drawable,Pantalon_Couleur,Pantalon_Palette_Id,Torso_Id,Torso_Drawable,Torso_Couleur,Torso_Palette_Id)
				_menuPool:CloseAllMenus(true)
			end

		end
    end
end


RegisterNetEvent("nShopVetement:C_UpdateVetement")
AddEventHandler("nShopVetement:C_UpdateVetement",function(args)
	local ped = GetPlayerPed(-1)

	Haut_Id = tonumber(args[1])
	Haut_Drawable = tonumber(args[2])
	Haut_Couleur = tonumber(args[3])
	Haut_Palette_Id = tonumber(args[4])
	Maillot_Id = tonumber(args[5])
	Maillot_Drawable = tonumber(args[6])
	Maillot_Couleur = tonumber(args[7])
	Maillot_Palette_Id = tonumber(args[8])
	Chaussure_Id = tonumber(args[9])
	Chaussure_Drawable = tonumber(args[10])
	Chaussure_Couleur = tonumber(args[11])
	Chaussure_Palette_Id = tonumber(args[12])
	Pantalon_Id = tonumber(args[13])
	Pantalon_Drawable = tonumber(args[14])
	Pantalon_Couleur = tonumber(args[15])
	Pantalon_Palette_Id = tonumber(args[16])
	Torso_Id = tonumber(args[17])
	Torso_Drawable = tonumber(args[18])
	Torso_Couleur = tonumber(args[19])
	Torso_Palette_Id = tonumber(args[20])

	SetPedComponentVariation(ped, Torso_Id, Torso_Drawable, Torso_Couleur, Torso_Palette_Id)-- ID 3
	SetPedComponentVariation(ped, Pantalon_Id, Pantalon_Drawable, Pantalon_Couleur, Pantalon_Palette_Id)-- ID 4
	SetPedComponentVariation(ped, Chaussure_Id, Chaussure_Drawable, Chaussure_Couleur, Chaussure_Palette_Id)-- ID 6
	SetPedComponentVariation(ped, Maillot_Id, Maillot_Drawable, Maillot_Couleur, Maillot_Palette_Id)-- ID 8
	SetPedComponentVariation(ped, Haut_Id, Haut_Drawable, Haut_Couleur, Haut_Palette_Id)-- ID 11
end)


RegisterNetEvent("nVetement:LoadOldVetement")
AddEventHandler("nVetement:LoadOldVetement", function()
	TriggerServerEvent("vCharacter:SpawnCharacter")
end)