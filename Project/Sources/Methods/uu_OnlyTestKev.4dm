//%attributes = {}


//QUERY([Logindaten]; [Logindaten]Benutzer="K@")


//QUERY([Logindaten]; [Logindaten]Benutzer="k@")
//For ($i; 2; Records in selection([Logindaten]))
//CREATE RECORD([Test])
//[Test]ID:=[Logindaten]ID
//SAVE RECORD([Test])
//End for 

//C_OBJECT($o_MyFormDatas)
//$o_MyFormDatas:=New object()
//$o_MyFormDatas.d_date:=Current date
//$o_MyFormDatas.es_startDatas:=ds.Logindaten.query("Benutzer = :1"; "K@")
//DIALOG("Benutzer löschen"; $o_MyFormDatas




//////////-------------Creat Set/Selections/Named Selections------------////////////////


//ALL RECORDS([Logindaten])

//QUERY([Logindaten]; [Logindaten]Benutzer="k@")
//CREATE SET([Logindaten]; "StartWithK")

//QUERY([Logindaten]; [Logindaten]Benutzer="S@")
//ADD TO SET([Logindaten]; "StartWithK")

//QUERY([Logindaten]; [Logindaten]Benutzer="H@")
//CREATE SET([Logindaten]; "StartWithH")
//COPY NAMED SELECTION([Logindaten]; "StartWithH")

//QUERY([Logindaten]; [Logindaten]Benutzer="M@")
//CREATE SET([Logindaten]; "StartWithM")
//COPY NAMED SELECTION([Logindaten]; "StartWithM")


//If (Records in selection([Logindaten])=1)
//USE SET("StartWithK")

//If (Records in selection([Logindaten])=6)
//USE NAMED SELECTION("StartWithH")

//End if 

//Else 
//ALERT("not good")

//End if 

//UNION("StartWithH"; "StartWithK"; "CombinedSet")

//CLEAR SET("StartWithH")
//CLEAR SET("StartWithK")
//CLEAR SET("StartWithM")
//CLEAR SET("CombinedSet")

//If (Records in selection([Logindaten])=0)
//ALERT("good job")
//Else 
//ALERT(String(Records in selection([Logindaten])))

//End if 


//CLEAR NAMED SELECTION("StartWithM")
//CLEAR NAMED SELECTION("StartWithH")




/////////////----------------Gross Buchstaben bei jedem Wort---------------//////////

//var $t_Text : Text
//var $i_Length : Integer
//var $i_Char : Integer



//$t_Text:="kevin studer hallo"  //----------------"Kevin Studer Hallo"
//$i_Length:=Length($t_Text)
//If ($i_Length>0)
//$t_Text[[1]]:=Uppercase($t_Text[[1]])
//For ($i_Char; 1; $i_Length-1)
//If (Position($t_Text[[$i_Char]]; " !&()-{}:;<>?/,.=+*")>0)
//$t_Text[[$i_Char+1]]:=Uppercase($t_Text[[$i_Char+1]])
//End if 
//End for 
//End if 


//$t_Text:="kevin studer"
//$i_Length:=Length($t_Text)
//If ($i_Length>0)
//$t_Text[[1]]:=Uppercase($t_Text[[1]])
//For ($i_Char; 1; $i_Length-1)
//If (Position($t_Text[[$i_Char]]; " ")>0)
//$t_Text[[$i_Char+1]]:=Uppercase($t_Text[[$i_Char+1]])
//End if 
//End for 
//End if 

///////////////////-----------------------New Locked--------------------------//////////////////


//var $e_Test : Object
//var $o_Result : Object
//var $t_Error : Text


//ds.startTransaction()

//$e_Test:=ds.Person.get(60)
//$e_TestLock:=$e_Test.lock()
//If ($e_TestLock.success)
//Else 
//$t_Error:="bereits gesperrt"
//End if 



//If ($e_Test=Null)
//$t_Error:="Datensatz existiert nicht."

