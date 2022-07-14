//btn_delete_selected_teacher
/*
var beispieltext : Text
var vfound : Boolean

beispieltext:="Hioi999"

vfound:=Match regex("[A-Z][a-z][0-9]"; beispieltext; 1; *)

If (vfound)
ALERT("match")
Else 
ALERT("no match")
End if 

*/
C_OBJECT:C1216($es_Selected_Benutzer_to_delete; $status; $es_Selected_Benutzer)
C_LONGINT:C283(noofCount; l_Selected_Benutzer_entity_id)


For (noofCount; 0; (es_Selected_Benutzer.length-1))
	l_Selected_Benutzer_entity_id:=es_Selected_Benutzer[noofCount].ID
	$es_Selected_Benutzer_to_delete:=ds:C1482.Logindaten.query("ID=:1"; l_Selected_Benutzer_entity_id)
	$status:=$es_Selected_Benutzer_to_delete.drop()
End for 
es_Benutzer:=ds:C1482.Logindaten.all()



//ALERT(String(es_Selected_Lehrer[1].Vorname))


//ALERT(String(es_Selected_Lehrer.length))