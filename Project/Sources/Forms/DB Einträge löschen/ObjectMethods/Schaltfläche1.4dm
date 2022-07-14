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
C_OBJECT:C1216($es_Selected_Lehrer_to_delete; $status)
var countervariable : Integer
var es_Selected_Lehrer_entity_id : Integer

For (countervariable; 0; (es_Selected_Lehrer.length-1))
	es_Selected_Lehrer_entity_id:=es_Selected_Lehrer[countervariable].ID
	$es_Selected_Lehrer_to_delete:=ds:C1482.Lehrer.query("ID=:1"; es_Selected_Lehrer_entity_id)
	$status:=$es_Selected_Lehrer_to_delete.drop()
End for 
es_Lehrer:=ds:C1482.Lehrer.all()



//ALERT(String(es_Selected_Lehrer[1].Vorname))


//ALERT(String(es_Selected_Lehrer.length))