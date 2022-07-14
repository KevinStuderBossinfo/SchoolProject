

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		
		
		ALL RECORDS:C47([Logindaten:3])  ///////////-----------------------All Data Listbox 1
		CREATE EMPTY SET:C140([Logindaten:3]; "set_Selected")
		OBJECT SET ENABLED:C1123(*; "Schaltfläche2"; False:C215)
		
		
		
		
		ARRAY LONGINT:C221(at_ID; 0)  ///////////////-----------------------Arrays Listbox 3
		ARRAY TEXT:C222(at_Benutzer; 0)
		ARRAY TEXT:C222(at_Passwort; 0)
		
		SELECTION TO ARRAY:C260([Logindaten:3]ID:1; at_ID; [Logindaten:3]Benutzer:2; at_Benutzer; [Logindaten:3]Passwort:3; at_Passwort)
		
		ARRAY BOOLEAN:C223(ab_NichtZeigen; Size of array:C274(at_ID))
		
		C_LONGINT:C283($i)
		For ($i; 1; Size of array:C274(at_ID))
			ab_NichtZeigen{$i}:=False:C215
			OBJECT SET ENABLED:C1123(*; "Schaltfläche18"; False:C215)
		End for 
		
		
		
		
		
		
		Form:C1466.es_mySelection:=ds:C1482.Logindaten.all()  ///////--------------------Entity Selection Listbox 2
		OBJECT SET ENABLED:C1123(*; "Schaltfläche11"; False:C215)
		
		
		
		
		
		
		
		Form:C1466.myCollection:=ds:C1482.Logindaten.query("Benutzer = :1"; "K@").toCollection()  ////////---------------------------Collection Listbox4
		Form:C1466.myCollectionSelected:=New collection:C1472
		OBJECT SET ENABLED:C1123(*; "Schaltfläche12"; (Form:C1466.myCollectionSelected.length>0))
		
		
End case 





