Case of 
	: (Form event code:C388=On Clicked:K2:4)
		OBJECT SET ENABLED:C1123(*; "Schaltfläche18"; ab_1>0)
		
		
		//: (Form event code=On Data Change)
		//For ($i; 1; Size of array(at_ID))
		//ab_1{$i}:=False
		//End for 
End case 
