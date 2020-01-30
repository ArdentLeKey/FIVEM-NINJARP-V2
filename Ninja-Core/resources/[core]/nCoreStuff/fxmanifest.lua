fx_version 'adamant'
game 'gta5'

server_scripts {
    'server/server.lua',
}

client_script 'functionsExported.lua'

client_scripts {
    'utils/screens.lua',
    'client/anti_afk.lua',
    'client/spawn.lua'
}

exports {
    'Ninja_Core__DisplayHelpAlert',
    'Ninja_Core__ShowNinjaNotification',
    'Ninja_Core_PedsText',
    "Ninja_Core_StartAnim",
    'nNotificationMain'
}