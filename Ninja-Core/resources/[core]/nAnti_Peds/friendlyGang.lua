Citizen.CreateThread(function()
	for i = 1, 12 do
		Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
	end
end)

Citizen.CreateThread(function()
	while true do
    	-- These natives has to be called every frame.
    	SetVehicleDensityMultiplierThisFrame(0.01)
		SetPedDensityMultiplierThisFrame(0)
		SetRandomVehicleDensityMultiplierThisFrame(0.01)
		SetParkedVehicleDensityMultiplierThisFrame(0.01)
		SetScenarioPedDensityMultiplierThisFrame(0, 0)
		
		-- These natives do not have to be called everyframe.
		SetGarbageTrucks(0)
		SetRandomBoats(0)
    	
		Citizen.Wait(1)
	end
end)