//Else 
//$e_Test.Nachname:="NewNameABC"
//$o_Result:=$e_Test.save()

//If ($o_Result.success)
//$t_Error:=""

//Else 
//$t_Error:="Datensatz konnte nicht gespeichert werden."

//End if 

//End if 

//If ($t_Error="")
//ds.validateTransaction()
//ALERT("Nachname wurde geändert")

//Else 
//ds.cancelTransaction()
//ALERT($t_Error)

//End if 



///////////////////------------------------OLD Locked----------------//////////////////

//C_TEXT($t_Error)
//START TRANSACTION
//$t_Error:=""

//QUERY([Person]; [Person]Vorname="Sandro")


//Case of 
//: (Records in selection([Person])#1)
//$t_Error:="Nicht genau einen Sandro gefunden..."

//: (Locked([Person]))
//$t_Error:="Sandro gesperrt..."

//Else 
//[Person]Nachname:="NewNameAA"

//Error:=0
//SAVE RECORD([Person])
//End case 


//Error:=0
//CLEAR SET("LockedSet")
//APPLY TO SELECTION([Person]; [Person]Nachname:="NewName2")

//Case of 
////: (Records in set("LockedSet")>0)
////$t_Error:="Datensatz wird gerade verwendet"
//: (Error#0)
//$t_Error:="Fehler aufgetreten"
//End case 

//If ($t_Error="")
//VALIDATE TRANSACTION
//Else 
//CANCEL TRANSACTION
//ALERT($t_Error)
//End if 


//REDUCE SELECTION([Person]; 0)


///////////////---------------------Pointer-----------------///////////////////

//$MyVar:="Hello"
//$PointerOne:=->$MyVar
//$PointerTwo:=->$PointerOne
//($PointerTwo->)->:="Goodbye"
//ALERT(($PointerTwo->)->)

///////////////----------------------Orda Tests 27.06.2022-----------//////////////////

//C_OBJECT($es_Test)
//C_REAL($r_Test)
//$es_Test:=New collection

//$es_Test:=ds.Adresse.all().extract("Strasse")
//$e_Test:=$es_Test[1]


//C_REAL($es_Test)
//$es_Test:=ds.Person.all().average("ID")

//C_OBJECT($e_Test; $o_result; $es_Test)
//$e_Test:=ds.Logindaten.get(863)
//$e_Test.Benutzer:="SandroSuter"
////$e_Test.Nachname:="Mario"

//$o_result:=$e_Test.save()


//If ($e_Test.isNew())
//ALERT("Yes")
//Else 
//ALERT("no")
//End if 

//C_OBJECT($es_selection)

//$es_selection:=ds.Person.query("Vorname= :1"; "Kevin")
//$e_selection:=$es_selection[2]



//$t_test:=ds.Ortschaft.get(1)
//$t_testen:=ds.Ortschaft.get(2)
//$diff:=$t_test.diff($t_testen)


//C_COLLECTION($col_Test)
//$d_date:=Current time
//$col_Test:=New collection("Hallo"; 123; !1992-03-16!; $d_date)




///////////////----------------Test Querys/Abfragen-------------////////////////



//$e_Logindata:=ds.Logindaten.new()
//$e_Logindata.Benutzer:="Kevinzu"
//$e_Logindata.Passwort:="Kevinzu"
//$e_Logindata.Person_ID:=ds.Person.query("Vorname= :1"; "Kevin").ID[6]

//$o_SavingResult:=$e_Logindata.save()


//C_OBJECT($e_Test)
//$e_Test:=New object("Land_ID"; "1")
//$e1:=ds.Kanton.get(13; $e_Test)


//$es_Abfrage:=ds.Logindaten.query("Benutzer=:1"; "K@")
//$es_Abfrage:=ds.Logindaten.get(859)
//$es_Person:=$es_Abfrage.y1_ToPerson

//$es_Abfrage:=New object

//$es_Abfrage:=ds.Logindaten.newSelection()
//$e_Abfrage:=ds.Logindaten.new()


