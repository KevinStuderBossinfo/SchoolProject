#DECLARE($t_url : Text; $t_header : Text; \
$tbrowserIP : Text; $t_serverIP : Text; \
$t_userName : Text; $t_password : Text)\
->$b_accepted : Boolean

C_OBJECT:C1216($es_D; $es_t)
//var $es : cs.BenutzerdatenSelection

//$es_D:=ds.Benutzerdaten.query("Benutzer = :1"; "D@")
//If ($t_url="/rest_getD")

//$t_result:=JSON Stringify($es_D.toCollection())
//Else 
//$t_result:=JSON Stringify(New object("hey"; 5; "maybe"; "not"))
//End if 
//$es_D:=ds.Benutzerdaten.query("Benutzer = :1"; "K@")
//If ($t_url="/rest_getK")

//$t_result:=JSON Stringify($es_K.toCollection())
//Else 
//$t_result:=JSON Stringify(New object("hey"; 5; "maybe"; "not"))
//End if 



Case of 
	: ($t_url="/rest_all")
		$es_D:=ds:C1482.Benutzerdaten.all()
		$t_result:=JSON Stringify:C1217($es_D.toCollection())
	: ($t_url="/rest_getD")
		$es_D:=ds:C1482.Benutzerdaten.query("Benutzer = :1"; "D@")
		$t_result:=JSON Stringify:C1217($es_D.toCollection())
	: ($t_url="/rest_getK")
		$es_D:=ds:C1482.Benutzerdaten.query("Benutzer = :1"; "Ka@")
		$es_t:=ds:C1482.Lehrer.query("Vorname = :1"; "F@")
		$t_result:=JSON Stringify:C1217($es_D.toCollection())+JSON Stringify:C1217($es_t.toCollection())
		//$t_result:=JSON Stringify($es_test.toCollection())
End case 



TEXT TO BLOB:C554($t_result; $x_result; UTF8 text without length:K22:17)
WEB SEND BLOB:C654($x_result; "application/json")