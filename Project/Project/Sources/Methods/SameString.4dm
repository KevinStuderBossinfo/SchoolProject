//%attributes = {}
C_TEXT:C284($1; $2)
C_BOOLEAN:C305($0)

C_TEXT:C284($t_StringOne; $t_StringTwo)
C_BOOLEAN:C305($b_Is_Identic)

C_LONGINT:C283($l_Length; $i)

$t_StringOne:=$1
$t_StringTwo:=$2

$b_Is_Identic:=True:C214


$l_Length:=Length:C16($t_StringOne)

If ($l_Length#Length:C16($t_StringTwo))
	$b_Is_Identic:=False:C215
	
Else 
	For ($i; 1; $l_Length)
		If (Character code:C91($t_StringOne[[$i]])#Character code:C91($t_StringTwo[[$i]]))
			$b_Is_Identic:=False:C215
			$i:=$l_Length+1
		End if 
	End for 
	
End if 


$0:=$b_Is_Identic