//////////-----------------------TEST Aufgabe Hebi 24.06.2022--------------------///////////////////

//C_LONGINT($i)
//C_OBJECT($e_Land; $o_SavingResult)
//C_TEXT($t_TestLand; $t_TestKuerzel)

//$t_TestLand:="ATEST"
//$t_TestKuerzel:="ATEST"
//$i:=0

//ON ERR CALL("OnErrNoCall")

//For ($i; 1; 100)
//$e_Land:=ds.Land.new()
//$e_Land.Land:=$t_TestLand+(String($i))
//$e_Land.Abkürzung:=$t_TestKuerzel+(String($i))

//Case of 
//: ($i=2)
//$e_Land.Abkürzung:=""
//: ($i=50)
//$e_Land.Abkürzung:=Null
//: ($i=75)
//$e_Land.Abkürzung:=""
//: ($i=100)
//$e_Land.Abkürzung:=Null
//Else 
//End case 
//$o_SavingResult:=$e_Land.save()
//If ($o_SavingResult.success)
////ALERT("gesichert"+String($i))
////$t_TestLand:=$t_TestLand+(String($i)
////$t_TestKuerzel:=$t_TestKuerzel+(String($i)
//Else 
//ALERT("Stop, Problem beim Sichern der Datei #"+(String($i)))
////$i:=1000
//End if 
//End for 

//ON ERR CALL("")

//////////--------------------Delete All Methode with Error & Transaction Check----------/////////////////
//var $i : Integer
//var $i_NoOfTable : Integer
//var $t_TableName : Variant
//var $es_NotDeleted : Object
//var $es_ToDelete : Object
//var $t_Error : Text

//$t_Error:=""

//ds.startTransaction()

//$i_NoOfTable:=ds.getDefinition().table.length

//For ($i; 0; $i_NoOfTable-1)
//$t_TableName:=ds.getDefinition().table[$i].name
//$es_ToDelete:=ds[$t_TableName].all()
//$es_NotDeleted:=$es_ToDelete.drop()
//If ($es_NotDeleted.length=0)
//ALERT("All data of the Datastore were successfull"

//y deleted!")"
//Else 
//$t_Error:="Fehler"
//ALERT("Stop delete process")
//End if 

//End for 

//If ($t_Error="")
//ds.validateTransaction()
//Else 
//ds.cancelTransaction()
//End if 


//////////-----------------Delete Methode with .length & Transaction Check--------------/////////////
//var $es_Land : Object
//var $o_SavingResult : Object

//ds.startTransaction()

//$es_Land:=ds.Land.all()
//$o_SavingResult:=$es_Land.drop()
//If ($o_SavingResult.length=0)
//ds.validateTransaction()
//ALERT("All data of the Land Datastore were successfully deleted!")
//Else 
//ds.cancelTransaction()
//ALERT("Data were not deleted!")
//End if 



//$t_Error:=""

//ds.startTransaction()
//bkabyl

//Case of 
//: ()


//: ()

//: ()
//If ()

//Else 

//Case of 
//: ()

//End case 

//End if 


//: (True)

//If ()

//End if 


//Else 

//End case 

//If ($t_Error="")
//validate transaction
//Else 

//end if



//$o_SavingResult:=ds.Land.all().drop()



//$es_Land:=ds.Land.get(294)
//$o_SavingResult:=$e_Land.drop()

//$es_land:=ds.Land.all()
//If ($es_Land.length>2)
//$e_Land:=$es_Land[2]
//End if 


//C_COLLECTION($col_Names)
//d_Datum:=Current date
//$col_Names:=New collection("Kevin"; 23.34; !00-00-00!; d_Datum)
//r_Number:=$col_Names[1]


//t_String:="fgsdflkjsdflfd"
//If (Length(t_String)>1)
//t_Char:=t_String[2]
//End if 


