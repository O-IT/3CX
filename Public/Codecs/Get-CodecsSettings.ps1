<#
    .SYNOPSIS
        Get 3CX Codecs Settings
    .DESCRIPTION
        Retrieve the CodecsSettings
    .EXAMPLE
        PS> Get-CodecsSettings
    .OUTPUTS
        powershell object containing the 3CX response
#>
function Get-CodecsSettings {

    [CmdletBinding()]
    param()
    return Get-3CXResult -Endpoint '/xapi/v1/CodecsSettings'
}
