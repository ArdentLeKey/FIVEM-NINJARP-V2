--||@SuperCoolNinja.||--

_menuPoolChara = NativeUI.CreatePool()
mainMenuCharacter = NativeUI.CreateMenu("Éditeur de personnage", "~h~NOUVEAU ~b~PERSONNAGE")
_menuPoolChara:Add(mainMenuCharacter)
local interior = nil

RegisterNetEvent("vCharacter:OpenCreatorMenu")
AddEventHandler("vCharacter:OpenCreatorMenu",function()
    EnterCharacterCreator()
end)

RegisterNetEvent("vCharacter:UpdateCustomization")
AddEventHandler("vCharacter:UpdateCustomization",function(skin)
    ChangeSkin(skin)
end)

function ChangeSkin(skin)
	local modelhashed = GetHashKey(skin)
	RequestModel(modelhashed)
	while not HasModelLoaded(modelhashed) do 
	    RequestModel(modelhashed)
	    Citizen.Wait(0)
	end
	SetPlayerModel(PlayerId(), modelhashed)
	SetModelAsNoLongerNeeded(modelhashed)
	TriggerServerEvent("vCharacter:LoadNewCharacter")
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
        TriggerServerEvent("vCharacter:SpawnCharacter")
        TriggerServerEvent("vMenuPosition:SpawnPlayerLastPosition")
		firstspawn = 1
	end
end)

function EnterCharacterCreator()
		SetEntityCoordsNoOffset(PlayerPedId(), 403.006225894, -996.8715, -99.00)
		SetEntityHeading(PlayerPedId(), 182.65637207031)

		interior = GetInteriorAtCoordsWithType(399.9, -998.7, -100.0, "v_mugshot")
		LoadInterior(interior)
		while not IsInteriorReady(interior) do
			Wait(500)
		end

		cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
		while not DoesCamExist(cam) do
			Citizen.Wait(500)
		end

		if DoesCamExist(cam) then
			SetCamCoord(cam, 402.7553, -1000.55, -98.48412)
			SetCamRot(cam, -3.589798, 0.0, -0.276381, 2)
			SetCamFov(cam, 37.95373)

			RenderScriptCams(true, false, 3000, 1, 0, 0)
			FreezeEntityPosition(PlayerPedId(), true)
			DoScreenFadeIn(200)
			hidehud = true
		end

    mainMenuCharacter:Visible(not mainMenuCharacter:Visible())
    IsCharacterCreated = true
end

function AddHeritageSelection(menu)
	local submenu = _menuPoolChara:AddSubMenu(menu, "Hérédité", "Choisissez vos parents.")
	
    local genders = {"Homme", "Femme"}
    local playerPed = PlayerPedId()
    
    local Heritage = NativeUI.CreateHeritageWindow(10, 8)
    submenu.SubMenu:AddWindow(Heritage)

    local females = {"Femme 1", "Femme 2", "Femme3", "Femme4", "Femme5", "Femme6", "Femme7", "Femme8", "Femme9","Femme"}
    local males   = { "Homme1", "Homme2", "Homme3", "Homme4", "Homme5", "Homme6", "Homme7", "Homme8", "Homme9", "Homme10", "Homme11", "Homme12", "Homme13", "Homme14", "Homme15", "Homme16", "Homme17", "Homme18", "Homme19", "Homme20", "Homme21"}    
    Mum = 10
    Dad = 9
    skinTone = 0

    momList = NativeUI.CreateListItem(GetLabelText("FACE_MUMS"), females, 1, GetLabelText("CHARC_H_30"))
    submenu.SubMenu:AddItem(momList)

    dadList = NativeUI.CreateListItem(GetLabelText("FACE_DADS"), males, 1, GetLabelText("CHARC_H_31"))
    submenu.SubMenu:AddItem(dadList)

    submenu.SubMenu.OnListChange = function(sender, item, index)
        if item == momList then
            Mum = index
        elseif item == dadList then
            Dad = index
        end

        Heritage:Index(Mum, Dad)
       -- SetPedHeadBlendData(PlayerPedId(), 0, math.random(12), 0,math.random(12), Mum, Dad,1.0,1.0,1.0,true)
        SetPedHeadBlendData(PlayerPedId(), Dad, Mum, nil, skinTone * Dad, skinTone * Mum, 1.0, 1.0, skinTone, nil, true)
         while not HasPedHeadBlendFinished(PlayerPedId()) do
            Wait(500)
        end
    end

    local amount = {}
    
    for i = 1, 10 do 
    	amount[i] = i
    end

    local SkintItem = NativeUI.CreateSliderItem("Couleur de peau", amount, 1, "Déterminez les quels des deux qui ont le plus d'influence sur la couleur de votre peau.")
    submenu.SubMenu:AddItem(SkintItem)
    
    submenu.SubMenu.OnSliderChange = function(sender, item, index)
       if item == SkintItem then
            skinTone = index
        end
       -- SetPedHeadBlendData(GetPlayerPed(-1), Dad, Mum, nil, skinTone * Dad, skinTone * Mum, skinTone, Dad * Mum, skinTone, nil, true)
        SetPedHeadBlendData(PlayerPedId(), Dad, Mum, nil, skinTone * Dad, skinTone * Mum, 1.0, 1.0, skinTone, nil, true)
    end