//C_OBJECT($es_Abfrage; $es_Person; $es_Adress; $es_Ort; $es_Kanton; $es_Land; )
//C_TEXT($e_person; $e_Ort; $e_Land)
//$es_Abfrage:=ds.Logindaten.query("Benutzer=:1"; "KevinTest")
//$es_Person:=$es_Abfrage[0].y1_ToPerson



//$e_person:=$es_Person.Nachname
//ALERT($e_person)
//$es_Adress:=$es_Person.yN_ToAdresse
//$es_Ort:=$es_Adress[0].y1_ToOrtschtaft
//$e_Ort:=$es_Ort.Ortschaft
//ALERT($e_Ort)
//$es_Kanton:=$es_ort.y1_ToKanton
//$es_Land:=$es_Kanton.y1_ToLand
//$e_Land:=$es_Land.Abkürzung
//ALERT($e_Land)
//$e_person:=$es_Person.Geburtstag
//ALERT(String($e_person))



//$es_Adress:=$es_Person[0].yN_ToAdresse
//$es_Ort:=$es_Adress[0].y1_ToOrtschtaft
//$es_Kanton:=$es_ort[0].y1_ToKanton
//$es_Land:=$es_Kanton[0].y1_ToLand




//////////////-------Land/Kanton/Ort erfassen -----------------/////////////////

//C_OBJECT($e_Land; $o_Land)  //------------New Land

//$e_Land:=ds.Land.new()
//$e_Land.Land:="Schweiz"
//$e_Land.Abkürzung:="CH"

//$o_Land:=$e_Land.save()

//C_OBJECT($e_Land; $o_Land)  //------------Change Existing Land

//ON ERR CALL("OnErrCall")

//$e_Land:=ds.Land.get(1650)
//$e_Land.Land:=""
//$e_Land.Abkürzung:="B"

//$o_Land:=$e_Land.save()
//ON ERR CALL("")

//C_OBJECT($e_Land; $o_Land)  //--------------Entity Land Drop
//ON ERR CALL("OnErrCall")

//$e_Land:=ds.Land.get(1652)

//$o_Land:=$e_Land.drop()

//ON ERR CALL("")

//C_OBJECT($e_Kanton; $o_Kanton)  //---------Kanton

//$e_Kanton:=ds.Kanton.new()
//$e_Kanton.Kanton:="Jura"
//$e_Kanton.Land_ID:=ds.Land.query("Land= :1"; "Schweiz").first().ID

//$o_Kanton:=$e_Kanton.save()

//C_OBJECT($e_Kanton; $o_Kanton) //--------- Löschen
//$e_Kanton:=ds.Kanton.query("Land_ID = :1"; "0")
//$o_Kanton:=$e_Kanton.drop()


//C_OBJECT($e_Ort; $o_Ort)  //---------Ort

//$e_Ort:=ds.Ortschaft.new()
//$e_Ort.Ortschaft:="Sursee"
//$e_Ort.PLZ:=4910
//$e_Ort.Kanton_ID:=ds.Kanton.query("Kanton= :1"; "Luzern").first().ID

//$o_Ort:=$e_Ort.save()


//////////---------------Querys über Relations Neu&Alt--------------//////////////


////Neu

//C_OBJECT($es_Logindaten; $e_Logindatum)
//C_TEXT($t_Nachname)
//$es_Logindaten:=ds.Logindaten.query("Benutzer=:1"; "MaximM")

//If ($es_Logindaten.length=1)
//$e_Logindatum:=$es_Logindaten[0].y1_ToPerson.Nachname
//$t_Nachname:=$e_Logindatum.y1_ToPerson.Nachname
//End if 


//$t_Nachname:=ds.Logindaten.query("Benutzer=:1"; "MaximM")[0].y1_ToPerson.Nachname  //Nicht optimal!

//////Alt

//QUERY([Logindaten]; [Logindaten]Benutzer="MaximM")
//If (Records in selection([Logindaten])=1)
//RELATE ONE([Logindaten]Person_ID)
//$t_Nachname:=[Person]Nachname
//End if 


