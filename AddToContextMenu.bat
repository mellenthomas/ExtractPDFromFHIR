@echo off
setlocal
set "HANDLER=%~dp0ExtractPDFromFHIR.bat"
set "VERB=HKCU\Software\Classes\SystemFileAssociations\.json\shell\ProcessJSON"

reg add "%VERB%" /ve /d "FHIR extract PDF" /f
reg add "%VERB%" /v "Icon" /d "powershell.exe" /f
reg add "%VERB%\command" /ve /d "\"%HANDLER%\" \"%%1\"" /f

echo Context menu installed. Right-click any .json file.
pause
