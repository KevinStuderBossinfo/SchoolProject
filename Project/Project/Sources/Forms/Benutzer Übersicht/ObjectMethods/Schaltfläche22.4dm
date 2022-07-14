
C_LONGINT:C283($i)
For ($i; 1; Size of array:C274(at_ID))
	If (at_Benutzer{$i}="k@")
		ab_NichtZeigen{$i}:=False:C215
		OBJECT SET ENABLED:C1123(*; "Schaltfläche18"; False:C215)
	Else 
		ab_NichtZeigen{$i}:=True:C214
		OBJECT SET ENABLED:C1123(*; "Schaltfläche18"; False:C215)
	End if 
End for 


//C_LONGINT($i)


//For ($i; 1; Size of array(at_ID))
//If (at_Benutzer{$i}="k@")
//ab_NichtZeigen{$i}:=False
//OBJECT SET ENABLED(*; "Schaltfläche18"; False)
//If (ab_1{$i}=True)
//ab_NichtZeigen{$i}:=False
//Else 
//ab_NichtZeigen{$i}:=True
//End if 
//Else 
//ab_NichtZeigen{$i}:=True
//OBJECT SET ENABLED(*; "Schaltfläche18"; False)
//End if 
//End for 


//Case of 
//: (Form event code=On Selection Change)


//For ($i; 1; Size of array(at_ID))
//If (at_Benutzer{$i}="k@")
//ab_NichtZeigen{$i}:=False
//Else 
//ab_NichtZeigen{$i}:=True
//End if 
//End for 
//End case 

