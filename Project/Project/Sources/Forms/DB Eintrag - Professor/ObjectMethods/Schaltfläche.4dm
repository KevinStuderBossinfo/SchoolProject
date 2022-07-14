
var eingabe_id_lehrer : Integer
var eingabe_vorname_lehrer : Text
var eingabe_nachname_lehrer : Text
var eingabe_wohnort_lehrer : Text
var eingabe_strasse_lehrer : Text
var eingabe_hausnummer_lehrer : Integer
var eingabe_plz_lehrer : Integer
var dropdownmenu_lehrer_fach : Text
var beispieltext : Text
var vfound : Boolean





C_OBJECT:C1216($o_newProfessor; $o_Result)
C_TEXT:C284(t_Vorname; t_Nachname; db_eintrag_wohnort; db_eintrag_strasse)
C_LONGINT:C283(db_eintrag_id; db_eintrag_plz; db_eintrag_hausnummer; $counter_true)


//VFOUND MUSS ANDERST PLATZIERT WERDEN

$counter_true:=0
$o_newProfessor:=ds:C1482.Lehrer.new()
$o_newProfessor.ID:=eingabe_id_lehrer
vfound:=Match regex:C1019("\\d"; String:C10(eingabe_id_lehrer); 1; *)
If (vfound)
	
	$o_newProfessor.Vorname:=eingabe_vorname_lehrer
	$counter_true:=$counter_true+1
Else 
	ALERT:C41("Format für "+$o_newProfessor.ID+" stimmt nicht")
End if 
vfound:=False:C215
vfound:=Match regex:C1019("^[a-zA-ZäöüßÄÖÜ]+$"; eingabe_vorname_lehrer; 1; *)



If (vfound)
	$counter_true:=$counter_true+1
	$o_newProfessor.Nachname:=eingabe_nachname_lehrer
	
Else 
	ALERT:C41("Format stimmt nicht")
End if 

vfound:=False:C215
vfound:=Match regex:C1019("^[a-zA-ZäöüßÄÖÜ]+$"; eingabe_nachname_lehrer; 1; *)



If (vfound)
	$counter_true:=$counter_true+1
	
	$o_newProfessor.Wohnort:=eingabe_wohnort_lehrer
	
Else 
	ALERT:C41("Format stimmt nicht")
End if 

vfound:=False:C215
vfound:=Match regex:C1019("^[a-zA-ZäöüßÄÖÜ]+$"; eingabe_wohnort_lehrer; 1; *)

If (vfound)
	$counter_true:=$counter_true+1
	$o_newProfessor.Strasse:=eingabe_strasse_lehrer
	
Else 
	ALERT:C41("Format stimmt nicht")
	
End if 

vfound:=False:C215
vfound:=Match regex:C1019("^[a-zA-ZäöüßÄÖÜ]+$"; eingabe_strasse_lehrer; 1; *)
If (vfound)
	$counter_true:=$counter_true+1
	$o_newProfessor.Hausnummer:=eingabe_hausnummer_lehrer
	
Else 
	ALERT:C41("Format stimmt nicht")
End if 

vfound:=False:C215
vfound:=Match regex:C1019("\\d"; String:C10(eingabe_hausnummer_lehrer); 1; *)

If (vfound)
	$counter_true:=$counter_true+1
	$o_newProfessor.Postleitzahl:=eingabe_plz_lehrer
	
Else 
	ALERT:C41("Format stimmt nicht")
	
	
End if 

vfound:=False:C215
vfound:=Match regex:C1019("\\d"; String:C10(eingabe_plz_lehrer); 1; *)

If (vfound)
	$counter_true:=$counter_true+1
	$o_newProfessor.Fach:=dropdownmenu_lehrer_fach
	
Else 
	ALERT:C41("Format stimmt nicht")
	
End if 
vfound:=False:C215
vfound:=Match regex:C1019("^[a-zA-ZäöüßÄÖÜ]+$"; dropdownmenu_lehrer_fach; 1; *)

If ($counter_true=7)
	$o_Result:=$o_newProfessor.save()
	$o_newProfessor:=Null:C1517
	ALERT:C41("Lehrer wurde erfolgreich erstellt")
	
Else 
	ALERT:C41("Format stimmt nicht")
End if 








