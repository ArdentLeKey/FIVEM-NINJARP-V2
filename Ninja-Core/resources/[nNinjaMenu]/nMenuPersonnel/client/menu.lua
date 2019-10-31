--||@SuperCoolNinja.||--


----------||MES VARIABLE||--------
local active = false
local travail = ""
local nom = ""
local prenom = ""
local telephone = ""
local age = ""
local isHudMoney = false
local Myjob = ""
copRank = 0
medicRank = 0
local jobs_list = {"Chomeur", "Police", "Ambulancier"} --Ajouté votre nouveau job ici pour l'afficher sur le system de carte identité'

local holdingHostageInProgress = false
local hostageAllowedWeapons = { --Arme listé pour prendre en otage une personne
	"WEAPON_PISTOL",
	"WEAPON_COMBATPISTOL",
}

local animations = {
	take = {
		source = {
			dictionary = "anim@gangops@hostage@",
			animation = "perp_idle",
			flag = 49,
			length = 100000,
		},
		target = {
			dictionary = "anim@gangops@hostage@",
			animation = "victim_idle",
			flag = 49,
			length = 100000,			
		},
	},
	kill = {
		source = {
			dictionary = "anim@gangops@hostage@",
			animation = "perp_fail",
			flag = 168,
			length = 0.2,
		},
		target = {
			dictionary = "anim@gangops@hostage@",
			animation = "victim_fail",
			flag = 0,
			length = 0.2,			
		},
	},
	release = {
		source = {
			dictionary = "reaction@shove",
			animation = "shove_var_a",
			flag = 120,
			length = 100000,
		},
		target = {
			dictionary = "reaction@shove",
			animation = "shoved_back",
			flag = 0,
			length = 100000,			
		},
	},
}
local attachment = {
	offset = vector3(-0.24, 0.11, 0.0),
	rotation = vector3(0.5, 0.5, 0.0),
}


----------||MES EVENT||--------
RegisterNetEvent("vMenu:UpdateClientjobs")
AddEventHandler("vMenu:UpdateClientjobs", function(nameJob)
	Myjob = nameJob
end)

RegisterNetEvent('cl-cop')
AddEventHandler('cl-cop', function(iscop)
    copRank = iscop
end)

RegisterNetEvent('nMedics:cRefresh')
AddEventHandler('nMedics:cRefresh', function(ismedic)
	medicRank = ismedic
end)

RegisterNetEvent('vMenuIdentity:ShowClientIDCard')
AddEventHandler('vMenuIdentity:ShowClientIDCard', function(result)
	active = true
	nom = tostring(result[1].nom)
	prenom = tostring(result[1].prenom)
	travail = tostring(jobs_list[result[1].job])
	age = tonumber(result[1].age)
end)

RegisterNetEvent('bank:givecash')
AddEventHandler('bank:givecash', function(toPlayer, amount)
    TriggerServerEvent("bank:givecash", toPlayer, tonumber(amount))
end)

RegisterNetEvent('cmg3_animations:syncTarget')
AddEventHandler('cmg3_animations:syncTarget', function(target, animation, attach)
	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	if holdingHostageInProgress then 
		holdingHostageInProgress = false 
	else 
		holdingHostageInProgress = true
	end
	if beingHeldHostage then 
		beingHeldHostage = false 
	else 
		beingHeldHostage = true 
	end  
	RequestAnimDict(animation.dictionary)

	while not HasAnimDictLoaded(animation.dictionary) do
		Citizen.Wait(10)
	end

	if attach then 
		AttachEntityToEntity(playerPed, targetPed, 0, attachment.offset.x, attachment.offset.y, attachment.offset.z, attachment.rotation.x, attachment.rotation.y, attachment.rotation.z, false, false, false, false, 2, false)
	end

	if animation.animation == "victim_fail" then 
		SetEntityHealth(playerPed, 0)
		TaskPlayAnim(playerPed, animation.dictionary, animation.animation, 8.0, -8.0, animation.length, animation.flag, 0, false, false, false)
		beingHeldHostage = false 
		holdingHostageInProgress = false 
	elseif animation.animation == "shoved_back" then 
		holdingHostageInProgress = false 
		TaskPlayAnim(playerPed, animation.dictionary, animation.animation, 8.0, -8.0, animation.length, animation.flag, 0, false, false, false)
		beingHeldHostage = false 
	else
		TaskPlayAnim(playerPed, animation.dictionary, animation.animation, 8.0, -8.0, animation.length, animation.flag, 0, false, false, false)
		beingHeldHostage = false	
	end
end)

