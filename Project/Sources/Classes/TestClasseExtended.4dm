Class extends TestClass

Class constructor
	Super:C1705()
	This:C1470.Test:=" ExtendedTest Text"
	
Function TestCalculation()->$t_Test : Text
	$l_testvaluebefore:=This:C1470.testvalue
	This:C1470.testvalue:=3
	$t_Test:=Super:C1706.TestCalculation()
	This:C1470.testvalue:=$l_testvaluebefore
	$t_Test:=$t_Test+"\r"+Super:C1706.TestCalculation()