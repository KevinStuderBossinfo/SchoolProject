/*var beispieltext : Text
var vfound : Boolean



beispieltext:="abc123"



vfound:=Match regex("\\d"; beispieltext; 1; *)



If (vfound)
ALERT("match")
Else 
ALERT("no match")
End if 
*/


var beispieltext : Text
var vfound : Boolean
C_OBJECT:C1216($o_newProfessor)



beispieltext:="Hampi"

vfound:=Match regex:C1019("^[a-zA-ZäöüßÄÖÜ]+$"; beispieltext; 1; *)



//$o_newProfessor.Vorname:=eingabe_vorname_lehrer
//vfound:=Match regex("^[a-zA-ZäöüßÄÖÜ]+$"; eingabe_vorname_lehrer; 1; *)

If (vfound)
	ALERT:C41("match")
Else 
	ALERT:C41("no match")
End if 
