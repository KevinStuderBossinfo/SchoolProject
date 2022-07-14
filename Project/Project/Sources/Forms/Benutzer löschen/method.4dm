Case of 
	: (Form event code:C388=On Load:K2:1)
		es_Benutzer:=ds:C1482.Logindaten.all()
		
		Form:C1466.es_selectedRecs:=ds:C1482.Logindaten.newSelection()
		
End case 
