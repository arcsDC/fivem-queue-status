fx_version 'cerulean'
game 'gta5'
author 'QueueStatus'
description 'Live player queue status UI'
version '1.0.0'

shared_scripts {
    'config.lua'
}

server_scripts {
    '@ox_lib/init.lua',
    'server.lua'
}

client_scripts {
    'client.lua'
}

ui_page 'html/index.html'
files {
    'html/index.html',
    'html/style.css'
}
