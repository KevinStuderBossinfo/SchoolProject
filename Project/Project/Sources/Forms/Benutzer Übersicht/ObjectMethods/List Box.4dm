

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (Records in set:C195("set_Selected")>0)
			OBJECT SET ENABLED:C1123(*; "Schaltfläche2"; True:C214)
		Else 
			OBJECT SET ENABLED:C1123(*; "Schaltfläche2"; False:C215)
		End if 
End case 
