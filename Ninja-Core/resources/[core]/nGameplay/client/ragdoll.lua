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
	
	if IsControlPressed(0, 326) then --Shift + R Shift
		ragdol = true
		setRagdoll(true)
	end
  end
end)