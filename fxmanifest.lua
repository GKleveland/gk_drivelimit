fx_version 'adamant'

game 'gta5'

description 'GK Drive Limit'

version '1.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
    'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
    'config.lua',
	'client/main.lua'
}

dependencies {
	'es_extended'
}