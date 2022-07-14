Case of 
	: (Form event code:C388=On Load:K2:1)
		
		
		//Database named Selection?
		//ALL RECORDS([Lehrer])
		
		
		
		
		
		ARRAY LONGINT:C221(at_ID; 0)
		ARRAY TEXT:C222(at_Vorname; 0)
		ARRAY TEXT:C222(at_Nachname; 0)
		ARRAY TEXT:C222(at_Wohnort; 0)
		
		SELECTION TO ARRAY:C260([Lehrer:4]ID:1; at_ID; [Lehrer:4]Vorname:2; at_Vorname; [Lehrer:4]Nachname:3; at_Nachname; [Lehrer:4]Wohnort:4; at_Wohnort)
		
		
		//Entity Selection in ListBox!
		//In Ausdruck muss mit This."Spaltenname" gearbeitet werden
		//es_Lehrer:=ds.Lehrer.query("Vorname = :1"; "K@")
		es_Lehrer:=ds:C1482.Lehrer.all()
		
		
		
		
		
End case 
