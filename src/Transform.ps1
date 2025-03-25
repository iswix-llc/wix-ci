$ErrorActionPreference = "Stop"

# Update Solution
(Get-Content .\wix\wix.sln) -replace "WiXToolset.Sdk", "IsWiXToolSet.Sdk" | Set-Content .\wix\wix.sln

#Rebrand SDK
Rename-Item -Path .\wix\WixToolset.Sdk -NewName IsWiXToolset.Sdk
Rename-Item -Path .\wix\IsWixToolset.Sdk\WixToolset.Sdk.csproj -NewName IsWixToolset.Sdk.csproj
Rename-Item -Path .\wix\IsWixToolset.Sdk\WixToolset.Sdk.nuspec -NewName IsWixToolset.Sdk.nuspec


#Update All Nuspec Files
Get-ChildItem -recurse -Include *.nuspec |
Foreach-Object {
    $content = Get-Content $_.FullName

(Get-Content $_.FullName) -replace 'type="file"', 'type="expression"' | Set-Content $_.FullName
(Get-Content $_.FullName) -replace 'OSMFEULA.txt', 'MS-RL' | Set-Content $_.FullName
}

