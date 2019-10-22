local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local nameInput, prenomInput,tailleInput,dateInput = nil, nil, nil, nil

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

_menuPoolidentity = NativeUI.CreatePool()
mainMenuIdentity = NativeUI.CreateMenu("Éditeur d'identité","")
_menuPoolidentity:Add(mainMenuIdentity)

function addidentityMenu(menu)
    local identitySub = _menuPoolidentity:AddSubMenu(menu, "Votre Identité")

    local persoItem = NativeUI.CreateItem("Votre Perso: ", "")
    menu:AddItem(persoItem)

    local nameItem = NativeUI.CreateItem("Votre Nom: ", "~h~Veuillez saisir votre nom commençant par une lettre Majuscule.")
    identitySub.SubMenu:AddItem(nameItem)
    

    local prenItem = NativeUI.CreateItem("Votre Prénom: ", "~h~Veuillez saisir votre prénom commençant par une lettre Majuscule.")
    identitySub.SubMenu:AddItem(prenItem)
    

    local tailleItem = NativeUI.CreateItem("Votre Taille: ", "~h~Exemple 180 qui est égal à 1 mètre 80")
    identitySub.SubMenu:AddItem(tailleItem)
    

    local birdItem = NativeUI.CreateItem("Votre Âge: ", "")
    identitySub.SubMenu:AddItem(birdItem)

   
    local saveIdenItem = NativeUI.CreateColouredItem("Valider votre identité", "", Colours.GreenDark, Colours.Green)
    identitySub.SubMenu:AddItem(saveIdenItem)

    menu.OnItemSelect = function(menu, item)
        if item == persoItem then
            EnterCharacterCreator()
            _menuPoolidentity:CloseAllMenus(true)
        end
    end

    identitySub.SubMenu.OnItemSelect = function(menu, item)
        if item == nameItem then
            local nameInput = KeyboardInput("Votre Nom :", "", 10)
            if tostring(nameInput) == nil then
                Notify("Veuillez inserer un nom correct !")
                return nil
            end
            nameItem:RightLabel(tostring(nameInput))
            TriggerServerEvent("nIdentity:UpdateName", tostring(nameInput))
        elseif item == prenItem then
            local prenomInput = KeyboardInput("Votre Prénom :", "", 10)
            if tostring(prenomInput) == nil then
                Notify("Veuillez inserer un prenom correct !")
                return nil
            end
            prenItem:RightLabel(tostring(prenomInput))
            TriggerServerEvent("nIdentity:UpdatePrenom", tostring(prenomInput))
        elseif item == tailleItem then
            local tailleInput = KeyboardInput("Votre Taille :", "", 3)
            if tonumber(tailleInput) == nil then
                Notify("Veuillez inserer un nombre correct !")
                return nil
            end
            tailleItem:RightLabel(tailleInput)
            TriggerServerEvent("nIdentity:UpdateTaille", tonumber(tailleInput))
        elseif item == birdItem then
            local dateInput = KeyboardInput("Âge :", "", 2)
            if tonumber(dateInput) == nil then
                Notify("Veuillez inserer un nombre correct !")
                return nil
            end
            birdItem:RightLabel(dateInput .." ans")
            TriggerServerEvent("nIdentity:UpdateAge", tonumber(dateInput))
        elseif item == saveIdenItem then
            EnterCharacterCreator()
            _menuPoolidentity:CloseAllMenus(true)
        end
    end
end

addidentityMenu(mainMenuIdentity)
_menuPoolidentity:RefreshIndex()

RegisterNetEvent("vCharacter:OpenIdentityMenu")
AddEventHandler("vCharacter:OpenIdentityMenu",function()
    openIdentityMenu()
end)

function openIdentityMenu()
    mainMenuIdentity:Visible(not mainMenuIdentity:Visible())
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if _menuPoolidentity:IsAnyMenuOpen() then
            _menuPoolidentity:ProcessMenus()
        end
    end
end)

