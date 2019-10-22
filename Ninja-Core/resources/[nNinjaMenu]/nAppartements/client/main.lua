--||@SuperCoolNinja.||--
Citizen.CreateThread(function()
	for k, v in pairs(nLocation) do
	  v.blip = AddBlipForCoord(v.xe, v.ye, v.ze)
	  SetBlipSprite(v.blip, 375)
	  SetBlipAsShortRange(v.blip, true)
	  BeginTextCommandSetBlipName("STRING")
	  SetBlipColour(v.blip, 3)
	  SetBlipScale(v.blip, 0.9)
	  AddTextComponentString("Appartement")
	  EndTextCommandSetBlipName(v.blip)
	end
end)
