
If (Form:C1466.es_Selected.length>0)
	Form:C1466.es_mySelection:=Form:C1466.es_Selected.query("Benutzer = :1"; "s@")
	OBJECT SET ENABLED:C1123(*; "Schaltfläche11"; False:C215)
Else 
	Form:C1466.es_mySelection:=ds:C1482.Logindaten.query("Benutzer = :1"; "s@")
	OBJECT SET ENABLED:C1123(*; "Schaltfläche11"; False:C215)
End if 



