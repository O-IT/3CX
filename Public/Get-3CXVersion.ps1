<#
    .SYNOPSIS
        Get 3CX System Version
    .DESCRIPTION
        Retrieve the 3CX System Version 
    .EXAMPLE
        PS> Get-3CXVersion
    .OUTPUTS
        powershell object containing the 3CX response
#>
function Get-3CXVersion {
    [CmdletBinding()]
    param()
    return [version](Get-3CXResult -Endpoint '/xapi/v1/Defs/Pbx.GetSystemParameters()').Version
}