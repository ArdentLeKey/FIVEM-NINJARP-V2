--||@SuperCoolNinja.||--

function nameJob(id)
	return MySQL.Sync.fetchScalar("SELECT job_name FROM jobs WHERE job_id = @namejob", {['@namejob'] = id})
end

RegisterServerEvent('vMenu:UpdateServerjobs')
AddEventHandler('vMenu:UpdateServerjobs', function(id)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	local myJob = nameJob(id)
	local job = id
 	MySQL.Async.execute("UPDATE users SET `job`=@value WHERE license = @license", {['@value'] = job, ['@license'] = license})
	TriggerClientEvent("vMenu:UpdateClientjobs", source, myJob)
	--print('Jobs Update:' ..myJob)
end)

function getJob(license)
	return MySQL.Sync.fetchScalar("SELECT job FROM users WHERE license = @license",{['@license'] = license})
end

AddEventHandler('es:playerLoaded', function(source)
	  local source = source
	  local license = GetPlayerIdentifiers(source)[1]
      local jobId = getJob(license)
	  local nameJoba = nameJob(jobId)
	  
	  TriggerClientEvent("es:setMoneyDisplay", true)
	  
	  TriggerClientEvent("vMenu:UpdateClientjobs", source, nameJoba)
end)