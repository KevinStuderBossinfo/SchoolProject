//%attributes = {}
C_TEXT:C284($1)
C_LONGINT:C283($2)
C_BOOLEAN:C305($0)

C_LONGINT:C283($l_Length; $l_Min)
C_TEXT:C284($t_Length)
C_BOOLEAN:C305($b_Length)


$t_Length:=$1
$l_Min:=$2
$l_Length:=Length:C16($t_Length)

If ($l_Length>$l_Min)
	$b_Length:=True:C214
Else 
	$b_Length:=False:C215
End if 

$0:=$b_Length