local menuIsOpen = 0

RegisterNetEvent("nMenu:showRegisterItentity")
AddEventHandler("nMenu:showRegisterItentity", function()
  openGuiRegisterIdentity()
end)

RegisterNUICallback('register', function(data, cb)
    closeGui()
    TriggerServerEvent('nMenu:setIdentity', data)
    cb()
end)

--====================================================================================
--  Gestion UI
--====================================================================================
function openGuiIdentity(data)
  SendNUIMessage({method = 'openGuiIdentity',  data = data})
  menuIsOpen = 1
end

function openGuiLicenceCar(data)
  SendNUIMessage({method = 'openGuiLicenceCar',  data = data})
  menuIsOpen = 1
end

function openGuiRegisterIdentity()
  SetNuiFocus(true)
  SendNUIMessage({method = 'openGuiRegisterIdentity'})
  menuIsOpen = 2
  DisableControlAction(0, 1,   true) -- LookLeftRight
  DisableControlAction(0, 2,   true) -- LookUpDown
  DisableControlAction(0, 142, true) -- MeleeAttackAlternate
  DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
  DisableControlAction(0, 12, true) -- WeaponWheelUpDown
  DisableControlAction(0, 14, true) -- WeaponWheelNext
  DisableControlAction(0, 15, true) -- WeaponWheelPrev
  DisableControlAction(0, 16, true) -- SelectNextWeapon
  DisableControlAction(0, 17, true) -- SelectPrevWeapon
end
 
function closeGui()
  SetNuiFocus(false)
  SendNUIMessage({method = 'closeGui'})
  menuIsOpen = 0
end
