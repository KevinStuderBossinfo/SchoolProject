
C_LONGINT:C283($i)
For ($i; 1; Size of array:C274(at_ID))
	If (at_Benutzer{$i}="m@")
		ab_NichtZeigen{$i}:=False:C215
		OBJECT SET ENABLED:C1123(*; "Schaltfläche18"; False:C215)
	Else 
		ab_NichtZeigen{$i}:=True:C214
		OBJECT SET ENABLED:C1123(*; "Schaltfläche18"; False:C215)
	End if 
End for 