end



function AddMenuLocation(menu)
	local genders = {GetLabelText("FACE_MALE"), GetLabelText("FACE_FEMALE")}
    local newitem = NativeUI.CreateListItem(GetLabelText("FACE_SEX"), genders, 1, GetLabelText("FACE_MM_H2"))

    menu:AddItem(newitem)
    menu.OnListChange = function(sender, item, index)
        if item == newitem then
    	    SelectedItem = newitem:IndexToItem(index)
    	    if SelectedItem == GetLabelText("FACE_MALE") then
                ChangeSkin("mp_m_freemode_01")
                TriggerServerEvent("vCharacter:UpdateGender","mp_m_freemode_01")
                SetEntityCoordsNoOffset(PlayerPedId(), 403.006225894, -996.8715, -99.00)
		        SetEntityHeading(PlayerPedId(), 182.65637207031)
    	    else
                ChangeSkin("mp_f_freemode_01")
                TriggerServerEvent("vCharacter:UpdateGender","mp_f_freemode_01")
                SetEntityCoordsNoOffset(PlayerPedId(), 403.006225894, -996.8715, -99.00)
		        SetEntityHeading(PlayerPedId(), 182.65637207031)
    	    end
    	end
    end
end

function AddAppearanceSelection(menu)
    local submenu = _menuPoolChara:AddSubMenu(menu, GetLabelText("FACE_APP"), GetLabelText("FACE_MM_H6"))
    if IsPedMale(PlayerPedId()) then
        hairstyles = { GetLabelText("CC_M_HS_1"), GetLabelText("CC_M_HS_2"), GetLabelText("CC_M_HS_3"), GetLabelText("CC_M_HS_4"),
                       GetLabelText("CC_M_HS_5"), GetLabelText("CC_M_HS_6"), GetLabelText("CC_M_HS_7"),
                       GetLabelText("CC_M_HS_8"), GetLabelText("CC_M_HS_9"), GetLabelText("CC_M_HS_10"),
                       GetLabelText("CC_M_HS_11"), GetLabelText("CC_M_HS_12"), GetLabelText("CC_M_HS_13"),
                       GetLabelText("CC_M_HS_14"), GetLabelText("CC_M_HS_15"), GetLabelText("CC_M_HS_16"),
                       GetLabelText("CC_M_HS_17"), GetLabelText("CC_M_HS_18"), GetLabelText("CC_M_HS_19"),
                       GetLabelText("CC_M_HS_20"), GetLabelText("CC_M_HS_21"), GetLabelText("CC_M_HS_22")
                    }
    else
        hairstyles = { GetLabelText("CC_F_HS_1"), GetLabelText("CC_F_HS_2"), GetLabelText("CC_F_HS_3"),
                       GetLabelText("CC_F_HS_4"), GetLabelText("CC_F_HS_5"), GetLabelText("CC_F_HS_6"),
                       GetLabelText("CC_F_HS_7"), GetLabelText("CC_F_HS_8"), GetLabelText("CC_F_HS_9"),
                       GetLabelText("CC_F_HS_10"), GetLabelText("CC_F_HS_11"), GetLabelText("CC_F_HS_12"),
                       GetLabelText("CC_F_HS_13"), GetLabelText("CC_F_HS_14"), GetLabelText("CC_F_HS_15"),
                       GetLabelText("CC_F_HS_16"), GetLabelText("CC_F_HS_17"), GetLabelText("CC_F_HS_18"),
                       GetLabelText("CC_F_HS_19"), GetLabelText("CC_F_HS_20"), GetLabelText("CC_F_HS_21"),
                       GetLabelText("CC_F_HS_22"), GetLabelText("CC_F_HS_23")
                   }
    end

    local HairItem = NativeUI.CreateListItem(GetLabelText("FACE_HAIR"), hairstyles, 1, GetLabelText("FACE_APP_H"))
    submenu.SubMenu:AddItem(HairItem)
    hairId = 0
    cheveuxCouleur = 0

    submenu.SubMenu.OnListChange = function(sender, item, index)
        if item == HairItem then
            hairId = index
            SetPedComponentVariation(PlayerPedId(), 2, hairId, 2, 0)
        end
    end

    local amount = {}
    
    for i = 1, 10 do 
    	amount[i] = i
    end

    local hColors = NativeUI.CreateSliderItem("Couleur", amount, 1, "Déterminez la couleur de vos cheveux.")
    submenu.SubMenu:AddItem(hColors)
    
    submenu.SubMenu.OnSliderChange = function(sender, item, index)
       if item == hColors then
            cheveuxCouleur = index
        end
        SetPedHairColor(GetPlayerPed(-1),cheveuxCouleur-1,0)	
    end
