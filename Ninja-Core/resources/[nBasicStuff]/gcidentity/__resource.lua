ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/style.css',
	'html/script.js',
	'html/cursor.png'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	"server.lua",
} 

client_script {
	"client.lua"
}

