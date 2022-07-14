Case of 
	: (Form event code:C388=On Load:K2:1)
		
		ALL RECORDS:C47([Logindaten:3])
		
End case 



//Form.es_mySelection:=ds.Logindaten

Case of 
	: (Button1=1)
		QUERY:C277([Logindaten:3]; [Logindaten:3]Benutzer:2="K@")
	: (Button2=1)
		QUERY:C277([Logindaten:3]; [Logindaten:3]Benutzer:2="S@")
	: (Button3=1)
		QUERY:C277([Logindaten:3]; [Logindaten:3]Benutzer:2="M@")
		
End case 
