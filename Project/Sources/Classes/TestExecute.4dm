Class constructor($o_CLASS : cs:C1710.TestClass)  //4D.Class)
	This:C1470.o_Class:=$o_CLASS
	
Function ExecuteThis()->$t_Test : Text
	
	If (OB Instance of:C1731(This:C1470.o_Class; cs:C1710.TestClass))
		$t_Test:=This:C1470.o_Class.TestCalculation()
	End if 