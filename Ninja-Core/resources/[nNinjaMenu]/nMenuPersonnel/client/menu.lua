--||@SuperCoolNinja.||--
local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

Myjob = ""
RegisterNetEvent("vMenu:UpdateClientjobs")
AddEventHandler("vMenu:UpdateClientjobs", function(nameJob)
	Myjob = nameJob
end)

RegisterNetEvent('vMenuNotif:showNotification')
AddEventHandler('vMenuNotif:showNotification', function(msg)
	Notify(msg)
end)



--[[
	local x = 0.50
	local y = 0.47
	local width = 1.0
	local height = 1.0
]]
-----------------||Mon Glare||----------------
local x = 0.54
local y = 0.51
local width = 1.2
local height = 1.1

isValidGlare = false
function startGlare()
	scaleform = RequestScaleformMovie("mp_menu_glare")
	PushScaleformMovieFunction(scaleform, "initScreenLayout")
	PopScaleformMovieFunctionVoid()
	DrawScaleformMovie(scaleform, x, y, width, height)
end

----------------------------------|| Mes Variable|| ----------------------------------
active = false
travail = ""
nom = ""
prenom = ""
telephone = ""
isPlayerCuff = false
isPlotValid = false
local cones_deployed = false
local cobj1 = nil
local cobj2 = nil
local cobj3 = nil
local cobj4 = nil
local cobj5 = nil

----------------------------------|| MES FUNCTION ||----------------------------------
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

---------------------------------- ||MES EVENEMENT|| ----------------------------------
local jobs_list = {"Chomeur", "Police"}
RegisterNetEvent('vMenuIdentity:ShowClientIDCard')
AddEventHandler('vMenuIdentity:ShowClientIDCard', function(result)
	active = true
	nom = tostring(result[1].nom)
	prenom = tostring(result[1].prenom)
	travail = tostring(jobs_list[result[1].job])
end)

isPoliceRank = 0
RegisterNetEvent('vPolice:ClientCop')
AddEventHandler('vPolice:ClientCop', function(iscop)
    isPoliceRank = iscop
end)

