
var db_eintrag_benutzername : Text
var db_eintrag_password : Text
var db_eintrag_confirm : Text

C_OBJECT:C1216($o_NewBenutzer; $o_Result)
C_TEXT:C284($t_Benutzer; $t_Passwort; $t_confirm)
C_BOOLEAN:C305($b_Passwort; $b_confirm; $b_Length)
C_LONGINT:C283($l_Min)

$o_NewBenutzer:=ds:C1482.Logindaten.new()

$t_Benutzer:=db_eintrag_benutzername
$t_Passwort:=db_eintrag_password
$t_confirm:=db_eintrag_confirm

QUERY:C277([Logindaten:3]; [Logindaten:3]Benutzer:2=$t_Benutzer)

$l_Min:=4

If (Records in selection:C76([Logindaten:3])#0)
	ALERT:C41("Benutzername bereits vergeben!")
	ALERT:C41("Verwenden Sie einen anderen Benutzername!")
Else 
	$b_Length:=LengthString($t_Passwort; $l_Min)
	If ($b_Length)
		$b_Passwort:=Password_Check($t_Passwort)
		If ($b_Passwort)
			$b_confirm:=SameString($t_Passwort; $t_confirm)
			If ($b_confirm)
				$o_NewBenutzer.Benutzer:=$t_Benutzer
				$o_NewBenutzer.Passwort:=$t_Passwort
				$o_NewBenutzer.Person_ID:=0
				
				$o_Result:=$o_NewBenutzer.save()
				
				
				
				$o_NewBenutzer:=Null:C1517
				
				ALERT:C41("Benutzer wurde erfolgreich registriert!")
				db_eintrag_benutzername:=""
				db_eintrag_confirm:=""
				db_eintrag_password:=""
			Else 
				ALERT:C41("Passwörter sind nicht identisch!")
			End if 
		Else 
			ALERT:C41("Passwort entspricht nicht den Anforderungen!")
			ALERT:C41("Passwort muss Klein- und Großbuchstaben enthalten!")
		End if 
	Else 
		ALERT:C41("Passwort ist zu kurz! Mind. 5 Zeichen!")
	End if 
End if 