///////////------------------------Form.---------------/////////////////////
//t_LoginBenutzer:="hebi"
//C_OBJECT($o_Formparameters)
//$o_Formparameters:=New object
//$o_Formparameters.t_irgendetwas:="Test"
//DIALOG("BenutzerLogin"; $o_Formparameters)


//C_OBJECT($o_Test)
//$o_Test:=New object
//$o_Test.t_irgendetwas:="Hallo"
//DIALOG("BenutzerLogin"; $o_Test)

/////////////////------------------only Test-----------------//////////////////////

//t_LoginBenutzer

//var $o_newBenutzer : Object
//var $o_result : Object
////var $t_vorname : Text
////var $t_nachname : Text
////var $t_ort : Text
////var $t_strasse : Text
////var $l_haus : Integer
////var $l_plz : Integer
////var $l_benID : Integer
////var $t_benutzer : Text


//$o_newBenutzer:=ds.Benutzerliste.new()
//$o_newBenutzer.Vorname:="Marco"
//$o_newBenutzer.Nachname:="Rudolf"
//$o_newBenutzer.Wohnort:="Gerlafingen"
//$o_newBenutzer.Strasse:="Hauptstrasse"
//$o_newBenutzer.Hausnummer:=4
//$o_newBenutzer.Postleitzahl:=4563
//$o_check:=ds.Benutzerdaten.query("Benutzer=Pat")

//If ($o_check.length=1)
//$o_newBenutzer.Benutzername:="Pat"
//$o_newBenutzer.Benutzerdaten_ID:=ds.Benutzerdaten.query("Benutzer=Grant").first().ID

//$o_result:=$o_newBenutzer.save()
//Else 
//ALERT("Benutzer existiert nicht!")
//End if 




/////////--------------------Variant--------------------/////////////////

//C_VARIANT($v)
//$v:="hello world"
//$v2:=$v  //assign variable to another variable

//$t:=Type($v)  // 13 (Is variant)
//$t2:=Type($v2)  // 3 (Is text)


////////////////////--------------------POINTER---------------/////////////////////

////////----Pointer Basics--------/////
//C_POINTER($p_Pointer)
//C_TEXT($myVar)
//$myVar:="hallo"

//$p_Pointer:=->$myVar


//ALERT($p_Pointer->)

//$p_Pointer->:="Bye"


//ALERT($myVar)

//$Table:=->[Benutzerdaten]ID
//$Table:=Field(3)

//////////////------------Array Longint with Pointer--------/////////////////
//ARRAY LONGINT($array; 10)
//C_POINTER($myPoint)
//$array{0}:=0
//$array{1}:=10
//$array{2}:=20
//$array{3}:=30
//$array{4}:=40
//$array{5}:=50
//$array{6}:=60
//$array{7}:=70
//$array{8}:=80
//$array{9}:=90
//$array{10}:=100

//$myPoint:=->$array{5}
//ALERT(String($myPoint->))


//$myPoint->:=55

//ALERT(String($myPoint->))
//$myPoint:=->$array
//SORT ARRAY($myPoint->; >)


//For ($i; 1; 10)
//ALERT(String($array{$i}))
//End for 

/////////////////-----------------Null and Undefined-----------------///////////////
//C_OBJECT($vEmp)
//$vEmp:=New object
//$vEmp.name:="Smith"
//$vEmp.children:=Null

//$undefined:=Undefined($vEmp.name)  // False
//$null:=($vEmp.name=Null)  //False

//$undefined:=Undefined($vEmp.children)  // False
//$null:=($vEmp.children=Null)  //True

//$undefined:=Undefined($vEmp.parent)  // True
//$null:=($vEmp.parent=Null)  //True


////////////---------------------Easy Query with alert legnth-----------------///////////////////////

////C_OBJECT($o_test)
//C_OBJECT($o_test)

//$o_test:=ds.Benutzerdaten.query("Benutzer = :1"; "K@")
//ALERT(String($o_test.length))
//$o_test:=Null
//ALERT(String($o_test.length))



