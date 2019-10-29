--||@SuperCoolNinja.||--
local atms = {
    {name="ATM", id=277, x=-386.733, y=6045.953, z=31.501},
    {name="ATM", id=277, x=-284.037, y=6224.385, z=31.187},
    {name="ATM", id=277, x=-284.037, y=6224.385, z=31.187},
    {name="ATM", id=277, x=-135.165, y=6365.738, z=31.101},
    {name="ATM", id=277, x=-110.753, y=6467.703, z=31.784},
    {name="ATM", id=277, x=-94.9690, y=6455.301, z=31.784},
    {name="ATM", id=277, x=155.4300, y=6641.991, z=31.784},
    {name="ATM", id=277, x=174.6720, y=6637.218, z=31.784},
    {name="ATM", id=277, x=1703.138, y=6426.783, z=32.730},
    {name="ATM", id=277, x=1735.114, y=6411.035, z=35.164},
    {name="ATM", id=277, x=1702.842, y=4933.593, z=42.051},
    {name="ATM", id=277, x=1967.333, y=3744.293, z=32.272},
    {name="ATM", id=277, x=1821.917, y=3683.483, z=34.244},
    {name="ATM", id=277, x=1174.532, y=2705.278, z=38.027},
    {name="ATM", id=277, x=540.0420, y=2671.007, z=42.177},
    {name="ATM", id=277, x=2564.399, y=2585.100, z=38.016},
    {name="ATM", id=277, x=2558.683, y=349.6010, z=108.050},
    {name="ATM", id=277, x=2558.051, y=389.4817, z=108.660},
    {name="ATM", id=277, x=1077.692, y=-775.796, z=58.218},
    {name="ATM", id=277, x=1139.018, y=-469.886, z=66.789},
    {name="ATM", id=277, x=1168.975, y=-457.241, z=66.641},
    {name="ATM", id=277, x=1153.884, y=-326.540, z=69.245},
    {name="ATM", id=277, x=381.2827, y=323.2518, z=103.270},
    {name="ATM", id=277, x=236.4638, y=217.4718, z=106.840},
    {name="ATM", id=277, x=265.0043, y=212.1717, z=106.780},
    {name="ATM", id=277, x=285.2029, y=143.5690, z=104.970},
    {name="ATM", id=277, x=157.7698, y=233.5450, z=106.450},
    {name="ATM", id=277, x=-164.568, y=233.5066, z=94.919},
    {name="ATM", id=277, x=-1827.04, y=785.5159, z=138.020},
    {name="ATM", id=277, x=-1409.39, y=-99.2603, z=52.473},
    {name="ATM", id=277, x=-1205.35, y=-325.579, z=37.870},
    {name="ATM", id=277, x=-1215.64, y=-332.231, z=37.881},
    {name="ATM", id=277, x=-2072.41, y=-316.959, z=13.345},
    {name="ATM", id=277, x=-2975.72, y=379.7737, z=14.992},
    {name="ATM", id=277, x=-2962.60, y=482.1914, z=15.762},
    {name="ATM", id=277, x=-2955.70, y=488.7218, z=15.486},
    {name="ATM", id=277, x=-3044.22, y=595.2429, z=7.595},
    {name="ATM", id=277, x=-3144.13, y=1127.415, z=20.868},
  }
  

Citizen.CreateThread(function()
    for _, item in pairs(atms) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipAsShortRange(item.blip, true)
      SetBlipColour(item.blip, 25)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()

        local ply = GetPlayerPed(-1)
        local plyCoords = GetEntityCoords(ply, 0)
        for _, item in pairs(atms) do
          local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
          if(distance <= 1) then
              if GetLastInputMethod(0) then
                  exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_TALK~ pour ~b~intéragir")
              else
                  exports.nCoreStuff:Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~b~intéragir")
              end
              
              if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
                  mainMenu:Visible(not mainMenu:Visible())
              end
          end
        end
    end
end)

RegisterNetEvent("nArgent:DisplayCashValue")
AddEventHandler("nArgent:DisplayCashValue", function(value)
	StatSetInt("MP0_WALLET_BALANCE", value, true)
	ShowHudComponentThisFrame(4)
	CancelEvent()
end)

RegisterNetEvent("nArgent:DisplayBankValue")
AddEventHandler("nArgent:DisplayBankValue", function(value)
	StatSetInt("BANK_BALANCE", value, true)
	ShowHudComponentThisFrame(3)	
	CancelEvent()
end)