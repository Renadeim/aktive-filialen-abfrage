#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
; #AutoIt3Wrapper_Icon=H:\Uebertragung_Skripte_Automatisierung\ICONS\Graphicloads-Flat-Finance-Global.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <file.au3>
#include <array.au3>
#include <MsgBoxConstants.au3>

$AktiveFilialen = FileOpen(@ScriptDir & "\AktiveFilialen.txt", 2 + 8)

Global $db

_unicenter_sql_open()
$Filialen = _sql("select last_name from dbo.Haupttabelle where inactive = '0' and last_name < '9999'  order by last_name ASC")
_ArrayDisplay($Filialen)
_FileWriteFromArray($AktiveFilialen, $Filialen)

MsgBox($MB_SYSTEMMODAL, "Aktive Filialen", "Prüfung abgeschlossen!", 0)

Func _unicenter_sql_open()
	Global $db = ObjCreate("ADODB.Connection")
	With $db
		.Provider = "SQLOLEDB.1"
		.Properties("Persist Security Info").Value = False
		.Properties("Initial Catalog").Value = "mdb"
		.Properties("Data Source").Value = "SQLDN1\PSQL01_1"
    .Properties("User Id").Value = "<BENUTZERNAME_EINFÜGEN>"
    .Properties("Password").Value = "<PASSWORT_EINFÜGEN>"
		.Open
	EndWith
EndFunc   ;==>_unicenter_sql_open


Func _sql($Query)
	If StringLeft($Query, 3) = "SEL" Then
		$rs = $db.execute($Query)
		If Not $rs.EOF Then
			$query_ergebnis = $rs.getrows
		Else
			Dim $query_ergebnis[1][1]
			$query_ergebnis[0][0] = ""
		EndIf
		Return $query_ergebnis
	Else
		$query_ergebnis = $db.execute($Query)
		If @error Then
			Return -2
		Else
			Return 0
		EndIf
	EndIf
EndFunc   ;==>_sql

Func _unicenter_sql_close()
	$db.close
EndFunc   ;==>_unicenter_sql_close
