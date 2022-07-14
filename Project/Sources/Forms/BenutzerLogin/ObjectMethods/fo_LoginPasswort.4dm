Case of 
	: (Form event code:C388=On Load:K2:1)
		
		OBJECT SET FONT:C164(*; "fo_LoginPasswort"; "%Password")
		
	: (Form event code:C388=On Data Change:K2:15)
		Case of 
			: (Form:C1466.LoginPasswort="")
				ALERT:C41("Das Passwort fehlt!")
		End case 
		
End case 