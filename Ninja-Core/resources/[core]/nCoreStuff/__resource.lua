resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
resource_type 'gametype' { name = 'Ninja-Core' }

server_scripts {
    'server/server.lua'
}

client_scripts {
    'utils/screens.lua',
    'client/spawn.lua',
    'client/idle.lua'
}