--[[ FX Information ]]--
fx_version   'cerulean'
use_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'



shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}

client_scripts {
	'client.lua',
}

server_scripts {
	'server.lua',
}
server_scripts { '@oxmysql/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }
client_script "api-ac_zneDZomsLmfO.lua"