C_OBJECT:C1216($es_Benutzer)




Case of 
	: (Form:C1466.Benutzer="")
		ALERT:C41("Benutzer eingeben!")
	Else 
		$es_Benutzer:=ds:C1482.Logindaten.query("Benutzer= :1"; Form:C1466.Benutzer)
		If ($es_Benutzer.length=1)
			Form:C1466.Vorname:=$es_Benutzer[0].y1_ToPerson.Vorname
			Form:C1466.Nachname:=$es_Benutzer[0].y1_ToPerson.Nachname
		End if 
		
End case 