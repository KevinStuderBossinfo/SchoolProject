
If (Records in set:C195("set_Selected")>0)
	
	QUERY:C277([Logindaten:3]; [Logindaten:3]Benutzer:2="M@")
	CREATE SET:C116([Logindaten:3]; "startsWithM")
	INTERSECTION:C121("startsWithM"; "set_Selected"; "startM")
	USE SET:C118("startM")
	OBJECT SET ENABLED:C1123(*; "Schaltfläche2"; False:C215)
	
Else 
	QUERY:C277([Logindaten:3]; [Logindaten:3]Benutzer:2="M@")
	
	OBJECT SET ENABLED:C1123(*; "Schaltfläche2"; False:C215)
	
End if 

CLEAR SET:C117("startsWithM")
CLEAR SET:C117("startM")