//QUERY([Benutzerdaten]; [Benutzerdaten]Benutzer="K@")
//ALERT(String(Records in selection([Benutzerdaten])))







///////////////----------------------Method for class "Tier" and "Hund"---------///////////////

//C_OBJECT($o_Animal; $o_Tier)
//C_TEXT($t_Test; $t_haha)
//$o_Animal:=cs.Tier.new("kevin")
//$o_Tier:=cs.Hund.new()
//$t_Test:=$o_Animal.tellName()
//$t_haha:=$o_Tier.bark()



///////////////-------------------------Klassen einsetzen Test-------------------/////////////

//C_OBJECT($o_city)
//$o_city:=cs.city
//var $1; $zipcode : Integer
//var $zip : 4D.Entity
//var $0 : Text

//$1:=4563

//$zipcode:=$1
//$zip:=ds.ZipCode.get($zipcode)
//$0:=""

//If ($zip#Null)
//$0:=$zip.city.name
//End if 


//C_TEXT($t_GetText)
//C_OBJECT($o_cs)
//C_OBJECT($o_ClassDefinition)
//C_OBJECT($o_ClassInstance)

//$o_cs:=cs
//$o_ClassDefinition:=cs.TestClass
//$o_ClassDefinition:=$o_cs.TestClassExtended

//$o_ClassInstance:=cs.TestClass.new()
//$o_ClassInstance:=$o_cs.TestClass.new()
//$o_ClassInstance:=$o_ClassDefinition.new()

//$t_GetTExt:=$o_ClassInstance.TestCalculation()
//ALERT($t_GetText)


//ALERT(cs.TestClass.new().TestCalculation())
//ALERT(cs.TestClassExtended.new().TestCalculation())


///////////////////-------------------Method to class okay ------------/////////////
//var $test : Object
//var $text1 : Text
//var $text2 : Text
//var $result : Text

//$text1:="Kevin"
//$text2:="Studer"


//$test:=cs.ClassTest.new()


//$result:=$test.Spezial($text1; $text2)

//ALERT($result)



//C_OBJECT($o_test)
//$o_test:=New object()
//$o_test.testvalue:=2
//$o_test.formlThisObj:=Formula(JSON Stringify(This))
//$o_test.forml:=Formula(String(This.testvalue+1))
//ALERT($o_test.forml())
////ALERT($o_test.formlThisObj())
////ALERT(JSON Stringify($o_test))




////////////------------------------------JSON Postman-------------------------/////////////////////////////
//var ($t_url : Text; $t_header : Text; \
$tbrowserIP : Text; $t_serverIP : Text; \
$t_userName : Text; $t_password : Text)\
->$b_accepted : Boolean

//C_OBJECT($es_D; $es_t)


////$es_D:=ds.Benutzerdaten.query("Benutzer = :1"; "D@")
////If ($t_url="/rest_getD")

////$t_result:=JSON Stringify($es_D.toCollection())
////Else 
////$t_result:=JSON Stringify(New object("hey"; 5; "maybe"; "not"))
////End if 
////$es_D:=ds.Benutzerdaten.query("Benutzer = :1"; "K@")
////If ($t_url="/rest_getK")

////$t_result:=JSON Stringify($es_K.toCollection())
////Else 
////$t_result:=JSON Stringify(New object("hey"; 5; "maybe"; "not"))
////End if 



//Case of 
//: ($t_url="/rest_all")
//$es_D:=ds.Benutzerdaten.all()
//$t_result:=JSON Stringify($es_D.toCollection())
//: ($t_url="/rest_getD")
//$es_D:=ds.Benutzerdaten.query("Benutzer = :1"; "D@")
//$t_result:=JSON Stringify($es_D.toCollection())
//: ($t_url="/rest_getK")
//$es_D:=ds.Benutzerdaten.query("Benutzer = :1"; "Ka@")
//$es_t:=ds.Lehrer.query("Vorname = :1"; "K@")
//$t_result:=JSON Stringify($es_D.toCollection())+JSON Stringify($es_t.toCollection())
////$t_result:=JSON Stringify($es_test.toCollection())
//End case 



