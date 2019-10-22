-----------------||MES VAR||-----------------
local isCuffed = false
local isPlayerCuff = false
local all_weapons = {
	{name = "WEAPON_Knife", pname = "Couteau"},
	{name = "WEAPON_HAMMER", pname = "Marteau"},
	{name = "WEAPON_Bat", pname = "Batte"},
	{name = "WEAPON_Bottle", pname = "Bouteille"},
	{name = "WEAPON_Dagger", pname = "Poignard"},
	{name = "WEAPON_Hatchet", pname = "Hachette"},
	{name = "WEAPON_KNUCKLE", pname = "Poing Américain"},
	{name = "WEAPON_Machete", pname = "Machette"},
	{name = "WEAPON_Flashlight", pname = "Lampe de poche"},
	{name = "WEAPON_Pistol", pname = "Pistolet"},
	{name = "WEAPON_CombatPistol", pname = "Pistolet de Combat"},
	{name = "WEAPON_PISTOL50", pname = "Pistolet .50"},
	{name = "WEAPON_HeavyPistol", pname = "Pistolet Lourd"},
	{name = "WEAPON_VintagePistol", pname = "Pistolet Vintage"},
	{name = "WEAPON_APPistol", pname = "Pistolet perforant"},
	{name = "WEAPON_FlareGun", pname = "Pistolet de détresse"},
	{name = "WEAPON_MicroSMG", pname = "Uzi"},
	{name = "WEAPON_MachinePistol", pname = "TEC-9"},
	{name = "WEAPON_SMG", pname = "MP5A3"},
	{name = "WEAPON_AssaultSMG", pname = "Magpul PDR"},
	{name = "WEAPON_CombatPDW", pname = "MPX"},
	{name = "WEAPON_Gusenberg", pname = "Gusenberg"},
	{name = "WEAPON_PumpShotgun", pname = "Fusil à Pompe"},
	{name = "WEAPON_SawnoffShotgun", pname = "Fusil à canon scié"},
	{name = "WEAPON_AssaultRifle", pname = "AK-47"},
	{name = "WEAPON_CarbineRifle", pname = "M4A4"},
	{name = "WEAPON_AdvancedRifle", pname = "TAR-21"},
	{name = "WEAPON_SpecialCarbine", pname = "G36C"},
	{name = "WEAPON_BullpupRifle", pname = "QBZ-95"},
	{name = "WEAPON_BZGas", pname = "Gas BZ"},
	{name = "WEAPON_Molotov", pname = "Molotov"},
	{name = "WEAPON_FireExtinguisher", pname = "Extincteur"},
	{name = "WEAPON_PetrolCan", pname = "Jerrican"},
	{name = "WEAPON_Flare", pname = "Flare"},
}

-----------------||MES EVENTS||-----------------
RegisterNetEvent("nPolice:Cfouille")
AddEventHandler("nPolice:Cfouille", function(NearestPlayerSID, THEITEMSFOUILLE)
	ITEMSFOUILLE = {}
    ITEMSFOUILLE = THEITEMSFOUILLE
	exports.nCoreStuff:nNotificationMain({
		text = "Inventaire de " ..GetOwnerName(NearestPlayerSID) .. " : ",
		type = 'basGauche',
		nTimeNotif = 60000,
	})
	local count = 0
	for k, v in pairs (ITEMSFOUILLE) do
		if v.quantity > 0 then
			exports.nCoreStuff:nNotificationMain({
				text = v.libelle .. " " ..v.quantity,
				type = 'basGauche',
				nTimeNotif = 60000,
			})
			count = count + v.quantity
		end
	end
	if count == 0 then
        exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "La personne n'a rien dans son inventaire", "")
	end
end)
RegisterNetEvent('nPolice:Cfouilleweapons')
AddEventHandler('nPolice:Cfouilleweapons', function(NearestPlayerSID)
	TriggerServerEvent("nPolice:sfouilleweapons", NearestPlayerSID, GetPedWeapons(GetPlayerPed(-1)))
end)