Citizen.CreateThread(function()
	ped = GetPlayerPed(-1)
	while true do
		Citizen.Wait(0)
		if IsEntityPlayingAnim(ped, "mp_arresting", "idle", 3) then
			isCuffed = true
		elseif isCuffed then
			TaskPlayAnim(ped, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
			DisableControlAction(1, 24, true)
			DisableControlAction(1, 25, true)
			DisableControlAction(1, 59, true)
			DisableControlAction(1, 63, true)
			DisableControlAction(1, 64, true)
			DisableControlAction(1, 123, true)
			DisableControlAction(1, 124, true)
			DisableControlAction(1, 125, true)
			DisableControlAction(1, 133, true)
			DisableControlAction(1, 134, true)
			SetPedCurrentWeaponVisible(ped, false, true, false, false)
		end
	end
end)

RegisterNetEvent("nPolice:MenotterClient")
AddEventHandler("nPolice:MenotterClient", function()
	ped = GetPlayerPed(-1)
	if (DoesEntityExist(ped)) then
		Citizen.CreateThread(function()
		RequestAnimDict("mp_arresting")
			while not HasAnimDictLoaded("mp_arresting") do
				Citizen.Wait(0)
			end
			if isCuffed then
				ClearPedSecondaryTask(ped)
				StopAnimTask(ped, "mp_arresting", "idle", 3)
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0 ,0)
				SetEnableHandcuffs(ped, false)
				isCuffed = false
			else
				TaskPlayAnim(ped, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
				SetPedComponentVariation(GetPlayerPed(-1), 7, 41, 0 ,0)
				SetEnableHandcuffs(ped, true)
				isCuffed = true
			end
		end)
	end
end)

function RenderCarte()
	DrawRect(0.883000000000001, 0.37, 0.190, 0.325, 0,0,0,220) -- Rectangle Background
	DrawAdvancedText2(0.975000000000001, 0.239, 0.005, 0.0028, 0.5, "Identité:", 255, 255, 255, 255, 0, 0)
	
	DrawAdvancedText2(0.897000000000001, 0.290, 0.005, 0.0028, 0.3, "Nom :~b~ "..nom, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.320, 0.005, 0.0028, 0.3, "Prénom : ~b~ "..prenom, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.350, 0.005, 0.0028, 0.3, "Métier :~b~ " ..travail, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.380, 0.005, 0.0028, 0.3, "Permis de voiture :~p~ SOON ", 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.410, 0.005, 0.0028, 0.3, "Permis de port d'armes : ~p~ SOON", 255, 255, 255, 255, 0, 1)
end

function RequestToSave()
	LastPosX, LastPosY, LastPosZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	TriggerServerEvent("vMenuPosition:SavePos", LastPosX , LastPosY , LastPosZ)
	Notify("~g~ Position sauvegarder.")
end

-----||MENU||-----
function AddMainMenu(menu)

	subMenuPaper = _menuPool:AddSubMenu(menu, "Mon Porteuifeuil", "")
	subMenuAction = _menuPool:AddSubMenu(menu, "Intéraction", "")
	SubMenuJobs = _menuPool:AddSubMenu(menu, "Métiers", "")
	local myPosItem = NativeUI.CreateColouredItem("Sauvegarder votre position", "", Colours.Green, Colours.Green)
	menu:AddItem(myPosItem)

	menu.OnItemSelect = function(sender, item, index)
		if item == myPosItem then
			RequestToSave()
        end
    end

	AskIdentity(subMenuPaper)
	AddInteractionMenu(subMenuAction)
	if Myjob == "Police" then
		MainJobsMenu(SubMenuJobs)
	end
end

function AskIdentity(menu)
	local submenu = _menuPool:AddSubMenu(menu.SubMenu, "Mon Identité", "")
    local lookIdentity = NativeUI.CreateItem("Regarder son identité", "")
	submenu.SubMenu:AddItem(lookIdentity)
    local showIdentity = NativeUI.CreateItem("Montrer son identité", "")
    submenu.SubMenu:AddItem(showIdentity)

    submenu.SubMenu.OnItemSelect = function(sender, item, index)
		if item == lookIdentity then
			TriggerServerEvent("vMenuIdentity:ShowServerMeID")
			submenu.SubMenu:Visible(not submenu.SubMenu:Visible())
		elseif item == showIdentity then
			local ClosestPlayerSID = GetPlayerServerId(GetClosestPlayer())
			TriggerServerEvent("vMenuIdentity:ShowServerPeopleID", ClosestPlayerSID)
			submenu.SubMenu:Visible(not submenu.SubMenu:Visible())
        end
    end
end

function AddInteractionMenu(menu)
	local submenu = _menuPool:AddSubMenu(menu.SubMenu, "Menu Action", "")
    local dropWeaponItem = NativeUI.CreateColouredItem("Jeter votre arme", "", Colours.Red, Colours.Red)
	submenu.SubMenu:AddItem(dropWeaponItem)

    submenu.SubMenu.OnItemSelect = function(sender, item, index)
		if item == dropWeaponItem then
			if not IsPedInAnyVehicle(ped, true) and IsPedArmed(ped, 1) or IsPedArmed(ped, 2) or IsPedArmed(ped, 3) or IsPedArmed(ped, 4) or IsPedArmed(ped, 5) or IsPedArmed(ped, 6) or IsPedArmed(ped, 7) then
				local ped = PlayerPedId()
				local wep = GetSelectedPedWeapon(ped)
				SetPedDropsWeaponsWhenDead(ped, true)
				RequestAnimDict("mp_weapon_drop")
				TaskPlayAnim(ped, "mp_weapon_drop", "drop_bh", 8.0, 2.0, -1, 0, 2.0, 0, 0, 0 )
				SetPedDropsInventoryWeapon(ped, wep, 0, 2.0, 0, -1)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
				Notify("~h~Arme ~g~jeter ~w~ au sol.")
				submenu.SubMenu:Visible(not submenu.SubMenu:Visible())
			else
				Notify("~r~Aucun arme sur vous !")
			end
        end
    end
end

function MainJobsMenu(menu)

	local submenu = _menuPool:AddSubMenu(menu.SubMenu, "Intéraction Citoyen", "")
	local subTravau = _menuPool:AddSubMenu(menu.SubMenu, "Gestion Employé", "")

	local cuffItem = NativeUI.CreateCheckboxItem("Menotter", isPlayerCuff, "")
	submenu.SubMenu:AddItem(cuffItem)

	local cadetEItem = NativeUI.CreateItem("Recruter en tant que Cadet", "")
	subTravau.SubMenu:AddItem(cadetEItem)

	local OffiItem = NativeUI.CreateItem("Recruter en tant que Officier", "")
	subTravau.SubMenu:AddItem(OffiItem)

	local SergentiItem = NativeUI.CreateItem("Recruter en tant que Sergent", "")
	subTravau.SubMenu:AddItem(SergentiItem)

	local LieutenantiItem = NativeUI.CreateItem("Recruter en tant que Lieutenant", "")
	subTravau.SubMenu:AddItem(LieutenantiItem)

	local CapitainetiItem = NativeUI.CreateItem("Recruter en tant que Capitaine", "")
	subTravau.SubMenu:AddItem(CapitainetiItem)

	submenu.SubMenu.OnCheckboxChange = function(sender, item, checked_)
		if item == cuffItem then
			player, distance = GetClosestPlayer()
			isPlayerCuff = checked_
			if(distance ~= -1 and distance < 3) then
				TriggerServerEvent("nPolice:MenotterServer", GetPlayerServerId(player))
				Notify("Vous avez menotté une personne.")
			else
				Notify("Aucune personne devant vous")
			end
		end
	end

	subTravau.SubMenu.OnItemSelect = function(sender, item, index)
		if item == cadetEItem then
			player, distance = GetClosestPlayer()
			if(distance ~= -1 and distance < 3) then
				TriggerServerEvent("nPolice:AddCadet", GetPlayerServerId(player))
				Notify("Vous avez promu une personne.")
			else
				Notify("Aucune personne devant vous !")
			end
		elseif item == OffiItem then
			player, distance = GetClosestPlayer()
			if(distance ~= -1 and distance < 3) then
				TriggerServerEvent("nPolice:AddOfficier", GetPlayerServerId(player))
				Notify("Vous avez promu une personne.")
			else
				Notify("Aucune personne devant vous !")
			end
		elseif item == SergentiItem then
			player, distance = GetClosestPlayer()
			if(distance ~= -1 and distance < 3) then
				TriggerServerEvent("nPolice:AddSergent", GetPlayerServerId(player))
				Notify("Vous avez promu une personne.")
			else
				Notify("Aucune personne devant vous !")
			end
		elseif item == LieutenantiItem then
			player, distance = GetClosestPlayer()
			if(distance ~= -1 and distance < 3) then
				TriggerServerEvent("nPolice:AddLieutenant", GetPlayerServerId(player))
				Notify("Vous avez promu une personne.")
			else
				Notify("Aucune personne ne se situe devant vous !")
			end
		elseif item == CapitainetiItem then
			player, distance = GetClosestPlayer()
			if(distance ~= -1 and distance < 3) then
				TriggerServerEvent("nPolice:AddCapitaine", GetPlayerServerId(player))
				Notify("Vous avez promu une personne.")
			else
				Notify("Aucune personne ne se situe devant vous !")
			end
		end
	end
end

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	return closestPlayer, closestDistance
end

function GetPlayers()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

---------------------------------- CITIZEN ----------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if active then
			RenderCarte()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if active then
			Wait(20000) -- FR -- Permet l'affichage pendant 20 secondes -- EN -- Allows display for 20 seconds
			active = false
		end
	end
end)


Citizen.CreateThread(function()
	startGlare()
    while true do
		Citizen.Wait(0)
		if isValidGlare == true then
        	DrawScaleformMovie(scaleform, x, y, width, height)
		end
    end
end)