end

function AddSaveSelection(menu)
	local saveItem = NativeUI.CreateColouredItem("Sauvegarder et continuer", "", Colours.Blue, Colours.BlueDark)
    menu:AddItem(saveItem)
	
	menu.OnItemSelect = function(menu, item)
		if item == saveItem then
			if DoesCamExist(cam) then
            	RenderScriptCams(false, false, 3000, 1, 0, 0)
            	FreezeEntityPosition(PlayerPedId(), false)
            	DestroyCam(cam, true)
            end
            
            local joinCoords = vector3(-1044.645, -2749.844, 21.36343-1.0)

            if not IsScreenFadedOut() then
                DoScreenFadeOut(400)
                while not IsScreenFadedOut() do
                    Wait(50)
                end
            end

        	SetEntityCoords(PlayerPedId(), -1044.645, -2749.844, 21.36343-1.0)
        	SetEntityHeading(PlayerPedId(), 328.147)        	           
            while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
                Wait(1)
            end
            TriggerServerEvent("updateSkin", skinTone, Dad, Mum, hairId, cheveuxCouleur)
			mainMenuCharacter:Visible(false)

            if IsScreenFadedOut() then
                Wait(500)
                DoScreenFadeIn(300)
                Wait(400)
            end

        	SimulatePlayerInputGait(PlayerId(), 1.0, 8500, 1.0, 1, 0)
        	hidehud = false
		end
	end
end

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

RegisterNetEvent("vCharacter:updatePerso")
AddEventHandler("vCharacter:updatePerso",function(args)
    Notify("~h~Bienvenue sur ~b~Ninja Rôle-Play ~p~ VII!")
	skinTone = tonumber(args[1])
	Dad = tonumber(args[2])
    Mum = tonumber(args[3])
    hairId = tonumber(args[4])
    cheveuxCouleur = tonumber(args[5])
    --SetPedHeadBlendData(GetPlayerPed(-1), Dad, Mum, 0, skinTone * Dad, skinTone * Mum, skinTone, Dad * Mum, skinTone, 0, true)
    SetPedHeadBlendData(PlayerPedId(), Dad, Mum, nil, skinTone * Dad, skinTone * Mum, 1.0, 1.0, skinTone, nil, true)
    SetPedComponentVariation(PlayerPedId(), 2, hairId, 2, 0)
    SetPedHairColor(GetPlayerPed(-1),cheveuxCouleur-1,0)
end)



AddMenuLocation(mainMenuCharacter)
AddHeritageSelection(mainMenuCharacter)
AddAppearanceSelection(mainMenuCharacter)
AddSaveSelection(mainMenuCharacter)
_menuPoolChara:MouseEdgeEnabled(false);
_menuPoolChara:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if NetworkIsGameInProgress() and IsPlayerPlaying(PlayerId()) then
            if IsCharacterCreated then
                if _menuPoolChara:IsAnyMenuOpen() then
                    _menuPoolChara:ProcessMenus()
                end

                if DoesCamExist(cam) and not IsPlayerSwitchInProgress() then
                    if not _menuPoolChara:IsAnyMenuOpen() then
                        mainMenuCharacter:Visible(not mainMenuCharacter:Visible())
                    end
                end
            end
        end
    end
end)

--[[ 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPoolChara:ProcessMenus()
        if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
			EnterCharacterCreator()
        end
    end
end)]]