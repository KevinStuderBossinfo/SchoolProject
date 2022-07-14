C_OBJECT:C1216($e_NewAdress; $o_SaveResult; $es_PersonID; $es_OrtID)




Case of 
	: (Form:C1466.PLZ="")
		ALERT:C41("PLZ fehlt!")
		GOTO OBJECT:C206(*; "fo_Vorname")
	: (Form:C1466.Ortschaft="")
		ALERT:C41("Ortschaft fehlt!")
		GOTO OBJECT:C206(*; "fo_Ortschaft")
	: (Form:C1466.Strasse="")
		ALERT:C41("Strasse fehlt!")
		GOTO OBJECT:C206(*; "fo_Strasse")
	: (Form:C1466.Hausnummer="")
		ALERT:C41("Hausnummer fehlt!")
		GOTO OBJECT:C206(*; "fo_Hausnummer")
		
	Else 
		$e_NewAdress:=ds:C1482.Adresse.new()
		
		$es_PersonID:=ds:C1482.Logindaten.query("Benutzer = :1"; Form:C1466.Benutzer)
		$e_NewAdress.Person_ID:=$es_PersonID[0].Person_ID
		
		$es_OrtID:=ds:C1482.Ortschaft.query("PLZ = :1 AND Ortschaft = :2"; Form:C1466.PLZ; Form:C1466.Ortschaft)
		
		
		If ($es_OrtID.length#1)
			ALERT:C41("PLZ und Ortschaft überprüfen!\rOrtschaft und PLZ stimmen nicht überein\roder existieren nicht!")
			GOTO OBJECT:C206(*; "fo_Ortschaft")
			
		Else 
			$e_NewAdress.Ortschaft_ID:=$es_OrtID[0].ID
			$e_NewAdress.Strasse:=Form:C1466.Strasse
			$e_NewAdress.Hausnummer:=Form:C1466.Hausnummer
			$o_SaveResult:=$e_NewAdress.save()
			
			If ($o_SaveResult.success)
				ALERT:C41("Adresse wurde ergänzt!")
				
			Else 
				ALERT:C41("Adresse Konnte nicht ergänzt werden!")
				
			End if 
		End if 
End case 
