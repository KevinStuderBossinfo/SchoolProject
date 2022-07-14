//%attributes = {}

// ----------------------------------------------------
// User name (OS): kstuder
// Date and time: 09.06.22, 09:44:19
// ----------------------------------------------------
// Method: Password_Check
// Description
// Abfrage Passwort Anforderung: Klein-/Grossbuchstaben 
// erforderlich! 
//
// Parameters($1)
// $0: $b_OK
// ----------------------------------------------------




C_TEXT:C284($1)


C_TEXT:C284($t_New_Password)
C_LONGINT:C283($i; $l_Length; $l_End)
C_BOOLEAN:C305($b_OK; $b_End; $0)

$t_New_Password:=$1
$b_OK:=False:C215
$l_Length:=Length:C16($t_New_Password)


For ($i; 1; $l_Length)
	If ((Character code:C91($t_New_Password[[$i]])>64) & (Character code:C91($t_New_Password[[$i]])<91))  //---grossbuchstaben
		$b_OK:=True:C214
		$i:=$l_Length+1
	End if 
End for 


If ($b_OK)
	$b_OK:=False:C215
	For ($i; 1; $l_Length)
		If ((Character code:C91($t_New_Password[[$i]])>96) & (Character code:C91($t_New_Password[[$i]])<123))  //---kleinbuchstaben
			$b_OK:=True:C214
			$i:=$l_Length+1
		End if 
	End for 
End if 

$l_End:=$l_Length+2
If ($i=$l_End)
	$b_End:=True:C214
Else 
	$b_End:=False:C215
End if 

$0:=$b_End


