# Projekt: Abfrage_Aktive_Filialen.au3

Dieses Skript automatisiert die Abfrage aller aktiven Filialen aus einer SQL-Datenbank und speichert das Ergebnis in einer lokalen Textdatei. Es wurde ursprünglich zur Vereinfachung interner Prozesse entwickelt und stellt eine der Kernkomponenten für datenbasierte Filialauswertungen dar.

## 📊 Zweck & Funktion
- ✅ Verbindung zur internen SQL-Datenbank herstellen
- ✅ Abfrage aller aktiven Filialen
- ✅ Ergebnis übersichtlich anzeigen & speichern

## 🔧 Technologien
- **Sprache:** AutoIt
- **Verwendete Module:** `File.au3`, `Array.au3`, `MsgBoxConstants.au3`
- **Verbindung:** ADODB (SQL-Datenbank)

## 🔹 Verwendung
1. Stelle sicher, dass AutoIt installiert ist
2. Passe ggf. den SQL-Befehl oder den Dateipfad an
3. Starte das Skript per Doppelklick oder aus dem SciTE-Editor

### Beispielcode (Auszug aus dem Skript)
```autoit
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
```

## 📂 Dateien
- `Abfrage_Aktive_Filialen.au3` – Hauptskript
- `AktiveFilialen.txt` – Ergebnisdatei (wird automatisch erzeugt)

## 📅 Letzte Änderung
*10. April 2025*

## 👥 Autor & Lizenz
**Autor:** [@Renadeim](https://github.com/Renadeim)  
**Lizenz:** MIT License

---

> ⚡ Dieses Skript ist Teil meiner Sammlung produktiver AutoIt-Automatisierungen für IT & Support.

