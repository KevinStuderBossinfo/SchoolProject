
If (Records in set:C195("set_Selected")>0)
	
	QUERY:C277([Logindaten:3]; [Logindaten:3]Benutzer:2="K@")
	CREATE SET:C116([Logindaten:3]; "startsWithK")
	INTERSECTION:C121("startsWithK"; "set_Selected"; "startK")
	USE SET:C118("startK")
	OBJECT SET ENABLED:C1123(*; "Schaltfläche2"; False:C215)
	
Else 
	QUERY:C277([Logindaten:3]; [Logindaten:3]Benutzer:2="K@")
	
	OBJECT SET ENABLED:C1123(*; "Schaltfläche2"; False:C215)
	
End if 

CLEAR SET:C117("startsWithK")
CLEAR SET:C117("startK")