RegisterNetEvent('cmg3_animations:syncMe')
AddEventHandler('cmg3_animations:syncMe', function(animation)
	local playerPed = PlayerPedId()
	ClearPedSecondaryTask(playerPed)
	RequestAnimDict(animation.dictionary)
	while not HasAnimDictLoaded(animation.dictionary) do
		Citizen.Wait(10)
	end

	TaskPlayAnim(playerPed, animation.dictionary, animation.animation, 8.0, -8.0, animation.length, animation.flag, 0, false, false, false)
	if animation == "perp_fail" then 
		SetPedShootsAtCoord(playerPed, 0.0, 0.0, 0.0, 0)
		holdingHostageInProgress = false 
	end
	if animation == "shove_var_a" then 
		Wait(900)
		ClearPedSecondaryTask(playerPed)
		holdingHostageInProgress = false 
	end
end)

RegisterNetEvent('cmg3_animations:cl_stop')
AddEventHandler('cmg3_animations:cl_stop', function()
	local playerPed = PlayerPedId()
	holdingHostageInProgress = false
	beingHeldHostage = false 
	holdingHostage = false 
	ClearPedSecondaryTask(playerPed)
	DetachEntity(playerPed, true, false)
end)

function GetClosestPlayer(radius)
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed, false)

    for i = 1, #players do
        local targetPed = GetPlayerPed(players[i])
        if playerPed ~= targetPed then
            local targetCoords = GetEntityCoords(targetPed, false)
            local distance = #(playerCoords - targetCoords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
            end
        end
    end

	if closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end

Citizen.CreateThread(function()
	while true do 
		if holdingHostage then
			local playerPed = PlayerPedId()
			if IsEntityDead(playerPed) then	
				holdingHostage = false
				holdingHostageInProgress = false 
				local closestPlayer = GetClosestPlayer(2)
				local targetId = GetPlayerServerId(closestPlayer)
				TriggerServerEvent("cmg3_animations:stop", targetId)
				Wait(100)
				releaseHostage()
			end
			DisableControlAction(0,24,true) -- disable attack
			DisableControlAction(0,25,true) -- disable aim
			DisableControlAction(0,47,true) -- disable weapon
			DisableControlAction(0,58,true) -- disable weapon
			DisablePlayerFiring(playerPed, true)
			local playerCoords = GetEntityCoords(playerPed)
			if GetLastInputMethod(0) then
				drawNativeNotification("~g~ ~INPUT_VEH_DUCK~ ~w~pour ~b~LIBERER ~g~ ~INPUT_MP_TEXT_CHAT_ALL~ ~w~pour ~r~TUER")
			else
				drawNativeNotification("~g~ ~INPUT_SCRIPT_LB~ ~w~pour ~b~LIBERER ~g~ ~INPUT_SCRIPT_RB~ ~w~pour ~r~TUER")
			end
			if IsDisabledControlJustPressed(0,73) or IsDisabledControlJustPressed(0,226) then --release		
				holdingHostage = false
				holdingHostageInProgress = false 
				local closestPlayer = GetClosestPlayer(2)
				local targetId = GetPlayerServerId(closestPlayer)
				TriggerServerEvent("cmg3_animations:stop", targetId)
				Wait(100)
				releaseHostage()
			elseif IsDisabledControlJustPressed(0,309) or IsDisabledControlJustPressed(0,227) then --kill 			
				holdingHostage = false
				holdingHostageInProgress = false 		
				local closestPlayer = GetClosestPlayer(2)
				local targetId = GetPlayerServerId(closestPlayer)
				TriggerServerEvent("cmg3_animations:stop", targetId)				
				killHostage()
			end
		end
		if beingHeldHostage then 
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
			DisableControlAction(0,22,true) -- disable jump
			DisableControlAction(0,32,true) -- disable move up
			DisableControlAction(0,268,true)
			DisableControlAction(0,33,true) -- disable move down
			DisableControlAction(0,269,true)
			DisableControlAction(0,34,true) -- disable move left
			DisableControlAction(0,270,true)
			DisableControlAction(0,35,true) -- disable move right
			DisableControlAction(0,271,true)
		end
		Wait(0)
	end
end)

