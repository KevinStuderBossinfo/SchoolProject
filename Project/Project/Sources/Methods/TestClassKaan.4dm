//%attributes = {}
//TEST KLASS


var $rechner : Object
var $resultat : Integer
var $resultat2 : Integer
var $zahl1 : Integer
var $zahl2 : Integer

$zahl1:=10
$zahl2:=22




$resultat:=0
$rechner:=cs:C1710.Rechner.new()

$rechner.zahl1:=1
$rechner.zahl2:=2
//$resultat2:=$rechner.

$resultat:=$rechner.addition($zahl1; $zahl2)


ALERT:C41(String:C10($resultat))

//#DECLARE($ID : Integer; $Benutzername : Text; $Passwort : Text; $benutzer : cs.Benutzer)

//$ID:=1337
//$Benutzername:="1337Name"
//$Passwort:="1337Name"

//$benutzer:=cs.Benutzer.new()
//$benutzer:=$benutzer.saveBenutzerinTabble($ID; $Benutzername; $Passwort)
//$benutzer:=$benutzer.deleteBenutzerinTable($ID; $Benutzername; $Passwort)





//#DECLARE($rechner : Object)
//$rechner:=cs.Rechner.new()


//$rechner.$zahl1:=10
//$rechner.$zahl2:=20
//$rechner:=$rechner.addition2()

//ALERT(String($rechner))


