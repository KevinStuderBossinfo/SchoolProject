//C_OBJECT($es)

//$es:=ds.Lehrer.new()

//$es.id:=1
//$es.Vorname:="Stefan"
//$es.Nachname:="Gubser"
//$es.Wohnort:="Pratteln"
//$es.Strasse:="Augsterstrasse 42"
//$es.Hausnummer:=11
//$es.Postleitzahl:=4133
//$es.Fach:="Mathematik"
//$es.save()


#DECLARE($t_url : Text; $t_header : Text; $t_browserIP : Text; \
$t_serverIP : Text; $t_username : Text; $t_password : Text)\
->$b_accepted : Boolean

ARRAY TEXT:C222($HeaderNames; 0)
ARRAY TEXT:C222($HeaderValue; 0)


WEB GET HTTP HEADER:C697($HeaderNames; $HeaderValue)


/*
If ($HeaderValue{1}="GET")

Else 
WEB GET HTTP BODY($x_body)
$o_body:=JSON Parse($x_body)
End if 
*/
//If ($HeaderValue{1}="DELETE")
//Else 
//WEB GET HTTP BODY($x_body)
//$o_body:=JSON Parse($x_body)
//End if 


Case of 
	: ($HeaderValue{1}="GET")
	: ($HeaderValue{1}="DELTE")
	: ($headervalue{1}="POST")
		WEB GET HTTP BODY:C814($x_body)
		$o_body:=JSON Parse:C1218($x_body)
	: ($headerValue{1}="PUT")
		WEB GET HTTP BODY:C814($x_body)
		$o_body:=JSON Parse:C1218($x_body)
	: ($headerValue{1}="PATCH")
		WEB GET HTTP BODY:C814($x_body)
		$o_body:=JSON Parse:C1218($x_body)
End case 


Case of 
	: ($t_url="/getAllTeacher")
		C_OBJECT:C1216($es)
		$es:=ds:C1482.Lehrer.all()
		$t_result:=JSON Stringify:C1217($es.toCollection())
	: ($t_url="/createTeacher")
		C_OBJECT:C1216($ess)
		For ($i; 0; ($o_body.length-1))
			
			$ess:=ds:C1482.Lehrer.new()
			$ess.ID:=String:C10($o_body[$i].ID)
			$ess.Vorname:=String:C10($o_body[$i].Vorname)
			$ess.Nachname:=String:C10($o_body[$i].Nachname)
			$ess.Wohnort:=String:C10($o_body[$i].Wohnort)
			$ess.Strasse:=String:C10($o_body[$i].Strasse)
			$ess.Hausnummer:=String:C10($o_body[$i].Hausnummer)
			$ess.Postleitzahl:=String:C10($o_body[$i].Postleitzahl)
			$ess.Fach:=String:C10($o_body[$i].Fach)
			$ess.save()
			$ess:=Null:C1517
			
			
		End for 
		$t_result:=JSON Stringify:C1217(New object:C1471("User create"; "yes"))
	: ($t_url="/getTeacherbyID/$id_request")
		var $testvar : Object
	: ($t_url="/login")
		var $loginBody : Object
		$loginBody:=ds:C1482.Benutzerdaten.query("Benutzer = "+$o_body.username)
		If ($loginBody[0].Passwort=$o_body.password)
			$t_result:=JSON Stringify:C1217(New object:C1471("User Login"; "yes"))
		Else 
			$t_result:=JSON Stringify:C1217(New object:C1471("User Login"; "no"))
		End if 
		
		//$loginBody.Benutzer:=String($o_body.username)
		//$loginBody.Passwort:=String($o_body.password)
		
		//GET METHODE
	: ($t_url="/getAllUsers")
		var $getAllUsers : Object
		$getAllUsers:=ds:C1482.Benutzerdaten.all()
		$t_result:=JSON Stringify:C1217($getAllUsers.toCollection())
		
		//POST METHODE
	: ($t_url="/createUser")
		var $createUser : Object
		$createUser:=ds:C1482.Benutzerdaten.new()
		$createUser.ID:=$o_body.userID
		$createUser.Benutzer:=$o_body.userName
		$createUser.Passwort:=$o_body.password
		$createUser.save()
		$t_Result:=JSON Stringify:C1217(New object:C1471("User create"; "yes"))
		
		//DELETE METHODE
	: ($t_url="/deleteUser/@")
		var $getIDFromDeleteRequest : Text
		var $getRecordWithID : Object
		$getIDFromDeleteRequest:=Substring:C12($t_url; 13)
		$getRecordWithID:=ds:C1482.Benutzerdaten.query("ID="+$getIDFromDeleteRequest)
		$getRecordWithID.drop()
		$t_result:=JSON Stringify:C1217(New object:C1471("User deleted"; "YES BROTHER"))
		
		//PUT
	: ($t_url="/updateUserPut/@")
		var $getIDFromPUTRequest : Text
		var $getRecordWithPut : Object
		$getIDFromPUTRequest:=Substring:C12($t_url; 16)
		$getRecordWithPut:=ds:C1482.Benutzerdaten.get($getIDFromPUTRequest)
		$getRecordWithPut.Benutzer:=$o_body.username
		$getRecordWithPut.Passwort:=$o_body.password
		$getRecordWithPut.save()
		$t_result:=JSON Stringify:C1217(New object:C1471("Benutzer wurde via PUT upgedated"; "Aber SISCHA"))
		
/* WIRD DURCH CORS Geblockt! 
PATCH WIRD NICHT unterstützt
		
		
		
: ($t_url="/updateUserPatch/@")
var $getIDFromPatchRequest : Text
var $getRecordWithPatch : Object
$getIDFromPatchRequest:=Substring($t_url; 18; *)
$getRecordWithPatch:=ds.Benutzerdaten.get($getIDFromPatchRequest)
If (Not(Undefined($o_body.username)))
$getRecordWithPatch.Benutzer:=$o_body.username
End if 
If (Not(Undefined($o_body.password)))
$getRecordWithPatch.Passwort:=$o_body.password
End if 
$getRecordWithPatch.save()
$t_result:=JSON Stringify(New object("Benutzer wurde via PATCH upgedated"; "Türlisch Türlisch"))
*/
End case 

TEXT TO BLOB:C554($t_result; $x_result; UTF8 text without length:K22:17)
WEB SEND BLOB:C654($x_result; "application/json")