function drawNativeNotification(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function releaseHostage()
	local closestPlayer = GetClosestPlayer(2)
	local targetId = GetPlayerServerId(closestPlayer)
	if closestPlayer ~= nil then
		TriggerServerEvent('cmg3_animations:sync', targetId, animations.release, false)
	end
end 

function killHostage()
	local closestPlayer = GetClosestPlayer(2)
	local targetId = GetPlayerServerId(closestPlayer)
	if closestPlayer ~= nil then
		TriggerServerEvent('cmg3_animations:sync', targetId, animations.kill, false)
	end	
end 


---------------------------------- ||MES FUNCTION|| ----------------------------------
local function RenderCarte()
	DrawRect(0.883000000000001, 0.37, 0.190, 0.325, 0, 0, 0, 220)
	DrawAdvancedText2(0.975000000000001, 0.239, 0.005, 0.0028, 0.5, "Carte d'identitée", 255, 255, 255, 255, 0, 0)
	
	DrawAdvancedText2(0.897000000000001, 0.290, 0.005, 0.0028, 0.3, "Nom :~b~ "..nom, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.320, 0.005, 0.0028, 0.3, "Prénom :~b~ "..prenom, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.350, 0.005, 0.0028, 0.3, "Âge :~b~ "..age.."~w~ ans", 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.380, 0.005, 0.0028, 0.3, "Métier :~b~ "..travail, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.410, 0.005, 0.0028, 0.3, "Permis Voiture : ~p~ SOON ", 255, 255, 255, 255, 0, 1)
end

local function RequestToSave()
	LastPosX, LastPosY, LastPosZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	TriggerServerEvent("vMenuPosition:SavePos", LastPosX , LastPosY , LastPosZ)
	exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Synchronisation", "~g~ Position Sauvegarder ~w~.", "")
end

-----||MENU||-----
function AddMainMenu(menu)
	__AddMenuInventaire(mainMenu)
	
	local subMenuPaper = _menuPool:AddSubMenu(menu, "Mon Porteuifeuil", "")
	local subMenuAction = _menuPool:AddSubMenu(menu, "Intéraction", "")
	
	local SubMenuUI = _menuPool:AddSubMenu(menu, "HUD", "")
	local myPosItem = NativeUI.CreateColouredItem("Sauvegarder votre position", "", Colours.Green, Colours.Green)
	menu:AddItem(myPosItem)

	menu.OnItemSelect = function(sender, item, index)
		if item == myPosItem then
			_menuPool:CloseAllMenus(true)
			RequestToSave()
        end
	end

	AskIdentity(subMenuPaper)
	AddInteractionMenu(subMenuAction)
	AddUIMenu(SubMenuUI)

	if Myjob == "Police" then
		subMenuWork = _menuPool:AddSubMenu(menu, "~b~Intéractions Police", "")
		__AddMenuPoliceJob(subMenuWork)
	end

	if Myjob == "Ambulancier" then
		subMedicWork = _menuPool:AddSubMenu(menu, "~b~Intéractions Ambulancier", "")
		__AddMenuMedicJob(subMedicWork)
	end
	
end


local function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
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

function AskIdentity(menu)
	something, CashAmount = StatGetInt("MP0_WALLET_BALANCE",-1)
	local subCash = _menuPool:AddSubMenu(menu.SubMenu, "Cash: "..CashAmount .. "~g~$  ", "")
	local submenu = _menuPool:AddSubMenu(menu.SubMenu, "Mon Identité", "")

	-------||Selection ARGENT||--------
	local giveMItem = NativeUI.CreateItem("Donner de l'argent", "")
	subCash.SubMenu:AddItem(giveMItem)


	-------||Selection IDENTITY||--------
    local lookIdentity = NativeUI.CreateItem("Regarder son identité", "")
	submenu.SubMenu:AddItem(lookIdentity)
    local showIdentity = NativeUI.CreateItem("Montrer son identité", "")
	submenu.SubMenu:AddItem(showIdentity)
	
	-------||Selection ARGENT||--------
	subCash.SubMenu.OnItemSelect = function(sender, item, index)
		if item == giveMItem then
			player, distance = GetClosestPlayer()
			if(distance ~= -1 and distance < 3) then
				local moneyQuant = KeyboardInput("Somme d'argent à donner :", "", 4)
				TriggerServerEvent("nArgent:sDonner", GetPlayerServerId(player), moneyQuant) --A TESTER
				subCash.SubMenu:Visible(not subCash.SubMenu:Visible())
			else
				exports.nCoreStuff:nNotificationMain({
					text = "~y~Aucune personne devant vous.",
					type = 'basGauche',
					nTimeNotif = 60000,
				})
			end
        end
    end

	-------||Selection IDENTITY||--------
    submenu.SubMenu.OnItemSelect = function(sender, item, index)
		if item == lookIdentity then
			TriggerServerEvent("vMenuIdentity:ShowServerMeID")
			submenu.SubMenu:Visible(not submenu.SubMenu:Visible())
		elseif item == showIdentity then
			player, distance = GetClosestPlayer()
			if(distance ~= -1 and distance < 3) then
				TriggerServerEvent("vMenuIdentity:ShowServerPeopleID", GetPlayerServerId(player))
				submenu.SubMenu:Visible(not submenu.SubMenu:Visible())
			else
				exports.nCoreStuff:nNotificationMain({
					text = "~y~Aucune personne devant vous.",
					type = 'basGauche',
					nTimeNotif = 60000,
				})
			end
        end
	end
end

function AddInteractionMenu(menu)
	local submenu = _menuPool:AddSubMenu(menu.SubMenu, "Menu Action", "")

	local hotageItem = NativeUI.CreateItem("Prendre une personne en otage", "")
	submenu.SubMenu:AddItem(hotageItem)

	local ragItem = NativeUI.CreateItem("Tomber dans les pommes", "")
	submenu.SubMenu:AddItem(ragItem)

	local dropWeaponItem = NativeUI.CreateColouredItem("Jeter votre arme", "", Colours.Red, Colours.Red)
	submenu.SubMenu:AddItem(dropWeaponItem)

	submenu.SubMenu.OnItemSelect = function(sender, item, index)
		if item == hotageItem then
			player, distance = GetClosestPlayer()
			if(distance ~= -1 and distance < 2) then
				_menuPool:CloseAllMenus(true)
				mainMenu:Clear()
				Citizen.Wait(100)
				_menuPool:RefreshIndex()

				local playerPed = PlayerPedId()
				local canTakeHostage = false
				local weapon = nil

				ClearPedSecondaryTask(playerPed)
				DetachEntity(playerPed, true, false)

				for i = 1, #hostageAllowedWeapons do
					if HasPedGotWeapon(playerPed, hostageAllowedWeapons[i], false) then
						canTakeHostage = true 
						weapon = hostageAllowedWeapons[i]
						break
					end
				end

				if not canTakeHostage then 
					exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("Vous devez avoir une arme sur vous !")
				end

				if not holdingHostageInProgress and canTakeHostage then		
					local closestPlayer = GetClosestPlayer(2)
					local targetId = GetPlayerServerId(closestPlayer)

					if closestPlayer ~= nil then
						SetCurrentPedWeapon(playerPed, weapon, true)
						holdingHostageInProgress = true
						holdingHostage = true 
						TriggerServerEvent('cmg3_animations:sync', targetId, animations.take, true)
					else
						exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("Aucune personne devant vous !")
					end 
				end
				canTakeHostage = false 
			else
				exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("Aucune personne devant vous !")
			end

		elseif item == dropWeaponItem then
			local ped = PlayerPedId()
			local wep = GetSelectedPedWeapon(ped)

			if (IsPedArmed(ped, 7)) then
				ClearPedTasks(ped)
				playAnim("weapons@first_person@aim_rng@generic@projectile@sticky_bomb@", "plant_floor")
				Citizen.Wait(1000)
				SetPedDropsInventoryWeapon(ped, GetSelectedPedWeapon(ped), 0.0, 0.6, -0.9, 30)
				ClearPedTasks(ped)
				exports.nCoreStuff:nNotificationMain({
					text = "~h~Arme ~g~jeter ~w~ au sol.",
					type = 'basGauche',
					nTimeNotif = 60000,
				})
			else
				exports.nCoreStuff:nNotificationMain({
					text = "~y~Aucune arme sur vous !",
					type = 'basGauche',
					nTimeNotif = 60000,
				})
			end

		elseif item == ragItem then
			ragdol = true
			setRagdoll(true)
        end
    end
end

local ragdoll = false
function setRagdoll(flag)
  ragdoll = flag
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
	if ragdoll then
		if GetLastInputMethod(0) then
			exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("Appuyé sur ~INPUT_JUMP~ pour vous ~b~relever")
		else
			exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("Appuyé sur ~INPUT_JUMP~ pour vous ~b~relever")
		end
		if IsControlPressed(1, 22) then
			setRagdoll(false)
		end
      SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
    end
  end
end)


