#Requires -Version 7.0

Write-Verbose "Discovering functions"
$Functions = @(Get-ChildItem -Path $PSScriptRoot\public\ -Include *.ps1 -Recurse) 
if(Test-Path -Path $PSScriptRoot\private\){
    $PrivateFunctions = @(Get-ChildItem -Path $PSScriptRoot\private\ -Include *.ps1 -Recurse)
    $Functions = $Functions + $PrivateFunctions
}


foreach ($Function in @($Functions)) {
    try {
        Write-Verbose "Importing function $($Function.FullName)"
        . $Function.FullName
    } catch {
        Write-Error -Message "Failed to import function $($Function.FullName): $_"
    }
}

$script:3CXSession = $null