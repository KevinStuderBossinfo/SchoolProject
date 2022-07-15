var $testobject : cs:C1710.Benutzerdaten

$testobject:=ds:C1482.Benutzerdaten.get(3)
$testobject.Benutzer:="Hans"
$testobject.save()

//$testobject.Benutzer.save("Hans")