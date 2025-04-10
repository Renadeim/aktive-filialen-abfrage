# Project: Abfrage_Aktive_Filialen.au3

This script automates the retrieval of all active store branches from an SQL database and stores the results in a local text file. It was originally developed to simplify internal processes and serves as one of the core components for data-driven store evaluations.

## 📊 Purpose & Function
- ✅ Establishes a connection to the internal SQL database
- ✅ Retrieves all active store branches
- ✅ Displays and stores the result in a clear format

## 🔧 Technologies
- **Language:** AutoIt
- **Used Modules:** `File.au3`, `Array.au3`, `MsgBoxConstants.au3`
- **Connection:** ADODB (SQL database)

## 🔹 Usage
1. Ensure that AutoIt is installed
2. Adjust the SQL command or file path if necessary
3. Run the script via double-click or from the SciTE editor

### Code Example (excerpt from the script)
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
MsgBox($MB_SYSTEMMODAL, "Aktive Filialen", "Check completed!", 0)
```

## 📂 Files
- `Abfrage_Aktive_Filialen.au3` – Main script
- `AktiveFilialen.txt` – Output file (created automatically)

## 📅 Last Updated
*April 10, 2025*

## 👥 Author & License
**Author:** [@Renadeim](https://github.com/Renadeim)  
**License:** MIT License

---

> ⚡ This script is part of my collection of productive AutoIt automations for IT & support environments.

