Class constructor
	This:C1470.Test:="Test Text"
	This:C1470.testvalue:=2
	
Function TestCalculation()->$t_Test : Text
	$t_Test:=String:C10(This:C1470.testvalue+1)+This:C1470.Test