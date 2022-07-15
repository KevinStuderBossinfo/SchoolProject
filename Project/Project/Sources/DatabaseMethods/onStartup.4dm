
$settings:=New collection:C1472
$settings.push(New object:C1471("host"; "127.0.0.1:5500"; "methods"; "get;post;delete;put;patch"))

//enable CORS
WEB SET OPTION:C1210(Web CORS enabled:K73:33; 1)

//Cors Domains Settings
WEB SET OPTION:C1210(Web CORS settings:K73:34; $settings)

WEB START SERVER:C617
/*
$hostWS:=WEB Server(Web host database server)
$setting:=New object

//Enable CORS
$setting.CORSEnabled:=True

//CORS Domains Settings
$setting.CORSSettings:=New collection
$setting.CORSSettings.push(New object("host"; "127.0.0.1:8888"; "methods"; "get;put;post"))
$setting.CORSSettings.push(New object("host"; "https://blog.4d.com/"; "methods"; "get;post"))

//start web server and apply CORS settings
$hostWS.start($setting)
*/
