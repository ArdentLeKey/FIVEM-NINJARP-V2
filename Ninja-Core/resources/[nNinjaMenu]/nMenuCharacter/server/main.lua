--||@SuperCoolNinja.||--
RegisterServerEvent("updateSkin")
AddEventHandler("updateSkin", function(skinTone, Dad, Mum, hairId, cheveuxCouleur)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	MySQL.Async.execute("UPDATE outfits SET skinTone=@skinTone, Dad=@Dad, Mum=@Mum, hairId=@hairId,cheveuxCouleur=@cheveuxCouleur WHERE license=@license", {['@license'] = license,['@skinTone'] = skinTone, ['@Dad'] = Dad, ['@Mum'] = Mum, ['@hairId'] = hairId, ['@cheveuxCouleur'] = cheveuxCouleur})
end)


RegisterServerEvent("vCharacter:SpawnCharacter")
AddEventHandler("vCharacter:SpawnCharacter", function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT isFirstConnection FROM users WHERE license = @license", {['@license'] = license})
	if result[1].isFirstConnection == 1 then
		MySQL.Sync.execute("INSERT INTO outfits(license) VALUES (@license)",{['@license']=license})
		MySQL.Sync.execute("UPDATE users SET isFirstConnection = 0 WHERE license = @username", {['@username'] = license})
		TriggerClientEvent("vCharacter:UpdateCustomization", source, "mp_m_freemode_01")
	else
		local skin = MySQL.Sync.fetchScalar("SELECT skin FROM outfits WHERE license = @license", {['@license'] = license})
		TriggerClientEvent("vCharacter:UpdateCustomization", source, skin)
	end
end)

RegisterServerEvent("vCharacter:UpdateGender")
AddEventHandler("vCharacter:UpdateGender",function(skin)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	MySQL.Async.execute("UPDATE outfits SET skin=@skin WHERE license=@user",{['@skin']=skin,['@user']=license})
	TriggerClientEvent("vCharacter:UpdateCustomization",source,skin)
end)

--FIXER
RegisterServerEvent("vCharacter:LoadNewCharacter")
AddEventHandler("vCharacter:LoadNewCharacter",function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll("SELECT skinTone,Dad,Mum,hairId,cheveuxCouleur FROM outfits WHERE license=@user",{['@user']=license}, function(result)
		TriggerClientEvent("vCharacter:updatePerso",source,{result[1].skinTone,result[1].Dad,result[1].Mum, result[1].hairId, result[1].cheveuxCouleur})
	end)
end)
