C_LONGINT:C283($0; $l_DatabaseEvent)
$0:=Error
Error:=0

$l_DatabaseEvent:=Trigger event:C369

Case of 
	: ($l_DatabaseEvent=On Saving New Record Event:K3:1)
		$0:=TRS_Land
		//ON ERR CALL("OnErrCall")
		
	: ($l_DatabaseEvent=On Saving Existing Record Event:K3:2)
		$0:=TRS_Land
		//ON ERR CALL("OnErrCall")
		
	: ($l_DatabaseEvent=On Deleting Record Event:K3:3)
		$0:=TRS_LandNotDelete
		
		
End case 
