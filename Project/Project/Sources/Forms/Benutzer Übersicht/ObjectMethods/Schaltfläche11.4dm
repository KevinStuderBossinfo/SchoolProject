If (Form:C1466.es_Selected.length>0)
	Form:C1466.es_mySelection:=Form:C1466.es_Selected
	OBJECT SET ENABLED:C1123(*; "Schaltfläche11"; False:C215)
	
	
Else 
	OBJECT SET ENABLED:C1123(*; "Schaltfläche11"; False:C215)
End if 
