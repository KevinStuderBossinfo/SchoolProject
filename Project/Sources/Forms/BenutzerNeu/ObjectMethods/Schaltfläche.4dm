

//Form.Vorname:=""
//Form.Nachname:=""
//Form.Geburtstag:=""
//Form.Benutzername:=""
//Form.Passwort:=""
//Form.Confirm:=""


C_OBJECT:C1216($e_NewBenutzer; $o_SaveResult; $e_NewPerson; $o_SavingResult; $es_Doppelt)
C_LONGINT:C283($l_Min)

$l_Min:=4
$es_Doppelt:=ds:C1482.Logindaten.query("Benutzer=:1"; Form:C1466.Benutzername)


Case of 
	: (Form:C1466.Vorname="")
		ALERT:C41("Vorname fehlt!")  //
		GOTO OBJECT:C206(*; "fo_Vorname")
	: (Form:C1466.Nachname="")
		ALERT:C41("Nachname fehlt!")
		GOTO OBJECT:C206(*; "fo_Nachname")
		//: (db_eintrag_geburtstag="")   // Möglicherweise noch unbekannt
		//ALERT("Datum fehlt")
		
	: (Form:C1466.Benutzername="")
		ALERT:C41("Benutzernanme fehlt!")  //
		GOTO OBJECT:C206(*; "fo_Benutzername")
	: (Form:C1466.Passwort="")
		ALERT:C41("Passwort fehlt!")  //
		GOTO OBJECT:C206(*; "fo_Passwort")
	: ($es_Doppelt.length>0)
		ALERT:C41("Benutzer existiert bereits!\rVerwenden Sie einen anderen Benutzername!")
		//ALERT("Verwenden Sie einen anderen Benutzername!")
		GOTO OBJECT:C206(*; "fo_Benutzername")
	: (Length:C16(Form:C1466.Passwort)<$l_Min)
		ALERT:C41("Passwort muss mind. "+String:C10($l_Min)+" Buchstaben haben!")  //
		GOTO OBJECT:C206(*; "Passwort")
	: (Not:C34(Password_Check(Form:C1466.Passwort)))
		ALERT:C41("Passwort muss Klein- und Großbuchstaben enthalten!")
		GOTO OBJECT:C206(*; "Passwort")
	: (Not:C34(SameString(Form:C1466.Passwort; Form:C1466.Confirm)))
		ALERT:C41("Die Passwörter sind nicht identisch!")  //
		GOTO OBJECT:C206(*; "Passwort")
		
	Else 
		$e_NewPerson:=ds:C1482.Person.new()
		$e_NewPerson.Vorname:=Form:C1466.Vorname
		$e_NewPerson.Nachname:=Form:C1466.Nachname
		$e_NewPerson.Geburtstag:=Form:C1466.Geburtstag
		$o_SavingResult:=$e_NewPerson.save()
		
		If ($o_SavingResult.success)  //go on
			
			$e_NewBenutzer:=ds:C1482.Logindaten.new()
			$e_NewBenutzer.Benutzer:=Form:C1466.Benutzername
			$e_NewBenutzer.Passwort:=Form:C1466.Passwort
			$e_NewBenutzer.Person_ID:=$e_NewPerson.ID
			
			$o_SaveResult:=$e_NewBenutzer.save()
			
			If ($o_SaveResult.success)  //go on
				ALERT:C41("Benutzer wurde erfolgreich registriert!")
				Form:C1466.Vorname:=""
				Form:C1466.Nachname:=""
				Form:C1466.Geburtstag:=""
				Form:C1466.Benutzername:=""
				Form:C1466.Passwort:=""
				Form:C1466.Confirm:=""
				
				
			Else   //stop
				
				ALERT:C41("Die Person konnte nicht gesichert werden. Deshalb wurde auch kein Passwort gespeichert!")
				
			End if 
		End if 
End case 






