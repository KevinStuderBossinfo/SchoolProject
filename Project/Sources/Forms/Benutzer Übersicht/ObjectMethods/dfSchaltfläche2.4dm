
If (Records in set:C195("set_Selected")>0)
	
	QUERY:C277([Logindaten:3]; [Logindaten:3]Benutzer:2="S@")
	CREATE SET:C116([Logindaten:3]; "startsWithS")
	INTERSECTION:C121("startsWithS"; "set_Selected"; "startS")
	USE SET:C118("startS")
	OBJECT SET ENABLED:C1123(*; "Schaltfläche2"; False:C215)
	
Else 
	QUERY:C277([Logindaten:3]; [Logindaten:3]Benutzer:2="S@")
	
	OBJECT SET ENABLED:C1123(*; "Schaltfläche2"; False:C215)
	
End if 

CLEAR SET:C117("startsWithS")
CLEAR SET:C117("startS")