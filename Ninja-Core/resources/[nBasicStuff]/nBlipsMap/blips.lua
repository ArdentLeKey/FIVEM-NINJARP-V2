
local vBlips = 
{
	{nom="Emplois", couleur=29, id=590, x = -55.7898, y = 6525.02, z = 31.4908}
}

Citizen.CreateThread(function()
    for _, vCoord in pairs(vBlips) do
		vCoord.blip = AddBlipForCoord(vCoord.x, vCoord.y, vCoord.z)
      SetBlipSprite(vCoord.blip, vCoord.id)
      SetBlipDisplay(vCoord.blip, 4)
      SetBlipScale(vCoord.blip, 0.9)
      SetBlipColour(vCoord.blip, vCoord.couleur)
      SetBlipAsShortRange(vCoord.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(vCoord.nom)
      EndTextCommandSetBlipName(vCoord.blip)
    end
end)


