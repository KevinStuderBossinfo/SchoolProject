
If (Form:C1466.myCollectionSelected.length>0)
	Form:C1466.myCollection:=Form:C1466.myCollectionSelected
	Form:C1466.myCollectionSelected:=New collection:C1472
	OBJECT SET ENABLED:C1123(*; "Schaltfläche12"; (Form:C1466.myCollectionSelected.length>0))
	
End if 
