
If (Form:C1466.myCollectionSelected.length>0)
	Form:C1466.myCollection:=Form:C1466.myCollectionSelected.query("Benutzer = :1"; "K@")
	OBJECT SET ENABLED:C1123(*; "Schaltfläche12"; False:C215)
Else 
	Form:C1466.myCollection:=ds:C1482.Logindaten.query("Benutzer = :1"; "K@").toCollection()
	Form:C1466.myCollectionSelected:=New collection:C1472
	OBJECT SET ENABLED:C1123(*; "Schaltfläche12"; (Form:C1466.myCollectionSelected.length>0))
End if 
