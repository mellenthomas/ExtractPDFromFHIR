param(
    [Parameter(Position = 0)]
    [string]$JsonPath
)

$folder = Split-Path $JsonPath
if (-not $folder) { $folder = $PWD.Path }

$data = Get-Content -Path $JsonPath -Raw | ConvertFrom-Json
$filename = $data.identifier.value + '.pdf'
$folder
$filename

$attachment = $data.entry.Resource |
    Where-Object { $_.ResourceType -eq 'DiagnosticReport' } |
    ForEach-Object { $_.presentedForm } |
    Select-Object -First 1

$bytes = [Convert]::FromBase64String($attachment.data)
[System.IO.File]::WriteAllBytes($folder +"\" + $filename, $bytes)