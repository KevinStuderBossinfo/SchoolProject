
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (Form:C1466.es_Selected.length>0)
			OBJECT SET ENABLED:C1123(*; "Schaltfläche11"; True:C214)
		Else 
			OBJECT SET ENABLED:C1123(*; "Schaltfläche11"; False:C215)
		End if 
End case 