//TEXT TO BLOB($t_result; $x_result; UTF8 text without length)
//WEB SEND BLOB($x_result; "application/json")





//////////////-------------OnStartUp Methode--------//////////////////

//$WindowsID:=Open form window("LoginMask")
//DIALOG("LoginMask")
//CLOSE WINDOW($WindowsID)




//////-------------------Match Regex-----FAIL!!!!-------//////////////////////

//var $beispieltext : Text
//var $vfound : Boolean



//$beispieltext:="iiHhhiii"



//$vfound:=Match regex("[A-Z]"; $beispieltext; 1; *)



//If ($vfound)
//ALERT("match")
//Else 
//ALERT("no match")
//End if 


//////////----------------------------Methode Password Check--- Character Code-----Passwort Anforderungen abfragen ----------------////////////////

//C_TEXT($1)


//C_TEXT($t_New_Password)
//C_LONGINT($i; $l_Length; $l_End)
//C_BOOLEAN($b_OK; $b_End; $0)

//$t_New_Password:=$1
//$b_OK:=False
//$l_Length:=Length($t_New_Password)


//For ($i; 1; $l_Length)
//If ((Character code($t_New_Password[[$i]])>64) & (Character code($t_New_Password[[$i]])<91))  //---grossbuchstaben
//$b_OK:=True
//$i:=$l_Length+1
//End if 
//End for 


//If ($b_OK)
//$b_OK:=False
//For ($i; 1; $l_Length)
//If ((Character code($t_New_Password[[$i]])>96) & (Character code($t_New_Password[[$i]])<123))  //---kleinbuchstaben
//$b_OK:=True
//$i:=$l_Length+1
//End if 
//End for 
//End if 

//$l_End:=$l_Length+2
//If ($i=$l_End)
//$b_End:=True
//Else 
//$b_End:=False
//End if 

//$0:=$b_End


////If ($b_OK)
////$b_OK:=False
////For ($i; 1; $l_Length)
////If ((Character code($t_New_Password[[$i]])>47) & (Character code($t_New_Password[[$i]])<58))  //---ziffer
////$b_OK:=True
////$i:=$l_Length+1
////End if 
////End for 
////End if 

////If ($b_OK)
////$b_OK:=False
////For ($i; 1; $l_Length)
////If ((Character code($t_New_Password[[$i]])>31) & (Character code($t_New_Password[[$i]])<48))  //---sonderzeichen 1
////$b_OK:=True
////$i:=$l_Length+1
////End if 
////End for 
////End if 
////If (Not($b_OK))
////For ($i; 1; $l_Length)
////If ((Character code($t_New_Password[[$i]])>57) & (Character code($t_New_Password[[$i]])<65))  //---sonderzeichen 2
////$b_OK:=True
////$i:=$l_Length+1
////End if 
////End for 
////End if 

////If (Not($b_OK))
////For ($i; 1; $l_Length)
////If ((Character code($t_New_Password[[$i]])>90) & (Character code($t_New_Password[[$i]])<97))  //---sonderzeichen 3
////$b_OK:=True
////$i:=$l_Length+1
////End if 
////End for 
////End if 
//If (Not($b_OK))
//For ($i; 1; $l_Length)
//If ((Character code($t_New_Password[[$i]])>122) & (Character code($t_New_Password[[$i]])<126))  //---sonderzeichen 4
//$b_OK:=True
//$i:=$l_Length+1
//End if 
//End for 
//End if 

////$0:=$b_OK

//var $beispieltext : Text
//var $vfound : Boolean

//$beispieltext:="Hhhiii"

//$vfound:=Match regex("[A-Z][a-z]"; $beispieltext; 1; *)

//If ($vfound)
//ALERT("match")
//Else 
//ALERT("no match")
//End if 
