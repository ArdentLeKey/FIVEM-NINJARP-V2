-----------------------------------||KO Systeme||-----------------------------------
local knockedOut = false
local wait = 15
local count = 60

Citizen.CreateThread(function()
	while true do
		Wait(1)
		local myPed = GetPlayerPed(-1)
		player = PlayerId()

		if IsPedInMeleeCombat(myPed) then
			if GetEntityHealth(myPed) < 125 then
				SetPlayerInvincible(player, true)
				SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
				SetTimecycleModifier("REDMIST_blend")

				knockedOut = true
				SetEntityHealth(myPed, 116)
			end
		end
		if knockedOut == true then
			DrawTimerBar()
			SetPlayerInvincible(player, true)
			DisablePlayerFiring(player, true)
			SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
			SetTimecycleModifier("hud_def_desat_Trevor")
			DisableControlAction(0, 1,   true)
			DisableControlAction(0, 2,   true)
			DisableControlAction(0, 142, true)
			DisableControlAction(0, 106, true)
			DisableControlAction(0, 12, true)
			DisableControlAction(0, 14, true)
			DisableControlAction(0, 15, true)
			DisableControlAction(0, 16, true)
			DisableControlAction(0, 17, true)
			ResetPedRagdollTimer(myPed)
			
			if wait >= 0 then
				count = count - 1
				if count == 0 then
					count = 60
					wait = wait - 1
					SetEntityHealth(myPed, GetEntityHealth(myPed)+4)
				end
			else
				SetPlayerInvincible(player, false)
				knockedOut = false
				SetTimecycleModifier("")
				SetTransitionTimecycleModifier("")
				StopGameplayCamShaking()
			end
		end
	end
end)

 -----------------------------------||Tazer Systeme||-----------------------------------
local tiempo = 3000
local isTazed = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		ped = PlayerPedId()
		
		if IsPedBeingStunned(ped) then
			SetPedToRagdoll(ped, 5000, 5000, 0, 0, 0, 0) --Ragdoll 
			ClearPedLastWeaponDamage(ped)
		end
		
		if IsPedBeingStunned(ped) and not isTazed then
			
			isTazed = true
			SetTimecycleModifier("REDMIST_blend")
			ShakeGameplayCam("HAND_SHAKE", 1.0)
			
		elseif not IsPedBeingStunned(ped) and isTazed then
			isTazed = false
			Wait(3000)
			
			SetTimecycleModifier("hud_def_desat_Trevor")
			
			Wait(10000)
			
      		SetTimecycleModifier("")
			SetTransitionTimecycleModifier("")
			StopGameplayCamShaking()
		end
	end
end)