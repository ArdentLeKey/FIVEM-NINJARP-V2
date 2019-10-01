function LoadUser(license, source, new, licenseNotRequired)
	local Source = source
	db.retrieveUser(license, function(user)
		if user.license or licenseNotRequired then
			-- Creates the player class for OOP imitation and then sets a var to say which idType was used (This isn't relevant anymore)
			Users[source] = CreatePlayer(source, user.permission_level, user.money, user.bank, user.license, user.group)
			Users[Source].setSessionVar('idType', 'license')
			
			-- Tells other resources that a player has loaded
			TriggerEvent('es:playerLoaded', Source, Users[Source])

			-- Sets a decorator on the client if enabled, allows some cool stuff on the client see: https://runtime.fivem.net/doc/natives/#_0xA06C969B02A97298
			if(settings.defaultSettings.enableRankDecorators ~= "false")then
				TriggerClientEvent('es:setPlayerDecorator', Source, 'rank', Users[Source]:getPermissions())
			end

			-- Sets the money "icon" on the client. This is UTF8
			TriggerClientEvent('es:setMoneyIcon', Source,settings.defaultSettings.moneyIcon)

			-- Sends the command suggestions to the client, this creates a neat autocomplete
			for k,v in pairs(commandSuggestions) do
				TriggerClientEvent('chat:addSuggestion', Source, settings.defaultSettings.commandDelimeter .. k, v.help, v.params)
			end

			-- If a player connected that was never on the server before then this will be triggered for other resources
			if new then
				TriggerEvent('es:newPlayerLoaded', Source, Users[Source])
			end
		else
			-- Irrelevant
			local license

			for k,v in ipairs(GetPlayerIdentifiers(Source))do
				if string.sub(v, 1, string.len("license:")) == "license:" then
					license = v
					break
				end
			end

			if license then
				db.updateUser({license = license}, function()
					LoadUser(user.license, Source, false)
				end)
			else
				LoadUser(user.license, Source, false, true)
			end
		end
	end)
end

-- Exported function, same as es:getPlayerFromId
function getPlayerFromId(id)
	return Users[id]
end

-- Returns all EssentialMode user objects
AddEventHandler('es:getPlayers', function(cb)
	cb(Users)
end)

-- This gets called whenever a user spawns for the first time in the server, it basically loads the player
function registerUser(license, source)
	local Source = source
	db.doesUserExist(license, function(exists)
		if exists then
			LoadUser(license, Source, false)
		else
			db.createUser(license, function(r, user)
				LoadUser(license, Source, true)
			end)
		end
	end)
end

-- Allow other resources to set raw data on a player instead of using helper functions, these aren't really used often.
AddEventHandler("es:setPlayerData", function(user, k, v, cb)
	if(Users[user])then
		if(Users[user].get(k))then
			if(k ~= "money") then
				Users[user].set(k, v)

				db.updateUser(Users[user].get('license'), {[k] = v}, function(d)
					if d == true then
						cb("Player data edited", true)
					else
						cb(d, false)
					end
				end)
			end

			if(k == "group")then
				Users[user].set(k, v)
			end
		else
			cb("Column does not exist!", false)
		end
	else
		cb("User could not be found!", false)
	end
end)

-- Same as above just easier was we know the ID already now.
AddEventHandler("es:setPlayerDataId", function(user, k, v, cb)
	db.updateUser(user, {[k] = v}, function(d)
		cb("Player data edited.", true)
	end)
end)

-- Returns the user if all checks completed, if the first if check fails then you're in a bit of trouble
AddEventHandler("es:getPlayerFromId", function(user, cb)
	if(Users)then
		if(Users[user])then
			cb(Users[user])
		else
			cb(nil)
		end
	else
		cb(nil)
	end
end)

-- Same as above but uses the DB to get a user instead of memory.
AddEventHandler("es:getPlayerFromIdentifier", function(license, cb)
	db.retrieveUser(license, function(user)
		cb(user)
	end)
end)

-- Function to save player money to the database every 60 seconds.
local function savePlayerMoney()
	SetTimeout(60000, function()
		Citizen.CreateThread(function()
			for k,v in pairs(Users)do
				if Users[k] ~= nil then
					db.updateUser(v.get('license'), {money = v.getMoney(), bank = v.getBank()}, function()end)
				end
			end

			savePlayerMoney()
		end)
	end)
end

savePlayerMoney()