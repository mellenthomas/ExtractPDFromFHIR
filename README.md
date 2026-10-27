# ExtractPDFromFHIR
  
PDF uit een FHIR-bericht halen.  
  
Te gebruiken met Batch file:  
  
@echo off  
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\temp\FHIR\ExtractPDFromFHIR.ps1" "%~1"


  
