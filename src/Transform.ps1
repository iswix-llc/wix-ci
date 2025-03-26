$ErrorActionPreference = "Stop"

# Update Solution
$files = Get-ChildItem -Path . -File -Recurse -Exclude *.ps1 | Select-String "WixToolset.Sdk" -List | Select Path
foreach( $file in $files)
{
  Write-Host $file.Path
  (Get-Content $file.Path) -replace 'WixToolset.Sdk', 'IsWixToolset.Sdk' | Set-Content $file.Path
}

Rename-Item -Path .\wix\WixToolset.Sdk -NewName IsWiXToolset.Sdk
Rename-Item -Path .\wix\IsWixToolset.Sdk\WixToolset.Sdk.csproj -NewName IsWixToolset.Sdk.csproj
Rename-Item -Path .\wix\IsWixToolset.Sdk\WixToolset.Sdk.nuspec -NewName IsWixToolset.Sdk.nuspec
Rename-Item -Path .\wix\IsWixToolset.Sdk\build\WixToolset.Sdk.targets -NewName IsWixToolset.Sdk.targets


$files = Get-ChildItem -Path . -File -Recurse -Exclude *.ps1 -Include *.nuspec | Select-String "OSMFEULA.txt" -List | Select Path
foreach( $file in $files)
{
  Write-Host $file.Path
 (Get-Content $file.Path) -replace 'type="file"', 'type="expression"' | Set-Content $file.Path
 (Get-Content $file.Path) -replace 'OSMFEULA.txt', 'MS-RL' | Set-Content $file.Path
}