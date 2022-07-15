//%attributes = {}

C_OBJECT:C1216($e_Test; $es_Test; $o_Status)
$es_Test:=ds:C1482.Logindaten.query("ID=:1"; "15")
$e_Test:=$es_Test.first()
$o_Status:=$e_Test.drop()


