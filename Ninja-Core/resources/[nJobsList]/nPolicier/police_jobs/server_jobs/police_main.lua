--||@SuperCoolNinja.||--
local maxsecs = 500 -- Temps de prison maximum

--[[
	Police Rank Shema:
	0 = Chomeur(Pas flic)
	1 = Cadet
	2 = Officier
	3 = Sergent
	4 = Lieutenant
	5 = Capitaine
]]
copRank = 0
RegisterServerEvent('vPolice:OnJoin')
AddEventHandler('vPolice:OnJoin', function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll("SELECT * FROM `police` WHERE `license` = @license", {["@license"] = license}, function(result)
		local myID = result[1]
		if myID == nil then
			MySQL.Async.execute("INSERT INTO police (license, rank) VALUES (@license, @rank)", {["@license"] = license, ["@rank"] = 1})
		end
	end)
end)

RegisterServerEvent('vPolice:Check')
AddEventHandler('vPolice:Check', function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll("SELECT * FROM `police` WHERE `license` = @license", {["@license"] = license}, function(result)
		local iscop = result[1].rank
		TriggerClientEvent('cl-cop', -1, iscop)
		copRank = iscop
	end)
end)

RegisterServerEvent('nPolice:AddOfficier')
AddEventHandler('nPolice:AddOfficier', function(NearestPlayerSID)
	local license = GetPlayerIdentifiers(NearestPlayerSID)[1]
	if NearestPlayerSID ~= 0 then
		MySQL.Async.execute("UPDATE police SET rank=@rank WHERE `license` = @license", {["@license"] = license, ["@rank"] = 2})
		TriggerClientEvent('vMenuNotif:showNotification', NearestPlayerSID, "Une personne vous à promu Officier.")
	end
end)

RegisterServerEvent('nPolice:AddSergent')
AddEventHandler('nPolice:AddSergent', function(NearestPlayerSID)
	local license = GetPlayerIdentifiers(NearestPlayerSID)[1]
	if NearestPlayerSID ~= 0 then
		MySQL.Async.execute("UPDATE police SET rank=@rank WHERE `license` = @license", {["@license"] = license, ["@rank"] = 3})
		TriggerClientEvent('vMenuNotif:showNotification', NearestPlayerSID, "Une personne vous à promu Sergent.")
	end
end)

RegisterServerEvent('nPolice:AddLieutenant')
AddEventHandler('nPolice:AddLieutenant', function(NearestPlayerSID)
	local license = GetPlayerIdentifiers(NearestPlayerSID)[1]
	if NearestPlayerSID ~= 0 then
		MySQL.Async.execute("UPDATE police SET rank=@rank WHERE `license` = @license", {["@license"] = license, ["@rank"] = 4})
		TriggerClientEvent('vMenuNotif:showNotification', NearestPlayerSID, "Une personne vous à promu Lieutenant.")
	end
end)

RegisterServerEvent('nPolice:AddCapitaine')
AddEventHandler('nPolice:AddCapitaine', function(NearestPlayerSID)
	local license = GetPlayerIdentifiers(NearestPlayerSID)[1]
	if NearestPlayerSID ~= 0 then
		MySQL.Async.execute("UPDATE police SET rank=@rank WHERE `license` = @license", {["@license"] = license, ["@rank"] = 5})
		TriggerClientEvent('vMenuNotif:showNotification', NearestPlayerSID, "Une personne vous à promu Capitaine.")
	end
end)

RegisterServerEvent("nPolice:MenotterServer")
AddEventHandler("nPolice:MenotterServer", function(targetid, playerheading, playerCoords,  playerlocation)
	_source = source
	TriggerClientEvent('vMenuNotif:showNotification', targetid, "Une personne vous à menotter.")

	TriggerClientEvent('nPolice:Cgetarrested', targetid, playerheading, playerCoords, playerlocation)
	TriggerClientEvent('nPolice:Cdoarrested', _source)
end)

RegisterServerEvent('nPolice:Srequestrelease')
AddEventHandler('nPolice:Srequestrelease', function(targetid, playerheading, playerCoords,  playerlocation)
    _source = source
    TriggerClientEvent('nPolice:Cgetuncuffed', targetid, playerheading, playerCoords, playerlocation)
    TriggerClientEvent('nPolice:Cdouncuffing', _source)
end)

RegisterServerEvent('nPolice:SPrison')
AddEventHandler('nPolice:SPrison', function(NearestPlayerSID, time1)
	local time = tonumber(time1 * 60)
	if time > maxsecs then
		time = maxsecs
	end
	if NearestPlayerSID ~= 0 then
		TriggerClientEvent("nPolice:CPrison", NearestPlayerSID, time)
		TriggerClientEvent('vMenuNotif:showNotification', NearestPlayerSID, "à été envoyé en prison pour un temps maximum de: ".. time1 .. 'secondes.')
	end
end)

function removeCop()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	MySQL.Async.execute("UPDATE police SET rank=@rank WHERE `license` = @license", {["@license"] = license, ["@rank"] = 0})
end