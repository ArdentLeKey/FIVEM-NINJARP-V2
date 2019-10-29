--||@SuperCoolNinja.||--
indexInv = 1

RegisterNetEvent("nInventaire:CEau")
AddEventHandler("nInventaire:CEau",  function(indexInv)
    TriggerEvent("player:receiveItem", 1, indexInv)
    exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Vendeur: ", "", " + "..indexInv .." ~b~Eau")
end)

RegisterNetEvent("nInventaire:CPain")
AddEventHandler("nInventaire:CPain",  function(itemNombre)
    TriggerEvent("player:receiveItem", 2, itemNombre)
    exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Vendeur: ", "", " + "..indexInv .." ~b~Pain")
end)

RegisterNetEvent("nInventaire:CPhone")
AddEventHandler("nInventaire:CPhone",  function(indexInv)
    TriggerEvent("player:receiveItem", 3, indexInv)
    exports.nCoreStuff:Ninja_Core__ShowNinjaNotification("Vendeur: ", "", " + "..indexInv .." ~b~Phone")
end)

function AddShopsMenu(menu)
    foodcat = _menuPool:AddSubMenu(menu, "Nourriture")
    itemCat = _menuPool:AddSubMenu(menu, "Multimédia")

    local itemNombre = {}

    for i = 1, 10, 1 do
        table.insert(itemNombre, i)
    end
    
    -------------------||CATEGORIE FOOD||--------------------
    local proWater = NativeUI.CreateListItem("Eau ~g~5$", itemNombre, 1)
    foodcat.SubMenu:AddItem(proWater)

    local proPain = NativeUI.CreateListItem("Pain ~g~5$", itemNombre, 1)
    foodcat.SubMenu:AddItem(proPain)

    -------------------||CATEGORIE Multimédia||--------------------
    local proPhone = NativeUI.CreateListItem("Téléphone ~g~5$", itemNombre, 1)
    itemCat.SubMenu:AddItem(proPhone)


    -------------------||CATEGORIE SELECTION||--------------------
    local buyItem = NativeUI.CreateItem("Acheter", '')
	choiceMenu:AddItem(buyItem)

	local backItem = NativeUI.CreateItem("Annuler", '')
    choiceMenu:AddItem(backItem)
    
	foodcat.SubMenu.OnListSelect = function(sender, item, index)
        _menuPool:CloseAllMenus(true)
        choiceMenu:Visible(true)
        if item == proWater then
            indexInv = item:IndexToItem(index)
            choiceMenu.OnItemSelect = function(sender, item, index)
                if item == buyItem then
                    _menuPool:CloseAllMenus(true)
                    TriggerServerEvent("nInventaire:SEau", indexInv)
                elseif item == backItem then
                    _menuPool:CloseAllMenus(true)
                end
            end
        elseif item == proPain then
            indexInv = item:IndexToItem(index)
            choiceMenu.OnItemSelect = function(sender, item, index)
                if item == buyItem then
                    _menuPool:CloseAllMenus(true)
                    TriggerServerEvent("nInventaire:SPain", indexInv)
                elseif item == backItem then
                    _menuPool:CloseAllMenus(true)
                end
            end
        end
    end

    itemCat.SubMenu.OnListSelect = function(sender, item, index)
        _menuPool:CloseAllMenus(true)
        choiceMenu:Visible(true)
        if item == proPhone then
            indexInv = item:IndexToItem(index)
            choiceMenu.OnItemSelect = function(sender, item, index)
                if item == buyItem then
                    _menuPool:CloseAllMenus(true)
                    TriggerServerEvent("nInventaire:SPhone", indexInv)
                elseif item == backItem then
                    _menuPool:CloseAllMenus(true)
                end
            end
        end
    end
end
