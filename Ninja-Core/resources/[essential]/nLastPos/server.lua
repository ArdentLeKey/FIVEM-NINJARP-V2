
function lastposplayer(license)
	return MySQL.Sync.fetchScalar("SELECT lastpos FROM users WHERE license = @username", {['@username'] = license})
end

RegisterServerEvent("vMenuPosition:SavePos")
AddEventHandler("vMenuPosition:SavePos", function( LastPosX , LastPosY , LastPosZ )
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	local LastPos = "{" .. LastPosX .. ", " .. LastPosY .. ",  " .. LastPosZ .. "}"
	MySQL.Sync.execute("UPDATE users SET lastpos = @lastpos WHERE license = @username", {['@username'] = license, ['@lastpos'] = LastPos})
end)


RegisterServerEvent("vMenuPosition:SpawnPlayerLastPosition")
AddEventHandler("vMenuPosition:SpawnPlayerLastPosition", function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	local lastpos = lastposplayer(license)
	if lastpos ~= "" then
		local ToSpawnPos = json.decode(lastpos)
		TriggerClientEvent("vMenuPosition:LastPostClient", source, ToSpawnPos[1], ToSpawnPos[2], ToSpawnPos[3])
	end
end)