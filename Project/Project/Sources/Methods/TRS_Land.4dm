//%attributes = {}
C_LONGINT:C283($0)

$0:=0

Case of 
	: ([Land:11]Abkürzung:3="")
		$0:=-15001
	: ([Land:11]Land:2="")
		$0:=-15002
End case 
