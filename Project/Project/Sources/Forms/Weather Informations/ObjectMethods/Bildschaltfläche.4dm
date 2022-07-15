C_TEXT:C284($response; $url; $test; $APIKey; $temperaturLangenthal; $temperatur_langenthal)
C_TEXT:C284(sonnenuntergang_langenthal; sonnenaufgang_langenthal; wetterstatus; temperatur_basel; sonnenaufgang_basel; sonnenuntergang_basel)
C_TEXT:C284(temperatur_newyork; sonnenaufgang_newyork; sonnenuntergang_newyork)
C_BLOB:C604($httpResponse)
C_OBJECT:C1216($jsonobject)
ARRAY TEXT:C222($headerName; 0)
ARRAY TEXT:C222($headerValue; 0)
C_LONGINT:C283($reponseStatus)


$url:="https://api.weatherbit.io/v2.0/current?&city=Langenthal&country=ch&key=e26b636602774031b831397f2e60a568&include=minutely"
$reponseStatus:=HTTP Get:C1157($url; $jsonobject; $headerName; $headerValue)
temperatur_langenthal:=String:C10($jsonobject.data[0].temp)
sonnenaufgang_langenthal:=String:C10($jsonobject.data[0].sunrise)
sonnenuntergang_langenthal:=String:C10($jsonobject.data[0].sunset)
wetterstatus:=String:C10($jsonobject.data[0].weather.code)


$url:="https://api.weatherbit.io/v2.0/current?&city=Basel&country=ch&key=e26b636602774031b831397f2e60a568"
$reponseStatus:=HTTP Get:C1157($url; $jsonobject; $headerName; $headerValue)
temperatur_basel:=String:C10($jsonobject.data[0].temp)
sonnenaufgang_basel:=String:C10($jsonobject.data[0].sunrise)
sonnenuntergang_basel:=String:C10($jsonobject.data[0].sunset)

$url:="https://api.weatherbit.io/v2.0/current?&city=New+York&country=US&key=e26b636602774031b831397f2e60a568"
$reponseStatus:=HTTP Get:C1157($url; $jsonobject; $headerName; $headerValue)
temperatur_newyork:=String:C10($jsonobject.data[0].temp)
sonnenaufgang_newyork:=String:C10($jsonobject.data[0].sunrise)
sonnenuntergang_newyork:=String:C10($jsonobject.data[0].sunset)