function AddUIMenu(menu)
	local submenu = _menuPool:AddSubMenu(menu.SubMenu, "Action HUD", "")
	local hudMItem = NativeUI.CreateCheckboxItem("HUD ON/OFF", isHudMoney, "")
	submenu.SubMenu:AddItem(hudMItem)
	
	submenu.SubMenu.OnCheckboxChange = function(sender, item, checked_)
		if item == hudMItem then
			isHudMoney = checked_
			if isHudMoney == true then
				DisplayHud(false)
				DisplayRadar(false)
				isHudMoney = false
			elseif isHudMoney == false then
				DisplayHud(true)
				DisplayRadar(true)
				isHudMoney = true
			end
		end
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlPressed(1, 21) and not blockinput then -- RB  --A
			if IsControlJustReleased(1, 73) then  --A
			player, distance = GetClosestPlayer()
			if(distance ~= -1 and distance < 2) then
	
				local playerPed = PlayerPedId()
				local canTakeHostage = false
				local weapon = nil
	
				ClearPedSecondaryTask(playerPed)
				DetachEntity(playerPed, true, false)
	
				for i = 1, #hostageAllowedWeapons do
					if HasPedGotWeapon(playerPed, hostageAllowedWeapons[i], false) then
						canTakeHostage = true 
						weapon = hostageAllowedWeapons[i]
						break
					end
				end
	
				if not canTakeHostage then 
					exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("Vous devez avoir une arme sur vous !")
				end
			
					if not holdingHostageInProgress and canTakeHostage then		
						local closestPlayer = GetClosestPlayer(2)
						local targetId = GetPlayerServerId(closestPlayer)
		
						if closestPlayer ~= nil then
							SetCurrentPedWeapon(playerPed, weapon, true)
							holdingHostageInProgress = true
							holdingHostage = true 
							TriggerServerEvent('cmg3_animations:sync', targetId, animations.take, true)
						else
							exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("Aucune personne devant vous !")
						end 
					end
						canTakeHostage = false 
					else
						exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("Aucune personne devant vous !")
					end
				end
			end
		end
	end)

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

function GetOwnerName(id)
    local playername = 0

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            if GetPlayerServerId(i) == id then
				playername = GetPlayerName(i)
			end
        end
    end
    return playername
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
			Wait(20000) --Permet l'affichage pendant 20 secondes
			active = false
		end
	end
end)