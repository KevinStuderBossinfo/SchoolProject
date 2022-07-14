
C_OBJECT:C1216($es_LoginData)


Case of 
	: (Form:C1466.LoginBenutzer="")
		ALERT:C41("Benutzer fehlt!")
		GOTO OBJECT:C206(*; "fo_LoginBenutzer")
	: (Form:C1466.LoginPasswort="")
		ALERT:C41("Passwort fehlt!")
		GOTO OBJECT:C206(*; "LoginPasswort")
	Else 
		
		$es_LoginData:=ds:C1482.Logindaten.query("Benutzer = :1 AND Passwort =:2"; Form:C1466.LoginBenutzer; Form:C1466.LoginPasswort)
		
		Case of 
			: ($es_LoginData.length=0)
				ALERT:C41("Logindaten sind nicht korrekt!")
			: (Not:C34(SameString(Form:C1466.LoginBenutzer; $es_LoginData[0].Benutzer)))
				ALERT:C41("Benutzer falsch!")
				GOTO OBJECT:C206(*; Form:C1466.LoginBenutzer)
			: (Not:C34(SameString(Form:C1466.LoginPasswort; $es_LoginData[0].Passwort)))
				ALERT:C41("Passwort falsch!")
				GOTO OBJECT:C206(*; Form:C1466.LoginPasswort)
			: ($es_LoginData.length=1)
				//$l_Person_ID:=$es_LoginData[0].Person_ID
				
				ALERT:C41("Anmeldung erfolgreich!")
				
				DIALOG:C40("Page")  // Zugang School Page
			Else 
				ALERT:C41("Mehrere Logindaten gefunden!")
		End case 
		
		
End case 