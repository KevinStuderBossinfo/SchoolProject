
//C_LONGINT($i)
//For ($i; 1; Size of array(at_ID))
//If (at_Benutzer{$i}="m@")
//ab_NichtZeigen{$i}:=False
//OBJECT SET ENABLED(*; "Schaltfläche18"; False)
//Else 
//ab_NichtZeigen{$i}:=True
//OBJECT SET ENABLED(*; "Schaltfläche18"; False)
//End if 
//End for 


C_LONGINT:C283($i)

For ($i; 1; Size of array:C274(at_ID))
	If (at_Benutzer{$i}="m@")
		ab_NichtZeigen{$i}:=False:C215
		OBJECT SET ENABLED:C1123(*; "Schaltfläche18"; False:C215)
		If (ab_1{$i}=True:C214)
			ab_NichtZeigen{$i}:=False:C215
		Else 
			//ab_NichtZeigen{$i}:=True
		End if 
	Else 
		ab_NichtZeigen{$i}:=True:C214
		OBJECT SET ENABLED:C1123(*; "Schaltfläche18"; False:C215)
	End if 
	ab_1{$i}:=False:C215
End for 