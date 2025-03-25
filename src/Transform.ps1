$ErrorActionPreference = "Stop"
Rename-Item -Path .\wix\WixToolset.Sdk -NewName IsWiXToolset.Sdk
Rename-Item -Path .\wix\IsWixToolset.Sdk\WixToolset.Sdk.csproj -NewName IsWixToolset.Sdk.csproj
(Get-Content .\wix\wix.sln) -replace "WiXToolset.Sdk", "IsWiXToolSet.Sdk" | Set-Content .\wix\wix.sln