RegisterNetEvent('nPolice:Cgetarrested')
AddEventHandler('nPolice:Cgetarrested', function(playerheading, playercoords, playerlocation)
	playerPed = GetPlayerPed(-1)
	SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
	local x, y, z   = table.unpack(playercoords + playerlocation)
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	SetEntityHeading(GetPlayerPed(-1), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0)
	Citizen.Wait(3760)
	isCuffed = true
	loadanimdict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
	SetPedComponentVariation(GetPlayerPed(-1), 7, 41, 0 ,0)
end)

RegisterNetEvent('nPolice:Cdoarrested')
AddEventHandler('nPolice:Cdoarrested', function()
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0, 0, 0, 0)
	Citizen.Wait(3000)
end)

RegisterNetEvent('nPolice:Cdouncuffing')
AddEventHandler('nPolice:Cdouncuffing', function()
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	ClearPedTasks(GetPlayerPed(-1))
end)

RegisterNetEvent('nPolice:Cgetuncuffed')
AddEventHandler('nPolice:Cgetuncuffed', function(playerheading, playercoords, playerlocation)
	local x, y, z = table.unpack(playercoords + playerlocation)
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	SetEntityHeading(GetPlayerPed(-1), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0 ,0)
	Citizen.Wait(5500)
	isCuffed = false
	ClearPedTasks(GetPlayerPed(-1))
end)

-----------------||MES THREAD||-----------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsEntityPlayingAnim(GetPlayerPed(-1), "mp_arresting", "idle", 3) then
			isCuffed = true
		elseif isCuffed then
			TaskPlayAnim(GetPlayerPed(-1), "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
			DisableControlAction(0,21,true) -- disable sprint
			DisableControlAction(0,24,true) -- disable attack
			DisableControlAction(0,25,true) -- disable aim
			DisableControlAction(0,47,true) -- disable weapon
			DisableControlAction(0,58,true) -- disable weapon
			DisableControlAction(0,263,true) -- disable melee
			DisableControlAction(0,264,true) -- disable melee
			DisableControlAction(0,257,true) -- disable melee
			DisableControlAction(0,140,true) -- disable melee
			DisableControlAction(0,141,true) -- disable melee
			DisableControlAction(0,142,true) -- disable melee
			DisableControlAction(0,143,true) -- disable melee
			DisableControlAction(0,75,true) -- disable exit vehicle
			DisableControlAction(27,75,true) -- disable exit vehicle  
			DisableControlAction(0,268,true)
			DisableControlAction(0,269,true)
			DisableControlAction(0,270,true)
			DisableControlAction(0,271,true)
			SetPedCurrentWeaponVisible(GetPlayerPed(-1), false, true, false, false)
		end
	end
end)

-----------------||MES FUNCTIONS||-----------------
local function GetPedWeapons(ped)
	weapons_list = ""
	weapons_count = 0
	for k,v in pairs(all_weapons) do
		local hash = GetHashKey(v.name)
		if HasPedGotWeapon(ped, hash, false) then
			if weapons_list == "" then
				weapons_list = v.pname
			else
				weapons_list = weapons_list .. ", " .. v.pname
			end
			weapons_count = weapons_count + 1
		end
	end
	if weapons_count == 0 then
		return "Aucune armes"
	else
		return "Armes : " .. weapons_list
	end
end

