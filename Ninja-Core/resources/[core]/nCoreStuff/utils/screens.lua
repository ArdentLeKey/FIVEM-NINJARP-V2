SpawnLocations = {
	{x= -1040.302, y= -227.768, z= 39.014},
	{x= -729.639, y= -674.975, z= 30.271},
	{x= -113.038, y= -604.334, z= 36.281},
	{x= -146.506, y= -1173.3226, z= 25.163},
	{x= -2072.074, y= -464.077, z= 11.683},
	{x= -492.067, y= -691.673, z= 33.211},
	{x= -1085.971, y= 2713.029, z= 19.28}
}

function generateSpawn()
	math.randomseed(GetGameTimer())
    local keys = {}

    for key, value in pairs(SpawnLocations) do
        keys[#keys+1] = key
    end
   
    index = keys[math.random(1, #keys)]
    return SpawnLocations[index]
end


function showLoadingPromt(label, time)
    Citizen.CreateThread(function()
        BeginTextCommandBusyString(tostring(label))
        EndTextCommandBusyString(3)
        Citizen.Wait(time)
        RemoveLoadingPrompt()
    end)
end

function SetButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function SetButton(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end
