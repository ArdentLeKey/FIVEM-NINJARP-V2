function hasIdentity(source)
    local license = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT nom, prenom FROM users WHERE license = @license", {
        ['@license'] = license
    })
    local user = result[1]
    return not (user['nom'] == '' or user['prenom'] == '')
end

function getIdentity(source)
    local license = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT users.* , jobs.job_name AS jobs FROM users JOIN jobs WHERE users.job = jobs.job_id and users.license = @license", {
        ['@license'] = license
    })
    if #result == 1 then
        result[1]['id'] = source
        return result[1]
    else
        return {}
    end
end

function setIdentity(license, data)
    MySQL.Async.fetchAll("UPDATE users SET nom = @nom, prenom = @prenom, dateNaissance = @dateNaissance, sexe = @sexe, taille = @taille WHERE license = @license", {
        ['@nom'] = data.nom,
        ['@prenom'] = data.prenom,
        ['@dateNaissance'] = data.dateNaissance,
        ['@sexe'] = data.sexe,
        ['@taille'] = data.taille,
        ['@license'] = license
    })
    TriggerClientEvent("vCharacter:OpenCreatorMenu", source) -- Work
end


AddEventHandler('es:playerLoaded', function(source)
    print('playerload')
    local source = source
    local result = hasIdentity(source)
    if result == false then
        TriggerClientEvent('nMenu:showRegisterItentity', source, {})
    end
end)


RegisterServerEvent('nMenu:setIdentity')
AddEventHandler('nMenu:setIdentity', function(data)
    setIdentity(GetPlayerIdentifiers(source)[1], data)
end)