__AddMenuPoliceJob = function(menu)
	local submenu = _menuPool:AddSubMenu(menu.SubMenu, "Intéraction Citoyen", "")
    -----------------||Intéraction Citoyen||-----------------
	local cuffItem = NativeUI.CreateItem("Menotter", "")
	submenu.SubMenu:AddItem(cuffItem)

	local unCuffItem = NativeUI.CreateItem("Demenotter", "")
	submenu.SubMenu:AddItem(unCuffItem)

	local fouilleItem = NativeUI.CreateItem("Fouiller le civil", "")
	submenu.SubMenu:AddItem(fouilleItem)
	
	if copRank == 2 then
		local subTravau = _menuPool:AddSubMenu(menu.SubMenu, "Gestion Employé", "")

		local OffiItem = NativeUI.CreateItem("Promouvoir en tant que Officier", "")
		subTravau.SubMenu:AddItem(OffiItem)

		local SergentiItem = NativeUI.CreateItem("Promouvoir en tant que Sergent", "")
		subTravau.SubMenu:AddItem(SergentiItem)

		local LieutenantiItem = NativeUI.CreateItem("Promouvoir en tant que Lieutenant", "")
		subTravau.SubMenu:AddItem(LieutenantiItem)

		local CapitainetiItem = NativeUI.CreateItem("Promouvoir en tant que Capitaine", "")
		subTravau.SubMenu:AddItem(CapitainetiItem)

		-----------------||GESTION EMPLOYER||-----------------
	subTravau.SubMenu.OnItemSelect = function(sender, item, index)
			if item == OffiItem then
				player, distance = GetClosestPlayer()
				if(distance ~= -1 and distance < 3) then
					TriggerServerEvent("nPolice:AddOfficier", GetPlayerServerId(player))
					exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~h~Vous avez promu une personne.", "")
				else
					exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~y~Aucune personne devant vous.", "")
				end
			elseif item == SergentiItem then
				player, distance = GetClosestPlayer()
				if(distance ~= -1 and distance < 3) then
					TriggerServerEvent("nPolice:AddSergent", GetPlayerServerId(player))
					exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~h~Vous avez promu une personne.", "")
				else
					exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~y~Aucune personne devant vous.", "")
				end
			elseif item == LieutenantiItem then
				player, distance = GetClosestPlayer()
				if(distance ~= -1 and distance < 3) then
					TriggerServerEvent("nPolice:AddLieutenant", GetPlayerServerId(player))
					exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~h~Vous avez promu une personne.", "")
				else
					exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~y~Aucune personne devant vous.", "")
				end
			elseif item == CapitainetiItem then
				player, distance = GetClosestPlayer()
				if(distance ~= -1 and distance < 3) then
					TriggerServerEvent("nPolice:AddCapitaine", GetPlayerServerId(player))
					exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~h~Vous avez promu une personne.", "")
				else
					exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~y~Aucune personne devant vous.", "")
				end
			end
		end
	end

    -----------------||Intéraction Citoyen||-----------------
	submenu.SubMenu.OnItemSelect = function(sender, item, index)

		if item == cuffItem then
			player, distance = GetClosestPlayer()
			playerheading = GetEntityHeading(GetPlayerPed(-1))
			playerlocation = GetEntityForwardVector(PlayerPedId())
			playerCoords = GetEntityCoords(GetPlayerPed(-1))
			local target_id = GetPlayerServerId(player)
			isPlayerCuff = checked_
			if(distance ~= -1 and distance < 3) then
				TriggerServerEvent('nPolice:MenotterServer', target_id, playerheading, playerCoords, playerlocation)
                exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~h~Vous avez menotté une personne.", "")
			else
                exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~y~Aucune personne devant vous.", "")
			end
		elseif item == unCuffItem then
			player, distance = GetClosestPlayer()
			playerheading = GetEntityHeading(GetPlayerPed(-1))
			playerlocation = GetEntityForwardVector(PlayerPedId())
			playerCoords = GetEntityCoords(GetPlayerPed(-1))
			local target_id = GetPlayerServerId(player)
			isPlayerCuff = checked_
			if(distance ~= -1 and distance < 3) then
				TriggerServerEvent('nPolice:Srequestrelease', target_id, playerheading, playerCoords, playerlocation)
                exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~h~Vous avez demenotter une personne.", "")
			else
                exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~y~Aucune personne devant vous.", "")
			end
		elseif item == fouilleItem then
			player, distance = GetClosestPlayer()
			if(distance ~= -1 and distance < 3) then
				TriggerServerEvent("nPolice:Sfouille",GetPlayerServerId(player))
                exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~h~Vous fouiller une personne.", "")
			else
                exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Police: ", "~y~Aucune personne devant vous.", "")
			end
		end
	end

	
end
