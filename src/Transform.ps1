$ErrorActionPreference = "Stop"
Rename-Item -Path .\wix\WixToolset.Sdk -NewName IsWiXToolset.Sdk
Rename-Item -Path .\wix\IsWixToolset.Sdk\WixToolset.Sdk.csproj -NewName IsWixToolset.Sdk.csproj
Rename-Item -Path .\wix\IsWixToolset.Sdk\WixToolset.Sdk.nuspec -NewName IsWixToolset.Sdk.nuspec

# Update Solution
(Get-Content .\wix\wix.sln) -replace "WiXToolset.Sdk", "IsWiXToolSet.Sdk" | Set-Content .\wix\wix.sln

#Rebrand SDK
(Get-Content .\wix\IsWixToolset.Sdk\IsWixToolset.Sdk.nuspec) -replace 'type="file"', 'type="expression' | Set-Content .\wix\IsWixToolset.Sdk\IsWixToolset.Sdk.nuspec
(Get-Content .\wix\IsWixToolset.Sdk\IsWixToolset.Sdk.nuspec) -replace 'type="OSMFEULA.txt"', 'MS-RL' | Set-Content .\wix\IsWixToolset.Sdk\IsWixToolset.Sdk.nuspec


